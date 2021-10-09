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
#' (\code{fit_hrg}, for generating networks from a given HRG ensemble
#' (\code{sample_hrg}), converting an igraph graph to a HRG and back
#' (\code{hrg}, \code{hrg_tree}), for calculating a consensus tree from a set
#' of sampled HRGs (\code{consensus_tree}) and for predicting missing edges in
#' a network based on its HRG models (\code{predict_edges}).
#' 
#' The igraph HRG implementation is heavily based on the code published by
#' Aaron Clauset, at his website (not functional any more).
#' 
#' @name hrg-methods
#' @family hierarchical random graph functions
NULL

#' Fit a hierarchical random graph model
#'
#' \code{fit_hrg} fits a HRG to a given graph. It takes the specified
#' \code{steps} number of MCMC steps to perform the fitting, or a convergence
#' criteria if the specified number of steps is zero. \code{fit_hrg} can start
#' from a given HRG, if this is given in the \code{hrg} argument and the
#' \code{start} argument is \code{TRUE}.
#'
#' @aliases hrg.fit
#' @param graph The graph to fit the model to. Edge directions are ignored in
#' directed graphs.
#' @param hrg A hierarchical random graph model, in the form of an
#' \code{igraphHRG} object. \code{fit_hrg} allows this to be \code{NULL}, in
#' which case a random starting point is used for the fitting.
#' @param start Logical, whether to start the fitting/sampling from the
#' supplied \code{igraphHRG} object, or from a random starting point.
#' @param steps The number of MCMC steps to make. If this is zero, then the
#' MCMC procedure is performed until convergence.
#' @return \code{fit_hrg} returns an \code{igraphHRG} object. This is a list
#' with the following members:
#'   \item{left}{Vector that contains the left children of the internal
#'     tree vertices. The first vertex is always the root vertex, so the
#'     first element of the vector is the left child of the root
#'     vertex. Internal vertices are denoted with negative numbers, starting
#'     from -1 and going down, i.e. the root vertex is -1. Leaf vertices
#'     are denoted by non-negative number, starting from zero and up.}
#'   \item{right}{Vector that contains the right children of the vertices,
#'     with the same encoding as the \code{left} vector.}
#'   \item{prob}{The connection probabilities attached to the internal
#'     vertices, the first number belongs to the root vertex (i.e. internal
#'     vertex -1), the second to internal vertex -2, etc.}
#'   \item{edges}{The number of edges in the subtree below the given
#'     internal vertex.}
#'   \item{vertices}{The number of vertices in the subtree below the
#'     given internal vertex, including itself.}
#' @references A. Clauset, C. Moore, and M.E.J. Newman. Hierarchical structure
#' and the prediction of missing links in networks. \emph{Nature} 453, 98--101
#' (2008);
#' 
#' A. Clauset, C. Moore, and M.E.J. Newman. Structural Inference of Hierarchies
#' in Networks. In E. M. Airoldi et al. (Eds.): ICML 2006 Ws, \emph{Lecture
#' Notes in Computer Science} 4503, 1--13. Springer-Verlag, Berlin Heidelberg
#' (2007).
#' @examples
#' ## We are not running these examples any more, because they
#' ## take a long time (~15 seconds) to run and this is against the CRAN
#' ## repository policy. Copy and paste them by hand to your R prompt if
#' ## you want to run them.
#' 
#' \dontrun{
#' ## A graph with two dense groups
#' g <- sample_gnp(10, p=1/2) + sample_gnp(10, p=1/2)
#' hrg <- fit_hrg(g)
#' hrg
#' 
#' ## The consensus tree for it
#' consensus_tree(g, hrg=hrg, start=TRUE)
#' 
#' ## Prediction of missing edges
#' g2 <- make_full_graph(4) + (make_full_graph(4) - path(1,2))
#' predict_edges(g2)
#' }
#' @export
#' @family hierarchical random graph functions

