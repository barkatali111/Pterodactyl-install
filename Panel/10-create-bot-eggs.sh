#!/bin/bash
# Step 10: Create Bot Deployment Eggs

PANEL_URL="https://yourdomain.com"
API_KEY="YOUR_API_KEY_HERE"
NEST_ID=1

sudo apt install -y jq curl

echo "🤖 Creating Node.js and Python Eggs for Bot Deployment..."

curl -s -X POST "$PANEL_URL/api/application/nests/$NEST_ID/eggs" \
-H "Authorization: Bearer $API_KEY" \
-H "Content-Type: application/json" \
-d '{
  "name": "Node.js Bot",
  "docker_image": "ghcr.io/parkervcp/yolks:nodejs_20",
  "startup": "npm start",
  "description": "24/7 Node.js bot runtime"
}' | jq .

curl -s -X POST "$PANEL_URL/api/application/nests/$NEST_ID/eggs" \
-H "Authorization: Bearer $API_KEY" \
-H "Content-Type: application/json" \
-d '{
  "name": "Python Bot",
  "docker_image": "ghcr.io/parkervcp/yolks:python_3.11",
  "startup": "python3 main.py",
  "description": "24/7 Python bot runtime"
}' | jq .

echo "✅ Bot Eggs created successfully."
