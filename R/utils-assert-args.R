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
  match <- igraph_match_arg(
    arg,
    values,
    error_arg = .error_arg,
    error_call = .error_call
  )
  switch(match, ...)
}

igraph_match_arg <- function(
  arg,
  values,
  error_arg = rlang::caller_arg(arg),
  error_call = rlang::caller_env()
) {
  if (missing(values)) {
    formal.args <- formals(sys.function(sys.parent()))
    values <- eval(formal.args[[deparse(substitute(arg))]])
  }

  values <- tolower(values)

  # Fast path for valid input, which is what almost every call passes.
  # It accepts exactly what `rlang::arg_match()` accepts:
  # the untouched default (all of `values`), or a single exact match.
  # `error_arg` and `error_call` stay unevaluated here,
  # because computing them costs far more than the match itself.
  if (is.character(arg)) {
    lowered <- tolower(arg)
    if (identical(lowered, values)) {
      return(values[[1]])
    }
    if (length(lowered) == 1 && !is.na(lowered) && lowered %in% values) {
      return(lowered)
    }
  }

  # Materialize before reassigning `arg`, which `caller_arg()` inspects.
  force(error_arg)

  arg <- tolower(arg)

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
    if (inherits(x, "sparseMatrix")) {
      x <- Matrix::triu(x)@x
    } else {
      x <- x[upper.tri(x)]
    }
  } else if (mode == "lower") {
    if (inherits(x, "sparseMatrix")) {
      x <- Matrix::tril(x)@x
    } else {
      x <- x[lower.tri(x)]
    }
  }
  if (anyNA(x)) {
    cli::cli_abort(
      "Cannot create a graph object because the {what} contains NAs.",
      call = call
    )
  }
}
