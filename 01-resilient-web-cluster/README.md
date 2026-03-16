# 🌐 Resilient Web Cluster (Azure)

## 🎯 The Goal
This project demonstrates how to eliminate "Single Point of Failure" in web hosting architectures. By deploying a redundant backend behind an **Azure Load Balancer**, I ensure high availability—if one web server goes down for maintenance or fails, the remaining server keeps the service online, ensuring zero downtime for users.

## 🏗️ Architecture Overview
* **Network Foundation:** Virtual Network (VNET) with segmented subnets.
* **Traffic Management:** Azure Public Load Balancer to distribute incoming HTTP requests.
* **Compute:** Scalable Linux Virtual Machines running Nginx.
* **Automation:** Boot-strapped Nginx installation via custom shell scripts.

## 🛠️ Tech Stack
* **Cloud Platform:** Microsoft Azure
* **Infrastructure as Code:** Terraform
* **Configuration:** Bash (Automated provisioning)
* **Networking:** Azure Load Balancer, Network Security Groups (NSG)

## 🚀 How to Run
1. **Clone the repo:**
   ```bash
   git clone https://github.com/nivedmohan77/The-Chaos-Repo.git
   cd The-Chaos-Repo/terraform
