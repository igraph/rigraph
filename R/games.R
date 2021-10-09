
## -----------------------------------------------------------------
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

#' Generate scale-free graphs according to the Barabasi-Albert model
#' 
#' The BA-model is a very simple stochastic algorithm for building a graph.
#' 
#' This is a simple stochastic algorithm to generate a graph. It is a discrete
#' time step model and in each time step a single vertex is added.
#' 
#' We start with a single vertex and no edges in the first time step. Then we
#' add one vertex in each time step and the new vertex initiates some edges to
#' old vertices. The probability that an old vertex is chosen is given by
#' \deqn{P[i] \sim k_i^\alpha+a}{P[i] ~ k[i]^alpha + a} where \eqn{k_i}{k[i]}
#' is the in-degree of vertex \eqn{i} in the current time step (more precisely
#' the number of adjacent edges of \eqn{i} which were not initiated by \eqn{i}
#' itself) and \eqn{\alpha}{alpha} and \eqn{a} are parameters given by the
#' \code{power} and \code{zero.appeal} arguments.
#' 
#' The number of edges initiated in a time step is given by the \code{m},
#' \code{out.dist} and \code{out.seq} arguments. If \code{out.seq} is given and
#' not NULL then it gives the number of edges to add in a vector, the first
#' element is ignored, the second is the number of edges to add in the second
#' time step and so on. If \code{out.seq} is not given or null and
#' \code{out.dist} is given and not NULL then it is used as a discrete
#' distribution to generate the number of edges in each time step. Its first
#' element is the probability that no edges will be added, the second is the
#' probability that one edge is added, etc. (\code{out.dist} does not need to
#' sum up to one, it normalized automatically.) \code{out.dist} should contain
#' non-negative numbers and at east one element should be positive.
#' 
#' If both \code{out.seq} and \code{out.dist} are omitted or NULL then \code{m}
#' will be used, it should be a positive integer constant and \code{m} edges
#' will be added in each time step.
#' 
#' \code{sample_pa} generates a directed graph by default, set
#' \code{directed} to \code{FALSE} to generate an undirected graph. Note that
#' even if an undirected graph is generated \eqn{k_i}{k[i]} denotes the number
#' of adjacent edges not initiated by the vertex itself and not the total (in-
#' + out-) degree of the vertex, unless the \code{out.pref} argument is set to
#' \code{TRUE}.
#' 
#' @aliases sample_pa barabasi.game ba.game
#' @param n Number of vertices.
#' @param power The power of the preferential attachment, the default is one,
#' ie. linear preferential attachment.
#' @param m Numeric constant, the number of edges to add in each time step This
#' argument is only used if both \code{out.dist} and \code{out.seq} are omitted
#' or NULL.
#' @param out.dist Numeric vector, the distribution of the number of edges to
#' add in each time step. This argument is only used if the \code{out.seq}
#' argument is omitted or NULL.
#' @param out.seq Numeric vector giving the number of edges to add in each time
#' step. Its first element is ignored as no edges are added in the first time
#' step.
#' @param out.pref Logical, if true the total degree is used for calculating
#' the citation probability, otherwise the in-degree is used.
#' @param zero.appeal The \sQuote{attractiveness} of the vertices with no
#' adjacent edges. See details below.
#' @param directed Whether to create a directed graph.
#' @param algorithm The algorithm to use for the graph generation.
#' \code{psumtree} uses a partial prefix-sum tree to generate the graph, this
#' algorithm can handle any \code{power} and \code{zero.appeal} values and
#' never generates multiple edges.  \code{psumtree-multiple} also uses a
#' partial prefix-sum tree, but the generation of multiple edges is allowed.
#' Before the 0.6 version igraph used this algorithm if \code{power} was not
#' one, or \code{zero.appeal} was not one.  \code{bag} is the algorithm that
#' was previously (before version 0.6) used if \code{power} was one and
#' \code{zero.appeal} was one as well. It works by putting the ids of the
#' vertices into a bag (multiset, really), exactly as many times as their
#' (in-)degree, plus once more. Then the required number of cited vertices are
#' drawn from the bag, with replacement. This method might generate multiple
#' edges. It only works if \code{power} and \code{zero.appeal} are equal one.
#' @param start.graph \code{NULL} or an igraph graph. If a graph, then the
#' supplied graph is used as a starting graph for the preferential attachment
#' algorithm. The graph should have at least one vertex. If a graph is supplied
#' here and the \code{out.seq} argument is not \code{NULL}, then it should
#' contain the out degrees of the new vertices only, not the ones in the
#' \code{start.graph}.
#' @return A graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{sample_gnp}}
#' @references Barabasi, A.-L. and Albert R. 1999. Emergence of scaling in
#' random networks \emph{Science}, 286 509--512.
#' @export
#' @keywords graphs
#' @examples
#' 
#' g <- sample_pa(10000)
#' degree_distribution(g)
#' 

sample_pa <- function(n, power=1, m=NULL, out.dist=NULL, out.seq=NULL,
                    out.pref=FALSE, zero.appeal=1,
                    directed=TRUE, algorithm=c("psumtree",
                                     "psumtree-multiple", "bag"),
                    start.graph=NULL) {

  if (!is.null(start.graph) && !is_igraph(start.graph)) {
    stop("`start.graph' not an `igraph' object")
  }
  
  # Checks
  if (! is.null(out.seq) && (!is.null(m) || !is.null(out.dist))) {
    warning("if `out.seq' is given `m' and `out.dist' should be NULL")
    m <- out.dist <- NULL
  }
  if (is.null(out.seq) && !is.null(out.dist) && !is.null(m)) {
    warning("if `out.dist' is given `m' will be ignored")
    m <- NULL
  }
  if (!is.null(m) && m==0) {
    warning("`m' is zero, graph will be empty")
  }
  if (power < 0) {
    warning("`power' is negative")
  }
  
  if (is.null(m) && is.null(out.dist) && is.null(out.seq)) {
    m <- 1
  }
  
  n <- as.numeric(n)
  power <- as.numeric(power)
  if (!is.null(m)) { m <- as.numeric(m) }
  if (!is.null(out.dist)) { out.dist <- as.numeric(out.dist) }
  if (!is.null(out.seq)) { out.seq <- as.numeric(out.seq) }
  out.pref <- as.logical(out.pref)

  if (!is.null(out.dist)) {
    nn <- if (is.null(start.graph)) n else n-vcount(start.graph)
    out.seq <- as.numeric(sample(0:(length(out.dist)-1), nn,
                                 replace=TRUE, prob=out.dist))
  }

  if (is.null(out.seq)) {
    out.seq <- numeric()
  }

  algorithm <- igraph.match.arg(algorithm)
  algorithm1 <- switch(algorithm,
                       "psumtree"=1, "psumtree-multiple"=2,
                       "bag"=0)
  
  on.exit( .Call(C_R_igraph_finalizer) )
  res <- .Call(C_R_igraph_barabasi_game, n, power, m, out.seq, out.pref,
               zero.appeal, directed, algorithm1, start.graph)
  
  if (igraph_opt("add.params")) {
    res$name <- "Barabasi graph"
    res$power <- power
    res$m <- m
    res$zero.appeal <- zero.appeal
    res$algorithm <- algorithm
  }

  res
}

#' @rdname sample_pa
#' @param ... Passed to \code{sample_pa}.
#' @export

pa <- function(...) constructor_spec(sample_pa, ...)


## -----------------------------------------------------------------


#' Generate random graphs according to the G(n,p) Erdos-Renyi model
#' 
#' This model is very simple, every possible edge is created with the same
#' constant probability.
#' 
#'
#' The graph has \sQuote{n} vertices and for each edge the
#' probability that it is present in the graph is \sQuote{p}.
#' 
#' @param n The number of vertices in the graph.
#' @param p The probability for drawing an edge between two
#'   arbitrary vertices (G(n,p) graph).
#' @param directed Logical, whether the graph will be directed, defaults to
#'   FALSE.
#' @param loops Logical, whether to add loop edges, defaults to FALSE.
#' @return A graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{sample_gnm}}, \code{\link{sample_pa}}
#' @references Erdos, P. and Renyi, A., On random graphs, \emph{Publicationes
#' Mathematicae} 6, 290--297 (1959).
#' @export
#' @keywords graphs
#' @examples
#' 
#' g <- sample_gnp(1000, 1/1000)
#' degree_distribution(g)

sample_gnp <- function(n, p, directed = FALSE, loops = FALSE) {

  type <- "gnp"
  type1 <- switch(type, "gnp"=0, "gnm"=1)
  
  on.exit( .Call(C_R_igraph_finalizer) )
  res <- .Call(C_R_igraph_erdos_renyi_game, as.numeric(n), as.numeric(type1),
               as.numeric(p), as.logical(directed), as.logical(loops))

  if (igraph_opt("add.params")) {
    res$name <- sprintf("Erdos renyi (%s) graph", type)
    res$type <- type
    res$loops <- loops
    res$p <- p
  }
  res
}

