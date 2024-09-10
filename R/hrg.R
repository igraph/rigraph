
#' Predict edges based on a hierarchical random graph model
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `hrg.predict()` was renamed to `predict_edges()` to create a more
#' consistent API.
#' @inheritParams predict_edges
#' @keywords internal
#' @export
hrg.predict <- function(graph, hrg = NULL, start = FALSE, num.samples = 10000, num.bins = 25) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "hrg.predict()", "predict_edges()")
  predict_edges(graph = graph, hrg = hrg, start = start, num.samples = num.samples, num.bins = num.bins)
} # nocov end

#' Fit a hierarchical random graph model
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `hrg.fit()` was renamed to `fit_hrg()` to create a more
#' consistent API.
#' @inheritParams fit_hrg
#' @keywords internal
#' @export
hrg.fit <- function(graph, hrg = NULL, start = FALSE, steps = 0) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "hrg.fit()", "fit_hrg()")
  fit_hrg(graph = graph, hrg = hrg, start = start, steps = steps)
} # nocov end

#' Sample from a hierarchical random graph model
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `hrg.game()` was renamed to `sample_hrg()` to create a more
#' consistent API.
#' @inheritParams sample_hrg
#' @keywords internal
#' @export
hrg.game <- function(hrg) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "hrg.game()", "sample_hrg()")
  sample_hrg(hrg = hrg)
} # nocov end

#' Create an igraph graph from a hierarchical random graph model
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `hrg.dendrogram()` was renamed to `hrg_tree()` to create a more
#' consistent API.
#' @inheritParams hrg_tree
#' @keywords internal
#' @export
hrg.dendrogram <- function(hrg) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "hrg.dendrogram()", "hrg_tree()")
  hrg_tree(hrg = hrg)
} # nocov end

#' Create a hierarchical random graph from an igraph graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `hrg.create()` was renamed to `hrg()` to create a more
#' consistent API.
#' @inheritParams hrg
#' @keywords internal
#' @export
hrg.create <- function(graph, prob) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "hrg.create()", "hrg()")
  hrg(graph = graph, prob = prob)
} # nocov end

#' Create a consensus tree from several hierarchical random graph models
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `hrg.consensus()` was renamed to `consensus_tree()` to create a more
#' consistent API.
#' @inheritParams consensus_tree
#' @keywords internal
#' @export
hrg.consensus <- function(graph, hrg = NULL, start = FALSE, num.samples = 10000) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "hrg.consensus()", "consensus_tree()")
  consensus_tree(graph = graph, hrg = hrg, start = start, num.samples = num.samples)
} # nocov end
#   IGraph R package
#   Copyright (C) 2011-2012  Gabor Csardi <csardi.gabor@gmail.com>
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

#' Hierarchical random graphs
#'
#' Fitting and sampling hierarchical random graph models.
#'
#' A hierarchical random graph is an ensemble of undirected graphs with \eqn{n}
#' vertices. It is defined via a binary tree with \eqn{n} leaf and \eqn{n-1}
#' internal vertices, where the internal vertices are labeled with
#' probabilities.  The probability that two vertices are connected in the
#' random graph is given by the probability label at their closest common
#' ancestor.
#'
#' Please see references below for more about hierarchical random graphs.
#'
#' igraph contains functions for fitting HRG models to a given network
#' (`fit_hrg()`, for generating networks from a given HRG ensemble
#' (`sample_hrg()`), converting an igraph graph to a HRG and back
#' (`hrg()`, `hrg_tree()`), for calculating a consensus tree from a set
#' of sampled HRGs (`consensus_tree()`) and for predicting missing edges in
#' a network based on its HRG models (`predict_edges()`).
#'
#' The igraph HRG implementation is heavily based on the code published by
#' Aaron Clauset, at his website (not functional any more).
#'
#' @name hrg-methods
#' @family hierarchical random graph functions
NULL

