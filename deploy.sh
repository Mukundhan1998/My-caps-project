#!/bin/bash

echo "Deployment Branch: $BRANCH_NAME"

docker stop my-don-container || true
docker rm my-don-container || true

if [ "$BRANCH_NAME" == "dev" ]; then
  docker pull mukundhan20/dev:latest
  docker run -d -p 80:80 --name my-don-container mukundhan20/dev:latest

elif [ "$BRANCH_NAME" == "main" ]; then
  docker pull mukundhan20/prod:latest
  docker run -d -p 80:80 --name my-don-container mukundhan20/prod:latest
fi
