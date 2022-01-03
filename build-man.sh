#!/bin/bash

set -e

# setup
echo "=> Starting setup."
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker buildx rm builder
docker buildx create --name builder --driver docker-container --use
docker buildx inspect --bootstrap

echo "=> Starting builds."

#linux/amd64,linux/arm64,linux/arm/v7

# base image
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t maxkratz/texlive:base --push .

# latest + 2021
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t maxkratz/texlive:2021 -t maxkratz/texlive:latest --push . -f ./2021/Dockerfile

# legacy images
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t maxkratz/texlive:2020 --push . -f ./2020/Dockerfile
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t maxkratz/texlive:2019 --push . -f ./2019/Dockerfile
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t maxkratz/texlive:2018 --push . -f ./2018/Dockerfile
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t maxkratz/texlive:2017 --push . -f ./2017/Dockerfile
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t maxkratz/texlive:2016 --push . -f ./2016/Dockerfile

echo "=> Build and push finished."
