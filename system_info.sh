#!/bin/bash
#Day 1 of 100 days of devops
#Author: arceuzvx

echo "============================="
echo "    System Information"
echo "============================="

# OS and Kernel
echo "OS: $(uname -s)"
echo "Kernel Version: $(uname -r)"
echo "Architecture: $(uname -m)"

# Host info
echo "Hostname: $(hostname)"
echo "Uptime: $(uptime -p)"

# CPU info
echo "CPU Model: $(lscpu | grep 'Model name:' | sed 's/Model name:[ \t]*//')"
echo "CPU Cores: $(nproc)"

# Memory info
echo "Total Memory: $(free -h | awk '/Mem:/ {print $2}')"
echo "Available Memory: $(free -h | awk '/Mem:/ {print $7}')"

# Disk info
echo "Disk Usage:"
df -h --total | awk 'NR==1 || /total/'

# Network info
echo "IP Address: $(hostname -I | awk '{print $1}')"
echo "Default Gateway: $(ip route | awk '/default/ {print $3}')"

echo "==============================="
echo " Script execution completed."
echo "==============================="
