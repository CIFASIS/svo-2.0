#pragma once

#include <string>

#include <glog/logging.h>

#define RPG_ROS_PARAM_STRING(name) \
    const std::string name = rpg_ros::param::getPrivate<std::string>(#name)
#define RPG_ROS_PARAM_STRING_CHECKED(name) \
    RPG_ROS_PARAM_STRING(name); \
    CHECK(!name.empty())

namespace rpg_common_ros {
namespace param {

template<typename T>
T getPrivate(const std::string& name)
{
  ros::NodeHandle nh("~");
  T value;
  if (!nh.getParam(name, value))
  {
    ROS_WARN_STREAM("Cannot find value for parameter: " << name);
  }
  return value;
}

}  // namespace param
} // namespace rpg_common_ros

namespace rpg_ros = rpg_common_ros;
