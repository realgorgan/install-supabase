#!/bin/bash

echo "Installing Tailscale...."
curl -fsSL https://tailscale.com/install.sh | sh
tailscale up
echo "Tailscale has been installed and should now be connected to your tailnet."