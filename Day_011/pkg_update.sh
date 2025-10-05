#!/bin/bash
# Update and upgrade packages automatically
# Save output to a log file
#day 11 of 100 days of devops
#Author: arceuzvx

LOGFILE="/home/kali/practice/day11/package_update.log"

echo "=== Package Update Started: $(date) ===" >> $LOGFILE

# Update package index
sudo apt update >> $LOGFILE 2>&1

# Upgrade outdated packages (non-interactive)
sudo apt upgrade -y >> $LOGFILE 2>&1

# Optional: remove unnecessary packages
sudo apt autoremove -y >> $LOGFILE 2>&1

echo "=== Package Update Completed: $(date) ===" >> $LOGFILE