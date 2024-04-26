#!/bin/bash
echo ----------------------------------------
echo Regenerating enrollment token, you probably missed it the first time anyway...
echo Copy this into the prompt once Kibana has started up
echo ----------------------------------------

docker exec -it elasticsearch bin/elasticsearch-create-enrollment-token -s kibana

echo ----------------------------------------
echo enrollment token generated, please take note of this before continuing
echo ----------------------------------------