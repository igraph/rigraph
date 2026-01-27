generate_uuid <- function(use_time = NA) {
  .Call(UUID_gen, as.logical(use_time)) # no _impl
}


get_graph_id <- function(graph) {
  if (!warn_version(graph)) {
    .Call(Rx_igraph_get_graph_id, graph) # no _impl
  } else {
    NA_character_
  }
}