#' Fit a hierarchical random graph model
#'
#' `fit_hrg()` fits a HRG to a given graph. It takes the specified
#' `steps` number of MCMC steps to perform the fitting, or a convergence
#' criteria if the specified number of steps is zero. `fit_hrg()` can start
#' from a given HRG, if this is given in the `hrg()` argument and the
#' `start` argument is `TRUE`. It can be converted to the `hclust` class using
#' `as.hclust()` provided in this package.
#'
#' @param graph The graph to fit the model to. Edge directions are ignored in
#'   directed graphs.
#' @param hrg A hierarchical random graph model, in the form of an
#'   `igraphHRG` object. `fit_hrg()` allows this to be `NULL`, in
#'   which case a random starting point is used for the fitting.
#' @param start Logical, whether to start the fitting/sampling from the
#'   supplied `igraphHRG` object, or from a random starting point.
#' @param steps The number of MCMC steps to make. If this is zero, then the
#'   MCMC procedure is performed until convergence.
#' @return `fit_hrg()` returns an `igraphHRG` object. This is a list
#'   with the following members:
#'   \item{left}{Vector that contains the left children of the internal
#'     tree vertices. The first vertex is always the root vertex, so the
#'     first element of the vector is the left child of the root
#'     vertex. Internal vertices are denoted with negative numbers, starting
#'     from -1 and going down, i.e. the root vertex is -1. Leaf vertices
#'     are denoted by non-negative number, starting from zero and up.}
#'   \item{right}{Vector that contains the right children of the vertices,
#'     with the same encoding as the `left` vector.}
#'   \item{prob}{The connection probabilities attached to the internal
#'     vertices, the first number belongs to the root vertex (i.e. internal
#'     vertex -1), the second to internal vertex -2, etc.}
#'   \item{edges}{The number of edges in the subtree below the given
#'     internal vertex.}
#'   \item{vertices}{The number of vertices in the subtree below the
#'     given internal vertex, including itself.}
#' @references A. Clauset, C. Moore, and M.E.J. Newman. Hierarchical structure
#' and the prediction of missing links in networks. *Nature* 453, 98--101
#' (2008);
#'
#' A. Clauset, C. Moore, and M.E.J. Newman. Structural Inference of Hierarchies
#' in Networks. In E. M. Airoldi et al. (Eds.): ICML 2006 Ws, *Lecture
#' Notes in Computer Science* 4503, 1--13. Springer-Verlag, Berlin Heidelberg
#' (2007).
#' @examplesIf rlang::is_interactive()
#'
#' ## A graph with two dense groups
#' g <- sample_gnp(10, p = 1 / 2) + sample_gnp(10, p = 1 / 2)
#' hrg <- fit_hrg(g)
#' hrg
#' summary(as.hclust(hrg))
#'
#' ## The consensus tree for it
#' consensus_tree(g, hrg = hrg, start = TRUE)
#'
#' ## Prediction of missing edges
#' g2 <- make_full_graph(4) + (make_full_graph(4) - path(1, 2))
#' predict_edges(g2)
#' @export
#' @family hierarchical random graph functions
fit_hrg <- function(graph, hrg = NULL, start = FALSE, steps = 0) {
  # Argument checks
  ensure_igraph(graph)
  if (is.null(hrg)) {
    hrg <- list(
      left = c(), right = c(), prob = c(), edges = c(),
      vertices = c()
    )
  }
  hrg <- lapply(
    hrg[c("left", "right", "prob", "edges", "vertices")],
    as.numeric
  )
  start <- as.logical(start)
  steps <- as.numeric(steps)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(R_igraph_hrg_fit, graph, hrg, start, steps)

  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    res$names <- V(graph)$name
  }

  class(res) <- "igraphHRG"
  res
}


#' Create a consensus tree from several hierarchical random graph models
#'
#' `consensus_tree()` creates a consensus tree from several fitted
#' hierarchical random graph models, using phylogeny methods. If the `hrg()`
#' argument is given and `start` is set to `TRUE`, then it starts
#' sampling from the given HRG. Otherwise it optimizes the HRG log-likelihood
#' first, and then samples starting from the optimum.
#'
#' @param graph The graph the models were fitted to.
#' @param hrg A hierarchical random graph model, in the form of an
#'   `igraphHRG` object. `consensus_tree()` allows this to be
#'   `NULL` as well, then a HRG is fitted to the graph first, from a
#'   random starting point.
#' @param start Logical, whether to start the fitting/sampling from the
#'   supplied `igraphHRG` object, or from a random starting point.
#' @param num.samples Number of samples to use for consensus generation or
#'   missing edge prediction.
#' @return `consensus_tree()` returns a list of two objects. The first
#'   is an `igraphHRGConsensus` object, the second is an
#'   `igraphHRG` object.  The `igraphHRGConsensus` object has the
#'   following members:
#'   \item{parents}{For each vertex, the id of its parent vertex is stored,
#'     or zero, if the vertex is the root vertex in the tree. The first n
#'     vertex ids (from 0) refer to the original vertices of the graph, the
#'     other ids refer to vertex groups.}
#'   \item{weights}{Numeric vector, counts the number of times a given tree
#'     split occurred in the generated network samples, for each internal
#'     vertices. The order is the same as in the `parents` vector.}
#' @family hierarchical random graph functions
#' @export
#' @cdocs igraph_hrg_consensus
consensus_tree <- hrg_consensus_impl


#' Create a hierarchical random graph from an igraph graph
#'
#' `hrg()` creates a HRG from an igraph graph. The igraph graph must be
#' a directed binary tree, with \eqn{n-1} internal and \eqn{n} leaf
#' vertices. The `prob` argument contains the HRG probability labels
#' for each vertex; these are ignored for leaf vertices.
#'
#' @param graph The igraph graph to create the HRG from.
#' @param prob A vector of probabilities, one for each vertex, in the order of
#'   vertex ids.
#' @return `hrg()` returns an `igraphHRG` object.
#'
#' @family hierarchical random graph functions
#' @export
#' @cdocs igraph_hrg_create
hrg <- hrg_create_impl


