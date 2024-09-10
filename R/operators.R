
#' Intersection of two or more sets
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.intersection()` was renamed to `intersection()` to create a more
#' consistent API.
#' @inheritParams intersection
#' @keywords internal
#' @export
graph.intersection <- function(...) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.intersection()", "intersection()")
  intersection(...)
} # nocov end

#' Union of graphs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.union()` was renamed to `union.igraph()` to create a more
#' consistent API.
#' @inheritParams union.igraph
#' @keywords internal
#' @export
graph.union <- function(..., byname = "auto") { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.union()", "union.igraph()")
  union.igraph(byname = byname, ...)
} # nocov end

#' Difference of two sets
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.difference()` was renamed to `difference()` to create a more
#' consistent API.
#' @inheritParams difference
#' @keywords internal
#' @export
graph.difference <- function(...) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.difference()", "difference()")
  difference(...)
} # nocov end

#' Disjoint union of graphs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.disjoint.union()` was renamed to `disjoint_union()` to create a more
#' consistent API.
#' @inheritParams disjoint_union
#' @keywords internal
#' @export
graph.disjoint.union <- function(...) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.disjoint.union()", "disjoint_union()")
  disjoint_union(...)
} # nocov end

#' Compose two graphs as binary relations
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.compose()` was renamed to `compose()` to create a more
#' consistent API.
#' @inheritParams compose
#' @keywords internal
#' @export
graph.compose <- function(g1, g2, byname = "auto") { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.compose()", "compose()")
  compose(g1 = g1, g2 = g2, byname = byname)
} # nocov end

#' Complementer of a graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.complementer()` was renamed to `complementer()` to create a more
#' consistent API.
#' @inheritParams complementer
#' @keywords internal
#' @export
graph.complementer <- function(graph, loops = FALSE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.complementer()", "complementer()")
  complementer(graph = graph, loops = loops)
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

rename.attr.if.needed <- function(type, graphs, newsize = NULL, maps = NULL,
                                  maps2 = NULL, ignore = character()) {
  listfun <- switch(type,
    "g" = graph_attr_names,
    "v" = vertex_attr_names,
    "e" = edge_attr_names,
    stop("Internal igraph error")
  )
  getfun <- switch(type,
    "g" = graph_attr,
    "v" = vertex_attr,
    "e" = edge_attr,
    stop("Internal igraph error")
  )
  alist <- lapply(graphs, listfun)
  an <- unique(unlist(alist))
  an <- setdiff(an, ignore)

  getval <- function(which, name) {
    newval <- getfun(graphs[[which]], name)
    if (!is.null(maps)) {
      tmpval <- newval[maps[[which]] >= 0]
      mm <- maps[[which]][maps[[which]] >= 0] + 1
      newval <- rep(NA, newsize)
      newval[mm] <- tmpval
    }
    if (!is.null(maps2)) {
      newval <- newval[maps2[[which]] + 1]
    }
    if (!is.null(newsize)) {
      length(newval) <- newsize
    }
    newval
  }

  attr <- list()
  for (name in an) {
    w <- which(sapply(alist, function(x) name %in% x))
    if (length(w) == 1) {
      attr[[name]] <- getval(w, name)
    } else {
      for (w2 in w) {
        nname <- paste(name, sep = "_", w2)
        newval <- getval(w2, name)
        attr[[nname]] <- newval
      }
    }
  }
  attr
}



#' Disjoint union of graphs
#'
#' The union of two or more graphs are created. The graphs are assumed to have
#' disjoint vertex sets.
#'
#' `disjoint_union()` creates a union of two or more disjoint graphs.
#' Thus first the vertices in the second, third, etc. graphs are relabeled to
#' have completely disjoint graphs. Then a simple union is created. This
#' function can also be used via the `%du%` operator.
#'
#' `graph.disjont.union` handles graph, vertex and edge attributes.  In
#' particular, it merges vertex and edge attributes using the basic `c()`
#' function. For graphs that lack some vertex/edge attribute, the corresponding
#' values in the new graph are set to `NA`. Graph attributes are simply
#' copied to the result. If this would result a name clash, then they are
#' renamed by adding suffixes: _1, _2, etc.
#'
#' Note that if both graphs have vertex names (i.e. a `name` vertex
#' attribute), then the concatenated vertex names might be non-unique in the
#' result. A warning is given if this happens.
#'
#' An error is generated if some input graphs are directed and others are
#' undirected.
#'
#' @aliases %du%
#' @param \dots Graph objects or lists of graph objects.
#' @param x,y Graph objects.
#' @return A new graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @export
#' @keywords graphs
#' @examples
#'
#' ## A star and a ring
#' g1 <- make_star(10, mode = "undirected")
#' V(g1)$name <- letters[1:10]
#' g2 <- make_ring(10)
#' V(g2)$name <- letters[11:20]
#' print_all(g1 %du% g2)
#' @export
disjoint_union <- function(...) {
  graphs <- unlist(recursive = FALSE, lapply(list(...), function(l) {
    if (is_igraph(l)) list(l) else l
  }))
  lapply(graphs, ensure_igraph)

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_disjoint_union, graphs)

  ## Graph attributes
  graph.attributes(res) <- rename.attr.if.needed("g", graphs)

  ## Vertex attributes
  attr <- list()
  vc <- sapply(graphs, vcount)
  cumvc <- c(0, cumsum(vc))
  for (i in seq_along(graphs)) {
    va <- vertex.attributes(graphs[[i]])
    exattr <- intersect(names(va), names(attr)) # existing and present
    noattr <- setdiff(names(attr), names(va)) # existint and missing
    newattr <- setdiff(names(va), names(attr)) # new
    for (a in seq_along(exattr)) {
      attr[[exattr[a]]] <- c(attr[[exattr[a]]], va[[exattr[a]]])
    }
    for (a in seq_along(noattr)) {
      attr[[noattr[a]]] <- c(attr[[noattr[a]]], rep(NA, vc[i]))
    }
    for (a in seq_along(newattr)) {
      attr[[newattr[a]]] <- c(rep(NA, cumvc[i]), va[[newattr[a]]])
    }
  }
  vertex.attributes(res) <- attr

  if ("name" %in% names(attr) && any(duplicated(attr$name))) {
    warning("Duplicate vertex names in disjoint union")
  }

  ## Edge attributes
  attr <- list()
  ec <- sapply(graphs, ecount)
  cumec <- c(0, cumsum(ec))
  for (i in seq_along(graphs)) {
    ea <- edge.attributes(graphs[[i]])
    exattr <- intersect(names(ea), names(attr)) # existing and present
    noattr <- setdiff(names(attr), names(ea)) # existint and missing
    newattr <- setdiff(names(ea), names(attr)) # new
    for (a in seq_along(exattr)) {
      attr[[exattr[a]]] <- vctrs::vec_c(attr[[exattr[a]]], ea[[exattr[a]]])
    }
    for (a in seq_along(noattr)) {
      attr[[noattr[a]]] <- vctrs::vec_c(attr[[noattr[a]]], vctrs::unspecified(ec[[i]]))
    }
    for (a in seq_along(newattr)) {
      attr[[newattr[a]]] <- vctrs::vec_c(vctrs::unspecified(cumec[[i]]), ea[[newattr[a]]])
    }
  }
  edge.attributes(res) <- attr

  res
}

