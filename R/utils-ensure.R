ensure_igraph <- function(graph, optional = FALSE) {

  if (is.null(graph)) {
    if (!optional) {
      cli::cli_abort("Must provide a graph object (provided {.code NULL}).")
    } else {
      return()
    }
  }

  if (rlang::is_missing(graph)) {
    cli::cli_abort("Must provide a graph object (missing argument).")
  }

  if (!is_igraph(graph)) {
    cli::cli_abort("Must provide a graph object (provided wrong object type).")
  }
}
