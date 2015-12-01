#!/bin/bash
# Pierrick VERAN - Tardigrade Security Challenge - 09/11/2015
# Launch nginx-gunicorn-django container link with tsc's webfiles
docker rm -f tsc_web_storage

docker run \
--name tsc_web_storage \
 -v /home/lilyus/Git/TSC_storage/WWW:/var/www/:ro \
-p 127.0.0.1:8080:80 \
-d tsc/storage:Web
