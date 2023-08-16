set(SOURCES
  R.c
  clear.c
  compare.c
  copy.c
  gen_uuid.c
  isnull.c
  pack.c
  parse.c
  unpack.c
  unparse.c
)

add_library(uuid ${SOURCES})
target_include_directories(uuid PRIVATE ${igraph_BINARY_DIR}/include ${rigraph_SOURCE_DIR})

install(
  TARGETS uuid
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
