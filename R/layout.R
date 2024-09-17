
#' Merging graph layouts
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `piecewise.layout()` was renamed to `layout_components()` to create a more
#' consistent API.
#' @inheritParams layout_components
#' @keywords internal
#' @export
piecewise.layout <- function(graph, layout = layout_with_kk, ...) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "piecewise.layout()", "layout_components()")
  layout_components(graph = graph, layout = layout, ...)
} # nocov end

#' The Sugiyama graph layout generator
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `layout.sugiyama()` was renamed to `layout_with_sugiyama()` to create a more
#' consistent API.
#' @inheritParams layout_with_sugiyama
#' @keywords internal
#' @export
layout.sugiyama <- function(graph, layers = NULL, hgap = 1, vgap = 1, maxiter = 100, weights = NULL, attributes = c("default", "all", "none")) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "layout.sugiyama()", "layout_with_sugiyama()")
  layout_with_sugiyama(graph = graph, layers = layers, hgap = hgap, vgap = vgap, maxiter = maxiter, weights = weights, attributes = attributes)
} # nocov end

#' Generate coordinates to place the vertices of a graph in a star-shape
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `layout.star()` was renamed to `layout_as_star()` to create a more
#' consistent API.
#' @inheritParams layout_as_star
#' @keywords internal
#' @export
layout.star <- function(graph, center = V(graph)[1], order = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "layout.star()", "layout_as_star()")
  layout_as_star(graph = graph, center = center, order = order)
} # nocov end

#' Normalize coordinates for plotting graphs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `layout.norm()` was renamed to `norm_coords()` to create a more
#' consistent API.
#' @inheritParams norm_coords
#' @keywords internal
#' @export
layout.norm <- function(layout, xmin = -1, xmax = 1, ymin = -1, ymax = 1, zmin = -1, zmax = 1) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "layout.norm()", "norm_coords()")
  norm_coords(layout = layout, xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax, zmin = zmin, zmax = zmax)
} # nocov end

#' Merging graph layouts
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `layout.merge()` was renamed to `merge_coords()` to create a more
#' consistent API.
#' @inheritParams merge_coords
#' @keywords internal
#' @export
layout.merge <- function(graphs, layouts, method = "dla") { # nocov start
  lifecycle::deprecate_soft("2.0.0", "layout.merge()", "merge_coords()")
  merge_coords(graphs = graphs, layouts = layouts, method = method)
} # nocov end

#' Graph layout by multidimensional scaling
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `layout.mds()` was renamed to `layout_with_mds()` to create a more
#' consistent API.
#' @inheritParams layout_with_mds
#' @keywords internal
#' @export
layout.mds <- function(graph, dist = NULL, dim = 2, options = arpack_defaults()) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "layout.mds()", "layout_with_mds()")
  layout_with_mds(graph = graph, dist = dist, dim = dim, options = options)
} # nocov end

#' Simple grid layout
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `layout.grid()` was renamed to `layout_on_grid()` to create a more
#' consistent API.
#' @inheritParams layout_on_grid
#' @keywords internal
#' @export
layout.grid <- function(graph, width = 0, height = 0, dim = 2) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "layout.grid()", "layout_on_grid()")
  layout_on_grid(graph = graph, width = width, height = height, dim = dim)
} # nocov end

#' The graphopt layout algorithm
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `layout.graphopt()` was renamed to `layout_with_graphopt()` to create a more
#' consistent API.
#' @inheritParams layout_with_graphopt
#' @keywords internal
#' @export
layout.graphopt <- function(graph, start = NULL, niter = 500, charge = 0.001, mass = 30, spring.length = 0, spring.constant = 1, max.sa.movement = 5) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "layout.graphopt()", "layout_with_graphopt()")
  layout_with_graphopt(graph = graph, start = start, niter = niter, charge = charge, mass = mass, spring.length = spring.length, spring.constant = spring.constant, max.sa.movement = max.sa.movement)
} # nocov end

#' The GEM layout algorithm
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `layout.gem()` was renamed to `layout_with_gem()` to create a more
#' consistent API.
#' @inheritParams layout_with_gem
#' @keywords internal
#' @export
layout.gem <- function(graph, coords = NULL, maxiter = 40 * vcount(graph)^2, temp.max = max(vcount(graph), 1), temp.min = 1 / 10, temp.init = sqrt(max(vcount(graph), 1))) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "layout.gem()", "layout_with_gem()")
  layout_with_gem(graph = graph, coords = coords, maxiter = maxiter, temp.max = temp.max, temp.min = temp.min, temp.init = temp.init)
} # nocov end

#' The Davidson-Harel layout algorithm
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `layout.davidson.harel()` was renamed to `layout_with_dh()` to create a more
#' consistent API.
#' @inheritParams layout_with_dh
#' @keywords internal
#' @export
layout.davidson.harel <- function(graph, coords = NULL, maxiter = 10, fineiter = max(10, log2(vcount(graph))), cool.fact = 0.75, weight.node.dist = 1.0, weight.border = 0.0, weight.edge.lengths = edge_density(graph) / 10, weight.edge.crossings = 1.0 - sqrt(edge_density(graph)), weight.node.edge.dist = 0.2 * (1 - edge_density(graph))) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "layout.davidson.harel()", "layout_with_dh()")
  layout_with_dh(graph = graph, coords = coords, maxiter = maxiter, fineiter = fineiter, cool.fact = cool.fact, weight.node.dist = weight.node.dist, weight.border = weight.border, weight.edge.lengths = weight.edge.lengths, weight.edge.crossings = weight.edge.crossings, weight.node.edge.dist = weight.node.edge.dist)
} # nocov end

#' Simple two-row layout for bipartite graphs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `layout.bipartite()` was renamed to `layout_as_bipartite()` to create a more
#' consistent API.
#' @inheritParams layout_as_bipartite
#' @keywords internal
#' @export
layout.bipartite <- function(graph, types = NULL, hgap = 1, vgap = 1, maxiter = 100) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "layout.bipartite()", "layout_as_bipartite()")
  layout_as_bipartite(graph = graph, types = types, hgap = hgap, vgap = vgap, maxiter = maxiter)
} # nocov end

#' Choose an appropriate graph layout algorithm automatically
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `layout.auto()` was renamed to `layout_nicely()` to create a more
#' consistent API.
#' @inheritParams layout_nicely
#' @keywords internal
#' @export
layout.auto <- function(graph, dim = 2, ...) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "layout.auto()", "layout_nicely()")
  layout_nicely(graph = graph, dim = dim, ...)
} # nocov end

## ----------------------------------------------------------------
##
##   IGraph R package
##   Copyright (C) 2003-2014  Gabor Csardi <csardi.gabor@gmail.com>
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
## ----------------------------------------------------------------


## ----------------------------------------------------------------
## This is the new layout API
## ----------------------------------------------------------------


#' Graph layouts
#'
#' This is a generic function to apply a layout function to
#' a graph.
#'
#' There are two ways to calculate graph layouts in igraph.
#' The first way is to call a layout function (they all have
#' prefix `layout_()` on a graph, to get the vertex coordinates.
#'
#' The second way (new in igraph 0.8.0), has two steps, and it
#' is more flexible. First you call a layout specification
#' function (the one without the `layout_()` prefix, and
#' then `layout_()` (or [add_layout_()]) to
#' perform the layouting.
#'
#' The second way is preferred, as it is more flexible. It allows
#' operations before and after the layouting. E.g. using the
#' `component_wise()` argument, the layout can be calculated
#' separately for each component, and then merged to get the
#' final results.
#'
#' @aliases layout
#' @section Modifiers:
#' Modifiers modify how a layout calculation is performed.
#' Currently implemented modifiers: \itemize{
#'   \item `component_wise()` calculates the layout separately
#'     for each component of the graph, and then merges
#'     them.
#'   \item `normalize()` scales the layout to a square.
#' }
#'
#' @param graph The input graph.
#' @param layout The layout specification. It must be a call
#'   to a layout specification function.
#' @param ... Further modifiers, see a complete list below.
#'   For the [print()] methods, it is ignored.
#' @return The return value of the layout function, usually a
#'   two column matrix. For 3D layouts a three column matrix.
#'
#' @seealso [add_layout_()] to add the layout to the
#'   graph as an attribute.
#' @export
#' @family graph layouts
#' @examples
#' g <- make_ring(10) + make_full_graph(5)
#' coords <- layout_(g, as_star())
#' plot(g, layout = coords)
layout_ <- function(graph, layout, ...) {
  modifiers <- list(...)
  stopifnot(all(sapply(modifiers, inherits,
    what = "igraph_layout_modifier"
  )))

  ids <- sapply(modifiers, "[[", "id")
  stopifnot(all(ids %in% c("component_wise", "normalize")))
  if (anyDuplicated(ids)) stop("Duplicate modifiers")
  names(modifiers) <- ids

  ## TODO: better, generic mechanism for modifiers
  if ("component_wise" %in% ids) {
    graph$id <- seq(vcount(graph))
    comps <- decompose(graph)
    coords <- lapply(comps, function(comp) {
      do_call(layout$fun, list(graph = comp), layout$args)
    })
    all_coords <- merge_coords(
      comps,
      coords,
      method = modifiers[["component_wise"]]$args$merge_method
    )
    all_coords[unlist(sapply(comps, vertex_attr, "id")), ] <- all_coords[]
    result <- all_coords
  } else {
    result <- do_call(layout$fun, list(graph = graph), layout$args)
  }

  if ("normalize" %in% ids) {
    result <- do_call(
      norm_coords, list(result),
      modifiers[["normalize"]]$args
    )
  }

  result
}


#' Add layout to graph
#'
#' @param graph The input graph.
#' @param ... Additional arguments are passed to [layout_()].
#' @param overwrite Whether to overwrite the layout of the graph,
#'    if it already has one.
#' @return The input graph, with the layout added.
#'
#' @seealso [layout_()] for a description of the layout API.
#' @export
#' @family graph layouts
#' @examples
#' (make_star(11) + make_star(11)) %>%
#'   add_layout_(as_star(), component_wise()) %>%
#'   plot()
add_layout_ <- function(graph, ..., overwrite = TRUE) {
  if (overwrite && "layout" %in% graph_attr_names(graph)) {
    graph <- delete_graph_attr(graph, "layout")
  }
  graph$layout <- layout_(graph, ...)
  graph
}


layout_spec <- function(fun, ...) {
  my_call <- match.call(sys.function(1), sys.call(1))
  my_call[[1]] <- substitute(fun)
  structure(
    list(
      fun = fun,
      call_str = sub("(", "(<graph>, ", deparse(my_call), fixed = TRUE),
      args = list(...)
    ),
    class = "igraph_layout_spec"
  )
}


