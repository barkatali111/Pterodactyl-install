#!/bin/bash
# Step 1: System Update & Dependencies

set -e
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl zip unzip git software-properties-common lsb-release ca-certificates gnupg ufw

echo "✅ System updated and basic packages installed."

