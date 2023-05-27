#include "cpp11.hpp"

#include "igraph.h"

extern "C" void R_igraph_init_handlers(DllInfo* dll);
extern "C" void R_igraph_init_vector_class(DllInfo* dll);

[[cpp11::init]]
void igraph_init(DllInfo* dll)
{
  R_igraph_init_handlers(dll);
  R_igraph_init_vector_class(dll);
}