#' Create an igraph graph from a hierarchical random graph model
#'
#' `hrg_tree()` creates the corresponsing igraph tree of a hierarchical
#' random graph model.
#'
#' @param hrg A hierarchical random graph model.
#' @return An igraph graph with a vertex attribute called `"probability"`.
#'
#' @family hierarchical random graph functions
#' @export
#' @cdocs igraph_from_hrg_dendrogram
hrg_tree <- function(hrg) {
  out <- from_hrg_dendrogram_impl(hrg)

  g <- out$graph
  set_vertex_attr(g, "probability", value = out$prob)
}


#' Sample from a hierarchical random graph model
#'
#' `sample_hrg()` samples a graph from a given hierarchical random graph
#' model.
#'
#' @param hrg A hierarchical random graph model.
#' @return An igraph graph.
#'
#' @family hierarchical random graph functions
#' @export
#' @cdocs igraph_hrg_game
sample_hrg <- hrg_game_impl

#' Predict edges based on a hierarchical random graph model
#'
#' `predict_edges()` uses a hierarchical random graph model to predict
#' missing edges from a network. This is done by sampling hierarchical models
#' around the optimum model, proportionally to their likelihood. The MCMC
#' sampling is stated from `hrg()`, if it is given and the `start`
#' argument is set to `TRUE`. Otherwise a HRG is fitted to the graph
#' first.
#'
#' @param graph The graph to fit the model to. Edge directions are ignored in
#'   directed graphs.
#' @param hrg A hierarchical random graph model, in the form of an
#'   `igraphHRG` object. `predict_edges()` allow this to be
#'   `NULL` as well, then a HRG is fitted to the graph first, from a
#'   random starting point.
#' @param start Logical, whether to start the fitting/sampling from the
#'   supplied `igraphHRG` object, or from a random starting point.
#' @param num.samples Number of samples to use for consensus generation or
#'   missing edge prediction.
#' @param num.bins Number of bins for the edge probabilities. Give a higher
#'   number for a more accurate prediction.
#' @return A list with entries:
#'   \item{edges}{The predicted edges, in a two-column matrix of vertex
#'     ids.}
#'   \item{prob}{Probabilities of these edges, according to the fitted
#'     model.}
#'   \item{hrg}{The (supplied or fitted) hierarchical random graph model.}
#'
#' @references A. Clauset, C. Moore, and M.E.J. Newman. Hierarchical structure
#' and the prediction of missing links in networks. *Nature* 453, 98--101
#' (2008);
#'
#' A. Clauset, C. Moore, and M.E.J. Newman. Structural Inference of Hierarchies
#' in Networks. In E. M. Airoldi et al. (Eds.): ICML 2006 Ws, *Lecture
#' Notes in Computer Science* 4503, 1--13. Springer-Verlag, Berlin Heidelberg
#' (2007).
#' @examplesIf rlang::is_interactive()
#'
#' ## A graph with two dense groups
#' g <- sample_gnp(10, p = 1 / 2) + sample_gnp(10, p = 1 / 2)
#' hrg <- fit_hrg(g)
#' hrg
#'
#' ## The consensus tree for it
#' consensus_tree(g, hrg = hrg, start = TRUE)
#'
#' ## Prediction of missing edges
#' g2 <- make_full_graph(4) + (make_full_graph(4) - path(1, 2))
#' predict_edges(g2)
#' @export
#' @family hierarchical random graph functions
predict_edges <- function(graph, hrg = NULL, start = FALSE, num.samples = 10000,
                          num.bins = 25) {
  # Argument checks
  ensure_igraph(graph)
  if (is.null(hrg)) {
    hrg <- list(
      left = c(), right = c(), prob = c(), edges = c(),
      vertices = c()
    )
  }
  hrg <- lapply(
    hrg[c("left", "right", "prob", "edges", "vertices")],
    as.numeric
  )
  start <- as.logical(start)
  num.samples <- as.numeric(num.samples)
  num.bins <- as.numeric(num.bins)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(
    R_igraph_hrg_predict, graph, hrg, start, num.samples,
    num.bins
  )
  res$edges <- matrix(res$edges, ncol = 2, byrow = TRUE)
  class(res$hrg) <- "igraphHRG"
  res
}



#' Conversion to igraph
#'
#' These functions convert various objects to igraph graphs.
#'
#' You can use `as.igraph()` to convert various objects to igraph graphs.
#' Right now the following objects are supported: \itemize{ \item codeigraphHRG
#' These objects are created by the [fit_hrg()] and
#' [consensus_tree()] functions.  }
#'
#' @aliases as.igraph as.igraph.igraphHRG
#' @param x The object to convert.
#' @param \dots Additional arguments. None currently.
#' @return All these functions return an igraph graph.
#' @export
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}.
#' @keywords graphs
#' @examples
#'
#' g <- make_full_graph(5) + make_full_graph(5)
#' hrg <- fit_hrg(g)
#' as.igraph(hrg)
#'
as.igraph <- function(x, ...) {
  UseMethod("as.igraph")
}

