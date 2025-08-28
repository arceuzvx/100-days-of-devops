# DevOps 100 Days 🚀

Tracking my 100 days of DevOps learning & projects.  
Each day I’ll push scripts, configs, and mini-projects as I grow my DevOps + Security skillset.  

## 📅 Day 1
- **System Information Script** (`system_info.sh`)
- Displays OS, kernel, uptime, CPU, memory, disk usage, and IP details.  
- First step in Linux automation & scripting.  

Run with:
```bash
./system_info.sh
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
./process_mgmt.sh
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
