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