#' @method as.igraph igraphHRG
#' @export
as.igraph.igraphHRG <- function(x, ...) {
  ovc <- length(x$left) + 1L
  ivc <- ovc - 1L
  ll <- ifelse(x$left < 0, -x$left + ovc, x$left + 1)
  rr <- ifelse(x$right < 0, -x$right + ovc, x$right + 1)
  edges <- c(rbind(seq_len(ivc) + ovc, ll), rbind(seq_len(ivc) + ovc, rr))
  res <- make_graph(edges)

  V(res)$name <- c(
    if (!is.null(x$names)) x$names else as.character(1:ovc),
    paste0("g", 1:ivc)
  )
  V(res)$prob <- c(rep(NA, ovc), x$prob)
  res$name <- "Fitted HRG"
  res
}

buildMerges <- function(object) {
  ## Build a merge matrix. This is done by a post-order
  ## traversal of the tree.

  S <- numeric()
  vcount <- length(object$left) + 1
  nMerge <- vcount - 1
  merges <- matrix(0, nrow = vcount - 1, ncol = 3)
  mptr <- 1
  S[length(S) + 1] <- -1
  prev <- NULL
  while (length(S) != 0) {
    curr <- S[length(S)]
    ## coming from parent? going left if possible.
    if (is.null(prev) ||
      (prev < 0 && object$left[-prev] == curr) ||
      (prev < 0 && object$right[-prev] == curr)) {
      if (curr < 0) {
        S <- c(S, object$left[-curr])
      }
      ## coming from left child? going right
    } else if (curr < 0 && object$left[-curr] == prev) {
      S <- c(S, object$right[-curr])
      ## coming from right child? going up
    } else {
      if (curr < 0) {
        merges[mptr, ] <- c(object$left[-curr], object$right[-curr], curr)
        mptr <- mptr + 1
      }
      S <- S[-length(S)]
    }
    prev <- curr
  }
  merges
}

#' @method as.dendrogram igraphHRG
as.dendrogram.igraphHRG <- function(object, hang = 0.01, ...) {
  nMerge <- length(object$left)
  merges <- buildMerges(object)

  .memberDend <- function(x) {
    r <- attr(x, "x.member")
    if (is.null(r)) {
      r <- attr(x, "members")
      if (is.null(r)) r <- 1:1
    }
    r
  }

  oHgt <- 1:nrow(merges)
  hMax <- oHgt[length(oHgt)]
  mynames <- if (is.null(object$names)) 1:(nMerge + 1) else object$names
  z <- list()

  for (k in 1:nMerge) {
    x <- merges[k, 1:2]
    if (any(neg <- x >= 0)) {
      h0 <- if (hang < 0) 0 else max(0, oHgt[k] - hang * hMax)
    }
    if (all(neg)) { # two leaves
      zk <- as.list(x + 1)
      attr(zk, "members") <- 2L
      attr(zk, "midpoint") <- 1 / 2 # mean( c(0,1) )
      objlabels <- mynames[x + 1]
      attr(zk[[1]], "label") <- objlabels[1]
      attr(zk[[2]], "label") <- objlabels[2]
      attr(zk[[1]], "members") <- attr(zk[[2]], "members") <- 1L
      attr(zk[[1]], "height") <- attr(zk[[2]], "height") <- h0
      attr(zk[[1]], "leaf") <- attr(zk[[2]], "leaf") <- TRUE
    } else if (any(neg)) { # one leaf, one node
      X <- paste0("g", -x)
      isL <- x[1] >= 0
      zk <- if (isL) list(x[1] + 1, z[[X[2]]]) else list(z[[X[1]]], x[2] + 1)
      attr(zk, "members") <- attr(z[[X[1 + isL]]], "members") + 1L
      attr(zk, "midpoint") <-
        (.memberDend(zk[[1]]) + attr(z[[X[1 + isL]]], "midpoint")) / 2
      attr(zk[[2 - isL]], "members") <- 1L
      attr(zk[[2 - isL]], "height") <- h0
      attr(zk[[2 - isL]], "label") <- mynames[x[2 - isL] + 1]
      attr(zk[[2 - isL]], "leaf") <- TRUE
    } else { # two nodes
      X <- paste0("g", -x)
      zk <- list(z[[X[1]]], z[[X[2]]])
      attr(zk, "members") <- attr(z[[X[1]]], "members") +
        attr(z[[X[2]]], "members")
      attr(zk, "midpoint") <- (attr(z[[X[1]]], "members") +
        attr(z[[X[1]]], "midpoint") +
        attr(z[[X[2]]], "midpoint")) / 2
    }
    attr(zk, "height") <- oHgt[k]
    z[[k <- paste0("g", -merges[k, 3])]] <- zk
  }
  z <- z[[k]]
  class(z) <- "dendrogram"
  z
}

