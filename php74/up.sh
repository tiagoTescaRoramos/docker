sudo sysctl -w vm.max_map_count=262144
sh ../down.sh
docker-compose up -d