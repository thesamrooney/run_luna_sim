FROM ros:jazzy-perception-noble

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
ros-jazzy-ros-gz \
ros-jazzy-ros2-control \
ros-jazzy-ros2-controllers \
ros-jazzy-gz-ros2-control

RUN mkdir /ros2_ws
WORKDIR /ros2_ws
COPY ./ros2_ws/ .

RUN source /opt/ros/jazzy/setup.bash \
&& rosdep install --from-paths src --ignore-src --rosdistro jazzy -y \
&& colcon build --symlink-install

WORKDIR /

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

ENV GZ_SIM_RESOURCE_PATH="$GZ_SIM_RESOURCE_PATH:/ros2_ws/src/"

CMD ["ros2", "launch", "lunabot_2425", "gz_bringup.launch.py"]
