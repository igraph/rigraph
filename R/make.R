
#' Create an igraph graph from a list of edges, or a notable graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph()` was renamed to `make_graph()` to create a more
#' consistent API.
#' @inheritParams make_graph
#' @keywords internal
#' @export
graph <- function(edges , ... , n = max(edges) , isolates = NULL , directed = TRUE , dir = directed , simplify = TRUE) { # nocov start
   lifecycle::deprecate_soft("2.0.4", "graph()", "make_graph()")
     if (inherits(edges, "formula")) {
    if (!missing(n)) stop("'n' should not be given for graph literals")
    if (!missing(isolates)) {
      stop("'isolates' should not be given for graph literals")
    }
    if (!missing(directed)) {
      stop("'directed' should not be given for graph literals")
    }

    mf <- as.list(match.call())[-1]
    mf[[1]] <- mf[[1]][[2]]
    graph_from_literal_i(mf)
  } else {
    if (!missing(simplify)) {
      stop("'simplify' should only be used for graph literals")
    }

    if (!missing(dir) && !missing(directed)) {
      stop("Only give one of 'dir' and 'directed'")
    }

    if (!missing(dir) && missing(directed)) directed <- dir

    if (is.character(edges) && length(edges) == 1) {
      if (!missing(n)) warning("'n' is ignored for the '", edges, "' graph")
      if (!missing(isolates)) {
        warning("'isolates' is ignored for the '", edges, "' graph")
      }
      if (!missing(directed)) {
        warning("'directed' is ignored for the '", edges, "' graph")
      }
      if (!missing(dir)) {
        warning("'dir' is ignored for the '", edges, "' graph")
      }
      if (length(list(...))) stop("Extra arguments in make_graph")

      make_famous_graph(edges)

      ## NULL and empty logical vector is allowed for compatibility
    } else if (is.numeric(edges) || is.null(edges) ||
      (is.logical(edges) && length(edges) == 0)) {
      if (is.null(edges) || is.logical(edges)) edges <- as.numeric(edges)
      if (!is.null(isolates)) {
        warning("'isolates' ignored for numeric edge list")
      }

      old_graph <- function(edges, n = max(edges), directed = TRUE) {
        on.exit(.Call(R_igraph_finalizer))
        if (missing(n) && (is.null(edges) || length(edges) == 0)) {
          n <- 0
        }
        .Call(
          R_igraph_create, as.numeric(edges) - 1, as.numeric(n),
          as.logical(directed)
        )
      }

      args <- list(edges, ...)
      if (!missing(n)) args <- c(args, list(n = n))
      if (!missing(directed)) args <- c(args, list(directed = directed))

      do.call(old_graph, args)
    } else if (is.character(edges)) {
      if (!missing(n)) {
        warning("'n' is ignored for edge list with vertex names")
      }
      if (length(list(...))) stop("Extra arguments in make_graph")

      el <- matrix(edges, ncol = 2, byrow = TRUE)
      res <- graph_from_edgelist(el, directed = directed)
      if (!is.null(isolates)) {
        isolates <- as.character(isolates)
        res <- res + vertices(isolates)
      }
      res
    } else {
      stop("'edges' must be numeric or character")
    }
  }
} # nocov end

#' Create an igraph graph from a list of edges, or a notable graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.famous()` was renamed to `make_graph()` to create a more
#' consistent API.
#' @inheritParams make_graph
#' @keywords internal
#' @export
graph.famous <- function(edges , ... , n = max(edges) , isolates = NULL , directed = TRUE , dir = directed , simplify = TRUE) { # nocov start
   lifecycle::deprecate_soft("2.0.4", "graph.famous()", "make_graph()")
     if (inherits(edges, "formula")) {
    if (!missing(n)) stop("'n' should not be given for graph literals")
    if (!missing(isolates)) {
      stop("'isolates' should not be given for graph literals")
    }
    if (!missing(directed)) {
      stop("'directed' should not be given for graph literals")
    }

    mf <- as.list(match.call())[-1]
    mf[[1]] <- mf[[1]][[2]]
    graph_from_literal_i(mf)
  } else {
    if (!missing(simplify)) {
      stop("'simplify' should only be used for graph literals")
    }

    if (!missing(dir) && !missing(directed)) {
      stop("Only give one of 'dir' and 'directed'")
    }

    if (!missing(dir) && missing(directed)) directed <- dir

    if (is.character(edges) && length(edges) == 1) {
      if (!missing(n)) warning("'n' is ignored for the '", edges, "' graph")
      if (!missing(isolates)) {
        warning("'isolates' is ignored for the '", edges, "' graph")
      }
      if (!missing(directed)) {
        warning("'directed' is ignored for the '", edges, "' graph")
      }
      if (!missing(dir)) {
        warning("'dir' is ignored for the '", edges, "' graph")
      }
      if (length(list(...))) stop("Extra arguments in make_graph")

      make_famous_graph(edges)

      ## NULL and empty logical vector is allowed for compatibility
    } else if (is.numeric(edges) || is.null(edges) ||
      (is.logical(edges) && length(edges) == 0)) {
      if (is.null(edges) || is.logical(edges)) edges <- as.numeric(edges)
      if (!is.null(isolates)) {
        warning("'isolates' ignored for numeric edge list")
      }

      old_graph <- function(edges, n = max(edges), directed = TRUE) {
        on.exit(.Call(R_igraph_finalizer))
        if (missing(n) && (is.null(edges) || length(edges) == 0)) {
          n <- 0
        }
        .Call(
          R_igraph_create, as.numeric(edges) - 1, as.numeric(n),
          as.logical(directed)
        )
      }

      args <- list(edges, ...)
      if (!missing(n)) args <- c(args, list(n = n))
      if (!missing(directed)) args <- c(args, list(directed = directed))

      do.call(old_graph, args)
    } else if (is.character(edges)) {
      if (!missing(n)) {
        warning("'n' is ignored for edge list with vertex names")
      }
      if (length(list(...))) stop("Extra arguments in make_graph")

      el <- matrix(edges, ncol = 2, byrow = TRUE)
      res <- graph_from_edgelist(el, directed = directed)
      if (!is.null(isolates)) {
        isolates <- as.character(isolates)
        res <- res + vertices(isolates)
      }
      res
    } else {
      stop("'edges' must be numeric or character")
    }
  }
} # nocov end

#' Line graph of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `line.graph()` was renamed to `make_line_graph()` to create a more
#' consistent API.
#' @inheritParams make_line_graph
#' @keywords internal
#' @export
line.graph <- function(graph) { # nocov start
   lifecycle::deprecate_soft("2.0.4", "line.graph()", "make_line_graph()")
     ensure_igraph(graph)

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_linegraph, graph)
  if (igraph_opt("add.params")) {
    res$name <- "Line graph"
  }
  res
} # nocov end

#' Create a ring graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.ring()` was renamed to `make_ring()` to create a more
#' consistent API.
#' @inheritParams make_ring
#' @keywords internal
#' @export
graph.ring <- function(n , directed = FALSE , mutual = FALSE , circular = TRUE) { # nocov start
   lifecycle::deprecate_soft("2.0.4", "graph.ring()", "make_ring()")
     on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_ring, as.numeric(n), as.logical(directed),
    as.logical(mutual), as.logical(circular)
  )
  if (igraph_opt("add.params")) {
    res$name <- "Ring graph"
    res$mutual <- mutual
    res$circular <- circular
  }
  res
} # nocov end

#' Create tree graphs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.tree()` was renamed to `make_tree()` to create a more
#' consistent API.
#' @inheritParams make_tree
#' @keywords internal
#' @export
graph.tree <- function(n , children = 2 , mode = c("out","in","undirected")) { # nocov start
   lifecycle::deprecate_soft("2.0.4", "graph.tree()", "make_tree()")
     mode <- igraph.match.arg(mode)
  mode1 <- switch(mode,
    "out" = 0,
    "in" = 1,
    "undirected" = 2
  )

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_kary_tree, as.numeric(n), as.numeric(children),
    as.numeric(mode1)
  )
  if (igraph_opt("add.params")) {
    res$name <- "Tree"
    res$children <- children
    res$mode <- mode
  }
  res
} # nocov end

#' Create a star graph, a tree with n vertices and n - 1 leaves
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.star()` was renamed to `make_star()` to create a more
#' consistent API.
#' @inheritParams make_star
#' @keywords internal
#' @export
graph.star <- function(n , mode = c("in","out","mutual","undirected") , center = 1) { # nocov start
   lifecycle::deprecate_soft("2.0.4", "graph.star()", "make_star()")
     mode <- igraph.match.arg(mode)
  mode1 <- switch(mode,
    "out" = 0,
    "in" = 1,
    "undirected" = 2,
    "mutual" = 3
  )

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_star, as.numeric(n), as.numeric(mode1),
    as.numeric(center) - 1
  )
  if (igraph_opt("add.params")) {
    res$name <- switch(mode,
      "in" = "In-star",
      "out" = "Out-star",
      "Star"
    )
    res$mode <- mode
    res$center <- center
  }
  res
} # nocov end

#' Creating a graph from LCF notation
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.lcf()` was renamed to `graph_from_lcf()` to create a more
#' consistent API.
#' @inheritParams graph_from_lcf
#' @keywords internal
#' @export
graph.lcf <- function(n , shifts , repeats = 1) { # nocov start
   lifecycle::deprecate_soft("2.0.4", "graph.lcf()", "graph_from_lcf()")
     # Argument checks
  n <- as.numeric(n)
  shifts <- as.numeric(shifts)
  repeats <- as.numeric(repeats)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_lcf_vector, n, shifts, repeats)

  if (igraph_opt("add.params")) {
    res$name <- 'LCF graph'
  }

  res
} # nocov end

