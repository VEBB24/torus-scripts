#!/bin/bash

cd `dirname $0`

docker network create hadoop --subnet=172.28.0.0/16
docker network create redis --subnet=172.29.0.0/16
docker-compose -f ../torus-docker-services/docker-compose.yml up -d
docker-compose -f ../torus-backend-go/docker-compose.yml up -d
docker-compose -f ../torus-frontend/docker-compose.yml up -d

echo "Launched"
