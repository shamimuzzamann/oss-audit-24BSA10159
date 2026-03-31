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