#' @export
#' @rdname disjoint_union
#' @family functions for manipulating graph structure
"%du%" <- function(x, y) {
  disjoint_union(x, y)
}

.igraph.graph.union.or.intersection <- function(call, ..., byname,
                                                keep.all.vertices) {
  graphs <- unlist(recursive = FALSE, lapply(list(...), function(l) {
    if (is_igraph(l)) list(l) else l
  }))
  lapply(graphs, ensure_igraph)
  if (byname != "auto" && !is.logical(byname)) {
    stop("`bynam' must be \"auto\", or logical")
  }
  nonamed <- sum(sapply(graphs, is_named))
  if (byname == "auto") {
    byname <- all(sapply(graphs, is_named))
    if (nonamed != 0 && nonamed != length(graphs)) {
      warning("Some, but not all graphs are named, not using vertex names")
    }
  } else if (byname && nonamed != length(graphs)) {
    stop("Some graphs are not named")
  }

  edgemaps <- length(unlist(lapply(graphs, edge_attr_names))) != 0

  if (byname) {
    allnames <- lapply(graphs, vertex_attr, "name")
    if (keep.all.vertices) {
      uninames <- unique(unlist(allnames))
      newgraphs <- lapply(graphs, function(g) {
        g <- g + setdiff(uninames, V(g)$name)
        permute(g, match(V(g)$name, uninames))
      })
    } else {
      uninames <- Reduce(intersect, allnames)
      newgraphs <- lapply(graphs, function(g) {
        g <- g - setdiff(V(g)$name, uninames)
        permute(g, match(V(g)$name, uninames))
      })
    }

    on.exit(.Call(R_igraph_finalizer))
    if (call == "union") {
      res <- .Call(R_igraph_union, newgraphs, edgemaps)
    } else {
      res <- .Call(R_igraph_intersection, newgraphs, edgemaps)
    }
    maps <- res$edgemaps
    res <- res$graph

    ## We might need to rename all attributes
    graph.attributes(res) <- rename.attr.if.needed("g", newgraphs)
    vertex.attributes(res) <- rename.attr.if.needed("v", newgraphs,
      vcount(res),
      ignore = "name"
    )
    V(res)$name <- uninames

    ## Edges are a bit more difficult, we need a mapping
    if (edgemaps) {
      edge.attributes(res) <- rename.attr.if.needed("e", newgraphs,
        ecount(res),
        maps = maps
      )
    }
  } else {
    if (!keep.all.vertices) {
      minsize <- min(sapply(graphs, vcount))
      graphs <- lapply(graphs, function(g) {
        vc <- vcount(g)
        if (vc > minsize) {
          g <- g - (minsize + 1):vc
        }
        g
      })
    }

    on.exit(.Call(R_igraph_finalizer))
    if (call == "union") {
      res <- .Call(R_igraph_union, graphs, edgemaps)
    } else {
      res <- .Call(R_igraph_intersection, graphs, edgemaps)
    }
    maps <- res$edgemaps
    res <- res$graph

    ## We might need to rename all attributes
    graph.attributes(res) <- rename.attr.if.needed("g", graphs)
    vertex.attributes(res) <- rename.attr.if.needed(
      "v", graphs,
      vcount(res)
    )

    ## Edges are a bit more difficult, we need a mapping
    if (edgemaps) {
      edge.attributes(res) <- rename.attr.if.needed("e", graphs,
        ecount(res),
        maps = maps
      )
    }
  }

  res
}