#' @rdname sample_gnp
#' @param ... Passed to \code{sample_app}.
#' @export

gnp <- function(...) constructor_spec(sample_gnp, ...)

## -----------------------------------------------------------------



#' Generate random graphs according to the G(n,m) Erdos-Renyi model
#' 
#' This model is very simple, every possible edge is created with the same
#' constant probability.
#' 
#' The graph has \sQuote{n} vertices and \sQuote{m} edges,
#' and the \sQuote{m} edges are chosen uniformly randomly from the set of all
#' possible edges. This set includes loop edges as well if the \code{loops}
#' parameter is TRUE.
#' 
#' @param n The number of vertices in the graph.
#' @param m The number of edges in the graph.
#' @param directed Logical, whether the graph will be directed, defaults to
#' FALSE.
#' @param loops Logical, whether to add loop edges, defaults to FALSE.
#' @return A graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{sample_gnp}}, \code{\link{sample_pa}}
#' @references Erdos, P. and Renyi, A., On random graphs, \emph{Publicationes
#' Mathematicae} 6, 290--297 (1959).
#' @export
#' @keywords graphs
#' @examples
#' 
#' g <- sample_gnm(1000, 1000)
#' degree_distribution(g)

sample_gnm <- function(n, m, directed = FALSE, loops = FALSE) {

  type <- "gnm"
  type1 <- switch(type, "gnp"=0, "gnm"=1)
  
  on.exit( .Call(C_R_igraph_finalizer) )
  res <- .Call(C_R_igraph_erdos_renyi_game, as.numeric(n), as.numeric(type1),
               as.numeric(m), as.logical(directed), as.logical(loops))

  if (igraph_opt("add.params")) {
    res$name <- sprintf("Erdos renyi (%s) graph", type)
    res$type <- type
    res$loops <- loops
    res$m <- m
  }
  res
}

#' @rdname sample_gnm
#' @param ... Passed to \code{sample_app}.
#' @export

gnm <- function(...) constructor_spec(sample_gnm, ...)

## -----------------------------------------------------------------

#' Generate random graphs according to the Erdos-Renyi model
#' 
#' This model is very simple, every possible edge is created with the same
#' constant probability.
#' 
#' In G(n,p) graphs, the graph has \sQuote{n} vertices and for each edge the
#' probability that it is present in the graph is \sQuote{p}.
#' 
#' In G(n,m) graphs, the graph has \sQuote{n} vertices and \sQuote{m} edges,
#' and the \sQuote{m} edges are chosen uniformly randomly from the set of all
#' possible edges. This set includes loop edges as well if the \code{loops}
#' parameter is TRUE.
#' 
#' \code{random.graph.game} is an alias to this function.
#'
#' @section Deprecated:
#'
#' Since igraph version 0.8.0, both \code{erdos.renyi.game} and
#' \code{random.graph.game} are deprecated, and \code{\link{sample_gnp}} and
#' \code{\link{sample_gnm}} should be used instead.
#' 
#' @aliases erdos.renyi.game random.graph.game
#' @param n The number of vertices in the graph.
#' @param p.or.m Either the probability for drawing an edge between two
#' arbitrary vertices (G(n,p) graph), or the number of edges in the graph (for
#' G(n,m) graphs).
#' @param type The type of the random graph to create, either \code{gnp}
#' (G(n,p) graph) or \code{gnm} (G(n,m) graph).
#' @param directed Logical, whether the graph will be directed, defaults to
#' FALSE.
#' @param loops Logical, whether to add loop edges, defaults to FALSE.
#' @return A graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{sample_pa}}
#' @references Erdos, P. and Renyi, A., On random graphs, \emph{Publicationes
#' Mathematicae} 6, 290--297 (1959).
#' @export
#' @keywords graphs
#' @examples
#' 
#' g <- erdos.renyi.game(1000, 1/1000)
#' degree_distribution(g)
#' 
erdos.renyi.game <- function(n, p.or.m, type=c("gnp", "gnm"),
                             directed=FALSE, loops=FALSE) {

  type <- igraph.match.arg(type)
  type1 <- switch(type, "gnp"=0, "gnm"=1)

  on.exit( .Call(C_R_igraph_finalizer) )
  res <- .Call(C_R_igraph_erdos_renyi_game, as.numeric(n), as.numeric(type1),
               as.numeric(p.or.m), as.logical(directed), as.logical(loops))

  if (igraph_opt("add.params")) {
    res$name <- sprintf("Erdos renyi (%s) graph", type)
    res$type <- type
    res$loops <- loops
    if (type=="gnp") { res$p <- p.or.m }
    if (type=="gnm") { res$m <- p.or.m }
  }
  res
}

#' @export

random.graph.game <- erdos.renyi.game

## -----------------------------------------------------------------

#' Generate random graphs with a given degree sequence
#' 
#' It is often useful to create a graph with given vertex degrees. This is
#' exactly what \code{sample_degseq} does.
#' 
#' The \dQuote{simple} method connects the out-stubs of the edges (undirected
#' graphs) or the out-stubs and in-stubs (directed graphs) together. This way
#' loop edges and also multiple edges may be generated. This method is not
#' adequate if one needs to generate simple graphs with a given degree
#' sequence. The multiple and loop edges can be deleted, but then the degree
#' sequence is distorted and there is nothing to ensure that the graphs are
#' sampled uniformly.
#' 
#' The \dQuote{simple.no.multiple} method is similar to \dQuote{simple}, but
#' tries to avoid multiple and loop edges and restarts the generation from
#' scratch if it gets stuck. It is not guaranteed to sample uniformly from the
#' space of all possible graphs with the given sequence, but it is relatively
#' fast and it will eventually succeed if the provided degree sequence is
#' graphical, but there is no upper bound on the number of iterations.
#' 
#' The \dQuote{vl} method is a more sophisticated generator. The algorithm and
#' the implementation was done by Fabien Viger and Matthieu Latapy. This
#' generator always generates undirected, connected simple graphs, it is an
#' error to pass the \code{in.deg} argument to it.  The algorithm relies on
#' first creating an initial (possibly unconnected) simple undirected graph
#' with the given degree sequence (if this is possible at all). Then some
#' rewiring is done to make the graph connected. Finally a Monte-Carlo
#' algorithm is used to randomize the graph. The \dQuote{vl} samples from the
#' undirected, connected simple graphs uniformly.
#'
#' @aliases degree.sequence.game
#' @param out.deg Numeric vector, the sequence of degrees (for undirected
#' graphs) or out-degrees (for directed graphs). For undirected graphs its sum
#' should be even. For directed graphs its sum should be the same as the sum of
#' \code{in.deg}.
#' @param in.deg For directed graph, the in-degree sequence. By default this is
#' \code{NULL} and an undirected graph is created.
#' @param method Character, the method for generating the graph. Right now the
#' \dQuote{simple}, \dQuote{simple.no.multiple} and \dQuote{vl} methods are
#' implemented.
#' @return The new graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{sample_gnp}}, \code{\link{sample_pa}},
#' \code{\link{simplify}} to get rid of the multiple and/or loops edges.
#' @export
#' @keywords graphs
#' @examples
#' 
#' ## The simple generator
#' g <- sample_degseq(rep(2,100))
#' degree(g)
#' is_simple(g)   # sometimes TRUE, but can be FALSE
#' g2 <- sample_degseq(1:10, 10:1)
#' degree(g2, mode="out")
#' degree(g2, mode="in")
#' 
#' ## The vl generator
#' g3 <- sample_degseq(rep(2,100), method="vl")
#' degree(g3)
#' is_simple(g3)  # always TRUE
#' 
#' ## Exponential degree distribution
#' ## Note, that we correct the degree sequence if its sum is odd
#' degs <- sample(1:100, 100, replace=TRUE, prob=exp(-0.5*(1:100)))
#' if (sum(degs) %% 2 != 0) { degs[1] <- degs[1] + 1 }
#' g4 <- sample_degseq(degs, method="vl")
#' all(degree(g4) == degs)
#' 
#' ## Power-law degree distribution
#' ## Note, that we correct the degree sequence if its sum is odd
#' degs <- sample(1:100, 100, replace=TRUE, prob=(1:100)^-2)
#' if (sum(degs) %% 2 != 0) { degs[1] <- degs[1] + 1 }
#' g5 <- sample_degseq(degs, method="vl")
#' all(degree(g5) == degs)

sample_degseq <- function(out.deg, in.deg=NULL,
                                 method=c("simple", "vl",
                                   "simple.no.multiple")) {

  method <- igraph.match.arg(method)
  method1 <- switch(method, "simple"=0, "vl"=1, "simple.no.multiple"=2)
  if (!is.null(in.deg)) { in.deg <- as.numeric(in.deg) }

  on.exit( .Call(C_R_igraph_finalizer) )
  res <- .Call(C_R_igraph_degree_sequence_game, as.numeric(out.deg),
               in.deg, as.numeric(method1))
  if (igraph_opt("add.params")) {
    res$name <- "Degree sequence random graph"
    res$method <- method
  }
  res
}

