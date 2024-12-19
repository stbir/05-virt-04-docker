#!/bin/bash

#git install
apt update && apt upgrade -y
apt install -y git

#git clone
git clone https://github.com/stbir/shvirtd-example-python /opt/shvirtd-example-python

#start
cd /opt/shvirtd-example-python
#export DB_PASSWORD=${MYSQL_PASSWORD}
docker compose up -d