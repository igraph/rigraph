# Minimum CMake that we require is 3.16 because we use --ignore-eol when
# comparing unit test results with expected outcomes (added in 3.14) and we
# also use SKIP_REGULAR_EXPRESSION to handle skipped tests properly
cmake_minimum_required(VERSION 3.18...3.25)

# Declare the project, its version number and language
project(
  rigraph
  DESCRIPTION "R interface for igraph library"
  HOMEPAGE_URL https://igraph.org
  LANGUAGES C CXX
)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Compile igraph with USING_R definition
add_compile_definitions(USING_R)

execute_process(COMMAND bash "-c" "Rscript -e 'cat(R.home(\"include\"))'" OUTPUT_VARIABLE R_INCLUDE)
execute_process(COMMAND bash "-c" "Rscript -e 'x <- desc::desc_get_deps(); pkgs <- x$package[x$type == \"LinkingTo\"]; paths <- file.path(.libPaths()[[1]], pkgs, \"include\"); cat(paths, sep = \";\")'" OUTPUT_VARIABLE R_LIBRARIES_INCLUDES)

include_directories(${R_INCLUDE} ${R_LIBRARIES_INCLUDES})

set(IGRAPH_INTEGER_SIZE 32)
add_subdirectory(src/vendor/cigraph)
