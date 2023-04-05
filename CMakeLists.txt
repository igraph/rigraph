# Minimum CMake that we require is 3.16 because we use --ignore-eol when
# comparing unit test results with expected outcomes (added in 3.14) and we
# also use SKIP_REGULAR_EXPRESSION to handle skipped tests properly
cmake_minimum_required(VERSION 3.16)

# Declare the project, its version number and language
project(
  rigraph
  DESCRIPTION "R interface for igraph library"
  HOMEPAGE_URL https://igraph.org
  LANGUAGES C CXX
)

set(IGRAPH_INTEGER_SIZE 32)
add_subdirectory(cigraph)
