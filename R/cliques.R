#' Independent vertex sets
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `maximal.independent.vertex.sets()` was renamed to [max_ivs()] to create a more
#' consistent API.
#' @inheritParams max_ivs
#' @keywords internal
#' @export
maximal.independent.vertex.sets <- function(graph) {
  # nocov start
  lifecycle::deprecate_warn(
    "2.0.0",
    "maximal.independent.vertex.sets()",
    "max_ivs()"
  )
  max_ivs(graph = graph)
} # nocov end

#' Functions to find cliques, i.e. complete subgraphs in a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `maximal.cliques.count()` was renamed to [count_max_cliques()] to create a more
#' consistent API.
#' @inheritParams count_max_cliques
#' @keywords internal
#' @export
maximal.cliques.count <- function(
  graph,
  min = NULL,
  max = NULL,
  subset = NULL
) {
  # nocov start
  lifecycle::deprecate_warn(
    "2.0.0",
    "maximal.cliques.count()",
    "count_max_cliques()"
  )
  count_max_cliques(graph = graph, min = min, max = max, subset = subset)
} # nocov end

#' Functions to find cliques, i.e. complete subgraphs in a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `maximal.cliques()` was renamed to [max_cliques()] to create a more
#' consistent API.
#' @inheritParams max_cliques
#' @keywords internal
#' @export
maximal.cliques <- function(
  graph,
  min = NULL,
  max = NULL,
  subset = NULL,
  file = NULL
) {
  # nocov start
  lifecycle::deprecate_warn("2.0.0", "maximal.cliques()", "max_cliques()")
  max_cliques(graph = graph, min = min, max = max, subset = subset, file = file)
} # nocov end

#' Independent vertex sets
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `largest.independent.vertex.sets()` was renamed to [largest_ivs()] to create a more
#' consistent API.
#' @inheritParams largest_ivs
#' @keywords internal
#' @export
largest.independent.vertex.sets <- function(graph) {
  # nocov start
  lifecycle::deprecate_warn(
    "2.0.0",
    "largest.independent.vertex.sets()",
    "largest_ivs()"
  )
  largest_ivs(graph = graph)
} # nocov end

#' Functions to find cliques, i.e. complete subgraphs in a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `largest.cliques()` was renamed to [largest_cliques()] to create a more
#' consistent API.
#' @inheritParams largest_cliques
#' @keywords internal
#' @export
largest.cliques <- function(graph) {
  # nocov start
  lifecycle::deprecate_warn("2.0.0", "largest.cliques()", "largest_cliques()")
  largest_cliques(graph = graph)
} # nocov end

#' Independent vertex sets
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `independent.vertex.sets()` was renamed to [ivs()] to create a more
#' consistent API.
#' @inheritParams ivs
#' @keywords internal
#' @export
independent.vertex.sets <- function(graph, min = NULL, max = NULL) {
  # nocov start
  lifecycle::deprecate_warn("2.0.0", "independent.vertex.sets()", "ivs()")
  ivs(graph = graph, min = min, max = max)
} # nocov end

#' Independent vertex sets
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `independence.number()` was renamed to [ivs_size()] to create a more
#' consistent API.
#' @inheritParams ivs_size
#' @keywords internal
#' @export
independence.number <- function(graph) {
  # nocov start
  lifecycle::deprecate_warn("2.0.0", "independence.number()", "ivs_size()")
  ivs_size(graph = graph)
} # nocov end

#' Functions to find cliques, i.e. complete subgraphs in a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `clique.number()` was renamed to [clique_num()] to create a more
#' consistent API.
#' @inheritParams clique_num
#' @keywords internal
#' @export
clique.number <- function(graph) {
  # nocov start
  lifecycle::deprecate_warn("2.0.0", "clique.number()", "clique_num()")
  clique_num(graph = graph)
} # nocov end
#   IGraph R package
#   Copyright (C) 2006-2012  Gabor Csardi <csardi.gabor@gmail.com>
#   334 Harvard street, Cambridge, MA 02139 USA
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc.,  51 Franklin Street, Fifth Floor, Boston, MA
#   02110-1301 USA
#
###################################################################

