## Original repository
This repository is a modified version of [rpg_svo_example](https://github.com/uzh-rpg/rpg_svo_example) (see original README below). We facilitate the installation process and the use of Docker.

## Docker support

In order to facilitate the installation process, the system is wrapped up using Docker.
We provide scripts to create a Docker image, build the system and run it in a Docker container. 

### Dependencies 
* Docker
* ROS
* [`pose_listener`](https://github.com/CIFASIS/pose_listener) (if you use `run_rosario_sequence.sh`, see below)

### Building the system
Run:
```
./run.sh -b
```

This command creates a Docker image, installs all the dependencies and builds the system. The resulting image contains a version of the system ready to be run.

### Running the system in VIS mode
If you are not interested in making changes in the source code, you should run the system in VIS mode. Run:
```
./run.sh -v
```
The system is launched in a Docker container based on the previously built image. By default, this command executes a launch file which is configured to run the Rosario dataset. If you want to run your own dataset, **write a launch file and placed it in** `svo_ros/launch/`. Calibration files must be placed in `svo_ros/calib/` and configuration files must be placed in `svo_ros/param/`. Then, run the script with the option `-l <LAUNCH_FILE_NAME>`. For example, if you are testing EuRoC, write `euroc_dataset.launch`, move it into `svo_ros/launch/` and type:
```
./run.sh -v -l euroc_dataset.launch
```
Making changes in launch/calibration/configuration files in the host is possible because these folders are mounted into the Docker container. It is not necessary to access the container through a bash shell to modify these files.

See below for information about input data and visualization.

### Running the system in DEV mode
DEV mode allows developers to make changes in the source code, recompile the system and run it with the modifications. To do this, the whole repository is mounted in a container. Run:
```
./run.sh -d
```
This opens a bash shell in a docker container. You can edit source files in the host and after that you can use this shell to recompile the system. When the compilation process finishes, you can run the method using `roslaunch`.

See below for information about input data and visualization.

### Input data and visualization

At this point, the system is waiting for input data. Either you can run `rosbag play` or you can use `run_rosario_sequence.sh`.
If you choose the latter, open a second terminal and run:
```
./run_rosario_sequence.sh -o <OUTPUT_TRAJECTORY_FILE> <ROSBAG_FILE>
```
In contrast to what `run.sh` does, `run_rosario_sequence.sh` executes commands in the host (you can modify it to use a Docker container). 

`ROSBAG_FILE` is played using `rosbag`. Also, make sure you have cloned and built `pose_listener` in your catkin workspace. Default path for the workspace is `${HOME}/catkin_ws`, set `CATKIN_WS_DIR` if the workspace is somewhere else (e.g.: `export CATKIN_WS_DIR=$HOME/foo_catkin_ws`). `pose_listener` saves the estimated trajectory in `<OUTPUT_TRAJECTORY_FILE>` (use absolute path). You can edit `run_rosario_sequence.sh` if you prefer to save the trajectory using your own methods. Additionally, `run_rosario_sequence.sh` launches `rviz` to display visual information during the execution of the system.

Alternatively, if you are not interested in development but in testing or visualization, instead of running `run.sh` and `run_rosario_sequence.sh` in two different terminals, you can just run:
```
./run_rosario_sequence.sh -r -o <OUTPUT_TRAJECTORY_FILE> <ROSBAG_FILE>
```
This launches a Docker container and executes the default launch file (see `LAUNCH_FILE` in `run.sh`). After that, the bagfile is played and `rviz` and `pose_listener` are launched. Add `-b` if you want to turn off the visualization.

# Original README

This repository contains examples to use `SVO 2.0` binaries in various configurations:
* monocular
* stereo
* stereo/monocular + IMU
* pinhole/fisheye/catadioptric cameras are supported

For detailed instructions, please refer to the documentation under `rpg_svo_example/svo_ros/doc`.
We provide several launch files under `rpg_svo_example/svo_ros/launch` for different datasets, including the [EuRoC](http://projects.asl.ethz.ch/datasets/doku.php?id=kmavvisualinertialdatasets) datasets.
These can be used as a reference for customization according to specific needs.

To use `SVO 2.0` as a binary form, you need to request the binaries of `SVO 2.0` from [here](http://rpg.ifi.uzh.ch/svo2.html).
The binaries you get already include a copy of this repository, therefore they are self-contained.

This repository will also be used for the following purposes:
* Keep track of the update of the binaries
* Add new launch files and example code to use the binaries

If the binaries are updated, you can download the new version from the original links in the email you received.

**ARM binaries**: You can replace the file name in the download link with `svo_binaries_1404_indigo_armhf.zip` to get the link for the `armhf` binaries.

**If you have any problem regarding using `SVO 2.0` binaries,
you can either start an issue or contact Zichao Zhang (zzhang AT ifi DOT uzh DOT ch).**

# Binaries changelog
**22.01.2018** Update 16.04 binaries to OpenCV 3.3.1

**29.09.2017** Add binaries for `armhf` (14.04 + `indigo`)

**17.07.2017** Initial Release
