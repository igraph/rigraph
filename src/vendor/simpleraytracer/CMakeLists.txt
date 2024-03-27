set(SOURCES
  Color.cpp
  Light.cpp
  Point.cpp
  RIgraphRay.cpp
  Ray.cpp
  RayTracer.cpp
  RayVector.cpp
  Shape.cpp
  Sphere.cpp
  Triangle.cpp
  unit_limiter.cpp
)

add_library(simpleraytracer ${SOURCES})
target_include_directories(simpleraytracer PRIVATE ${igraph_BINARY_DIR}/include ${rigraph_SOURCE_DIR})

install(
  TARGETS simpleraytracer
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