#' Functions to find cliques, i.e. complete subgraphs in a graph
#'
#' These functions find all, the largest or all the maximal cliques in an
#' undirected graph. The size of the largest clique can also be calculated.
#'
#' `cliques()` find all complete subgraphs in the input graph, obeying the
#' size limitations given in the `min` and `max` arguments.
#'
#' `largest_cliques()` finds all largest cliques in the input graph. A
#' clique is largest if there is no other clique including more vertices.
#'
#' `max_cliques()` finds all maximal cliques in the input graph.  A
#' clique is maximal if it cannot be extended to a larger clique. The largest
#' cliques are always maximal, but a maximal clique is not necessarily the
#' largest.
#'
#' `count_max_cliques()` counts the maximal cliques.
#'
#' `clique_num()` calculates the size of the largest clique(s).
#'
#' `clique_size_counts()` returns a numeric vector representing a histogram
#' of clique sizes, between the given minimum and maximum clique size.
#'
#' `is_clique()` tests whether all pairs within a vertex set are connected.
#'
#' @inheritParams weighted_cliques
#' @param graph The input graph, directed graphs will be considered as
#'   undirected ones, multiple edges and loops are ignored.
#' @param min Numeric constant, lower limit on the size of the cliques to find.
#'   `NULL` means no limit, i.e. it is the same as 0.
#' @param max Numeric constant, upper limit on the size of the cliques to find.
#'   `NULL` means no limit.
#' @param ... These dots are for future extensions and must be empty.
#' @param callback Optional function to call for each clique found. If provided,
#'   the function should accept one argument: `clique` (integer vector of vertex
#'   IDs in the clique, 1-based indexing). The function should return `FALSE` to
#'   continue the search or `TRUE` to stop it. If `NULL` (the default), all
#'   cliques are collected and returned as a list.
#'
#'   **Important limitation:** Callback functions must NOT call any igraph
#'   functions (including simple queries like `vcount()` or `ecount()`). Doing
#'   so will cause R to crash due to reentrancy issues. Extract
#'   any needed graph information before calling the function with a callback, or
#'   use collector mode (the default) and process results afterward.
#' @return `cliques()` returns a list containing numeric vectors of vertex IDs if
#'   `callback` is `NULL`. Each list element is a clique, i.e. a vertex sequence
#'   of class [igraph.vs][V]. If `callback` is provided, returns `NULL` invisibly.
#'
#'   `largest_cliques()` and `clique_num()` return a list containing numeric
#'   vectors of vertex IDs. Each list element is a clique, i.e. a vertex sequence
#'   of class [igraph.vs][V].
#'
#'   `max_cliques()` returns `NULL`, invisibly, if its `file`
#'   argument is not `NULL`. The output is written to the specified file in
#'   this case.
#'
#'   `clique_num()` and `count_max_cliques()` return an integer
#'   scalar.
#'
#'   `clique_size_counts()` returns a numeric vector with the clique sizes such that
#'   the i-th item belongs to cliques of size i. Trailing zeros are currently
#'   truncated, but this might change in future versions.
#'
#' @author Tamas Nepusz \email{ntamas@@gmail.com} and Gabor Csardi
#' \email{csardi.gabor@@gmail.com}
#' @references For maximal cliques the following algorithm is implemented:
#' David Eppstein, Maarten Loffler, Darren Strash: Listing All Maximal Cliques
#' in Sparse Graphs in Near-optimal Time.  <https://arxiv.org/abs/1006.5440>
#' @family cliques
#' @export
#' @keywords graphs
#' @examples
#'
#' # this usually contains cliques of size six
#' g <- sample_gnp(100, 0.3)
#' clique_num(g)
#' cliques(g, min = 6)
#' largest_cliques(g)
#'
#' # To have a bit less maximal cliques, about 100-200 usually
#' g <- sample_gnp(100, 0.03)
#' max_cliques(g)
#'
#' # Check that all returned vertex sets are indeed cliques
#' all(sapply(max_cliques(g), function (c) is_clique(g, c)))
cliques <- function(graph, min = NULL, max = NULL, ..., callback = NULL) {
  ensure_igraph(graph)
  check_dots_empty()

  if (is.null(callback)) {
    # Collector mode: use original implementation
    cliques_impl(
      graph = graph,
      min = min %||% 0,
      max = max %||% 0
    )
  } else {
    # Callback mode: call user function
    cliques_callback_closure_impl(
      graph = graph,
      min_size = min %||% 0,
      max_size = max %||% 0,
      callback = callback
    )
    invisible(NULL)
  }
}

#' @rdname cliques
#' @export
largest_cliques <- function(graph) {
  largest_cliques_impl(
    graph = graph
  )
}