#' Union of two or more sets
#'
#' This is an S3 generic function. See `methods("union")`
#' for the actual implementations for various S3 classes. Initially
#' it is implemented for igraph graphs and igraph vertex and edge
#' sequences. See
#' [union.igraph()], and
#' [union.igraph.vs()].
#'
#' @param ... Arguments, their number and interpretation depends on
#'   the function that implements `union()`.
#' @return Depends on the function that implements this method.
#'
#' @family functions for manipulating graph structure
#' @export
union <- function(...) {
  UseMethod("union")
}

#' @method union default
#' @family functions for manipulating graph structure
#' @export
union.default <- function(...) {
  base::union(...)
}

#' Union of graphs
#'
#' The union of two or more graphs are created. The graphs may have identical
#' or overlapping vertex sets.
#'
#' `union()` creates the union of two or more graphs.  Edges which are
#' included in at least one graph will be part of the new graph. This function
#' can be also used via the `%u%` operator.
#'
#' If the `byname` argument is `TRUE` (or `auto` and all graphs
#' are named), then the operation is performed on symbolic vertex names instead
#' of the internal numeric vertex ids.
#'
#' `union()` keeps the attributes of all graphs. All graph, vertex and
#' edge attributes are copied to the result. If an attribute is present in
#' multiple graphs and would result a name clash, then this attribute is
#' renamed by adding suffixes: _1, _2, etc.
#'
#' The `name` vertex attribute is treated specially if the operation is
#' performed based on symbolic vertex names. In this case `name` must be
#' present in all graphs, and it is not renamed in the result graph.
#'
#' An error is generated if some input graphs are directed and others are
#' undirected.
#'
#' @aliases %u%
#' @param \dots Graph objects or lists of graph objects.
#' @param byname A logical scalar, or the character scalar `auto`. Whether
#'   to perform the operation based on symbolic vertex names. If it is
#'   `auto`, that means `TRUE` if all graphs are named and `FALSE`
#'   otherwise. A warning is generated if `auto` and some (but not all)
#'   graphs are named.
#' @return A new graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @method union igraph
#' @family functions for manipulating graph structure
#' @export
#' @keywords graphs
#' @examples
#'
#' ## Union of two social networks with overlapping sets of actors
#' net1 <- graph_from_literal(
#'   D - A:B:F:G, A - C - F - A, B - E - G - B, A - B, F - G,
#'   H - F:G, H - I - J
#' )
#' net2 <- graph_from_literal(D - A:F:Y, B - A - X - F - H - Z, F - Y)
#' print_all(net1 %u% net2)
union.igraph <- function(..., byname = "auto") {
  .igraph.graph.union.or.intersection("union", ...,
    byname = byname,
    keep.all.vertices = TRUE
  )
}

#' @family functions for manipulating graph structure
#' @export
"%u%" <- function(x, y) {
  union(x, y)
}

#' Intersection of two or more sets
#'
#' This is an S3 generic function. See `methods("intersection")`
#' for the actual implementations for various S3 classes. Initially
#' it is implemented for igraph graphs and igraph vertex and edge
#' sequences. See
#' [intersection.igraph()], and
#' [intersection.igraph.vs()].
#'
#' @param ... Arguments, their number and interpretation depends on
#'   the function that implements `intersection()`.
#' @return Depends on the function that implements this method.
#'
#' @family functions for manipulating graph structure
#' @export
intersection <- function(...) {
  UseMethod("intersection")
}

#' Intersection of graphs
#'
#' The intersection of two or more graphs are created.  The graphs may have
#' identical or overlapping vertex sets.
#'
#' `intersection()` creates the intersection of two or more graphs:
#' only edges present in all graphs will be included.  The corresponding
#' operator is `%s%`.
#'
#' If the `byname` argument is `TRUE` (or `auto` and all graphs
#' are named), then the operation is performed on symbolic vertex names instead
#' of the internal numeric vertex ids.
#'
#' `intersection()` keeps the attributes of all graphs. All graph,
#' vertex and edge attributes are copied to the result. If an attribute is
#' present in multiple graphs and would result a name clash, then this
#' attribute is renamed by adding suffixes: _1, _2, etc.
#'
#' The `name` vertex attribute is treated specially if the operation is
#' performed based on symbolic vertex names. In this case `name` must be
#' present in all graphs, and it is not renamed in the result graph.
#'
#' An error is generated if some input graphs are directed and others are
#' undirected.
#'
#' @aliases %s%
#' @param \dots Graph objects or lists of graph objects.
#' @param byname A logical scalar, or the character scalar `auto`. Whether
#'   to perform the operation based on symbolic vertex names. If it is
#'   `auto`, that means `TRUE` if all graphs are named and `FALSE`
#'   otherwise. A warning is generated if `auto` and some (but not all)
#'   graphs are named.
#' @param keep.all.vertices Logical scalar, whether to keep vertices that only
#'   appear in a subset of the input graphs.
#' @return A new graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @method intersection igraph
#' @family functions for manipulating graph structure
#' @export
#' @keywords graphs
#' @examples
#'
#' ## Common part of two social networks
#' net1 <- graph_from_literal(
#'   D - A:B:F:G, A - C - F - A, B - E - G - B, A - B, F - G,
#'   H - F:G, H - I - J
#' )
#' net2 <- graph_from_literal(D - A:F:Y, B - A - X - F - H - Z, F - Y)
#' print_all(net1 %s% net2)
intersection.igraph <- function(..., byname = "auto",
                                keep.all.vertices = TRUE) {
  .igraph.graph.union.or.intersection("intersection", ...,
    byname = byname,
    keep.all.vertices = keep.all.vertices
  )
}

