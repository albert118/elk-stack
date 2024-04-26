#!/bin/bash
source .env

echo ----------------------------------------
echo Resetting passwords for the default 'elastic' and 'kibana_system' users
echo the kibana password will be automatically added to the kibana keystore
echo ----------------------------------------
echo

read -rp "Skip password reset [y/N] " -t 5 -n 1 response
echo

if [[ $response =~ ^[Yy]$ ]]; then
    echo ----------------------------------------
    echo Skipping password reset
    echo ----------------------------------------
else
    ELASTIC_SYSTEM_PASSWORD=$(echo y | docker compose exec -T elasticsearch bin/elasticsearch-reset-password -su elastic)

    echo
    read -rp "waiting for reset..." -t 2 -n 1 -s
    echo
    echo generated elastic password: $ELASTIC_SYSTEM_PASSWORD

    KIBANA_SYSTEM_PASSWORD=$(echo y | docker compose exec -T elasticsearch bin/elasticsearch-reset-password -su kibana_system)
    
    echo
    read -rp "waiting for reset..." -t 2 -n 1 -s
    echo
    echo persisting to keystore...
    echo

    docker compose exec -T kibana bin/kibana-keystore add elasticsearch.password -x <<< $KIBANA_SYSTEM_PASSWORD
    docker compose exec -T kibana bin/kibana-keystore show elasticsearch.password

    echo ----------------------------------------
    echo Passwords reset, take note of these!
    echo ----------------------------------------
fi


