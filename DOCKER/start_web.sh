#!/bin/bash
# Pierrick VERAN - Tardigrade Security Challenge - 09/11/2015
# Launch nginx-gunicorn-django container link with tsc's webfiles

echo "Suppression de l'ancien conteneur .."
docker rm -f tsc_web_storage

echo ".. démarrage du nouveau"
docker run \
        --name tsc_web_storage \
        --hostname dl.tsc.itinet.fr \
        --restart=always \
        -v ~/Git/TSC_storage/WWW:/var/www/:ro \
        -p 80:80 \
        -d tsc/storage:Web