#' @family functions for manipulating graph structure
#' @export
"%s%" <- function(x, y) {
  intersection(x, y)
}

#' Difference of two sets
#'
#' This is an S3 generic function. See `methods("difference")`
#' for the actual implementations for various S3 classes. Initially
#' it is implemented for igraph graphs (difference of edges in two graphs),
#' and igraph vertex and edge sequences. See
#' [difference.igraph()], and
#' [difference.igraph.vs()].
#'
#' @param ... Arguments, their number and interpretation depends on
#'   the function that implements `difference()`.
#' @return Depends on the function that implements this method.
#'
#' @family functions for manipulating graph structure
#' @export
difference <- function(...) {
  UseMethod("difference")
}


#' Difference of graphs
#'
#' The difference of two graphs are created.
#'
#' `difference()` creates the difference of two graphs. Only edges
#' present in the first graph but not in the second will be be included in the
#' new graph. The corresponding operator is `%m%`.
#'
#' If the `byname` argument is `TRUE` (or `auto` and the graphs
#' are all named), then the operation is performed based on symbolic vertex
#' names. Otherwise numeric vertex ids are used.
#'
#' `difference()` keeps all attributes (graph, vertex and edge) of the
#' first graph.
#'
#' Note that `big` and `small` must both be directed or both be
#' undirected, otherwise an error message is given.
#'
#' @aliases %m%
#' @param big The left hand side argument of the minus operator. A directed or
#'   undirected graph.
#' @param small The right hand side argument of the minus operator. A directed
#'   ot undirected graph.
#' @param byname A logical scalar, or the character scalar `auto`. Whether
#'   to perform the operation based on symbolic vertex names. If it is
#'   `auto`, that means `TRUE` if both graphs are named and
#'   `FALSE` otherwise. A warning is generated if `auto` and one graph,
#'   but not both graphs are named.
#' @param ... Ignored, included for S3 compatibility.
#' @return A new graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @method difference igraph
#' @family functions for manipulating graph structure
#' @export
#' @keywords graphs
#' @examples
#'
#' ## Create a wheel graph
#' wheel <- union(
#'   make_ring(10),
#'   make_star(11, center = 11, mode = "undirected")
#' )
#' V(wheel)$name <- letters[seq_len(vcount(wheel))]
#'
#' ## Subtract a star graph from it
#' sstar <- make_star(6, center = 6, mode = "undirected")
#' V(sstar)$name <- letters[c(1, 3, 5, 7, 9, 11)]
#' G <- wheel %m% sstar
#' print_all(G)
#' plot(G, layout = layout_nicely(wheel))
difference.igraph <- function(big, small, byname = "auto", ...) {
  ensure_igraph(big)
  ensure_igraph(small)
  if (byname != "auto" && !is.logical(byname)) {
    stop("`bynam' must be \"auto\", or logical")
  }
  nonamed <- is_named(big) + is_named(small)
  if (byname == "auto") {
    byname <- nonamed == 2
    if (nonamed == 1) {
      warning("One, but not both graphs are named, not using vertex names")
    }
  } else if (byname && nonamed != 2) {
    stop("Some graphs are not named")
  }

  if (byname) {
    bnames <- V(big)$name
    snames <- V(small)$name
    if (any(!snames %in% bnames)) {
      small <- small - setdiff(snames, bnames)
      snames <- V(small)$name
    }
    perm <- match(bnames, snames)
    if (any(is.na(perm))) {
      perm[is.na(perm)] <- seq(from = vcount(small) + 1, to = vcount(big))
    }
    big <- permute(big, perm)

    on.exit(.Call(R_igraph_finalizer))
    res <- .Call(R_igraph_difference, big, small)
    permute(res, match(V(res)$name, bnames))
  } else {
    on.exit(.Call(R_igraph_finalizer))
    .Call(R_igraph_difference, big, small)
  }
}

#' @family functions for manipulating graph structure
#' @export
"%m%" <- function(x, y) {
  difference(x, y)
}



#' Complementer of a graph
#'
#' A complementer graph contains all edges that were not present in the input
#' graph.
#'
#' `complementer()` creates the complementer of a graph. Only edges
#' which are *not* present in the original graph will be included in the
#' new graph.
#'
#' `complementer()` keeps graph and vertex attriubutes, edge
#' attributes are lost.
#'
#' @param graph The input graph, can be directed or undirected.
#' @param loops Logical constant, whether to generate loop edges.
#' @return A new graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @family functions for manipulating graph structure
#' @export
#' @keywords graphs
#' @examples
#'
#' ## Complementer of a ring
#' g <- make_ring(10)
#' complementer(g)
#'
#' ## A graph and its complementer give together the full graph
#' g <- make_ring(10)
#' gc <- complementer(g)
#' gu <- union(g, gc)
#' gu
#' graph.isomorphic(gu, make_full_graph(vcount(g)))
#'
complementer <- function(graph, loops = FALSE) {
  ensure_igraph(graph)

  on.exit(.Call(R_igraph_finalizer))
  .Call(R_igraph_complementer, graph, as.logical(loops))
}



