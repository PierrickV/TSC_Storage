#!/usr/bin/env bash
# Pierrick VERAN - Tardigrade Security Challenge - 06/01/2015

if ls ~/nv_challenges/validated/docker_priv/* > /dev/null 2>&1
then
    echo "One file found"
    #Extract
    name=$(ls ~/nv_challenges/validated/docker_priv/*)
    echo "Unzip file $name"
    unzip $(ls ~/nv_challenges/validated/docker_priv/* | grep zip) -d ~/tmp/

    #Build
    name=$(ls ~/tmp/)
    echo " Build of file $name"
    cd ~/tmp/$name
    docker build -t challenges/$name:latest .

    docker tag -f challenges/$name 10.8.97.6:50/challenges/$name:latest
    # docker push 10.8.97.6:50/$name:latest

    #Clean
    echo "Deleting temporary files"
    name=$(ls ~/nv_challenges/validated/docker_priv/*)
    echo "Moving file $name to ~/stored_challenges/private/docker/ "
    mv $name ~/stored_challenges/private/docker
    rm -R ~/tmp/*

else
    echo "No files found"
fi