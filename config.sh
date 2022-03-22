#!/usr/bin/env bash
FILE=.env
if ! test -f "$FILE"; then
    cp .env.example .env
fi

if [ "$1" == '--help' ] || [ "$1" == '-h' ] || ["$1" == '']; then
  echo '--------------------------------------------------------HELP----------------------------------------------------';
  echo '';
  echo '';
  echo 'Command                 | Description';
  echo '--ngnix-server-name     | Configure hosts the project in ngnix. Create files .conf with configuration the ngnix';
  echo '--restore-db            | Restore database. You need to put your backup in dumps/. If database dont exist, the command create for you' ;
  echo '';
  echo '';
  echo '-----------------------------------------------------------About HOSTs----------------------------------------------';
  echo '--ngnix-server-name will create configuration ngnix, but You need to add you host of project in you hosts the your Operation System.'
  echo 'The linux or WSL the windows, the file is /etc/hosts';
  echo '';
  echo '-----------------------------------------------------------About .ENV-----------------------------------------------';
  echo 'If file .env not exist, ./up.sh will create for you with default values.'
  echo '
- CONTAINER_USER=ttescaro      -> User the container
- DB_PASSWORD=mudar@123        -> Password the mysql. If database exist, change the password in the MYSQL
- RABBITMQ_DEFAULT_USER=guest  -> Username RabbitMQ
- RABBITMQ_DEFAULT_PASS=guest  -> Password RabbitMQ
- DIRECTORY_PROJECTS=../../    -> Directory projects that you will clone or create. Default is same folder as docker folder';
fi

if [ "$1" == '--restore-db' ]; then
  ./retoreDB.sh
fi

if [ "$1" == '--ngnix-server-name' ]; then
  ./config-nginx-server-name.sh
fi