fit_hrg <- function(graph, hrg=NULL, start=FALSE, steps=0) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  if (is.null(hrg)) { 
    hrg <- list(left=c(), right=c(), prob=c(), edges=c(), 
                vertices=c()) 
  } 
  hrg <- lapply(hrg[c("left","right","prob","edges","vertices")], 
                as.numeric)
  start <- as.logical(start)
  steps <- as.integer(steps)
  
  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_hrg_fit, graph, hrg, start, steps)
  
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    res$names <- V(graph)$name
  }

  class(res) <- "igraphHRG"
  res
}


#' Create a consensus tree from several hierarchical random graph models
#'
#' \code{consensus_tree} creates a consensus tree from several fitted
#' hierarchical random graph models, using phylogeny methods. If the \code{hrg}
#' argument is given and \code{start} is set to \code{TRUE}, then it starts
#' sampling from the given HRG. Otherwise it optimizes the HRG log-likelihood
#' first, and then samples starting from the optimum.
#' 
#' @aliases hrg.consensus
#' @param graph The graph the models were fitted to.
#' @param hrg A hierarchical random graph model, in the form of an
#'   \code{igraphHRG} object. \code{consensus_tree} allows this to be
#'   \code{NULL} as well, then a HRG is fitted to the graph first, from a
#'   random starting point.
#' @param start Logical, whether to start the fitting/sampling from the
#'   supplied \code{igraphHRG} object, or from a random starting point.
#' @param num.samples Number of samples to use for consensus generation or
#' missing edge prediction.
#' @return \code{consensus_tree} returns a list of two objects. The first
#' is an \code{igraphHRGConsensus} object, the second is an
#' \code{igraphHRG} object.  The \code{igraphHRGConsensus} object has the
#' following members:
#'   \item{parents}{For each vertex, the id of its parent vertex is stored,
#'     or zero, if the vertex is the root vertex in the tree. The first n
#'     vertex ids (from 0) refer to the original vertices of the graph, the
#'     other ids refer to vertex groups.}
#'   \item{weights}{Numeric vector, counts the number of times a given tree
#'     split occurred in the generated network samples, for each internal
#'     vertices. The order is the same as in the \code{parents} vector.}

#' @include auto.R
#' @family hierarchical random graph functions
#' @export

consensus_tree <- consensus_tree


#' Create a hierarchical random graph from an igraph graph
#' 
#' \code{hrg} creates a HRG from an igraph graph. The igraph graph must be
#' a directed binary tree, with \eqn{n-1} internal and \eqn{n} leaf
#' vertices. The \code{prob} argument contains the HRG probability labels
#' for each vertex; these are ignored for leaf vertices.
#'
#' @aliases hrg.create
#' @param graph The igraph graph to create the HRG from.
#' @param prob A vector of probabilities, one for each vertex, in the order of
#'   vertex ids.
#' @return \code{hrg} returns an \code{igraphHRG} object.
#'
#' @family hierarchical random graph functions
#' @export

hrg <- hrg


#' Create an igraph graph from a hierarchical random graph model
#' 
#' \code{hrg_tree} creates the corresponsing igraph tree of a hierarchical
#' random graph model.
#'
#' @param hrg A hierarchical random graph model.
#' @return An igraph graph.
#'
#' @family hierarchical random graph functions
#' @export

hrg_tree <- hrg_tree


#' Sample from a hierarchical random graph model
#'
#' \code{sample_hrg} samples a graph from a given hierarchical random graph
#' model.
#'
#' @aliases hrg.game
#' @param hrg A hierarchical random graph model.
#' @return An igraph graph.
#'
#' @family hierarchical random graph functions
#' @export

sample_hrg <- sample_hrg

