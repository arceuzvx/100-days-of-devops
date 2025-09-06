# DevOps 100 Days 🚀

Tracking my 100 days of DevOps learning & projects.  
Each day I’ll push scripts, configs, and mini-projects as I grow my DevOps + Security skillset.  

## 📅 Day 1
- **System Information Script** (`system_info.sh`)
- Displays OS, kernel, uptime, CPU, memory, disk usage, and IP details.  
- First step in Linux automation & scripting.  

Run with:
```bash
chmod +x system_info.sh
sudo ./system_info.sh
```
## 📅 Day 2
### 1️⃣ process_mgmt.sh
**Features:**
- Display top 10 processes by **CPU** and **Memory** usage.
- Kill a process by PID (with confirmation).
- Prevent killing critical processes like PID 1.
- Logs all actions to `process_mgmt.log`.
- Simple **menu-driven interface**.

**Run:**
```bash
chmod +x process_mgmt.sh
sudo ./process_mgmt.sh
```

### 2️⃣ user_mgmt.sh
**Features:**
- Create a user with:
- Home directory (-m).
- Group assignment (creates group if missing).
- Expiry date (-e).
- Delete a user (and automatically delete their group if empty).
- Logs all actions to `user_mgmt.log`.
- Menu-driven interface.

**Run:**
```bash
chmod +x user_mgmt.sh
sudo ./user_mgmt.sh
```
## 📅 Day 3
- **System Monitor Script** (`system_monitor.sh`)
- Checks Key Resources like: CPU usage, Memory usage, Disk usage, Uptime  

Run with:
```bash
chmod +x system_monitor.sh
sudo ./system_monitor.sh
```

## 📅 Day 4
- practiced **file perms & ACLs**

## 📅 Day 5
- automated log cleanups (`log_cleanup.sh`)

Run with:
```bash
chmod +x log_cleanup.sh
./log_cleanup.sh
```

## 📅 Day 6
- learnt how to export logs (`log_export.sh`)

Run with:
```bash
chmod +x log_export.sh
./log_export.sh
```
## 📅 Day 7

- learnt about systemd timers for modern task scheduling

## 📅 Day 8

- learnt Linux Networking basics

## 📅 Day 9 

- learnt Linux Firewall Basics with UFW

## 📅 Day 10

- learnt log rotation

# 📅 Day 11
- wrote a script to update & upgrade outdated packages and prints it in logs
```bash
chmod +x pkg_update.sh
./pkg_update.sh
```