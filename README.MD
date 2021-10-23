A simple telegraf image extension to poll the netatmo api.

#### How to run

If you are a netatmo customer then it is easy to poll your sensors' data via their api.
Set yourself up as a netatmo api user under https://dev.netatmo.com/.
Adjust the environment variable values accordingly.

```shell
docker build -t floak/telatmo:latest .
docker run -p 8086:8086 \
  --rm --name influx -d influxdb:1.8
docker run --network=host --rm --name telatmo \
  -e CLIENT_ID=$YOUR_CLIENT_ID \
  -e CLIENT_SECRET=$YOUR_CLIENT_SECRET \
  -e USERNAME=$YOUR_USERNAME \
  -e PASSWORD=$YOUR_PASSWORD \
  -d floak/telatmo:latest
```

Checkout the data flowing in by running: 
```shell
    docker exec -it influx sh
    
    #inside the container run
    influx
    select telegraf
    select * from 
```

Now you are ready to display it in grafana or similar.