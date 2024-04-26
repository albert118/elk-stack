#!/bin/bash
source .env

echo Creating persisted elasticsearch keystore in config directory $CNF_DIR

docker run -it --rm \
    -v $CNF_DIR:/usr/share/elasticsearch/config \
    docker.elastic.co/elasticsearch/elasticsearch:$STACK_VERSION \
    bin/elasticsearch-keystore create $ES_KEYSTORE_PASSWORD

echo Creating persisted kibana keystore in config directory $CNF_DIR

docker run -it --rm \
    -v $CNF_DIR:/usr/share/kibana/config \
    docker.elastic.co/kibana/kibana:$STACK_VERSION \
    bin/kibana-keystore create $KIBANA_KEYSTORE_PASSWORD

found=$(find $CNF_DIR/*.keystore )
echo Finished, directory now contains $found