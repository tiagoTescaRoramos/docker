#!/usr/bin/env bash
if [ "$1" == '' ]; then
  echo "Which PHP version do you want to up?"
  echo "|---------------------------------------------------------------|"
  echo "|Version| Description                                           |"
  echo "|---------------------------------------------------------------|"
  echo "| php56 | Version PHP 5.6. Settings inside the folder php56/    |"
  echo "|---------------------------------------------------------------|"
  echo "| php72 | Version PHP 7.2. Settings inside the folder php72/    |"
  echo "|---------------------------------------------------------------|"
  echo "| php73 | Version PHP 7.3. Settings inside the folder php73/    |"
  echo "|---------------------------------------------------------------|"
  echo "| php74 | Version PHP 7.4. Settings inside the folder php74/    |"
  echo "|---------------------------------------------------------------|"
  echo "| php81 | Version PHP 8.1. Settings inside the folder php81/    |"
  echo "|---------------------------------------------------------------|"
  read phpversion
else
  phpversion=$@
fi

if [ ! -d '../databases' ]; then
  mkdir '../databases';
  chmod 0777 -R '../databases';
  echo 'Create folder ../databases with success.';
fi;

if [ ! -d '../.composer' ]; then
    mkdir '../.composer';
    chmod 0777 -R '../.composer';
    echo 'Create folder ../.composer with success.';
fi;

if [ ! -d '../tmp' ]; then
    mkdir '../tmp';
    chmod 0777 -R '../tmp';
    echo 'Create folder ../tmp with success.';
fi;

if [ ! -d '../var' ]; then
    mkdir '../var';
    chmod 0777 -R '../var';
    mkdir '../var/log';
    chmod 0777 -R '../var/log';
    echo 'Create folder ../var with success.';
fi;

sudo sysctl -w vm.max_map_count=262144
if [ $phpversion == "php56" ]; then
    ./down.sh
    docker-compose -f php56/docker-compose.yml --env-file .env up -d
elif [ $phpversion == "php72" ]; then
    ./down.sh
    docker-compose -f php72/docker-compose.yml --env-file .env up -d
elif [ $phpversion == "php73" ]; then
    ./down.sh
    docker-compose -f php73/docker-compose.yml --env-file .env up -d
elif [ $phpversion == "php74" ]; then
    ./down.sh
    docker-compose -f php74/docker-compose.yml --env-file .env up -d
elif [ $phpversion == "php81" ]; then
    ./down.sh
    docker-compose -f php81/docker-compose.yml --env-file .env up -d
else
    echo "PHP version does't exist."
    ./up.sh
fi