#' Create a lattice graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.lattice()` was renamed to `make_lattice()` to create a more
#' consistent API.
#' @inheritParams make_lattice
#' @keywords internal
#' @export
#' @cdocs igraph_square_lattice
graph.lattice <- function(dimvector = NULL , length = NULL , dim = NULL , nei = 1 , directed = FALSE , mutual = FALSE , periodic = FALSE, circular = deprecated()) { # nocov start
  lifecycle::deprecate_soft("2.0.4", "graph.lattice()", "make_lattice()")
  if (is.numeric(length) && length != floor(length)) {
    warning("length was rounded to the nearest integer")
    length <- round(length)
  }

  if (lifecycle::is_present(circular)) {
    lifecycle::deprecate_soft(
      "2.0.3",
      "graph.lattice(circular = 'use periodic argument instead')",
      details = c("`circular` is now deprecated, use `periodic` instead.")
    )
    periodic <- circular
  }

  if (is.numeric(length) && length != floor(length)) {
    warning("length was rounded to the nearest integer")
    length <- round(length)
  }

  if (is.null(dimvector)) {
    dimvector <- rep(length, dim)
  }

  if (length(periodic) == 1) {
    periodic <- rep(periodic, length(dimvector))
  }

  on.exit(.Call(R_igraph_finalizer))
  res <- square_lattice_impl(dimvector, nei, directed, mutual, periodic)
  if (igraph_opt("add.params")) {
    res$name <- "Lattice graph"
    res$dimvector <- dimvector
    res$nei <- nei
    res$mutual <- mutual
    res$circular <- periodic
  }
  res
} # nocov end

#' Kautz graphs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.kautz()` was renamed to `make_kautz_graph()` to create a more
#' consistent API.
#' @inheritParams make_kautz_graph
#' @keywords internal
#' @export
graph.kautz <- function(m , n) { # nocov start
   lifecycle::deprecate_soft("2.0.4", "graph.kautz()", "make_kautz_graph()")
     on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_kautz, as.numeric(m), as.numeric(n))
  if (igraph_opt("add.params")) {
    res$name <- sprintf("Kautz graph %i-%i", m, n)
    res$m <- m
    res$n <- n
  }
  res
} # nocov end

#' Create a complete (full) citation graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.full.citation()` was renamed to `make_full_citation_graph()` to create a more
#' consistent API.
#' @inheritParams make_full_citation_graph
#' @keywords internal
#' @export
graph.full.citation <- function(n , directed = TRUE) { # nocov start
   lifecycle::deprecate_soft("2.0.4", "graph.full.citation()", "make_full_citation_graph()")
     # Argument checks
  n <- as.numeric(n)
  directed <- as.logical(directed)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_full_citation, n, directed)

  res <- set_graph_attr(res, "name", "Full citation graph")
  res
} # nocov end

#' Create a full bipartite graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.full.bipartite()` was renamed to `make_full_bipartite_graph()` to create a more
#' consistent API.
#' @inheritParams make_full_bipartite_graph
#' @keywords internal
#' @export
graph.full.bipartite <- function(n1 , n2 , directed = FALSE , mode = c("all","out","in")) { # nocov start
   lifecycle::deprecate_soft("2.0.4", "graph.full.bipartite()", "make_full_bipartite_graph()")
     n1 <- as.numeric(n1)
  n2 <- as.numeric(n2)
  directed <- as.logical(directed)
  mode1 <- switch(igraph.match.arg(mode),
    "out" = 1,
    "in" = 2,
    "all" = 3,
    "total" = 3
  )

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_full_bipartite, n1, n2, as.logical(directed), mode1)
  if (igraph_opt("add.params")) {
    res$graph$name <- "Full bipartite graph"
    res$n1 <- n1
    res$n2 <- n2
    res$mode <- mode
  }
  set_vertex_attr(res$graph, "type", value = res$types)
} # nocov end

#' Create a full graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.full()` was renamed to `make_full_graph()` to create a more
#' consistent API.
#' @inheritParams make_full_graph
#' @keywords internal
#' @export
graph.full <- function(n , directed = FALSE , loops = FALSE) { # nocov start
   lifecycle::deprecate_soft("2.0.4", "graph.full()", "make_full_graph()")
     on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_full, as.numeric(n), as.logical(directed),
    as.logical(loops)
  )
  if (igraph_opt("add.params")) {
    res$name <- "Full graph"
    res$loops <- loops
  }
  res
} # nocov end

#' Creating (small) graphs via a simple interface
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.formula()` was renamed to `graph_from_literal()` to create a more
#' consistent API.
#' @inheritParams graph_from_literal
#' @keywords internal
#' @export
graph.formula <- function(... , simplify = TRUE) { # nocov start
   lifecycle::deprecate_soft("2.0.4", "graph.formula()", "graph_from_literal()")
     mf <- as.list(match.call())[-1]
  graph_from_literal_i(mf)
} # nocov end

#' Create an extended chordal ring graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.extended.chordal.ring()` was renamed to `make_chordal_ring()` to create a more
#' consistent API.
#' @inheritParams make_chordal_ring
#' @keywords internal
#' @export
graph.extended.chordal.ring <- function(n , w , directed = FALSE) { # nocov start
   lifecycle::deprecate_soft("2.0.4", "graph.extended.chordal.ring()", "make_chordal_ring()")
     on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_extended_chordal_ring, as.numeric(n),
    as.matrix(w), as.logical(directed)
  )
  if (igraph_opt("add.params")) {
    res$name <- "Extended chordal ring"
    res$w <- w
  }
  res
} # nocov end

#' A graph with no edges
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.empty()` was renamed to `make_empty_graph()` to create a more
#' consistent API.
#' @inheritParams make_empty_graph
#' @keywords internal
#' @export
graph.empty <- function(n = 0 , directed = TRUE) { # nocov start
   lifecycle::deprecate_soft("2.0.4", "graph.empty()", "make_empty_graph()")
     # Argument checks
  n <- as.numeric(n)
  directed <- as.logical(directed)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_empty, n, directed)

  res
} # nocov end

#' De Bruijn graphs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.de.bruijn()` was renamed to `make_de_bruijn_graph()` to create a more
#' consistent API.
#' @inheritParams make_de_bruijn_graph
#' @keywords internal
#' @export
graph.de.bruijn <- function(m , n) { # nocov start
   lifecycle::deprecate_soft("2.0.4", "graph.de.bruijn()", "make_de_bruijn_graph()")
     on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_de_bruijn, as.numeric(m), as.numeric(n))
  if (igraph_opt("add.params")) {
    res$name <- sprintf("De-Bruijn graph %i-%i", m, n)
    res$m <- m
    res$n <- n
  }
  res
} # nocov end

#' Create a bipartite graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.bipartite()` was renamed to `make_bipartite_graph()` to create a more
#' consistent API.
#' @inheritParams make_bipartite_graph
#' @keywords internal
#' @export
graph.bipartite <- function(types , edges , directed = FALSE) { # nocov start
   lifecycle::deprecate_soft("2.0.4", "graph.bipartite()", "make_bipartite_graph()")
     vertex.names <- names(types)

  if (is.character(edges)) {
    if (is.null(vertex.names)) {
      stop("`types` vector must be named when the edge vector contains strings")
    }
    edges <- match(edges, vertex.names)
    if (any(is.na(edges))) {
      stop("edge vector contains a vertex name that is not found in `types`")
    }
  }

  types <- as.logical(types)
  edges <- as.numeric(edges) - 1
  directed <- as.logical(directed)

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_create_bipartite, types, edges, directed)
  res <- set_vertex_attr(res, "type", value = types)

  if (!is.null(vertex.names)) {
    res <- set_vertex_attr(res, "name", value = vertex.names)
  }

  res
} # nocov end

