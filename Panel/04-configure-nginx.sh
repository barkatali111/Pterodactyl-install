#!/bin/bash
# Step 4: Configure Nginx for Panel

set -e

cat <<EOF | sudo tee /etc/nginx/sites-available/pterodactyl.conf
server {
    listen 80;
    server_name yourdomain.com;

    root /var/www/pterodactyl/public;
    index index.php;
    access_log /var/log/nginx/pterodactyl.access.log;
    error_log /var/log/nginx/pterodactyl.error.log;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location ~ \.php\$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.2-fpm.sock;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        include fastcgi_params;
    }
}
EOF

sudo ln -s /etc/nginx/sites-available/pterodactyl.conf /etc/nginx/sites-enabled/
sudo systemctl restart nginx

echo "✅ Nginx configured for Pterodactyl."