#' @rdname sample_degseq
#' @param ... Passed to \code{sample_degree}.
#' @export

degseq <- function(...) constructor_spec(sample_degseq, ...)


## -----------------------------------------------------------------

#' Growing random graph generation
#' 
#' This function creates a random graph by simulating its stochastic evolution.
#' 
#' This is discrete time step model, in each time step a new vertex is added to
#' the graph and \code{m} new edges are created. If \code{citation} is
#' \code{FALSE} these edges are connecting two uniformly randomly chosen
#' vertices, otherwise the edges are connecting new vertex to uniformly
#' randomly chosen old vertices.
#'
#' @aliases growing.random.game
#' @param n Numeric constant, number of vertices in the graph.
#' @param m Numeric constant, number of edges added in each time step.
#' @param directed Logical, whether to create a directed graph.
#' @param citation Logical. If \code{TRUE} a citation graph is created, ie. in
#' each time step the added edges are originating from the new vertex.
#' @return A new graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{sample_pa}}, \code{\link{sample_gnp}}
#' @export
#' @keywords graphs
#' @examples
#' 
#' g <- sample_growing(500, citation=FALSE)
#' g2 <- sample_growing(500, citation=TRUE)
#' 
sample_growing <- function(n, m=1, directed=TRUE, citation=FALSE) {
  on.exit( .Call(C_R_igraph_finalizer) )
  res <- .Call(C_R_igraph_growing_random_game, as.numeric(n), as.numeric(m),
               as.logical(directed), as.logical(citation))
  if (igraph_opt("add.params")) {
    res$name <- "Growing random graph"
    res$m <- m
    res$citation <- citation
  }
  res
}

#' @rdname sample_growing
#' @param ... Passed to \code{sample_app}.
#' @export

growing <- function(...) constructor_spec(sample_growing, ...)

## -----------------------------------------------------------------


#' Generate an evolving random graph with preferential attachment and aging
#' 
#' This function creates a random graph by simulating its evolution. Each time
#' a new vertex is added it creates a number of links to old vertices and the
#' probability that an old vertex is cited depends on its in-degree
#' (preferential attachment) and age.
#' 
#' This is a discrete time step model of a growing graph. We start with a
#' network containing a single vertex (and no edges) in the first time step.
#' Then in each time step (starting with the second) a new vertex is added and
#' it initiates a number of edges to the old vertices in the network. The
#' probability that an old vertex is connected to is proportional to
#' \deqn{P[i] \sim (c\cdot k_i^\alpha+a)(d\cdot l_i^\beta+b)}.
#' 
#' Here \eqn{k_i}{k[i]} is the in-degree of vertex \eqn{i} in the current time
#' step and \eqn{l_i}{l[i]} is the age of vertex \eqn{i}. The age is simply
#' defined as the number of time steps passed since the vertex is added, with
#' the extension that vertex age is divided to be in \code{aging.bin} bins.
#' 
#' \eqn{c}, \eqn{\alpha}{alpha}, \eqn{a}, \eqn{d}, \eqn{\beta}{beta} and
#' \eqn{b} are parameters and they can be set via the following arguments:
#' \code{pa.exp} (\eqn{\alpha}{alpha}, mandatory argument), \code{aging.exp}
#' (\eqn{\beta}{beta}, mandatory argument), \code{zero.deg.appeal} (\eqn{a},
#' optional, the default value is 1), \code{zero.age.appeal} (\eqn{b},
#' optional, the default is 0), \code{deg.coef} (\eqn{c}, optional, the default
#' is 1), and \code{age.coef} (\eqn{d}, optional, the default is 1).
#' 
#' The number of edges initiated in each time step is governed by the \code{m},
#' \code{out.seq} and \code{out.pref} parameters. If \code{out.seq} is given
#' then it is interpreted as a vector giving the number of edges to be added in
#' each time step. It should be of length \code{n} (the number of vertices),
#' and its first element will be ignored. If \code{out.seq} is not given (or
#' NULL) and \code{out.dist} is given then it will be used as a discrete
#' probability distribution to generate the number of edges. Its first element
#' gives the probability that zero edges are added at a time step, the second
#' element is the probability that one edge is added, etc. (\code{out.seq}
#' should contain non-negative numbers, but if they don't sum up to 1, they
#' will be normalized to sum up to 1. This behavior is similar to the
#' \code{prob} argument of the \code{sample} command.)
#' 
#' By default a directed graph is generated, but it \code{directed} is set to
#' \code{FALSE} then an undirected is created. Even if an undirected graph is
#' generated \eqn{k_i}{k[i]} denotes only the adjacent edges not initiated by
#' the vertex itself except if \code{out.pref} is set to \code{TRUE}.
#' 
#' If the \code{time.window} argument is given (and not NULL) then
#' \eqn{k_i}{k[i]} means only the adjacent edges added in the previous
#' \code{time.window} time steps.
#' 
#' This function might generate graphs with multiple edges.
#' 
#' @aliases sample_pa_age aging.prefatt.game aging.barabasi.game aging.ba.game
#' @param n The number of vertices in the graph.
#' @param pa.exp The preferential attachment exponent, see the details below.
#' @param aging.exp The exponent of the aging, usually a non-positive number,
#' see details below.
#' @param m The number of edges each new vertex creates (except the very first
#' vertex). This argument is used only if both the \code{out.dist} and
#' \code{out.seq} arguments are NULL.
#' @param aging.bin The number of bins to use for measuring the age of
#' vertices, see details below.
#' @param out.dist The discrete distribution to generate the number of edges to
#' add in each time step if \code{out.seq} is NULL. See details below.
#' @param out.seq The number of edges to add in each time step, a vector
#' containing as many elements as the number of vertices. See details below.
#' @param out.pref Logical constant, whether to include edges not initiated by
#' the vertex as a basis of preferential attachment. See details below.
#' @param directed Logical constant, whether to generate a directed graph. See
#' details below.
#' @param zero.deg.appeal The degree-dependent part of the
#' \sQuote{attractiveness} of the vertices with no adjacent edges. See also
#' details below.
#' @param zero.age.appeal The age-dependent part of the \sQuote{attrativeness}
#' of the vertices with age zero. It is usually zero, see details below.
#' @param deg.coef The coefficient of the degree-dependent
#' \sQuote{attractiveness}. See details below.
#' @param age.coef The coefficient of the age-dependent part of the
#' \sQuote{attractiveness}. See details below.
#' @param time.window Integer constant, if NULL only adjacent added in the last
#' \code{time.windows} time steps are counted as a basis of the preferential
#' attachment. See also details below.
#' @return A new graph.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{sample_pa}}, \code{\link{sample_gnp}}
#' @export
#' @keywords graphs
#' @examples
#' 
#' # The maximum degree for graph with different aging exponents
#' g1 <- sample_pa_age(10000, pa.exp=1, aging.exp=0, aging.bin=1000)
#' g2 <- sample_pa_age(10000, pa.exp=1, aging.exp=-1,   aging.bin=1000)
#' g3 <- sample_pa_age(10000, pa.exp=1, aging.exp=-3,   aging.bin=1000)
#' max(degree(g1))
#' max(degree(g2))
#' max(degree(g3))

