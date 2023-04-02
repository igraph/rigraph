
#' Create a graph from an edge list matrix
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.edgelist()` was renamed to `graph_from_edgelist()` to create a more
#' consistent API.
#' @inheritParams graph_from_edgelist
#' @keywords internal
#' @export
graph.edgelist <- function(el, directed = TRUE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.edgelist()", "graph_from_edgelist()")
  graph_from_edgelist(el = el, directed = directed)
} # nocov end

#' Creating igraph graphs from data frames or vice-versa
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.data.frame()` was renamed to `graph_from_data_frame()` to create a more
#' consistent API.
#' @inheritParams graph_from_data_frame
#' @keywords internal
#' @export
graph.data.frame <- function(d, directed = TRUE, vertices = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.data.frame()", "graph_from_data_frame()")
  graph_from_data_frame(d = d, directed = directed, vertices = vertices)
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

#' Creating igraph graphs from data frames or vice-versa
#'
#' This function creates an igraph graph from one or two data frames containing
#' the (symbolic) edge list and edge/vertex attributes.
#'
#' `graph_from_data_frame()` creates igraph graphs from one or two data frames.
#' It has two modes of operation, depending whether the `vertices`
#' argument is `NULL` or not.
#'
#' If `vertices` is `NULL`, then the first two columns of `d`
#' are used as a symbolic edge list and additional columns as edge attributes.
#' The names of the attributes are taken from the names of the columns.
#'
#' If `vertices` is not `NULL`, then it must be a data frame giving
#' vertex metadata. The first column of `vertices` is assumed to contain
#' symbolic vertex names, this will be added to the graphs as the
#' \sQuote{`name`} vertex attribute. Other columns will be added as
#' additional vertex attributes. If `vertices` is not `NULL` then the
#' symbolic edge list given in `d` is checked to contain only vertex names
#' listed in `vertices`.
#'
#' Typically, the data frames are exported from some spreadsheet software like
#' Excel and are imported into R via [read.table()],
#' [read.delim()] or [read.csv()].
#'
#' All edges in the data frame are included in the graph, which may include
#' multiple parallel edges and loops.
#'
#' `as_data_frame()` converts the igraph graph into one or more data
#' frames, depending on the `what` argument.
#'
#' If the `what` argument is `edges` (the default), then the edges of
#' the graph and also the edge attributes are returned. The edges will be in
#' the first two columns, named `from` and `to`. (This also denotes
#' edge direction for directed graphs.)  For named graphs, the vertex names
#' will be included in these columns, for other graphs, the numeric vertex ids.
#' The edge attributes will be in the other columns. It is not a good idea to
#' have an edge attribute named `from` or `to`, because then the
#' column named in the data frame will not be unique. The edges are listed in
#' the order of their numeric ids.
#'
#' If the `what` argument is `vertices`, then vertex attributes are
#' returned. Vertices are listed in the order of their numeric vertex ids.
#'
#' If the `what` argument is `both`, then both vertex and edge data
#' is returned, in a list with named entries `vertices` and `edges`.
#'
#' @param d A data frame containing a symbolic edge list in the first two
#'   columns, as vertex names or vertex IDs.
#    Additional columns are considered as edge attributes.  Since
#'   version 0.7 this argument is coerced to a data frame with
#'   [as.data.frame()].
#' @param directed Logical scalar, whether or not to create a directed graph.
#' @param vertices A data frame with vertex metadata, or `NULL`. See
#'   details below. Since version 0.7 this argument is coerced to a data frame
#'   with [as.data.frame()], if not `NULL`.
#' @return An igraph graph object for `graph_from_data_frame()`, and either a
#'   data frame or a list of two data frames named `edges` and
#'   `vertices` for [as.data.frame()].
#' @note For `graph_from_data_frame()` `NA` elements in the first two
#' columns \sQuote{d} are replaced by the string \dQuote{NA} before creating
#' the graph. This means that all `NA`s will correspond to a single
#' vertex.
#'
#' `NA` elements in the first column of \sQuote{vertices} are also
#' replaced by the string \dQuote{NA}, but the rest of \sQuote{vertices} is not
#' touched. In other words, vertex names (=the first column) cannot be
#' `NA`, but other vertex attributes can.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [graph_from_literal()]
#' for another way to create graphs, [read.table()] to read in tables
#' from files.
#' @keywords graphs
#' @examples
#'
#' ## A simple example with a couple of actors
#' ## The typical case is that these tables are read in from files....
#' actors <- data.frame(
#'   name = c(
#'     "Alice", "Bob", "Cecil", "David",
#'     "Esmeralda"
#'   ),
#'   age = c(48, 33, 45, 34, 21),
#'   gender = c("F", "M", "F", "M", "F")
#' )
#' relations <- data.frame(
#'   from = c(
#'     "Bob", "Cecil", "Cecil", "David",
#'     "David", "Esmeralda"
#'   ),
#'   to = c("Alice", "Bob", "Alice", "Alice", "Bob", "Alice"),
#'   same.dept = c(FALSE, FALSE, TRUE, FALSE, FALSE, TRUE),
#'   friendship = c(4, 5, 5, 2, 1, 1), advice = c(4, 5, 5, 4, 2, 3)
#' )
#' g <- graph_from_data_frame(relations, directed = TRUE, vertices = actors)
#' print(g, e = TRUE, v = TRUE)
#'
#' ## The opposite operation
#' as_data_frame(g, what = "vertices")
#' as_data_frame(g, what = "edges")
#'
#' @export
graph_from_data_frame <- function(d, directed = TRUE, vertices = NULL) {
  d <- as.data.frame(d)
  if (is.character(vertices) || is.factor(vertices)) {
    vertices <- data.frame(name = as.character(vertices))
  } else if (is.matrix(vertices)) {
    vertices <- as.data.frame(vertices)
  } else if (!is.null(vertices) && !is.data.frame(vertices)) {
    stop("`vertices` must be a data frame or a character vector if given")
  }

  if (ncol(d) < 2) {
    stop("`d` should contain at least two columns")
  }

  if (!is.null(vertices) && ncol(vertices) >= 1) {
    names <- vertices$name
    if (!is.null(names)) {
      if (anyNA(names)) {
        warning('Replacing `NA` in vertex names in `vertices` with the string "NA"')
        names[is.na(names)] <- "NA"
      }
      if (anyDuplicated(names)) {
        stop("Duplicate vertex names")
      }
    }
  } else {
    names <- NULL
  }

  if (is.numeric(d[[1]]) && !is.factor(d[[1]]) && is.numeric(d[[2]]) && !is.factor(d[[2]])) {
    edges <- rbind(d[[1]], d[[2]])
    names <- seq_len(max(edges, 0L))
  } else {
    if (is.null(names)) {
      names <- unique(c(as.character(d[[1]]), as.character(d[[2]])))
    }

    if (is.null(vertices)) {
      vertices <- data.frame(name = names)
    } else if (!("name" %in% names(vertices))) {
      vertices <- cbind(data.frame(name = names), vertices)
    }

    name_edges <- rbind(as.character(d[[1]]), as.character(d[[2]]))

    if (anyNA(name_edges)) {
      warning('Replacing `NA` in vertex names in `d` with the string "NA"')
      name_edges[is.na(name_edges)] <- "NA"
    }

    edges <- matrix(match(name_edges, names), nrow = 2)
    if (anyNA(edges)) {
      stop(
        "Vertex name ",
        name_edges[is.na(edges)][[1]],
        " in edge list is not listed in vertex data frame"
      )
    }
  }

  # create graph
  g <- make_empty_graph(n = 0, directed = directed)

  # vertex attributes
  vattrs <- lapply(vertices, unfactor)

  # add vertices
  g <- add_vertices(g, length(names), attr = vattrs)

  # edge attributes
  eattrs <- lapply(d[-1:-2], unfactor)

  # add the edges
  g <- add_edges(g, edges, attr = eattrs)

  g
}

unfactor <- function(x) {
  if (!inherits(x, "factor")) {
    return(x)
  }

  as.character(x)
}

#' @rdname graph_from_data_frame
#' @param ... Passed to `graph_from_data_frame()`.
#' @export
from_data_frame <- function(...) constructor_spec(graph_from_data_frame, ...)

## -----------------------------------------------------------------

#' Create a graph from an edge list matrix
#'
#' `graph_from_edgelist()` creates a graph from an edge list. Its argument
#' is a two-column matrix, each row defines one edge. If it is
#' a numeric matrix then its elements are interpreted as vertex ids. If
#' it is a character matrix then it is interpreted as symbolic vertex
#' names and a vertex id will be assigned to each name, and also a
#' `name` vertex attribute will be added.
#'
#' @concept Edge list
#' @param el The edge list, a two column matrix, character or numeric.
#' @param directed Whether to create a directed graph.
#' @return An igraph graph.
#'
#' @family deterministic constructors
#' @export
#' @examples
#' el <- matrix(c("foo", "bar", "bar", "foobar"), nc = 2, byrow = TRUE)
#' graph_from_edgelist(el)
#'
#' # Create a ring by hand
#' graph_from_edgelist(cbind(1:10, c(2:10, 1)))
graph_from_edgelist <- function(el, directed = TRUE) {
  if (!is.matrix(el) || ncol(el) != 2) {
    stop("graph_from_edgelist expects a matrix with two columns")
  }

  if (nrow(el) == 0) {
    res <- make_empty_graph(directed = directed)
  } else {
    if (is.character(el)) {
      ## symbolic edge list
      names <- unique(as.character(t(el)))
      ids <- seq(names)
      names(ids) <- names
      res <- make_graph(unname(ids[t(el)]), directed = directed)
      rm(ids)
      V(res)$name <- names
    } else {
      ## normal edge list
      res <- make_graph(t(el), directed = directed)
    }
  }

  res
}

#' @rdname graph_from_edgelist
#' @param ... Passed to `graph_from_edgelist()`.
#' @export
from_edgelist <- function(...) constructor_spec(graph_from_edgelist, ...)
