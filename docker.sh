#!/bin/bash
buildDockerImage() {
    echo "Looking for existing Docker image:";
    existingImage=`docker image ls | grep hadi_cypress`

    if [ -z "$existingImage" ]; then
        echo "Building Docker Image";
        docker-compose -f docker/docker-compose.yml build --no-cache
    fi
}
runDockerContainer() {
    output=`uname -a`

    echo "Building and running the container";
    if [[ output = *"darwin"* ]]; then
        docker-compose -f docker/docker-compose.mac.yml up -d --remove-orphans
        docker-compose -f docker/docker-compose.mac.yml exec node_hadi_cypress bash
    else
        docker-compose -f docker/docker-compose.yml up -d --remove-orphans
        docker-compose -f docker/docker-compose.yml exec node_hadi_cypress bash
    fi
}
shutdownDockerContainer() {
    output=`uname -a`

    echo "Building and running the container";
    if [[ output = *"darwin"* ]]; then
        docker-compose -f docker/docker-compose.mac.yml down
    else
        docker-compose -f docker/docker-compose.yml down
    fi
}
echo "Initialising Docker Script...";
case "$1" in
    up)
        buildDockerImage;
        runDockerContainer;
        ;;

    down)
        shutdownDockerContainer;
        ;;

    *)
    echo $"Usage: $0 {up|down}"
    exit 1
esac