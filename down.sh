#!/usr/bin/env bash
docker-compose -f php56/docker-compose.yml down
docker-compose -f php72/docker-compose.yml down
docker-compose -f php73/docker-compose.yml down
docker-compose -f php74/docker-compose.yml down
docker-compose -f php81/docker-compose.yml down