#' @rdname layout_
#' @param x The layout specification
#' @method print igraph_layout_spec
#' @export
print.igraph_layout_spec <- function(x, ...) {
  cat(paste(
    sep = "",
    "igraph layout specification, see ?layout_:\n",
    x$call_str, "\n"
  ))
}


layout_modifier <- function(...) {
  structure(
    list(...),
    class = "igraph_layout_modifier"
  )
}


#' @rdname layout_
#' @method print igraph_layout_modifier
#' @export
print.igraph_layout_modifier <- function(x, ...) {
  cat(sep = "", "igraph layout modifier: ", x$id, ".\n")
}

#' Component-wise layout
#'
#' This is a layout modifier function, and it can be used
#' to calculate the layout separately for each component
#' of the graph.
#'
#' @param merge_method Merging algorithm, the `method`
#'   argument of [merge_coords()].
#'
#' @family layout modifiers
#' @family graph layouts
#' @seealso [merge_coords()], [layout_()].
#' @export
#' @examples
#' g <- make_ring(10) + make_ring(10)
#' g %>%
#'   add_layout_(in_circle(), component_wise()) %>%
#'   plot()
component_wise <- function(merge_method = "dla") {
  args <- grab_args()

  layout_modifier(
    id = "component_wise",
    args = args
  )
}

#' Normalize layout
#'
#' Scale coordinates of a layout.
#'
#' @param xmin,xmax Minimum and maximum for x coordinates.
#' @param ymin,ymax Minimum and maximum for y coordinates.
#' @param zmin,zmax Minimum and maximum for z coordinates.
#'
#' @family layout modifiers
#' @family graph layouts
#' @seealso [merge_coords()], [layout_()].
#' @export
#' @examples
#' layout_(make_ring(10), with_fr(), normalize())
normalize <- function(xmin = -1, xmax = 1, ymin = xmin, ymax = xmax,
                      zmin = xmin, zmax = xmax) {
  args <- grab_args()

  layout_modifier(
    id = "normalize",
    args = args
  )
}

## ----------------------------------------------------------------
## Layout definitions for the new API
## ----------------------------------------------------------------


#' Simple two-row layout for bipartite graphs
#'
#' Minimize edge-crossings in a simple two-row (or column) layout for bipartite
#' graphs.
#'
#' The layout is created by first placing the vertices in two rows, according
#' to their types. Then the positions within the rows are optimized to minimize
#' edge crossings, using the Sugiyama algorithm (see
#' [layout_with_sugiyama()]).
#'
#' @param graph The bipartite input graph. It should have a logical
#'   \sQuote{`type`} vertex attribute, or the `types` argument must be
#'   given.
#' @param types A logical vector, the vertex types. If this argument is
#'   `NULL` (the default), then the \sQuote{`type`} vertex attribute is
#'   used.
#' @param hgap Real scalar, the minimum horizontal gap between vertices in the
#'   same layer.
#' @param vgap Real scalar, the distance between the two layers.
#' @param maxiter Integer scalar, the maximum number of iterations in the
#'   crossing minimization stage. 100 is a reasonable default; if you feel that
#'   you have too many edge crossings, increase this.
#' @return A matrix with two columns and as many rows as the number of vertices
#'   in the input graph.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [layout_with_sugiyama()]
#' @keywords graphs
#' @export
#' @family graph layouts
#' @examples
#' # Random bipartite graph
#' inc <- matrix(sample(0:1, 50, replace = TRUE, prob = c(2, 1)), 10, 5)
#' g <- graph_from_biadjacency_matrix(inc)
#' plot(g,
#'   layout = layout_as_bipartite,
#'   vertex.color = c("green", "cyan")[V(g)$type + 1]
#' )
#'
#' # Two columns
#' g %>%
#'   add_layout_(as_bipartite()) %>%
#'   plot()
layout_as_bipartite <- function(graph, types = NULL, hgap = 1, vgap = 1,
                                maxiter = 100) {
  ## Argument checks
  ensure_igraph(graph)
  types <- handle_vertex_type_arg(types, graph)
  hgap <- as.numeric(hgap)
  vgap <- as.numeric(vgap)
  maxiter <- as.numeric(maxiter)

  on.exit(.Call(R_igraph_finalizer))

  ## Function call
  res <- .Call(R_igraph_layout_bipartite, graph, types, hgap, vgap, maxiter)

  res
}


#' @rdname layout_as_bipartite
#' @param ... Arguments to pass to `layout_as_bipartite()`.
#' @export
as_bipartite <- function(...) layout_spec(layout_as_bipartite, ...)


## ----------------------------------------------------------------


#' Generate coordinates to place the vertices of a graph in a star-shape
#'
#' A simple layout generator, that places one vertex in the center of a circle
#' and the rest of the vertices equidistantly on the perimeter.
#'
#' It is possible to choose the vertex that will be in the center, and the
#' order of the vertices can be also given.
#'
#' @param graph The graph to layout.
#' @param center The id of the vertex to put in the center. By default it is
#'   the first vertex.
#' @param order Numeric vector, the order of the vertices along the perimeter.
#'   The default ordering is given by the vertex ids.
#' @return A matrix with two columns and as many rows as the number of vertices
#'   in the input graph.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [layout()] and [layout_with_drl()] for other layout
#' algorithms, [plot.igraph()] and [tkplot()] on how to
#' plot graphs and [star()] on how to create ring graphs.
#' @keywords graphs
#' @export
#' @family graph layouts
#' @examples
#'
#' g <- make_star(10)
#' layout_as_star(g)
#'
#' ## Alternative form
#' layout_(g, as_star())
layout_as_star <- function(graph, center = V(graph)[1], order = NULL) {
  # Argument checks
  ensure_igraph(graph)
  if (vcount(graph) == 0) {
    # Any other layout will do so just pick one that supports graphs with no
    # vertices
    return(layout_in_circle(graph))
  }
  center <- as_igraph_vs(graph, center)
  if (length(center) == 0) {
    center <- 1
  }
  if (!is.null(order)) order <- as.numeric(order) - 1

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_layout_star, graph, center - 1, order)

  res
}


#' @rdname layout_as_star
#' @param ... Arguments to pass to `layout_as_star()`.
#' @export
as_star <- function(...) layout_spec(layout_as_star, ...)


## ----------------------------------------------------------------


#' The Reingold-Tilford graph layout algorithm
#'
#' A tree-like layout, it is perfect for trees, acceptable for graphs with not
#' too many cycles.
#'
#' Arranges the nodes in a tree where the given node is used as the root.  The
#' tree is directed downwards and the parents are centered above its children.
#' For the exact algorithm, the reference below.
#'
#' If the given graph is not a tree, a breadth-first search is executed first
#' to obtain a possible spanning tree.
#'
#' @param graph The input graph.
#' @param root The index of the root vertex or root vertices.  If this is a
#'   non-empty vector then the supplied vertex ids are used as the roots of the
#'   trees (or a single tree if the graph is connected).  If it is an empty
#'   vector, then the root vertices are automatically calculated based on
#'   topological sorting, performed with the opposite mode than the `mode`
#'   argument. After the vertices have been sorted, one is selected from each
#'   component.
#' @param circular Logical scalar, whether to plot the tree in a circular
#'   fashion. Defaults to `FALSE`, so the tree branches are going bottom-up
#'   (or top-down, see the `flip.y` argument.
#' @param rootlevel This argument can be useful when drawing forests which are
#'   not trees (i.e. they are unconnected and have tree components). It specifies
#'   the level of the root vertices for every tree in the forest. It is only
#'   considered if the `roots` argument is not an empty vector.
#' @param mode Specifies which edges to consider when building the tree.  If it
#'   is \sQuote{out}, then only the outgoing, if it is \sQuote{in}, then only the
#'   incoming edges of a parent are considered. If it is \sQuote{all} then all
#'   edges are used (this was the behavior in igraph 0.5 and before). This
#'   parameter also influences how the root vertices are calculated, if they are
#'   not given. See the `roots` parameter.
#' @param flip.y Logical scalar, whether to flip the \sQuote{y} coordinates.
#'   The default is flipping because that puts the root vertex on the top.
#' @return A numeric matrix with two columns, and one row for each vertex.
#' @author Tamas Nepusz \email{ntamas@@gmail.com} and Gabor Csardi
#' \email{csardi.gabor@@gmail.com}
#' @references Reingold, E and Tilford, J (1981). Tidier drawing of trees.
#' *IEEE Trans. on Softw. Eng.*, SE-7(2):223--228.
#' @keywords graphs
#' @export
#' @family graph layouts
#' @examples
#'
#' tree <- make_tree(20, 3)
#' plot(tree, layout = layout_as_tree)
#' plot(tree, layout = layout_as_tree(tree, flip.y = FALSE))
#' plot(tree, layout = layout_as_tree(tree, circular = TRUE))
#'
#' tree2 <- make_tree(10, 3) + make_tree(10, 2)
#' plot(tree2, layout = layout_as_tree)
#' plot(tree2, layout = layout_as_tree(tree2,
#'   root = c(1, 11),
#'   rootlevel = c(2, 1)
#' ))
layout_as_tree <- function(graph, root = numeric(), circular = FALSE,
                           rootlevel = numeric(), mode = c("out", "in", "all"),
                           flip.y = TRUE) {
  ensure_igraph(graph)
  root <- as_igraph_vs(graph, root) - 1
  circular <- as.logical(circular)
  rootlevel <- as.double(rootlevel)
  mode <- switch(igraph.match.arg(mode),
    "out" = 1,
    "in" = 2,
    "all" = 3,
    "total" = 3
  )
  flip.y <- as.logical(flip.y)

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_layout_reingold_tilford, graph, root, mode,
    rootlevel, circular
  )
  if (flip.y && vcount(graph) > 0) {
    res[, 2] <- max(res[, 2]) - res[, 2]
  }
  res
}


#' @rdname layout_as_tree
#' @param ... Passed to `layout_as_tree()`.
#' @export
as_tree <- function(...) layout_spec(layout_as_tree, ...)


#' The Reingold-Tilford graph layout algorithm
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `layout.reingold.tilford()` was renamed to `layout_as_tree()` to create a more
#' consistent API.
#' @param ... Passed to the new layout functions.
#' @param params Passed to the new layout functions as arguments.
#' @keywords internal
#' @export
layout.reingold.tilford <- function(..., params = list()) {
  lifecycle::deprecate_soft("2.0.4", "layout.reingold.tilford()", "layout_as_tree()")
  do_call(layout_as_tree, .args = c(list(...), params))
}