#' Compose two graphs as binary relations
#'
#' Relational composition of two graph.
#'
#' `compose()` creates the relational composition of two graphs. The
#' new graph will contain an (a,b) edge only if there is a vertex c, such that
#' edge (a,c) is included in the first graph and (c,b) is included in the
#' second graph. The corresponding operator is `%c%`.
#'
#' The function gives an error if one of the input graphs is directed and the
#' other is undirected.
#'
#' If the `byname` argument is `TRUE` (or `auto` and the graphs
#' are all named), then the operation is performed based on symbolic vertex
#' names. Otherwise numeric vertex ids are used.
#'
#' `compose()` keeps the attributes of both graphs. All graph, vertex
#' and edge attributes are copied to the result. If an attribute is present in
#' multiple graphs and would result a name clash, then this attribute is
#' renamed by adding suffixes: _1, _2, etc.
#'
#' The `name` vertex attribute is treated specially if the operation is
#' performed based on symbolic vertex names. In this case `name` must be
#' present in both graphs, and it is not renamed in the result graph.
#'
#' Note that an edge in the result graph corresponds to two edges in the input,
#' one in the first graph, one in the second. This mapping is not injective and
#' several edges in the result might correspond to the same edge in the first
#' (and/or the second) graph. The edge attributes in the result graph are
#' updated accordingly.
#'
#' Also note that the function may generate multigraphs, if there are more than
#' one way to find edges (a,b) in g1 and (b,c) in g2 for an edge (a,c) in the
#' result. See [simplify()] if you want to get rid of the multiple
#' edges.
#'
#' The function may create loop edges, if edges (a,b) and (b,a) are present in
#' g1 and g2, respectively, then (a,a) is included in the result. See
#' [simplify()] if you want to get rid of the self-loops.
#'
#' @aliases %c%
#' @param g1 The first input graph.
#' @param g2 The second input graph.
#' @param byname A logical scalar, or the character scalar `auto`. Whether
#'   to perform the operation based on symbolic vertex names. If it is
#'   `auto`, that means `TRUE` if both graphs are named and
#'   `FALSE` otherwise. A warning is generated if `auto` and one graph,
#'   but not both graphs are named.
#' @return A new graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @family functions for manipulating graph structure
#' @export
#' @keywords graphs
#' @examples
#'
#' g1 <- make_ring(10)
#' g2 <- make_star(10, mode = "undirected")
#' gc <- compose(g1, g2)
#' print_all(gc)
#' print_all(simplify(gc))
#'
compose <- function(g1, g2, byname = "auto") {
  ensure_igraph(g1)
  ensure_igraph(g2)

  if (byname != "auto" && !is.logical(byname)) {
    stop("`byname' must be \"auto\", or logical")
  }
  nonamed <- is_named(g1) + is_named(g2)
  if (byname == "auto") {
    byname <- nonamed == 2
    if (nonamed == 1) {
      warning("One, but not both graphs are named, not using vertex names")
    }
  } else if (byname && nonamed != 2) {
    stop("Some graphs are not named")
  }

  if (byname) {
    uninames <- unique(c(V(g1)$name, V(g2)$name))
    if (vcount(g1) < length(uninames)) {
      g1 <- g1 + setdiff(uninames, V(g1)$name)
    }
    if (vcount(g2) < length(uninames)) {
      g2 <- g2 + setdiff(uninames, V(g2)$name)
    }
    if (any(uninames != V(g1)$name)) {
      g1 <- permute(g1, match(V(g1)$name, uninames))
    }
    if (any(uninames != V(g2)$name)) {
      g2 <- permute(g2, match(V(g2)$name, uninames))
    }
  }

  edgemaps <- (length(edge_attr_names(g1)) != 0 ||
    length(edge_attr_names(g2)) != 0)

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_compose, g1, g2, edgemaps)
  maps <- list(res$edge_map1, res$edge_map2)
  res <- res$graph

  ## We might need to rename all attributes
  graphs <- list(g1, g2)
  graph.attributes(res) <- rename.attr.if.needed("g", graphs)

  if (byname) {
    vertex.attributes(res) <-
      rename.attr.if.needed("v", graphs, vcount(res), ignore = "name")
    V(res)$name <- uninames
  } else {
    vertex.attributes(res) <- rename.attr.if.needed(
      "v", graphs,
      vcount(res)
    )
  }

  if (edgemaps) {
    edge.attributes(res) <- rename.attr.if.needed("e", graphs, ecount(res),
      maps2 = maps
    )
  }

  res
}

#' @family functions for manipulating graph structure
#' @export
"%c%" <- function(x, y) {
  compose(x, y)
}

