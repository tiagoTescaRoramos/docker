#!/usr/bin/env bash
docker container exec -i -u0 php74 phpcs "$@"