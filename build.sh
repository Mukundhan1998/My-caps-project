#!/bin/bash
echo "Current Branch: $BRANCH_NAME"

if [ "$BRANCH_NAME" == "dev" ]; then
  docker build -t mukundhan20/dev .
  echo "Mukundhan*+12" | docker login -u "mukundhan20" --password-stdin
  docker push mukundhan20/dev:latest

elif [ "$BRANCH_NAME" == "main" ]; then
  docker build -t mukundhan20/prod .
  echo "Mukundhan*+12" | docker login -u "mukundhan20" --password-stdin
  docker push mukundhan20/prod:latest