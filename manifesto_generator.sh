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
