#!/bin/bash
# Step 3: Install Pterodactyl Panel

set -e
cd /var/www
sudo mkdir -p pterodactyl
cd pterodactyl
curl -Lo panel.tar.gz https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz
tar -xzvf panel.tar.gz
chmod -R 755 storage/* bootstrap/cache

cp .env.example .env
composer install --no-dev --optimize-autoloader
php artisan key:generate --force

echo "✅ Pterodactyl Panel downloaded and installed."