sample_pa_age <- function(n, pa.exp, aging.exp, m=NULL, aging.bin=300,
                               out.dist=NULL, out.seq=NULL,
                               out.pref=FALSE, directed=TRUE,
                               zero.deg.appeal=1, zero.age.appeal=0,
                               deg.coef=1, age.coef=1,
                               time.window=NULL) {
  # Checks
  if (! is.null(out.seq) && (!is.null(m) || !is.null(out.dist))) {
    warning("if `out.seq' is given `m' and `out.dist' should be NULL")
    m <- out.dist <- NULL
  }
  if (is.null(out.seq) && !is.null(out.dist) && !is.null(m)) {
    warning("if `out.dist' is given `m' will be ignored")
    m <- NULL
  }
  if (!is.null(out.seq) && length(out.seq) != n) {
    stop("`out.seq' should be of length `n'")
  }
  if (!is.null(out.seq) && min(out.seq)<0) {
    stop("negative elements in `out.seq'");
  }
  if (!is.null(m) && m<0) {
    stop("`m' is negative")
  }
  if (!is.null(time.window) && time.window <= 0) {
    stop("time window size should be positive")
  }
  if (!is.null(m) && m==0) {
    warning("`m' is zero, graph will be empty")
  }
  if (pa.exp < 0) {
    warning("preferential attachment is negative")
  }
  if (aging.exp > 0) {
    warning("aging exponent is positive")
  }
  if (zero.deg.appeal <=0 ) {
    warning("initial attractiveness is not positive")
  }

  if (is.null(m) && is.null(out.dist) && is.null(out.seq)) {
    m <- 1
  }
  
  n <- as.numeric(n)
  if (!is.null(m)) { m <- as.numeric(m) }
  if (!is.null(out.dist)) { out.dist <- as.numeric(out.dist) }
  if (!is.null(out.seq)) { out.seq <- as.numeric(out.seq) }
  out.pref <- as.logical(out.pref)

  if (!is.null(out.dist)) {
    out.seq <- as.numeric(sample(0:(length(out.dist)-1), n,
                                 replace=TRUE, prob=out.dist))
  }

  if (is.null(out.seq)) {
    out.seq <- numeric()
  }

  on.exit( .Call(C_R_igraph_finalizer) )
  res <- if (is.null(time.window)) {
    .Call(C_R_igraph_barabasi_aging_game, as.numeric(n),
          as.numeric(pa.exp), as.numeric(aging.exp),
          as.numeric(aging.bin), m, out.seq,
          out.pref, as.numeric(zero.deg.appeal), as.numeric(zero.age.appeal),
          as.numeric(deg.coef), as.numeric(age.coef), directed)
  } else {
    .Call(C_R_igraph_recent_degree_aging_game, as.numeric(n),
          as.numeric(pa.exp), as.numeric(aging.exp),
          as.numeric(aging.bin), m, out.seq, out.pref, as.numeric(zero.deg.appeal),
          directed, time.window)
  }
  if (igraph_opt("add.params")) {
    res$name <- "Aging Barabasi graph"
    res$pa.exp <- pa.exp
    res$aging.exp <- aging.exp
    res$m <- m
    res$aging.bin <- aging.bin
    res$out.pref <- out.pref
    res$zero.deg.appeal <- zero.deg.appeal
    res$zero.age.appeal <- zero.age.appeal
    res$deg.coef <- deg.coef
    res$age.coef <- age.coef
    res$time.window <- if (is.null(time.window)) Inf else time.window
  }
  res
}

#' @rdname sample_pa_age
#' @param ... Passed to \code{sample_pa_age}.
#' @export

pa_age <- function(...) constructor_spec(sample_pa_age, ...)

## -----------------------------------------------------------------

#' Graph generation based on different vertex types
#' 
#' These functions implement evolving network models based on different vertex
#' types.
#' 
#' For \code{sample_traits_callaway} the simulation goes like this: in each
#' discrete time step a new vertex is added to the graph. The type of this
#' vertex is generated based on \code{type.dist}. Then two vertices are
#' selected uniformly randomly from the graph. The probability that they will
#' be connected depends on the types of these vertices and is taken from
#' \code{pref.matrix}. Then another two vertices are selected and this is
#' repeated \code{edges.per.step} times in each time step.
#' 
#' For \code{sample_traits} the simulation goes like this: a single vertex is
#' added at each time step. This new vertex tries to connect to \code{k}
#' vertices in the graph. The probability that such a connection is realized
#' depends on the types of the vertices involved and is taken from
#' \code{pref.matrix}.
#' 
#' @aliases sample_traits_callaway sample_traits callaway.traits.game
#' establishment.game
#' @param nodes The number of vertices in the graph.
#' @param types The number of different vertex types.
#' @param edge.per.step The number of edges to add to the graph per time step.
#' @param type.dist The distribution of the vertex types. This is assumed to be
#' stationary in time.
#' @param pref.matrix A matrix giving the preferences of the given vertex
#' types. These should be probabilities, ie. numbers between zero and one.
#' @param directed Logical constant, whether to generate directed graphs.
#' @param k The number of trials per time step, see details below.
#' @return A new graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @export
#' @keywords graphs
#' @examples
#' 
#' # two types of vertices, they like only themselves
#' g1 <- sample_traits_callaway(1000, 2, pref.matrix=matrix( c(1,0,0,1), nc=2))
#' g2 <- sample_traits(1000, 2, k=2, pref.matrix=matrix( c(1,0,0,1), nc=2))

sample_traits_callaway <- function(nodes, types, edge.per.step=1,
                                 type.dist=rep(1, types),
                                 pref.matrix=matrix(1, types, types),
                                 directed=FALSE) {

  on.exit( .Call(C_R_igraph_finalizer) )
  res <- .Call(C_R_igraph_callaway_traits_game, as.double(nodes),
               as.double(types), as.double(edge.per.step),
               as.double(type.dist), matrix(as.double(pref.matrix), types,
                                            types),
               as.logical(directed))
  if (igraph_opt("add.params")) {
    res$name <- "Trait-based Callaway graph"
    res$types <- types
    res$edge.per.step <- edge.per.step
    res$type.dist <- type.dist
    res$pref.matrix <- pref.matrix
  }
  res
}

#' @rdname sample_traits_callaway
#' @param ... Passed to the constructor, \code{sample_traits} or
#'   \code{sample_traits_callaway}.
#' @export

traits_callaway <- function(...) constructor_spec(sample_traits_callaway, ...)

#' @rdname sample_traits_callaway
#' @export

sample_traits <- function(nodes, types, k=1, type.dist=rep(1, types),
                               pref.matrix=matrix(1, types, types),
                               directed=FALSE) {

  on.exit( .Call(C_R_igraph_finalizer) )
  res <- .Call(C_R_igraph_establishment_game, as.double(nodes),
               as.double(types), as.double(k), as.double(type.dist),
               matrix(as.double(pref.matrix), types, types),
               as.logical(directed))
  if (igraph_opt("add.params")) {
    res$name <- "Trait-based growing graph"
    res$types <- types
    res$k <- k
    res$type.dist <- type.dist
    res$pref.matrix <- pref.matrix
  }
  res
}

#' @rdname sample_traits_callaway
#' @export

traits <- function(...) constructor_spec(sample_traits, ...)

## -----------------------------------------------------------------

#' Geometric random graphs
#' 
#' Generate a random graph based on the distance of random point on a unit
#' square
#' 
#' First a number of points are dropped on a unit square, these points
#' correspond to the vertices of the graph to create. Two points will be
#' connected with an undirected edge if they are closer to each other in
#' Euclidean norm than a given radius. If the \code{torus} argument is
#' \code{TRUE} then a unit area torus is used instead of a square.
#'
#' @aliases grg.game
#' @param nodes The number of vertices in the graph.
#' @param radius The radius within which the vertices will be connected by an
#' edge.
#' @param torus Logical constant, whether to use a torus instead of a square.
#' @param coords Logical scalar, whether to add the positions of the vertices
#' as vertex attributes called \sQuote{\code{x}} and \sQuote{\code{y}}.
#' @return A graph object. If \code{coords} is \code{TRUE} then with vertex
#' attributes \sQuote{\code{x}} and \sQuote{\code{y}}.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}, first version was
#' written by Keith Briggs (\url{http://keithbriggs.info/}).
#' @seealso \code{\link{sample_gnp}}
#' @export
#' @keywords graphs
#' @examples
#' 
#' g <- sample_grg(1000, 0.05, torus=FALSE)
#' g2 <- sample_grg(1000, 0.05, torus=TRUE)
#' 
sample_grg <- function(nodes, radius, torus=FALSE, coords=FALSE) {
  on.exit( .Call(C_R_igraph_finalizer) )
  res <- .Call(C_R_igraph_grg_game, as.double(nodes), as.double(radius),
               as.logical(torus), as.logical(coords))
  if (coords) {
    V(res[[1]])$x <- res[[2]]
    V(res[[1]])$y <- res[[3]]
  }
  if (igraph_opt("add.params")) {
    res[[1]]$name <- "Geometric random graph"
    res[[1]]$radius <- radius
    res[[1]]$torus <- torus
  }
  res[[1]]
}

#' @rdname sample_grg
#' @param ... Passed to \code{sample_grg}.
#' @export

grg <- function(...) constructor_spec(sample_grg, ...)

## -----------------------------------------------------------------


