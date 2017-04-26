
generate_uuid <- function(use_time = NA) {
  .Call(C_UUID_gen, as.logical(use_time))
}


get_graph_id <- function(graph) {
  if (!warn_version(graph)) {
    .Call(C_R_igraph_get_graph_id, graph)
  } else {
    NA_character_
  }
}
