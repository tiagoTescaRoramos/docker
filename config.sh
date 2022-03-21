#!/usr/bin/env bash
FILE=.env
if ! test -f "$FILE"; then
    cp .env.example .env
fi