#!/bin/bash
# Pierrick VERAN - Tardigrade Security Challenge - 22/12/2015
# Launch hub container for public docker images storage
# docker pull distribution/registry:master

echo "Suppression de l'ancien conteneur .."
docker rm -f tsc_hub_public

echo ".. démarrage du nouveau"
docker run \
        --name tsc_hub_public \
        --hostname hub.tsc.itinet.fr \
        --restart=always \
        -p 5000:5000 \
        -v $(pwd)/HUB/auth_public:/auth \
        -e REGISTRY_AUTH="htpasswd" \
        -e REGISTRY_AUTH_HTPASSWD_REALM="Registry Realm" \
        -e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd \
        -v /home/docker/hub:/var/lib/registry:rw \
        -v $(pwd)/HUB/certs:/certs:ro \
        -e REGISTRY_HTTP_TLS_CERTIFICATE="/certs/tsc.itinet.fr.cert.pem" \
        -e REGISTRY_HTTP_TLS_KEY="/certs/tsc.itinet.fr.privkey.pem" \
        -e REGISTRY_HTTP_SECRET="2J9r9mtbm4BdRmcV4ExgVzEbKzkW4W7V8EUYm9cMQ8UGu" \
        -d registry:2


# cp tsc.itinet.fr.fullchain.pem /usr/local/share/ca-certificates/
# mkdir -p /etc/docker/certs.d/tsc.itinet.fr:5000/
# cp tsc.itinet.fr.fullchain.pem etc/docker/certs.d/tsc.itinet.fr:5000/ca.crt
# sudo update-ca-certificates
# sudo service docker restart
# docker pull distribution/registry:master
# docker run --entrypoint htpasswd registry:2 -Bbn public public > auth/htpasswd
# docker login --username="public" --password="public" --email="veran@intechinfo.fr" localhost:5000
# docker tag -f ubuntu localhost:5000/ubuntu
# docker push localhost:5000/ubuntu
# echo "10.8.99.111     dl.tsc.itinet.fr" >> /etc/hosts
