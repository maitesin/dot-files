#!/bin/bash

FEEDS=$(podfox feeds | cut -d"|" -f2 | grep -v shortname | grep -v "=" | awk '{print $1}')

for feed in ${FEEDS}
do
    echo "Checking ${feed}"
    podfox update ${feed}
    podfox episodes ${feed} | grep "Not Downloaded" | head -10
    read -p "Do you want to download episodes? (Y/n)" download
    : ${download:="y"}
    if [[ ${download} == "y" ]]
    then
        read -p "How many do you want to download?" howmany
        : ${howmany:=1}
        if [ "${howmany}" -ge "1" ]
        then
            podfox download ${feed} --how-many=${howmany}
        fi
    fi
done    

