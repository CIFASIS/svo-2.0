FROM ros:kinetic-perception

RUN apt-get update && \
    apt-get install -y ros-kinetic-rviz ros-kinetic-rqt dbus wget unzip \
    python-pip && \
    pip install catkin-tools==0.3.1 && \
    rm -rf /var/lib/apt/lists/*

ENV CATKIN_WS=/root/catkin_ws

COPY ./svo_ros $CATKIN_WS/src/svo_ros
COPY ./svo_install_ws /root/svo_install_ws
COPY ./scripts/ $CATKIN_WS
ENV TERM xterm

WORKDIR $CATKIN_WS

RUN ["/bin/bash", "-c", "chmod +x build.sh && chmod +x modify_entrypoint.sh && sync && ./build.sh && ./modify_entrypoint.sh"]
# Exec-form of RUN (because "source" command is used")
# RUN ["/bin/bash","-c", "wget http://rpg.ifi.uzh.ch/svo2/svo_binaries_1604_kinetic.zip && \
#      unzip svo_binaries_1604_kinetic.zip && \
#      mv /svo_binaries_1604_kinetic/svo_install_ws /root/ && \
#      rm -rf /svo_binaries_1604_kinetic* && \
#      cd /root/svo_install_ws && ./fix_path.sh && \
#      source /root/svo_install_ws/install/setup.sh && \
#      cd /root/svo_install_overlay_ws && \
#      catkin config --init --mkdirs --cmake-args -DCMAKE_BUILD_TYPE=Release && \
#      catkin build"]
