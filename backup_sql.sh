#!/bin/sh

# now=$(date +"%s_%Y-%m-%d")
# /usr/bin/mysqldump --opt -h ${MYSQL_HOST} -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} > "/backup/${now}_${MYSQL_DATABASE}.sql"

# Определяем переменные
DB_NAME="virtd"
BACKUP_DIR="/opt/backup"
CONTAINER_IMAGE="schnitzler/mysqldump"
MYSQL_USER="app"
#mkdir /opt/backup

#Запускаем контейнер
docker run -d --name sql-backup \
  -v "$BACKUP_DIR":/backup \
  --network backend \
  $CONTAINER_IMAGE mysqldump -h db --user=$MYSQL_USER --password: ${MYSQL_PASSWORD} --databases=$DB_NAME  --result-file=/backup/dumps.sql

  # docker run \
  #   --rm --entrypoint "" \
  #   -v opt/backup:/backup \
  #   --link="container:alias" \
  #   schnitzler/mysqldump \
  #   mysqldump --opt -h db -u=$MYSQL_USER -p: ${MYSQL_PASSWORD} --databases=$DB_NAME --result-file=/backup/dumps.sql" 