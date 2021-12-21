#!/usr/bin/env bash
if [ "$@" == "php56" ]; then
    cd "php56"
    ./up.sh
elif [ "$@" == "php72" ]; then
    cd "php72"
    ./up.sh
elif [ "$@" == "php73" ]; then
    cd "php73"
    ./up.sh
elif [ "$@" == "php74" ]; then
    cd "php74"
    ./up.sh
elif [ "$@" == "php80" ]; then
    cd "php80"
    ./up.sh
else
    ./down.sh
    echo "Versão do PHP não encontrada."
fi