## ----------------------------------------------------------------


#' Graph layout with vertices on a circle.
#'
#' Place vertices on a circle, in the order of their vertex ids.
#'
#' If you want to order the vertices differently, then permute them using the
#' [permute()] function.
#'
#' @param graph The input graph.
#' @param order The vertices to place on the circle, in the order of their
#'   desired placement. Vertices that are not included here will be placed at
#'   (0,0).
#' @return A numeric matrix with two columns, and one row for each vertex.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @keywords graphs
#' @export
#' @family graph layouts
#' @examplesIf igraph:::has_glpk()
#'
#' ## Place vertices on a circle, order them according to their
#' ## community
#' library(igraphdata)
#' data(karate)
#' karate_groups <- cluster_optimal(karate)
#' coords <- layout_in_circle(karate,
#'   order =
#'     order(membership(karate_groups))
#' )
#' V(karate)$label <- sub("Actor ", "", V(karate)$name)
#' V(karate)$label.color <- membership(karate_groups)
#' V(karate)$shape <- "none"
#' plot(karate, layout = coords)
layout_in_circle <- function(graph, order = V(graph)) {
  ensure_igraph(graph)
  order <- as_igraph_vs(graph, order) - 1L
  on.exit(.Call(R_igraph_finalizer))
  .Call(R_igraph_layout_circle, graph, order)
}

#' @rdname layout_in_circle
#' @param ... Passed to `layout_in_circle()`.
#' @export
in_circle <- function(...) layout_spec(layout_in_circle, ...)

#' Graph layout with vertices on a circle
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `layout.circle()` was renamed to `layout_in_circle()` to create a more
#' consistent API.
#' @param ... Passed to the new layout functions.
#' @param params Passed to the new layout functions as arguments.
#' @keywords internal
#' @export
layout.circle <- function(..., params = list()) {
  lifecycle::deprecate_soft("2.0.4", "layout.circle()", "layout_in_circle()")
  do_call(layout_in_circle, .args = c(list(...), params))
}

## ----------------------------------------------------------------


#' Choose an appropriate graph layout algorithm automatically
#'
#' This function tries to choose an appropriate graph layout algorithm for the
#' graph, automatically, based on a simple algorithm. See details below.
#'
#' `layout_nicely()` tries to choose an appropriate layout function for the
#' supplied graph, and uses that to generate the layout. The current
#' implementation works like this: \enumerate{ \item If the graph has a graph
#' attribute called \sQuote{layout}, then this is used. If this attribute is an
#' R function, then it is called, with the graph and any other extra arguments.
#' \item Otherwise, if the graph has vertex attributes called \sQuote{x} and
#' \sQuote{y}, then these are used as coordinates. If the graph has an
#' additional \sQuote{z} vertex attribute, that is also used.  \item Otherwise,
#' if the graph is connected and has less than 1000 vertices, the
#' Fruchterman-Reingold layout is used, by calling `layout_with_fr()`.
#' \item Otherwise the DrL layout is used, `layout_with_drl()` is called.  }
#'
#' In layout algorithm implementations, an argument named \sQuote{weights} is
#' typically used to specify the weights of the edges if the layout algorithm
#' supports them. In this case, omitting \sQuote{weights} or setting it to
#' `NULL` will make igraph use the 'weight' edge attribute from the graph
#' if it is present. However, most layout algorithms do not support non-positive
#' weights, so `layout_nicely()` would fail if you simply called it on
#' your graph without specifying explicit weights and the weights happened to
#' include non-positive numbers. We strive to ensure that `layout_nicely()`
#' works out-of-the-box for most graphs, so the rule is that if you omit
#' \sQuote{weights} or set it to `NULL` and `layout_nicely()` would
#' end up calling `layout_with_fr()` or `layout_with_drl()`, we do not
#' forward the weights to these functions and issue a warning about this. You
#' can use `weights = NA` to silence the warning.
#'
#' @param graph The input graph
#' @param dim Dimensions, should be 2 or 3.
#' @param \dots For `layout_nicely()` the extra arguments are passed to
#'   the real layout function. For `nicely()` all argument are passed to
#'   `layout_nicely()`.
#' @return A numeric matrix with two or three columns.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [plot.igraph()]
#' @keywords graphs
#' @export
#' @family graph layouts
layout_nicely <- function(graph, dim = 2, ...) {
  ## 1. If there is a 'layout' graph attribute, we just use that.
  ## 2. Otherwise, if there are vertex attributes called 'x' and 'y',
  ##    we use those (and the 'z' vertex attribute as well, if present).
  ## 3. Otherwise, if the graph is small (<1000) we use
  ##    the Fruchterman-Reingold layout.
  ## 4. Otherwise we use the DrL layout generator.

  if ("layout" %in% graph_attr_names(graph)) {
    lay <- graph_attr(graph, "layout")
    if (is.function(lay)) {
      if (!identical(lay, layout_nicely)) {
        return(lay(graph, ...))
      } else {
        # nop, we'll deal with it later below
      }
    } else {
      return(lay)
    }
  }

  if (all(c("x", "y") %in% vertex_attr_names(graph))) {
    if ("z" %in% vertex_attr_names(graph)) {
      cbind(V(graph)$x, V(graph)$y, V(graph)$z)
    } else {
      cbind(V(graph)$x, V(graph)$y)
    }
  } else {
    args <- list(...)
    if (!("weights" %in% names(args)) || is.null(args$weights)) {
      if ("weight" %in% edge_attr_names(graph)) {
        weights <- E(graph)$weight
        if (any(weights <= 0, na.rm = TRUE)) {
          warning("Non-positive edge weight found, ignoring all weights during graph layout.")
          args$weights <- NA
        }
      }
    }

    args$graph <- graph
    args$dim <- dim

    if (vcount(graph) < 1000) {
      do.call(layout_with_fr, args)
    } else {
      do.call(layout_with_drl, args)
    }
  }
}


#' @rdname layout_nicely
#' @export
nicely <- function(...) layout_spec(layout_nicely, ...)


## ----------------------------------------------------------------


#' Simple grid layout
#'
#' This layout places vertices on a rectangular grid, in two or three
#' dimensions.
#'
#' The function places the vertices on a simple rectangular grid, one after the
#' other. If you want to change the order of the vertices, then see the
#' [permute()] function.
#'
#' @param graph The input graph.
#' @param width The number of vertices in a single row of the grid. If this is
#'   zero or negative, then for 2d layouts the width of the grid will be the
#'   square root of the number of vertices in the graph, rounded up to the next
#'   integer. Similarly, it will be the cube root for 3d layouts.
#' @param height The number of vertices in a single column of the grid, for
#'   three dimensional layouts. If this is zero or negative, then it is
#'   determinted automatically.
#' @param dim Two or three. Whether to make 2d or a 3d layout.
#' @return A two-column or three-column matrix.
#' @author Tamas Nepusz \email{ntamas@@gmail.com}
#' @seealso [layout()] for other layout generators
#' @keywords graphs
#' @export
#' @family graph layouts
#' @examples
#'
#' g <- make_lattice(c(3, 3))
#' layout_on_grid(g)
#'
#' g2 <- make_lattice(c(3, 3, 3))
#' layout_on_grid(g2, dim = 3)
#'
#' plot(g, layout = layout_on_grid)
#' if (interactive() && requireNamespace("rgl", quietly = TRUE)) {
#'   rglplot(g, layout = layout_on_grid(g, dim = 3))
#' }
layout_on_grid <- function(graph, width = 0, height = 0, dim = 2) {
  # Argument checks
  ensure_igraph(graph)
  width <- as.numeric(width)
  dim <- as.numeric(dim)
  stopifnot(dim == 2 || dim == 3)
  if (dim == 3) {
    height <- as.numeric(height)
  }

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  if (dim == 2) {
    res <- .Call(R_igraph_layout_grid, graph, width)
  } else {
    res <- .Call(R_igraph_layout_grid_3d, graph, width, height)
  }

  res
}


#' @rdname layout_on_grid
#' @param ... Passed to `layout_on_grid()`.
#' @export
on_grid <- function(...) layout_spec(layout_on_grid, ...)


#' Simple grid layout
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' Use [layout_on_grid()].
#' @inheritParams layout_on_grid
#' @export
#' @export
#' @keywords internal
layout.grid.3d <- function(graph, width = 0, height = 0) {
  lifecycle::deprecate_stop("2.0.4", "layout.grid.3d()", "layout_on_grid()")
}

## ----------------------------------------------------------------


#' Graph layout with vertices on the surface of a sphere
#'
#' Place vertices on a sphere, approximately uniformly, in the order of their
#' vertex ids.
#'
#' `layout_on_sphere()` places the vertices (approximately) uniformly on the
#' surface of a sphere, this is thus a 3d layout. It is not clear however what
#' \dQuote{uniformly on a sphere} means.
#'
#' If you want to order the vertices differently, then permute them using the
#' [permute()] function.
#'
#' @param graph The input graph.
#' @return A numeric matrix with three columns, and one row for each vertex.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @keywords graphs
#' @export
#' @family graph layouts
layout_on_sphere <- function(graph) {
  ensure_igraph(graph)

  on.exit(.Call(R_igraph_finalizer))
  .Call(R_igraph_layout_sphere, graph)
}


#' @rdname layout_on_sphere
#' @param ... Passed to `layout_on_sphere()`.
#' @export
on_sphere <- function(...) layout_spec(layout_on_sphere, ...)

#' Graph layout with vertices on the surface of a sphere
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `layout.sphere()` was renamed to `layout_on_sphere()` to create a more
#' consistent API.
#' @param ... Passed to the new layout functions.
#' @param params Passed to the new layout functions as arguments.
#' @keywords internal
#' @export
layout.sphere <- function(..., params = list()) {
  lifecycle::deprecate_soft("2.0.4", "layout.sphere()", "layout_on_sphere()")
  do_call(layout_on_sphere, .args = c(list(...), params))
}

## ----------------------------------------------------------------


#' Randomly place vertices on a plane or in 3d space
#'
#' This function uniformly randomly places the vertices of the graph in two or
#' three dimensions.
#'
#' Randomly places vertices on a \[-1,1\] square (in 2d) or in a cube (in 3d). It
#' is probably a useless layout, but it can use as a starting point for other
#' layout generators.
#'
#' @param graph The input graph.
#' @param dim Integer scalar, the dimension of the space to use. It must be 2
#'   or 3.
#' @return A numeric matrix with two or three columns.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @keywords graphs
#' @export
#' @family graph layouts
layout_randomly <- function(graph, dim = 2) {
  ensure_igraph(graph)
  if (dim == 2) {
    on.exit(.Call(R_igraph_finalizer))
    .Call(R_igraph_layout_random, graph)
  } else if (dim == 3) {
    on.exit(.Call(R_igraph_finalizer))
    .Call(R_igraph_layout_random_3d, graph)
  } else {
    stop("Invalid `dim' value")
  }
}

