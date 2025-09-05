# Day 9 of 100 Days of DevOps
**Topic:** Linux Firewall Basics with UFW  

---

## What I Did
- Learned the basics of UFW (Uncomplicated Firewall) on Linux.  
- Enabled UFW and checked default rules.  
- Allowed only required ports like SSH (22) and HTTP (80).  
- Denied insecure ports like Telnet (23).  
- Practiced adding and removing firewall rules.  

---

## Commands I Used
```bash
sudo ufw enable
sudo ufw status verbose
sudo ufw allow ssh
sudo ufw allow 80/tcp
sudo ufw deny 23
sudo ufw delete allow 80/tcp
