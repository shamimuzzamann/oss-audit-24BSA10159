#!/bin/bash

# Master Setup Script
# Creates 5 scripts for Shamim (Open Source Software Course)

echo "Generating 5 audit scripts..."

# 1. System Identity Report
cat << 'INNER_EOF' > system_identity.sh
#!/bin/bash
# Script 1: System Identity Report
# Author: Shamim | Course: Open Source Software

STUDENT_NAME="Shamim" 
SOFTWARE_CHOICE="Linux Kernel" 
LICENSE="GNU General Public License v2 (GPL v2)" 

KERNEL=$(uname -r) 
DISTRO=$(lsb_release -d 2>/dev/null | cut -f2 || cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')
USER_NAME="Shamim"
HOME_DIR=$HOME 
UPTIME=$(uptime -p) 
CURRENT_DATE=$(date '+%A, %d %B %Y %H:%M') 
ARCH=$(uname -m) 

echo "=============================================="
echo " Open Source Audit — $STUDENT_NAME"
echo " Software Under Audit: $SOFTWARE_CHOICE"
echo "=============================================="
echo ""
echo " Distribution : $DISTRO"
echo " Kernel Ver : $KERNEL"
echo " Architecture : $ARCH"
echo " User : $USER_NAME"
echo " Home Dir : $HOME_DIR"
echo " Uptime : $UPTIME"
echo " Date & Time : $CURRENT_DATE"
echo ""
echo "----------------------------------------------"
echo " OS License : $LICENSE"
echo ""
echo " The Linux Kernel is covered by GPL v2."
echo " This means anyone can view, modify, and"
echo " redistribute the source code — as long as"
echo " they share their changes under the same"
echo " license. Freedom is protected by law."
echo "----------------------------------------------"
INNER_EOF

# 2. FOSS Package Inspector
cat << 'INNER_EOF' > package_inspector.sh
#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Shamim | Course: Open Source Software

PACKAGE="linux-image-$(uname -r)" 

echo "=============================================="
echo " FOSS Package Inspector"
echo "=============================================="
echo ""

if dpkg -l "$PACKAGE" &>/dev/null; then
echo " [FOUND] Package: $PACKAGE is installed."
echo ""
dpkg -l "$PACKAGE" | grep -E "^ii" | awk '{print " Version : "$3"\n Arch : "$4}'
else
echo " [INFO] Exact package $PACKAGE not found via dpkg."
echo " Showing general kernel info instead:"
echo ""
echo " Kernel Version : $(uname -r)"
echo " Kernel Release : $(uname -v)"
fi

echo ""
echo "----------------------------------------------"
echo " License & Source Info:"
echo "----------------------------------------------"

SOFTWARE="linux-kernel" 

case $SOFTWARE in
linux-kernel)
echo " Linux Kernel: The open-source OS core that"
echo " powers 96% of the world's top servers,"
echo " Android phones, and every major cloud platform."
echo " Built by a student in 1991 — shared with the world."
;;
*)
echo " Unknown package."
;;
esac

echo ""
echo " GPL v2 License: Source code must always remain free."
echo "=============================================="
INNER_EOF

# 3. Disk and Permission Auditor
cat << 'INNER_EOF' > disk_auditor.sh
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
INNER_EOF

# 4. Log File Analyzer
cat << 'INNER_EOF' > log_analyzer.sh
#!/bin/bash
# Script 4: Log File Analyzer
# Author: Shamim | Course: Open Source Software

LOGFILE=$1
KEYWORD=${2:-"error"}
COUNT=0

echo "=============================================="
echo " Log File Analyzer"
echo " Kernel: $(uname -r)"
echo "=============================================="
echo ""

if [ -z "$LOGFILE" ]; then
echo " [USAGE] ./log_analyzer.sh <logfile> [keyword]"
exit 1
fi

if [ ! -f "$LOGFILE" ]; then
echo " [ERROR] File not found: $LOGFILE"
exit 1
fi

while IFS= read -r LINE; do
if echo "$LINE" | grep -iq "$KEYWORD"; then
COUNT=$((COUNT + 1))
fi
done < "$LOGFILE"

echo "----------------------------------------------"
echo " RESULT: '$KEYWORD' found $COUNT time(s)"
echo "----------------------------------------------"
grep -i "$KEYWORD" "$LOGFILE" | tail -5
INNER_EOF

# 5. Open Source Manifesto Generator
cat << 'INNER_EOF' > manifesto_generator.sh
#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Shamim | Course: Open Source Software

DATE=$(date '+%d %B %Y') 
OUTPUT="manifesto_shamim.txt" 

echo "=============================================="
echo " Open Source Manifesto Generator"
echo "=============================================="
echo ""

read -p " 1. Name one open-source tool you use every day: " TOOL
read -p " 2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p " 3. Name one thing you would build and share freely: " BUILD

echo "==============================================" > "$OUTPUT"
echo " MY OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo " By: $(whoami) | Date: $DATE" >> "$OUTPUT"
echo "==============================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo " Every day, I rely on $TOOL." >> "$OUTPUT"
echo " To me, freedom means $FREEDOM." >> "$OUTPUT"
echo " I want to build $BUILD and release it freely." >> "$OUTPUT"

echo ""
echo " Manifesto saved to: $OUTPUT"
cat "$OUTPUT"
INNER_EOF

chmod +x system_identity.sh package_inspector.sh disk_auditor.sh log_analyzer.sh manifesto_generator.sh
echo "Done! 5 scripts are ready for Shamim."
