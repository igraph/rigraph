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

# Checks a user-supplied permutation of `n` vertices before it reaches C,
# which names no argument in its errors
# and silently accepts duplicates and out-of-range values in the correlated games.
check_permutation <- function(
  permutation,
  n,
  arg = rlang::caller_arg(permutation),
  call = rlang::caller_env()
) {
  if (!is.numeric(permutation)) {
    cli::cli_abort(
      "{.arg {arg}} must be a numeric vector, not {.obj_type_friendly {permutation}}.",
      call = call
    )
  }

  # `isTRUE()` because `n` is user input in `sample_correlated_gnp_pair()`.
  if (!isTRUE(length(permutation) == n)) {
    cli::cli_abort(
      c(
        "{.arg {arg}} must have length equal to the number of vertices.",
        i = "Expected length {n}, got {length(permutation)}."
      ),
      call = call
    )
  }

  values <- as.numeric(permutation)

  pos <- which(is.na(values))
  if (length(pos) > 0) {
    cli::cli_abort(
      c(
        "{.arg {arg}} must not contain missing values.",
        i = "Found {.val {NA}} at {cli::qty(length(pos))}position{?s} {pos}."
      ),
      call = call
    )
  }

  pos <- which(values != trunc(values))
  if (length(pos) > 0) {
    cli::cli_abort(
      c(
        "{.arg {arg}} must contain whole numbers.",
        i = "Found {.val {values[pos]}} at {cli::qty(length(pos))}position{?s} {pos}."
      ),
      call = call
    )
  }

  pos <- which(values < 1 | values > n)
  if (length(pos) > 0) {
    cli::cli_abort(
      c(
        "{.arg {arg}} must contain values between 1 and {n}.",
        i = "Found {.val {values[pos]}} at {cli::qty(length(pos))}position{?s} {pos}."
      ),
      call = call
    )
  }

  if (anyDuplicated(values)) {
    duplicates <- unique(values[duplicated(values)])
    cli::cli_abort(
      c(
        "{.arg {arg}} must not contain duplicate values.",
        i = "Found {.val {duplicates}} more than once."
      ),
      call = call
    )
  }

  invisible(permutation)
}