#' Create a graph from the Graph Atlas
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.atlas()` was renamed to `graph_from_atlas()` to create a more
#' consistent API.
#' @inheritParams graph_from_atlas
#' @keywords internal
#' @export
graph.atlas <- function(n) { # nocov start
   lifecycle::deprecate_soft("2.0.4", "graph.atlas()", "graph_from_atlas()")
     on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_atlas, as.numeric(n))
  if (igraph_opt("add.params")) {
    res$name <- sprintf("Graph from the Atlas #%i", n)
    res$n <- n
  }
  res
} # nocov end

## ----------------------------------------------------------------
##
##   IGraph R package
##   Copyright (C) 2005-2014  Gabor Csardi <csardi.gabor@gmail.com>
##   334 Harvard street, Cambridge, MA 02139 USA
##
##   This program is free software; you can redistribute it and/or modify
##   it under the terms of the GNU General Public License as published by
##   the Free Software Foundation; either version 2 of the License, or
##   (at your option) any later version.
##
##   This program is distributed in the hope that it will be useful,
##   but WITHOUT ANY WARRANTY; without even the implied warranty of
##   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##   GNU General Public License for more details.
##
##   You should have received a copy of the GNU General Public License
##   along with this program; if not, write to the Free Software
##   Foundation, Inc.,  51 Franklin Street, Fifth Floor, Boston, MA
##   02110-1301 USA
##
## -----------------------------------------------------------------

#' Takes an argument list and extracts the constructor specification and
#' constructor modifiers from it.
#'
#' This is a helper function for the common parts of `make_()` and
#' `sample_()`.
#'
#' @param ... Parameters to extract from
#' @param .operation Human-readable description of the operation that this
#'   helper is a part of
#' @param .variant Constructor variant; must be one of \sQuote{make},
#'   \sQuote{graph} or \sQuote{sample}. Used in cases when the same constructor
#'   specification has deterministic and random variants.
#' @family constructor modifiers
#' @return A named list with three items: \sQuote{cons} for the constructor
#'   function, \sQuote{mods} for the modifiers and \sQuote{args} for the
#'   remaining, unparsed arguments.
#' @noRd
.extract_constructor_and_modifiers <- function(..., .operation, .variant) {
  args <- list(...)
  cidx <- vapply(args, inherits, TRUE, what = "igraph_constructor_spec")
  if (sum(cidx) == 0) {
    stop("Don't know how to ", .operation, ", nothing given")
  }
  if (sum(cidx) > 1) {
    stop("Don't know how to ", .operation, ", multiple constructors given")
  }
  cons <- args[cidx][[1]]
  args <- args[!cidx]

  ## Modifiers
  wmods <- vapply(args, inherits, TRUE, what = "igraph_constructor_modifier")
  mods <- args[wmods]
  args <- args[!wmods]

  ## Resolve the actual function in the specifier if it has multiple variants
  if (!is.function(cons$fun)) {
    variants <- names(cons$fun)
    ## 'graph' can fall back to 'make' and vice versa if one is present but
    ## not the other
    if (!(.variant %in% variants)) {
      if (.variant == "graph" && "make" %in% variants) {
        .variant <- "make"
      } else if (.variant == "make" && "graph" %in% variants) {
        .variant <- "graph"
      }
    }
    if (.variant %in% variants) {
      cons$fun <- cons$fun[[.variant]]
    } else {
      stop("Don't know how to ", .operation, ", unknown constructor")
    }
  }

  list(cons = cons, mods = mods, args = args)
}

#'   Applies a set of constructor modifiers to an already constructed graph.
#'
#'   This is a helper function for the common parts of `make_()` and
#'   `sample_()`.
#'
#' @param graph The graph to apply the modifiers to
#' @param mods The modifiers to apply
#' @family constructor modifiers
#' @return The modified graph
#' @noRd
.apply_modifiers <- function(graph, mods) {
  for (m in mods) {
    if (m$id == "without_attr") {
      ## TODO: speed this up
      ga <- graph_attr_names(graph)
      va <- vertex_attr_names(graph)
      ea <- edge_attr_names(graph)
      for (g in ga) graph <- delete_graph_attr(graph, g)
      for (v in va) graph <- delete_vertex_attr(graph, v)
      for (e in ea) graph <- delete_edge_attr(graph, e)
    } else if (m$id == "without_loops") {
      graph <- simplify(graph, remove.loops = TRUE, remove.multiple = FALSE)
    } else if (m$id == "without_multiples") {
      graph <- simplify(graph, remove.loops = FALSE, remove.multiple = TRUE)
    } else if (m$id == "simplified") {
      graph <- simplify(graph)
    } else if (m$id == "with_vertex_") {
      m$args <- lapply(m$args, eval)
      ## TODO speed this up
      for (a in seq_along(m$args)) {
        n <- names(m$args)[a]
        v <- m$args[[a]]
        stopifnot(!is.null(n))
        graph <- set_vertex_attr(graph, n, value = v)
      }
    } else if (m$id == "with_edge_") {
      m$args <- lapply(m$args, eval)
      ## TODO speed this up
      for (a in seq_along(m$args)) {
        n <- names(m$args)[a]
        v <- m$args[[a]]
        stopifnot(!is.null(n))
        graph <- set_edge_attr(graph, n, value = v)
      }
    } else if (m$id == "with_graph_") {
      m$args <- lapply(m$args, eval)
      ## TODO speed this up
      for (a in seq_along(m$args)) {
        n <- names(m$args)[a]
        v <- m$args[[a]]
        stopifnot(!is.null(n))
        graph <- set_graph_attr(graph, n, value = v)
      }
    }
  }

  graph
}

#'   Make a new graph
#'
#'   This is a generic function for creating graphs.
#'
#' @details
#' `make_()` is a generic function for creating graphs.
#' For every graph constructor in igraph that has a `make_` prefix,
#' there is a corresponding function without the prefix: e.g.
#' for [make_ring()] there is also [ring()], etc.
#'
#' The same is true for the random graph samplers, i.e. for each
#' constructor with a `sample_` prefix, there is a corresponding
#' function without that prefix.
#'
#' These shorter forms can be used together with `make_()`.
#' The advantage of this form is that the user can specify constructor
#' modifiers which work with all constructors. E.g. the
#' [with_vertex_()] modifier adds vertex attributes
#' to the newly created graphs.
#'
#' See the examples and the various constructor modifiers below.
#'
#' @param ... Parameters, see details below.
#'
#' @export
#' @examples
#' r <- make_(ring(10))
#' l <- make_(lattice(c(3, 3, 3)))
#'
#' r2 <- make_(ring(10), with_vertex_(color = "red", name = LETTERS[1:10]))
#' l2 <- make_(lattice(c(3, 3, 3)), with_edge_(weight = 2))
#'
#' ran <- sample_(degseq(c(3, 3, 3, 3, 3, 3), method = "configuration"), simplified())
#' degree(ran)
#' is_simple(ran)
#' @family deterministic constructors
#' @family constructor modifiers
make_ <- function(...) {
  me <- attr(sys.function(), "name") %||% "construct"
  extracted <- .extract_constructor_and_modifiers(..., .operation = me, .variant = "make")
  cons <- extracted$cons

  if (cons$lazy) {
    cons_args <- lapply(cons$args, rlang::quo_get_expr)
  } else {
    cons_args <- lapply(cons$args, rlang::eval_tidy)
  }

  res <- do_call(cons$fun, cons_args, extracted$args)
  .apply_modifiers(res, extracted$mods)
}

#' Sample from a random graph model
#'
#' Generic function for sampling from network models.
#'
#' @details
#' `sample_()` is a generic function for creating graphs.
#' For every graph constructor in igraph that has a `sample_` prefix,
#' there is a corresponding function without the prefix: e.g.
#' for [sample_pa()] there is also [pa()], etc.
#'
#' The same is true for the deterministic graph samplers, i.e. for each
#' constructor with a `make_` prefix, there is a corresponding
#' function without that prefix.
#'
#' These shorter forms can be used together with `sample_()`.
#' The advantage of this form is that the user can specify constructor
#' modifiers which work with all constructors. E.g. the
#' [with_vertex_()] modifier adds vertex attributes
#' to the newly created graphs.
#'
#' See the examples and the various constructor modifiers below.
#'
#'
#' @param ... Parameters, see details below.
#'
#' @export
#' @examples
#' pref_matrix <- cbind(c(0.8, 0.1), c(0.1, 0.7))
#' blocky <- sample_(sbm(
#'   n = 20, pref.matrix = pref_matrix,
#'   block.sizes = c(10, 10)
#' ))
#'
#' blocky2 <- pref_matrix %>%
#'   sample_sbm(n = 20, block.sizes = c(10, 10))
#'
#' ## Arguments are passed on from sample_ to sample_sbm
#' blocky3 <- pref_matrix %>%
#'   sample_(sbm(), n = 20, block.sizes = c(10, 10))
#' @family games
#' @family constructor modifiers
sample_ <- function(...) {
  me <- attr(sys.function(), "name") %||% "construct"
  extracted <- .extract_constructor_and_modifiers(..., .operation = me, .variant = "sample")
  cons <- extracted$cons

  if (cons$lazy) {
    cons_args <- lapply(cons$args, rlang::quo_get_expr)
  } else {
    cons_args <- lapply(cons$args, rlang::eval_tidy)
  }

  res <- do_call(cons$fun, cons_args, extracted$args)
  .apply_modifiers(res, extracted$mods)
}

#' Convert object to a graph
#'
#' This is a generic function to convert R objects to igraph graphs.
#'
#' @details
#' TODO
#'
#' @param ... Parameters, see details below.
#'
#' @export
#' @examples
#' ## These are equivalent
#' graph_(cbind(1:5, 2:6), from_edgelist(directed = FALSE))
#' graph_(cbind(1:5, 2:6), from_edgelist(), directed = FALSE)
graph_ <- function(...) {
  lifecycle::deprecate_soft(
    "2.0.4",
    "graph_()",
    details = c(
      "Please use constructors directly, for instance graph_from_edgelist().",
      "graph_() will be removed in a future version of igraph."
    )
  )
  me <- attr(sys.function(), "name") %||% "construct"
  extracted <- .extract_constructor_and_modifiers(..., .operation = me, .variant = "graph")
  cons <- extracted$cons

  if (cons$lazy) {
    cons_args <- lapply(cons$args, rlang::quo_get_expr)
  } else {
    cons_args <- lapply(cons$args, rlang::eval_tidy)
  }

  res <- do_call(cons$fun, cons_args, extracted$args)
  .apply_modifiers(res, extracted$mods)
}

attr(make_, "name") <- "make_"
attr(sample_, "name") <- "sample_"
attr(graph_, "name") <- "graph_"

constructor_spec <- function(fun, ..., .lazy = FALSE) {
  structure(
    list(
      fun = fun,
      args = rlang::enquos(...),
      lazy = .lazy
    ),
    class = "igraph_constructor_spec"
  )
}


## -----------------------------------------------------------------
## Constructor modifiers

constructor_modifier <- function(...) {
  structure(
    list(...),
    class = "igraph_constructor_modifier"
  )
}


#' Construtor modifier to remove all attributes from a graph
#'
#' @family constructor modifiers
#'
#' @export
#' @examples
#' g1 <- make_ring(10)
#' g1
#'
#' g2 <- make_(ring(10), without_attr())
#' g2
without_attr <- function() {
  constructor_modifier(
    id = "without_attr"
  )
}


#' Constructor modifier to drop loop edges
#'
#' @family constructor modifiers
#'
#' @export
#' @examples
#' # An artificial example
#' make_(full_graph(5, loops = TRUE))
#' make_(full_graph(5, loops = TRUE), without_loops())
without_loops <- function() {
  constructor_modifier(
    id = "without_loops"
  )
}


#' Constructor modifier to drop multiple edges
#'
#' @family constructor modifiers
#'
#' @export
#' @examples
#' sample_(pa(10, m = 3, algorithm = "bag"))
#' sample_(pa(10, m = 3, algorithm = "bag"), without_multiples())
without_multiples <- function() {
  constructor_modifier(
    id = "without_multiples"
  )
}


#' Constructor modifier to drop multiple and loop edges
#'
#' @family constructor modifiers
#'
#' @export
#' @examples
#' sample_(pa(10, m = 3, algorithm = "bag"))
#' sample_(pa(10, m = 3, algorithm = "bag"), simplified())
simplified <- function() {
  constructor_modifier(
    id = "simplified"
  )
}


#' Constructor modifier to add vertex attributes
#'
#' @param ... The attributes to add. They must be named.
#'
#' @family constructor modifiers
#'
#' @export
#' @examples
#' make_(
#'   ring(10),
#'   with_vertex_(
#'     color = "#7fcdbb",
#'     frame.color = "#7fcdbb",
#'     name = LETTERS[1:10]
#'   )
#' ) %>%
#'   plot()
with_vertex_ <- function(...) {
  args <- grab_args()

  constructor_modifier(
    id = "with_vertex_",
    args = args
  )
}


#' Constructor modifier to add edge attributes
#'
#' @param ... The attributes to add. They must be named.
#'
#' @family constructor modifiers
#'
#' @export
#' @examples
#' make_(
#'   ring(10),
#'   with_edge_(
#'     color = "red",
#'     weight = rep(1:2, 5)
#'   )
#' ) %>%
#'   plot()
with_edge_ <- function(...) {
  args <- grab_args()

  constructor_modifier(
    id = "with_edge_",
    args = args
  )
}


#' Constructor modifier to add graph attributes
#'
#' @param ... The attributes to add. They must be named.
#'
#' @family constructor modifiers
#'
#' @export
#' @examples
#' make_(ring(10), with_graph_(name = "10-ring"))
with_graph_ <- function(...) {
  args <- grab_args()

  constructor_modifier(
    id = "with_graph_",
    args = args
  )
}



## -----------------------------------------------------------------

#' Create an igraph graph from a list of edges, or a notable graph
#'
#' @section Notable graphs:
#'
#' `make_graph()` can create some notable graphs. The name of the
#' graph (case insensitive), a character scalar must be supplied as
#' the `edges` argument, and other arguments are ignored. (A warning
#' is given is they are specified.)
#'
#' `make_graph()` knows the following graphs: \describe{
#'   \item{Bull}{The bull graph, 5 vertices, 5 edges, resembles to the head
#'     of a bull if drawn properly.}
#'   \item{Chvatal}{This is the smallest triangle-free graph that is
#'     both 4-chromatic and 4-regular. According to the Grunbaum conjecture there
#'     exists an m-regular, m-chromatic graph with n vertices for every m>1 and
#'     n>2. The Chvatal graph is an example for m=4 and n=12. It has 24 edges.}
#'   \item{Coxeter}{A non-Hamiltonian cubic symmetric graph with 28 vertices and
#'     42 edges.}
#'   \item{Cubical}{The Platonic graph of the cube. A convex regular
#'     polyhedron with 8 vertices and 12 edges.}
#'   \item{Diamond}{A graph with 4 vertices and 5 edges, resembles to a
#'     schematic diamond if drawn properly.}
#'   \item{Dodecahedral, Dodecahedron}{Another Platonic solid with 20 vertices
#'     and 30 edges.}
#'   \item{Folkman}{The semisymmetric graph with minimum number of
#'     vertices, 20 and 40 edges. A semisymmetric graph is regular, edge transitive
#'     and not vertex transitive.}
#'   \item{Franklin}{This is a graph whose embedding
#'     to the Klein bottle can be colored with six colors, it is a counterexample
#'     to the necessity of the Heawood conjecture on a Klein bottle. It has 12
#'     vertices and 18 edges.}
#'   \item{Frucht}{The Frucht Graph is the smallest
#'     cubical graph whose automorphism group consists only of the identity
#'     element. It has 12 vertices and 18 edges.}
#'   \item{Grotzsch}{The Groetzsch
#'     graph is a triangle-free graph with 11 vertices, 20 edges, and chromatic
#'     number 4. It is named after German mathematician Herbert Groetzsch, and its
#'     existence demonstrates that the assumption of planarity is necessary in
#'     Groetzsch's theorem that every triangle-free planar graph is 3-colorable.}
#'   \item{Heawood}{The Heawood graph is an undirected graph with 14 vertices and
#'     21 edges. The graph is cubic, and all cycles in the graph have six or more
#'     edges. Every smaller cubic graph has shorter cycles, so this graph is the
#'     6-cage, the smallest cubic graph of girth 6.}
#'   \item{Herschel}{The Herschel
#'     graph is the smallest nonhamiltonian polyhedral graph. It is the unique such
#'     graph on 11 nodes, and has 18 edges.}
#'   \item{House}{The house graph is a
#'     5-vertex, 6-edge graph, the schematic draw of a house if drawn properly,
#'     basicly a triangle of the top of a square.}
#'   \item{HouseX}{The same as the
#'     house graph with an X in the square. 5 vertices and 8 edges.}
#'   \item{Icosahedral, Icosahedron}{A Platonic solid with 12 vertices and 30
#'     edges.}
#'   \item{Krackhardt kite}{A social network with 10 vertices and 18
#'     edges.  Krackhardt, D. Assessing the Political Landscape: Structure,
#'     Cognition, and Power in Organizations.  Admin. Sci. Quart. 35, 342-369,
#'     1990.}
#'   \item{Levi}{The graph is a 4-arc transitive cubic graph, it has 30
#'     vertices and 45 edges.}
#'   \item{McGee}{The McGee graph is the unique 3-regular
#'     7-cage graph, it has 24 vertices and 36 edges.}
#'   \item{Meredith}{The Meredith
#'     graph is a quartic graph on 70 nodes and 140 edges that is a counterexample
#'     to the conjecture that every 4-regular 4-connected graph is Hamiltonian.}
#'   \item{Noperfectmatching}{A connected graph with 16 vertices and 27 edges
#'     containing no perfect matching. A matching in a graph is a set of pairwise
#'     non-adjacent edges; that is, no two edges share a common vertex. A perfect
#'     matching is a matching which covers all vertices of the graph.}
#'   \item{Nonline}{A graph whose connected components are the 9 graphs whose
#'     presence as a vertex-induced subgraph in a graph makes a nonline graph. It
#'     has 50 vertices and 72 edges.}
#'   \item{Octahedral, Octahedron}{Platonic solid
#'     with 6 vertices and 12 edges.}
#'   \item{Petersen}{A 3-regular graph with 10
#'     vertices and 15 edges. It is the smallest hypohamiltonian graph, i.e. it is
#'     non-hamiltonian but removing any single vertex from it makes it
#'     Hamiltonian.}
#'   \item{Robertson}{The unique (4,5)-cage graph, i.e. a 4-regular
#'    graph of girth 5. It has 19 vertices and 38 edges.}
#'   \item{Smallestcyclicgroup}{A smallest nontrivial graph whose automorphism
#'     group is cyclic. It has 9 vertices and 15 edges.}
#'   \item{Tetrahedral,
#'     Tetrahedron}{Platonic solid with 4 vertices and 6 edges.}
#'   \item{Thomassen}{The smallest hypotraceable graph, on 34 vertices and 52
#'     edges. A hypotraceable graph does not contain a Hamiltonian path but after
#'     removing any single vertex from it the remainder always contains a
#'     Hamiltonian path. A graph containing a Hamiltonian path is called traceable.}
#'   \item{Tutte}{Tait's Hamiltonian graph conjecture states that every
#'     3-connected 3-regular planar graph is Hamiltonian.  This graph is a
#'     counterexample. It has 46 vertices and 69 edges.}
#'   \item{Uniquely3colorable}{Returns a 12-vertex, triangle-free graph with
#'     chromatic number 3 that is uniquely 3-colorable.}
#'   \item{Walther}{An identity
#'     graph with 25 vertices and 31 edges. An identity graph has a single graph
#'     automorphism, the trivial one.}
#'   \item{Zachary}{Social network of friendships
#'     between 34 members of a karate club at a US university in the 1970s. See W.
#'     W. Zachary, An information flow model for conflict and fission in small
#'     groups, Journal of Anthropological Research 33, 452-473 (1977).  } }
#'
#' @encoding UTF-8
#' @param edges A vector defining the edges, the first edge points
#'   from the first element to the second, the second edge from the third
#'   to the fourth, etc. For a numeric vector, these are interpreted
#'   as internal vertex ids. For character vectors, they are interpreted
#'   as vertex names.
#'
#'   Alternatively, this can be a character scalar, the name of a
#'   notable graph. See Notable graphs below. The name is case
#'   insensitive.
#'
#'   Starting from igraph 0.8.0, you can also include literals here,
#'   via igraph's formula notation (see [graph_from_literal()]).
#'   In this case, the first term of the formula has to start with
#'   a \sQuote{`~`} character, just like regular formulae in R.
#'   See examples below.
#' @param ... For `make_graph()`: extra arguments for the case when the
#'   graph is given via a literal, see [graph_from_literal()].
#'   For `directed_graph()` and `undirected_graph()`:
#'   Passed to `make_directed_graph()` or `make_undirected_graph()`.
#' @param n The number of vertices in the graph. This argument is
#'   ignored (with a warning) if `edges` are symbolic vertex names. It
#'   is also ignored if there is a bigger vertex id in `edges`. This
#'   means that for this function it is safe to supply zero here if the
#'   vertex with the largest id is not an isolate.
#' @param isolates Character vector, names of isolate vertices,
#'   for symbolic edge lists. It is ignored for numeric edge lists.
#' @param directed Whether to create a directed graph.
#' @param dir It is the same as `directed`, for compatibility.
#'   Do not give both of them.
#' @param simplify For graph literals, whether to simplify the graph.
#' @return An igraph graph.
#'
#' @family deterministic constructors
#' @export
#' @examples
#' make_graph(c(1, 2, 2, 3, 3, 4, 5, 6), directed = FALSE)
#' make_graph(c("A", "B", "B", "C", "C", "D"), directed = FALSE)
#'
#' solids <- list(
#'   make_graph("Tetrahedron"),
#'   make_graph("Cubical"),
#'   make_graph("Octahedron"),
#'   make_graph("Dodecahedron"),
#'   make_graph("Icosahedron")
#' )
#'
#' graph <- make_graph(
#'   ~ A - B - C - D - A, E - A:B:C:D,
#'   F - G - H - I - F, J - F:G:H:I,
#'   K - L - M - N - K, O - K:L:M:N,
#'   P - Q - R - S - P, T - P:Q:R:S,
#'   B - F, E - J, C - I, L - T, O - T, M - S,
#'   C - P, C - L, I - L, I - P
#' )
make_graph <- function(edges, ..., n = max(edges), isolates = NULL,
                       directed = TRUE, dir = directed, simplify = TRUE) {
  if (inherits(edges, "formula")) {
    if (!missing(n)) stop("'n' should not be given for graph literals")
    if (!missing(isolates)) {
      stop("'isolates' should not be given for graph literals")
    }
    if (!missing(directed)) {
      stop("'directed' should not be given for graph literals")
    }

    mf <- as.list(match.call())[-1]
    mf[[1]] <- mf[[1]][[2]]
    graph_from_literal_i(mf)
  } else {
    if (!missing(simplify)) {
      stop("'simplify' should only be used for graph literals")
    }

    if (!missing(dir) && !missing(directed)) {
      stop("Only give one of 'dir' and 'directed'")
    }

    if (!missing(dir) && missing(directed)) directed <- dir

    if (is.character(edges) && length(edges) == 1) {
      if (!missing(n)) warning("'n' is ignored for the '", edges, "' graph")
      if (!missing(isolates)) {
        warning("'isolates' is ignored for the '", edges, "' graph")
      }
      if (!missing(directed)) {
        warning("'directed' is ignored for the '", edges, "' graph")
      }
      if (!missing(dir)) {
        warning("'dir' is ignored for the '", edges, "' graph")
      }
      if (length(list(...))) stop("Extra arguments in make_graph")

      make_famous_graph(edges)

      ## NULL and empty logical vector is allowed for compatibility
    } else if (is.numeric(edges) || is.null(edges) ||
      (is.logical(edges) && length(edges) == 0)) {
      if (is.null(edges) || is.logical(edges)) edges <- as.numeric(edges)
      if (!is.null(isolates)) {
        warning("'isolates' ignored for numeric edge list")
      }

      old_graph <- function(edges, n = max(edges), directed = TRUE) {
        on.exit(.Call(R_igraph_finalizer))
        if (missing(n) && (is.null(edges) || length(edges) == 0)) {
          n <- 0
        }
        .Call(
          R_igraph_create, as.numeric(edges) - 1, as.numeric(n),
          as.logical(directed)
        )
      }

      args <- list(edges, ...)
      if (!missing(n)) args <- c(args, list(n = n))
      if (!missing(directed)) args <- c(args, list(directed = directed))

      do.call(old_graph, args)
    } else if (is.character(edges)) {
      if (!missing(n)) {
        warning("'n' is ignored for edge list with vertex names")
      }
      if (length(list(...))) stop("Extra arguments in make_graph")

      el <- matrix(edges, ncol = 2, byrow = TRUE)
      res <- graph_from_edgelist(el, directed = directed)
      if (!is.null(isolates)) {
        isolates <- as.character(isolates)
        res <- res + vertices(isolates)
      }
      res
    } else {
      stop("'edges' must be numeric or character")
    }
  }
}

make_famous_graph <- function(name) {
  name <- gsub("\\s", "_", name)

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_famous, as.character(name))
  if (igraph_opt("add.params")) {
    res$name <- capitalize(name)
  }
  res
}

#' @rdname make_graph
#' @export
make_directed_graph <- function(edges, n = max(edges)) {
  if (missing(n)) {
    make_graph(edges, directed = TRUE)
  } else {
    make_graph(edges, n = n, directed = TRUE)
  }
}

#' @rdname make_graph
#' @export
make_undirected_graph <- function(edges, n = max(edges)) {
  if (missing(n)) {
    make_graph(edges, directed = FALSE)
  } else {
    make_graph(edges, n = n, directed = FALSE)
  }
}

#' @rdname make_graph
#' @export
directed_graph <- function(...) constructor_spec(make_directed_graph, ...)

#' @rdname make_graph
#' @export
undirected_graph <- function(...) constructor_spec(make_undirected_graph, ...)

## -----------------------------------------------------------------

#' A graph with no edges
#'
#' @concept Empty graph.
#' @param n Number of vertices.
#' @param directed Whether to create a directed graph.
#' @return An igraph graph.
#'
#' @family deterministic constructors
#' @export
#' @examples
#' make_empty_graph(n = 10)
#' make_empty_graph(n = 5, directed = FALSE)
#' @cdocs igraph_empty
make_empty_graph <- empty_impl

#' @rdname make_empty_graph
#' @param ... Passed to `make_graph_empty`.
#' @export
empty_graph <- function(...) constructor_spec(make_empty_graph, ...)

## -----------------------------------------------------------------


#' Creating (small) graphs via a simple interface
#'
#' This function is useful if you want to create a small (named) graph
#' quickly, it works for both directed and undirected graphs.
#'
#' @details
#' `graph_from_literal()` is very handy for creating small graphs quickly.
#' You need to supply one or more R expressions giving the structure of
#' the graph. The expressions consist of vertex names and edge
#' operators. An edge operator is a sequence of \sQuote{`-`} and
#' \sQuote{`+`} characters, the former is for the edges and the
#' latter is used for arrow heads. The edges can be arbitrarily long,
#' i.e. you may use as many \sQuote{`-`} characters to \dQuote{draw}
#' them as you like.
#'
#' If all edge operators consist of only \sQuote{`-`} characters
#' then the graph will be undirected, whereas a single \sQuote{`+`}
#' character implies a directed graph.
#'
#' Let us see some simple examples. Without arguments the function
#' creates an empty graph:
#' \preformatted{  graph_from_literal()
#' }
#'
#' A simple undirected graph with two vertices called \sQuote{A} and
#' \sQuote{B} and one edge only:
#' \preformatted{  graph_from_literal(A-B)
#' }
#'
#' Remember that the length of the edges does not matter, so we could
#' have written the following, this creates the same graph:
#' \preformatted{  graph_from_literal( A-----B )
#' }
#'
#' If you have many disconnected components in the graph, separate them
#' with commas. You can also give isolate vertices.
#' \preformatted{  graph_from_literal( A--B, C--D, E--F, G--H, I, J, K )
#' }
#'
#' The \sQuote{`:`} operator can be used to define vertex sets. If
#' an edge operator connects two vertex sets then every vertex from the
#' first set will be connected to every vertex in the second set. The
#' following form creates a full graph, including loop edges:
#' \preformatted{  graph_from_literal( A:B:C:D -- A:B:C:D )
#' }
#'
#' In directed graphs, edges will be created only if the edge operator
#' includes a arrow head (\sQuote{+}) *at the end* of the edge:
#' \preformatted{  graph_from_literal( A -+ B -+ C )
#'   graph_from_literal( A +- B -+ C )
#'   graph_from_literal( A +- B -- C )
#' }
#' Thus in the third example no edge is created between vertices `B`
#' and `C`.
#'
#' Mutual edges can be also created with a simple edge operator:
#' \preformatted{  graph_from_literal( A +-+ B +---+ C ++ D + E)
#' }
#' Note again that the length of the edge operators is arbitrary,
#' \sQuote{`+`}, \sQuote{`++`} and \sQuote{`+-----+`} have
#' exactly the same meaning.
#'
#' If the vertex names include spaces or other special characters then
#' you need to quote them:
#' \preformatted{  graph_from_literal( "this is" +- "a silly" -+ "graph here" )
#' }
#' You can include any character in the vertex names this way, even
#' \sQuote{+} and \sQuote{-} characters.
#'
#' See more examples below.
#'
#' @param ... For `graph_from_literal()` the formulae giving the
#'   structure of the graph, see details below. For `from_literal()`
#'   all arguments are passed to `graph_from_literal()`.
#' @param simplify Logical scalar, whether to call [simplify()]
#'   on the created graph. By default the graph is simplified, loop and
#'   multiple edges are removed.
#' @return An igraph graph
#'
#' @family deterministic constructors
#' @export
#' @examples
#' # A simple undirected graph
#' g <- graph_from_literal(
#'   Alice - Bob - Cecil - Alice,
#'   Daniel - Cecil - Eugene,
#'   Cecil - Gordon
#' )
#' g
#'
#' # Another undirected graph, ":" notation
#' g2 <- graph_from_literal(Alice - Bob:Cecil:Daniel, Cecil:Daniel - Eugene:Gordon)
#' g2
#'
#' # A directed graph
#' g3 <- graph_from_literal(
#'   Alice +-+ Bob --+ Cecil +-- Daniel,
#'   Eugene --+ Gordon:Helen
#' )
#' g3
#'
#' # A graph with isolate vertices
#' g4 <- graph_from_literal(Alice -- Bob -- Daniel, Cecil:Gordon, Helen)
#' g4
#' V(g4)$name
#'
#' # "Arrows" can be arbitrarily long
#' g5 <- graph_from_literal(Alice +---------+ Bob)
#' g5
#'
#' # Special vertex names
#' g6 <- graph_from_literal("+" -- "-", "*" -- "/", "%%" -- "%/%")
#' g6
#'
graph_from_literal <- function(..., simplify = TRUE) {
  mf <- as.list(match.call())[-1]
  graph_from_literal_i(mf)
}

graph_from_literal_i <- function(mf) {
  ## In case 'simplify' is given
  simplify <- TRUE
  if ("simplify" %in% names(mf)) {
    w <- which(names(mf) == "simplify")
    if (length(w) > 1) {
      stop("'simplify' specified multiple times")
    }
    simplify <- eval(mf[[w]])
    mf <- mf[-w]
  }

  ## Operators first
  f <- function(x) {
    if (is.call(x)) {
      return(list(as.character(x[[1]]), lapply(x[-1], f)))
    } else {
      return(NULL)
    }
  }
  ops <- unlist(lapply(mf, f))
  if (all(ops %in% c("-", ":"))) {
    directed <- FALSE
  } else if (all(ops %in% c("-", "+", ":"))) {
    directed <- TRUE
  } else {
    stop("Invalid operator in formula")
  }

  f <- function(x) {
    if (is.call(x)) {
      if (length(x) == 3) {
        return(list(f(x[[2]]), op = as.character(x[[1]]), f(x[[3]])))
      } else {
        return(list(op = as.character(x[[1]]), f(x[[2]])))
      }
    } else {
      return(c(sym = as.character(x)))
    }
  }

  ret <- lapply(mf, function(x) unlist(f(x)))

  v <- unique(unlist(lapply(ret, function(x) {
    x[names(x) == "sym"]
  })))

  ## Merge symbols for ":"
  ret <- lapply(ret, function(x) {
    res <- list()
    for (i in seq(along.with = x)) {
      if (x[i] == ":" && names(x)[i] == "op") {
        ## SKIP
      } else if (i > 1 && x[i - 1] == ":" && names(x)[i - 1] == "op") {
        res[[length(res)]] <- c(res[[length(res)]], unname(x[i]))
      } else {
        res <- c(res, x[i])
      }
    }
    res
  })

  ## Ok, create the edges
  edges <- numeric()
  for (i in seq(along.with = ret)) {
    prev.sym <- character()
    lhead <- rhead <- character()
    for (j in seq(along.with = ret[[i]])) {
      act <- ret[[i]][[j]]
      if (names(ret[[i]])[j] == "op") {
        if (length(lhead) == 0) {
          lhead <- rhead <- act
        } else {
          rhead <- act
        }
      } else if (names(ret[[i]])[j] == "sym") {
        for (ps in prev.sym) {
          for (ps2 in act) {
            if (lhead == "+") {
              edges <- c(edges, unname(c(ps2, ps)))
            }
            if (!directed || rhead == "+") {
              edges <- c(edges, unname(c(ps, ps2)))
            }
          }
        }
        lhead <- rhead <- character()
        prev.sym <- act
      }
    }
  }

  ids <- seq(along.with = v)
  names(ids) <- v
  res <- make_graph(unname(ids[edges]), n = length(v), directed = directed)
  if (simplify) res <- simplify(res)
  res <- set_vertex_attr(res, "name", value = v)
  res
}

#' @rdname graph_from_literal
#' @export
from_literal <- function(...) {
  constructor_spec(graph_from_literal, ..., .lazy = TRUE)
}

## -----------------------------------------------------------------

#' Create a star graph, a tree with n vertices and n - 1 leaves
#'
#' `star()` creates a star graph, in this every single vertex is
#' connected to the center vertex and nobody else.
#'
#' @concept Star graph
#' @param n Number of vertices.
#' @param mode It defines the direction of the
#'   edges, `in`: the edges point *to* the center, `out`:
#'   the edges point *from* the center, `mutual`: a directed
#'   star is created with mutual edges, `undirected`: the edges
#'   are undirected.
#' @param center ID of the center vertex.
#' @return An igraph graph.
#'
#' @family deterministic constructors
#' @export
#' @examples
#' make_star(10, mode = "out")
#' make_star(5, mode = "undirected")
make_star <- function(n, mode = c("in", "out", "mutual", "undirected"),
                      center = 1) {
  mode <- igraph.match.arg(mode)
  mode1 <- switch(mode,
    "out" = 0,
    "in" = 1,
    "undirected" = 2,
    "mutual" = 3
  )

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_star, as.numeric(n), as.numeric(mode1),
    as.numeric(center) - 1
  )
  if (igraph_opt("add.params")) {
    res$name <- switch(mode,
      "in" = "In-star",
      "out" = "Out-star",
      "Star"
    )
    res$mode <- mode
    res$center <- center
  }
  res
}

#' @rdname make_star
#' @param ... Passed to `make_star()`.
#' @export
star <- function(...) constructor_spec(make_star, ...)

## -----------------------------------------------------------------

#' Create a full graph
#'
#' @concept Full graph
#' @param n Number of vertices.
#' @param directed Whether to create a directed graph.
#' @param loops Whether to add self-loops to the graph.
#' @return An igraph graph
#'
#' @family deterministic constructors
#' @export
#' @examples
#' make_full_graph(5)
#' print_all(make_full_graph(4, directed = TRUE))
make_full_graph <- function(n, directed = FALSE, loops = FALSE) {
  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_full, as.numeric(n), as.logical(directed),
    as.logical(loops)
  )
  if (igraph_opt("add.params")) {
    res$name <- "Full graph"
    res$loops <- loops
  }
  res
}

#' @rdname make_full_graph
#' @param ... Passed to `make_full_graph()`.
#' @export
full_graph <- function(...) constructor_spec(make_full_graph, ...)

## -----------------------------------------------------------------

#' Create a lattice graph
#'
#' `make_lattice()` is a flexible function, it can create lattices of
#' arbitrary dimensions, periodic or aperiodic ones. It has two
#' forms. In the first form you only supply `dimvector`, but not
#' `length` and `dim`. In the second form you omit
#' `dimvector` and supply `length` and `dim`.
#'
#' @concept Lattice
#' @param dimvector A vector giving the size of the lattice in each
#'   dimension.
#' @param length Integer constant, for regular lattices, the size of the
#'   lattice in each dimension.
#' @param dim Integer constant, the dimension of the lattice.
#' @param nei The distance within which (inclusive) the neighbors on the
#'   lattice will be connected. This parameter is not used right now.
#' @param directed Whether to create a directed lattice.
#' @param mutual Logical, if `TRUE` directed lattices will be
#'   mutually connected.
#' @param periodic Logical vector, Boolean vector, defines whether the generated lattice is
#'   periodic along each dimension. This parameter may also be scalar boolen value which will
#'   be extended to boolean vector with dimvector length.
#' @param circular Deprecated, use `periodic` instead.
#' @return An igraph graph.
#'
#' @family deterministic constructors
#' @export
#' @examples
#' make_lattice(c(5, 5, 5))
#' make_lattice(length = 5, dim = 3)
#' @cdocs igraph_square_lattice
make_lattice <- function(dimvector = NULL, length = NULL, dim = NULL,
                         nei = 1, directed = FALSE, mutual = FALSE,
                         periodic = FALSE, circular = deprecated()) {
  if (lifecycle::is_present(circular)) {
    lifecycle::deprecate_soft(
      "2.0.3",
      "make_lattice(circular = 'use periodic argument instead')",
      details = c("`circular` is now deprecated, use `periodic` instead.")
    )
    periodic <- circular
  }

  if (is.numeric(length) && length != floor(length)) {
    warning("length was rounded to the nearest integer")
    length <- round(length)
  }

  if (is.null(dimvector)) {
    dimvector <- rep(length, dim)
  }

  if (length(periodic) == 1) {
    periodic <- rep(periodic, length(dimvector))
  }

  on.exit(.Call(R_igraph_finalizer))
  res <- square_lattice_impl(dimvector, nei, directed, mutual, periodic)
  if (igraph_opt("add.params")) {
    res$name <- "Lattice graph"
    res$dimvector <- dimvector
    res$nei <- nei
    res$mutual <- mutual
    res$circular <- periodic
  }
  res
}

#' @rdname make_lattice
#' @param ... Passed to `make_lattice()`.
#' @export
lattice <- function(...) constructor_spec(make_lattice, ...)

## -----------------------------------------------------------------

#' Create a ring graph
#'
#' A ring is a one-dimensional lattice and this function is a special case
#' of [make_lattice()].
#'
#' @param n Number of vertices.
#' @param directed Whether the graph is directed.
#' @param mutual Whether directed edges are mutual. It is ignored in
#'   undirected graphs.
#' @param circular Whether to create a circular ring. A non-circular
#'   ring is essentially a \dQuote{line}: a tree where every non-leaf
#'   vertex has one child.
#' @return An igraph graph.
#'
#' @family deterministic constructors
#' @export
#' @examples
#' print_all(make_ring(10))
#' print_all(make_ring(10, directed = TRUE, mutual = TRUE))
make_ring <- function(n, directed = FALSE, mutual = FALSE, circular = TRUE) {
  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_ring, as.numeric(n), as.logical(directed),
    as.logical(mutual), as.logical(circular)
  )
  if (igraph_opt("add.params")) {
    res$name <- "Ring graph"
    res$mutual <- mutual
    res$circular <- circular
  }
  res
}

#' @rdname make_ring
#' @param ... Passed to `make_ring()`.
#' @export
ring <- function(...) constructor_spec(make_ring, ...)

## -----------------------------------------------------------------

#' Create tree graphs
#'
#' Create a k-ary tree graph, where almost all vertices other than the leaves
#' have the same number of children.
#'
#' @concept Trees.
#' @param n Number of vertices.
#' @param children Integer scalar, the number of children of a vertex
#'   (except for leafs)
#' @param mode Defines the direction of the
#'   edges. `out` indicates that the edges point from the parent to
#'   the children, `in` indicates that they point from the children
#'   to their parents, while `undirected` creates an undirected
#'   graph.
#' @return An igraph graph
#'
#' @family deterministic constructors
#' @export
#' @examples
#' make_tree(10, 2)
#' make_tree(10, 3, mode = "undirected")
make_tree <- function(n, children = 2, mode = c("out", "in", "undirected")) {
  mode <- igraph.match.arg(mode)
  mode1 <- switch(mode,
    "out" = 0,
    "in" = 1,
    "undirected" = 2
  )

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_kary_tree, as.numeric(n), as.numeric(children),
    as.numeric(mode1)
  )
  if (igraph_opt("add.params")) {
    res$name <- "Tree"
    res$children <- children
    res$mode <- mode
  }
  res
}

#' Sample trees randomly and uniformly
#'
#' `sample_tree()` generates a random with a given number of nodes uniform
#' at random from the set of labelled trees.
#'
#' In other words, the function generates each possible labelled tree with the
#' given number of nodes with the same probability.
#'
#' @param n The number of nodes in the tree
#' @param directed Whether to create a directed tree. The edges of the tree are
#'   oriented away from the root.
#' @param method The algorithm to use to generate the tree. \sQuote{prufer}
#'   samples Prüfer sequences uniformly and then converts the sampled sequence to
#'   a tree. \sQuote{lerw} performs a loop-erased random walk on the complete
#'   graph to uniformly sampleits spanning trees. (This is also known as Wilson's
#'   algorithm). The default is \sQuote{lerw}. Note that the method based on
#'   Prüfer sequences does not support directed trees at the moment.
#' @return A graph object.
#'
#' @family games
#' @keywords graphs
#' @examples
#'
#' g <- sample_tree(100, method = "lerw")
#'
#' @export
#' @cdocs igraph_tree_game
sample_tree <- tree_game_impl

#' @rdname make_tree
#' @param ... Passed to `make_tree()` or `sample_tree()`.
#' @export
tree <- function(...) constructor_spec(list(make = make_tree, sample = sample_tree), ...)


## -----------------------------------------------------------------

#' Create an undirected tree graph from its Prüfer sequence
#'
#' `make_from_prufer()` creates an undirected tree graph from its Prüfer
#' sequence.
#'
#' The Prüfer sequence of a tree graph with n labeled vertices is a sequence of
#' n-2 numbers, constructed as follows. If the graph has more than two vertices,
#' find a vertex with degree one, remove it from the tree and add the label of
#' the vertex that it was connected to to the sequence. Repeat until there are
#' only two vertices in the remaining graph.
#'
#' @param prufer The Prüfer sequence to convert into a graph
#' @return A graph object.
#'
#' @seealso [to_prufer()] to convert a graph into its Prüfer sequence
#' @keywords graphs
#' @examples
#'
#' g <- make_tree(13, 3)
#' to_prufer(g)
#' @family trees
#' @export
#' @cdocs igraph_from_prufer
make_from_prufer <- from_prufer_impl

#' @rdname make_from_prufer
#' @param ... Passed to `make_from_prufer()`
#' @export
from_prufer <- function(...) constructor_spec(make_from_prufer, ...)

## -----------------------------------------------------------------

#' Create a graph from the Graph Atlas
#'
#' `graph_from_atlas()` creates graphs from the book
#' \sQuote{An Atlas of Graphs} by
#' Roland C. Read and Robin J. Wilson. The atlas contains all undirected
#' graphs with up to seven vertices, numbered from 0 up to 1252. The
#' graphs are listed:
#' \enumerate{
#'    \item in increasing order of number of nodes;
#'    \item for a fixed number of nodes, in increasing order of the number
#'      of edges;
#'    \item for fixed numbers of nodes and edges, in increasing order of
#'      the degree sequence, for example 111223 < 112222;
#'    \item for fixed degree sequence, in increasing number of
#'      automorphisms.
#' }
#'
#' @concept Graph Atlas.
#' @param n The id of the graph to create.
#' @return An igraph graph.
#'
#' @family deterministic constructors
#' @export
#' @examples
#' ## Some randomly picked graphs from the atlas
#' graph_from_atlas(sample(0:1252, 1))
#' graph_from_atlas(sample(0:1252, 1))
graph_from_atlas <- function(n) {
  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_atlas, as.numeric(n))
  if (igraph_opt("add.params")) {
    res$name <- sprintf("Graph from the Atlas #%i", n)
    res$n <- n
  }
  res
}

#' @rdname graph_from_atlas
#' @param ... Passed to `graph_from_atlas()`.
#' @export
atlas <- function(...) constructor_spec(graph_from_atlas, ...)

## -----------------------------------------------------------------

#' Create an extended chordal ring graph
#'
#' `make_chordal_ring()` creates an extended chordal ring.
#' An extended chordal ring is regular graph, each node has the same
#' degree. It can be obtained from a simple ring by adding some extra
#' edges specified by a matrix. Let p denote the number of columns in
#' the \sQuote{`W`} matrix. The extra edges of vertex `i`
#' are added according to column `i mod p` in
#' \sQuote{`W`}. The number of extra edges is the number
#' of rows in \sQuote{`W`}: for each row `j` an edge
#' `i->i+w[ij]` is added if `i+w[ij]` is less than the number
#' of total nodes. See also Kotsis, G: Interconnection Topologies for
#' Parallel Processing Systems, PARS Mitteilungen 11, 1-6, 1993.
#'
#' @param n The number of vertices.
#' @param w A matrix which specifies the extended chordal ring. See
#'   details below.
#' @param directed Logical scalar, whether or not to create a directed graph.
#' @return An igraph graph.
#'
#' @family deterministic constructors
#' @export
#' @examples
#' chord <- make_chordal_ring(
#'   15,
#'   matrix(c(3, 12, 4, 7, 8, 11), nr = 2)
#' )
make_chordal_ring <- function(n, w, directed = FALSE) {
  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_extended_chordal_ring, as.numeric(n),
    as.matrix(w), as.logical(directed)
  )
  if (igraph_opt("add.params")) {
    res$name <- "Extended chordal ring"
    res$w <- w
  }
  res
}

#' @rdname make_chordal_ring
#' @param ... Passed to `make_chordal_ring()`.
#' @export
chordal_ring <- function(...) constructor_spec(make_chordal_ring, ...)

## -----------------------------------------------------------------

#' Line graph of a graph
#'
#' This function calculates the line graph of another graph.
#'
#' The line graph `L(G)` of a `G` undirected graph is defined as
#' follows. `L(G)` has one vertex for each edge in `G` and two
#' vertices in `L(G)` are connected by an edge if their corresponding
#' edges share an end point.
#'
#' The line graph `L(G)` of a `G` directed graph is slightly
#' different, `L(G)` has one vertex for each edge in `G` and two
#' vertices in `L(G)` are connected by a directed edge if the target of
#' the first vertex's corresponding edge is the same as the source of the
#' second vertex's corresponding edge.
#'
#' @param graph The input graph, it can be directed or undirected.
#' @return A new graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}, the first version of
#' the C code was written by Vincent Matossian.
#' @keywords graphs
#' @examples
#'
#' # generate the first De-Bruijn graphs
#' g <- make_full_graph(2, directed = TRUE, loops = TRUE)
#' make_line_graph(g)
#' make_line_graph(make_line_graph(g))
#' make_line_graph(make_line_graph(make_line_graph(g)))
#'
#' @export
make_line_graph <- function(graph) {
  ensure_igraph(graph)

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_linegraph, graph)
  if (igraph_opt("add.params")) {
    res$name <- "Line graph"
  }
  res
}

#' @rdname make_line_graph
#' @param ... Passed to `make_line_graph()`.
#' @export
line_graph <- function(...) constructor_spec(make_line_graph, ...)

## -----------------------------------------------------------------

#' De Bruijn graphs
#'
#' De Bruijn graphs are labeled graphs representing the overlap of strings.
#'
#' A de Bruijn graph represents relationships between strings. An alphabet of
#' `m` letters are used and strings of length `n` are considered.  A
#' vertex corresponds to every possible string and there is a directed edge
#' from vertex `v` to vertex `w` if the string of `v` can be
#' transformed into the string of `w` by removing its first letter and
#' appending a letter to it.
#'
#' Please note that the graph will have `m` to the power `n` vertices
#' and even more edges, so probably you don't want to supply too big numbers
#' for `m` and `n`.
#'
#' De Bruijn graphs have some interesting properties, please see another
#' source, e.g. Wikipedia for details.
#'
#' @param m Integer scalar, the size of the alphabet. See details below.
#' @param n Integer scalar, the length of the labels. See details below.
#' @return A graph object.
#' @author Gabor Csardi <csardi.gabor@@gmail.com>
#' @seealso [make_kautz_graph()], [make_line_graph()]
#' @keywords graphs
#' @export
#' @examples
#'
#' # de Bruijn graphs can be created recursively by line graphs as well
#' g <- make_de_bruijn_graph(2, 1)
#' make_de_bruijn_graph(2, 2)
#' make_line_graph(g)
make_de_bruijn_graph <- function(m, n) {
  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_de_bruijn, as.numeric(m), as.numeric(n))
  if (igraph_opt("add.params")) {
    res$name <- sprintf("De-Bruijn graph %i-%i", m, n)
    res$m <- m
    res$n <- n
  }
  res
}

#' @rdname make_de_bruijn_graph
#' @param ... Passed to `make_de_bruijn_graph()`.
#' @export
de_bruijn_graph <- function(...) constructor_spec(make_de_bruijn_graph, ...)

## -----------------------------------------------------------------

#' Kautz graphs
#'
#' Kautz graphs are labeled graphs representing the overlap of strings.
#'
#' A Kautz graph is a labeled graph, vertices are labeled by strings of length
#' `n+1` above an alphabet with `m+1` letters, with the restriction
#' that every two consecutive letters in the string must be different. There is
#' a directed edge from a vertex `v` to another vertex `w` if it is
#' possible to transform the string of `v` into the string of `w` by
#' removing the first letter and appending a letter to it.
#'
#' Kautz graphs have some interesting properties, see e.g. Wikipedia for
#' details.
#'
#' @param m Integer scalar, the size of the alphabet. See details below.
#' @param n Integer scalar, the length of the labels. See details below.
#' @return A graph object.
#' @author Gabor Csardi <csardi.gabor@@gmail.com>, the first version in R was
#' written by Vincent Matossian.
#' @seealso [make_de_bruijn_graph()], [make_line_graph()]
#' @keywords graphs
#' @export
#' @examples
#'
#' make_line_graph(make_kautz_graph(2, 1))
#' make_kautz_graph(2, 2)
#'
make_kautz_graph <- function(m, n) {
  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_kautz, as.numeric(m), as.numeric(n))
  if (igraph_opt("add.params")) {
    res$name <- sprintf("Kautz graph %i-%i", m, n)
    res$m <- m
    res$n <- n
  }
  res
}

#' @rdname make_kautz_graph
#' @param ... Passed to `make_kautz_graph()`.
#' @export
kautz_graph <- function(...) constructor_spec(make_kautz_graph, ...)

## -----------------------------------------------------------------

#' Create a full bipartite graph
#'
#' Bipartite graphs are also called two-mode by some. This function creates a
#' bipartite graph in which every possible edge is present.
#'
#' Bipartite graphs have a \sQuote{`type`} vertex attribute in igraph,
#' this is boolean and `FALSE` for the vertices of the first kind and
#' `TRUE` for vertices of the second kind.
#'
#' @param n1 The number of vertices of the first kind.
#' @param n2 The number of vertices of the second kind.
#' @param directed Logical scalar, whether the graphs is directed.
#' @param mode Scalar giving the kind of edges to create for directed graphs.
#'   If this is \sQuote{`out`} then all vertices of the first kind are
#'   connected to the others; \sQuote{`in`} specifies the opposite
#'   direction; \sQuote{`all`} creates mutual edges. This argument is
#'   ignored for undirected graphs.x
#' @return An igraph graph, with the \sQuote{`type`} vertex attribute set.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [make_full_graph()] for creating one-mode full graphs
#' @keywords graphs
#' @examples
#'
#' g <- make_full_bipartite_graph(2, 3)
#' g2 <- make_full_bipartite_graph(2, 3, directed = TRUE)
#' g3 <- make_full_bipartite_graph(2, 3, directed = TRUE, mode = "in")
#' g4 <- make_full_bipartite_graph(2, 3, directed = TRUE, mode = "all")
#'
#' @export
make_full_bipartite_graph <- function(n1, n2, directed = FALSE,
                                      mode = c("all", "out", "in")) {
  n1 <- as.numeric(n1)
  n2 <- as.numeric(n2)
  directed <- as.logical(directed)
  mode1 <- switch(igraph.match.arg(mode),
    "out" = 1,
    "in" = 2,
    "all" = 3,
    "total" = 3
  )

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_full_bipartite, n1, n2, as.logical(directed), mode1)
  if (igraph_opt("add.params")) {
    res$graph$name <- "Full bipartite graph"
    res$n1 <- n1
    res$n2 <- n2
    res$mode <- mode
  }
  set_vertex_attr(res$graph, "type", value = res$types)
}

#' @rdname make_full_bipartite_graph
#' @param ... Passed to `make_full_bipartite_graph()`.
#' @export
full_bipartite_graph <- function(...) constructor_spec(make_full_bipartite_graph, ...)

## -----------------------------------------------------------------

#' Create a bipartite graph
#'
#' A bipartite graph has two kinds of vertices and connections are only allowed
#' between different kinds.
#'
#' Bipartite graphs have a `type` vertex attribute in igraph, this is
#' boolean and `FALSE` for the vertices of the first kind and `TRUE`
#' for vertices of the second kind.
#'
#' `make_bipartite_graph()` basically does three things. First it checks the
#' `edges` vector against the vertex `types`. Then it creates a graph
#' using the `edges` vector and finally it adds the `types` vector as
#' a vertex attribute called `type`. `edges` may contain strings as
#' vertex names; in this case, `types` must be a named vector that specifies
#' the type for each vertex name that occurs in `edges`.
#'
#' @param types A vector giving the vertex types. It will be coerced into
#'   boolean. The length of the vector gives the number of vertices in the graph.
#'   When the vector is a named vector, the names will be attached to the graph
#'   as the `name` vertex attribute.
#' @param edges A vector giving the edges of the graph, the same way as for the
#'   regular [make_graph()] function. It is checked that the edges indeed
#'   connect vertices of different kind, according to the supplied `types`
#'   vector. The vector may be a string vector if `types` is a named vector.
#' @param directed Whether to create a directed graph, boolean constant. Note
#'   that by default undirected graphs are created, as this is more common for
#'   bipartite graphs.
#' @return `make_bipartite_graph()` returns a bipartite igraph graph. In other
#'   words, an igraph graph that has a vertex attribute named `type`.
#'
#'   `is_bipartite()` returns a logical scalar.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [make_graph()] to create one-mode networks
#' @keywords graphs
#' @family bipartite
#' @examples
#'
#' g <- make_bipartite_graph(rep(0:1, length.out = 10), c(1:10))
#' print(g, v = TRUE)
#'
#' @export
make_bipartite_graph <- function(types, edges, directed = FALSE) {
  vertex.names <- names(types)

  if (is.character(edges)) {
    if (is.null(vertex.names)) {
      stop("`types` vector must be named when the edge vector contains strings")
    }
    edges <- match(edges, vertex.names)
    if (any(is.na(edges))) {
      stop("edge vector contains a vertex name that is not found in `types`")
    }
  }

  types <- as.logical(types)
  edges <- as.numeric(edges) - 1
  directed <- as.logical(directed)

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_create_bipartite, types, edges, directed)
  res <- set_vertex_attr(res, "type", value = types)

  if (!is.null(vertex.names)) {
    res <- set_vertex_attr(res, "name", value = vertex.names)
  }

  res
}

#' @rdname make_bipartite_graph
#' @param ... Passed to `make_bipartite_graph()`.
#' @export
bipartite_graph <- function(...) constructor_spec(make_bipartite_graph, ...)

## -----------------------------------------------------------------

#' Create a complete (full) citation graph
#'
#' `make_full_citation_graph()` creates a full citation graph. This is a
#' directed graph, where every `i->j` edge is present if and only if
#' \eqn{j<i}. If `directed=FALSE` then the graph is just a full graph.
#'
#' @param n The number of vertices.
#' @param directed Whether to create a directed graph.
#' @return An igraph graph.
#'
#' @family deterministic constructors
#' @export
#' @examples
#' print_all(make_full_citation_graph(10))
make_full_citation_graph <- function(n, directed = TRUE) {
  # Argument checks
  n <- as.numeric(n)
  directed <- as.logical(directed)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_full_citation, n, directed)

  res <- set_graph_attr(res, "name", "Full citation graph")
  res
}

#' @rdname make_full_citation_graph
#' @param ... Passed to `make_full_citation_graph()`.
#' @export
full_citation_graph <- function(...) constructor_spec(make_full_citation_graph, ...)

## -----------------------------------------------------------------

#' Creating a graph from LCF notation
#'
#' LCF is short for Lederberg-Coxeter-Frucht, it is a concise notation for
#' 3-regular Hamiltonian graphs. It constists of three parameters, the number
#' of vertices in the graph, a list of shifts giving additional edges to a
#' cycle backbone and another integer giving how many times the shifts should
#' be performed. See <http://mathworld.wolfram.com/LCFNotation.html> for
#' details.
#'
#'
#' @aliases graph_from_lcf
#' @param n Integer, the number of vertices in the graph.
#' @param shifts Integer vector, the shifts.
#' @param repeats Integer constant, how many times to repeat the shifts.
#' @return A graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [make_graph()] can create arbitrary graphs, see also the other
#' functions on the its manual page for creating special graphs.
#' @keywords graphs
#' @examples
#'
#' # This is the Franklin graph:
#' g1 <- graph_from_lcf(12, c(5, -5), 6)
#' g2 <- make_graph("Franklin")
#' isomorphic(g1, g2)
#' @export
#' @cdocs igraph_lcf_vector
graph_from_lcf <- lcf_vector_impl

## -----------------------------------------------------------------

#' Creating a graph from a given degree sequence, deterministically
#'
#' It is often useful to create a graph with given vertex degrees. This function
#' creates such a graph in a deterministic manner.
#'
#' Simple undirected graphs are constructed using the Havel-Hakimi algorithm
#' (undirected case), or the analogous Kleitman-Wang algorithm (directed case).
#' These algorithms work by choosing an arbitrary vertex and connecting all its
#' stubs to other vertices. This step is repeated until all degrees have been
#' connected up.
#'
#' The \sQuote{method} argument controls in which order the vertices are
#' selected during the course of the algorithm.
#'
#' The \dQuote{smallest} method selects the vertex with the smallest remaining
#' degree. The result is usually a graph with high negative degree assortativity.
#' In the undirected case, this method is guaranteed to generate a connected
#' graph, regardless of whether multi-edges are allowed, provided that a
#' connected realization exists. See Horvát and Modes (2021) for details.
#' In the directed case it tends to generate weakly connected graphs, but this
#' is not guaranteed. This is the default method.
#'
#' The \dQuote{largest} method selects the vertex with the largest remaining
#' degree. The result is usually a graph with high positive degree assortativity,
#' and is often disconnected.
#'
#' The \dQuote{index} method selects the vertices in order of their index.
#'
#' @param out.deg Numeric vector, the sequence of degrees (for undirected
#'   graphs) or out-degrees (for directed graphs). For undirected graphs its sum
#'   should be even. For directed graphs its sum should be the same as the sum of
#'   `in.deg`.
#' @param in.deg For directed graph, the in-degree sequence. By default this is
#'   `NULL` and an undirected graph is created.
#' @param method Character, the method for generating the graph; see below.
#' @param allowed.edge.types Character, specifies the types of allowed edges.
#'   \dQuote{simple} allows simple graphs only (no loops, no multiple edges).
#'   \dQuote{multiple} allows multiple edges but disallows loop.
#'   \dQuote{loops} allows loop edges but disallows multiple edges (currently
#'   unimplemented). \dQuote{all} allows all types of edges. The default is
#'   \dQuote{simple}.
#' @return The new graph object.
#' @seealso [sample_degseq()] for a randomized variant that samples
#' from graphs with the given degree sequence.
#' @references V. Havel,
#' Poznámka o existenci konečných grafů (A remark on the existence of finite graphs),
#' Časopis pro pěstování matematiky 80, 477-480 (1955).
#' https://eudml.org/doc/19050
#'
#' S. L. Hakimi,
#' On Realizability of a Set of Integers as Degrees of the Vertices of a Linear Graph,
#' Journal of the SIAM 10, 3 (1962).
#' \doi{10.1137/0111010}
#'
#' D. J. Kleitman and D. L. Wang,
#' Algorithms for Constructing Graphs and Digraphs with Given Valences and Factors,
#' Discrete Mathematics 6, 1 (1973).
#' \doi{10.1016/0012-365X(73)90037-X}
#'
#' Sz. Horvát and C. D. Modes,
#' Connectedness matters: construction and exact random sampling of connected networks (2021).
#' \doi{10.1088/2632-072X/abced5}
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- realize_degseq(rep(2, 100))
#' degree(g)
#' is_simple(g)
#'
#' ## Exponential degree distribution, with high positive assortativity.
#' ## Loop and multiple edges are explicitly allowed.
#' ## Note that we correct the degree sequence if its sum is odd.
#' degs <- sample(1:100, 100, replace = TRUE, prob = exp(-0.5 * (1:100)))
#' if (sum(degs) %% 2 != 0) {
#'   degs[1] <- degs[1] + 1
#' }
#' g4 <- realize_degseq(degs, method = "largest", allowed.edge.types = "all")
#' all(degree(g4) == degs)
#'
#' ## Power-law degree distribution, no loops allowed but multiple edges
#' ## are okay.
#' ## Note that we correct the degree sequence if its sum is odd.
#' degs <- sample(1:100, 100, replace = TRUE, prob = (1:100)^-2)
#' if (sum(degs) %% 2 != 0) {
#'   degs[1] <- degs[1] + 1
#' }
#' g5 <- realize_degseq(degs, allowed.edge.types = "multi")
#' all(degree(g5) == degs)
#' @cdocs igraph_realize_degree_sequence
realize_degseq <- realize_degree_sequence_impl


#' Creating a bipartite graph from two degree sequences, deterministically
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' Constructs a bipartite graph from the degree sequences of its partitions,
#' if one exists. This function uses a Havel-Hakimi style construction
#' algorithm.
#'
#' @details
#' The \sQuote{method} argument controls in which order the vertices are
#' selected during the course of the algorithm.
#'
#' The \dQuote{smallest} method selects the vertex with the smallest remaining
#' degree, from either partition. The result is usually a graph with high
#' negative degree assortativity. In the undirected case, this method is
#' guaranteed to generate a connected graph, regardless of whether multi-edges
#' are allowed, provided that a connected realization exists. This is the
#' default method.
#'
#' The \dQuote{largest} method selects the vertex with the largest remaining
#' degree. The result is usually a graph with high positive degree
#' assortativity, and is often disconnected.
#'
#' The \dQuote{index} method selects the vertices in order of their index.
#'
#' @return The new graph object.
#' @param degrees1 The degrees of the first partition.
#' @param degrees2 The degrees of the second partition.
#' @param allowed.edge.types Character, specifies the types of allowed edges.
#'   \dQuote{simple} allows simple graphs only (no multiple edges).
#'   \dQuote{multiple} allows multiple edges.
#' @param method Character, the method for generating the graph; see below.
#' @inheritParams rlang::args_dots_empty
#' @seealso [realize_degseq()] to create a not necessarily bipartite graph.
#' @export
#' @keywords graphs
#' @examples
#' g <- realize_bipartite_degseq(c(3, 3, 2, 1, 1), c(2, 2, 2, 2, 2))
#' degree(g)
#' @cdocs igraph_realize_bipartite_degree_sequence
realize_bipartite_degseq <- function(degrees1, degrees2, ...,
                                     allowed.edge.types = c("simple", "multiple"),
                                     method = c("smallest", "largest", "index")) {
  check_dots_empty()
  allowed.edge.types <- igraph.match.arg(allowed.edge.types)
  method <- igraph.match.arg(method)
  g <- realize_bipartite_degree_sequence_impl(degrees1 = degrees1, degrees2 = degrees2,
                                              allowed.edge.types = allowed.edge.types,
                                              method = method)
  V(g)$type <- c(rep(TRUE, length(degrees1)), rep(FALSE, length(degrees2)))
  g
}


