ensure_igraph <- function(graph) {
  if (!is.null(graph) && !is_igraph(graph)) {
    cli::cli_abort("Not a graph object.")
  }
}
