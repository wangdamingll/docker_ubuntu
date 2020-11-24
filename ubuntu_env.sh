#! /bin/bash

DOCKERFILE="Dockerfile_ENV"
BUILD_DIR="."
CONTAINER_NAME="ubuntu18.04"
IMAGE_NAME="wangdamingll/ubuntu"
IMAGE_TAG="ubuntu_env"

case $1 in
  build)
	echo "rmi image $IMAGE_NAME:$IMAGE_TAG"
	docker rmi $IMAGE_NAME:$IMAGE_TAG
	echo "build image $IMAGE_NAME:$IMAGE_TAG"
	docker build -f $DOCKERFILE  -t="$IMAGE_NAME:$IMAGE_TAG" $BUILD_DIR
	;;
  pull)
	echo "pull image $IMAGE_NAME:$IMAGE_TAG"
	docker pull $IMAGE_NAME:$IMAGE_TAG
	;;
  push)
	echo "push image $IMAGE_NAME:$IMAGE_TAG"
	docker push $IMAGE_NAME:$IMAGE_TAG
	;;
  run)
	echo "run container $CONTAINER_NAME"
	docker run -ti --name $CONTAINER_NAME  $IMAGE_NAME:$IMAGE_TAG
	;;
  start)
	echo "start container $CONTAINER_NAME"
	docker start $CONTAINER_NAME
	docker attach $CONTAINER_NAME
	;;
  stop)
	echo "stop container $CONTAINER_NAME"
	docker stop $CONTAINER_NAME
	;;
  rm)
	echo "rm container $CONTAINER_NAME"
	docker rm -v $CONTAINER_NAME
	;;
  rmi)
	echo "rmi image $IMAGE_NAME:$IMAGE_TAG"
	docker rmi $IMAGE_NAME:$IMAGE_TAG
	;;
  -h|-help|--h|--help)
	echo "ubuntu_env.sh help:./ubuntu_env.sh build|pull|push|run|start|stop"
	echo "build:build image"
	echo "pull:pull image"
	echo "push:push image"
	echo "run:run container"
	echo "start:start container"
	echo "stop:stop container"
	echo "rm:rm container"
	echo "rmi:rm image"
	echo "-h|-help|--h|--help:help info"
	;;
  *)
	echo "command error"
	echo "ubuntu_env.sh -help"
	;;
esac
