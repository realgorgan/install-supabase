#!/bin/bash

# Check Ubuntu version
echo "Checking Ubuntu Version....."
sleep 3
if [[ $(lsb_release -rs) != "22.04" && $(lsb_release -rs) != "24.04" ]]; then
    echo "This system is not supported. This script only supports Ubuntu 22.04 and 24.04 currently."
    exit 1
fi

# Menu
echo "Menu:"
echo "1. Install Supabase"
echo "2. Setup CloudFlare Tunnel"
echo "3. Setup Tailscale"
echo "4. Exit"

# Read user input
read -p "Enter your choice: " choice

# Process user choice
case $choice in
    1)
        # Check if Supabase is already installed
        if command -v supabase >/dev/null 2>&1; then
            echo "Supabase is already installed. Exiting..."
            exit 0
        fi
        echo "Installing Supabase..."
        # Update and upgrade system packages
sudo apt update && sudo apt upgrade -y

# Install necessary packages
sudo apt install -y git wget ca-certificates curl

# Add Docker's official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/keyrings/docker.asc > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Set up the Docker repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package index and install Docker
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Clone the Supabase repository
git clone --depth 1 https://github.com/supabase/supabase

# Navigate to the Docker directory and set up environment
cd supabase/docker
cp .env.example .env

# Pull and run the Supabase Docker containers
sudo docker compose pull
sudo docker compose up -d

# Get the local IP address
LOCAL_IP=$(hostname -I | awk '{print $1}')

# Get the public IP address
PUBLIC_IP=$(curl -s ifconfig.me)

echo "Supabase has successfully installed and is accessible using the following information"
echo "IP: $LOCAL_IP:8000 (Or $PUBLIC_IP:8000 if you have port forwarded)"
echo "Username: supabase"
echo "Password: this_password_is_insecure_and_should_be_updated"
echo "As the password suggests, please change it to ensure security of your database"
        ;;
    2)
        echo "Setting up CloudFlare Tunnel..."
        curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
        dpkg -i cloudflared.deb
        echo "Copy the "If you already have cloudflared installed on your machine" command and paste it below"
        echo "Command Provided by CloudFlare:"
        ;;
    3)
        echo "Installing Tailscale...."
        curl -fsSL https://tailscale.com/install.sh | sh
        tailscale up
        echo "Tailscale has been installed and should now be connected to your tailnet."
        ;;
    4)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice. Please try again."
        ;;
esac