#' @rdname layout_randomly
#' @param ... Parameters to pass to `layout_randomly()`.
#' @export
randomly <- function(...) layout_spec(layout_randomly, ...)

#' Randomly place vertices on a plane or in 3d space
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `layout.random()` was renamed to `layout_randomly()` to create a more
#' consistent API.
#' @param ... Passed to the new layout functions.
#' @param params Passed to the new layout functions as arguments.
#' @keywords internal
#' @export
layout.random <- function(..., params = list()) {
  lifecycle::deprecate_soft("2.0.4", "layout.random()", "layout_randomly()")
  do_call(layout_randomly, .args = c(list(...), params))
}


## ----------------------------------------------------------------



#' The Davidson-Harel layout algorithm
#'
#' Place vertices of a graph on the plane, according to the simulated annealing
#' algorithm by Davidson and Harel.
#'
#' This function implements the algorithm by Davidson and Harel, see Ron
#' Davidson, David Harel: Drawing Graphs Nicely Using Simulated Annealing. ACM
#' Transactions on Graphics 15(4), pp. 301-331, 1996.
#'
#' The algorithm uses simulated annealing and a sophisticated energy function,
#' which is unfortunately hard to parameterize for different graphs. The
#' original publication did not disclose any parameter values, and the ones
#' below were determined by experimentation.
#'
#' The algorithm consists of two phases, an annealing phase, and a fine-tuning
#' phase. There is no simulated annealing in the second phase.
#'
#' Our implementation tries to follow the original publication, as much as
#' possible. The only major difference is that coordinates are explicitly kept
#' within the bounds of the rectangle of the layout.
#'
#' @param graph The graph to lay out. Edge directions are ignored.
#' @param coords Optional starting positions for the vertices. If this argument
#'   is not `NULL` then it should be an appropriate matrix of starting
#'   coordinates.
#' @param maxiter Number of iterations to perform in the first phase.
#' @param fineiter Number of iterations in the fine tuning phase.
#' @param cool.fact Cooling factor.
#' @param weight.node.dist Weight for the node-node distances component of the
#'   energy function.
#' @param weight.border Weight for the distance from the border component of
#'   the energy function. It can be set to zero, if vertices are allowed to sit
#'   on the border.
#' @param weight.edge.lengths Weight for the edge length component of the
#'   energy function.
#' @param weight.edge.crossings Weight for the edge crossing component of the
#'   energy function.
#' @param weight.node.edge.dist Weight for the node-edge distance component of
#'   the energy function.
#' @return A two- or three-column matrix, each row giving the coordinates of a
#'   vertex, according to the ids of the vertex ids.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [layout_with_fr()],
#' [layout_with_kk()] for other layout algorithms.
#' @references Ron Davidson, David Harel: Drawing Graphs Nicely Using Simulated
#' Annealing. *ACM Transactions on Graphics* 15(4), pp. 301-331, 1996.
#' @export
#' @family graph layouts
#' @examples
#'
#' set.seed(42)
#' ## Figures from the paper
#' g_1b <- make_star(19, mode = "undirected") + path(c(2:19, 2)) +
#'   path(c(seq(2, 18, by = 2), 2))
#' plot(g_1b, layout = layout_with_dh)
#'
#' g_2 <- make_lattice(c(8, 3)) + edges(1, 8, 9, 16, 17, 24)
#' plot(g_2, layout = layout_with_dh)
#'
#' g_3 <- make_empty_graph(n = 70)
#' plot(g_3, layout = layout_with_dh)
#'
#' g_4 <- make_empty_graph(n = 70, directed = FALSE) + edges(1:70)
#' plot(g_4, layout = layout_with_dh, vertex.size = 5, vertex.label = NA)
#'
#' g_5a <- make_ring(24)
#' plot(g_5a, layout = layout_with_dh, vertex.size = 5, vertex.label = NA)
#'
#' g_5b <- make_ring(40)
#' plot(g_5b, layout = layout_with_dh, vertex.size = 5, vertex.label = NA)
#'
#' g_6 <- make_lattice(c(2, 2, 2))
#' plot(g_6, layout = layout_with_dh)
#'
#' g_7 <- graph_from_literal(1:3:5 -- 2:4:6)
#' plot(g_7, layout = layout_with_dh, vertex.label = V(g_7)$name)
#'
#' g_8 <- make_ring(5) + make_ring(10) + make_ring(5) +
#'   edges(
#'     1, 6, 2, 8, 3, 10, 4, 12, 5, 14,
#'     7, 16, 9, 17, 11, 18, 13, 19, 15, 20
#'   )
#' plot(g_8, layout = layout_with_dh, vertex.size = 5, vertex.label = NA)
#'
#' g_9 <- make_lattice(c(3, 2, 2))
#' plot(g_9, layout = layout_with_dh, vertex.size = 5, vertex.label = NA)
#'
#' g_10 <- make_lattice(c(6, 6))
#' plot(g_10, layout = layout_with_dh, vertex.size = 5, vertex.label = NA)
#'
#' g_11a <- make_tree(31, 2, mode = "undirected")
#' plot(g_11a, layout = layout_with_dh, vertex.size = 5, vertex.label = NA)
#'
#' g_11b <- make_tree(21, 4, mode = "undirected")
#' plot(g_11b, layout = layout_with_dh, vertex.size = 5, vertex.label = NA)
#'
#' g_12 <- make_empty_graph(n = 37, directed = FALSE) +
#'   path(1:5, 10, 22, 31, 37:33, 27, 16, 6, 1) + path(6, 7, 11, 9, 10) + path(16:22) +
#'   path(27:31) + path(2, 7, 18, 28, 34) + path(3, 8, 11, 19, 29, 32, 35) +
#'   path(4, 9, 20, 30, 36) + path(1, 7, 12, 14, 19, 24, 26, 30, 37) +
#'   path(5, 9, 13, 15, 19, 23, 25, 28, 33) + path(3, 12, 16, 25, 35, 26, 22, 13, 3)
#' plot(g_12, layout = layout_with_dh, vertex.size = 5, vertex.label = NA)
layout_with_dh <- function(graph, coords = NULL, maxiter = 10,
                           fineiter = max(10, log2(vcount(graph))), cool.fact = 0.75,
                           weight.node.dist = 1.0, weight.border = 0.0,
                           weight.edge.lengths = edge_density(graph) / 10,
                           weight.edge.crossings = 1.0 - sqrt(edge_density(graph)),
                           weight.node.edge.dist = 0.2 * (1 - edge_density(graph))) {
  # Argument checks
  ensure_igraph(graph)
  if (!is.null(coords)) {
    coords[] <- as.numeric(coords)
    use.seed <- TRUE
  } else {
    coords <- matrix(NA_real_, ncol = 2, nrow = 0)
    use.seed <- FALSE
  }
  maxiter <- as.numeric(maxiter)
  fineiter <- as.numeric(fineiter)
  cool.fact <- as.numeric(cool.fact)
  weight.node.dist <- as.numeric(weight.node.dist)
  weight.border <- as.numeric(weight.border)
  weight.edge.lengths <- as.numeric(weight.edge.lengths)
  weight.edge.crossings <- as.numeric(weight.edge.crossings)
  weight.node.edge.dist <- as.numeric(weight.node.edge.dist)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(
    R_igraph_layout_davidson_harel, graph, coords, use.seed,
    maxiter, fineiter, cool.fact, weight.node.dist,
    weight.border, weight.edge.lengths, weight.edge.crossings,
    weight.node.edge.dist
  )

  res
}


#' @rdname layout_with_dh
#' @param ... Passed to `layout_with_dh()`.
#' @export
with_dh <- function(...) layout_spec(layout_with_dh, ...)



## ----------------------------------------------------------------


