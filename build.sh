#!/bin/bash

# Debug shell script / show all commands executed:
set -x
# Fail if any command fails:
set -e

DOCKER_REPO=pklaus/brother_ql_web
APP_COMMIT=$(git ls-remote -h https://github.com/pklaus/brother_ql_web.git | cut -c 1-40 | cut -c 1-7)

echo "Latest commit in the repository: $APP_COMMIT"

echo "Setting up the docker buildx to cross-compile the application"
# if you want to start with a clean builder, run:
#docker buildx rm brother_ql_web_builder || true
docker buildx inspect brother_ql_web_builder || \
  docker buildx create --name brother_ql_web_builder
docker buildx use brother_ql_web_builder
docker buildx inspect --bootstrap

echo "Building the new Docker image now"
for folder in alpine
do
  cd ${folder}
  docker \
    buildx build \
    --platform linux/amd64,linux/386,linux/arm64/v8,linux/arm/v7,linux/arm/v6 \
    -t ${DOCKER_REPO}:latest \
    -t ${DOCKER_REPO}:${folder}_${APP_COMMIT} \
    . \
    --push
  cd -
done
