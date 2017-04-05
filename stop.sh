#!/bin/bash

docker-compose -f ../torus-docker-services/docker-compose.yml down
docker-compose -f ../torus-backend-go/docker-compose.yml down
docker-compose -f ../torus-frontend/docker-compose.yml down

docker network rm hadoop
docker network rm redis
