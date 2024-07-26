# Supabase Install Script

This script sets up a Supabase environment on your Linux server. It also includes options for setting up a CloudFlare Tunnel and Tailscale for external access if you don't want to port forward.

## Supported Operating Systems
| Operating System | Version | Supported          
| ---------------- | ------- | ------------------ 
| Ubuntu           | 14.04   | :red_circle:       
|                  | 16.04   | :red_circle:   
|                  | 18.04   | :red_circle:   
|                  | 20.04   | :red_circle:
|                  | 22.04   | :white_check_mark: 
|                  | 24.04   | :white_check_mark:
| Debian           | 8       | :red_circle:   
|                  | 9       | :red_circle:    
|                  | 10      | :red_circle: 
|                  | 11      | :red_circle: 
|                  | 12      | :white_check_mark:

## Features

1. Install Supabase
2. Setup CloudFlare Tunnel
3. Setup Tailscale

## Usage

### Running the Script

```
apt install wget && wget https://cdn.jordanlindsay.com.au/supabase_install.sh/ && chmod +x supabase_install.sh && ./supabase_install.sh
```
Copy and paste this into your system and follow the prompts.
