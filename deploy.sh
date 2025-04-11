#!/bin/bash
echo "Deployment Branch: $BRANCH_NAME"

# Stop and remove existing container if it exists
docker stop my-don-container || true
docker rm my-don-container || true

# Deploy based on the branch
if [ "$BRANCH_NAME" == "dev" ]; then
  docker pull mukundhan20/dev:latest
  docker run -d -p 80:80 --name my-don-container mukundhan20/dev:latest

elif [ "$BRANCH_NAME" == "main" ]; then
  docker pull mukundhan20/prod:latest
  docker run -d -p 80:80 --name my-don-container mukundhan20/prod:latest
fi

