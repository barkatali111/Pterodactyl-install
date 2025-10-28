#!/bin/bash
# Step 9: Create API Token
set -e
cd /var/www/pterodactyl
php artisan p:token:make "auto-bot-token"
echo "✅ API Token created. Check Panel -> Application API."
