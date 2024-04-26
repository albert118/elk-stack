#!/bin/bash
source .env

echo ----------------------------------------
echo Creating node CA
echo ----------------------------------------

caFile=elastic-stack-ca.p12

docker exec -it elasticsearch rm -f $caFile
docker exec -it elasticsearch \
    bin/elasticsearch-certutil ca -s \
    --keysize 4096 --out $caFile --pass $CA_ROOT_PASSWORD
docker exec -it elasticsearch \
    bin/elasticsearch-certutil cert --ca $caFile -s \
    --pass $NODE_PASSWORD --out $CNF_DIR/elastic-certificates.p12

# persist the passwords to the keystore

docker compose exec -T  elasticsearch \
    bin/elasticsearch-keystore add xpack.security.transport.ssl.keystore.secure_password -x <<< $NODE_PASSWORD

docker compose exec -T  elasticsearch \
    bin/elasticsearch-keystore add xpack.security.transport.ssl.truststore.secure_password -x <<< $NODE_PASSWORD
