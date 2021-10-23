FROM telegraf
USER root
COPY ./scripts/telegraf.conf /etc/telegraf/telegraf.conf
COPY ./scripts/netatmo.sh /scripts/netatmo.sh
RUN apt-get update && apt-get install -y jq
RUN chmod u+x /scripts/netatmo.sh

