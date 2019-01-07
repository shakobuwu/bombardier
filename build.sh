#!/usr/bin/env bash

# Prerequisite
# Make sure you set secret enviroment variables in Travis CI
# DOCKER_USERNAME
# DOCKER_PASSWORD
# API_TOKEN

set -ex

Usage() {
  echo "$0 [rebuild]"
}

image="alpine/bombardier"
repo="codesenberg/bombardier"

latest=`curl -sL -H "Authorization: token ${API_TOKEN}"  https://api.github.com/repos/${repo}/tags |jq -r ".[].name"|head -1`
sum=0
echo "Lastest release is: ${latest}"

tags=`curl -s https://hub.docker.com/v2/repositories/${image}/tags/ |jq -r .results[].name`

for i in ${tags}
do
  if [ ${i} == ${latest} ];then
    sum=$((sum+1))
  fi
done

if [[ ( $sum -ne 1 ) || ( $1 == "rebuild" ) ]];then
  docker build --no-cache --build-arg VERSION=$latest -t ${image}:${latest} .
  status=`docker run --rm -it ${image}:${latest} --help | awk 'NR==1{print $2}' | awk '$1=$1'`
  if [ "${status}" != "bombardier" ]; then exit 1; fi
  docker tag ${image}:${latest} ${image}:latest

  if [[ "$TRAVIS_BRANCH" == "master" ]]; then
    docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
    docker push ${image}:${latest}
    docker push ${image}:latest
  fi

fi
