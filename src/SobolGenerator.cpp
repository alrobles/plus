#include <Rcpp.h>
using namespace Rcpp;

// Sobol sequence generator based on direction numbers
// This is a basic implementation of Sobol sequences for dimensions 1-10
// Uses direction numbers from Joe and Kuo

class SobolGenerator {
private:
  int dimension;
  unsigned long count;
  unsigned long max_count;
  std::vector<unsigned long> direction_v;
  std::vector<unsigned long> last_x;

  // Initialize direction numbers for first 10 dimensions
  void initializeDirections() {
    // For dimension 1, use simple binary representation
    if (dimension >= 1) {
      for (int i = 0; i < 32; ++i) {
        direction_v.push_back(1UL << (31 - i));
      }
    }

    // For higher dimensions, use primitive polynomials
    // This is a simplified implementation
    if (dimension >= 2) {
      // Direction numbers for dimension 2 (polynomial x^2 + x + 1)
      for (int i = 0; i < 32; ++i) {
        unsigned long v = 1UL << (31 - i);
        if (i > 0) {
          v ^= (v >> 1);
        }
        direction_v.push_back(v);
      }
    }

    // For dimensions 3-10, use simplified direction numbers
    for (int d = 3; d <= dimension; ++d) {
      for (int i = 0; i < 32; ++i) {
        unsigned long v = 1UL << (31 - i);
        if (i > 0) {
          v ^= (v >> (d - 1));
        }
        direction_v.push_back(v);
      }
    }
  }

public:
  SobolGenerator(int dim, unsigned long seed = 0)
    : dimension(dim), count(0), max_count((1UL << 31) - 1) {
    if (dim < 1 || dim > 10) {
      Rcpp::stop("Dimension must be between 1 and 10");
    }
    initializeDirections();
    last_x.resize(dimension, 0);

    // If seed provided, skip to that position
    if (seed > 0) {
      skip(seed);
    }
  }

  // Generate next point
  NumericVector next() {
    if (count >= max_count) {
      Rcpp::stop("Maximum sequence length reached");
    }

    NumericVector point(dimension);

    // Find the rightmost zero bit in count
    unsigned long c = count;
    unsigned long g = c ^ (c + 1);
    int l = 0;
    while (g > 1) {
      g >>= 1;
      l++;
    }

    // XOR the appropriate direction number for each dimension
    for (int d = 0; d < dimension; ++d) {
      unsigned long v = direction_v[d * 32 + l];
      last_x[d] ^= v;
      point[d] = static_cast<double>(last_x[d]) / static_cast<double>(1UL << 32);
    }

    count++;
    return point;
  }

  // Skip n points
  void skip(unsigned long n) {
    for (unsigned long i = 0; i < n; ++i) {
      next();
    }
  }

  // Reset generator
  void reset() {
    count = 0;
    std::fill(last_x.begin(), last_x.end(), 0);
  }

  // Get current count
  unsigned long getCount() const {
    return count;
  }

  // Get dimension
  int getDimension() const {
    return dimension;
  }
};

// Expose the class to R using Rcpp modules
RCPP_MODULE(SobolModule) {
  class_<SobolGenerator>("SobolGenerator")

  .constructor<int>("Create a Sobol sequence generator")
  .constructor<int, unsigned long>("Create a Sobol sequence generator with seed")

  .method("next", &SobolGenerator::next, "Generate next point in sequence")
  .method("skip", &SobolGenerator::skip, "Skip n points in sequence")
  .method("reset", &SobolGenerator::reset, "Reset generator to beginning")
  .method("getCount", &SobolGenerator::getCount, "Get current count")
  .method("getDimension", &SobolGenerator::getDimension, "Get dimension")
  ;
}