#' Trait-based random generation
#' 
#' Generation of random graphs based on different vertex types.
#' 
#' Both models generate random graphs with given vertex types. For
#' \code{sample_pref} the probability that two vertices will be connected
#' depends on their type and is given by the \sQuote{pref.matrix} argument.
#' This matrix should be symmetric to make sense but this is not checked. The
#' distribution of the different vertex types is given by the
#' \sQuote{type.dist} vector.
#' 
#' For \code{sample_asym_pref} each vertex has an in-type and an
#' out-type and a directed graph is created. The probability that a directed
#' edge is realized from a vertex with a given out-type to a vertex with a
#' given in-type is given in the \sQuote{pref.matrix} argument, which can be
#' asymmetric. The joint distribution for the in- and out-types is given in the
#' \sQuote{type.dist.matrix} argument.
#' 
#' @aliases sample_pref sample_asym_pref preference.game asymmetric.preference.game
#' @param nodes The number of vertices in the graphs.
#' @param types The number of different vertex types.
#' @param type.dist The distribution of the vertex types, a numeric vector of
#' length \sQuote{types} containing non-negative numbers. The vector will be
#' normed to obtain probabilities.
#' @param fixed.sizes Fix the number of vertices with a given vertex type
#' label. The \code{type.dist} argument gives the group sizes (i.e. number of
#' vertices with the different labels) in this case.
#' @param type.dist.matrix The joint distribution of the in- and out-vertex
#' types.
#' @param pref.matrix A square matrix giving the preferences of the vertex
#' types. The matrix has \sQuote{types} rows and columns.
#' @param directed Logical constant, whether to create a directed graph.
#' @param loops Logical constant, whether self-loops are allowed in the graph.
#' @return An igraph graph.
#' @author Tamas Nepusz \email{ntamas@@gmail.com} and Gabor Csardi
#' \email{csardi.gabor@@gmail.com} for the R interface
#' @seealso \code{\link{sample_traits}}.
#' \code{\link{sample_traits_callaway}}
#' @export
#' @keywords graphs
#' @examples
#' 
#' pf <- matrix( c(1, 0, 0, 1), nr=2)
#' g <- sample_pref(20, 2, pref.matrix=pf)
#' \dontrun{tkplot(g, layout=layout_with_fr)}
#' 
#' pf <- matrix( c(0, 1, 0, 0), nr=2)
#' g <- sample_asym_pref(20, 2, pref.matrix=pf)
#' \dontrun{tkplot(g, layout=layout_in_circle)}
#' 
sample_pref <- function(nodes, types, type.dist=rep(1, types),
                            fixed.sizes=FALSE,
                            pref.matrix=matrix(1, types, types),
                            directed=FALSE, loops=FALSE) {

  if (nrow(pref.matrix) != types || ncol(pref.matrix) != types) {
    stop("Invalid size for preference matrix")
  }
  
  on.exit( .Call(C_R_igraph_finalizer) )
  res <- .Call(C_R_igraph_preference_game, as.double(nodes),
               as.double(types),
               as.double(type.dist), as.logical(fixed.sizes),
               matrix(as.double(pref.matrix), types, types),
               as.logical(directed), as.logical(loops))
  V(res[[1]])$type <- res[[2]]+1
  if (igraph_opt("add.params")) {
    res[[1]]$name <- "Preference random graph"
    res[[1]]$types <- types
    res[[1]]$type.dist <- type.dist
    res[[1]]$fixed.sizes <- fixed.sizes
    res[[1]]$pref.matrix <- pref.matrix
    res[[1]]$loops <- loops
  }
  res[[1]]
}

#' @rdname sample_pref
#' @param ... Passed to the constructor, \code{sample_pref} or
#'   \code{sample_asym_pref}.
#' @export

pref <- function(...) constructor_spec(sample_pref, ...)

#' @rdname sample_pref
#' @export

sample_asym_pref <- function(nodes, types,
                        type.dist.matrix=matrix(1, types,types),
                        pref.matrix=matrix(1, types, types),
                        loops=FALSE) {
  
  if (nrow(pref.matrix) != types || ncol(pref.matrix) != types) {
    stop("Invalid size for preference matrix")
  }
  if (nrow(type.dist.matrix) != types || ncol(type.dist.matrix) != types) {
    stop("Invalid size for type distribution matrix")
  }
  
  on.exit( .Call(C_R_igraph_finalizer) )
  res <- .Call(C_R_igraph_asymmetric_preference_game,
               as.double(nodes), as.double(types),
               matrix(as.double(type.dist.matrix), types, types),
               matrix(as.double(pref.matrix), types, types),
               as.logical(loops))
  if (igraph_opt("add.params")) {
    res$name <- "Asymmetric preference random graph"
    res$types <- types
    res$type.dist.matrix <- type.dist.matrix
    res$pref.matrix <- pref.matrix
    res$loops <- loops
  }

  res
}

#' @rdname sample_pref
#' @export

asym_pref <- function(...) constructor_spec(sample_asym_pref, ...)

## -----------------------------------------------------------------