#' @importFrom stats as.hclust
#' @export
#'
as.hclust.igraphHRG <- function(x, ...) {
  merge3 <- buildMerges(x)

  ## We need to rewrite the merge matrix, because hclust assumes
  ## that group ids are assigned in the order of the merges
  map <- order(-merge3[, 3])

  merge <- merge3[, 1:2]
  gs <- which(merge < 0)
  merge[gs] <- map[-merge[gs]]
  merge[-gs] <- -merge[-gs] - 1

  ## To get the ordering, we need to recode the merge matrix again,
  ## without using group ids. Here the right node is merged _into_
  ## the left node.
  map2 <- numeric(nrow(merge))
  mergeInto <- merge
  for (i in 1:nrow(merge)) {
    mr <- mergeInto[i, ]
    mr[mr > 0] <- -map2[mr[mr > 0]]
    mergeInto[i, ] <- -mr
    map2[i] <- -mr[1]
  }
  n <- nrow(merge) + 1
  order <- igraph_hcass2(
    n = as.integer(n),
    ia = as.integer(mergeInto[, 1]),
    ib = as.integer(mergeInto[, 2])
  )

  mynames <- if (is.null(x$names)) 1:n else x$names
  res <- list(
    merge = merge, height = 1:nrow(merge), order = order,
    labels = mynames, method = NA_character_,
    dist.method = NA_character_
  )
  class(res) <- "hclust"
  res
}

#' @importFrom stats reorder
as.phylo.igraphHRG <- function(x, ...) {
  ovc <- length(x$left) + 1L
  ivc <- ovc - 1L
  ll <- ifelse(x$left < 0, -x$left + ovc, x$left + 1)
  rr <- ifelse(x$right < 0, -x$right + ovc, x$right + 1)
  edge <- matrix(rbind(seq_len(ivc) + ovc, ll, seq_len(ivc) + ovc, rr),
    ncol = 2, byrow = TRUE
  )

  edge.length <- rep(0.5, nrow(edge))
  labels <- if (is.null(x$names)) 1:ovc else x$names
  obj <- list(
    edge = edge, edge.length = edge.length / 2, tip.label = labels,
    Nnode = ivc
  )
  class(obj) <- "phylo"
  reorder(obj)
}
rlang::on_load(s3_register("ape::as.phylo", "igraphHRG"))

#' HRG dendrogram plot
#'
#' Plot a hierarchical random graph as a dendrogram.
#'
#' `plot_dendrogram()` supports three different plotting functions, selected via
#' the `mode` argument. By default the plotting function is taken from the
#' `dend.plot.type` igraph option, and it has for possible values:
#' \itemize{ \item `auto` Choose automatically between the plotting
#' functions. As `plot.phylo` is the most sophisticated, that is choosen,
#' whenever the `ape` package is available. Otherwise `plot.hclust`
#' is used.  \item `phylo` Use `plot.phylo` from the `ape`
#' package.  \item `hclust` Use `plot.hclust` from the `stats`
#' package.  \item `dendrogram` Use `plot.dendrogram` from the
#' `stats` package.  }
#'
#' The different plotting functions take different sets of arguments. When
#' using `plot.phylo` (`mode="phylo"`), we have the following syntax:
#' \preformatted{
#'     plot_dendrogram(x, mode="phylo", colbar = rainbow(11, start=0.7,
#'             end=0.1), edge.color = NULL, use.edge.length = FALSE, \dots)
#' } The extra arguments not documented above: \itemize{
#'   \item `colbar` Color bar for the edges.
#'   \item `edge.color` Edge colors. If `NULL`, then the
#'     `colbar` argument is used.
#'   \item `use.edge.length` Passed to `plot.phylo`.
#'   \item `dots` Attitional arguments to pass to `plot.phylo`.
#' }
#'
#' The syntax for `plot.hclust` (`mode="hclust"`): \preformatted{
#'     plot_dendrogram(x, mode="hclust", rect = 0, colbar = rainbow(rect),
#'             hang = 0.01, ann = FALSE, main = "", sub = "", xlab = "",
#'             ylab = "", \dots)
#' } The extra arguments not documented above: \itemize{
#'   \item `rect` A numeric scalar, the number of groups to mark on
#'     the dendrogram. The dendrogram is cut into exactly `rect`
#'     groups and they are marked via the `rect.hclust` command. Set
#'     this to zero if you don't want to mark any groups.
#'   \item `colbar` The colors of the rectangles that mark the
#'     vertex groups via the `rect` argument.
#'   \item `hang` Where to put the leaf nodes, this corresponds to the
#'     `hang` argument of `plot.hclust`.
#'   \item `ann` Whether to annotate the plot, the `ann` argument
#'     of `plot.hclust`.
#'   \item `main` The main title of the plot, the `main` argument
#'     of `plot.hclust`.
#'   \item `sub` The sub-title of the plot, the `sub` argument of
#'     `plot.hclust`.
#'   \item `xlab` The label on the horizontal axis, passed to
#'     `plot.hclust`.
#'   \item `ylab` The label on the vertical axis, passed to
#'     `plot.hclust`.
#'   \item `dots` Attitional arguments to pass to `plot.hclust`.
#' }
#'
#' The syntax for `plot.dendrogram` (`mode="dendrogram"`):
#' \preformatted{
#'     plot_dendrogram(x, \dots)
#' } The extra arguments are simply passed to [as.dendrogram()].
#'
#' @param x An `igraphHRG`, a hierarchical random graph, as returned by
#'   the [fit_hrg()] function.
#' @param mode Which dendrogram plotting function to use. See details below.
#' @param \dots Additional arguments to supply to the dendrogram plotting
#'   function.
#' @return Returns whatever the return value was from the plotting function,
#'   `plot.phylo`, `plot.dendrogram` or `plot.hclust`.
#' @method plot_dendrogram igraphHRG
#' @export
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @keywords graphs
#' @examples
#'
#' g <- make_full_graph(5) + make_full_graph(5)
#' hrg <- fit_hrg(g)
#' plot_dendrogram(hrg)
#'
plot_dendrogram.igraphHRG <- function(x, mode = igraph_opt("dend.plot.type"), ...) {
  if (mode == "auto") {
    have_ape <- requireNamespace("ape", quietly = TRUE)
    mode <- if (have_ape) "phylo" else "hclust"
  }

  if (mode == "hclust") {
    hrgPlotHclust(x, ...)
  } else if (mode == "dendrogram") {
    hrgPlotDendrogram(x, ...)
  } else if (mode == "phylo") {
    hrgPlotPhylo(x, ...)
  }
}

