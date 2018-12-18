# Yoti Idemix DCRP

This repository contains the scripts to run a DCRP (Distributed Cryptographic Routing Protocol) network with Idemix issuers and verifiers.

### Installation steps

The scripts use [Docker](https://www.docker.com/) to deploy all services. Please, install it before running the scripts.

1. Clone this repository and navigate to its root folder.
2. Run the script `start.sh`.

The script needs three parameters:

1. The IP address where the service will be deployed. It's the address the other nodes needs to know to reach your node.
2. Idemix user name. It's the name to log in inside the Idemix panels (Default: admin).
3. Idemis user password. It's the password to log in inside the Idemix panels (Default: yotiadmin).

Parameters 2 and 3 are not required.

This is an example how the command should be executed:

```
./start.sh 192.168.1.20 myuser mypassword
```

This script will deploy a node that will run the membership for DCRP network, 3 issuers and 3 verifiers.

|         App         |              Port              |
|:--------------------|:------------------------------:|
| Node front-end      | [8080](http://localhost:8080/) |
| Node                |              8181              |
| Issuer1 front-end   | [4000](http://localhost:4000/) |
| Issuer1             |              4010              |
| Issuer2 front-end   | [4001](http://localhost:4001/) |
| Issuer2             |              4011              |
| Issuer3 front-end   | [4002](http://localhost:4002/) |
| Issuer3             |              4012              |
| Verifier1 front-end | [4003](http://localhost:4003/) |
| Verifier1           |              4013              |
| Verifier2 front-end | [4004](http://localhost:4004/) |
| Verifier2           |              4014              |
| Verifier3 front-end | [4005](http://localhost:4005/) |
| Verifier3           |              4015              |

### Deploy a master node

The script `start_master_node.sh` will deploy a master node. This node won't have any service. Use this script to test the network in your local machine.

The script needs 5 arguments:

1. The IP address where the service will be deployed. It's the address the other nodes needs to know to reach your node.
2. The port where the front-end will be deployed.
3. The port where the node will be deployed.
4. The Docker container name (Default: master_node).
5. The node addresses the current master node will try to connect automatically when it is deployed.

The agruments 4 and 5 are not required.

Following an example that a node that will connect with the node deployed in previous section:

```
./start_master_node.sh 192.168.1.20 8888 8989 master_node_2 192.168.1.20:8181
```

### Test 100 nodes

The script `run_100_nodes.sh` will deploy 100 nodes without any service. This is a way to test the network in your local machine.

The script will take the ports from 8000 to 8199 to deploy the node and the front-end applications. It only needs the user provides the IP address where the service will be deployed. For example:

```
./run_100_nodes.sh 192.168.1.20
```
