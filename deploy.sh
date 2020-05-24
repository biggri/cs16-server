#!/bin/bash

set -u
set -e

RCON_PASS="$1"
CNAME="cs1.6"

if [[ "$#" -gt "1" ]]
then
    echo "Script only accept one argument"
    exit -1
fi

for arg in "$@"
do
    if [ "$arg" == "--help" ] || [ "$arg" == "-h" ]
    then
        echo "Script accepts one argument as the RCON password"
    fi
done

if [[ "$1" -eq "" ||  "$1" -eq " " ]]
then
    RED='\033[0;31m'
    NC='\033[0m'
    printf "${RED}No RCON password detected or its empty. USING default password, Continuing...\n${NC}"
fi

if [[ $(docker ps -f name=${CNAME} -q | wc -l) -ne "1" ]]
then
    printf "Container named ${CNAME} not found, exiting..."
    exit -1
fi

sed -i 's/rcon_password "admin"/rcon_password "${RCON_PASS}"/g' server.cfg

docker pull coquinone/counterstrike-1.6:latest && docker stop ${CNAME} && docker rm ${CNAME}

if [[ -f csstats.dat ]]
then
    printf "1"
    docker run -d -p 27015:27015 -p 27015:27015/udp --name ${CNAME} -v $(pwd)/server.cfg:/home/steam/cs16/cstrike/server.cfg -v $(pwd)/csstats.dat:/home/steam/cs16/cstrike/addons/amxmodx/data/csstats.dat coquinone/counterstrike-1.6:latest
else
    printf "2"
    docker run -d -p 27015:27015 -p 27015:27015/udp --name ${CNAME} -v $(pwd)/server.cfg:/home/steam/cs16/cstrike/server.cfg coquinone/counterstrike-1.6:latest
fi

