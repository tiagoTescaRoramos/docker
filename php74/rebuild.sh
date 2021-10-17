#!/usr/bin/env bash
sudo sysctl -w vm.max_map_count=262144
cd ../
sh down.sh
cd php74
docker-compose up --build -d