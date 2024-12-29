FROM ros:jazzy-perception-noble

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y ros-jazzy-ros-gz


RUN mkdir /ros2_ws
WORKDIR /ros2_ws

COPY ./ros2_ws/ .

RUN source /opt/ros/jazzy/setup.bash \
&& apt-get update -y \
&& rosdep install --from-paths src --ignore-src --rosdistro jazzy -y

RUN colcon build --symlink-install

RUN source install/setup.bash

WORKDIR /