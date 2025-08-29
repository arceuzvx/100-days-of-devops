#!/bin/bash
#Day 3 of 100 days of devops
#Author: arceuzvx

LOG_FILE="system_monitor.log"
THRESHOLD_CPU=70
THRESHOLD_MEM=80
THRESHOLD_DISK=80

# Function to show system stats
show_stats() {
    echo "📊 System Stats"
    echo "----------------"
    echo "Uptime: $(uptime -p)"
    echo "CPU Load: $(uptime | awk -F'load average:' '{ print $2 }')"
    echo "Memory Usage:"
    free -m | awk 'NR==2{printf "Used: %sMB / Total: %sMB (%.2f%%)\n", $3, $2, $3*100/$2 }'
    echo "Disk Usage:"
    df -h / | awk 'NR==2{printf "Used: %s / Total: %s (%s)\n", $3,$2,$5}'
    echo "----------------"
}

# Function to run health check with thresholds
health_check() {
    echo "🚨 Health Check Running..."
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
    MEM_USAGE=$(free | awk '/Mem/{printf("%.0f"), $3/$2 * 100.0}')
    DISK_USAGE=$(df / | awk 'END{print $5}' | sed 's/%//')

    ALERTS=""

    if (( ${CPU_USAGE%.*} > THRESHOLD_CPU )); then
        ALERTS+="CPU usage high: ${CPU_USAGE}% | "
    fi
    if (( MEM_USAGE > THRESHOLD_MEM )); then
        ALERTS+="Memory usage high: ${MEM_USAGE}% | "
    fi
    if (( DISK_USAGE > THRESHOLD_DISK )); then
        ALERTS+="Disk usage high: ${DISK_USAGE}% | "
    fi

    if [ -n "$ALERTS" ]; then
        echo "$(date) - ALERT: $ALERTS" | tee -a $LOG_FILE
    else
        echo "$(date) - System healthy ✅" | tee -a $LOG_FILE
    fi
}

# Optional Menu
menu() {
    while true; do
        echo "========= System Monitor ========="
        echo "1. Show System Stats"
        echo "2. Run Health Check"
        echo "3. Exit"
        read -p "Choose an option: " choice

        case $choice in
            1) show_stats ;;
            2) health_check ;;
            3) exit 0 ;;
            *) echo "Invalid option" ;;
        esac
    done
}

menu
