# Day 7 - Automating Backups with systemd Timers

## 📌 What I Learned
- Difference between `cron` and `systemd timers`
- How to create a `.service` and `.timer` unit
- Scheduling tasks in a modern way using `systemd`

## ⚙️ Task
Created a **backup service** that copies files from `~/practice/day7/source/` to `~/practice/day7/backup/` every minute using `systemd timers`.

## 📂 Files
- `backup_service.sh` → Script to perform backup
- `backup.service` → Defines the systemd service
- `backup.timer` → Defines the schedule
- `README.md` → Documentation

## 🚀 Steps to Run
```bash
# Copy unit files
sudo cp backup.service /etc/systemd/system/
sudo cp backup.timer /etc/systemd/system/

# Reload systemd
sudo systemctl daemon-reload

# Start and enable the timer
sudo systemctl start backup.timer
sudo systemctl enable backup.timer

# Check status
systemctl list-timers --all