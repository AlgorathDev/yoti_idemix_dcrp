#!/bin/bash

# Configuration
MASTER_NODE_URL=$1
IP=$2
USER=$3
PASSWORD=$4

CRED_TYPE="cred_gym.json"
TITLE="Gym"
CODE="gym"
LOGO="https://i.pinimg.com/originals/45/02/d1/4502d1f5cbd6bd0baf2a26754407eced.png"
ISSUR_PANEL_PORT=4002
ISSUER_PORT=4012
VERIFIER_PANEL_PORT=4005
VERIFIER_PORT=4015
COLOR="#8B4513"
SECOND_COLOR="#4caf50"

# Run containers
# Issuer
./start_issuer.sh "${CODE}_issuer" \
  $IP \
  $ISSUR_PANEL_PORT \
  $ISSUER_PORT \
  "$LOGO" \
  "$TITLE Issuer Panel" \
  "$COLOR" \
  "$SECOND_COLOR" \
  $CRED_TYPE \
  "$IP:$ISSUER_PORT" \
  "issuer${CODE}session" \
  "PENDING" \
  "$USER" \
  "$PASSWORD" \
  "$MASTER_NODE_URL"

# Verifier
./start_verifier.sh "${CODE}_verifier" \
  "$IP" \
  $VERIFIER_PANEL_PORT \
  $VERIFIER_PORT \
  "$LOGO" \
  "$TITLE Verifier Panel" \
  "$COLOR" \
  "$SECOND_COLOR" \
  $CRED_TYPE \
  "verifier${CODE}session" \
  "false" \
  "$USER" \
  "$PASSWORD" \
  "$MASTER_NODE_URL"