connect <- function(graph, order, mode=c("all", "out", "in", "total")) {
  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  mode <- igraph.match.arg(mode)
  mode <- switch(mode, "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(C_R_igraph_finalizer) )
  .Call(C_R_igraph_connect_neighborhood, graph, as.numeric(order),
        as.numeric(mode))
}


#' The Watts-Strogatz small-world model
#' 
#' Generate a graph according to the Watts-Strogatz network model.
#' 
#' First a lattice is created with the given \code{dim}, \code{size} and
#' \code{nei} arguments. Then the edges of the lattice are rewired uniformly
#' randomly with probability \code{p}.
#' 
#' Note that this function might create graphs with loops and/or multiple
#' edges. You can use \code{\link{simplify}} to get rid of these.
#'
#' @aliases watts.strogatz.game
#' @param dim Integer constant, the dimension of the starting lattice.
#' @param size Integer constant, the size of the lattice along each dimension.
#' @param nei Integer constant, the neighborhood within which the vertices of
#' the lattice will be connected.
#' @param p Real constant between zero and one, the rewiring probability.
#' @param loops Logical scalar, whether loops edges are allowed in the
#' generated graph.
#' @param multiple Logical scalar, whether multiple edges are allowed int the
#' generated graph.
#' @return A graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{make_lattice}}, \code{\link{rewire}}
#' @references Duncan J Watts and Steven H Strogatz: Collective dynamics of
#' \sQuote{small world} networks, Nature 393, 440-442, 1998.
#' @export
#' @keywords graphs
#' @examples
#' 
#' g <- sample_smallworld(1, 100, 5, 0.05)
#' mean_distance(g)
#' transitivity(g, type="average")
#' 
sample_smallworld <- function(dim, size, nei, p, loops=FALSE,
                                multiple=FALSE) {
  
  on.exit( .Call(C_R_igraph_finalizer) )
  res <- .Call(C_R_igraph_watts_strogatz_game, as.numeric(dim),
               as.numeric(size), as.numeric(nei), as.numeric(p),
               as.logical(loops), as.logical(multiple))
  if (igraph_opt("add.params")) {
    res$name <- "Watts-Strogatz random graph"
    res$dim <- dim
    res$size <- size
    res$nei <- nei
    res$p <- p
    res$loops <- loops
    res$multiple <- multiple
  }
  res
}

#' @rdname sample_smallworld
#' @param ... Passed to \code{sample_smallworld}.
#' @export

smallworld <- function(...) constructor_spec(sample_smallworld, ...)

## -----------------------------------------------------------------

#' Random citation graphs
#' 
#' \code{sample_last_cit} creates a graph, where vertices age, and
#' gain new connections based on how long ago their last citation
#' happened.
#'
#' \code{sample_cit_cit_types} is a stochastic block model where the
#' graph is growing.
#'
#' \code{sample_cit_types} is similarly a growing stochastic block model,
#' but the probability of an edge depends on the (potentially) cited
#' vertex only.
#' 
#' @aliases cited.type.game sample_cit_types citing.cited.type.game
#' sample_cit_cit_types sample_last_cit lastcit.game
#' @param n Number of vertices.
#' @param edges Number of edges per step.
#' @param agebins Number of aging bins.
#' @param pref Vector (\code{sample_last_cit} and \code{sample_cit_types} or
#' matrix (\code{sample_cit_cit_types}) giving the (unnormalized) citation
#' probabilities for the different vertex types.
#' @param directed Logical scalar, whether to generate directed networks.
#' @param types Vector of length \sQuote{\code{n}}, the types of the vertices.
#' Types are numbered from zero.
#' @param attr Logical scalar, whether to add the vertex types to the generated
#' graph as a vertex attribute called \sQuote{\code{type}}.
#' @return A new graph.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @keywords graphs
#' @export

sample_last_cit <- function(n, edges=1, agebins=n/7100, pref=(1:(agebins+1))^-3,
                       directed=TRUE) {
  on.exit( .Call(C_R_igraph_finalizer) )
  res <- .Call(C_R_igraph_lastcit_game, as.numeric(n), as.numeric(edges),
               as.numeric(agebins),
               as.numeric(pref), as.logical(directed))
  if (igraph_opt("add.params")) {
    res$name <- "Random citation graph based on last citation"
    res$edges <- edges
    res$agebins <- agebins
  }
  res
}

#' @rdname sample_last_cit
#' @param ... Passed to the actual constructor.
#' @export

last_cit <- function(...) constructor_spec(sample_last_cit, ...)

#' @rdname sample_last_cit
#' @export

sample_cit_types <- function(n, edges=1, types=rep(0, n),
                            pref=rep(1, length(types)),
                            directed=TRUE, attr=TRUE) {
  on.exit( .Call(C_R_igraph_finalizer) )
  res <- .Call(C_R_igraph_cited_type_game, as.numeric(n), as.numeric(edges),
               as.numeric(types), as.numeric(pref), as.logical(directed))
  if (attr) {
    V(res)$type <- types
  }
  if (igraph_opt("add.params")) {
    res$name <- "Random citation graph (cited type)"
    res$edges <- edges
  }
  res
}

#' @rdname sample_last_cit
#' @export

cit_types <- function(...) constructor_spec(sample_cit_types, ...)

#' @rdname sample_last_cit
#' @export

sample_cit_cit_types <- function(n, edges=1, types=rep(0, n),
                                   pref=matrix(1, nrow=length(types),
                                     ncol=length(types)),
                                   directed=TRUE, attr=TRUE) {
  pref <- structure(as.numeric(pref), dim=dim(pref))
  on.exit( .Call(C_R_igraph_finalizer) )
  res <- .Call(C_R_igraph_citing_cited_type_game, as.numeric(n),
               as.numeric(types), pref, as.numeric(edges),
               as.logical(directed))
  if (attr) {
    V(res)$type <- types
  }
  if (igraph_opt("add.params")) {
    res$name <- "Random citation graph (citing & cited type)"
    res$edges <- edges
  }
  res
}

#' @rdname sample_last_cit
#' @export

cit_cit_types <- function(...) constructor_spec(sample_cit_cit_types, ...)

## -----------------------------------------------------------------


#' Bipartite random graphs
#' 
#' Generate bipartite graphs using the Erdos-Renyi model
#' 
#' Similarly to unipartite (one-mode) networks, we can define the $G(n,p)$, and
#' $G(n,m)$ graph classes for bipartite graphs, via their generating process.
#' In $G(n,p)$ every possible edge between top and bottom vertices is realized
#' with probability $p$, independently of the rest of the edges. In $G(n,m)$, we
#' uniformly choose $m$ edges to realize.
#'
#' @aliases bipartite.random.game
#' @param n1 Integer scalar, the number of bottom vertices.
#' @param n2 Integer scalar, the number of top vertices.
#' @param type Character scalar, the type of the graph, \sQuote{gnp} creates a
#' $G(n,p)$ graph, \sQuote{gnm} creates a $G(n,m)$ graph. See details below.
#' @param p Real scalar, connection probability for $G(n,p)$ graphs. Should not
#' be given for $G(n,m)$ graphs.
#' @param m Integer scalar, the number of edges for $G(n,p)$ graphs. Should not
#' be given for $G(n,p)$ graphs.
#' @param directed Logical scalar, whether to create a directed graph. See also
#' the \code{mode} argument.
#' @param mode Character scalar, specifies how to direct the edges in directed
#' graphs. If it is \sQuote{out}, then directed edges point from bottom
#' vertices to top vertices. If it is \sQuote{in}, edges point from top
#' vertices to bottom vertices. \sQuote{out} and \sQuote{in} do not generate
#' mutual edges. If this argument is \sQuote{all}, then each edge direction is
#' considered independently and mutual edges might be generated. This argument
#' is ignored for undirected graphs.
#' @return A bipartite igraph graph.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{sample_gnp}} for the unipartite version.
#' @export
#' @keywords graphs
#' @examples
#' 
#' ## empty graph
#' sample_bipartite(10, 5, p=0)
#' 
#' ## full graph
#' sample_bipartite(10, 5, p=1)
#' 
#' ## random bipartite graph
#' sample_bipartite(10, 5, p=.1)
#' 
#' ## directed bipartite graph, G(n,m)
#' sample_bipartite(10, 5, type="Gnm", m=20, directed=TRUE, mode="all")
#' 
sample_bipartite <- function(n1, n2, type=c("gnp", "gnm"), p, m,
                     directed=FALSE, mode=c("out", "in", "all")) {
  
  n1 <- as.integer(n1)
  n2 <- as.integer(n2)
  type <- igraph.match.arg(type)
  if (!missing(p)) { p <- as.numeric(p) }
  if (!missing(m)) { m <- as.integer(m) }
  directed <- as.logical(directed)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3)

  if (type=="gnp" && missing(p)) {
    stop("Connection probability `p' is not given for Gnp graph")
  }
  if (type=="gnp" && !missing(m)) {
    warning("Number of edges `m' is ignored for Gnp graph")
  }
  if (type=="gnm" && missing(m)) {
    stop("Number of edges `m' is not given for Gnm graph")
  }
  if (type=="gnm" && !missing(p)) {
    warning("Connection probability `p' is ignored for Gnp graph")
  }
  
  on.exit( .Call(C_R_igraph_finalizer) )
  if (type=="gnp") {      
    res <- .Call(C_R_igraph_bipartite_game_gnp, n1, n2, p, directed, mode)
    res <- set_vertex_attr(res$graph, "type", value=res$types)
    res$name <- "Bipartite Gnp random graph"
    res$p <- p
  } else if (type=="gnm") {
    res <- .Call(C_R_igraph_bipartite_game_gnm, n1, n2, m, directed, mode)
    res <- set_vertex_attr(res$graph, "type", value=res$types)
    res$name <- "Bipartite Gnm random graph"
    res$m <- m
  }

  res
}

#' @rdname sample_bipartite
#' @param ... Passed to \code{sample_bipartite}.
#' @export

bipartite <- function(...) constructor_spec(sample_bipartite, ...)


#' Sample stochastic block model
#' 
#' Sampling from the stochastic block model of networks
#' 
#' This function samples graphs from a stochastic block model by (doing the
#' equivalent of) Bernoulli trials for each potential edge with the
#' probabilities given by the Bernoulli rate matrix, \code{pref.matrix}.
#' 
#' @aliases sample_sbm sbm.game sbm
#' @param n Number of vertices in the graph.
#' @param pref.matrix The matrix giving the Bernoulli rates.  This is a
#' \eqn{K\times K}{KxK} matrix, where \eqn{K} is the number of groups. The
#' probability of creating an edge between vertices from groups \eqn{i} and
#' \eqn{j} is given by element \eqn{(i,j)}. For undirected graphs, this matrix
#' must be symmetric.
#' @param block.sizes Numeric vector giving the number of vertices in each
#' group. The sum of the vector must match the number of vertices.
#' @param directed Logical scalar, whether to generate a directed graph.
#' @param loops Logical scalar, whether self-loops are allowed in the graph.
#' @return An igraph graph.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{sample_gnp}}, \code{\link{sample_gnm}}
#' @references Faust, K., & Wasserman, S. (1992a). Blockmodels: Interpretation
#' and evaluation. \emph{Social Networks}, 14, 5--61.
#' @keywords graphs
#' @examples
#' 
#' ## Two groups with not only few connection between groups
#' pm <- cbind( c(.1, .001), c(.001, .05) )
#' g <- sample_sbm(1000, pref.matrix=pm, block.sizes=c(300,700))
#' g
#' @export

sample_sbm <- sample_sbm

#' @rdname sample_sbm
#' @param ... Passed to \code{sample_sbm}.
#' @export

sbm <- function(...) constructor_spec(sample_sbm, ...)

## -----------------------------------------------------------------

#' Sample the hierarchical stochastic block model
#' 
#' Sampling from a hierarchical stochastic block model of networks.
#' 
#' The function generates a random graph according to the hierarchical
#' stochastic block model.
#' 
#' @aliases sample_hierarchical_sbm hierarchical_sbm
#' @param n Integer scalar, the number of vertices.
#' @param m Integer scalar, the number of vertices per block. \code{n / m} must
#' be integer. Alternatively, an integer vector of block sizes, if not all the
#' blocks have equal sizes.
#' @param rho Numeric vector, the fraction of vertices per cluster, within a
#' block. Must sum up to 1, and \code{rho * m} must be integer for all elements
#' of rho. Alternatively a list of rho vectors, one for each block, if they are
#' not the same for all blocks.
#' @param C A square, symmetric numeric matrix, the Bernoulli rates for the
#' clusters within a block. Its size must mach the size of the \code{rho}
#' vector. Alternatively, a list of square matrices, if the Bernoulli rates
#' differ in different blocks.
#' @param p Numeric scalar, the Bernoulli rate of connections between vertices
#' in different blocks.
#' @return An igraph graph.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{sbm.game}}
#' @keywords graphs
#' @examples
#' 
#' ## Ten blocks with three clusters each
#' C <- matrix(c(1  , 3/4,   0,
#'               3/4,   0, 3/4,
#'               0  , 3/4, 3/4), nrow=3)
#' g <- sample_hierarchical_sbm(100, 10, rho=c(3, 3, 4)/10, C=C, p=1/20)
#' g
#' if (require(Matrix)) { image(g[]) }
#' @export

