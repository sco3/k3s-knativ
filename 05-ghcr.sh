#!/bin/bash

source ~/.local/gh-token.sh 
GH_USER="sco3"                  
GH_REPO="hello-knativ"              
IMAGE_NAME="hello-knativ:latest"     

echo "Logging into GitHub Container Registry..."
echo $GH_PAT | docker login ghcr.io -u $GH_USER --password-stdin

echo "Tagging image..."
docker tag $IMAGE_NAME ghcr.io/$GH_USER/$GH_REPO:latest

echo "Pushing image..."
docker push ghcr.io/$GH_USER/$GH_REPO:latest

echo "Done! Image available at ghcr.io/$GH_USER/$GH_REPO:latest"