#' The Fruchterman-Reingold layout algorithm
#'
#' Place vertices on the plane using the force-directed layout algorithm by
#' Fruchterman and Reingold.
#'
#' See the referenced paper below for the details of the algorithm.
#'
#' This function was rewritten from scratch in igraph version 0.8.0.
#'
#' @param graph The graph to lay out. Edge directions are ignored.
#' @param coords Optional starting positions for the vertices. If this argument
#'   is not `NULL` then it should be an appropriate matrix of starting
#'   coordinates.
#' @param dim Integer scalar, 2 or 3, the dimension of the layout.  Two
#'   dimensional layouts are places on a plane, three dimensional ones in the 3d
#'   space.
#' @param niter Integer scalar, the number of iterations to perform.
#' @param start.temp Real scalar, the start temperature. This is the maximum
#'   amount of movement alloved along one axis, within one step, for a vertex.
#'   Currently it is decreased linearly to zero during the iteration.
#' @param grid Character scalar, whether to use the faster, but less accurate
#'   grid based implementation of the algorithm. By default (\dQuote{auto}), the
#'   grid-based implementation is used if the graph has more than one thousand
#'   vertices.
#' @param weights A vector giving edge weights. The `weight` edge
#'   attribute is used by default, if present. If weights are given, then the
#'   attraction along the edges will be multiplied by the given edge weights.
#'   This places vertices connected with a highly weighted edge closer to
#'   each other. Weights must be positive.
#' @param minx If not `NULL`, then it must be a numeric vector that gives
#'   lower boundaries for the \sQuote{x} coordinates of the vertices. The length
#'   of the vector must match the number of vertices in the graph.
#' @param maxx Similar to `minx`, but gives the upper boundaries.
#' @param miny Similar to `minx`, but gives the lower boundaries of the
#'   \sQuote{y} coordinates.
#' @param maxy Similar to `minx`, but gives the upper boundaries of the
#'   \sQuote{y} coordinates.
#' @param minz Similar to `minx`, but gives the lower boundaries of the
#'   \sQuote{z} coordinates.
#' @param maxz Similar to `minx`, but gives the upper boundaries of the
#'   \sQuote{z} coordinates.
#' @param coolexp,maxdelta,area,repulserad `r lifecycle::badge("deprecated")` These
#'  arguments are not supported from igraph version 0.8.0 and are ignored
#'  (with a warning).
#' @param maxiter A deprecated synonym of `niter`, for compatibility.
#' @return A two- or three-column matrix, each row giving the coordinates of a
#'   vertex, according to the ids of the vertex ids.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [layout_with_drl()], [layout_with_kk()] for
#' other layout algorithms.
#' @references Fruchterman, T.M.J. and Reingold, E.M. (1991). Graph Drawing by
#' Force-directed Placement. *Software - Practice and Experience*,
#' 21(11):1129-1164.
#' @export
#' @family graph layouts
#' @keywords graphs
#' @examples
#'
#' # Fixing ego
#' g <- sample_pa(20, m = 2)
#' minC <- rep(-Inf, vcount(g))
#' maxC <- rep(Inf, vcount(g))
#' minC[1] <- maxC[1] <- 0
#' co <- layout_with_fr(g,
#'   minx = minC, maxx = maxC,
#'   miny = minC, maxy = maxC
#' )
#' co[1, ]
#' plot(g,
#'   layout = co, vertex.size = 30, edge.arrow.size = 0.2,
#'   vertex.label = c("ego", rep("", vcount(g) - 1)), rescale = FALSE,
#'   xlim = range(co[, 1]), ylim = range(co[, 2]), vertex.label.dist = 0,
#'   vertex.label.color = "red"
#' )
#' axis(1)
#' axis(2)
#'
layout_with_fr <- function(graph, coords = NULL, dim = 2,
                           niter = 500, start.temp = sqrt(vcount(graph)),
                           grid = c("auto", "grid", "nogrid"), weights = NULL,
                           minx = NULL, maxx = NULL, miny = NULL, maxy = NULL,
                           minz = NULL, maxz = NULL,
                           coolexp = deprecated(), maxdelta = deprecated(),
                           area = deprecated(), repulserad = deprecated(),
                           maxiter = deprecated()) {
  # Argument checks
  ensure_igraph(graph)
  coords[] <- as.numeric(coords)
  dim <- as.numeric(dim)
  if (dim != 2L && dim != 3L) {
    stop("Dimension must be two or three")
  }
  if (!missing(niter) && !missing(maxiter)) {
    stop("Both `niter' and `maxiter' are given, give only one of them")
  }
  if (!missing(maxiter)) niter <- maxiter
  niter <- as.numeric(niter)
  start.temp <- as.numeric(start.temp)

  grid <- igraph.match.arg(grid)
  grid <- switch(grid,
    "grid" = 0L,
    "nogrid" = 1L,
    "auto" = 2L
  )

  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  if (!is.null(minx)) minx <- as.numeric(minx)
  if (!is.null(maxx)) maxx <- as.numeric(maxx)
  if (!is.null(miny)) miny <- as.numeric(miny)
  if (!is.null(maxy)) maxy <- as.numeric(maxy)
  if (!is.null(minz)) minz <- as.numeric(minz)
  if (!is.null(maxz)) maxz <- as.numeric(maxz)
  if (lifecycle::is_present(coolexp)) {
    lifecycle::deprecate_warn("0.8.0", "layout_with_fr(coolexp = )")
  }
  if (lifecycle::is_present(maxdelta)) {
    lifecycle::deprecate_warn("0.8.0", "layout_with_fr(maxdelta = )")
  }
  if (lifecycle::is_present(area)) {
    lifecycle::deprecate_warn("0.8.0", "layout_with_fr(area = )")
  }
  if (lifecycle::is_present(repulserad)) {
    lifecycle::deprecate_warn("0.8.0", "layout_with_fr(repulserad = )")
  }

  on.exit(.Call(R_igraph_finalizer))
  if (dim == 2) {
    res <- .Call(
      R_igraph_layout_fruchterman_reingold, graph, coords,
      niter, start.temp, weights, minx, maxx, miny, maxy, grid
    )
  } else {
    res <- .Call(
      R_igraph_layout_fruchterman_reingold_3d, graph, coords,
      niter, start.temp, weights, minx, maxx, miny, maxy,
      minz, maxz
    )
  }
  res
}


#' @rdname layout_with_fr
#' @param ... Passed to `layout_with_fr()`.
#' @export
with_fr <- function(...) layout_spec(layout_with_fr, ...)

#' The Fruchterman-Reingold layout algorithm
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `layout.fruchterman.reingold()` was renamed to `layout_with_fr()` to create a more
#' consistent API.
#' @param ... Passed to the new layout functions.
#' @param params Passed to the new layout functions as arguments.
#' @keywords internal
#' @export
layout.fruchterman.reingold <- function(..., params = list()) {
  lifecycle::deprecate_soft("2.0.4", "layout.fruchterman.reingold()", "layout_with_fr()")
  do_call(layout_with_fr, .args = c(list(...), params))
}

## ----------------------------------------------------------------


#' The GEM layout algorithm
#'
#' Place vertices on the plane using the GEM force-directed layout algorithm.
#'
#' See the referenced paper below for the details of the algorithm.
#'
#' @param graph The input graph. Edge directions are ignored.
#' @param coords If not `NULL`, then the starting coordinates should be
#'   given here, in a two or three column matrix, depending on the `dim`
#'   argument.
#' @param maxiter The maximum number of iterations to perform. Updating a
#'   single vertex counts as an iteration.  A reasonable default is 40 * n * n,
#'   where n is the number of vertices. The original paper suggests 4 * n * n,
#'   but this usually only works if the other parameters are set up carefully.
#' @param temp.max The maximum allowed local temperature. A reasonable default
#'   is the number of vertices.
#' @param temp.min The global temperature at which the algorithm terminates
#'   (even before reaching `maxiter` iterations). A reasonable default is
#'   1/10.
#' @param temp.init Initial local temperature of all vertices. A reasonable
#'   default is the square root of the number of vertices.
#' @return A numeric matrix with two columns, and as many rows as the number of
#'   vertices.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [layout_with_fr()],
#' [plot.igraph()], [tkplot()]
#' @references Arne Frick, Andreas Ludwig, Heiko Mehldau: A Fast Adaptive
#' Layout Algorithm for Undirected Graphs, *Proc. Graph Drawing 1994*,
#' LNCS 894, pp. 388-403, 1995.
#' @export
#' @family graph layouts
#' @keywords graphs
#' @examples
#'
#' set.seed(42)
#' g <- make_ring(10)
#' plot(g, layout = layout_with_gem)
#'
layout_with_gem <- function(graph, coords = NULL, maxiter = 40 * vcount(graph)^2,
                            temp.max = max(vcount(graph), 1), temp.min = 1 / 10,
                            temp.init = sqrt(max(vcount(graph), 1))) {
  # Argument checks
  ensure_igraph(graph)
  if (!is.null(coords)) {
    coords[] <- as.numeric(coords)
    use.seed <- TRUE
  } else {
    coords <- matrix(NA_real_, ncol = 2, nrow = 0)
    use.seed <- FALSE
  }

  maxiter <- as.numeric(maxiter)
  temp.max <- as.numeric(temp.max)
  temp.min <- as.numeric(temp.min)
  temp.init <- as.numeric(temp.init)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(
    R_igraph_layout_gem, graph, coords, use.seed, maxiter,
    temp.max, temp.min, temp.init
  )

  res
}


#' @rdname layout_with_gem
#' @param ... Passed to `layout_with_gem()`.
#' @export
with_gem <- function(...) layout_spec(layout_with_gem, ...)


## ----------------------------------------------------------------


#' The graphopt layout algorithm
#'
#' A force-directed layout algorithm, that scales relatively well to large
#' graphs.
#'
#' `layout_with_graphopt()` is a port of the graphopt layout algorithm by Michael
#' Schmuhl. graphopt version 0.4.1 was rewritten in C and the support for
#' layers was removed (might be added later) and a code was a bit reorganized
#' to avoid some unnecessary steps is the node charge (see below) is zero.
#'
#' graphopt uses physical analogies for defining attracting and repelling
#' forces among the vertices and then the physical system is simulated until it
#' reaches an equilibrium. (There is no simulated annealing or anything like
#' that, so a stable fixed point is not guaranteed.)
#'
#' @param graph The input graph.
#' @param start If given, then it should be a matrix with two columns and one
#'   line for each vertex. This matrix will be used as starting positions for the
#'   algorithm. If not given, then a random starting matrix is used.
#' @param niter Integer scalar, the number of iterations to perform.  Should be
#'   a couple of hundred in general. If you have a large graph then you might
#'   want to only do a few iterations and then check the result. If it is not
#'   good enough you can feed it in again in the `start` argument. The
#'   default value is 500.
#' @param charge The charge of the vertices, used to calculate electric
#'   repulsion. The default is 0.001.
#' @param mass The mass of the vertices, used for the spring forces. The
#'   default is 30.
#' @param spring.length The length of the springs, an integer number. The
#'   default value is zero.
#' @param spring.constant The spring constant, the default value is one.
#' @param max.sa.movement Real constant, it gives the maximum amount of
#'   movement allowed in a single step along a single axis. The default value is
#'   5.
#' @return A numeric matrix with two columns, and a row for each vertex.
#' @author Michael Schmuhl for the original graphopt code, rewritten and
#' wrapped by Gabor Csardi \email{csardi.gabor@@gmail.com}.
#' @keywords graphs
#' @export
#' @family graph layouts
layout_with_graphopt <- function(graph, start = NULL, niter = 500, charge = 0.001,
                                 mass = 30, spring.length = 0, spring.constant = 1,
                                 max.sa.movement = 5) {
  ensure_igraph(graph)
  start[] <- as.numeric(start)
  niter <- as.double(niter)
  charge <- as.double(charge)
  mass <- as.double(mass)
  spring.length <- as.double(spring.length)
  spring.constant <- as.double(spring.constant)
  max.sa.movement <- as.double(max.sa.movement)

  on.exit(.Call(R_igraph_finalizer))
  .Call(
    R_igraph_layout_graphopt, graph, niter, charge, mass,
    spring.length, spring.constant, max.sa.movement, start
  )
}


#' @rdname layout_with_graphopt
#' @param ... Passed to `layout_with_graphopt()`.
#' @export
with_graphopt <- function(...) layout_spec(layout_with_graphopt, ...)


## ----------------------------------------------------------------


