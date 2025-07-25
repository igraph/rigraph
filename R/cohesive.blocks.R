#' Calculate Cohesive Blocks
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `exportPajek()` was renamed to [export_pajek()] to create a more
#' consistent API.
#' @inheritParams export_pajek
#' @keywords internal
#' @export
exportPajek <- function(blocks, graph, file, project.file = TRUE) {
  # nocov start
  lifecycle::deprecate_soft("2.0.0", "exportPajek()", "export_pajek()")
  export_pajek(
    blocks = blocks,
    graph = graph,
    file = file,
    project.file = project.file
  )
} # nocov end

#' Calculate Cohesive Blocks
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `plotHierarchy()` was renamed to [plot_hierarchy()] to create a more
#' consistent API.
#' @inheritParams plot_hierarchy
#' @keywords internal
#' @export
plotHierarchy <- function(
  blocks,
  layout = layout_as_tree(hierarchy(blocks), root = 1),
  ...
) {
  # nocov start
  lifecycle::deprecate_soft("2.0.0", "plotHierarchy()", "plot_hierarchy()")
  plot_hierarchy(blocks = blocks, layout = layout, ...)
} # nocov end

#' Calculate Cohesive Blocks
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `maxcohesion()` was renamed to [max_cohesion()] to create a more
#' consistent API.
#' @inheritParams max_cohesion
#' @keywords internal
#' @export
maxcohesion <- function(blocks) {
  # nocov start
  lifecycle::deprecate_soft("2.0.0", "maxcohesion()", "max_cohesion()")
  max_cohesion(blocks = blocks)
} # nocov end

