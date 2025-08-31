#!/bin/bash
#Day 5 of 100 days of devops
#Author: arceuzvx

LOG_DIR="/home/kali/practice/day5/test_logs"

echo "🔹 Using log directory: $LOG_DIR"

# Step 1: Create sample log files if they don't exist
echo "🔹 Creating sample log files..."
mkdir -p "$LOG_DIR"

# Create logs with different timestamps
touch -t 202508010101 "$LOG_DIR/old_error.log"      # very old log
touch -t 202508250101 "$LOG_DIR/recent_access.log"  # recent log
echo "Sample error log content" > "$LOG_DIR/error.log"
echo "Sample access log content" > "$LOG_DIR/access.log"

# Step 2: Show current logs
echo "🔹 Current logs in directory:"
ls -lh "$LOG_DIR"

# Step 3: Delete logs
echo "🔹 Deleting logs older than 7 days..."
find "$LOG_DIR" -type f -mtime +7 -exec rm -v {} \;

echo "🔹 Deleting all *.log files (regardless of age)..."
find "$LOG_DIR" -type f -name "*.log" -exec rm -v {} \;

# Step 4: Confirm remaining files
echo "🔹 Remaining logs after cleanup:"
ls -lh "$LOG_DIR"
echo "🔹 Log cleanup completed."