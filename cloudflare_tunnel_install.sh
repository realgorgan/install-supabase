#!/bin/bash

## Set up CloudFlare Tunnel

echo "Setting up CloudFlare Tunnel..."
curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
dpkg -i cloudflared.deb
echo "Copy the "If you already have cloudflared installed on your machine" command and paste it below"
echo "Command Provided by CloudFlare:"