#' Predict edges based on a hierarchical random graph model
#' 
#' \code{predict_edges} uses a hierarchical random graph model to predict
#' missing edges from a network. This is done by sampling hierarchical models
#' around the optimum model, proportionally to their likelihood. The MCMC
#' sampling is stated from \code{hrg}, if it is given and the \code{start}
#' argument is set to \code{TRUE}. Otherwise a HRG is fitted to the graph
#' first.
#'
#' @aliases hrg.predict
#' @param graph The graph to fit the model to. Edge directions are ignored in
#' directed graphs.
#' @param hrg A hierarchical random graph model, in the form of an
#' \code{igraphHRG} object. \code{predict_edges}s allow this to be
#' \code{NULL} as well, then a HRG is fitted to the graph first, from a
#' random starting point.
#' @param start Logical, whether to start the fitting/sampling from the
#' supplied \code{igraphHRG} object, or from a random starting point.
#' @param num.samples Number of samples to use for consensus generation or
#' missing edge prediction.
#' @param num.bins Number of bins for the edge probabilities. Give a higher
#' number for a more accurate prediction.
#' @return A list with entries:
#'   \item{edges}{The predicted edges, in a two-column matrix of vertex
#'     ids.}
#'   \item{prob}{Probabilities of these edges, according to the fitted
#'     model.}
#'   \item{hrg}{The (supplied or fitted) hierarchical random graph model.}
#'
#' @references A. Clauset, C. Moore, and M.E.J. Newman. Hierarchical structure
#' and the prediction of missing links in networks. \emph{Nature} 453, 98--101
#' (2008);
#' 
#' A. Clauset, C. Moore, and M.E.J. Newman. Structural Inference of Hierarchies
#' in Networks. In E. M. Airoldi et al. (Eds.): ICML 2006 Ws, \emph{Lecture
#' Notes in Computer Science} 4503, 1--13. Springer-Verlag, Berlin Heidelberg
#' (2007).
#' @examples
#' ## We are not running these examples any more, because they
#' ## take a long time (~15 seconds) to run and this is against the CRAN
#' ## repository policy. Copy and paste them by hand to your R prompt if
#' ## you want to run them.
#' 
#' \dontrun{
#' ## A graph with two dense groups
#' g <- sample_gnp(10, p=1/2) + sample_gnp(10, p=1/2)
#' hrg <- fit_hrg(g)
#' hrg
#' 
#' ## The consensus tree for it
#' consensus_tree(g, hrg=hrg, start=TRUE)
#' 
#' ## Prediction of missing edges
#' g2 <- make_full_graph(4) + (make_full_graph(4) - path(1,2))
#' predict_edges(g2)
#' }
#' @export
#' @family hierarchical random graph functions

predict_edges <- function(graph, hrg=NULL, start=FALSE, num.samples=10000,
                        num.bins=25) {
  
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  if (is.null(hrg)) { 
    hrg <- list(left=c(), right=c(), prob=c(), edges=c(), 
                vertices=c()) 
  } 
  hrg <- lapply(hrg[c("left","right","prob","edges","vertices")], 
                as.numeric)
  start <- as.logical(start)
  num.samples <- as.integer(num.samples)
  num.bins <- as.integer(num.bins)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_hrg_predict, graph, hrg, start, num.samples,
               num.bins)
  res$edges <- matrix(res$edges, ncol=2, byrow=TRUE)
  class(res$hrg) <- "igraphHRG"
  res
}



#' Conversion to igraph
#' 
#' These functions convert various objects to igraph graphs.
#' 
#' You can use \code{as.igraph} to convert various objects to igraph graphs.
#' Right now the following objects are supported: \itemize{ \item codeigraphHRG
#' These objects are created by the \code{\link{fit_hrg}} and
#' \code{\link{consensus_tree}} functions.  }
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
as.igraph <- function(x, ...)
  UseMethod("as.igraph")

#' @method as.igraph igraphHRG
#' @export

as.igraph.igraphHRG <- function(x, ...) {
  ovc <- length(x$left)+1L
  ivc <- ovc-1L
  ll <- ifelse(x$left  < 0, -x$left  + ovc, x$left  + 1)
  rr <- ifelse(x$right < 0, -x$right + ovc, x$right + 1)
  edges <- c(rbind(seq_len(ivc)+ovc, ll), rbind(seq_len(ivc)+ovc, rr))
  res <- graph(edges)
  
  V(res)$name <- c(if (!is.null(x$names)) x$names else as.character(1:ovc),
                   paste0("g", 1:ivc))
  V(res)$prob <- c(rep(NA, ovc), x$prob)
  res$name <- "Fitted HRG"
  res
}

