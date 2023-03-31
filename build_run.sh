#!/bin/bash

your_ms_endpoint=
your_tenant_id=
your_node_name=
your_node_nic="ens160" # Default for Ubuntu 20.04 LTS
your_node_token=

docker-compose build --build-arg MS_ENDPOINT="$your_ms_endpoint" --build-arg TENANT_ID="$your_tenant_id" --build-arg NODE_NAME="$your_node_name" --build-arg NODE_NIC="$your_node_nic" --build-arg NODE_TOKEN="$your_node_token"
docker-compose up -d