#' The Kamada-Kawai layout algorithm
#'
#' Place the vertices on the plane, or in 3D space, based on a physical
#' model of springs.
#'
#' See the referenced paper below for the details of the algorithm.
#'
#' This function was rewritten from scratch in igraph version 0.8.0 and it
#' follows truthfully the original publication by Kamada and Kawai now.
#'
#' @param graph The input graph. Edge directions are ignored.
#' @param coords If not `NULL`, then the starting coordinates should be
#'   given here, in a two or three column matrix, depending on the `dim`
#'   argument.
#' @param dim Integer scalar, 2 or 3, the dimension of the layout.  Two
#'   dimensional layouts are places on a plane, three dimensional ones in the 3d
#'   space.
#' @param maxiter The maximum number of iterations to perform. The algorithm
#'   might terminate earlier, see the `epsilon` argument.
#' @param epsilon Numeric scalar, the algorithm terminates, if the maximal
#'   delta is less than this. (See the reference below for what delta means.) If
#'   you set this to zero, then the function always performs `maxiter`
#'   iterations.
#' @param kkconst Numeric scalar, the Kamada-Kawai vertex attraction constant.
#'   Typical (and default) value is the number of vertices.
#' @param weights Edge weights, larger values will result longer edges.
#'   Note that this is opposite to [layout_with_fr()]. Weights must
#'   be positive.
#' @param minx If not `NULL`, then it must be a numeric vector that gives
#'   lower boundaries for the \sQuote{x} coordinates of the vertices. The length
#'   of the vector must match the number of vertices in the graph.
#' @param maxx Similar to `minx`, but gives the upper boundaries.
#' @param miny Similar to `minx`, but gives the lower boundaries of the
#'   \sQuote{y} coordinates.
#' @param maxy Similar to `minx`, but gives the upper boundaries of the
#'   \sQuote{y} coordinates.
#' @param minz Similar to `minx`, but gives the lower boundaries of the
#'   \sQuote{z} coordinates.
#' @param maxz Similar to `minx`, but gives the upper boundaries of the
#'   \sQuote{z} coordinates.
#' @param niter,sigma,initemp,coolexp `r lifecycle::badge("deprecated")` These
#' arguments are not supported from igraph version 0.8.0 and are ignored (with a warning).
#' @param start Deprecated synonym for `coords`, for compatibility.
#' @return A numeric matrix with two (dim=2) or three (dim=3) columns, and as
#'   many rows as the number of vertices, the x, y and potentially z coordinates
#'   of the vertices.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [layout_with_drl()], [plot.igraph()],
#' [tkplot()]
#' @references Kamada, T. and Kawai, S.: An Algorithm for Drawing General
#' Undirected Graphs. *Information Processing Letters*, 31/1, 7--15, 1989.
#' @export
#' @family graph layouts
#' @keywords graphs
#' @examples
#'
#' g <- make_ring(10)
#' E(g)$weight <- rep(1:2, length.out = ecount(g))
#' plot(g, layout = layout_with_kk, edge.label = E(g)$weight)
#'
layout_with_kk <- function(graph, coords = NULL, dim = 2,
                           maxiter = 50 * vcount(graph),
                           epsilon = 0.0, kkconst = max(vcount(graph), 1),
                           weights = NULL, minx = NULL, maxx = NULL,
                           miny = NULL, maxy = NULL, minz = NULL, maxz = NULL,
                           niter = deprecated(),
                           sigma = deprecated(),
                           initemp = deprecated(),
                           coolexp = deprecated(),
                           start = deprecated()) {
  # Argument checks
  if (!missing(coords) && !missing(start)) {
    stop("Both `coords' and `start' are given, give only one of them.")
  }
  if (!missing(start)) coords <- start

  ensure_igraph(graph)
  coords[] <- as.numeric(coords)
  dim <- as.numeric(dim)
  if (dim != 2L && dim != 3L) {
    stop("Dimension must be two or three")
  }

  maxiter <- as.numeric(maxiter)
  epsilon <- as.numeric(epsilon)
  kkconst <- as.numeric(kkconst)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  if (!is.null(minx)) minx <- as.numeric(minx)
  if (!is.null(maxx)) maxx <- as.numeric(maxx)
  if (!is.null(miny)) miny <- as.numeric(miny)
  if (!is.null(maxy)) maxy <- as.numeric(maxy)
  if (!is.null(minz)) minz <- as.numeric(minz)
  if (!is.null(maxz)) maxz <- as.numeric(maxz)

  if (lifecycle::is_present(niter)) {
    lifecycle::deprecate_warn("0.8.0", "layout_with_kk(niter = )")
  }
  if (lifecycle::is_present(sigma)) {
    lifecycle::deprecate_warn("0.8.0", "layout_with_kk(sigma = )")
  }
  if (lifecycle::is_present(initemp)) {
    lifecycle::deprecate_warn("0.8.0", "layout_with_kk(initemp = )")
  }
  if (lifecycle::is_present(coolexp)) {
    lifecycle::deprecate_warn("0.8.0", "layout_with_kk(coolexp = )")
  }

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  if (dim == 2) {
    res <- .Call(
      R_igraph_layout_kamada_kawai, graph, coords, maxiter,
      epsilon, kkconst, weights, minx, maxx, miny, maxy
    )
  } else {
    res <- .Call(
      R_igraph_layout_kamada_kawai_3d, graph, coords, maxiter,
      epsilon, kkconst, weights, minx, maxx, miny, maxy, minz,
      maxz
    )
  }

  res
}


#' @rdname layout_with_kk
#' @param ... Passed to `layout_with_kk()`.
#' @export
#'
with_kk <- function(...) layout_spec(layout_with_kk, ...)

#' The Kamada-Kawai layout algorithm
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `layout.kamada.kawai()` was renamed to `layout_with_kk()` to create a more
#' consistent API.
#' @param ... Passed to the new layout functions.
#' @param params Passed to the new layout functions as arguments.
#' @keywords internal
#' @export
layout.kamada.kawai <- function(..., params = list()) {
  lifecycle::deprecate_soft("2.0.4", "layout.kamada.kawai()", "layout_with_kk()")
  do_call(layout_with_kk, .args = c(list(...), params))
}

## ----------------------------------------------------------------


#' Large Graph Layout
#'
#' A layout generator for larger graphs.
#'
#' `layout_with_lgl()` is for large connected graphs, it is similar to the layout
#' generator of the Large Graph Layout software
#' (<https://lgl.sourceforge.net/>).
#'
#' @param graph The input graph
#' @param maxiter The maximum number of iterations to perform (150).
#' @param maxdelta The maximum change for a vertex during an iteration (the
#'   number of vertices).
#' @param area The area of the surface on which the vertices are placed (square
#'   of the number of vertices).
#' @param coolexp The cooling exponent of the simulated annealing (1.5).
#' @param repulserad Cancellation radius for the repulsion (the `area`
#'   times the number of vertices).
#' @param cellsize The size of the cells for the grid. When calculating the
#'   repulsion forces between vertices only vertices in the same or neighboring
#'   grid cells are taken into account (the fourth root of the number of
#'   `area`.
#' @param root The id of the vertex to place at the middle of the layout. The
#'   default value is -1 which means that a random vertex is selected.
#' @return A numeric matrix with two columns and as many rows as vertices.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @keywords graphs
#' @export
#' @family graph layouts
layout_with_lgl <- function(graph, maxiter = 150, maxdelta = vcount(graph),
                            area = vcount(graph)^2, coolexp = 1.5,
                            repulserad = area * vcount(graph),
                            cellsize = sqrt(sqrt(area)), root = NULL) {
  ensure_igraph(graph)
  if (is.null(root)) {
    root <- -1
  } else {
    root <- as_igraph_vs(graph, root) - 1
  }

  on.exit(.Call(R_igraph_finalizer))
  .Call(
    R_igraph_layout_lgl, graph, as.double(maxiter),
    as.double(maxdelta), as.double(area), as.double(coolexp),
    as.double(repulserad), as.double(cellsize), root
  )
}


#' @rdname layout_with_lgl
#' @param ... Passed to `layout_with_lgl()`.
#' @export
with_lgl <- function(...) layout_spec(layout_with_lgl, ...)

#' Large Graph Layout
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `layout.lgl()` was renamed to `layout_with_lgl()` to create a more
#' consistent API.
#' @param ... Passed to the new layout functions.
#' @param params Passed to the new layout functions as arguments.
#' @keywords internal
#' @export
layout.lgl <- function(..., params = list()) {
  lifecycle::deprecate_soft("2.0.4", "layout.lgl()", "layout_with_lgl()")
  do_call(layout_with_lgl, .args = c(list(...), params))
}

## ----------------------------------------------------------------



#' Graph layout by multidimensional scaling
#'
#' Multidimensional scaling of some distance matrix defined on the vertices of
#' a graph.
#'
#' `layout_with_mds()` uses classical multidimensional scaling (Torgerson scaling)
#' for generating the coordinates. Multidimensional scaling aims to place points
#' from a higher dimensional space in a (typically) 2 dimensional plane, so that
#' the distances between the points are kept as much as this is possible.
#'
#' By default igraph uses the shortest path matrix as the distances between the
#' nodes, but the user can override this via the `dist` argument.
#'
#' Warning: If the graph is symmetric to the exchange of two vertices (as is the
#' case with leaves of a tree connecting to the same parent), classical
#' multidimensional scaling may assign the same coordinates to these vertices.
#'
#' This function generates the layout separately for each graph component and
#' then merges them via [merge_coords()].
#'
#' @param graph The input graph.
#' @param dist The distance matrix for the multidimensional scaling.  If
#'   `NULL` (the default), then the unweighted shortest path matrix is used.
#' @param dim `layout_with_mds()` supports dimensions up to the number of nodes
#'   minus one, but only if the graph is connected; for unconnected graphs, the
#'   only possible value is 2. This is because `merge_coords()` only works in
#'   2D.
#' @param options This is currently ignored, as ARPACK is not used any more for
#'   solving the eigenproblem
#' @return A numeric matrix with `dim` columns.
#' @author Tamas Nepusz \email{ntamas@@gmail.com} and Gabor Csardi
#' \email{csardi.gabor@@gmail.com}
#' @seealso [layout()], [plot.igraph()]
#' @references Cox, T. F. and Cox, M. A. A. (2001) *Multidimensional
#' Scaling*.  Second edition. Chapman and Hall.
#' @export
#' @family graph layouts
#' @keywords graphs
#' @examples
#'
#' g <- sample_gnp(100, 2 / 100)
#' l <- layout_with_mds(g)
#' plot(g, layout = l, vertex.label = NA, vertex.size = 3)
layout_with_mds <- function(graph, dist = NULL, dim = 2,
                            options = arpack_defaults()) {

  if (is.function(options)) {
    lifecycle::deprecate_soft(
      "1.6.0",
      "layout_with_mds(options = 'must be a list')",
      details = c("`arpack_defaults()` is now a function, use `options = arpack_defaults()` instead of `options = arpack_defaults`.")
    )
    options <- options()
  }

  # Argument checks
  ensure_igraph(graph)
  dist[] <- as.numeric(dist)
  dim <- as.numeric(dim)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_layout_mds, graph, dist, dim)

  res
}