#' @importFrom graphics plot
#' @importFrom grDevices rainbow
#' @importFrom stats rect.hclust
hrgPlotHclust <- function(x, rect = 0, colbar = rainbow(rect), hang = .01,
                          ann = FALSE, main = "", sub = "", xlab = "", ylab = "",
                          ...) {
  hc <- as.hclust(x)
  ret <- plot(hc,
    hang = hang, ann = ann, main = main, sub = sub, xlab = xlab,
    ylab = ylab, ...
  )
  if (rect > 0) {
    rect.hclust(hc, k = rect, border = colbar)
  }
  invisible(ret)
}

#' @importFrom graphics plot
hrgPlotDendrogram <- function(x, ...) {
  plot(as.dendrogram(x), ...)
}

#' @importFrom graphics plot
#' @importFrom grDevices rainbow
hrgPlotPhylo <- function(x, colbar = rainbow(11, start = .7, end = .1),
                         edge.color = NULL, use.edge.length = FALSE, ...) {
  vc <- length(x$left) + 1
  phy <- ape::as.phylo(x)
  br <- seq(0, 1, length.out = length(colbar))
  br[1] <- -1
  cc <- as.integer(cut(x$prob[phy$edge[, 1] - vc], breaks = br))
  if (is.null(edge.color)) {
    edge.color <- colbar[cc]
  }
  plot(phy, edge.color = edge.color, use.edge.length = use.edge.length, ...)
}

#' Print a hierarchical random graph model to the screen
#'
#' `igraphHRG` objects can be printed to the screen in two forms: as
#' a tree or as a list, depending on the `type` argument of the
#' print function. By default the `auto` type is used, which selects
#' `tree` for small graphs and `simple` (=list) for bigger
#' ones. The `tree` format looks like
#'  this: \preformatted{Hierarchical random graph, at level 3:
#' g1        p=   0
#' '- g15    p=0.33  1
#'    '- g13 p=0.88  6  3  9  4  2  10 7  5  8
#' '- g8     p= 0.5
#'    '- g16 p= 0.2  20 14 17 19 11 15 16 13
#'    '- g5  p=   0  12 18  }
#' This is a graph with 20 vertices, and the
#' top three levels of the fitted hierarchical random graph are
#' printed. The root node of the HRG is always vertex group #1
#' (\sQuote{`g1`} in the the printout). Vertex pairs in the left
#' subtree of `g1` connect to vertices in the right subtree with
#' probability zero, according to the fitted model. `g1` has two
#' subgroups, `g15` and `g8`. `g15` has a subgroup of a
#' single vertex (vertex 1), and another larger subgroup that contains
#' vertices 6, 3, etc. on lower levels, etc.
#' The `plain` printing is simpler and faster to produce, but less
#' visual: \preformatted{Hierarchical random graph:
#' g1  p=0.0 -> g12 g10   g2  p=1.0 -> 7 10      g3  p=1.0 -> g18 14
#' g4  p=1.0 -> g17 15    g5  p=0.4 -> g15 17    g6  p=0.0 -> 1 4
#' g7  p=1.0 -> 11 16     g8  p=0.1 -> g9 3      g9  p=0.3 -> g11 g16
#' g10 p=0.2 -> g4 g5     g11 p=1.0 -> g6 5      g12 p=0.8 -> g8 8
#' g13 p=0.0 -> g14 9     g14 p=1.0 -> 2 6       g15 p=0.2 -> g19 18
#' g16 p=1.0 -> g13 g2    g17 p=0.5 -> g7 13     g18 p=1.0 -> 12 19
#' g19 p=0.7 -> g3 20}
#' It lists the two subgroups of each internal node, in
#' as many columns as the screen width allows.
#'
#' @param x `igraphHRG` object to print.
#' @param type How to print the dendrogram, see details below.
#' @param level The number of top levels to print from the dendrogram.
#' @param ... Additional arguments, not used currently.
#' @return The hierarchical random graph model itself, invisibly.
#'
#' @method print igraphHRG
#' @export
#' @family hierarchical random graph functions
print.igraphHRG <- function(x, type = c("auto", "tree", "plain"),
                            level = 3, ...) {
  type <- igraph.match.arg(type)
  if (type == "auto") {
    type <- if (length(x$left <= 100)) "tree" else "plain"
  }
  if (type == "tree") {
    return(print1.igraphHRG(x, level = level, ...))
  } else {
    return(print2.igraphHRG(x, ...))
  }
}