buildMerges <- function(object) {

  ## Build a merge matrix. This is done by a post-order
  ## traversal of the tree.

  S <- numeric()
  vcount <- length(object$left)+1
  nMerge <- vcount-1
  merges <- matrix(0, nrow=vcount-1, ncol=3)
  mptr <- 1
  S[length(S)+1] <- -1
  prev <- NULL
  while (length(S) != 0) {
    curr <- S[length(S)]
    ## coming from parent? going left if possible.
    if (is.null(prev) ||
        (prev < 0 && object$left[-prev] == curr) ||
        (prev < 0 && object$right[-prev] == curr)) {
      if (curr < 0) { S <- c(S, object$left[-curr]) }
    ## coming from left child? going right
    } else if (curr < 0 && object$left[-curr] == prev) {
      S <- c(S, object$right[-curr])
    ## coming from right child? going up
    } else {
      if (curr < 0) {
        merges[mptr,] <- c(object$left[-curr], object$right[-curr], curr)
        mptr <- mptr + 1
      }
      S <- S[-length(S)]
    }
    prev <- curr
  }
  merges
} 

#' @method as.dendrogram igraphHRG

as.dendrogram.igraphHRG <- function(object, hang=0.01, ...) {

  nMerge <- length(object$left)
  merges <- buildMerges(object)
  
  .memberDend <- function(x) {
    r <- attr(x,"x.member")
    if(is.null(r)) {
      r <- attr(x,"members")
      if(is.null(r)) r <- 1:1
    }
    r
  }
  
  oHgt <- 1:nrow(merges)
  hMax <- oHgt[length(oHgt)]
  mynames <- if (is.null(object$names)) 1:(nMerge+1) else object$names
  z <- list()
  
  for (k in 1:nMerge) {
    x <- merges[k,1:2]
    if (any(neg <- x >= 0)) {
      h0 <- if (hang < 0) 0 else max(0, oHgt[k] - hang * hMax)
    }
    if (all(neg)) {                     # two leaves
      zk <- as.list(x+1)
      attr(zk, "members") <- 2L
      attr(zk, "midpoint") <- 1/2       # mean( c(0,1) )
      objlabels <- mynames[x+1]
      attr(zk[[1]], "label") <- objlabels[1]
      attr(zk[[2]], "label") <- objlabels[2]
      attr(zk[[1]], "members") <- attr(zk[[2]], "members") <- 1L
      attr(zk[[1]], "height") <- attr(zk[[2]], "height") <- h0
      attr(zk[[1]], "leaf") <- attr(zk[[2]], "leaf") <- TRUE
    } else if (any(neg)) {              # one leaf, one node
      X <- paste0("g", -x)
      isL <- x[1] >= 0
      zk <- if (isL) list(x[1]+1, z[[X[2]]]) else list(z[[X[1]]], x[2]+1)
      attr(zk, "members") <- attr(z[[X[1+isL]]], "members") + 1L
      attr(zk, "midpoint") <-
        (.memberDend(zk[[1]]) + attr(z[[X[1+isL]]], "midpoint"))/2
      attr(zk[[2 - isL]], "members") <- 1L
      attr(zk[[2 - isL]], "height") <- h0
      attr(zk[[2 - isL]], "label") <- mynames[x[2 - isL]+1]
      attr(zk[[2 - isL]], "leaf") <- TRUE
    } else {                            #two nodes
      X <- paste0("g", -x)
      zk <- list(z[[X[1]]], z[[X[2]]])
      attr(zk, "members") <- attr(z[[X[1]]], "members") +
        attr(z[[X[2]]], "members")
      attr(zk, "midpoint") <- (attr(z[[X[1]]], "members") +
                               attr(z[[X[1]]], "midpoint") +
                               attr(z[[X[2]]], "midpoint"))/2
    }
    attr(zk, "height") <- oHgt[k]
    z[[k <- paste0("g", -merges[k,3])]] <- zk
  }
  z <- z[[k]]
  class(z) <- "dendrogram"
  z
}

#' @importFrom stats as.hclust
#' @method as.hclust igraphHRG