#' @rdname layout_with_mds
#' @param ... Passed to `layout_with_mds()`.
#' @export
with_mds <- function(...) layout_spec(layout_with_mds, ...)


## ----------------------------------------------------------------


#' The Sugiyama graph layout generator
#'
#' Sugiyama layout algorithm for layered directed acyclic graphs. The algorithm
#' minimized edge crossings.
#'
#' This layout algorithm is designed for directed acyclic graphs where each
#' vertex is assigned to a layer. Layers are indexed from zero, and vertices of
#' the same layer will be placed on the same horizontal line. The X coordinates
#' of vertices within each layer are decided by the heuristic proposed by
#' Sugiyama et al. to minimize edge crossings.
#'
#' You can also try to lay out undirected graphs, graphs containing cycles, or
#' graphs without an a priori layered assignment with this algorithm. igraph
#' will try to eliminate cycles and assign vertices to layers, but there is no
#' guarantee on the quality of the layout in such cases.
#'
#' The Sugiyama layout may introduce \dQuote{bends} on the edges in order to
#' obtain a visually more pleasing layout. This is achieved by adding dummy
#' nodes to edges spanning more than one layer. The resulting layout assigns
#' coordinates not only to the nodes of the original graph but also to the
#' dummy nodes. The layout algorithm will also return the extended graph with
#' the dummy nodes.
#'
#' For more details, see the reference below.
#'
#' @param graph The input graph.
#' @param layers A numeric vector or `NULL`. If not `NULL`, then it
#'   should specify the layer index of the vertices. Layers are numbered from
#'   one. If `NULL`, then igraph calculates the layers automatically.
#' @param hgap Real scalar, the minimum horizontal gap between vertices in the
#'   same layer.
#' @param vgap Real scalar, the distance between layers.
#' @param maxiter Integer scalar, the maximum number of iterations in the
#'   crossing minimization stage. 100 is a reasonable default; if you feel that
#'   you have too many edge crossings, increase this.
#' @param weights Optional edge weight vector. If `NULL`, then the
#'   'weight' edge attribute is used, if there is one. Supply `NA` here and
#'   igraph ignores the edge weights. These are used only if the graph
#'   contains cycles; igraph will tend to reverse edges with smaller weights
#'   when breaking the cycles.
#' @param attributes Which graph/vertex/edge attributes to keep in the extended
#'   graph. \sQuote{default} keeps the \sQuote{size}, \sQuote{size2},
#'   \sQuote{shape}, \sQuote{label} and \sQuote{color} vertex attributes and the
#'   \sQuote{arrow.mode} and \sQuote{arrow.size} edge attributes. \sQuote{all}
#'   keep all graph, vertex and edge attributes, \sQuote{none} keeps none of
#'   them.
#' @return A list with the components: \item{layout}{The layout, a two-column
#'   matrix, for the original graph vertices.} \item{layout.dummy}{The layout for
#'   the dummy vertices, a two column matrix.} \item{extd_graph}{The original
#'   graph, extended with dummy vertices.  The \sQuote{dummy} vertex attribute is
#'   set on this graph, it is a logical attributes, and it tells you whether the
#'   vertex is a dummy vertex. The \sQuote{layout} graph attribute is also set,
#'   and it is the layout matrix for all (original and dummy) vertices.}
#' @author Tamas Nepusz \email{ntamas@@gmail.com}
#' @references K. Sugiyama, S. Tagawa and M. Toda, "Methods for Visual
#' Understanding of Hierarchical Systems". IEEE Transactions on Systems, Man
#' and Cybernetics 11(2):109-125, 1981.
#' @export
#' @importFrom utils head
#' @family graph layouts
#' @keywords graphs
#' @examples
#'
#' ## Data taken from http://tehnick-8.narod.ru/dc_clients/
#' DC <- graph_from_literal(
#'   "DC++" -+ "LinuxDC++":"BCDC++":"EiskaltDC++":"StrongDC++":"DiCe!++",
#'   "LinuxDC++" -+ "FreeDC++", "BCDC++" -+ "StrongDC++",
#'   "FreeDC++" -+ "BMDC++":"EiskaltDC++",
#'   "StrongDC++" -+ "AirDC++":"zK++":"ApexDC++":"TkDC++",
#'   "StrongDC++" -+ "StrongDC++ SQLite":"RSX++",
#'   "ApexDC++" -+ "FlylinkDC++ ver <= 4xx",
#'   "ApexDC++" -+ "ApexDC++ Speed-Mod":"DiCe!++",
#'   "StrongDC++ SQLite" -+ "FlylinkDC++ ver >= 5xx",
#'   "ApexDC++ Speed-Mod" -+ "FlylinkDC++ ver <= 4xx",
#'   "ApexDC++ Speed-Mod" -+ "GreylinkDC++",
#'   "FlylinkDC++ ver <= 4xx" -+ "FlylinkDC++ ver >= 5xx",
#'   "FlylinkDC++ ver <= 4xx" -+ AvaLink,
#'   "GreylinkDC++" -+ AvaLink:"RayLinkDC++":"SparkDC++":PeLink
#' )
#'
#' ## Use edge types
#' E(DC)$lty <- 1
#' E(DC)["BCDC++" %->% "StrongDC++"]$lty <- 2
#' E(DC)["FreeDC++" %->% "EiskaltDC++"]$lty <- 2
#' E(DC)["ApexDC++" %->% "FlylinkDC++ ver <= 4xx"]$lty <- 2
#' E(DC)["ApexDC++" %->% "DiCe!++"]$lty <- 2
#' E(DC)["StrongDC++ SQLite" %->% "FlylinkDC++ ver >= 5xx"]$lty <- 2
#' E(DC)["GreylinkDC++" %->% "AvaLink"]$lty <- 2
#'
#' ## Layers, as on the plot
#' layers <- list(
#'   c("DC++"),
#'   c("LinuxDC++", "BCDC++"),
#'   c("FreeDC++", "StrongDC++"),
#'   c(
#'     "BMDC++", "EiskaltDC++", "AirDC++", "zK++", "ApexDC++",
#'     "TkDC++", "RSX++"
#'   ),
#'   c("StrongDC++ SQLite", "ApexDC++ Speed-Mod", "DiCe!++"),
#'   c("FlylinkDC++ ver <= 4xx", "GreylinkDC++"),
#'   c(
#'     "FlylinkDC++ ver >= 5xx", "AvaLink", "RayLinkDC++",
#'     "SparkDC++", "PeLink"
#'   )
#' )
#'
#' ## Check that we have all nodes
#' all(sort(unlist(layers)) == sort(V(DC)$name))
#'
#' ## Add some graphical parameters
#' V(DC)$color <- "white"
#' V(DC)$shape <- "rectangle"
#' V(DC)$size <- 20
#' V(DC)$size2 <- 10
#' V(DC)$label <- lapply(V(DC)$name, function(x) {
#'   paste(strwrap(x, 12), collapse = "\n")
#' })
#' E(DC)$arrow.size <- 0.5
#'
#' ## Create a similar layout using the predefined layers
#' lay1 <- layout_with_sugiyama(DC, layers = apply(sapply(
#'   layers,
#'   function(x) V(DC)$name %in% x
#' ), 1, which))
#'
#' ## Simple plot, not very nice
#' par(mar = rep(.1, 4))
#' plot(DC, layout = lay1$layout, vertex.label.cex = 0.5)
#'
#' ## Sugiyama plot
#' plot(lay1$extd_graph, vertex.label.cex = 0.5)
#'
#' ## The same with automatic layer calculation
#' ## Keep vertex/edge attributes in the extended graph
#' lay2 <- layout_with_sugiyama(DC, attributes = "all")
#' plot(lay2$extd_graph, vertex.label.cex = 0.5)
#'
#' ## Another example, from the following paper:
#' ## Markus Eiglsperger, Martin Siebenhaller, Michael Kaufmann:
#' ## An Efficient Implementation of Sugiyama's Algorithm for
#' ## Layered Graph Drawing, Journal of Graph Algorithms and
#' ## Applications 9, 305--325 (2005).
#'
#' ex <- graph_from_literal(
#'   0 -+ 29:6:5:20:4,
#'   1 -+ 12,
#'   2 -+ 23:8,
#'   3 -+ 4,
#'   4,
#'   5 -+ 2:10:14:26:4:3,
#'   6 -+ 9:29:25:21:13,
#'   7,
#'   8 -+ 20:16,
#'   9 -+ 28:4,
#'   10 -+ 27,
#'   11 -+ 9:16,
#'   12 -+ 9:19,
#'   13 -+ 20,
#'   14 -+ 10,
#'   15 -+ 16:27,
#'   16 -+ 27,
#'   17 -+ 3,
#'   18 -+ 13,
#'   19 -+ 9,
#'   20 -+ 4,
#'   21 -+ 22,
#'   22 -+ 8:9,
#'   23 -+ 9:24,
#'   24 -+ 12:15:28,
#'   25 -+ 11,
#'   26 -+ 18,
#'   27 -+ 13:19,
#'   28 -+ 7,
#'   29 -+ 25
#' )
#'
#' layers <- list(
#'   0, c(5, 17), c(2, 14, 26, 3), c(23, 10, 18), c(1, 24),
#'   12, 6, c(29, 21), c(25, 22), c(11, 8, 15), 16, 27, c(13, 19),
#'   c(9, 20), c(4, 28), 7
#' )
#'
#' layex <- layout_with_sugiyama(ex, layers = apply(
#'   sapply(
#'     layers,
#'     function(x) V(ex)$name %in% as.character(x)
#'   ),
#'   1, which
#' ))
#'
#' origvert <- c(rep(TRUE, vcount(ex)), rep(FALSE, nrow(layex$layout.dummy)))
#' realedge <- as_edgelist(layex$extd_graph)[, 2] <= vcount(ex)
#' plot(layex$extd_graph,
#'   vertex.label.cex = 0.5,
#'   edge.arrow.size = .5,
#'   vertex.size = ifelse(origvert, 5, 0),
#'   vertex.shape = ifelse(origvert, "square", "none"),
#'   vertex.label = ifelse(origvert, V(ex)$name, ""),
#'   edge.arrow.mode = ifelse(realedge, 2, 0)
#' )
#'
layout_with_sugiyama <- function(graph, layers = NULL, hgap = 1, vgap = 1,
                                 maxiter = 100, weights = NULL,
                                 attributes = c("default", "all", "none")) {
  # Argument checks
  ensure_igraph(graph)
  if (!is.null(layers)) layers <- as.numeric(layers) - 1
  hgap <- as.numeric(hgap)
  vgap <- as.numeric(vgap)
  maxiter <- as.numeric(maxiter)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  attributes <- igraph.match.arg(attributes)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(
    R_igraph_layout_sugiyama, graph, layers, hgap,
    vgap, maxiter, weights
  )

  # Flip the y coordinates, more natural this way
  vc <- vcount(graph)
  if (vc > 0) {
    res$res[, 2] <- max(res$res[, 2]) - res$res[, 2] + 1
  }

  # Separate real and dummy vertices
  if (nrow(res$res) == vc) {
    res$layout <- res$res
    res$layout.dummy <- matrix(NA_real_, nrow = 0, ncol = 2)
  } else {
    res$layout <- res$res[seq_len(vc), ]
    res$layout.dummy <- res$res[(vc + 1):nrow(res$res), , drop = FALSE]
  }

  # Add some attributes to the extended graph
  E(res$extd_graph)$orig <- res$extd_to_orig_eids
  res$extd_to_orig_eids <- NULL

  res$extd_graph <- set_vertex_attr(res$extd_graph, "dummy",
    value = c(
      rep(FALSE, vc),
      rep(TRUE, nrow(res$res) - vc)
    )
  )

  res$extd_graph$layout <- rbind(res$layout, res$layout.dummy)

  if (attributes == "default" || attributes == "all") {
    if ("size" %in% vertex_attr_names(graph)) {
      V(res$extd_graph)$size <- 0
      V(res$extd_graph)$size[!V(res$extd_graph)$dummy] <- V(graph)$size
    }
    if ("size2" %in% vertex_attr_names(graph)) {
      V(res$extd_graph)$size2 <- 0
      V(res$extd_graph)$size2[!V(res$extd_graph)$dummy] <- V(graph)$size2
    }
    if ("shape" %in% vertex_attr_names(graph)) {
      V(res$extd_graph)$shape <- "none"
      V(res$extd_graph)$shape[!V(res$extd_graph)$dummy] <- V(graph)$shape
    }
    if ("label" %in% vertex_attr_names(graph)) {
      V(res$extd_graph)$label <- ""
      V(res$extd_graph)$label[!V(res$extd_graph)$dummy] <- V(graph)$label
    }
    if ("color" %in% vertex_attr_names(graph)) {
      V(res$extd_graph)$color <- head(V(graph)$color, 1)
      V(res$extd_graph)$color[!V(res$extd_graph)$dummy] <- V(graph)$color
    }
    eetar <- as_edgelist(res$extd_graph, names = FALSE)[, 2]
    E(res$extd_graph)$arrow.mode <- 0
    if ("arrow.mode" %in% edge_attr_names(graph)) {
      E(res$extd_graph)$arrow.mode[eetar <= vc] <- E(graph)$arrow.mode
    } else {
      E(res$extd_graph)$arrow.mode[eetar <= vc] <- is_directed(graph) * 2
    }
    if ("arrow.size" %in% edge_attr_names(graph)) {
      E(res$extd_graph)$arrow.size <- 0
      E(res$extd_graph)$arrow.size[eetar <= vc] <- E(graph)$arrow.size
    }
  }

  if (attributes == "all") {
    gatt <- setdiff(graph_attr_names(graph), "layout")
    vatt <- setdiff(
      vertex_attr_names(graph),
      c("size", "size2", "shape", "label", "color")
    )
    eatt <- setdiff(
      edge_attr_names(graph),
      c("arrow.mode", "arrow.size")
    )
    for (ga in gatt) {
      res$extd_graph <- set_graph_attr(
        res$extd_graph, ga,
        graph_attr(graph, ga)
      )
    }
    for (va in vatt) {
      notdummy <- which(!V(res$extd_graph)$dummy)
      res$extd_graph <- set_vertex_attr(
        res$extd_graph, va,
        notdummy,
        vertex_attr(graph, va)
      )
    }
    for (ea in eatt) {
      eanew <- edge_attr(graph, ea)[E(res$extd_graph)$orig]
      res$extd_graph <- set_edge_attr(res$extd_graph, ea, value = eanew)
    }
  }

  res$res <- NULL
  res
}


