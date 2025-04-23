#!/bin/bash
set -e

# Enable X11 access for Docker
xhost +local:docker

# Run Docker container with X11, GPU, and network support
docker run -it \
  --env DISPLAY=$DISPLAY \
  --volume /tmp/.X11-unix:/tmp/.X11-unix \
  --device /dev/dri:/dev/dri \
  --network host \
  $1

# Revoke X11 access after container stops
xhost -local:docker