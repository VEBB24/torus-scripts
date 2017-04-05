#!/bin/bash

cd `dirname $0`

docker network create hadoop --subnet=172.28.0.0/16
docker network create redis --subnet=172.29.0.0/16
docker-compose -f ../torus-docker-services/docker-compose.yml up -d

echo "waiting for connection"
sleep 10
echo "Connected"

export HOST_HDFS=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' namenode)
export HOST_REDIS=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' redis)

docker-compose -f ../torus-backend-go/docker-compose.yml up -d
docker-compose -f ../torus-frontend/docker-compose.yml up -d

echo "Launched"
