# 🌐 Resilient Web Cluster (Azure)

## 🎯 The Goal
This project provides a professional-grade **Highly Available (HA) web architecture** on Azure. By utilizing Infrastructure as Code (IaC), this solution ensures that if any single compute resource fails, the service remains available via an **Azure Load Balancer**. It is designed to demonstrate automated provisioning and standard DevOps best practices.

## 🏗️ Technical Architecture
* **Modular Infrastructure:** Separated into `provider.tf`, `network.tf`, `load_balancer.tf`, and `compute.tf` for clean code maintainability.
* **Traffic Management:** Azure Public Load Balancer with an **HTTP Health Probe** to monitor service availability.
* **Compute:** Auto-provisioned Ubuntu VMs configured via `cloud-init`.
* **Security:** Network isolation using custom Virtual Networks (VNET) and Subnets.

## 🛠️ Tech Stack
* **Cloud Platform:** Microsoft Azure
* **Infrastructure as Code:** Terraform
* **Automation:** Bash (Cloud-Init)
* **Networking:** Load Balancing, NIC associations, and Security Groups

## 🚀 Deployment Guide
1. **Prepare your environment:** Ensure your Azure CLI is logged in and you have an SSH key generated.
2. **Clone and Initialize:**
   ```bash

   git clone https://github.com/nivedmohan77/The-Chaos-Repo.git
   cd The-Chaos-Repo/terraform
   terraform init
