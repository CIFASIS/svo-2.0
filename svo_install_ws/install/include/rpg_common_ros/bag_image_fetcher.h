#pragma once

#include <string>
#include <vector>

#include <rosbag/bag.h>

namespace cv {
class Mat;
}  // namespace cv

namespace rpg_common_ros {

class BagImageFetcher
{
public:
  // Assuming bag_files is comma separated, and the topic is the same for
  // all bags.
  BagImageFetcher(const std::string& comma_separated_bag_files,
                  const std::string& image_topic);

  void addBag(const std::string& bag_file, const std::string& image_topic);

  bool getImage(const uint64_t timestamp_ns,
                cv::Mat* result,
                const bool use_image_time = false) const;

private:
  static uint64_t getTimeDifference(const rosbag::Bag& bag,
                             const std::vector<std::string>& topics);

  static bool getImageFromBagBasedOnMsgTime(
      const rosbag::Bag& bag,
      const std::vector<std::string>& topics,
      const uint64_t timestamp_ns,
      cv::Mat* result);

  static bool getImageFromBagBasedOnImageTime(
      const rosbag::Bag& bag,
      const std::vector<std::string>& topics,
      const uint64_t timestamp_ns,
      cv::Mat* result);

  static bool getImageFromBag(
      const rosbag::Bag& bag, const std::vector<std::string>& topics,
      const uint64_t timestamp_ns, cv::Mat* result, const bool use_image_time);

  // Bags don't take well to being reallocated.
  std::vector<std::unique_ptr<rosbag::Bag>> bags_;
  std::vector<std::vector<std::string>> query_topics_;
};

}  // namespace rpg_common_ros
namespace rpg_ros = rpg_common_ros;
