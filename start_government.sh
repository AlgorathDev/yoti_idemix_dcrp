#!/bin/bash

# Configuration
MASTER_NODE_URL=$1
IP=$2
USER=$3
PASSWORD=$4

CRED_TYPE="cred_government.json"
TITLE="Government"
CODE="government"
LOGO="https://www.yoti.com/images/logo.svg"
ISSUR_PANEL_PORT=4000
ISSUER_PORT=4010
VERIFIER_PANEL_PORT=4003
VERIFIER_PORT=4013
COLOR="#1769aa"
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
