# Day 4 - File Permissions & ACLs

## What I Learned Today
- Linux has a **traditional permission model** (Owner, Group, Others) with read (r), write (w), and execute (x).
- Permissions are controlled using `chmod`, ownership using `chown`, and groups with `chgrp`.
- Sometimes the standard model isn’t enough → **Access Control Lists (ACLs)** allow more fine-grained permissions.

---

## Commands I Practiced

### File Permissions
```bash
# Check permissions
ls -l
```

 Change permissions (symbolic mode)
```bash
chmod u+x secret.txt
chmod g-w secret.txt
chmod o-rwx secret.txt
```

Change permissions (numeric mode)
```bash
chmod 755 script.sh
chmod 644 secret.txt
```

### Ownership
Change file owner
```bash
sudo chown testuser secret.txt
```

Change group ownership
```bash
sudo chgrp developers secret.txt
```

Change both owner and group
```bash
sudo chown testuser:developers secret.txt
```
### Access Control Lists (ACLs)

```bash
# Check if ACLs are enabled
getfacl secret.txt

# Give user 'alice' read/write permissions
setfacl -m u:alice:rw secret.txt

# Give group 'developers' execute permissions
setfacl -m g:developers:x script.sh

# Remove ACL entry
setfacl -x u:alice secret.txt

# Remove all ACLs
setfacl -b secret.txt
```