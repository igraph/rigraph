generate_uuid <- function(use_time = NA) {
  .Call(UUID_gen, as.logical(use_time))
}


get_graph_id <- function(graph) {
  if (!warn_version(graph)) {
    .Call(R_igraph_get_graph_id, graph)
  } else {
    NA_character_
  }
}
