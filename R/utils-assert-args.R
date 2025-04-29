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


igraph.match.arg <- function(arg, values, error_call = rlang::caller_env()) {
  if (missing(values)) {
    formal.args <- formals(sys.function(sys.parent()))
    values <- eval(formal.args[[deparse(substitute(arg))]])
  }

  arg <- tolower(arg)
  values <- tolower(values)

  rlang::arg_match(
    arg = arg,
    values = values,
    error_call = error_call
  )
}

#' @importFrom rlang caller_env
ensure_no_na <- function(x, what, call = caller_env()) {
  if (any(is.na(x))) {
    cli::cli_abort("Cannot create a graph object because the {what} contains NAs.", call = call)
  }
}
