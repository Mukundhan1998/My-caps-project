#!/bin/bash
IMAGE_NAME="mukundhan20/devops-app"
TAG="dev"

docker build -t $IMAGE_NAME:$TAG .
docker push $IMAGE_NAME:$TAG