#' @rdname cliques
#' @param subset If not `NULL`, then it must be a vector of vertex IDs,
#'   numeric or symbolic if the graph is named. The algorithm is run from these
#'   vertices only, so only a subset of all maximal cliques is returned. See the
#'   Eppstein paper for details. This argument makes it possible to easily
#'   parallelize the finding of maximal cliques.
#' @param file If not `NULL`, then it must be a file name, i.e. a
#'   character scalar. The output of the algorithm is written to this file. (If
#'   it exists, then it will be overwritten.) Each clique will be a separate line
#'   in the file, given with the numeric IDs of its vertices, separated by
#'   whitespace.
#' @export
max_cliques <- function(
  graph,
  min = NULL,
  max = NULL,
  subset = NULL,
  file = NULL,
  ...,
  callback = NULL
) {
  ensure_igraph(graph)
  check_dots_empty()

  # Handle file and subset modes (original functionality)
  if (!is.null(file)) {
    if (
      !is.character(file) ||
        length(grep("://", file, fixed = TRUE)) > 0 ||
        length(grep("~", file, fixed = TRUE)) > 0
    ) {
      tmpfile <- TRUE
      origfile <- file
      file <- tempfile()
    } else {
      tmpfile <- FALSE
    }
    on.exit(.Call(Rx_igraph_finalizer))
    res <- .Call(
      Rx_igraph_maximal_cliques_file,
      graph,
      subset,
      file,
      as.numeric(min %||% 0),
      as.numeric(max %||% 0)
    )
    if (tmpfile) {
      buffer <- read.graph.toraw(file)
      write.graph.fromraw(buffer, origfile)
    }
    return(invisible(NULL))
  }

  # Collector or callback mode
  if (is.null(callback)) {
    # Collector mode: use original implementation
    if (is.null(subset)) {
      subset_arg <- NULL
    } else {
      subset_arg <- as.numeric(as_igraph_vs(graph, subset) - 1)
    }

    on.exit(.Call(Rx_igraph_finalizer))
    res <- .Call(
      Rx_igraph_maximal_cliques,
      graph,
      subset_arg,
      as.numeric(min %||% 0),
      as.numeric(max %||% 0)
    )
    res <- lapply(res, function(x) x + 1)

    if (igraph_opt("return.vs.es")) {
      res <- create_vs_list(graph, res)
    }

    res
  } else {
    # Callback mode: call user function
    if (!is.null(subset)) {
      cli::cli_abort(
        "{.arg subset} is not supported when {.arg callback} is provided"
      )
    }

    maximal_cliques_callback_closure_impl(
      graph = graph,
      min_size = min %||% 0,
      max_size = max %||% 0,
      callback = callback
    )
    invisible(NULL)
  }
}

#' @rdname cliques
#' @inheritParams rlang::args_dots_empty
#' @export
count_max_cliques <- function(
  graph,
  min = NULL,
  max = NULL,
  ...,
  subset = NULL
) {
  # BEGIN GENERATED ARG_HANDLE: count_max_cliques, do not edit, see tools/generate-migrations.R
  # fmt: skip
  if (...length() > 0L) {
    # Pre-3.0.0 signature: count_max_cliques(graph, min, max, subset)
    .old_signature <- function(subset, ...) {
      if (...length() > 0L) {
        .arg_extra <- base::names(base::substitute(...()))
        .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]
        if (base::length(.arg_extra) == 0L) cli::cli_abort("Too many arguments passed to {.fn count_max_cliques}.", call = base::parent.frame())
        cli::cli_abort(base::c("Unexpected argument passed to {.fn count_max_cliques}: {.arg {(.arg_extra)}}.", i = "Arguments after {.arg ...} must be spelled out in full."), call = base::parent.frame())
      }
      base::c(
        if (!base::missing(subset)) base::list(subset = subset)
      )
    }
    .arg_handle <- .old_signature(...)
    if (base::length(.arg_handle) > 0L) {
      .arg_names <- base::names(.arg_handle)
      .arg_conflict <- base::intersect(.arg_names, base::c(
        if (!base::missing(subset)) "subset"
      ))
      if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_conflict)}} of {.fn count_max_cliques} was supplied more than once.", i = "Pass it exactly once, by its new name {.arg {(.arg_conflict)}}."))
      base::list2env(.arg_handle, base::environment())
      lifecycle::deprecate_soft(
        "3.0.0",
        what = base::I("Calling `count_max_cliques()` with positional or abbreviated arguments"),
        details = base::c(
          i = base::paste0("Detected call:  count_max_cliques(", base::paste(base::c("graph", "min", "max", .arg_names), collapse = ", "), ")"),
          i = base::paste0("Use instead:    count_max_cliques(", base::paste(base::c("graph", "min", "max", base::paste0(.arg_names, " = ")), collapse = ", "), ")")
        )
      )
    }
  }
  # END GENERATED ARG_HANDLE

  # Argument checks
  ensure_igraph(graph)

  if (is.null(min)) {
    min <- 0
  }
  if (is.null(max)) {
    max <- 0
  }
  min <- as.numeric(min)
  max <- as.numeric(max)

  if (!is.null(subset)) {
    subset <- as.numeric(as_igraph_vs(graph, subset) - 1)
  }

  on.exit(.Call(Rx_igraph_finalizer))
  # Function call
  res <- .Call(Rx_igraph_maximal_cliques_count, graph, subset, min, max)

  res
}

