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
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

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