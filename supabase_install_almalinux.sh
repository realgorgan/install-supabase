#!/bin/bash

## Supabase Installation Script for AlmaLinux 8 and 9

## Install Docker
sudo dnf update -y
# Remove Podman, this (for some reason) causes conflict when installing docker
sudo dnf remove -y podman
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin --allowerasing
sudo systemctl start docker
sudo systemctl enable docker

## Install Supabase
git clone --depth 1 https://github.com/supabase/supabase
cd supabase/docker
cp .env.example .env
docker compose pull
docker compose up -d

# Get the local IP address
LOCAL_IP=$(hostname -I | awk '{print $1}')

# Get the public IP address
PUBLIC_IP=$(curl -s ifconfig.me)

echo "Supabase has successfully installed and is accessible using the following information"
echo "IP: $LOCAL_IP:8000 (Or $PUBLIC_IP:8000 if you have port forwarded)"
echo "Username: supabase"
echo "Password: this_password_is_insecure_and_should_be_updated"
echo "As the password suggests, please change it to ensure security of your database"

