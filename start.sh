IP=$1
IDEMIX_USER=$2
IDEMIX_PASSWORD=$3

MASTER_NODE_WEB_PORT=8080
MASTER_NODE_PORT=8181
MASTER_NODE_URL="http://$IP:$MASTER_NODE_WEB_PORT/"

docker pull eu.gcr.io/yoti-blockchain/issuer_panel
docker pull eu.gcr.io/yoti-blockchain/verifier_panel
docker pull eu.gcr.io/yoti-blockchain/master_node

./start_master_node.sh $IP $MASTER_NODE_WEB_PORT $MASTER_NODE_PORT
./start_government.sh $MASTER_NODE_URL $IP $IDEMIX_USER $IDEMIX_PASSWORD
./start_bank.sh $MASTER_NODE_URL $IP $IDEMIX_USER $IDEMIX_PASSWORD
./start_gym.sh $MASTER_NODE_URL $IP $IDEMIX_USER $IDEMIX_PASSWORD