#' Helper function for adding and deleting edges
#'
#' This is a helper function that simplifies adding and deleting
#' edges to/from graphs.
#'
#' `edges()` is an alias for `edge()`.
#'
#' @details
#' When adding edges via `+`, all unnamed arguments of
#' `edge()` (or `edges()`) are concatenated, and then passed to
#' [add_edges()]. They are interpreted as pairs of vertex ids,
#' and an edge will added between each pair. Named arguments will be
#' used as edge attributes for the new edges.
#'
#' When deleting edges via `-`, all arguments of `edge()` (or
#' `edges()`) are concatenated via `c()` and passed to
#' [delete_edges()].
#'
#' @param ... See details below.
#' @return A special object that can be used with together with
#'   igraph graphs and the plus and minus operators.
#'
#' @family functions for manipulating graph structure
#'
#' @export
#' @examples
#' g <- make_ring(10) %>%
#'   set_edge_attr("color", value = "red")
#'
#' g <- g + edge(1, 5, color = "green") +
#'   edge(2, 6, color = "blue") -
#'   edge("8|9")
#'
#' E(g)[[]]
#'
#' g %>%
#'   add_layout_(in_circle()) %>%
#'   plot()
#'
#' g <- make_ring(10) + edges(1:10)
#' plot(g)
edge <- function(...) {
  structure(list(...), class = "igraph.edge")
}

#' @export
#' @rdname edge
edges <- edge

#' Helper function for adding and deleting vertices
#'
#' This is a helper function that simplifies adding and deleting
#' vertices to/from graphs.
#'
#' `vertices()` is an alias for `vertex()`.
#'
#' @details
#' When adding vertices via `+`, all unnamed arguments are interpreted
#' as vertex names of the new vertices. Named arguments are interpreted as
#' vertex attributes for the new vertices.
#'
#' When deleting vertices via `-`, all arguments of `vertex()` (or
#' `vertices()`) are concatenated via `c()` and passed to
#' [delete_vertices()].
#'
#' @param ... See details below.
#' @return A special object that can be used with together with
#'   igraph graphs and the plus and minus operators.
#'
#' @family functions for manipulating graph structure
#'
#' @export
#' @examples
#' g <- make_(ring(10), with_vertex_(name = LETTERS[1:10])) +
#'   vertices("X", "Y")
#' g
#' plot(g)
vertex <- function(...) {
  structure(list(...), class = "igraph.vertex")
}

#' @export
#' @rdname vertex
vertices <- vertex

#' Helper function to add or delete edges along a path
#'
#' This function can be used to add or delete edges that form a path.
#'
#' @details
#' When adding edges via `+`, all unnamed arguments are
#' concatenated, and each element of a final vector is interpreted
#' as a vertex in the graph. For a vector of length \eqn{n+1}, \eqn{n}
#' edges are then added, from vertex 1 to vertex 2, from vertex 2 to vertex
#' 3, etc. Named arguments will be used as edge attributes for the new
#' edges.
#'
#' When deleting edges, all attributes are concatenated and then passed
#' to [delete_edges()].
#'
#' @param ... See details below.
#' @return A special object that can be used together with igraph
#'   graphs and the plus and minus operators.
#'
#' @family functions for manipulating graph structure
#'
#' @export
#' @examples
#' # Create a (directed) wheel
#' g <- make_star(11, center = 1) + path(2:11, 2)
#' plot(g)
#'
#' g <- make_empty_graph(directed = FALSE, n = 10) %>%
#'   set_vertex_attr("name", value = letters[1:10])
#'
#' g2 <- g + path("a", "b", "c", "d")
#' plot(g2)
#'
#' g3 <- g2 + path("e", "f", "g", weight = 1:2, color = "red")
#' E(g3)[[]]
#'
#' g4 <- g3 + path(c("f", "c", "j", "d"), width = 1:3, color = "green")
#' E(g4)[[]]
path <- function(...) {
  structure(list(...), class = "igraph.path")
}

