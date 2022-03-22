#!/usr/bin/env bash
./config.sh
docker-compose -f php56/docker-compose.yml --env-file .env down
docker-compose -f php72/docker-compose.yml --env-file .env down
docker-compose -f php73/docker-compose.yml --env-file .env down
docker-compose -f php74/docker-compose.yml --env-file .env down
docker-compose -f php81/docker-compose.yml --env-file .env down