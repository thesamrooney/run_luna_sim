
# I'm learning Docker today

for the specific purpose of running ROS applications (right now, simulations) in containers. 
This, in theory, will make development way easier.

## How to run

Run the container 'properly' using a command that looks like:

`docker run -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix [-it] [image_id]`
