#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Shamim | Course: Open Source Software

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/boot" "/proc" "/sys")

echo "=============================================="
echo " Directory Audit Report"
echo " System: $(uname -r)"
echo " Date : $(date '+%d %B %Y %H:%M')"
echo "=============================================="
echo ""

for DIR in "${DIRS[@]}"; do
if [ -d "$DIR" ]; then
PERMS=$(ls -ld "$DIR" | awk '{print $1}')
OWNER=$(ls -ld "$DIR" | awk '{print $3}')
GROUP=$(ls -ld "$DIR" | awk '{print $4}')
SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

echo " Directory : $DIR"
echo " Perms : $PERMS | Owner: $OWNER | Group: $GROUP"
echo " Size : $SIZE"
echo " --------------------------------------------"
else
echo " [SKIP] $DIR does not exist on this system."
echo " --------------------------------------------"
fi
done

echo ""
echo " === Linux Kernel Specific Directories ==="
echo ""

KERNEL_DIRS=("/proc" "/sys" "/lib/modules/$(uname -r)")

for KDIR in "${KERNEL_DIRS[@]}"; do
if [ -d "$KDIR" ]; then
PERMS=$(ls -ld "$KDIR" | awk '{print $1}')
OWNER=$(ls -ld "$KDIR" | awk '{print $3}')
echo " [KERNEL DIR] $KDIR"
echo " Perms: $PERMS | Owner: $OWNER"
echo " Purpose: $(case $KDIR in
/proc) echo 'Live kernel & process info (virtual, no disk space used)' ;;
/sys) echo 'Hardware & driver info exposed by kernel (virtual)' ;;
*) echo 'Kernel modules (drivers) for current kernel version' ;;
esac)"
echo " --------------------------------------------"
fi
done
