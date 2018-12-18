#!/bin/bash

IP=$1

START_PORT=8000
NUM_NODES=100

COUNTER=0
while [ $COUNTER -lt $NUM_NODES ]; do
    echo 'Running node '$COUNTER
    let MEMBERSHIP_PORT=START_PORT+NUM_NODES

    if [ $COUNTER -eq 0 ]
    then
        echo ./start_master_node.sh $IP $START_PORT $MEMBERSHIP_PORT mn${COUNTER}
        ./start_master_node.sh $IP $START_PORT $MEMBERSHIP_PORT mn${COUNTER}
    else
        let PREVIOUS_MEMBERSHIP_PORT=MEMBERSHIP_PORT-1
        echo ./start_master_node.sh $IP $START_PORT $MEMBERSHIP_PORT mn${COUNTER} $IP:$PREVIOUS_MEMBERSHIP_PORT
        ./start_master_node.sh $IP $START_PORT $MEMBERSHIP_PORT mn${COUNTER} $IP:$PREVIOUS_MEMBERSHIP_PORT
    fi

    let COUNTER=COUNTER+1
    let START_PORT=START_PORT+1
    sleep .5 # wait the previous node is deployed
done