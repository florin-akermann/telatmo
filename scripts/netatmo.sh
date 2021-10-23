#! /bin/bash
curl -s -d "grant_type=password&client_id=$CLIENT_ID&client_secret=$CLIENT_SECRET&username=$USERNAME&password=$PASSWORD&scope=read_station" "https://api.netatmo.net/oauth2/token" \
  | curl -s -d "access_token=$(jq -r '.access_token')" "https://api.netatmo.net/api/getstationsdata" \
  | jq '.body.devices'