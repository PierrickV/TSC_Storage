#!/usr/bin/env bash
# Pierrick VERAN - Tardigrade Security Challenge - 06/01/2015

if ls ~/nv_challenges/validated/docker_pub/* > /dev/null 2>&1
then
    echo "One file found"

    #Extract
    name=$(ls ~/nv_challenges/validated/docker_pub/*)
    echo "Unzip file $name"
    unzip $(ls ~/nv_challenges/validated/docker_pub/* | grep zip) -d ~/tmp/

    #Build
    name=$(ls ~/tmp/)
    echo " Build of file $name"
    cd ~/tmp/$name
    docker build -t challenges/$name:latest .

    docker tag -f challenges/$name 10.8.97.6:5000/challenges/$name:latest
    # docker push 10.8.97.6:5000/$name:latest

    #Clean
    echo "Deleting temporary files"
    name=$(ls ~/nv_challenges/validated/docker_pub/*)
    echo "Moving file $name to ~/stored_challenges/public/docker "
    mv $name ~/stored_challenges/public/docker
    rm -R ~/tmp/*

else
    echo "No files found"
fi