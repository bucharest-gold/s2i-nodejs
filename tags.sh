#!/bin/bash

oc cluster up
oc login -u system:admin

echo "---> Creating s2i-nodejs build"
oc new-build --binary --name=s2inodejs -l app=s2inodejs

echo "---> Building s2i-nodejs app"
npm install
oc start-build s2inodejs --from-dir=. --follow

echo "---> Starting s2i-nodejs"
oc new-app s2inodejs -l app=s2inodejs
sleep 60
oc expose svc/s2inodejs
sleep 60

echo "=================================================================="
curl $(oc get routes | awk '{print $2}' | grep xip.io)
printf "\n"
echo "---> App deployed and running with centos-s2i-nodejs:latest image."
echo "=================================================================="

#
# This is to make the test with all tags
#
# for TAG in $(wget -q https://registry.hub.docker.com/v1/repositories/bucharestgold/centos7-nodejs/tags -O -  | sed -e 's/[][]//g' -e 's/"//g' -e 's/ //g' | tr '}' '\n'  | awk -F: '{print $3}');
# do
#   TAGCHANGED=${TAG//./}
#   TAGCHANGED=$(echo $TAGCHANGED | awk '{print tolower($0)}')

#   echo "Creating a Dockerfile with the tag: ${TAG}..."
#   echo "FROM bucharestgold/centos7-nodejs:${TAG}" > Dockerfile

#   echo "Creating new project with the tag: ${TAG}..."
#   oc new-project "project${TAGCHANGED}"

#   echo "Creating ${TAG} s2inodejs build..."
#   oc new-build --binary --name=s2inodejs -l app=s2inodejs

#   echo "Building s2inodejs app..."
#   npm install
#   oc start-build s2inodejs --from-dir=. --follow

#   echo "Starting s2inodejs app..."
#   oc new-app s2inodejs -l app=s2inodejs
#   sleep 60
#   oc expose svc/s2inodejs
#   sleep 60

#   echo "================================================================"
#   curl $(oc get routes | awk '{print $2}' | grep xip.io)
#   printf "\n"
#   echo "App deployed and running with centos-s2i-nodejs:${TAG}."
#   echo "================================================================"
# done

