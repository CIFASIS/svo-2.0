#pragma once

#include <string>

#include <Eigen/Dense>
#include <rpg_common/pose.h>
#include <std_msgs/ColorRGBA.h>
#include <visualization_msgs/Marker.h>

namespace rpg_common_ros {

// Diverse helper options that can be used for visualize specializations:
namespace visualize_internal {

extern std_msgs::ColorRGBA createColor(
    const float r, const float g, const float b);
void addPoint(const Eigen::Vector3d& p_W_A, const std_msgs::ColorRGBA& color,
              visualization_msgs::Marker* marker);

}  // namespace visualize_internal

// See cpp file for specializations - never hesitate to add yours,
// as long as you don't need to add dependencies (otherwise, specialize in your
// own package).
template <typename ... Type>
void visualize(const std::string& topic, const Type& ... objects);

void visualizeAsSpheres(
    const std::string& topic, const Eigen::Matrix3Xd& centers,
    const Eigen::Vector3d& color, const double radius, const int id);

void visualizeMesh(
    const std::string& topic, const std::string& mesh_resource,
    const rpg::Pose& pose, const int id);

enum class PointVisualizationStyle
{
  kConnectedLine,
  kPointCloud
};

}  // namespace rpg_common_ros
namespace rpg_ros = rpg_common_ros;
