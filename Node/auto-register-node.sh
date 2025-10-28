#!/bin/bash
# Auto Register Node to Panel

PANEL_URL="https://yourdomain.com"
API_KEY="YOUR_API_KEY_HERE"
NODE_NAME=$(hostname)
PUBLIC_IP=$(curl -s https://api.ipify.org)

curl -s -X POST "$PANEL_URL/api/application/nodes" \
-H "Authorization: Bearer $API_KEY" \
-H "Content-Type: application/json" \
-d "{
  \"name\": \"$NODE_NAME\",
  \"location_id\": 1,
  \"fqdn\": \"$PUBLIC_IP\",
  \"scheme\": \"https\",
  \"memory\": 4096,
  \"disk\": 20000
}" | jq .

echo "✅ Node registered to Panel."
