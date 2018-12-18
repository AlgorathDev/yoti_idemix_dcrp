#!/bin/bash

NUM_NODES=100

COUNTER=0
while [ $COUNTER -lt $NUM_NODES ]; do
    docker stop mn${COUNTER}
    docker rm mn${COUNTER}
    let COUNTER=COUNTER+1
done