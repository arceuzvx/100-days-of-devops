## Today I explored how Docker handles data persistence. 
Containers by default are ephemeral, meaning all data is lost once the container is removed. 
To solve this, Docker provides two key storage mechanisms:

Volumes → Managed by Docker. 
They persist data across container restarts and removals, making them ideal for production use cases like databases.

Bind Mounts → Map a directory from the host machine directly into the container. 
Perfect for development workflows, as changes on the host reflect instantly inside the container.

## 🛠️ Experiments I did

Created a named volume, wrote data in a BusyBox container, removed it, and confirmed the data was still available in a new container.
Used a bind mount to map a local folder into a Python container and ran code directly from my host machine.

### 🔑 Key takeaway:

Volumes = persistence

Bind Mounts = live dev sync