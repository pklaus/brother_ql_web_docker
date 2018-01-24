#!/bin/bash

# Debug shell script / show all commands executed:
set -x
# Fail if any command fails:
set -e

USER=pklaus
REPOSITORY=brother_ql_web
COMMIT=$(git ls-remote -h https://github.com/pklaus/brother_ql_web.git | cut -c 1-40)
SHORT_COMMIT=$(echo $COMMIT | cut -c 1-7)

echo "Latest commit in the repository: $SHORT_COMMIT ($COMMIT)"

cd resin-raspberry-pi-alpine-3.6 
  # RPi3
  sed -i 's|FROM resin/raspberry-pi-alpine:3.6|#FROM resin/raspberry-pi-alpine:3.6|' Dockerfile
  sed -i 's|#FROM resin/raspberrypi3-alpine:3.6|FROM resin/raspberrypi3-alpine:3.6|' Dockerfile
  TAG=${USER}/${REPOSITORY}:resin-raspberrypi3-alpine-3.6_${SHORT_COMMIT}
  docker build -t ${TAG} --squash .
  docker push ${TAG}
  sed -i 's|#FROM resin/raspberry-pi-alpine:3.6|FROM resin/raspberry-pi-alpine:3.6|' Dockerfile
  sed -i 's|FROM resin/raspberrypi3-alpine:3.6|#FROM resin/raspberrypi3-alpine:3.6|' Dockerfile
  # RPi2 (base image identical to RPi3!)
  IMAGE=$(docker images -q ${TAG})
  TAG=${USER}/${REPOSITORY}:resin-raspberry-pi2-alpine-3.6_${SHORT_COMMIT}
  docker tag ${IMAGE} ${TAG}
  docker push ${TAG}
  # RPi1 / Zero / Zero W
  TAG=${USER}/${REPOSITORY}:resin-raspberry-pi-alpine-3.6_${SHORT_COMMIT}
  docker build -t ${TAG} --squash .
  docker push ${TAG}
cd -

for folder in alpine-3.7
do
  cd ${folder}
  TAG=${USER}/${REPOSITORY}:${folder}_${SHORT_COMMIT}
  docker build -t ${TAG} --squash .
  docker push ${TAG}
  cd -
done

# Tag the last built image "latest". It should be the default one. 
IMAGE=$(docker images -q ${TAG})
TAG=${USER}/${REPOSITORY}:latest
docker tag ${IMAGE} ${TAG}
docker push ${TAG}
