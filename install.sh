#!/bin/bash

# Function to install Docker
install_docker() {
    echo "Installing Docker..."
    case "$ID" in
        ubuntu|debian)
            sudo apt update && sudo apt upgrade -y
            sudo apt install -y git wget ca-certificates curl
            sudo install -m 0755 -d /etc/apt/keyrings
            curl -fsSL https://download.docker.com/linux/$ID/gpg | sudo tee /etc/apt/keyrings/docker.asc > /dev/null
            echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/$ID $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
            sudo apt-get update
            sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
            ;;
        centos|almalinux)
            sudo yum update -y
            sudo yum install -y yum-utils device-mapper-persistent-data lvm2
            sudo yum-config-manager -y --add-repo https://download.docker.com/linux/centos/docker-ce.repo
            sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
            sudo systemctl start docker
            sudo systemctl enable docker
            ;;
        *)
            echo "Unsupported operating system for Docker installation."
            exit 1
            ;;
    esac
}

# Function to install Supabase
install_supabase() {
    if command -v supabase >/dev/null 2>&1; then
        echo "Supabase is already installed. Exiting..."
        exit 0
    fi

    echo "Installing Supabase..."
    install_docker

    git clone --depth 1 https://github.com/supabase/supabase
    cd supabase/docker || exit
    cp .env.example .env
    sudo docker compose pull
    sudo docker compose up -d

    LOCAL_IP=$(hostname -I | awk '{print $1}')
    PUBLIC_IP=$(curl -s ifconfig.me)

    echo "Supabase has successfully installed and is accessible at $LOCAL_IP:8000 (Or $PUBLIC_IP:8000 if you have port forwarded)"
    echo "Username: supabase"
    echo "Password: this_password_is_insecure_and_should_be_updated"
    echo "As the password suggests, please change it to ensure security of your database"
}

# Function to install CloudFlare Tunnel
install_cloudflare_tunnel() {
    echo "Setting up CloudFlare Tunnel..."
    curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
    sudo dpkg -i cloudflared.deb
    echo "Copy the 'If you already have cloudflared installed on your machine' command and paste it below"
    echo "Command Provided by CloudFlare:"
}

# Function to install Tailscale
install_tailscale() {
    echo "Installing Tailscale...."
    curl -fsSL https://tailscale.com/install.sh | sh
    tailscale up
    echo "Tailscale has been installed and should now be connected to your tailnet."
}

# Main installation menu
install_menu() {
    echo "Detecting operating system..."
    sleep 2
    . /etc/os-release

    echo "Detected OS ID: $ID"  # Debug output

    echo "${ID^} Installation Menu:"
    echo "1. Install Supabase"
    echo "2. Install CloudFlare Tunnel"
    echo "3. Install Tailscale"
    echo "4. Exit"
    read -p "Enter your choice: " choice
    echo "You entered: $choice"  # Debug output

    case $choice in
        1) install_supabase ;;
        2) install_cloudflare_tunnel ;;
        3) install_tailscale ;;
        4) exit 0 ;;
        *) echo "Invalid choice"; exit 1 ;;
    esac
}

# Start the installation process
install_menu