#' @rdname cliques
#' @export
clique_num <- function(graph) {
  clique_number_impl(
    graph = graph
  )
}


#' Functions to find weighted cliques, i.e. vertex-weighted complete subgraphs in a graph
#'
#' These functions find all, the largest or all the maximal weighted cliques in
#' an undirected graph. The weight of a clique is the sum of the weights of its
#' vertices.
#'
#' `weighted_cliques()` finds all complete subgraphs in the input graph,
#' obeying the weight limitations given in the `min` and `max`
#' arguments.
#'
#' `largest_weighted_cliques()` finds all largest weighted cliques in the
#' input graph. A clique is largest if there is no other clique whose total
#' weight is larger than the weight of this clique.
#'
#' `weighted_clique_num()` calculates the weight of the largest weighted clique(s).
#'
#' @param graph The input graph, directed graphs will be considered as
#'   undirected ones, multiple edges and loops are ignored.
#' @param min.weight Numeric constant, lower limit on the weight of the cliques to find.
#'   `NULL` means no limit, i.e. it is the same as 0.
#' @param max.weight Numeric constant, upper limit on the weight of the cliques to find.
#'   `NULL` means no limit.
#' @inheritParams rlang::args_dots_empty
#' @param vertex.weights Vertex weight vector. If the graph has a `weight`
#'   vertex attribute, then this is used by default. If the graph does not have a
#'   `weight` vertex attribute and this argument is `NULL`, then every
#'   vertex is assumed to have a weight of 1. Note that the current implementation
#'   of the weighted clique finder supports positive integer weights only.
#' @param maximal Specifies whether to look for all weighted cliques (`FALSE`)
#'   or only the maximal ones (`TRUE`).
#' @return `weighted_cliques()` and `largest_weighted_cliques()` return a
#'   list containing numeric vectors of vertex IDs. Each list element is a weighted
#'   clique, i.e. a vertex sequence of class [igraph.vs][V].
#'
#'   `weighted_clique_num()` returns an integer scalar.
#'
#' @author Tamas Nepusz \email{ntamas@@gmail.com} and Gabor Csardi
#' \email{csardi.gabor@@gmail.com}
#' @family cliques
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- make_graph("zachary")
#' V(g)$weight <- 1
#' V(g)[c(1, 2, 3, 4, 14)]$weight <- 3
#' weighted_cliques(g)
#' weighted_cliques(g, maximal = TRUE)
#' largest_weighted_cliques(g)
#' weighted_clique_num(g)
weighted_cliques <- function(
  graph,
  ...,
  vertex.weights = NULL,
  min.weight = 0,
  max.weight = 0,
  maximal = FALSE
) {
  # BEGIN GENERATED ARG_HANDLE: weighted_cliques, do not edit, see tools/generate-migrations.R
  # fmt: skip
  if (...length() > 0L) {
    .arg_ambiguous <- base::intersect(base::names(base::substitute(...())), base::c("m", "ma", "max"))
    if (base::length(.arg_ambiguous) > 0L) cli::cli_abort("Argument {.arg {(.arg_ambiguous[[1L]])}} matches multiple arguments of {.fn weighted_cliques}.")
    # Pre-3.0.0 signature: weighted_cliques(graph, vertex.weights, min.weight, max.weight, maximal)
    .old_signature <- function(vertex.weights, min.weight, max.weight, maximal, ...) {
      if (...length() > 0L) {
        .arg_extra <- base::names(base::substitute(...()))
        .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]
        if (base::length(.arg_extra) == 0L) cli::cli_abort("Too many arguments passed to {.fn weighted_cliques}.", call = base::parent.frame())
        cli::cli_abort(base::c("Unexpected argument passed to {.fn weighted_cliques}: {.arg {(.arg_extra)}}.", i = "Arguments after {.arg ...} must be spelled out in full."), call = base::parent.frame())
      }
      base::c(
        if (!base::missing(vertex.weights)) base::list(vertex.weights = vertex.weights),
        if (!base::missing(min.weight)) base::list(min.weight = min.weight),
        if (!base::missing(max.weight)) base::list(max.weight = max.weight),
        if (!base::missing(maximal)) base::list(maximal = maximal)
      )
    }
    .arg_handle <- .old_signature(...)
    if (base::length(.arg_handle) > 0L) {
      .arg_names <- base::names(.arg_handle)
      .arg_conflict <- base::intersect(.arg_names, base::c(
        if (!base::missing(vertex.weights)) "vertex.weights",
        if (!base::missing(min.weight)) "min.weight",
        if (!base::missing(max.weight)) "max.weight",
        if (!base::missing(maximal)) "maximal"
      ))
      if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_conflict)}} of {.fn weighted_cliques} was supplied more than once.", i = "Pass it exactly once, by its new name {.arg {(.arg_conflict)}}."))
      base::list2env(.arg_handle, base::environment())
      lifecycle::deprecate_soft(
        "3.0.0",
        what = base::I("Calling `weighted_cliques()` with positional or abbreviated arguments"),
        details = base::c(
          i = base::paste0("Detected call:  weighted_cliques(", base::paste(base::c("graph", .arg_names), collapse = ", "), ")"),
          i = base::paste0("Use instead:    weighted_cliques(", base::paste(base::c("graph", base::paste0(.arg_names, " = ")), collapse = ", "), ")")
        )
      )
    }
  }
  # END GENERATED ARG_HANDLE

  weighted_cliques_impl(
    graph = graph,
    vertex_weights = vertex.weights,
    min_weight = min.weight,
    max_weight = max.weight,
    maximal = maximal
  )
}
#' @inheritParams rlang::args_dots_empty
#' @export
#' @rdname cliques
largest_weighted_cliques <- function(
  graph,
  ...,
  vertex.weights = NULL
) {
  # BEGIN GENERATED ARG_HANDLE: largest_weighted_cliques, do not edit, see tools/generate-migrations.R
  # fmt: skip
  if (...length() > 0L) {
    # Pre-3.0.0 signature: largest_weighted_cliques(graph, vertex.weights)
    .old_signature <- function(vertex.weights, ...) {
      if (...length() > 0L) {
        .arg_extra <- base::names(base::substitute(...()))
        .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]
        if (base::length(.arg_extra) == 0L) cli::cli_abort("Too many arguments passed to {.fn largest_weighted_cliques}.", call = base::parent.frame())
        cli::cli_abort(base::c("Unexpected argument passed to {.fn largest_weighted_cliques}: {.arg {(.arg_extra)}}.", i = "Arguments after {.arg ...} must be spelled out in full."), call = base::parent.frame())
      }
      base::c(
        if (!base::missing(vertex.weights)) base::list(vertex.weights = vertex.weights)
      )
    }
    .arg_handle <- .old_signature(...)
    if (base::length(.arg_handle) > 0L) {
      .arg_names <- base::names(.arg_handle)
      .arg_conflict <- base::intersect(.arg_names, base::c(
        if (!base::missing(vertex.weights)) "vertex.weights"
      ))
      if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_conflict)}} of {.fn largest_weighted_cliques} was supplied more than once.", i = "Pass it exactly once, by its new name {.arg {(.arg_conflict)}}."))
      base::list2env(.arg_handle, base::environment())
      lifecycle::deprecate_soft(
        "3.0.0",
        what = base::I("Calling `largest_weighted_cliques()` with positional or abbreviated arguments"),
        details = base::c(
          i = base::paste0("Detected call:  largest_weighted_cliques(", base::paste(base::c("graph", .arg_names), collapse = ", "), ")"),
          i = base::paste0("Use instead:    largest_weighted_cliques(", base::paste(base::c("graph", base::paste0(.arg_names, " = ")), collapse = ", "), ")")
        )
      )
    }
  }
  # END GENERATED ARG_HANDLE

  largest_weighted_cliques_impl(
    graph = graph,
    vertex_weights = vertex.weights
  )
}
#' @inheritParams rlang::args_dots_empty
#' @export
#' @rdname cliques
weighted_clique_num <- function(
  graph,
  ...,
  vertex.weights = NULL
) {
  # BEGIN GENERATED ARG_HANDLE: weighted_clique_num, do not edit, see tools/generate-migrations.R
  # fmt: skip
  if (...length() > 0L) {
    # Pre-3.0.0 signature: weighted_clique_num(graph, vertex.weights)
    .old_signature <- function(vertex.weights, ...) {
      if (...length() > 0L) {
        .arg_extra <- base::names(base::substitute(...()))
        .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]
        if (base::length(.arg_extra) == 0L) cli::cli_abort("Too many arguments passed to {.fn weighted_clique_num}.", call = base::parent.frame())
        cli::cli_abort(base::c("Unexpected argument passed to {.fn weighted_clique_num}: {.arg {(.arg_extra)}}.", i = "Arguments after {.arg ...} must be spelled out in full."), call = base::parent.frame())
      }
      base::c(
        if (!base::missing(vertex.weights)) base::list(vertex.weights = vertex.weights)
      )
    }
    .arg_handle <- .old_signature(...)
    if (base::length(.arg_handle) > 0L) {
      .arg_names <- base::names(.arg_handle)
      .arg_conflict <- base::intersect(.arg_names, base::c(
        if (!base::missing(vertex.weights)) "vertex.weights"
      ))
      if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_conflict)}} of {.fn weighted_clique_num} was supplied more than once.", i = "Pass it exactly once, by its new name {.arg {(.arg_conflict)}}."))
      base::list2env(.arg_handle, base::environment())
      lifecycle::deprecate_soft(
        "3.0.0",
        what = base::I("Calling `weighted_clique_num()` with positional or abbreviated arguments"),
        details = base::c(
          i = base::paste0("Detected call:  weighted_clique_num(", base::paste(base::c("graph", .arg_names), collapse = ", "), ")"),
          i = base::paste0("Use instead:    weighted_clique_num(", base::paste(base::c("graph", base::paste0(.arg_names, " = ")), collapse = ", "), ")")
        )
      )
    }
  }
  # END GENERATED ARG_HANDLE

  weighted_clique_number_impl(
    graph = graph,
    vertex_weights = vertex.weights
  )
}

