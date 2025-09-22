# 🚀 Day 25 – Terraform Modules with Docker Containers

### **Overview**

On Day 25, I focused on combining **Terraform** and **Docker** to build a modular, reusable infrastructure setup. The goal was to understand how **Terraform modules** work and how they can simplify the deployment of multiple Docker containers with different configurations. This mirrors real-world DevOps practices, where modular, reusable code is key for scaling and maintaining infrastructure.

---

### **What I Learned**

* **Terraform Modules**: Learned how to structure reusable blocks of infrastructure code that can be called multiple times with different parameters.
* **Docker Provider in Terraform**: Understood how Terraform interacts with Docker to provision containers as infrastructure resources.
* **Reusability & Parameterization**: Practiced passing variables like container names, images, ports, and environment variables to modules, enabling flexible deployments.
* **Multi-Container Setup**: Successfully deployed multiple services (Nginx, Redis, PostgreSQL) using the same module with different configurations.
* **Terraform Workflow**: Reinforced the full Terraform workflow — `init`, `plan`, `apply`, and `destroy`

---

### **Project Structure**

The project is organized into a **root configuration** and a **container module**:

* **Root Configuration**: Contains the Terraform provider setup and calls to the container module for each service.
* **Container Module**: Defines the Docker container resource and accepts parameters for name, image, ports, and environment variables.

This structure ensures that adding new containers is as simple as calling the module again with different parameters, without duplicating code.

---

### **How to Run This Project**

1. **Ensure Docker is running** on your system (Docker Desktop or Docker daemon).
2. **Initialize Terraform** in the project folder to download the provider and prepare the environment.
3. **Plan the deployment** to preview the changes Terraform will make.
4. **Apply the configuration** to spin up all containers (Nginx, Redis, PostgreSQL).
5. **Verify containers** by listing running Docker containers to confirm everything is running correctly.
6. **Destroy resources** when finished to clean up your environment.

This workflow allows you to deploy and manage containerized services reliably using infrastructure-as-code principles.

---

### **Key Takeaways**

* Modular Terraform code reduces duplication and improves maintainability.
* Terraform can manage not only cloud resources but also local Docker containers, making it a versatile tool for DevOps.
* Parameterized modules enable consistent multi-environment deployments.
* Hands-on practice reinforces the importance of **repeatable, reliable infrastructure** in DevOps pipelines.

p.s. I have redacted the username and password for the postgre db. Do assign values to it.
