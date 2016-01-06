#!/usr/bin/env bash
# Pierrick VERAN - Tardigrade Security Challenge - 06/01/2015

if ls ~/nv_challenges/validated/storage_pub/* > /dev/null 2>&1
then
    echo "One file found"
    name=$(ls ~/nv_challenges/validated/storage_pub/*)
    echo "Moving file $name to ~/stored_challenges/public/file/ "
    mv $name ~/stored_challenges/public/file/

else
    echo "No files found"
figit