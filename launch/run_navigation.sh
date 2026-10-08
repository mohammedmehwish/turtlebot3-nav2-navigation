#!/usr/bin/env bash
# Usage: ./run_navigation.sh   (Gazebo must already be running)
source /opt/ros/humble/setup.bash
export TURTLEBOT3_MODEL=burger
ros2 launch turtlebot3_navigation2 navigation2.launch.py \
  use_sim_time:=True \
  map:="$(dirname "$0")/../maps/burger_map.yaml"
