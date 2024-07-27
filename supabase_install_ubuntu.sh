# Check if Supabase is already installed
if command -v supabase >/dev/null 2>&1; then
    echo "Supabase is already installed. Exiting..."
    exit 0
fi

echo "Installing Supabase..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y git wget ca-certificates curl

# Add Docker's official GPG key and set up the repository
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/keyrings/docker.asc > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Clone Supabase and set up environment
git clone --depth 1 https://github.com/supabase/supabase
cd supabase/docker
cp .env.example .env

# Pull and run Supabase Docker containers
sudo docker compose pull
sudo docker compose up -d

# Get IP addresses
LOCAL_IP=$(hostname -I | awk '{print $1}')
PUBLIC_IP=$(curl -s ifconfig.me)

echo "Supabase has successfully installed and is accessible at $LOCAL_IP:8000 (Or $PUBLIC_IP:8000 if you have port forwarded)"
echo "Username: supabase"
echo "Password: this_password_is_insecure_and_should_be_updated"
echo "As the password suggests, please change it to ensure security of your database"