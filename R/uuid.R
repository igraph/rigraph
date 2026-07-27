get_graph_id <- function(graph) {
  if (!warn_version(graph)) {
    .Call(Rx_igraph_get_graph_id, graph) # internal, no _impl
  } else {
    NA_character_
  }
}