print1.igraphHRG <- function(x, level = 3, ...) {
  cat(sep = "", "Hierarchical random graph, at level ", level, ":\n")

  ## Depth of printed top of the dendrogram
  .depth <- function(b, l) {
    l[2] <- max(l[2], nchar(format(x$prob[b], digits = 2)))
    if (l[1] == level) {
      return(l)
    }
    if (x$left[b] < 0 && x$right[b] < 0) {
      l1 <- .depth(-x$left[b], c(l[1] + 1, l[2]))
      l2 <- .depth(-x$right[b], c(l[1] + 1, l[2]))
      return(pmax(l1, l2))
    }
    if (x$left[b] < 0) {
      return(.depth(-x$left[b], c(l[1] + 1, l[2])))
    }
    if (x$right[b] < 0) {
      return(.depth(-x$right[b], c(l[1] + 1, l[2])))
    }
    return(l)
  }
  cs <- .depth(1, c(1, 0))
  pw <- cs[2]
  cs <- cs[1] * 3
  vw <- nchar(as.character(length(x$left) + 1))
  sp <- paste(collapse = "", rep(" ", cs + pw + 2 + 2))
  nn <- if (is.null(x$names)) seq_len(length(x$left) + 1) else x$names

  ## Function to collect all individual vertex children
  .children <- function(b) {
    res <- c()
    if (x$left[b] < 0) {
      res <- c(res, .children(-x$left[b]))
    } else {
      res <- c(x$left[b] + 1, res)
    }
    if (x$right[b] < 0) {
      res <- c(res, .children(-x$right[b]))
    } else {
      res <- c(x$right[b] + 1, res)
    }
    return(res)
  }

  ## Recursive printing
  .plot <- function(b, l, ind = "") {
    if (b != 1) {
      he <- format(paste(sep = "", ind, "'- g", b), width = cs)
      ind <- paste("  ", ind)
    } else {
      he <- format(paste(sep = "", ind, "g", b), width = cs)
    }
    ## whether to go left and/or right
    gol <- x$left[b] < 0 && l < level
    gor <- x$right[b] < 0 && l < level

    ## the children to print
    ch1 <- character()
    if (!gol && x$left[b] < 0) {
      ch1 <- c(ch1, paste(sep = "", "g", -x$left[b]))
    }
    if (!gor && x$right[b] < 0) {
      ch1 <- c(ch1, paste(sep = "", "g", -x$right[b]))
    }
    ch2 <- numeric()
    if (!gol) {
      if (x$left[b] < 0) {
        ch2 <- c(ch2, .children(-x$left[b]))
      }
      if (x$left[b] >= 0) {
        ch2 <- c(ch2, x$left[b] + 1)
      }
    }
    if (!gor) {
      if (x$right[b] < 0) {
        ch2 <- c(ch2, .children(-x$right[b]))
      }
      if (x$right[b] >= 0) {
        ch2 <- c(ch2, x$right[b] + 1)
      }
    }

    ## print this line
    ch2 <- as.character(nn[ch2])
    lf <- gsub(" ", "x", format(ch2, width = vw), fixed = TRUE)
    lf <- paste(collapse = " ", lf)
    lf <- strwrap(lf, width = getOption("width") - cs - pw - 3 - 2)
    lf <- gsub("x", " ", lf, fixed = TRUE)
    if (length(lf) > 1) {
      lf <- c(lf[1], paste(sp, lf[-1]))
      lf <- paste(collapse = "\n", lf)
    }
    op <- paste(
      sep = "", format(he, width = cs),
      " p=", format(x$prob[b], digits = 2, width = pw, justify = "left"),
      "  ", paste(collapse = " ", lf)
    )
    cat(op, fill = TRUE)

    ## recursive call
    if (x$left[b] < 0 && l < level) .plot(-x$left[b], l + 1, ind)
    if (x$right[b] < 0 && l < level) .plot(-x$right[b], l + 1, ind)
  }

  ## Do it
  if (length(x$left) > 0) .plot(b = 1, l = 1)

  invisible(x)
}

