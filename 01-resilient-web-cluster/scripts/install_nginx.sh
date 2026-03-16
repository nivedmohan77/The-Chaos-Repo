#!/bin/bash
# Update the system
apt-get update -y
apt-get install -y nginx

# Configure the index page with the hostname
echo "<h1>Deployed via Terraform: Server $(hostname)</h1>" > /var/www/html/index.html

# Ensure Nginx is running
systemctl enable nginx
systemctl start nginx
