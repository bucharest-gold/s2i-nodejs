#!/bin/bash

oc cluster up
oc login -u system:admin

for TAG in $(wget -q https://registry.hub.docker.com/v1/repositories/bucharestgold/centos7-s2i-nodejs/tags -O -  | sed -e 's/[][]//g' -e 's/"//g' -e 's/ //g' | tr '}' '\n'  | awk -F: '{print $3}');
do
  TAGCHANGED=${TAG//./}
  TAGCHANGED=$(echo $TAGCHANGED | awk '{print tolower($0)}')
  oc new-project "project${TAGCHANGED}"
  oc new-app bucharestgold/centos7-s2i-nodejs:${TAG}~https://github.com/bucharest-gold/s2i-nodejs.git
  sleep 150
  oc expose svc/s2i-nodejs
  sleep 60
  echo "================================================================"
  curl $(oc get routes | awk '{print $2}' | grep xip.io)
  printf "\n"
  echo "s2i-nodejs deployed and running with centos-s2i-nodejs:${TAG}."
  echo "================================================================"
done