print2.igraphHRG <- function(x, ...) {
  cat("Hierarchical random graph:\n")
  bw <- ceiling(log10(length(x$left) + 1)) + 1
  p <- format(x$prob, digits = 1)
  pw <- 4 + max(nchar(p))
  nn <- if (is.null(x$names)) seq_len(length(x$left) + 1) else x$names
  op <- sapply(seq_along(x$left), function(i) {
    lc <- if (x$left[i] < 0) {
      paste(sep = "", "g", -x$left[i])
    } else {
      nn[x$left[i] + 1]
    }
    rc <- if (x$right[i] < 0) {
      paste(sep = "", "g", -x$right[i])
    } else {
      nn[x$right[i] + 1]
    }
    paste(
      sep = "", format(paste(sep = "", "g", i), width = bw),
      format(paste(sep = "", " p=", p[i]), width = pw),
      "-> ", lc, " ", rc
    )
  })
  op <- format(op, justify = "left")
  cat(op, sep = "   ", fill = TRUE)
  invisible(x)
}

## TODO: print as a tree

#' Print a hierarchical random graph consensus tree to the screen
#'
#' Consensus dendrograms (`igraphHRGConsensus` objects) are printed
#' simply by listing the children of each internal node of the
#' dendrogram: \preformatted{HRG consensus tree:
#' g1 -> 11 12 13 14 15 16 17 18 19 20
#' g2 -> 1  2  3  4  5  6  7  8  9  10
#' g3 -> g1 g2}
#' The root of the dendrogram is `g3` (because it has no incoming
#' edges), and it has two subgroups, `g1` and `g2`.
#'
#' @param x `igraphHRGConsensus` object to print.
#' @param ... Ignored.
#' @return The input object, invisibly, to allow method chaining.
#'
#' @method print igraphHRGConsensus
#' @export
#' @family hierarchical random graph functions
print.igraphHRGConsensus <- function(x, ...) {
  cat("HRG consensus tree:\n")
  n <- length(x$parents) - length(x$weights)
  mn <- if (is.null(x$names)) seq_len(n) else x$names
  id <- c(mn, paste(sep = "", "g", seq_along(x$weights)))
  ch <- tapply(id, x$parents, c)[-1] # first is zero
  bw <- nchar(as.character(length(x$weights)))
  vw <- max(nchar(id))
  op <- sapply(seq_along(x$weights), function(i) {
    mych <- format(ch[[i]], width = vw)
    if (length(ch[[i]]) * (vw + 1) + bw + 4 > getOption("width")) {
      mych <- gsub(" ", "x", mych, fixed = TRUE)
      mych <- paste(collapse = " ", mych)
      pref <- paste(collapse = "", rep(" ", bw + 5))
      mych <- strwrap(mych,
        width = getOption("width") - bw - 4,
        initial = "", prefix = pref
      )
      mych <- gsub("x", " ", mych, fixed = TRUE)
      mych <- paste(collapse = "\n", mych)
    } else {
      mych <- paste(collapse = " ", mych)
    }
    paste(sep = "", "g", format(i, width = bw), " -> ", mych)
  })
  if (max(nchar(op)) < (getOption("width") - 4) / 2) {
    op <- format(op, justify = "left")
    cat(op, sep = "   ", fill = TRUE)
  } else {
    cat(op, sep = "\n")
  }

  invisible(x)
}

"
## How to print HRGs?

B-1           p=0
'- B-3        p=1  6
   '- B-7     p=1  2
      '- B-5  p=1  1 5
'- B-6        p=1  7
   '- B-2     p=1  4
      '- B-4  p=1  3 8

## The same at levels 1, 2 and 3:

B-1  p=0  B-3 B-6 6 2 1 5 7 4 3 8

B-1     p=0
'+ B-3  p=1  B-7  6 2 1 5
'+ B-6  p=1  B-2  7 4 3 8

B-1        p=0
'- B-3     p=1  6
   '+ B-7  p=1  B-5 2 1 5
'- B-6     p=1  7
   '+ B-2  p=1  B-4 4 3 8

## This can be tedious if the graph is big, as we always have n-1
## internal nodes, we can restrict ourselves to (say) level 3 by default.

## Another possibility is to order the lines according to the group ids.

B-1  p=0  B-3 B-6
B-2  p=1  B-4 4
B-3  p=1  B-7 6
B-4  p=1  3 8
B-5  p=1  1 5
B-6  p=1  B-2 7
B-7  p=1  B-5 2

"