#' Add vertices, edges or another graph to a graph
#'
#' @details
#'   The plus operator can be used to add vertices or edges to graph.
#'   The actual operation that is performed depends on the type of the
#'   right hand side argument.
#'
#'   - If is is another igraph graph object and they are both
#'     named graphs, then the union of the two graphs are calculated,
#'     see [union()].
#'   - If it is another igraph graph object, but either of the two
#'     are not named, then the disjoint union of
#'     the two graphs is calculated, see [disjoint_union()].
#'   - If it is a numeric scalar, then the specified number of vertices
#'     are added to the graph.
#'   - If it is a character scalar or vector, then it is interpreted as
#'     the names of the vertices to add to the graph.
#'   - If it is an object created with the [vertex()] or
#'     [vertices()] function, then new vertices are added to the
#'     graph. This form is appropriate when one wants to add some vertex
#'     attributes as well. The operands of the `vertices()` function
#'     specifies the number of vertices to add and their attributes as
#'     well.
#'
#'     The unnamed arguments of `vertices()` are concatenated and
#'     used as the \sQuote{`name`} vertex attribute (i.e. vertex
#'     names), the named arguments will be added as additional vertex
#'     attributes. Examples: \preformatted{  g <- g +
#'         vertex(shape="circle", color= "red")
#'   g <- g + vertex("foo", color="blue")
#'   g <- g + vertex("bar", "foobar")
#'   g <- g + vertices("bar2", "foobar2", color=1:2, shape="rectangle")}
#'
#'     `vertex()` is just an alias to `vertices()`, and it is
#'     provided for readability. The user should use it if a single vertex
#'     is added to the graph.
#'
#'   - If it is an object created with the [edge()] or
#'     [edges()] function, then new edges will be added to the
#'     graph. The new edges and possibly their attributes can be specified as
#'     the arguments of the `edges()` function.
#'
#'     The unnamed arguments of `edges()` are concatenated and used
#'     as vertex ids of the end points of the new edges. The named
#'     arguments will be added as edge attributes.
#'
#'     Examples: \preformatted{  g <- make_empty_graph() +
#'          vertices(letters[1:10]) +
#'          vertices("foo", "bar", "bar2", "foobar2")
#'   g <- g + edge("a", "b")
#'   g <- g + edges("foo", "bar", "bar2", "foobar2")
#'   g <- g + edges(c("bar", "foo", "foobar2", "bar2"), color="red", weight=1:2)}
#'     See more examples below.
#'
#'     `edge()` is just an alias to `edges()` and it is provided
#'     for readability. The user should use it if a single edge is added to
#'     the graph.
#'
#'   - If it is an object created with the [path()] function, then
#'     new edges that form a path are added. The edges and possibly their
#'     attributes are specified as the arguments to the `path()`
#'     function. The non-named arguments are concatenated and interpreted
#'     as the vertex ids along the path. The remaining arguments are added
#'     as edge attributes.
#'
#'     Examples: \preformatted{  g <- make_empty_graph() + vertices(letters[1:10])
#'   g <- g + path("a", "b", "c", "d")
#'   g <- g + path("e", "f", "g", weight=1:2, color="red")
#'   g <- g + path(c("f", "c", "j", "d"), width=1:3, color="green")}
#'
#'   It is important to note that, although the plus operator is
#'   commutative, i.e. is possible to write \preformatted{  graph <- "foo" + make_empty_graph()}
#'   it is not associative, e.g. \preformatted{  graph <- "foo" + "bar" + make_empty_graph()}
#'   results a syntax error, unless parentheses are used: \preformatted{  graph <- "foo" + ( "bar" + make_empty_graph() )}
#'   For clarity, we suggest to always put the graph object on the left
#'   hand side of the operator: \preformatted{  graph <- make_empty_graph() + "foo" + "bar"}
#'
#' @param e1 First argument, probably an igraph graph, but see details
#'    below.
#' @param e2 Second argument, see details below.
#'
#' @family functions for manipulating graph structure
#'
#' @method + igraph
#' @export
#' @examples
#' # 10 vertices named a,b,c,... and no edges
#' g <- make_empty_graph() + vertices(letters[1:10])
#'
#' # Add edges to make it a ring
#' g <- g + path(letters[1:10], letters[1], color = "grey")
#'
#' # Add some extra random edges
#' g <- g + edges(sample(V(g), 10, replace = TRUE), color = "red")
#' g$layout <- layout_in_circle
#' plot(g)
`+.igraph` <- function(e1, e2) {
  if (!is_igraph(e1) && is_igraph(e2)) {
    tmp <- e1
    e1 <- e2
    e2 <- tmp
  }
  if (is_igraph(e2) && is_named(e1) && is_named(e2)) {
    ## Union of graphs
    res <- union(e1, e2)
  } else if (is_igraph(e2)) {
    ## Disjoint union of graphs
    res <- disjoint_union(e1, e2)
  } else if ("igraph.edge" %in% class(e2)) {
    ## Adding edges, possibly with attributes
    ## Non-named arguments define the edges
    if (is.null(names(e2))) {
      toadd <- unlist(e2, recursive = FALSE)
      attr <- list()
    } else {
      toadd <- unlist(e2[names(e2) == ""])
      attr <- e2[names(e2) != ""]
    }
    res <- add_edges(e1, as_igraph_vs(e1, toadd), attr = attr)
  } else if ("igraph.vertex" %in% class(e2)) {
    ## Adding vertices, possibly with attributes
    ## If there is a single unnamed argument, that contains the vertex names
    named <- rlang::have_name(e2)
    unnamed_indices <- which(!named)

    nn <- unlist(e2[unnamed_indices], recursive = FALSE)
    e2 <- c(
      if (!is.null(nn)) list(name = unname(nn)),
      e2[named]
    )

    # When adding vertices via +, all unnamed arguments are interpreted as vertex names of the new vertices.
    res <- add_vertices(e1, nv = vctrs::vec_size_common(!!!e2), attr = e2)
  } else if ("igraph.path" %in% class(e2)) {
    ## Adding edges along a path, possibly with attributes
    ## Non-named arguments define the edges
    if (is.null(names(e2))) {
      to_add <- unlist(e2, recursive = FALSE)
      attr <- list()
    } else {
      to_add <- unlist(e2[names(e2) == ""])
      attr <- e2[names(e2) != ""]
    }
    to_add <- as_igraph_vs(e1, to_add)
    lt <- length(to_add)
    if (lt > 2) {
      to_add <- c(to_add[1], rep(to_add[2:(lt - 1)], each = 2), to_add[lt])
      res <- add_edges(e1, to_add, attr = attr)
    } else if (lt == 2) {
      res <- add_edges(e1, to_add, attr = attr)
    } else {
      res <- e1
    }
  } else if (is.numeric(e2) && length(e2) == 1) {
    ## Adding some isolate vertices
    res <- add_vertices(e1, e2)
  } else if (is.character(e2)) {
    ## Adding named vertices
    res <- add_vertices(e1, length(e2), name = e2)
  } else {
    stop("Cannot add unknown type to igraph graph")
  }
  res
}

