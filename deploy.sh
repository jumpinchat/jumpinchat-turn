#!/bin/bash

IMAGE_TAG=registry.example.com/user/coturn
CONTAINER_NAME=turnserver
EXTERNAL_IP=`curl -s icanhazip.com`

docker pull ${IMAGE_TAG}

# remove previous instance
docker rm -f ${CONTAINER_NAME}

# run new instance
docker run \
    -d \
    --name=${CONTAINER_NAME} \
    --restart="on-failure:10" \
    --net=host \
    -e "EXTERNAL_IP=${EXTERNAL_IP}" \
    -p 3478:3478 \
    -p 3478:3478/udp \
    -p 5349:5349 \
    -p 5349:5349/udp \
    ${IMAGE_TAG}