sample_hierarchical_sbm <- function(n, m, rho, C, p) {

  mlen <- length(m)
  rholen <- if (is.list(rho)) length(rho) else 1
  Clen <- if (is.list(C)) length(C) else 1

  commonlen <- unique(c(mlen, rholen, Clen))

  if (length(commonlen) == 1 && commonlen == 1) {
    hsbm.1.game(n, m, rho, C, p)
  } else {
    commonlen <- setdiff(commonlen, 1)
    if (length(commonlen) != 1) {
      stop("Lengths of `m', `rho' and `C' must match")
    }
    m <- rep(m, length.out=commonlen)
    rho <- if (is.list(rho)) {
      rep(rho, length.out=commonlen)
    } else {
      rep(list(rho), length.out=commonlen)
    }
    C <- if (is.list(C)) {
      rep(C, length.out=commonlen)
    } else {
      rep(list(C), length.out=commonlen)
    }
    hsbm.list.game(n, m, rho, C, p)
  }  
}

#' @rdname sample_hierarchical_sbm
#' @param ... Passed to \code{sample_hierarchical_sbm}.
#' @export

hierarchical_sbm <- function(...)
  constructor_spec(sample_hierarchical_sbm, ...)

## -----------------------------------------------------------------


#' Generate random graphs according to the random dot product graph model
#' 
#' In this model, each vertex is represented by a latent position vector.
#' Probability of an edge between two vertices are given by the dot product of
#' their latent position vectors.
#' 
#' The dot product of the latent position vectors should be in the [0,1]
#' interval, otherwise a warning is given. For negative dot products, no edges
#' are added; dot products that are larger than one always add an edge.
#' 
#' @aliases sample_dot_product dot_product
#' @param vecs A numeric matrix in which each latent position vector is a
#' column.
#' @param directed A logical scalar, TRUE if the generated graph should be
#' directed.
#' @return An igraph graph object which is the generated random dot product
#' graph.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{sample_dirichlet}}, \code{\link{sample_sphere_surface}}
#' and \code{\link{sample_sphere_volume}} for sampling position vectors.
#' @references Christine Leigh Myers Nickel: Random dot product graphs, a model
#' for social networks. Dissertation, Johns Hopkins University, Maryland, USA,
#' 2006.
#' @keywords graphs
#' @examples
#' 
#' ## A randomly generated  graph
#' lpvs <- matrix(rnorm(200), 20, 10)
#' lpvs <- apply(lpvs, 2, function(x) { return (abs(x)/sqrt(sum(x^2))) })
#' g <- sample_dot_product(lpvs)
#' g
#' 
#' ## Sample latent vectors from the surface of the unit sphere
#' lpvs2 <- sample_sphere_surface(dim=5, n=20)
#' g2 <- sample_dot_product(lpvs2)
#' g2
#' @export

sample_dot_product <- sample_dot_product

#' @rdname sample_dot_product
#' @param ... Passed to \code{sample_dot_product}.
#' @export

dot_product <- function(...) constructor_spec(sample_dot_product, ...)


#' A graph with subgraphs that are each a random graph.
#' 
#' Create a number of Erdos-Renyi random graphs with identical parameters, and
#' connect them with the specified number of edges.
#'
#' @section Examples:
#' \preformatted{
#' g <- sample_islands(3, 10, 5/10, 1)
#' oc <- cluster_optimal(g)
#' oc
#' }
#' 
#' @aliases interconnected.islands.game sample_islands
#' @param islands.n The number of islands in the graph.
#' @param islands.size The size of islands in the graph.
#' @param islands.pin The probability to create each possible edge into each
#' island.
#' @param n.inter The number of edges to create between two islands.
#' @return An igraph graph.
#' @author Samuel Thiriot
#' @seealso \code{\link{sample_gnp}}
#' @keywords graphs
#' @export

sample_islands <- sample_islands


#' Create a random regular graph
#' 
#' Generate a random graph where each vertex has the same degree.
#' 
#' This game generates a directed or undirected random graph where the degrees
#' of vertices are equal to a predefined constant k. For undirected graphs, at
#' least one of k and the number of vertices must be even.
#' 
#' The game simply uses \code{\link{sample_degseq}} with appropriately
#' constructed degree sequences.
#' 
#' @aliases sample_k_regular k.regular.game
#' @param no.of.nodes Integer scalar, the number of vertices in the generated
#' graph.
#' @param k Integer scalar, the degree of each vertex in the graph, or the
#' out-degree and in-degree in a directed graph.
#' @param directed Logical scalar, whether to create a directed graph.
#' @param multiple Logical scalar, whether multiple edges are allowed.
#' @return An igraph graph.
#' @author Tamas Nepusz \email{ntamas@@gmail.com}
#' @seealso \code{\link{sample_degseq}} for a generator with prescribed degree
#' sequence.
#' @keywords graphs
#' @examples
#' 
#' ## A simple ring
#' ring <- sample_k_regular(10, 2)
#' plot(ring)
#' 
#' ## k-regular graphs on 10 vertices, with k=1:9
#' k10 <- lapply(1:9, sample_k_regular, no.of.nodes=10)
#' 
#' layout(matrix(1:9, nrow=3, byrow=TRUE))
#' sapply(k10, plot, vertex.label=NA)
#' @export

sample_k_regular <- sample_k_regular


#' Random graphs from vertex fitness scores
#' 
#' This function generates a non-growing random graph with edge probabilities
#' proportional to node fitness scores.
#' 
#' This game generates a directed or undirected random graph where the
#' probability of an edge between vertices \eqn{i} and \eqn{j} depends on the
#' fitness scores of the two vertices involved. For undirected graphs, each
#' vertex has a single fitness score. For directed graphs, each vertex has an
#' out- and an in-fitness, and the probability of an edge from \eqn{i} to
#' \eqn{j} depends on the out-fitness of vertex \eqn{i} and the in-fitness of
#' vertex \eqn{j}.
#' 
#' The generation process goes as follows. We start from \eqn{N} disconnected
#' nodes (where \eqn{N} is given by the length of the fitness vector). Then we
#' randomly select two vertices \eqn{i} and \eqn{j}, with probabilities
#' proportional to their fitnesses. (When the generated graph is directed,
#' \eqn{i} is selected according to the out-fitnesses and \eqn{j} is selected
#' according to the in-fitnesses). If the vertices are not connected yet (or if
#' multiple edges are allowed), we connect them; otherwise we select a new
#' pair. This is repeated until the desired number of links are created.
#' 
#' It can be shown that the \emph{expected} degree of each vertex will be
#' proportional to its fitness, although the actual, observed degree will not
#' be. If you need to generate a graph with an exact degree sequence, consider
#' \code{\link{sample_degseq}} instead.
#' 
#' This model is commonly used to generate static scale-free networks. To
#' achieve this, you have to draw the fitness scores from the desired power-law
#' distribution. Alternatively, you may use \code{\link{sample_fitness_pl}}
#' which generates the fitnesses for you with a given exponent.
#' 
#' @aliases sample_fitness static.fitness.game
#' @param no.of.edges The number of edges in the generated graph.
#' @param fitness.out A numeric vector containing the fitness of each vertex.
#' For directed graphs, this specifies the out-fitness of each vertex.
#' @param fitness.in If \code{NULL} (the default), the generated graph will be
#' undirected. If not \code{NULL}, then it should be a numeric vector and it
#' specifies the in-fitness of each vertex.
#' 
#' If this argument is not \code{NULL}, then a directed graph is generated,
#' otherwise an undirected one.
#' @param loops Logical scalar, whether to allow loop edges in the graph.
#' @param multiple Logical scalar, whether to allow multiple edges in the
#' graph.
#' @return An igraph graph, directed or undirected.
#' @author Tamas Nepusz \email{ntamas@@gmail.com}
#' @references Goh K-I, Kahng B, Kim D: Universal behaviour of load
#' distribution in scale-free networks. \emph{Phys Rev Lett} 87(27):278701,
#' 2001.
#' @keywords graphs
#' @examples
#' 
#' N <- 10000
#' g <- sample_fitness(5*N, sample((1:50)^-2, N, replace=TRUE))
#' degree_distribution(g)
#' \dontrun{plot(degree_distribution(g, cumulative=TRUE), log="xy")}

sample_fitness <- sample_fitness


