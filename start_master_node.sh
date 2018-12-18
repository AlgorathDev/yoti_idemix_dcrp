#!/bin/bash

ADDRESS=$1
WEB_PORT=$2
MEMBERSHIP_PORT=$3
CONTAINER_NAME=$4
NODE_CONNECTION=$5

if [[ -z "$CONTAINER_NAME" ]]; then
  CONTAINER_NAME="master_node"
fi

docker run --name $CONTAINER_NAME \
    -p $WEB_PORT:$WEB_PORT \
    -p $MEMBERSHIP_PORT:$MEMBERSHIP_PORT \
    -e NETWORK_PORT=$MEMBERSHIP_PORT \
    -e NETWORK_ADDRESS=$ADDRESS \
    -e SERVICE_PORT=$WEB_PORT \
    -e NODE_CONNECTION=$NODE_CONNECTION \
    -d eu.gcr.io/yoti-blockchain/master_node:latest
