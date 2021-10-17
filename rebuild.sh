#!/usr/bin/env bash
if [ "$@" == "php56" ]; then
    cd "php56"
    ./rebuild.sh
elif [ "$@" == "php73" ]; then
    cd "php73"
    ./rebuild.sh
elif [ "$@" == "php74" ]; then
    cd "php74"
    ./rebuild.sh
elif [ "$@" == "php80" ]; then
    cd "php80"
    ./rebuild.sh
else
    ./down.sh
    echo "Versão do PHP não encontrada."
fi