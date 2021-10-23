docker build -t floak/telatmo:latest .
docker run -p 8086:8086 \
  --rm --name influx -d influxdb:1.8
docker run --network=host --rm --name telatmo \
  -e CLIENT_ID=$YOUR_CLIENT_ID \
  -e CLIENT_SECRET=$YOUR_CLIENT_SECRET \
  -e USERNAME=$YOUR_USERNAME \
  -e PASSWORD=$YOUR_PASSWORD \
  -d floak/telatmo:latest
