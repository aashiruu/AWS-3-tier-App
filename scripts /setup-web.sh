#!/bin/bash
# Script for Web Tier Instance
sudo apt-get update -y
sudo apt-get install -y nginx

# Create a simple HTML page
sudo cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>3-Tier App - Web Tier</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin-top: 50px; }
        h1 { color: #FF9900; }
    </style>
</head>
<body>
    <h1>Hello from the Web Tier!</h1>
    <p>This NGINX server is running on EC2 in a public subnet.</p>
    <p>It is designed to proxy requests to the Application Tier.</p>
    <p><strong>Architecture:</strong> VPC | Public/Private Subnets | Security Groups | IAM Roles</p>
</body>
</html>
EOF

# Restart NGINX to apply changes
sudo systemctl restart nginx
sudo systemctl enable nginx
