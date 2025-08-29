#!/bin/bash
#Day 2 of 100 days of devops
#Author: arceuzvx

LOGFILE="process_mgmt.log"

# Function to log actions with timestamps
log_action() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOGFILE"
}

# Function to display top 10 processes
show_top_processes() {
    echo "==== Top 10 processes by CPU ===="
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 11 | tee -a "$LOGFILE"
    echo ""
    echo "==== Top 10 processes by Memory ===="
    ps -eo pid,comm,%mem --sort=-%mem | head -n 11 | tee -a "$LOGFILE"
    log_action "Displayed top 10 processes"
}

# Function to kill a process
kill_process() {
    read -p "Enter the PID of the process you want to kill: " pid
    if [ -z "$pid" ]; then
        echo "No PID entered!"
        return
    fi
    
    # Safety check
    if [ "$pid" -eq 1 ]; then
        echo "Refusing to kill PID 1 (system critical)."
        return
    fi
    
    read -p "Are you sure you want to kill PID $pid? (y/n): " confirm
    if [[ "$confirm" == "y" ]]; then
        kill -9 "$pid" 2>/dev/null
        if [ $? -eq 0 ]; then
            echo "Process $pid killed successfully."
            log_action "Process $pid killed successfully"
        else
            echo "Failed to kill process $pid. Check permissions."
            log_action "Failed to kill process $pid"
        fi
    else
        echo "Aborted."
        log_action "Aborted killing PID $pid"
    fi
}

# Menu loop
while true; do
    echo ""
    echo "==== Process Management Menu ===="
    echo "1. Show top 10 processes"
    echo "2. Kill a process"
    echo "3. Exit"
    read -p "Choose an option [1-3]: " choice
    
    case $choice in
        1) show_top_processes ;;
        2) kill_process ;;
        3) echo "Exiting..."; log_action "Exited script"; exit 0 ;;
        *) echo "Invalid choice" ;;
    esac