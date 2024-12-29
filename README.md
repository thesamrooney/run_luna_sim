
# I'm learning Docker today

for the specific purpose of running ROS applications (right now, simulations) in containers. 
This, in theory, will make development way easier.

## Step 1

I'm going to start from the `ros::jazzy-perception-noble⁠` image and extend it to do what I need it to do.

## Step 2

I'm going to create a ros_ws folder and add packages via git repositories. 
To this end, I added some repos as submodules here to fill ros_ws. 
I'll use these with the COPY or MOUNT command in the Dockerfile.

To run this properly, I'll need to install Gazebo Harmonic into the Docker image, and let the GUI connect to my local X server