#' Scale-free random graphs, from vertex fitness scores
#' 
#' This function generates a non-growing random graph with expected power-law
#' degree distributions.
#' 
#' This game generates a directed or undirected random graph where the degrees
#' of vertices follow power-law distributions with prescribed exponents. For
#' directed graphs, the exponents of the in- and out-degree distributions may
#' be specified separately.
#' 
#' The game simply uses \code{\link{sample_fitness}} with appropriately
#' constructed fitness vectors. In particular, the fitness of vertex \eqn{i} is
#' \eqn{i^{-alpha}}{i^(-alpha)}, where \eqn{alpha = 1/(gamma-1)} and gamma is
#' the exponent given in the arguments.
#' 
#' To remove correlations between in- and out-degrees in case of directed
#' graphs, the in-fitness vector will be shuffled after it has been set up and
#' before \code{\link{sample_fitness}} is called.
#' 
#' Note that significant finite size effects may be observed for exponents
#' smaller than 3 in the original formulation of the game. This function
#' provides an argument that lets you remove the finite size effects by
#' assuming that the fitness of vertex \eqn{i} is
#' \eqn{(i+i_0-1)^{-alpha}}{(i+i0-1)^(-alpha)} where \eqn{i_0}{i0} is a
#' constant chosen appropriately to ensure that the maximum degree is less than
#' the square root of the number of edges times the average degree; see the
#' paper of Chung and Lu, and Cho et al for more details.
#' 
#' @aliases sample_fitness_pl static.power.law.game
#' @param no.of.nodes The number of vertices in the generated graph.
#' @param no.of.edges The number of edges in the generated graph.
#' @param exponent.out Numeric scalar, the power law exponent of the degree
#' distribution. For directed graphs, this specifies the exponent of the
#' out-degree distribution. It must be greater than or equal to 2. If you pass
#' \code{Inf} here, you will get back an Erdos-Renyi random network.
#' @param exponent.in Numeric scalar. If negative, the generated graph will be
#' undirected. If greater than or equal to 2, this argument specifies the
#' exponent of the in-degree distribution. If non-negative but less than 2, an
#' error will be generated.
#' @param loops Logical scalar, whether to allow loop edges in the generated
#' graph.
#' @param multiple Logical scalar, whether to allow multiple edges in the
#' generated graph.
#' @param finite.size.correction Logical scalar, whether to use the proposed
#' finite size correction of Cho et al., see references below.
#' @return An igraph graph, directed or undirected.
#' @author Tamas Nepusz \email{ntamas@@gmail.com}
#' @references Goh K-I, Kahng B, Kim D: Universal behaviour of load
#' distribution in scale-free networks. \emph{Phys Rev Lett} 87(27):278701,
#' 2001.
#' 
#' Chung F and Lu L: Connected components in a random graph with given degree
#' sequences. \emph{Annals of Combinatorics} 6, 125-145, 2002.
#' 
#' Cho YS, Kim JS, Park J, Kahng B, Kim D: Percolation transitions in
#' scale-free networks under the Achlioptas process. \emph{Phys Rev Lett}
#' 103:135702, 2009.
#' @keywords graphs
#' @examples
#' 
#' g <- sample_fitness_pl(10000, 30000, 2.2, 2.3)
#' \dontrun{plot(degree_distribution(g, cumulative=TRUE, mode="out"), log="xy")}

sample_fitness_pl <- sample_fitness_pl


#' Forest Fire Network Model
#' 
#' This is a growing network model, which resembles of how the forest fire
#' spreads by igniting trees close by.
#' 
#' The forest fire model intends to reproduce the following network
#' characteristics, observed in real networks: \itemize{ \item Heavy-tailed
#' in-degree distribution.  \item Heavy-tailed out-degree distribution.  \item
#' Communities.  \item Densification power-law. The network is densifying in
#' time, according to a power-law rule.  \item Shrinking diameter. The diameter
#' of the network decreases in time.  }
#' 
#' The network is generated in the following way. One vertex is added at a
#' time. This vertex connects to (cites) \code{ambs} vertices already present
#' in the network, chosen uniformly random. Now, for each cited vertex \eqn{v}
#' we do the following procedure: \enumerate{ \item We generate two random
#' number, \eqn{x} and \eqn{y}, that are geometrically distributed with means
#' \eqn{p/(1-p)} and \eqn{rp(1-rp)}. (\eqn{p} is \code{fw.prob}, \eqn{r} is
#' \code{bw.factor}.) The new vertex cites \eqn{x} outgoing neighbors and
#' \eqn{y} incoming neighbors of \eqn{v}, from those which are not yet cited by
#' the new vertex. If there are less than \eqn{x} or \eqn{y} such vertices
#' available then we cite all of them.  \item The same procedure is applied to
#' all the newly cited vertices.  }
#' 
#' @aliases sample_forestfire forest.fire.game
#' @param nodes The number of vertices in the graph.
#' @param fw.prob The forward burning probability, see details below.
#' @param bw.factor The backward burning ratio. The backward burning
#' probability is calculated as \code{bw.factor*fw.prob}.
#' @param ambs The number of ambassador vertices.
#' @param directed Logical scalar, whether to create a directed graph.
#' @return A simple graph, possibly directed if the \code{directed} argument is
#' \code{TRUE}.
#' @note The version of the model in the published paper is incorrect in the
#' sense that it cannot generate the kind of graphs the authors claim. A
#' corrected version is available from
#' \url{http://www.cs.cmu.edu/~jure/pubs/powergrowth-tkdd.pdf}, our
#' implementation is based on this.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{barabasi.game}} for the basic preferential attachment
#' model.
#' @references Jure Leskovec, Jon Kleinberg and Christos Faloutsos. Graphs over
#' time: densification laws, shrinking diameters and possible explanations.
#' \emph{KDD '05: Proceeding of the eleventh ACM SIGKDD international
#' conference on Knowledge discovery in data mining}, 177--187, 2005.
#' @keywords graphs
#' @examples
#' 
#' g <- sample_forestfire(10000, fw.prob=0.37, bw.factor=0.32/0.37)
#' dd1 <- degree_distribution(g, mode="in")
#' dd2 <- degree_distribution(g, mode="out")
#' plot(seq(along=dd1)-1, dd1, log="xy")
#' points(seq(along=dd2)-1, dd2, col=2, pch=2)

sample_forestfire <- sample_forestfire


#' Generate a new random graph from a given graph by randomly
#' adding/removing edges
#' 
#' Sample a new graph by perturbing the adjacency matrix of a given graph
#' and shuffling its vertices.
#' 
#' Please see the reference given below.
#' 
#' @param old.graph The original graph.
#' @param corr A scalar in the unit interval, the target Pearson
#' correlation between the adjacency matrices of the original the generated
#' graph (the adjacency matrix being used as a vector).
#' @param p A numeric scalar, the probability of an edge between two
#' vertices, it must in the open (0,1) interval.
#' @param permutation A numeric vector, a permutation vector that is
#' applied on the vertices of the first graph, to get the second graph.  If
#' \code{NULL}, the vertices are not permuted.
#' @return An unweighted graph of the same size as \code{old.graph} such
#' that the correlation coefficient between the entries of the two
#' adjacency matrices is \code{corr}.  Note each pair of corresponding
#' matrix entries is a pair of correlated Bernoulli random variables.
#' 
#' @seealso \code{\link{sample_correlated_gnp_pair}},
#'   \code{\link{sample_gnp}}
#' @references Lyzinski, V., Fishkind, D. E., Priebe, C. E. (2013).  Seeded
#' graph matching for correlated Erdos-Renyi graphs.
#' \url{https://arxiv.org/abs/1304.7844}
#' @examples
#' g <- sample_gnp(1000, .1)
#' g2 <- sample_correlated_gnp(g, corr = 0.5)
#' cor(as.vector(g[]), as.vector(g2[]))
#' g
#' g2

sample_correlated_gnp <- sample_correlated_gnp


#' Sample a pair of correlated G(n,p) random graphs
#' 
#' Sample a new graph by perturbing the adjacency matrix of a given graph and
#' shuffling its vertices.
#' 
#' Please see the reference given below.
#' 
#' @param n Numeric scalar, the number of vertices for the sampled graphs.
#' @param corr A scalar in the unit interval, the target Pearson correlation
#' between the adjacency matrices of the original the generated graph (the
#' adjacency matrix being used as a vector).
#' @param p A numeric scalar, the probability of an edge between two vertices,
#' it must in the open (0,1) interval.
#' @param directed Logical scalar, whether to generate directed graphs.
#' @param permutation A numeric vector, a permutation vector that is applied on
#' the vertices of the first graph, to get the second graph.  If \code{NULL},
#' the vertices are not permuted.
#' @return A list of two igraph objects, named \code{graph1} and
#' \code{graph2}, which are two graphs whose adjacency matrix entries are
#' correlated with \code{corr}.
#' 
#' @seealso \code{\link{sample_correlated_gnp}},
#'   \code{\link{sample_gnp}}.
#' @references Lyzinski, V., Fishkind, D. E., Priebe, C. E. (2013).  Seeded
#' graph matching for correlated Erdos-Renyi graphs.
#' \url{https://arxiv.org/abs/1304.7844}
#' @keywords graphs
#' @examples
#' gg <- sample_correlated_gnp_pair(n = 10, corr = .8, p = .5,
#'            directed = FALSE)
#' gg
#' cor(as.vector(gg[[1]][]), as.vector(gg[[2]][]))

sample_correlated_gnp_pair <- sample_correlated_gnp_pair
