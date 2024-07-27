#!/bin/bash

# Function to display menu and handle installations
install_menu() {
    local os_name="$1"
    local install_script_suffix="$2"
    
    echo "${os_name} Supabase Installation Menu:"
    echo "1. Install Supabase"
    echo "2. Install CloudFlare Tunnel"
    echo "3. Install Tailscale"
    echo "4. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1) script_name="supabase_install_${install_script_suffix}.sh" ;;
        2) script_name="cloudflare_tunnel_install.sh" ;;
        3) script_name="tailscale_install.sh" ;;
        4) exit 0 ;;
        *) echo "Invalid choice"; return ;;
    esac

    if [ "$install_script_suffix" ]; then
        wget "https://realgorgan.github.io/install-supabase/$script_name" && chmod +x "$script_name" && ./"$script_name"
    else
        apt install -y wget && wget "https://realgorgan.github.io/install-supabase/$script_name" && chmod +x "$script_name" && ./"$script_name"
    fi
}

# Detect the operating system
echo "Detecting operating system..."
sleep 4
. /etc/os-release

case "$ID" in
    debian) install_menu "Debian" "" ;;
    ubuntu) install_menu "Ubuntu" "" ;;
    centos) install_menu "CentOS" "centos" ;;
    almalinux) install_menu "AlmaLinux" "almalinux" ;;
    *) echo "Unsupported operating system"; exit 1 ;;
esac
