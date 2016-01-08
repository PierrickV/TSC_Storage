#!/usr/bin/env bash
# Pierrick VERAN - Tardigrade Security Challenge - 06/01/2015
# mkdir -p ~/nv_challenges/{validated,non_validated}/{public,private}/{file,docker}
# mkdir -p ~/stored_challenges/{public,private}/{file,docker}
# mkdir -p ~/tmp/

# Public docker images
echo "Check for public docker images"
if ls ~/nv_challenges/validated/public/docker/* > /dev/null 2>&1
then
    echo "One file found"

    #Extract
    name=$(ls ~/nv_challenges/validated/public/docker/*)
    echo "Unzip file $name"
    unzip $(ls ~/nv_challenges/validated/public/docker/* | grep zip) -d ~/tmp/

    #Build
    tmp_name=$(ls ~/tmp/)
    echo " Build of file $tmp_name"
    cd ~/tmp/$tmp_name
    docker build -t challenges/$tmp_name:latest .

    docker tag -f challenges/$tmp_name 10.8.97.6:5000/challenges/$tmp_name:latest
    # docker push tsc.itinet.fr/5000/$tmp_name:latest

    #Clean
    echo "Deleting temporary files"
    echo "Moving file $name to ~/stored_challenges/public/docker "
    sudo mv $name ~/stored_challenges/public/docker/
    sudo rm -R ~/tmp/*

else
    echo "No files found"
fi

# Private docker images
echo "Check for private docker images"
if ls ~/nv_challenges/validated/private/docker/* > /dev/null 2>&1
then
    echo "One file found"
    #Extract
    name=$(ls ~/nv_challenges/validated/docker/*)
    echo "Unzip file $name"
    unzip $(ls ~/nv_challenges/validated/private/docker/* | grep zip) -d ~/tmp/

    #Build
    name=$(ls ~/tmp/)
    echo " Build of file $name"
    cd ~/tmp/$name
    docker build -t challenges/$name:latest .

    docker tag -f challenges/$name 10.8.97.6:50/challenges/$name:latest
    # docker push 10.8.97.6:50/$name:latest

    #Clean
    echo "Deleting temporary files"
    name=$(ls ~/nv_challenges/validated/private/docker/*)
    echo "Moving file $name to ~/stored_challenges/private/docker/ "
    mv $name ~/stored_challenges/private/docker
    rm -R ~/tmp/*

else
    echo "No files found"
fi

# Public challenges file
echo "Check for public challenges file"
if ls ~/nv_challenges/validated/public/file/* > /dev/null 2>&1
then
    echo "One file found"
    name=$(ls ~/nv_challenges/validated/public/file/*)
    echo "Moving file $name to ~/stored_challenges/public/file/ "
    mv $name ~/stored_challenges/public/file/

else
    echo "No files found"
fi

# Private challenges file
echo "Check for private challenges file"
if ls ~/nv_challenges/validated/private/file/* > /dev/null 2>&1
then
    echo "One file found"
    name=$(ls ~/nv_challenges/validated/private/file/*)
    echo "Moving file $name to ~/stored_challenges/private/file/"
    mv $name ~/stored_challenges/private/file/

else
    echo "No files found"
fi