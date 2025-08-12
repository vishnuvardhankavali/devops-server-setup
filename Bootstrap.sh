#!/bin/bash
echo "🚀 Starting DevOps server setup..."

# Detect OS
source /etc/os-release
os=$ID

# Update & install base packages
if [[ "$os" == "ubuntu" || "$os" == "debian" ]]; then
  sudo apt update -y
  sudo apt upgrade -y --allow-change-held-packages
  sudo apt install -y curl wget nano git ufw htop ncdu net-tools
  sudo ufw allow 22/tcp
  sudo ufw --force enable
elif [[ "$os" == "rhel" || "$os" == "centos" ]]; then
  sudo yum update -y
  sudo yum install -y curl wget nano git firewalld htop ncdu net-tools
  sudo systemctl start firewalld
  sudo systemctl enable firewalld
  sudo firewall-cmd --permanent --add-port=22/tcp
  sudo firewall-cmd --reload
else
  echo "❌ Unsupported OS: $os"
  exit 1
fi

# Create user if not exists
if id "vishnu" &>/dev/null; then
  echo "👤 User 'vishnu' already exists"
else
  sudo adduser vishnu
  sudo usermod -aG sudo vishnu
fi

# Set timezone
sudo timedatectl set-timezone Asia/Kolkata


echo "✅ DevOps server setup complete!"
