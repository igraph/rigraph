#include "cpp11.hpp"

#include "igraph.h"

extern "C" void Rx_igraph_init_handlers(DllInfo* dll);
extern "C" void Rx_igraph_init_vector_class(DllInfo* dll);

[[cpp11::init]]
void igraph_init(DllInfo* dll)
{
  Rx_igraph_init_handlers(dll);
  Rx_igraph_init_vector_class(dll);
}