#' Vertex connectivity
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.cohesion()` was renamed to [cohesion()] to create a more
#' consistent API.
#' @param x x
#' @param ... passed to `cohesion()`
#' @keywords internal
#' @export
graph.cohesion <- function(x, ...) {
  # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.cohesion()", "cohesion()")
  cohesion(x = x, ...)
} # nocov end

#' Calculate Cohesive Blocks
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `cohesive.blocks()` was renamed to [cohesive_blocks()] to create a more
#' consistent API.
#' @inheritParams cohesive_blocks
#' @keywords internal
#' @export
cohesive.blocks <- function(graph, labels = TRUE) {
  # nocov start
  lifecycle::deprecate_soft("2.0.0", "cohesive.blocks()", "cohesive_blocks()")
  cohesive_blocks(graph = graph, labels = labels)
} # nocov end

#' Calculate Cohesive Blocks
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `blockGraphs()` was renamed to [graphs_from_cohesive_blocks()] to create a more
#' consistent API.
#' @inheritParams graphs_from_cohesive_blocks
#' @keywords internal
#' @export
blockGraphs <- function(blocks, graph) {
  # nocov start
  lifecycle::deprecate_soft(
    "2.0.0",
    "blockGraphs()",
    "graphs_from_cohesive_blocks()"
  )
  graphs_from_cohesive_blocks(blocks = blocks, graph = graph)
} # nocov end
#   IGraph R package
#   Copyright (C) 2010-2012  Gabor Csardi <csardi.gabor@gmail.com>
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

#' Calculate Cohesive Blocks
#'
#' Calculates cohesive blocks for objects of class `igraph`.
#'
#' Cohesive blocking is a method of determining hierarchical subsets of graph
#' vertices based on their structural cohesion (or vertex connectivity). For a
#' given graph \eqn{G}, a subset of its vertices \eqn{S\subset V(G)}{S} is said
#' to be maximally \eqn{k}-cohesive if there is no superset of \eqn{S} with
#' vertex connectivity greater than or equal to \eqn{k}. Cohesive blocking is a
#' process through which, given a \eqn{k}-cohesive set of vertices, maximally
#' \eqn{l}-cohesive subsets are recursively identified with \eqn{l>k}. Thus a
#' hierarchy of vertex subsets is found, with the entire graph \eqn{G} at its
#' root.
#'
#' The function `cohesive_blocks()` implements cohesive blocking.  It
#' returns a `cohesiveBlocks` object. `cohesiveBlocks` should be
#' handled as an opaque class, i.e. its internal structure should not be
#' accessed directly, but through the functions listed here.
#'
#' The function `length` can be used on `cohesiveBlocks` objects and
#' it gives the number of blocks.
#'
#' The function `blocks()` returns the actual blocks stored in the
#' `cohesiveBlocks` object. They are returned in a list of numeric
#' vectors, each containing vertex ids.
#'
#' The function `graphs_from_cohesive_blocks()` is similar, but returns the blocks as
#' (induced) subgraphs of the input graph. The various (graph, vertex and edge)
#' attributes are kept in the subgraph.
#'
#' The function `cohesion()` returns a numeric vector, the cohesion of the
#' different blocks. The order of the blocks is the same as for the
#' `blocks()` and `graphs_from_cohesive_blocks()` functions.
#'
#' The block hierarchy can be queried using the `hierarchy()` function. It
#' returns an igraph graph, its vertex ids are ordered according the order of
#' the blocks in the `blocks()` and `graphs_from_cohesive_blocks()`, `cohesion()`,
#' etc. functions.
#'
#' `parent()` gives the parent vertex of each block, in the block hierarchy,
#' for the root vertex it gives 0.
#'
#' `plot_hierarchy()` plots the hierarchy tree of the cohesive blocks on the
#' active graphics device, by calling `igraph.plot`.
#'
#' The `export_pajek()` function can be used to export the graph and its
#' cohesive blocks in Pajek format. It can either export a single Pajek project
#' file with all the information, or a set of files, depending on its
#' `project.file` argument. If `project.file` is `TRUE`, then
#' the following information is written to the file (or connection) given in
#' the `file` argument: (1) the input graph, together with its attributes,
#' see [write_graph()] for details; (2) the hierarchy graph; and (3)
#' one binary partition for each cohesive block. If `project.file` is
#' `FALSE`, then the `file` argument must be a character scalar and
#' it is used as the base name for the generated files. If `file` is
#' \sQuote{basename}, then the following files are created: (1)
#' \sQuote{basename.net} for the original graph; (2)
#' \sQuote{basename_hierarchy.net} for the hierarchy graph; (3)
#' \sQuote{basename_block_x.net} for each cohesive block, where \sQuote{x} is
#' the number of the block, starting with one.
#'
#' `max_cohesion()` returns the maximal cohesion of each vertex, i.e. the
#' cohesion of the most cohesive block of the vertex.
#'
#' The generic function [summary()] works on `cohesiveBlocks` objects
#' and it prints a one line summary to the terminal.
#'
#' The generic function [print()] is also defined on `cohesiveBlocks`
#' objects and it is invoked automatically if the name of the
#' `cohesiveBlocks` object is typed in. It produces an output like this:
#' \preformatted{ Cohesive block structure:
#' B-1 c 1, n 23
#' '- B-2 c 2, n 14 oooooooo.. .o......oo ooo
#' '- B-4 c 5, n  7 ooooooo... .......... ...
#' '- B-3 c 2, n 10 ......o.oo o.oooooo.. ...
#' '- B-5 c 3, n  4 ......o.oo o......... ...  }
#' The left part shows the block structure, in this case for five
#' blocks. The first block always corresponds to the whole graph, even if its
#' cohesion is zero. Then cohesion of the block and the number of vertices in
#' the block are shown. The last part is only printed if the display is wide
#' enough and shows the vertices in the blocks, ordered by vertex ids.
#' \sQuote{o} means that the vertex is included, a dot means that it is not,
#' and the vertices are shown in groups of ten.
#'
#' The generic function [plot()] plots the graph, showing one or more
#' cohesive blocks in it.
#'
#' @aliases cohesiveBlocks blocks
#' @aliases hierarchy parent export_pajek plot.cohesiveBlocks
#' summary.cohesiveBlocks length.cohesiveBlocks print.cohesiveBlocks
#' @param graph For `cohesive_blocks()` a graph object of class
#'   `igraph`. It must be undirected and simple. (See
#'   [is_simple()].)
#'
#'   For `graphs_from_cohesive_blocks()` and `export_pajek()` the same graph must be
#'   supplied whose cohesive block structure is given in the `blocks()`
#'   argument.
#' @param labels Logical scalar, whether to add the vertex labels to the result
#'   object. These labels can be then used when reporting and plotting the
#'   cohesive blocks.
#' @param blocks,x,object A `cohesiveBlocks` object, created with the
#'   `cohesive_blocks()` function.
#' @param file Defines the file (or connection) the Pajek file is written to.
#'
#'   If the `project.file` argument is `TRUE`, then it can be a
#'   filename (with extension), a file object, or in general any king of
#'   connection object. The file/connection will be opened if it wasn't already.
#'
#'   If the `project.file` argument is `FALSE`, then several files are
#'   created and `file` must be a character scalar containing the base name
#'   of the files, without extension. (But it can contain the path to the files.)
#'
#'   See also details below.
#' @param project.file Logical scalar, whether to create a single Pajek project
#'   file containing all the data, or to create separated files for each item.
#'   See details below.
#' @param y The graph whose cohesive blocks are supplied in the `x`
#'   argument.
#' @param colbar Color bar for the vertex colors. Its length should be at least
#'   \eqn{m+1}, where \eqn{m} is the maximum cohesion in the graph.
#'   Alternatively, the vertex colors can also be directly specified via the
#'   `col` argument.
#' @param col A vector of vertex colors, in any of the usual formats. (Symbolic
#'   color names (e.g. \sQuote{red}, \sQuote{blue}, etc.) , RGB colors (e.g.
#'   \sQuote{#FF9900FF}), integer numbers referring to the current palette. By
#'   default the given `colbar` is used and vertices with the same maximal
#'   cohesion will have the same color.
#' @param mark.groups A list of vertex sets to mark on the plot by circling
#'   them. By default all cohesive blocks are marked, except the one
#'   corresponding to the all vertices.
#' @param layout The layout of a plot, it is simply passed on to
#'   `plot.igraph()`, see the possible formats there. By default the
#'   Reingold-Tilford layout generator is used.
#' @param \dots Additional arguments. `plot_hierarchy()` and [plot()] pass
#'   them to `plot.igraph()`.  [print()] and [summary()] ignore them.
#' @return `cohesive_blocks()` returns a `cohesiveBlocks` object.
#'
#'   `blocks()` returns a list of numeric vectors, containing vertex ids.
#'
#'   `graphs_from_cohesive_blocks()` returns a list of igraph graphs, corresponding to the
#'   cohesive blocks.
#'
#'   `cohesion()` returns a numeric vector, the cohesion of each block.
#'
#'   `hierarchy()` returns an igraph graph, the representation of the cohesive
#'   block hierarchy.
#'
#'   `parent()` returns a numeric vector giving the parent block of each
#'   cohesive block, in the block hierarchy. The block at the root of the
#'   hierarchy has no parent and `0` is returned for it.
#'
#'   `plot_hierarchy()`, [plot()] and `export_pajek()` return `NULL`,
#'   invisibly.
#'
#'   `max_cohesion()` returns a numeric vector with one entry for each vertex,
#'   giving the cohesion of its most cohesive block.
#'
#'   [print()] and [summary()] return the `cohesiveBlocks` object
#'   itself, invisibly.
#'
#'   `length` returns a numeric scalar, the number of blocks.
#' @author Gabor Csardi \email{csardi.gabor@gmail.com} for the current
#' implementation, Peter McMahan (<https://socialsciences.uchicago.edu/news/alumni-profile-peter-mcmahan-phd17-sociology>)
#' wrote the first version in R.
#' @seealso [cohesion()]
#' @references J. Moody and D. R. White. Structural cohesion and embeddedness:
#' A hierarchical concept of social groups. *American Sociological
#' Review*, 68(1):103--127, Feb 2003, \doi{10.2307/3088904}.
#' @family cohesive.blocks
#' @export
#' @keywords graphs
#' @examples
#'
#' ## The graph from the Moody-White paper
#' mw <- graph_from_literal(
#'   1 - 2:3:4:5:6, 2 - 3:4:5:7, 3 - 4:6:7, 4 - 5:6:7,
#'   5 - 6:7:21, 6 - 7, 7 - 8:11:14:19, 8 - 9:11:14, 9 - 10,
#'   10 - 12:13, 11 - 12:14, 12 - 16, 13 - 16, 14 - 15, 15 - 16,
#'   17 - 18:19:20, 18 - 20:21, 19 - 20:22:23, 20 - 21,
#'   21 - 22:23, 22 - 23
#' )
#'
#' mwBlocks <- cohesive_blocks(mw)
#'
#' # Inspect block membership and cohesion
#' mwBlocks
#' blocks(mwBlocks)
#' cohesion(mwBlocks)
#'
#' # Save results in a Pajek file
#' file <- tempfile(fileext = ".paj")
#' export_pajek(mwBlocks, mw, file = file)
#' if (!interactive()) {
#'   unlink(file)
#' }
#'
#' # Plot the results
#' plot(mwBlocks, mw)
#'
#' ## The science camp network
#' camp <- graph_from_literal(
#'   Harry:Steve:Don:Bert - Harry:Steve:Don:Bert,
#'   Pam:Brazey:Carol:Pat - Pam:Brazey:Carol:Pat,
#'   Holly - Carol:Pat:Pam:Jennie:Bill,
#'   Bill - Pauline:Michael:Lee:Holly,
#'   Pauline - Bill:Jennie:Ann,
#'   Jennie - Holly:Michael:Lee:Ann:Pauline,
#'   Michael - Bill:Jennie:Ann:Lee:John,
#'   Ann - Michael:Jennie:Pauline,
#'   Lee - Michael:Bill:Jennie,
#'   Gery - Pat:Steve:Russ:John,
#'   Russ - Steve:Bert:Gery:John,
#'   John - Gery:Russ:Michael
#' )
#' campBlocks <- cohesive_blocks(camp)
#' campBlocks
#'
#' plot(campBlocks, camp,
#'   vertex.label = V(camp)$name, margin = -0.2,
#'   vertex.shape = "rectangle", vertex.size = 24, vertex.size2 = 8,
#'   mark.border = 1, colbar = c(NA, NA, "cyan", "orange")
#' )
#'
cohesive_blocks <- function(graph, labels = TRUE) {
  # Argument checks
  ensure_igraph(graph)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_cohesive_blocks, graph)
  class(res) <- "cohesiveBlocks"
  if (labels && "name" %in% vertex_attr_names(graph)) {
    res$labels <- V(graph)$name
  }
  if (igraph_opt("return.vs.es")) {
    res$blocks <- lapply(
      res$blocks,
      unsafe_create_vs,
      graph = graph,
      verts = V(graph)
    )
  }

  res$vcount <- vcount(graph)
  res
}

#' @rdname cohesive_blocks
#' @method length cohesiveBlocks
#' @family cohesive.blocks
#' @export
length.cohesiveBlocks <- function(x) {
  length(x$blocks)
}

#' @rdname cohesive_blocks
#' @export
blocks <- function(blocks) {
  blocks$blocks
}

#' @rdname cohesive_blocks
#' @export
graphs_from_cohesive_blocks <- function(blocks, graph) {
  lapply(blocks(blocks), induced_subgraph, graph = graph)
}

#' @family cohesive.blocks
#' @export
cohesion <- function(x, ...) {
  UseMethod("cohesion")
}

#' @rdname cohesive_blocks
#' @method cohesion cohesiveBlocks
#' @export
cohesion.cohesiveBlocks <- function(x, ...) {
  x$cohesion
}

#' @rdname cohesive_blocks
#' @export
hierarchy <- function(blocks) {
  blocks$blockTree
}

#' @rdname cohesive_blocks
#' @export
parent <- function(blocks) {
  blocks$parent
}

#' @rdname cohesive_blocks
#' @method print cohesiveBlocks
#' @export
print.cohesiveBlocks <- function(x, ...) {
  cat("Cohesive block structure:\n")
  myb <- blocks(x)
  ch <- cohesion(x)
  pp <- parent(x)
  si <- sapply(myb, length)

  cs <- 3 +
    2 +
    nchar(length(x)) +
    max(distances(hierarchy(x), mode = "out", v = 1)) * 3

  .plot <- function(b, ind = "") {
    if (b != 1) {
      he <- format(paste(sep = "", ind, "'- B-", b), width = cs)
      ind <- paste("  ", ind)
    } else {
      he <- format(paste(sep = "", "B-", b), width = cs)
    }
    cat(
      sep = "",
      he,
      "c ",
      format(ch[b], width = nchar(max(ch)), justify = "right"),
      ", n ",
      format(si[b], width = nchar(x$vcount), justify = "right")
    )

    if (x$vcount <= options("width")$width - 40 && b != 1) {
      o <- rep(".", x$vcount)
      o[myb[[b]]] <- "o"
      oo <- character()
      for (i in 1:floor(x$vcount / 10)) {
        oo <- c(oo, o[((i - 1) * 10 + 1):(i * 10)], " ")
      }
      if (x$vcount %% 10) {
        oo <- c(oo, o[(i * 10 + 1):length(o)])
      }
      cat("  ", paste(oo, collapse = ""), "\n")
    } else {
      cat("\n")
    }

    wc <- which(pp == b)
    sapply(wc, .plot, ind = ind)
  }
  if (length(x) > 0) {
    .plot(1)
  } else {
    cat("No cohesive blocks found.")
  }

  invisible(x)
}

#' @rdname cohesive_blocks
#' @method summary cohesiveBlocks
#' @family cohesive.blocks
#' @export
summary.cohesiveBlocks <- function(object, ...) {
  cat(
    "Structurally cohesive block structure, with",
    length(blocks(object)),
    "blocks.\n"
  )
  invisible(object)
}

#' @rdname cohesive_blocks
#' @method plot cohesiveBlocks
#' @export
#' @importFrom grDevices rainbow
#' @importFrom graphics plot
plot.cohesiveBlocks <- function(
  x,
  y,
  colbar = rainbow(max(cohesion(x)) + 1),
  col = colbar[max_cohesion(x) + 1],
  mark.groups = blocks(x)[-1],
  ...
) {
  plot(y, mark.groups = mark.groups, vertex.color = col, ...)
}

#' @rdname cohesive_blocks
#' @export
#' @importFrom graphics plot
plot_hierarchy <- function(
  blocks,
  layout = layout_as_tree(hierarchy(blocks), root = 1),
  ...
) {
  plot(hierarchy(blocks), layout = layout, ...)
}

exportPajek.cohesiveblocks.pf <- function(blocks, graph, file) {
  closeit <- FALSE
  if (is.character(file)) {
    file <- file(file, open = "w+b")
    closeit <- TRUE
  }
  if (!isOpen(file)) {
    file <- open(file)
    closeit <- TRUE
  }

  ## The original graph
  cat(file = file, sep = "", "*Network cohesive_blocks_input.net\r\n")
  write_graph(graph, file = file, format = "pajek")

  ## The hierarchy graph
  cat(file = file, sep = "", "\r\n*Network hierarchy.net\r\n")
  write_graph(hierarchy(blocks), file = file, format = "pajek")

  ## The blocks
  myb <- blocks(blocks)
  for (b in seq_along(myb)) {
    thisb <- rep(0, vcount(graph))
    thisb[myb[[b]]] <- 1
    cat(
      file = file,
      sep = "",
      "\r\n*Partition block_",
      b,
      ".clu\r\n",
      "*Vertices ",
      vcount(graph),
      "\r\n   "
    )
    cat(thisb, sep = "\r\n   ", file = file)
  }

  if (closeit) {
    close(file)
  }
  invisible(NULL)
}

exportPajek.cohesiveblocks.nopf <- function(blocks, graph, file) {
  ## The original graph
  write_graph(graph, file = paste(sep = "", file, ".net"), format = "pajek")

  ## The hierarchy graph
  write_graph(
    hierarchy(blocks),
    file = paste(sep = "", file, "_hierarchy.net"),
    format = "pajek"
  )

  ## The blocks
  myb <- blocks(blocks)
  for (b in seq_along(myb)) {
    thisb <- rep(0, vcount(graph))
    thisb[myb[[b]]] <- 1
    cat(
      file = paste(sep = "", file, "_block_", b, ".clu"),
      sep = "\r\n",
      paste("*Vertices", vcount(graph)),
      thisb
    )
  }

  invisible(NULL)
}

#' @rdname cohesive_blocks
#' @export
export_pajek <- function(blocks, graph, file, project.file = TRUE) {
  if (!project.file && (!is.character(file) || !nzchar(file))) {
    cli::cli_abort(
      "{.arg file} must be a filename (without extension) when writing
      to separate files, not {.obj_type_friendly {file}}."
    )
  }

  if (project.file) {
    return(exportPajek.cohesiveblocks.pf(blocks, graph, file))
  } else {
    return(exportPajek.cohesiveblocks.nopf(blocks, graph, file))
  }
}

#' @rdname cohesive_blocks
#' @export
max_cohesion <- function(blocks) {
  res <- numeric(blocks$vcount)
  myb <- blocks(blocks)
  coh <- cohesion(blocks)
  oo <- order(coh)
  myb <- myb[oo]
  coh <- coh[oo]
  for (b in seq_along(myb)) {
    res[myb[[b]]] <- coh[b]
  }
  res
}

#########################################################
## Various designs to print the cohesive blocks

## Cohesive block structure:
## B-1          c. 1, n. 34
## '- B-2       c. 2, n. 28    1,2,3,4,8,9,10,13,14,15,16,18,19,20,21,22,
##    |                        23,24,25,26,27,28,29,30,31,32,33,34
##    '- B-4    c. 4, n.  5    1,2,3,4,8
##    '- B-5    c. 3, n.  7    1,2,3,9,31,33,34
##    '- B-7    c. 4, n.  5    1,2,3,4,14
##    '- B-8    c. 3, n. 10    3,24,25,26,28,29,30,32,33,34
## '- B-3       c. 2, n.  6    1,5,6,7,11,17
##    '- B-6    c. 3, n.  5    1,5,6,7,11

## Cohesive block structure:
## B-1          c. 1, n. 23
## '- B-2       c. 2, n. 14    1,2,3,4,5,6,7,8,12,19,20,21,22,23
##    '- B-4    c. 5, n.  7    1,2,3,4,5,6,7
## '- B-3       c. 2, n. 10    7,9,10,11,13,14,15,16,17,18
##    '- B-5    c. 3, n.  4    7,9,10,11

## #########################################################

## Cohesive block structure:
## B-1        c 1, n 34
## '- B-2     c 2, n 28    oooo...ooo ..oooo.ooo oooooooooo oooo
##    '- B-4  c 4, n  5    oooo...o.. .......... .......... ....
##    '- B-5  c 3, n  7    ooo.....o. .......... .......... o.oo
##    '- B-7  c 4, n  5    oooo...... ...o...... .......... ....
##    '- B-8  c 3, n 10    ..o....... .......... ...ooo.ooo .ooo
## '- B-3     c 2, n  6    o...ooo... o.....o... .......... ....
##    '- B-6  c 3, n  5    o...ooo... o......... .......... ....

## Cohesive block structure:
## B-1        c 1, n 23    oooooooooo oooooooooo ooo
## '- B-2     c 2, n 14    oooooooo.. .o......oo ooo
##    '- B-4  c 5, n  7    ooooooo... .......... ...
## '- B-3     c 2, n 10    ......o.oo o.oooooo.. ...
##    '- B-5  c 3, n  4    ......o.oo o......... ...

## #########################################################

## Cohesive block structure:
## B-1          c. 1, n. 34
## '- B-2       c. 2, n. 28     1, 2, 3, 4, 8, 9,10,13,14,15,16,18,19,20,21,
##    |                        22,23,24,25,26,27,28,29,30,31,32,33,34
##    '- B-4    c. 4, n.  5     1, 2, 3, 4, 8
##    '- B-5    c. 3, n.  7     1, 2, 3, 9,31,33,34
##    '- B-7    c. 4, n.  5     1, 2, 3, 4,14
##    '- B-8    c. 3, n. 10     3,24,25,26,28,29,30,32,33,34
## '- B-3       c. 2, n.  6     1, 5, 6, 7,11,17
##    '- B-6    c. 3, n.  5     1, 5, 6, 7,11

## Cohesive block structure:
## B-1          c. 1, n. 23
## '- B-2       c. 2, n. 14     1, 2, 3, 4, 5, 6, 7, 8,12,19,20,21,22,23
##    '- B-4    c. 5, n.  7     1, 2, 3, 4, 5, 6, 7
## '- B-3       c. 2, n. 10     7, 9,10,11,13,14,15,16,17,18
##    '- B-5    c. 3, n.  4     7, 9,10,11

## #########################################################

## Cohesive block structure:
## B-1          c. 1, n. 34
## '- B-2       c. 2, n. 28    1-4, 8-10, 13-16, 18-34
##    '- B-4    c. 4, n.  5    1-4, 8
##    '- B-5    c. 3, n.  7    1-3, 9, 31, 33-34
##    '- B-7    c. 4, n.  5    1-4, 14
##    '- B-8    c. 3, n. 10    3, 24-26, 28-30, 32-34
## '- B-3       c. 2, n.  6    1, 5-7, 11, 17
##    '- B-6    c. 3, n.  5    1, 5-7, 11

## Cohesive block structure:
## B-1          c. 1, n. 23
## '- B-2       c. 2, n. 14    1-8, 12, 19-23
##    '- B-4    c. 5, n.  7    1-7
## '- B-3       c. 2, n. 10    7, 9-11, 13-18
##    '- B-5    c. 3, n.  4    7, 9-11

## ##########################################################

## Cohesive block structure:
## B-1        c. 1, n. 34
## |- B-2     c. 2, n. 28  [ 1] oooo...ooo ..oooo.ooo
## |  |                    [21] oooooooooo oooo
## |  |- B-4  c. 4, n.  5  [ 1] oooo...o.. ..........
## |  |                    [21] .......... ....
## |  |- B-5  c. 3, n.  7  [ 1] ooo.....o. ..........
## |  |                    [21] .......... o.oo
## |  |- B-7  c. 4, n.  5  [ 1] oooo...... ...o......
## |  |                    [21] .......... ....
## |  |- B-8  c. 3, n. 10  [ 1] ..o....... ..........
## |                       [21] ...ooo.ooo .ooo
## '- B-3     c. 2, n.  6  [ 1] o...ooo... o.....o...
##    |                    [21] .......... ....
##    '- B-6  c. 3, n.  5  [ 1] o...ooo... o.........
##                         [21] .......... ....

## Cohesive block structure:
## B-1          c. 1, n. 23  [ 1] oooooooooo oooooooooo
## |                         [21] ooo
## |- B-2       c. 2, n. 14  [ 1] oooooooo.. .o......oo
## |  |                      [21] ooo
## |  '- B-4    c. 5, n.  7  [ 1] ooooooo... ..........
## |                         [21] ...
## '- B-3       c. 2, n. 10  [ 1] ......o.oo o.oooooo..
##    |                      [21] ...
##    '- B-5    c. 3, n.  4  [ 1] ......o.oo o.........
##                           [21] ...
