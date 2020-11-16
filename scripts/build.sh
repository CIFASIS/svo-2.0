#!/bin/bash

source /opt/ros/kinetic/setup.bash
cd /root/svo_install_ws
./fix_path.sh
source /root/svo_install_ws/install/setup.sh
cd $CATKIN_WS
catkin config --init --mkdirs --cmake-args -DCMAKE_BUILD_TYPE=Release
catkin build