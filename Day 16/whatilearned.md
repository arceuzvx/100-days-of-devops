## 🚀 Day 16 – Docker Networking Basics

Today I explored how Docker networking works and why it’s essential for multi-container applications.

## 🔑 Key Learnings

Docker provides three default networks:

bridge → default, but limited (containers don’t auto-resolve names).

host → shares the host’s network stack (Linux only).

none → completely isolated.

On the default bridge, containers can’t resolve each other by name.

By creating a custom bridge network, containers can talk to each other using container names.

## 🛠️ Commands I Used
```bash
# List all networks
docker network ls  

# Create a custom network
docker network create mynet  

# Run containers on a custom network
docker run -dit --name alpine1 --network mynet alpine sh
docker run -dit --name alpine2 --network mynet alpine sh  

# Test connectivity
docker exec -it alpine1 ping alpine2  
```

## 📌 Takeaway

Containers in custom networks can seamlessly communicate by service name, making them production-ready for microservices architectures.