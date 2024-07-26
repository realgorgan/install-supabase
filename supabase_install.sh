#!/bin/bash

# Function to display menu for Debian-based systems
debian_menu() {
    echo "Debian-based System Supabase Installation Menu:"
    echo "1. Install Supabase"
    echo "2. Install CloudFlare Tunnel"
    echo "3. Install Tailscale"
    echo "4. Exit"
    read -p "Enter your choice: " choice
    case $choice in
        1)
            apt install -y wget && wget https://cdn.jordanlindsay.com.au/Supabase%20Install%20Script/supabase_install_debian.sh && chmod +x supabase_install_debian.sh && ./supabase_install_debian.sh
            ;;
        2)
            apt install -y wget && wget https://cdn.jordanlindsay.com.au/Supabase%20Install%20Script/cloudflare_tunnel_install.sh && chmod +x cloudflare_tunnel_install.sh && ./cloudflare_tunnel_install.sh
            ;;
        3)
            apt install -y wget && wget https://cdn.jordanlindsay.com.au/Supabase%20Install%20Script/tailscale_install.sh && chmod +x tailscale_install.sh && ./tailscale_install.sh
            ;;
        4)
            exit 0
            ;;
        *)
            echo "Invalid choice"
            ;;
    esac
}

# Function to display menu for Ubuntu systems
ubuntu_menu() {
    echo "Ubuntu System Supabase Installation Menu:"
    echo "1. Install Supabase"
    echo "2. Install CloudFlare Tunnel"
    echo "3. Install Tailscale"
    echo "4. Exit"
    read -p "Enter your choice: " choice
    case $choice in
        1)
            apt install -y wget && wget https://cdn.jordanlindsay.com.au/Supabase%20Install%20Script/supabase_install_ubuntu.sh && chmod +x supabase_install_ubuntu.sh && ./supabase_install_ubuntu.sh
            ;;
        2)
            apt install -y wget && wget https://cdn.jordanlindsay.com.au/Supabase%20Install%20Script/cloudflare_tunnel_install.sh && chmod +x cloudflare_tunnel_install.sh && ./cloudflare_tunnel_install.sh
            ;;
        3)
            apt install -y wget && wget https://cdn.jordanlindsay.com.au/Supabase%20Install%20Script/tailscale_install.sh && chmod +x tailscale_install.sh && ./tailscale_install.sh
            ;;
        4)
            exit 0
            ;;
        *)
            echo "Invalid choice"
            ;;
    esac
}

# Function to display menu for CentOS systems
centos_menu() {
    echo "CentOS System Supabase Installation Menu:"
    echo "1. Install Supabase"
    echo "2. Install CloudFlare Tunnel"
    echo "3. Install Tailscale"
    echo "4. Exit"
    read -p "Enter your choice: " choice
    case $choice in
        1)
            apt install -y wget && wget https://cdn.jordanlindsay.com.au/Supabase%20Install%20Script/supabase_install_centos.sh && chmod +x supabase_install_centos.sh && ./supabase_install_centos.sh
            ;;
        2)
            apt install -y wget && wget https://cdn.jordanlindsay.com.au/Supabase%20Install%20Script/cloudflare_tunnel_install.sh && chmod +x cloudflare_tunnel_install.sh && ./cloudflare_tunnel_install.sh
            ;;
        3)
            apt install -y wget && wget https://cdn.jordanlindsay.com.au/Supabase%20Install%20Script/tailscale_install.sh && chmod +x tailscale_install.sh && ./tailscale_install.sh
            ;;
        4)
            exit 0
            ;;
        *)
            echo "Invalid choice"
            ;;
    esac
}

# Detect the operating system
echo "Detecting operating system..."
sleep 4
. /etc/os-release

if [ "$ID" = "debian" ]; then
    debian_menu
elif [ "$ID" = "ubuntu" ]; then
    ubuntu_menu
elif [ "$ID" = "centos" ]; then
    centos_menu
else
    echo "Unsupported operating system"
    exit 1
fi
