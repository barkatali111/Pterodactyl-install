#!/bin/bash
# Step 6: Setup SSL via Certbot

set -e
sudo apt install -y certbot python3-certbot-nginx
sudo certbot --nginx -d yourdomain.com --non-interactive --agree-tos -m admin@example.com
sudo systemctl restart nginx

echo "✅ SSL setup complete."
