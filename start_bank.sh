#!/bin/bash

# Configuration
MASTER_NODE_URL=$1
IP=$2
USER=$3
PASSWORD=$4

CRED_TYPE="cred_bank.json"
TITLE="Bank"
CODE="bank"
LOGO="https://i.imgur.com/w0FRb6c.png"
ISSUR_PANEL_PORT=4001
ISSUER_PORT=4011
VERIFIER_PANEL_PORT=4004
VERIFIER_PORT=4014
COLOR="#B22222"
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
