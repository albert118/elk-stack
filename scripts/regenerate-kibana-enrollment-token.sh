#!/bin/bash

docker exec -it elasticsearch \
    /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana