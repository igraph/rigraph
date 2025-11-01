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

switch_igraph_arg <- function(
  arg,
  ...,
  .error_arg = rlang::caller_arg(arg),
  .error_call = rlang::caller_env()
) {
  # Materialize early, before accessing arg
  force(.error_arg)

  values <- tolower(...names())
  if (length(arg) > 1) {
    values <- intersect(values, tolower(arg))
  }
  match <- igraph.match.arg(
    arg,
    values,
    error_arg = .error_arg,
    error_call = .error_call
  )
  switch(match, ...)
}

igraph.match.arg <- function(
  arg,
  values,
  error_arg = rlang::caller_arg(arg),
  error_call = rlang::caller_env()
) {
  # Materialize early, before accessing arg
  force(error_arg)

  if (missing(values)) {
    formal.args <- formals(sys.function(sys.parent()))
    values <- eval(formal.args[[deparse(substitute(arg))]])
  }

  arg <- tolower(arg)
  values <- tolower(values)

  rlang::arg_match(
    arg = arg,
    values = values,
    error_arg = error_arg,
    error_call = error_call
  )
}

#' @importFrom rlang caller_env
ensure_no_na <- function(x, what, mode = "", call = caller_env()) {
  if (mode == "upper") {
    x <- x[upper.tri(x)]
  } else if (mode == "lower") {
    x <- x[lower.tri(x)]
  }
  if (anyNA(x)) {
    cli::cli_abort(
      "Cannot create a graph object because the {what} contains NAs.",
      call = call
    )
  }
}