#' Independent vertex sets
#'
#' A vertex set is called independent if there no edges between any two
#' vertices in it. These functions find independent vertex sets in undirected
#' graphs
#'
#' `ivs()` finds all independent vertex sets in the
#' network, obeying the size limitations given in the `min` and `max`
#' arguments.
#'
#' `largest_ivs()` finds the largest independent vertex
#' sets in the graph. An independent vertex set is largest if there is no
#' independent vertex set with more vertices.
#'
#' `max_ivs()` finds the maximal independent vertex
#' sets in the graph. An independent vertex set is maximal if it cannot be
#' extended to a larger independent vertex set. The largest independent vertex
#' sets are maximal, but the opposite is not always true.
#'
#' `ivs_size()` calculate the size of the largest independent
#' vertex set(s).
#'
#' `independence_number()` is an alias for `ivs_size()`.
#'
#' These functions use the algorithm described by Tsukiyama et al., see
#' reference below.
#'
#' `is_ivs()` tests if no pairs within a vertex set are connected.
#'
#' @param graph The input graph, directed graphs are considered as undirected,
#'   loop edges and multiple edges are ignored.
#' @param min Numeric constant, limit for the minimum size of the independent
#'   vertex sets to find. `NULL` means no limit.
#' @param max Numeric constant, limit for the maximum size of the independent
#'   vertex sets to find. `NULL` means no limit.
#' @return `ivs()`,
#'   `largest_ivs()` and
#'   `max_ivs()` return a list containing numeric
#'   vertex IDs, each list element is an independent vertex set.
#'
#'   `ivs_size()` returns an integer constant.
#' @author Tamas Nepusz \email{ntamas@@gmail.com} ported it from the Very Nauty
#' Graph Library by Keith Briggs (<https://keithbriggs.info/>) and Gabor
#' Csardi \email{csardi.gabor@@gmail.com} wrote the R interface and this manual
#' page.
#' @references S. Tsukiyama, M. Ide, H. Ariyoshi and I. Shirawaka. A new
#' algorithm for generating all the maximal independent sets. *SIAM J
#' Computing*, 6:505--517, 1977.
#' @family cliques
#' @export
#' @keywords graphs
#' @examples
#'
#' # Do not run, takes a couple of seconds
#'
#' # A quite dense graph
#' set.seed(42)
#' g <- sample_gnp(100, 0.9)
#' ivs_size(g)
#' ivs(g, min = ivs_size(g))
#' largest_ivs(g)
#' # Empty graph
#' induced_subgraph(g, largest_ivs(g)[[1]])
#'
#' length(max_ivs(g))
ivs <- function(graph, min = NULL, max = NULL) {
  ensure_igraph(graph)

  if (is.null(min)) {
    min <- 0
  }

  if (is.null(max)) {
    max <- 0
  }

  on.exit(.Call(Rx_igraph_finalizer))
  res <- .Call(
    Rx_igraph_independent_vertex_sets,
    graph,
    as.numeric(min),
    as.numeric(max)
  )
  res <- lapply(res, `+`, 1)

  if (igraph_opt("return.vs.es")) {
    res <- create_vs_list(graph, res)
  }

  res
}

