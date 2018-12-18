#!/bin/bash

docker stop government_issuer && docker rm government_issuer
docker stop government_verifier && docker rm government_verifier

docker stop bank_issuer && docker rm bank_issuer
docker stop bank_verifier && docker rm bank_verifier

docker stop gym_issuer && docker rm gym_issuer
docker stop gym_verifier && docker rm gym_verifier

docker stop master_node && docker rm master_node
