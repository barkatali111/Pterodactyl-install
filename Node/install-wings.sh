#!/bin/bash
# Install Wings (Node agent)
set -e

curl -sSL https://get.docker.com/ | sh
sudo systemctl enable --now docker
mkdir -p /etc/pterodactyl

curl -Lo /usr/local/bin/wings https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_amd64
chmod +x /usr/local/bin/wings
systemctl enable wings
systemctl start wings

echo "✅ Wings installed."
