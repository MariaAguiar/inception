FROM debian:oldstable

RUN apt-get update -y && apt-get upgrade -y

WORKDIR /var/lib/mysql

RUN apt-get install -y mariadb-server

COPY script.sh /etc/script.sh

ENTRYPOINT ["/bin/bash", "/etc/script.sh"]