as.hclust.igraphHRG <- function(x, ...) {
  merge3 <- buildMerges(x)

  ## We need to rewrite the merge matrix, because hclust assumes
  ## that group ids are assigned in the order of the merges
  map <- order(-merge3[,3])
  
  merge <- merge3[,1:2]
  gs <- which(merge < 0)
  merge[ gs] <- map[ -merge[gs] ]
  merge[-gs] <- -merge[-gs]-1

  ## To get the ordering, we need to recode the merge matrix again,
  ## without using group ids. Here the right node is merged _into_
  ## the left node.
  map2 <- numeric(nrow(merge))
  mergeInto <- merge
  for (i in 1:nrow(merge)) {
    mr <- mergeInto[i,]
    mr[mr > 0] <- -map2[mr[mr>0]]
    mergeInto[i,] <- -mr
    map2[i] <- -mr[1]
  }
  n <- nrow(merge)+1
  hcass <- .C("igraphhcass2", n=as.integer(n),
              ia=as.integer(mergeInto[,1]),
              ib=as.integer(mergeInto[,2]),
              order=integer(n), iia=integer(n), iib=integer(n))

  mynames <- if (is.null(x$names)) 1:n else x$names
  res <- list(merge=merge, height=1:nrow(merge), order=hcass$order,
              labels=mynames, method=NA_character_,
              dist.method=NA_character_)
  class(res) <- "hclust"
  res  
}

#' @method as_phylo igraphHRG
#' @importFrom stats reorder

as_phylo.igraphHRG <- function(x, ...) {

  ovc <- length(x$left)+1L
  ivc <- ovc-1L
  ll <- ifelse(x$left  < 0, -x$left  + ovc, x$left  + 1)
  rr <- ifelse(x$right < 0, -x$right + ovc, x$right + 1)
  edge <- matrix(rbind(seq_len(ivc)+ovc, ll, seq_len(ivc)+ovc, rr),
                 ncol=2, byrow=TRUE)

  edge.length <- rep(0.5, nrow(edge))
  labels <- if (is.null(x$names)) 1:ovc else x$names
  obj <- list(edge=edge, edge.length=edge.length/2, tip.label=labels,
              Nnode=ivc)
  class(obj) <- "phylo"
  reorder(obj)
}



