#!/bin/bash
# Filename: package_health_report.sh
# Description: Checks package health, outdated/held-back packages, and runs security audits
# Requirements: sudo, debsecan, lynis
# Day 12 of 100 days of devops
# Author: arceuzvx

REPORT_DIR="$HOME/package_health_report"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
REPORT_FILE="$REPORT_DIR/package_health_report_$TIMESTAMP.txt"

mkdir -p "$REPORT_DIR"

echo "======================================" > "$REPORT_FILE"
echo " PACKAGE HEALTH & SECURITY REPORT" >> "$REPORT_FILE"
echo " Generated on: $(date)" >> "$REPORT_FILE"
echo "======================================" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# 1. List outdated packages
echo "=== Outdated Packages ===" >> "$REPORT_FILE"
if command -v apt &>/dev/null; then
    sudo apt update &>/dev/null
    apt list --upgradable >> "$REPORT_FILE" 2>/dev/null
else
    echo "apt not found. Cannot check outdated packages." >> "$REPORT_FILE"
fi
echo "" >> "$REPORT_FILE"

# 2. List held-back packages
echo "=== Held-back Packages ===" >> "$REPORT_FILE"
HELD_BACK=$(apt-mark showhold)
if [ -n "$HELD_BACK" ]; then
    echo "$HELD_BACK" >> "$REPORT_FILE"
else
    echo "No held-back packages." >> "$REPORT_FILE"
fi
echo "" >> "$REPORT_FILE"

# 3. Security scan with debsecan
if command -v debsecan &>/dev/null; then
    echo "=== debsecan Security Scan ===" >> "$REPORT_FILE"
    debsecan --suite stable --format detail >> "$REPORT_FILE"
else
    echo "debsecan not installed. Skipping debsecan scan." >> "$REPORT_FILE"
fi
echo "" >> "$REPORT_FILE"

# 4. Lynis audit
if command -v lynis &>/dev/null; then
    echo "=== Lynis Security Audit ===" >> "$REPORT_FILE"
    sudo lynis audit system >> "$REPORT_FILE"
else
    echo "lynis not installed. Skipping lynis audit." >> "$REPORT_FILE"
fi

echo ""
echo "Report generated at: $REPORT_FILE"