#' @rdname layout_with_sugiyama
#' @param ... Passed to `layout_with_sugiyama()`.
#' @export
with_sugiyama <- function(...) layout_spec(layout_with_sugiyama, ...)


## ----------------------------------------------------------------


#' Merging graph layouts
#'
#' Place several graphs on the same layout
#'
#' `merge_coords()` takes a list of graphs and a list of coordinates and
#' places the graphs in a common layout. The method to use is chosen via the
#' `method` parameter, although right now only the `dla` method is
#' implemented.
#'
#' The `dla` method covers the graph with circles.  Then it sorts the
#' graphs based on the number of vertices first and places the largest graph at
#' the center of the layout. Then the other graphs are placed in decreasing
#' order via a DLA (diffision limited aggregation) algorithm: the graph is
#' placed randomly on a circle far away from the center and a random walk is
#' conducted until the graph walks into the larger graphs already placed or
#' walks too far from the center of the layout.
#'
#' The `layout_components()` function disassembles the graph first into
#' maximal connected components and calls the supplied `layout` function
#' for each component separately. Finally it merges the layouts via calling
#' `merge_coords()`.
#'
#' @param graphs A list of graph objects.
#' @param layouts A list of two-column matrices.
#' @param method Character constant giving the method to use. Right now only
#'   `dla` is implemented.
#' @param layout A function object, the layout function to use.
#' @param \dots Additional arguments to pass to the `layout` layout
#'   function.
#' @return A matrix with two columns and as many lines as the total number of
#'   vertices in the graphs.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [plot.igraph()], [tkplot()],
#' [layout()], [disjoint_union()]
#' @export
#' @family graph layouts
#' @keywords graphs
#' @examples
#'
#' # create 20 scale-free graphs and place them in a common layout
#' graphs <- lapply(sample(5:20, 20, replace = TRUE),
#'   barabasi.game,
#'   directed = FALSE
#' )
#' layouts <- lapply(graphs, layout_with_kk)
#' lay <- merge_coords(graphs, layouts)
#' g <- disjoint_union(graphs)
#' plot(g, layout = lay, vertex.size = 3, labels = NA, edge.color = "black")
merge_coords <- function(graphs, layouts, method = "dla") {
  lapply(graphs, ensure_igraph)
  if (method == "dla") {
    on.exit(.Call(R_igraph_finalizer))
    res <- .Call(
      R_igraph_layout_merge_dla,
      graphs, layouts
    )
  } else {
    stop("Invalid `method'.")
  }
  res
}



#' Normalize coordinates for plotting graphs
#'
#' Rescale coordinates linearly to be within given bounds.
#'
#' `norm_coords()` normalizes a layout, it linearly transforms each
#' coordinate separately to fit into the given limits.
#'
#' @param layout A matrix with two or three columns, the layout to normalize.
#' @param xmin,xmax The limits for the first coordinate, if one of them or both
#'   are `NULL` then no normalization is performed along this direction.
#' @param ymin,ymax The limits for the second coordinate, if one of them or
#'   both are `NULL` then no normalization is performed along this
#'   direction.
#' @param zmin,zmax The limits for the third coordinate, if one of them or both
#'   are `NULL` then no normalization is performed along this direction.
#' @return A numeric matrix with at the same dimension as `layout`.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @export
#' @family graph layouts
#' @keywords graphs
norm_coords <- function(layout, xmin = -1, xmax = 1, ymin = -1, ymax = 1,
                        zmin = -1, zmax = 1) {
  if (!is.matrix(layout)) {
    stop("`layout' must be a matrix")
  }
  if (ncol(layout) != 2 && ncol(layout) != 3) {
    stop("`layout' should have 2 or three columns")
  }

  if (!is.null(xmin) && !is.null(xmax)) {
    layout[, 1] <- .layout.norm.col(layout[, 1], xmin, xmax)
  }

  if (!is.null(ymin) && !is.null(ymax)) {
    layout[, 2] <- .layout.norm.col(layout[, 2], ymin, ymax)
  }

  if (ncol(layout) == 3 && !is.null(zmin) && !is.null(zmax)) {
    layout[, 3] <- .layout.norm.col(layout[, 3], zmin, zmax)
  }

  layout
}

.layout.norm.col <- function(v, min, max) {
  vr <- range(v)
  if (vr[1] == vr[2]) {
    fac <- 1
  } else {
    fac <- (max - min) / (vr[2] - vr[1])
  }

  (v - vr[1]) * fac + min
}

#' @rdname merge_coords
#' @param graph The input graph.
#' @export
layout_components <- function(graph, layout = layout_with_kk, ...) {
  ensure_igraph(graph)

  V(graph)$id <- seq(vcount(graph))
  gl <- decompose(graph)
  ll <- lapply(gl, layout, ...)

  l <- merge_coords(gl, ll)
  l[unlist(sapply(gl, vertex_attr, "id")), ] <- l[]
  l
}

#' Spring layout, this was removed from igraph

#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' Now it calls the Fruchterman-Reingold layout [layout_with_fr()].
#'
#' @param graph Input graph.
#' @param ... Extra arguments are ignored.
#' @return Layout coordinates, a two column matrix.
#'
#' @export
#' @keywords internal
layout.spring <- function(graph, ...) {
  lifecycle::deprecate_warn("2.0.4", "layout.spring()", "layout_with_fr()")
  layout_with_fr(graph)
}

#' SVD layout, this was removed from igraph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' Now it calls the Fruchterman-Reingold layout [`layout_with_fr()`].
#'
#' @param graph Input graph.
#' @param ... Extra arguments are ignored.
#' @return Layout coordinates, a two column matrix.
#'
#' @keywords internal
#' @export
layout.svd <- function(graph, ...) {
  lifecycle::deprecate_warn("2.0.4", "layout.svd()", "layout_with_fr()")
  layout_with_fr(graph)
}

#' Grid Fruchterman-Reingold layout, this was removed from igraph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#'
#' Now it calls the Fruchterman-Reingold layout [`layout_with_fr()`].
#'
#' @param graph Input graph.
#' @param ... Extra arguments are ignored.
#' @return Layout coordinates, a two column matrix.
#'
#' @keywords internal
#' @export
layout.fruchterman.reingold.grid <- function(graph, ...) {
  lifecycle::deprecate_warn(
    "2.0.4",
    "layout.fruchterman.reingold.grid()",
    "layout_with_fr()"
  )
  layout_with_fr(graph)
}
