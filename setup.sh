#!/bin/bash
source .env
scripts=./scripts

docker compose down -v

$scripts/create-keystores.sh

echo Initial container start pending...

docker compose up -d
read -r -p "Waiting a few seconds for compose startup (press any key to continue immediately)" -t 5 -n 1 -s

$scripts/reset-password.sh

echo Restarting to test auth config...
docker compose down
docker compose up -d

read -r -p "Waiting a few seconds for compose restart - this will take longer for first time setup (press any key to continue immediately)" -t 10 -n 1 -s
echo 
$scripts/regenerate-enrollment-token.sh

echo Setup complete!

