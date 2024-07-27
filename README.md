# Supabase Install Script

## You can now access our website at https://supabase.click

This script sets up a Supabase environment on your Linux server. It also includes options for setting up a CloudFlare Tunnel and Tailscale for external access if you don't want to port forward.

## Supported Operating Systems
| Operating System | Version | Supported          
| ---------------- | ------- | ------------------ 
| Ubuntu           | 20.04   | :white_check_mark:
|                  | 22.04   | :white_check_mark:
|                  | 24.04   | :white_check_mark:
| Debian           | 11      | :white_check_mark:
|                  | 12      | :white_check_mark:
| CentOS           | 9       | :white_check_mark:
| AlmaLinux        | 8       | :white_check_mark:
|                  | 9       | :white_check_mark:
| Fedora           | 40      | :white_check_mark:
| Kali Linux       | 2024.2  | :white_check_mark:
| Manjaro          | 24      | :grey_question:

## Features

1. Install Supabase
2. Setup CloudFlare Tunnel
3. Setup Tailscale

## Usage

### Running the Script

```
sudo bash -c "$(curl -sSL https://raw.githubusercontent.com/realgorgan/install-supabase/main/install.sh)"
```
Copy and paste this into your system and follow the prompts.