#' HRG dendrogram plot
#' 
#' Plot a hierarchical random graph as a dendrogram.
#' 
#' \code{plot_dendrogram} supports three different plotting functions, selected via
#' the \code{mode} argument. By default the plotting function is taken from the
#' \code{dend.plot.type} igraph option, and it has for possible values:
#' \itemize{ \item \code{auto} Choose automatically between the plotting
#' functions. As \code{plot.phylo} is the most sophisticated, that is choosen,
#' whenever the \code{ape} package is available. Otherwise \code{plot.hclust}
#' is used.  \item \code{phylo} Use \code{plot.phylo} from the \code{ape}
#' package.  \item \code{hclust} Use \code{plot.hclust} from the \code{stats}
#' package.  \item \code{dendrogram} Use \code{plot.dendrogram} from the
#' \code{stats} package.  }
#' 
#' The different plotting functions take different sets of arguments. When
#' using \code{plot.phylo} (\code{mode="phylo"}), we have the following syntax:
#' \preformatted{
#'     plot_dendrogram(x, mode="phylo", colbar = rainbow(11, start=0.7,
#'             end=0.1), edge.color = NULL, use.edge.length = FALSE, \dots)
#' } The extra arguments not documented above: \itemize{
#'   \item \code{colbar} Color bar for the edges.
#'   \item \code{edge.color} Edge colors. If \code{NULL}, then the
#'     \code{colbar} argument is used.
#'   \item \code{use.edge.length} Passed to \code{plot.phylo}.
#'   \item \code{dots} Attitional arguments to pass to \code{plot.phylo}.
#' }
#' 
#' The syntax for \code{plot.hclust} (\code{mode="hclust"}): \preformatted{
#'     plot_dendrogram(x, mode="hclust", rect = 0, colbar = rainbow(rect),
#'             hang = 0.01, ann = FALSE, main = "", sub = "", xlab = "",
#'             ylab = "", \dots)
#' } The extra arguments not documented above: \itemize{
#'   \item \code{rect} A numeric scalar, the number of groups to mark on
#'     the dendrogram. The dendrogram is cut into exactly \code{rect}
#'     groups and they are marked via the \code{rect.hclust} command. Set
#'     this to zero if you don't want to mark any groups.
#'   \item \code{colbar} The colors of the rectangles that mark the
#'     vertex groups via the \code{rect} argument.
#'   \item \code{hang} Where to put the leaf nodes, this corresponds to the
#'     \code{hang} argument of \code{plot.hclust}.
#'   \item \code{ann} Whether to annotate the plot, the \code{ann} argument
#'     of \code{plot.hclust}.
#'   \item \code{main} The main title of the plot, the \code{main} argument
#'     of \code{plot.hclust}.
#'   \item \code{sub} The sub-title of the plot, the \code{sub} argument of
#'     \code{plot.hclust}.
#'   \item \code{xlab} The label on the horizontal axis, passed to
#'     \code{plot.hclust}.
#'   \item \code{ylab} The label on the vertical axis, passed to
#'     \code{plot.hclust}.
#'   \item \code{dots} Attitional arguments to pass to \code{plot.hclust}.
#' }
#' 
#' The syntax for \code{plot.dendrogram} (\code{mode="dendrogram"}):
#' \preformatted{
#'     plot_dendrogram(x, \dots)
#' } The extra arguments are simply passed to \code{as.dendrogram}.
#'
#' @aliases hrg.dendrogram
#' @param x An \code{igraphHRG}, a hierarchical random graph, as returned by
#' the \code{\link{fit_hrg}} function.
#' @param mode Which dendrogram plotting function to use. See details below.
#' @param \dots Additional arguments to supply to the dendrogram plotting
#' function.
#' @return Returns whatever the return value was from the plotting function,
#' \code{plot.phylo}, \code{plot.dendrogram} or \code{plot.hclust}.
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
plot_dendrogram.igraphHRG <- function(x, mode=igraph_opt("dend.plot.type"), ...) {

  if (mode=="auto") {
    have_ape <- requireNamespace("ape", quietly = TRUE)
    mode <- if (have_ape) "phylo" else "hclust"
  }

  if (mode=="hclust") {
    hrgPlotHclust(x, ...)
  } else if (mode=="dendrogram") {
    hrgPlotDendrogram(x, ...)
  } else if (mode=="phylo") {
    hrgPlotPhylo(x, ...)
  }
}

#' @importFrom graphics plot
#' @importFrom grDevices rainbow
#' @importFrom stats rect.hclust

hrgPlotHclust <- function(x, rect=0, colbar=rainbow(rect), hang=.01,
                          ann=FALSE, main="", sub="", xlab="", ylab="",
                          ...) {
  hc <- as.hclust(x)
  ret <- plot(hc, hang=hang, ann=ann, main=main, sub=sub, xlab=xlab,
              ylab=ylab, ...)
  if (rect > 0) {
    rect.hclust(hc, k=rect, border=colbar)
  }
  invisible(ret)
}

#' @importFrom graphics plot

hrgPlotDendrogram <- function(x, ...) {
  plot(as.dendrogram(x), ...)
}

#' @importFrom graphics plot
#' @importFrom grDevices rainbow

hrgPlotPhylo <- function(x, colbar=rainbow(11, start=.7, end=.1),
                         edge.color=NULL, use.edge.length=FALSE, ...) {
  vc <- length(x$left)+1
  phy <- as_phylo(x)
  br <- seq(0,1,length=length(colbar)) ; br[1] <- -1
  cc <- as.integer(cut(x$prob[phy$edge[,1] - vc], breaks=br))
  if (is.null(edge.color)) { edge.color <- colbar[cc] }
  plot(phy, edge.color=edge.color, use.edge.length=use.edge.length, ...)
}

