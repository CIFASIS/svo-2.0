# Fetch dataset from http://rpg.ifi.uzh.ch/datasets
# The dataset must be in a subdirectory and contain two files:
# data.bag.tar.gz and calibration.yaml .
# data.bag.tar.gz MUST extract to data.bag
# 
# Datasets that have already been fetched are not re-fetched.
# The datasets are fetched to ~/.rpg_datasets .
# They are NOT fetched to the workspace to avoid redundant traffic.
#
# Sample use:
#
# RPG_DATASETS_FETCH(remode_unit_test BAG_FILE CALIBRATION_FILE)
# add_definitions(-DBAG_FILE=${BAG_FILE} -DCALIBRATION_FILE=${CALIBRATION_FILE})
# add_custom_target(fetch_data DEPENDS ${BAG_FILE} ${CALIBRATION_FILE})
#
# catkin_add_gtest(test_reconstruction_demo
#  test/test_reconstruction_demo.cpp)
# target_link_libraries(test_reconstruction_demo ${PROJECT_NAME})
# add_dependencies(test_reconstruction_demo fetch_data)

cmake_minimum_required(VERSION 2.8.3)

function(RPG_DATASETS_FETCH REMOTE_DIRECTORY BAG_FILE CALIBRATION_FILE)
  set(URL http://rpg.ifi.uzh.ch/datasets/${REMOTE_DIRECTORY})

  set(LOCAL_ROOT $ENV{HOME}/.rpg_datasets)
  set(LOCAL_DIRECTORY ${LOCAL_ROOT}/${REMOTE_DIRECTORY})
  file(MAKE_DIRECTORY ${LOCAL_DIRECTORY})
  set(${BAG_FILE} ${LOCAL_DIRECTORY}/data.bag PARENT_SCOPE)
  set(${CALIBRATION_FILE} ${LOCAL_DIRECTORY}/calibration.yaml PARENT_SCOPE)
  
  add_custom_command(
    OUTPUT "${LOCAL_DIRECTORY}/data.bag"
    WORKING_DIRECTORY ${LOCAL_DIRECTORY}
    COMMAND wget ${URL}/data.bag.tar.gz -O - | tar -xz)
  add_custom_command(
    OUTPUT "${LOCAL_DIRECTORY}/calibration.yaml"
    COMMAND wget ${URL}/calibration.yaml -O ${LOCAL_DIRECTORY}/calibration.yaml)
endfunction()
