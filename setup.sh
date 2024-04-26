#!/bin/bash

source .env
scripts_dir=./scripts

$scripts_dir/create-keystores.sh
$scripts_dir/regenerate-kibana-enrollment-token.sh
