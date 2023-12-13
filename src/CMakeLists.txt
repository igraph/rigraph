cmake_minimum_required(VERSION 3.18...3.25)

# Declare the project and language
project(
  rigraph
  DESCRIPTION "R interface for igraph library"
  HOMEPAGE_URL https://igraph.org
  LANGUAGES C CXX
)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# Compile igraph with USING_R definition
add_compile_definitions(USING_R)

execute_process(COMMAND bash "-c" "Rscript -e 'cat(R.home(\"include\"))'" OUTPUT_VARIABLE R_INCLUDE)
execute_process(COMMAND bash "-c" "Rscript -e 'x <- desc::desc_get_deps(); pkgs <- x$package[x$type == \"LinkingTo\"]; paths <- file.path(.libPaths()[[1]], pkgs, \"include\"); cat(paths, sep = \";\")'" OUTPUT_VARIABLE R_LIBRARIES_INCLUDES)

include_directories(${R_INCLUDE} ${R_LIBRARIES_INCLUDES} vendor/cigraph/include)

set(IGRAPH_OPENMP_SUPPORT OFF)
set(IGRAPH_USE_INTERNAL_GLPK OFF)
set(IGRAPH_USE_INTERNAL_LAPACK OFF)
set(IGRAPH_USE_INTERNAL_GMP OFF)
add_subdirectory(vendor/cigraph)

add_subdirectory(vendor/simpleraytracer)
add_subdirectory(vendor/uuid)
