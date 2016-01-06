#!/usr/bin/env bash
# Pierrick VERAN - Tardigrade Security Challenge - 06/01/2015

if ls ~/nv_challenges/validated/storage_priv/* > /dev/null 2>&1
then
    echo "One file found"
    name=$(ls ~/nv_challenges/validated/storage_priv/*)
    echo "Moving file $name to ~/stored_challenges/private/file/"
    mv $name ~/stored_challenges/private/file/

else
    echo "No files found"
fi