#!/usr/bin/env bash
sudo sysctl -w vm.max_map_count=262144
cd ../
sh down.sh
cd php80
docker-compose up -d