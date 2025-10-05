#!/bin/bash
#Day 6 of 100 days of devops
#Author: arceuzvx

EXPORT_DIR="/home/kali/practice/day6/exported_logs"
mkdir -p "$EXPORT_DIR"

# Export logs for SSH, Docker, System
journalctl -u ssh.service --since today > "$EXPORT_DIR/ssh_today.log"
journalctl -u docker.service --since today > "$EXPORT_DIR/docker_today.log"
journalctl --since today > "$EXPORT_DIR/system_today.log"

# Compress for archival
tar -czf "$EXPORT_DIR/logs_$(date +%F).tar.gz" "$EXPORT_DIR"/*.log

echo "[+] Logs exported to $EXPORT_DIR"