#' Print a hierarchical random graph model to the screen
#'
#' \code{igraphHRG} objects can be printed to the screen in two forms: as
#' a tree or as a list, depending on the \code{type} argument of the
#' print function. By default the \code{auto} type is used, which selects
#' \code{tree} for small graphs and \code{simple} (=list) for bigger
#' ones. The \code{tree} format looks like
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
#' (\sQuote{\code{g1}} in the the printout). Vertex pairs in the left
#' subtree of \code{g1} connect to vertices in the right subtree with
#' probability zero, according to the fitted model. \code{g1} has two
#' subgroups, \code{g15} and \code{g8}. \code{g15} has a subgroup of a
#' single vertex (vertex 1), and another larger subgroup that contains
#' vertices 6, 3, etc. on lower levels, etc.
#' The \code{plain} printing is simpler and faster to produce, but less
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
#' @param x \code{igraphHRG} object to print.
#' @param type How to print the dendrogram, see details below.
#' @param level The number of top levels to print from the dendrogram.
#' @param ... Additional arguments, not used currently.
#' @return The hierarchical random graph model itself, invisibly.
#' 
#' @method print igraphHRG
#' @export
#' @family hierarchical random graph functions

print.igraphHRG <- function(x, type=c("auto", "tree", "plain"),
                            level=3, ...) {

  type <- igraph.match.arg(type)
  if (type=="auto") {
    type <- if (length(x$left <= 100)) "tree" else "plain"
  }
  if (type=="tree") {
    return(print1.igraphHRG(x, level=level, ...))
  } else {
    return(print2.igraphHRG(x, ...))
  }
}

print1.igraphHRG <- function(x, level=3, ...) {
  cat(sep="", "Hierarchical random graph, at level ", level, ":\n")

  ## Depth of printed top of the dendrogram
  .depth <- function(b, l) {
    l[2] <- max(l[2], nchar(format(x$prob[b], digits=2)))
    if (l[1]==level) { return(l) }
    if (x$left[b] < 0 && x$right[b] < 0) {
      l1 <- .depth(-x$left[b], c(l[1]+1, l[2]))
      l2 <- .depth(-x$right[b], c(l[1]+1, l[2]))
      return(pmax(l1,l2))
    }
    if (x$left[b] < 0)  { return(.depth(-x$left[b],  c(l[1]+1, l[2]))) }
    if (x$right[b] < 0) { return(.depth(-x$right[b], c(l[1]+1, l[2]))) }
    return(l)
  }
  cs <- .depth(1, c(1, 0))
  pw <- cs[2]
  cs <- cs[1] * 3
  vw <- nchar(as.character(length(x$left)+1))
  sp <- paste(collapse="", rep(" ", cs+pw+2+2))
  nn <- if (is.null(x$names)) seq_len(length(x$left)+1) else x$names
  
  ## Function to collect all individual vertex children
  .children <- function(b) {
    res <- c()
    if (x$left[b]  < 0) {
      res <- c(res, .children(-x$left[b]))
    } else {
      res <- c(x$left[b]+1, res)
    }
    if (x$right[b] < 0) {
      res <- c(res, .children(-x$right[b]))
    } else {
      res <- c(x$right[b]+1, res)
    }
    return(res)
  }

  ## Recursive printing
  .plot <- function(b, l, ind = "") {
    if (b != 1) {
      he <- format(paste(sep="", ind, "'- g", b), width=cs)
      ind <- paste("  ", ind)
    } else {
      he <- format(paste(sep="", ind, "g", b), width=cs)
    }
    ## whether to go left and/or right
    gol <- x$left[b]  < 0 && l < level
    gor <- x$right[b] < 0 && l < level

    ## the children to print
    ch1 <- character()
    if (!gol && x$left[b] < 0) {
      ch1 <- c(ch1, paste(sep="", "g", -x$left[b]))
    }
    if (!gor && x$right[b] < 0) {
      ch1 <- c(ch1, paste(sep="", "g", -x$right[b]))
    }
    ch2 <- numeric()
    if (!gol) {
      if (x$left[b]  <  0) { ch2 <- c(ch2, .children(-x$left[b])) }
      if (x$left[b]  >= 0) { ch2 <- c(ch2, x$left[b] + 1) }
    }
    if (!gor) {
      if (x$right[b] <  0) { ch2 <- c(ch2, .children(-x$right[b])) }
      if (x$right[b] >= 0) { ch2 <- c(ch2, x$right[b] + 1) }
    }

    ## print this line
    ch2 <- as.character(nn[ch2])
    lf <- gsub(" ", "x", format(ch2, width=vw), fixed=TRUE)
    lf <- paste(collapse=" ", lf)
    lf <- strwrap(lf, width=getOption("width") - cs - pw - 3 - 2)
    lf <- gsub("x", " ", lf, fixed=TRUE)
    if (length(lf) > 1) {
      lf <- c(lf[1], paste(sp, lf[-1]))
      lf <- paste(collapse="\n", lf)
    }
    op <- paste(sep="", format(he, width=cs),
                " p=", format(x$prob[b], digits=2, width=pw, justify="left"),
                "  ", paste(collapse=" ", lf))
    cat(op, fill=TRUE)

    ## recursive call
    if (x$left[b]  < 0 && l < level) .plot(-x$left[b],  l+1, ind)
    if (x$right[b] < 0 && l < level) .plot(-x$right[b], l+1, ind)
  }

  ## Do it
  if (length(x$left) > 0) .plot(b=1, l=1)

  invisible(x)
}