#' Delete vertices or edges from a graph
#'
#' @details
#' The minus operator (\sQuote{`-`}) can be used to remove vertices
#' or edges from the graph. The operation performed is selected based on
#' the type of the right hand side argument:
#' \itemize{
#' \item If it is an igraph graph object, then the difference of the
#'   two graphs is calculated, see [difference()].
#' \item If it is a numeric or character vector, then it is interpreted
#'   as a vector of vertex ids and the specified vertices will be
#'   deleted from the graph. Example: \preformatted{  g <- make_ring(10)
#' V(g)$name <- letters[1:10]
#' g <- g - c("a", "b")}
#' \item If `e2` is a vertex sequence (e.g. created by the
#'   [V()] function), then these vertices will be deleted from
#'   the graph.
#' \item If it is an edge sequence (e.g. created by the [E()]
#'   function), then these edges will be deleted from the graph.
#' \item If it is an object created with the [vertex()] (or the
#'   [vertices()]) function, then all arguments of [vertices()] are
#'   concatenated and the result is interpreted as a vector of vertex
#'   ids. These vertices will be removed from the graph.
#' \item If it is an object created with the [edge()] (or the
#'   [edges()]) function, then all arguments of [edges()] are
#'   concatenated and then interpreted as edges to be removed from the
#'   graph.
#'   Example: \preformatted{  g <- make_ring(10)
#' V(g)$name <- letters[1:10]
#' E(g)$name <- LETTERS[1:10]
#' g <- g - edge("e|f")
#' g <- g - edge("H")}
#' \item If it is an object created with the [path()] function,
#'   then all [path()] arguments are concatenated and then interpreted
#'   as a path along which edges will be removed from the graph.
#'   Example: \preformatted{  g <- make_ring(10)
#' V(g)$name <- letters[1:10]
#' g <- g - path("a", "b", "c", "d")}
#' }
#'
#' @param e1 Left argument, see details below.
#' @param e2 Right argument, see details below.
#' @return An igraph graph.
#'
#' @family functions for manipulating graph structure
#' @name igraph-minus
#'
#' @method - igraph
#' @export
`-.igraph` <- function(e1, e2) {
  if (missing(e2)) {
    stop("Non-numeric argument to negation operator")
  }
  if (is_igraph(e2)) {
    res <- difference(e1, e2)
  } else if ("igraph.vertex" %in% class(e2)) {
    res <- delete_vertices(e1, unlist(e2, recursive = FALSE))
  } else if ("igraph.edge" %in% class(e2)) {
    res <- delete_edges(e1, unlist(e2, recursive = FALSE))
  } else if ("igraph.path" %in% class(e2)) {
    todel <- unlist(e2, recursive = FALSE)
    lt <- length(todel)
    if (lt >= 2) {
      todel <- paste(todel[-lt], todel[-1], sep = "|")
      res <- delete_edges(e1, todel)
    } else {
      res <- e1
    }
  } else if ("igraph.vs" %in% class(e2)) {
    res <- delete_vertices(e1, e2)
  } else if ("igraph.es" %in% class(e2)) {
    res <- delete_edges(e1, e2)
  } else if (is.numeric(e2) || is.character(e2)) {
    res <- delete_vertices(e1, e2)
  } else {
    stop("Cannot substract unknown type from igraph graph")
  }
  res
}

#' Replicate a graph multiple times
#'
#' The new graph will contain the input graph the given number
#' of times, as unconnected components.
#'
#' @param x The input graph.
#' @param n Number of times to replicate it.
#' @param mark Whether to mark the vertices with a `which` attribute,
#'   an integer number denoting which replication the vertex is coming
#'   from.
#' @param ... Additional arguments to satisfy S3 requirements,
#'   currently ignored.
#'
#' @method rep igraph
#' @family functions for manipulating graph structure
#' @export
#'
#' @examples
#' rings <- make_ring(5) * 5
rep.igraph <- function(x, n, mark = TRUE, ...) {
  if (n < 0) stop("Number of replications must be positive")

  res <- do_call(disjoint_union,
    .args =
      replicate(n, x, simplify = FALSE)
  )

  if (mark) V(res)$which <- rep(seq_len(n), each = gorder(x))

  res
}

#' @rdname rep.igraph
#' @method * igraph
#' @export
`*.igraph` <- function(x, n) {
  if (!is_igraph(x) && is_igraph(n)) {
    tmp <- x
    x <- n
    n <- tmp
  }

  if (is.numeric(n) && length(n) == 1) {
    rep.igraph(x, n)
  } else {
    stop("Cannot multiply igraph graph with this type")
  }
}

#' Reverse edges in a graph
#'
#' The new graph will contain the same vertices, edges and attributes as
#' the original graph, except that the direction of the edges selected by
#' their edge IDs in the `eids` argument will be reversed. When reversing
#' all edges, this operation is also known as graph transpose.
#'
#' @param graph The input graph.
#' @param eids The edge IDs of the edges to reverse.
#' @return The result graph where the direction of the edges with the given
#'   IDs are reversed
#'
#' @examples
#'
#' g <- make_graph(~ 1 -+ 2, 2 -+ 3, 3 -+ 4)
#' reverse_edges(g, 2)
#' @family functions for manipulating graph structure
#' @export
#' @cdocs igraph_reverse_edges
reverse_edges <- reverse_edges_impl

#' @rdname reverse_edges
#' @param x The input graph.
#' @method t igraph
#' @export
t.igraph <- function(x) reverse_edges(x)
