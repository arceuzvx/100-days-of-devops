#!/bin/bash
# generate_logs.sh - create dummy logs for testing log rotation

LOG_DIR="/home/kali/practice/day10/logs"
mkdir -p $LOG_DIR

for i in {1..5}; do
    echo "[$(date)] Test log line $i" >> $LOG_DIR/app.log
done

echo "Generated sample logs in $LOG_DIR/app.log"