print2.igraphHRG <- function(x, ...) {
  cat("Hierarchical random graph:\n")
  bw <- ceiling(log10(length(x$left)+1))+1
  p <- format(x$prob, digits=1)
  pw <- 4 + max(nchar(p))
  nn <- if (is.null(x$names)) seq_len(length(x$left)+1) else x$names
  op <- sapply(seq_along(x$left), function(i) {
    lc <- if (x$left[i] < 0) {
      paste(sep="", "g", -x$left[i])
    } else {
      nn[x$left[i]+1]
    }
    rc <- if (x$right[i] < 0) {
      paste(sep="", "g", -x$right[i])
    } else {
      nn[x$right[i]+1]
    }
    paste(sep="", format(paste(sep="", "g", i), width=bw),
          format(paste(sep="", " p=", p[i]), width=pw),
          "-> ", lc, " ", rc)
  })
  op <- format(op, justify="left")
  cat(op, sep="   ", fill=TRUE)
  invisible(x)
}

## TODO: print as a tree

#' Print a hierarchical random graph consensus tree to the screen
#'
#' Consensus dendrograms (\code{igraphHRGConsensus} objects) are printed
#' simply by listing the children of each internal node of the
#' dendrogram: \preformatted{HRG consensus tree:
#' g1 -> 11 12 13 14 15 16 17 18 19 20
#' g2 -> 1  2  3  4  5  6  7  8  9  10   
#' g3 -> g1 g2}
#' The root of the dendrogram is \code{g3} (because it has no incoming
#' edges), and it has two subgroups, \code{g1} and \code{g2}.
#'
#' @param x \code{igraphHRGConsensus} object to print.
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
  id <- c(mn, paste(sep="", "g", seq_along(x$weights)))
  ch <- tapply(id, x$parents, c)[-1]   # first is zero
  bw <- nchar(as.character(length(x$weights)))
  vw <- max(nchar(id))
  op <- sapply(seq_along(x$weights), function(i) {
    mych <- format(ch[[i]], width=vw)
    if (length(ch[[i]])*(vw+1) + bw + 4 > getOption("width")) {
      mych <- gsub(" ", "x", mych, fixed=TRUE)
      mych <- paste(collapse=" ", mych)
      pref <- paste(collapse="", rep(" ", bw+5))
      mych <- strwrap(mych, width=getOption("width") - bw - 4,
                      initial="", prefix=pref)
      mych <- gsub("x", " ", mych, fixed=TRUE)
      mych <- paste(collapse="\n", mych)
    } else {
      mych <- paste(collapse=" ", mych)
    }
    paste(sep="", "g", format(i, width=bw), " -> ", mych)
  })
  if (max(nchar(op)) < (getOption("width")-4)/2) {
    op <- format(op, justify="left")
    cat(op, sep="   ", fill=TRUE)
  } else {
    cat(op, sep="\n")
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
