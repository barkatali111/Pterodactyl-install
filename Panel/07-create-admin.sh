#!/bin/bash
# Step 7: Create Admin User
set -e
cd /var/www/pterodactyl
php artisan p:user:make --email="admin@example.com" --admin=1
echo "✅ Admin user created."
