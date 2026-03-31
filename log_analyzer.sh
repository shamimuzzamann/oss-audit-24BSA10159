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
