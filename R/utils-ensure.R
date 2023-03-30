ensure_igraph <- function(graph) {

  if (rlang::is_missing(graph)) {
    cli::cli_abort("Must provide a graph object (missing argument).")
  }

  if (is.null(graph)) {
    cli::cli_abort("Must provide a graph object  (provided {.code NULL}).")
  }

  if (!is_igraph(graph)) {
    cli::cli_abort("Must provide a graph object (provided wrong object type).")
  }
}
