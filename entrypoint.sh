#!/bin/bash
set -e

# setup ros2 environment
source "/opt/ros/$ROS_DISTRO/setup.bash" --
source "/ros2_ws/install/setup.bash" --

# Enable verbose logging for Gazebo (optional, for debugging)
export GZ_SIM_VERBOSE=1

# Check OpenGL support
if glxinfo | grep -q "OpenGL version"; then
  echo "OpenGL support detected."
else
  echo "Warning: OpenGL support not detected. Gazebo GUI may fail."
fi

exec "$@"
