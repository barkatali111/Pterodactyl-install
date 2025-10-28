#!/bin/bash
# Step 5: Finalize Panel Setup

set -e
cd /var/www/pterodactyl

php artisan migrate --seed --force
php artisan p:environment:setup
php artisan p:environment:database
php artisan p:user:make --email="admin@example.com" --admin=1

echo "✅ Panel setup complete."
