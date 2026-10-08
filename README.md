# TurtleBot3 Burger Autonomous Navigation (Nav2 + AMCL)

> An autonomous navigation pipeline for TurtleBot3 Burger in ROS 2 Humble Gazebo simulation using SLAM Toolbox, AMCL localization, Nav2 path planning, and RViz2 visualization.

## 📹 Demo

[![TurtleBot3 Autonomous Navigation Demo](docs/demo.mp4)](docs/demo.mp4)

*Watch the video demonstration of TurtleBot3 Burger navigating autonomously to set goal poses in RViz2.*

---

## ✨ Features

- **2D Mapping**: High-fidelity map generation using `slam_toolbox` in Gazebo simulation.
- **Monte Carlo Localization**: Precise initial pose estimation and particle filter tracking via `AMCL`.
- **Autonomous Path Planning**: Dynamic global and local trajectory generation using `Nav2` (Navigation2).
- **Streamlined Launching**: Single bash execution script (`run_navigation.sh`) configured with relative map resolution paths.
- **Interactive Visualization**: Real-time obstacle costmaps, robot footprint, global plan, and goal setting in `RViz2`.

---

## 💻 Requirements

- **Operating System**: Ubuntu 22.04 LTS (Jammy Jellyfish)
- **ROS 2 Distribution**: ROS 2 Humble Hawksbill
- **Core Packages**:
  - `ros-humble-navigation2`
  - `ros-humble-nav2-bringup`
  - `ros-humble-turtlebot3-gazebo`
  - `ros-humble-turtlebot3-teleop`
  - `ros-humble-slam-toolbox`

---

## 🚀 How to Run

### Step 1: Launch Gazebo Simulation
In a new terminal, export the robot model and launch the standard TurtleBot3 world:
```bash
export TURTLEBOT3_MODEL=burger
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
```

### Step 2: Run Navigation Pipeline
Make the launch script executable and run it while Gazebo is active:
```bash
chmod +x launch/run_navigation.sh
./launch/run_navigation.sh
```

### Step 3: Set Initial Pose in RViz2
1. In the RViz2 window, click the **2D Pose Estimate** button on the top toolbar.
2. Click and drag at the robot's location in Gazebo to align the AMCL particle cloud with the robot.

### Step 4: Confirm Navigation State
Wait for the **Nav2 status indicator** to transition to `Navigation: active`.

### Step 5: Send Autonomous Navigation Goal
1. Click the **Nav2 Goal** button on the RViz2 toolbar.
2. Click and drag a target position and orientation on the map for TurtleBot3 Burger to navigate to autonomously.

---

## 🗺️ How the Map Was Created

1. Launched Gazebo `turtlebot3_world` alongside `slam_toolbox` in online sync mode.
2. Teleoperated the TurtleBot3 Burger across all rooms to build a detailed occupancy grid.
3. Saved the generated map using the `nav2_map_server` map saver CLI:
   ```bash
   ros2 run nav2_map_server map_saver_cli -f maps/burger_map
   ```
4. Output files `burger_map.pgm` (image grid) and `burger_map.yaml` (metadata config) were stored in `maps/`.

---

## 🐛 Known Issues & Troubleshooting

- **Set Initial Pose First**: Autonomous navigation goal planners will reject targets until an initial 2D Pose Estimate is set to ground AMCL particle distributions.
- **Stale Background Processes**: If Gazebo or TF publisher nodes hang, kill leftover processes before relaunching:
  ```bash
  killall -9 gazebo gzserver gzclient robot_state_publisher
  ```
- **RViz Docking Panel Warning**: On ROS 2 Humble, RViz may display a harmless warning regarding missing docking panel plugins. This can be safely ignored as it does not affect navigation functionality.

---

## 🎓 What I Learned

- Hands-on experience configuring ROS 2 costmaps, path planners, and motion controllers in `Nav2`.
- Practical tuning of AMCL particle filter convergence for differential drive mobile robots.
- Integrating map server lifecycle nodes and managing ROS 2 simulation time (`use_sim_time:=True`).
- Building clean, reproducible ROS 2 launch workflows for robotics portfolio demonstrations.
