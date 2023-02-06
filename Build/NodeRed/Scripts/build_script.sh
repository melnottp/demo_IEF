#!/bin/bash -x

DOCKER_CURRENT_PATH=`pwd`
DOCKER_BUILD_PATH="$(dirname $DOCKER_CURRENT_PATH)"
DOCKER_PARENT_PATH="$(dirname $DOCKER_BUILD_PATH)"
DOCKER_DEPLOYMENT_PATH=`echo $DOCKER_PARENT_PATH/Deployment` 

echo "#####################################################"
echo "#"
echo "# DOCKER BUILD PATH : $DOCKER_BUILD_PATH"
echo "# DOCKER DEPLOYMENT PATH : $DOCKER_DEPLOYMENT_PATH"
echo "# DOCKER PARENT PATH : $DOCKER_PARENT_PATH"
echo "#"

echo "#####################"
echo "# 1. DOCKER BUILD   #"
echo "#####################"

docker build --no-cache -t enamhee/lo2fe:0.15 -t enamhee/lo2fe:latest $DOCKER_BUILD_PATH

read -p "Hit Enter to continue" dd

echo "#####################"
echo "# 2. DOCKER PUSH    #"
echo "#####################"

docker push enamhee/lo2fe

read -p "Hit Enter to continue" dd

echo "#####################"
echo "# 3. KUBECTL DEPLOY #"
echo "#####################"

cd $DOCKER_DEPLOYMENT_PATH

kubectl delete service/lo2fe deployment.apps/lo2fe
kubectl create -f lo2fe-deployment.yaml -f lo2fe-service.yaml