#' @rdname ivs
#' @export
largest_ivs <- function(graph) {
  largest_independent_vertex_sets_impl(
    graph = graph
  )
}

#' @rdname ivs
#' @export
max_ivs <- function(graph) {
  maximal_independent_vertex_sets_impl(
    graph = graph
  )
}

#' Maximal independent vertex sets in the graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `maximal_ivs()` was renamed to [max_ivs()] to create a more
#' consistent API.
#' @export
#' @inheritParams max_ivs
#' @keywords internal
maximal_ivs <- function(graph) {
  lifecycle::deprecate_warn("2.1.0", "maximal_ivs()", "max_ivs()")
  max_ivs(graph)
}

#' @rdname ivs
#' @export
ivs_size <- function(graph) {
  independence_number_impl(
    graph = graph
  )
}

#' @rdname ivs
#' @export
independence_number <- ivs_size

#' @rdname cliques
#' @inheritParams rlang::args_dots_empty
#' @export
clique_size_counts <- function(
  graph,
  ...,
  min = 0,
  max = 0,
  maximal = FALSE
) {
  # BEGIN GENERATED ARG_HANDLE: clique_size_counts, do not edit, see tools/generate-migrations.R
  # fmt: skip
  if (...length() > 0L) {
    .arg_ambiguous <- base::intersect(base::names(base::substitute(...())), base::c("m", "ma"))
    if (base::length(.arg_ambiguous) > 0L) cli::cli_abort("Argument {.arg {(.arg_ambiguous[[1L]])}} matches multiple arguments of {.fn clique_size_counts}.")
    # Pre-3.0.0 signature: clique_size_counts(graph, min, max, maximal)
    .old_signature <- function(min, max, maximal, ...) {
      if (...length() > 0L) {
        .arg_extra <- base::names(base::substitute(...()))
        .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]
        if (base::length(.arg_extra) == 0L) cli::cli_abort("Too many arguments passed to {.fn clique_size_counts}.", call = base::parent.frame())
        cli::cli_abort(base::c("Unexpected argument passed to {.fn clique_size_counts}: {.arg {(.arg_extra)}}.", i = "Arguments after {.arg ...} must be spelled out in full."), call = base::parent.frame())
      }
      base::c(
        if (!base::missing(min)) base::list(min = min),
        if (!base::missing(max)) base::list(max = max),
        if (!base::missing(maximal)) base::list(maximal = maximal)
      )
    }
    .arg_handle <- .old_signature(...)
    if (base::length(.arg_handle) > 0L) {
      .arg_names <- base::names(.arg_handle)
      .arg_conflict <- base::intersect(.arg_names, base::c(
        if (!base::missing(min)) "min",
        if (!base::missing(max)) "max",
        if (!base::missing(maximal)) "maximal"
      ))
      if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_conflict)}} of {.fn clique_size_counts} was supplied more than once.", i = "Pass it exactly once, by its new name {.arg {(.arg_conflict)}}."))
      base::list2env(.arg_handle, base::environment())
      lifecycle::deprecate_soft(
        "3.0.0",
        what = base::I("Calling `clique_size_counts()` with positional or abbreviated arguments"),
        details = base::c(
          i = base::paste0("Detected call:  clique_size_counts(", base::paste(base::c("graph", .arg_names), collapse = ", "), ")"),
          i = base::paste0("Use instead:    clique_size_counts(", base::paste(base::c("graph", base::paste0(.arg_names, " = ")), collapse = ", "), ")")
        )
      )
    }
  }
  # END GENERATED ARG_HANDLE

  if (maximal) {
    maximal_cliques_hist_impl(
      graph = graph,
      min_size = min,
      max_size = max
    )
  } else {
    clique_size_hist_impl(
      graph = graph,
      min_size = min,
      max_size = max
    )
  }
}

