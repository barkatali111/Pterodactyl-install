#!/bin/bash
# Step 2: MariaDB Install & Setup

set -e
sudo apt install -y mariadb-server
sudo systemctl enable mariadb
sudo systemctl start mariadb

sudo mysql_secure_installation

echo "✅ MariaDB installed and secured."
