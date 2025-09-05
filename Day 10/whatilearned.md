# Day 10 of 100 Days of DevOps
**Topic:** Log Rotation with logrotate  

---

## What I Did
- Learned about why log rotation is important (so logs don’t eat up disk space).  
- Used `logrotate` to automatically rotate, compress, and manage old logs.  
- Wrote my own `logrotate.conf` for a test log file in my practice folder.  
- Added a `postrotate` command just to confirm rotations with a timestamp.  

---

## Steps I Followed
1. Created some dummy logs with a script (`generate_logs.sh`).  
2. Wrote a custom `logrotate.conf` for my logs.  
3. Tested logrotate first with debug mode (`-d`), then for real.  
4. Faced a couple of permission issues:
   - Config file was too open (`0664`), had to `chmod 644`.  
   - My directory wasn’t root-owned, so I used the `su` directive to rotate logs as my user.  

---

## Key Learnings
- `logrotate` is stricter than I expected → needs secure file and directory permissions.  
- Always test with `logrotate -d` before running for real.  
- The `su` directive helps when logs are outside `/var/log/`.  
- Rotation policies (daily, weekly, size-based) are customizable and super useful for real servers.  

---

## Conclusion
Today I set up and tested log rotation on my own logs.  
The main takeaway: logging is easy, but **managing logs properly is what keeps a system stable**.  
I also got my first taste of “fighting permissions” — which is probably the most realistic part of DevOps so far.  
