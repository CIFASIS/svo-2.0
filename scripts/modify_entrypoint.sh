#!/bin/bash

sed -i '/exec "$@"/i \
            source "$CATKIN_WS/devel/setup.bash"' /ros_entrypoint.sh