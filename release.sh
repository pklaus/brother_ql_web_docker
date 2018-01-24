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

for folder in resin-raspberry-pi-alpine-3.6 alpine-3.7
do
  cd ${folder}
  TAG=${USER}/${REPOSITORY}:${folder}_${SHORT_COMMIT}
  docker build -t ${TAG} --squash .
  docker push ${TAG}
  cd -
done

# Tag the last built image "latest". It should be the default one. 
IMAGE=$(docker images -q ${TAG})
docker tag ${IMAGE} ${USER}/${REPOSITORY}:latest
docker push ${USER}/${REPOSITORY}:latest
