# Day 8 of 100 Days of DevOps 🚀

## 📌 Topic: Linux Networking Basics

Today I explored the **fundamentals of Linux networking** — essential for troubleshooting, automation, and DevOps workflows.

---

## 🔹 What I Learned
- Checking network interfaces and IPs → `ip a`
- Viewing routing table → `ip r`
- Testing connectivity → `ping <host>`
- Tracing packet path → `traceroute <host>`
- Checking open ports and listening services → `ss -tulnp` (modern replacement for `netstat`)

---

## 🔹 Task
I wrote a script `net_diag.sh` that:
- Displays system IP address and default gateway
- Lists open ports and associated processes
- Pings a known host (`8.8.8.8`) to verify connectivity
- Saves all results into a report file: `network_report.txt`
