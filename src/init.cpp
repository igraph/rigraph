#include "cpp11.hpp"

#include "igraph.h"

extern "C" void R_igraph_init_handlers(DllInfo* dll);

[[cpp11::init]]
void igraph_init(DllInfo* dll)
{
  R_igraph_init_handlers(dll);
}
