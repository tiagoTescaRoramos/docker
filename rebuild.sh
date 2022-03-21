#!/usr/bin/env bash
if [ "$1" == '' ]; then
  echo "Which PHP version do you want to build?"
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
sudo sysctl -w vm.max_map_count=262144
./down.sh
if [ $phpversion == "php56" ]; then
    docker-compose -f php56/docker-compose.yml --env-file .env up --build -d
elif [ $phpversion == "php72" ]; then
    docker-compose -f php72/docker-compose.yml --env-file .env up --build -d
elif [ $phpversion == "php73" ]; then
    docker-compose -f php73/docker-compose.yml --env-file .env up --build -d
elif [ $phpversion == "php74" ]; then
    docker-compose -f php74/docker-compose.yml --env-file .env up --build -d
elif [ $phpversion == "php81" ]; then
    docker-compose -f php81/docker-compose.yml --env-file .env up --build -d
else
    echo "PHP version does't exist."
fi