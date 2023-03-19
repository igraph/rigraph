#include "cpp11/doubles.hpp"

using namespace cpp11;

[[cpp11::register]]
double mean_cpp(doubles x) {
  int n = x.size();
  double total = 0;
  for(double value : x) {
    total += value;
  }
  return total / n;
}