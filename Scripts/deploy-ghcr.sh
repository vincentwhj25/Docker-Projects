#!/bin/bash

set -e

IMAGE_NAME="ghcr.io/vincentwhj25/docker-projects/my-nginx:latest"
CONTAINER_NAME="myweb"
HOST_PORT="8080"
CONTAINER_PORT="80"

echo "Pulling latest image from GHCR..."
docker pull ${IMAGE_NAME}

echo "Stopping old container if exists..."
docker stop ${CONTAINER_NAME} 2>/dev/null || true

echo "Removing old container if exists..."
docker rm ${CONTAINER_NAME} 2>/dev/null || true

echo "Starting new container..."
docker run -d \
  --name ${CONTAINER_NAME} \
  -p ${HOST_PORT}:${CONTAINER_PORT} \
  ${IMAGE_NAME}

echo "Deployment completed."
docker ps --filter "name=${CONTAINER_NAME}"
