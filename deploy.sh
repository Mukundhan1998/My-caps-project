#!/bin/bash
docker pull mukundhan20/devops-app:dev
docker run -d -p 80:80 mukundhan20/devops-app:dev