#' Is this a complete graph?
#'
#' A graph is considered complete if there is an edge between all distinct
#' directed pairs of vertices. igraph considers both the singleton graph
#' and the null graph complete.
#'
#' @param graph The input graph.
#' @return True if the graph is complete.
#' @family cliques
#' @keywords graphs
#' @seealso [make_full_graph()]
#' @export
#' @examples
#'
#' g <- make_full_graph(6, directed = TRUE)
#' is_complete(g)
#' g <- delete_edges(g, 1)
#' is_complete(g)
#' g <- as_undirected(g)
#' is_complete(g)
is_complete <- function(graph) {
  is_complete_impl(
    graph = graph
  )
}

#' @rdname cliques
#'
#' @description
#' Tests if all pairs within a set of vertices are adjacent, i.e. whether they
#' form a clique. An empty set and singleton set are considered to be a clique.
#'
#' @param graph The input graph.
#' @param candidate The vertex set to test for being a clique.
#' @inheritParams rlang::args_dots_empty
#' @param directed Whether to consider edge directions.
#' @return `is_clique()` returns `TRUE` if the candidate vertex set forms
#'   a clique.
#' @keywords graphs
#' @export
is_clique <- function(
  graph,
  candidate,
  ...,
  directed = FALSE
) {
  # BEGIN GENERATED ARG_HANDLE: is_clique, do not edit, see tools/generate-migrations.R
  # fmt: skip
  if (...length() > 0L) {
    # Pre-3.0.0 signature: is_clique(graph, candidate, directed)
    .old_signature <- function(directed, ...) {
      if (...length() > 0L) {
        .arg_extra <- base::names(base::substitute(...()))
        .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]
        if (base::length(.arg_extra) == 0L) cli::cli_abort("Too many arguments passed to {.fn is_clique}.", call = base::parent.frame())
        cli::cli_abort(base::c("Unexpected argument passed to {.fn is_clique}: {.arg {(.arg_extra)}}.", i = "Arguments after {.arg ...} must be spelled out in full."), call = base::parent.frame())
      }
      base::c(
        if (!base::missing(directed)) base::list(directed = directed)
      )
    }
    .arg_handle <- .old_signature(...)
    if (base::length(.arg_handle) > 0L) {
      .arg_names <- base::names(.arg_handle)
      .arg_conflict <- base::intersect(.arg_names, base::c(
        if (!base::missing(directed)) "directed"
      ))
      if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_conflict)}} of {.fn is_clique} was supplied more than once.", i = "Pass it exactly once, by its new name {.arg {(.arg_conflict)}}."))
      base::list2env(.arg_handle, base::environment())
      lifecycle::deprecate_soft(
        "3.0.0",
        what = base::I("Calling `is_clique()` with positional or abbreviated arguments"),
        details = base::c(
          i = base::paste0("Detected call:  is_clique(", base::paste(base::c("graph", "candidate", .arg_names), collapse = ", "), ")"),
          i = base::paste0("Use instead:    is_clique(", base::paste(base::c("graph", "candidate", base::paste0(.arg_names, " = ")), collapse = ", "), ")")
        )
      )
    }
  }
  # END GENERATED ARG_HANDLE

  is_clique_impl(
    graph = graph,
    candidate = candidate,
    directed = directed
  )
}

#' @rdname ivs
#'
#' @param graph The input graph.
#' @param candidate The vertex set to test for being an independent set.
#' @return `is_ivs()` returns `TRUE` if the candidate vertex set forms an
#'   independent set.
#' @keywords graphs
#' @export
is_ivs <- function(graph, candidate) {
  is_independent_vertex_set_impl(
    graph = graph,
    candidate = candidate
  )
}
