#!/bin/bash
# Glastopf Honeypot Deployment Script
echo "Pulling Glastopf image from Docker Hub..."
docker pull honeynet/glastopf

echo "Running Glastopf honeypot on port 80..."
docker run -d -p 80:80 honeynet/glastopf
