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

# Running [SVO 2.0](http://rpg.ifi.uzh.ch/svo2.html) in a docker container

## Description
This repository allows to run [SVO 2.0](https://github.com/uzh-rpg/rpg_svo_example/) in a docker container. While SVO runs in a container, input images are supplied running `rosbag play` on the host. **Please note that source code of certain libraries is not available. We download these libraries from a link provided by the authors.**

## Dependencies
* Docker
* ROS

## Installation
```
git clone https://gitlab.com/jcremona/svo-2.0.git 
cd svo-2.0
sudo make image   # Build docker image
```

## Usage
Run:
```
sudo make shell   # Open shell in the container
```
Then, run SVO using a launch file:
```
roslaunch svo_ros rosario_stereo_imu.launch
```

# Binaries changelog
**22.01.2018** Update 16.04 binaries to OpenCV 3.3.1

**29.09.2017** Add binaries for `armhf` (14.04 + `indigo`)

**17.07.2017** Initial Release
