#pragma once

#include <fstream>

#include <Eigen/Dense>
#include <glog/logging.h>

#include "rpg_common/vector_to_eigen.h"

namespace rpg_common {

// Does the inverse of:
// Eigen::Matrix x;
// std::ofstream out("filename");
// out << x;
// I.e. loads a space-separated file into a matrix.
template <typename Type, int Rows, int Cols>
void load(const std::string& file, Eigen::Matrix<Type, Rows, Cols>* result)
{
  CHECK_NOTNULL(result);
  std::ifstream in(file);
  CHECK(in.is_open());

  std::vector<std::vector<Type>> coeffs;
  while (!in.eof())
  {
    std::string line;
    getline(in, line);

    coeffs.emplace_back();
    std::istringstream iss(line);
    while (!iss.eof())
    {
      coeffs.back().emplace_back();
      iss >> coeffs.back().back();
    }
    if (iss.fail())
    {
      coeffs.back().pop_back();
    }

    if (coeffs.back().empty())
    {
      coeffs.pop_back();
    }
  }

  vectorToEigen(coeffs, result);
}
}  // namespace rpg_common

namespace rpg = rpg_common;
