#   IGraph R package
#   Copyright (C) 2005-2012  Gabor Csardi <csardi.gabor@gmail.com>
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

#' @rdname arpack
#' @export

arpack_defaults <- list(bmat="I", n=0, which="XX", nev=1, tol=0.0,
                              ncv=3, ldv=0, ishift=1, maxiter=1000, nb=1,
                              mode=1, start=0, sigma=0.0, sigmai=0.0)

#' ARPACK eigenvector calculation
#' 
#' Interface to the ARPACK library for calculating eigenvectors of sparse
#' matrices
#' 
#' ARPACK is a library for solving large scale eigenvalue problems.  The
#' package is designed to compute a few eigenvalues and corresponding
#' eigenvectors of a general \eqn{n} by \eqn{n} matrix \eqn{A}. It is most
#' appropriate for large sparse or structured matrices \eqn{A} where structured
#' means that a matrix-vector product \code{w <- Av} requires order \eqn{n}
#' rather than the usual order \eqn{n^2} floating point operations. Please see
#' \url{http://www.caam.rice.edu/software/ARPACK/} for details.
#' 
#' This function is an interface to ARPACK. igraph does not contain all ARPACK
#' routines, only the ones dealing with symmetric and non-symmetric eigenvalue
#' problems using double precision real numbers.
#' 
#' The eigenvalue calculation in ARPACK (in the simplest case) involves the
#' calculation of the \eqn{Av} product where \eqn{A} is the matrix we work with
#' and \eqn{v} is an arbitrary vector. The function supplied in the \code{fun}
#' argument is expected to perform this product. If the product can be done
#' efficiently, e.g. if the matrix is sparse, then \code{arpack} is usually
#' able to calculate the eigenvalues very quickly.
#' 
#' The \code{options} argument specifies what kind of calculation to perform.
#' It is a list with the following members, they correspond directly to ARPACK
#' parameters. On input it has the following fields: \describe{
#' \item{bmat}{Character constant, possible values: \sQuote{\code{I}}, standard
#' eigenvalue problem, \eqn{Ax=\lambda x}{A*x=lambda*x}; and \sQuote{\code{G}},
#' generalized eigenvalue problem, \eqn{Ax=\lambda B x}{A*x=lambda B*x}.
#' Currently only \sQuote{\code{I}} is supported.} \item{n}{Numeric scalar. The
#' dimension of the eigenproblem. You only need to set this if you call
#' \code{\link{arpack}} directly. (I.e. not needed for
#' \code{\link{eigen_centrality}}, \code{\link{page_rank}}, etc.)}
#' \item{which}{Specify which eigenvalues/vectors to compute, character
#' constant with exactly two characters.
#' 
#' Possible values for symmetric input matrices: \describe{
#' \item{"LA"}{Compute \code{nev} largest (algebraic) eigenvalues.}
#' \item{"SA"}{Compute \code{nev} smallest (algebraic)
#' eigenvalues.} \item{"LM"}{Compute \code{nev} largest (in
#' magnitude) eigenvalues.} \item{"SM"}{Compute \code{nev} smallest
#' (in magnitude) eigenvalues.} \item{"BE"}{Compute \code{nev}
#' eigenvalues, half from each end of the spectrum. When \code{nev} is odd,
#' compute one more from the high end than from the low end.} }
#' 
#' Possible values for non-symmetric input matrices: \describe{
#' \item{"LM"}{Compute \code{nev} eigenvalues of largest
#' magnitude.} \item{"SM"}{Compute \code{nev} eigenvalues of
#' smallest magnitude.} \item{"LR"}{Compute \code{nev} eigenvalues
#' of largest real part.} \item{"SR"}{Compute \code{nev}
#' eigenvalues of smallest real part.} \item{"LI"}{Compute
#' \code{nev} eigenvalues of largest imaginary part.}
#' \item{"SI"}{Compute \code{nev} eigenvalues of smallest imaginary
#' part.} }
#' 
#' This parameter is sometimes overwritten by the various functions, e.g.
#' \code{\link{page_rank}} always sets \sQuote{\code{LM}}.  }
#' \item{nev}{Numeric scalar. The number of eigenvalues to be computed.}
#' \item{tol}{Numeric scalar. Stopping criterion: the relative accuracy of the
#' Ritz value is considered acceptable if its error is less than \code{tol}
#' times its estimated value. If this is set to zero then machine precision is
#' used.} \item{ncv}{Number of Lanczos vectors to be generated.}
#' \item{ldv}{Numberic scalar. It should be set to zero in the current
#' implementation.} \item{ishift}{Either zero or one. If zero then the shifts
#' are provided by the user via reverse communication. If one then exact shifts
#' with respect to the reduced tridiagonal matrix \eqn{T}.  Please always set
#' this to one.} \item{maxiter}{Maximum number of Arnoldi update iterations
#' allowed. } \item{nb}{Blocksize to be used in the recurrence. Please always
#' leave this on the default value, one.} \item{mode}{The type of the
#' eigenproblem to be solved.  Possible values if the input matrix is
#' symmetric: \describe{ \item{1}{\eqn{Ax=\lambda x}{A*x=lambda*x}, \eqn{A} is
#' symmetric.} \item{2}{\eqn{Ax=\lambda Mx}{A*x=lambda*M*x}, \eqn{A} is
#' symmetric, \eqn{M} is symmetric positive definite.} \item{3}{\eqn{Kx=\lambda
#' Mx}{K*x=lambda*M*x}, \eqn{K} is symmetric, \eqn{M} is symmetric positive
#' semi-definite.} \item{4}{\eqn{Kx=\lambda KGx}{K*x=lambda*KG*x}, \eqn{K} is
#' symmetric positive semi-definite, \eqn{KG} is symmetric indefinite.}
#' \item{5}{\eqn{Ax=\lambda Mx}{A*x=lambda*M*x}, \eqn{A} is symmetric, \eqn{M}
#' is symmetric positive semi-definite. (Cayley transformed mode.)} } Please
#' note that only \code{mode==1} was tested and other values might not work
#' properly.
#' 
#' Possible values if the input matrix is not symmetric: \describe{
#' \item{1}{\eqn{Ax=\lambda x}{A*x=lambda*x}.} \item{2}{\eqn{Ax=\lambda
#' Mx}{A*x=lambda*M*x}, \eqn{M} is symmetric positive definite.}
#' \item{3}{\eqn{Ax=\lambda Mx}{A*x=lambda*M*x}, \eqn{M} is symmetric
#' semi-definite.} \item{4}{\eqn{Ax=\lambda Mx}{A*x=lambda*M*x}, \eqn{M} is
#' symmetric semi-definite.} } Please note that only \code{mode==1} was tested
#' and other values might not work properly.  } \item{start}{Not used
#' currently. Later it be used to set a starting vector.} \item{sigma}{Not used
#' currently.} \item{sigmai}{Not use currently.}
#' 
#' On output the following additional fields are added: \describe{
#' \item{info}{Error flag of ARPACK. Possible values: \describe{
#' \item{0}{Normal exit.} \item{1}{Maximum number of iterations taken.}
#' \item{3}{No shifts could be applied during a cycle of the Implicitly
#' restarted Arnoldi iteration. One possibility is to increase the size of
#' \code{ncv} relative to \code{nev}.} }
#' 
#' ARPACK can return more error conditions than these, but they are converted
#' to regular igraph errors.  } \item{iter}{Number of Arnoldi iterations
#' taken.} \item{nconv}{Number of \dQuote{converged} Ritz values. This
#' represents the number of Ritz values that satisfy the convergence critetion.
#' } \item{numop}{Total number of matrix-vector multiplications.}
#' \item{numopb}{Not used currently.} \item{numreo}{Total number of steps of
#' re-orthogonalization.} } } Please see the ARPACK documentation for
#' additional details.
#' 
#' @aliases arpack arpack-options igraph.arpack.default arpack.unpack.complex
#' arpack_defaults
#' @param func The function to perform the matrix-vector multiplication. ARPACK
#' requires to perform these by the user. The function gets the vector \eqn{x}
#' as the first argument, and it should return \eqn{Ax}, where \eqn{A} is the
#' \dQuote{input matrix}. (The input matrix is never given explicitly.) The
#' second argument is \code{extra}.
#' @param extra Extra argument to supply to \code{func}.
#' @param sym Logical scalar, whether the input matrix is symmetric. Always
#' supply \code{TRUE} here if it is, since it can speed up the computation.
#' @param options Options to ARPACK, a named list to overwrite some of the
#' default option values. See details below.
#' @param env The environment in which \code{func} will be evaluated.
#' @param complex Whether to convert the eigenvectors returned by ARPACK into R
#' complex vectors. By default this is not done for symmetric problems (these
#' only have real eigenvectors/values), but only non-symmetric ones. If you
#' have a non-symmetric problem, but you're sure that the results will be real,
#' then supply \code{FALSE} here.
#' @return A named list with the following members: \item{values}{Numeric
#' vector, the desired eigenvalues.} \item{vectors}{Numeric matrix, the desired
#' eigenvectors as columns. If \code{complex=TRUE} (the default for
#' non-symmetric problems), then the matrix is complex.} \item{options}{A named
#' list with the supplied \code{options} and some information about the
#' performed calculation, including an ARPACK exit code. See the details above.
#' }
#' @author Rich Lehoucq, Kristi Maschhoff, Danny Sorensen, Chao Yang for
#' ARPACK, Gabor Csardi \email{csardi.gabor@@gmail.com} for the R interface.
#' @seealso \code{\link{eigen_centrality}}, \code{\link{page_rank}},
#' \code{\link{hub_score}}, \code{\link{cluster_leading_eigen}} are some of the
#' functions in igraph which use ARPACK. The ARPACK homepage is at
#' \url{http://www.caam.rice.edu/software/ARPACK/}.
#' @references D.C. Sorensen, Implicit Application of Polynomial Filters in a
#' k-Step Arnoldi Method. \emph{SIAM J. Matr. Anal. Apps.}, 13 (1992), pp
#' 357-385.
#' 
#' R.B. Lehoucq, Analysis and Implementation of an Implicitly Restarted Arnoldi
#' Iteration. \emph{Rice University Technical Report} TR95-13, Department of
#' Computational and Applied Mathematics.
#' 
#' B.N. Parlett & Y. Saad, Complex Shift and Invert Strategies for Real
#' Matrices. \emph{Linear Algebra and its Applications}, vol 88/89, pp 575-595,
#' (1987).
#' @keywords graphs
#' @examples
#' 
#' # Identity matrix
#' f <- function(x, extra=NULL) x
#' arpack(f, options=list(n=10, nev=2, ncv=4), sym=TRUE)
#' 
#' # Graph laplacian of a star graph (undirected), n>=2
#' # Note that this is a linear operation
#' f <- function(x, extra=NULL) {
#'   y <- x
#'   y[1] <- (length(x)-1)*x[1] - sum(x[-1])
#'   for (i in 2:length(x)) {
#'     y[i] <- x[i] - x[1]
#'   }
#'   y
#' }
#' 
#' arpack(f, options=list(n=10, nev=1, ncv=3), sym=TRUE)
#' 
#' # double check
#' eigen(laplacian_matrix(make_star(10, mode="undirected")))
#' 
#' ## First three eigenvalues of the adjacency matrix of a graph
#' ## We need the 'Matrix' package for this
#' if (require(Matrix)) {
#'   set.seed(42)
#'   g <- sample_gnp(1000, 5/1000)
#'   M <- as_adj(g, sparse=TRUE)
#'   f2 <- function(x, extra=NULL) { cat("."); as.vector(M %*% x) }
#'   baev <- arpack(f2, sym=TRUE, options=list(n=vcount(g), nev=3, ncv=8,
#'                                   which="LM", maxiter=2000))
#' }
#' @export

arpack <- function(func, extra=NULL, sym=FALSE, options=arpack_defaults,
                   env=parent.frame(), complex=!sym) {

  if (!is.list(options) ||
      (is.null(names(options)) && length(options) != 0)) {
    stop("options must be a named list")
  }
  if (any(names(options) == "")) {
    stop("all options must be named")
  }
  if (any(! names(options) %in% names(arpack_defaults))) {
    stop("unkown ARPACK option(s): ",
         paste(setdiff(names(options), names(arpack_defaults)),
                       collapse=", "))
  }
  
  options.tmp <- arpack_defaults
  options.tmp[ names(options) ] <- options
  options <- options.tmp

  if (sym && complex) {
    complex <- FALSE
    warning("Symmetric matrix, setting `complex' to FALSE")
  }
  
  on.exit( .Call(C_R_igraph_finalizer) )
  res <- .Call(C_R_igraph_arpack, func, extra, options, env, sym)

  if (complex) {
    rew <- arpack.unpack.complex(res$vectors, res$values,
                                 min(res$options$nev, res$options$nconv))
    res$vectors <- rew$vectors
    res$values <- rew$values

    res$values <- apply(res$values, 1, function(x) x[1]+x[2]*1i)
    dim(res$vectors) <- c(nrow(res$vectors)*2, ncol(res$vectors)/2)
    res$vectors <- apply(res$vectors, 2, function(x) {
      l <- length(x)/2
      x[1:l] + x[(l+1):length(x)]*1i
    })
  } else {
    if (is.matrix(res$values)) {
      if (!all(res$values[,2]==0)) {
        warning("Dropping imaginary parts of eigenvalues")
      }
      res$values <- res$values[,1]
    }
    res$vectors <- res$vectors[,1:length(res$values)]
  }
  
  res
}

arpack.unpack.complex <- function(vectors, values, nev) {
  # Argument checks
  vectors <- as.matrix(structure(as.double(vectors), dim=dim(vectors)))
  values <- as.matrix(structure(as.double(values), dim=dim(values)))
  nev <- as.integer(nev)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_arpack_unpack_complex, vectors, values, nev)

  res
}



#' Find subgraph centrality scores of network positions
#' 
#' Subgraph centrality of a vertex measures the number of subgraphs a vertex
#' participates in, weighting them according to their size.
#' 
#' The subgraph centrality of a vertex is defined as the number of closed loops
#' originating at the vertex, where longer loops are exponentially
#' downweighted.
#' 
#' Currently the calculation is performed by explicitly calculating all
#' eigenvalues and eigenvectors of the adjacency matrix of the graph. This
#' effectively means that the measure can only be calculated for small graphs.
#'
#' @aliases subgraph.centrality
#' @param graph The input graph, it should be undirected, but the
#' implementation does not check this currently.
#' @param diag Boolean scalar, whether to include the diagonal of the adjacency
#' matrix in the analysis. Giving \code{FALSE} here effectively eliminates the
#' loops edges from the graph before the calculation.
#' @return A numeric vector, the subgraph centrality scores of the vertices.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com} based on the Matlab
#' code by Ernesto Estrada
#' @seealso \code{\link{eigen_centrality}}, \code{\link{page_rank}}
#' @references Ernesto Estrada, Juan A. Rodriguez-Velazquez: Subgraph
#' centrality in Complex Networks. \emph{Physical Review E} 71, 056103 (2005).
#' @export
#' @keywords graphs
#' @examples
#' 
#' g <- sample_pa(100, m=4, dir=FALSE)
#' sc <- subgraph_centrality(g)
#' cor(degree(g), sc)
#' 
subgraph_centrality <- function(graph, diag=FALSE) {
  A <- as_adj(graph)
  if (!diag) { diag(A) <- 0 }
  eig <- eigen(A)
  res <- as.vector(eig$vectors^2 %*% exp(eig$values))
  if (igraph_opt("add.vertex.names") && is_named(graph)) { 
    names(res) <- vertex_attr(graph, "name") 
  }
  res
}


#' Eigenvalues and eigenvectors of the adjacency matrix of a graph
#' 
#' Calculate selected eigenvalues and eigenvectors of a (supposedly sparse)
#' graph.
#' 
#' The \code{which} argument is a list and it specifies which eigenvalues and
#' corresponding eigenvectors to calculate: There are eight options:
#' \enumerate{ \item Eigenvalues with the largest magnitude. Set \code{pos} to
#' \code{LM}, and \code{howmany} to the number of eigenvalues you want.  \item
#' Eigenvalues with the smallest magnitude. Set \code{pos} to \code{SM} and
#' \code{howmany} to the number of eigenvalues you want.  \item Largest
#' eigenvalues. Set \code{pos} to \code{LA} and \code{howmany} to the number of
#' eigenvalues you want.  \item Smallest eigenvalues. Set \code{pos} to
#' \code{SA} and \code{howmany} to the number of eigenvalues you want.  \item
#' Eigenvalues from both ends of the spectrum. Set \code{pos} to \code{BE} and
#' \code{howmany} to the number of eigenvalues you want. If \code{howmany} is
#' odd, then one more eigenvalue is returned from the larger end.  \item
#' Selected eigenvalues. This is not (yet) implemented currently.  \item
#' Eigenvalues in an interval. This is not (yet) implemented.  \item All
#' eigenvalues. This is not implemented yet. The standard \code{eigen} function
#' does a better job at this, anyway.  }
#' 
#' Note that ARPACK might be unstable for graphs with multiple components, e.g.
#' graphs with isolate vertices.
#' 
#' @aliases graph.eigen spectrum igraph.eigen.default
#' @param graph The input graph, can be directed or undirected.
#' @param algorithm The algorithm to use. Currently only \code{arpack} is
#' implemented, which uses the ARPACK solver. See also \code{\link{arpack}}.
#' @param which A list to specify which eigenvalues and eigenvectors to
#' calculate. By default the leading (i.e. largest magnitude) eigenvalue and
#' the corresponding eigenvector is calculated.
#' @param options Options for the ARPACK solver. See
#' \code{\link{arpack_defaults}}.
#' @return Depends on the algorithm used.
#' 
#' For \code{arpack} a list with three entries is returned: \item{options}{See
#' the return value for \code{arpack} for a complete description.}
#' \item{values}{Numeric vector, the eigenvalues.} \item{vectors}{Numeric
#' matrix, with the eigenvectors as columns.}
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{as_adj}} to create a (sparse) adjacency matrix.
#' @keywords graphs
#' @examples
#' 
#' ## Small example graph, leading eigenvector by default
#' kite <- make_graph("Krackhardt_kite")
#' spectrum(kite)[c("values", "vectors")]
#' 
#' ## Double check
#' eigen(as_adj(kite, sparse=FALSE))$vectors[,1]
#' 
#' ## Should be the same as 'eigen_centrality' (but rescaled)
#' cor(eigen_centrality(kite)$vector, spectrum(kite)$vectors)
#' 
#' ## Smallest eigenvalues
#' spectrum(kite, which=list(pos="SM", howmany=2))$values
#' 
#' @export
#' @include auto.R

spectrum <- spectrum

eigen_defaults <- list(pos="LM", howmany=1L, il=-1L, iu=-1L,
                             vl=-Inf, vu=Inf, vestimate=0L,
                             balance="none")

#' Find Eigenvector Centrality Scores of Network Positions
#' 
#' \code{eigen_centrality} takes a graph (\code{graph}) and returns the
#' eigenvector centralities of positions \code{v} within it
#' 
#' Eigenvector centrality scores correspond to the values of the first
#' eigenvector of the graph adjacency matrix; these scores may, in turn, be
#' interpreted as arising from a reciprocal process in which the centrality of
#' each actor is proportional to the sum of the centralities of those actors to
#' whom he or she is connected.  In general, vertices with high eigenvector
#' centralities are those which are connected to many other vertices which are,
#' in turn, connected to many others (and so on).  (The perceptive may realize
#' that this implies that the largest values will be obtained by individuals in
#' large cliques (or high-density substructures).  This is also intelligible
#' from an algebraic point of view, with the first eigenvector being closely
#' related to the best rank-1 approximation of the adjacency matrix (a
#' relationship which is easy to see in the special case of a diagonalizable
#' symmetric real matrix via the \eqn{SLS^-1}{$S \Lambda S^{-1}$}
#' decomposition).)
#' 
#' From igraph version 0.5 this function uses ARPACK for the underlying
#' computation, see \code{\link{arpack}} for more about ARPACK in igraph.
#' 
#' @aliases evcent eigen_centrality
#' @param graph Graph to be analyzed.
#' @param directed Logical scalar, whether to consider direction of the edges
#' in directed graphs. It is ignored for undirected graphs.
#' @param scale Logical scalar, whether to scale the result to have a maximum
#' score of one. If no scaling is used then the result vector has unit length
#' in the Euclidean norm.
#' @param weights A numerical vector or \code{NULL}. This argument can be used
#' to give edge weights for calculating the weighted eigenvector centrality of
#' vertices. If this is \code{NULL} and the graph has a \code{weight} edge
#' attribute then that is used. If \code{weights} is a numerical vector then it
#' used, even if the graph has a \code{weight} edge attribute. If this is
#' \code{NA}, then no edge weights are used (even if the graph has a
#' \code{weight} edge attribute. Note that if there are negative edge weights
#' and the direction of the edges is considered, then the eigenvector might be
#' complex. In this case only the real part is reported.
#' This function interprets weights as connection strength. Higher
#' weights spread the centrality better.
#' @param options A named list, to override some ARPACK options. See
#' \code{\link{arpack}} for details.
#' @return A named list with components: \item{vector}{A vector containing the
#' centrality scores.} \item{value}{The eigenvalue corresponding to the
#' calculated eigenvector, i.e. the centrality scores.} \item{options}{A named
#' list, information about the underlying ARPACK computation. See
#' \code{\link{arpack}} for the details.  }
#' @section WARNING : \code{eigen_centrality} will not symmetrize your data
#' before extracting eigenvectors; don't send this routine asymmetric matrices
#' unless you really mean to do so.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com} and Carter T. Butts
#' (\url{http://www.faculty.uci.edu/profile.cfm?faculty_id=5057}) for the
#' manual page.
#' @references Bonacich, P.  (1987).  Power and Centrality: A Family of
#' Measures. \emph{American Journal of Sociology}, 92, 1170-1182.
#' @keywords graphs
#' @examples
#' 
#' #Generate some test data
#' g <- make_ring(10, directed=FALSE)
#' #Compute eigenvector centrality scores
#' eigen_centrality(g)
#' @export

eigen_centrality <- eigen_centrality


#' Strength or weighted vertex degree
#' 
#' Summing up the edge weights of the adjacent edges for each vertex.
#' 
#' 
#' @aliases graph.strength strength
#' @param graph The input graph.
#' @param vids The vertices for which the strength will be calculated.
#' @param mode Character string, \dQuote{out} for out-degree, \dQuote{in} for
#' in-degree or \dQuote{all} for the sum of the two. For undirected graphs this
#' argument is ignored.
#' @param loops Logical; whether the loop edges are also counted.
#' @param weights Weight vector. If the graph has a \code{weight} edge
#' attribute, then this is used by default. If the graph does not have a
#' \code{weight} edge attribute and this argument is \code{NULL}, then a
#' warning is given and \code{\link{degree}} is called.
#' @return A numeric vector giving the strength of the vertices.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{degree}} for the unweighted version.
#' @references Alain Barrat, Marc Barthelemy, Romualdo Pastor-Satorras,
#' Alessandro Vespignani: The architecture of complex weighted networks, Proc.
#' Natl. Acad. Sci. USA 101, 3747 (2004)
#' @keywords graphs
#' @examples
#' 
#' g <- make_star(10)
#' E(g)$weight <- seq(ecount(g))
#' strength(g)
#' strength(g, mode="out")
#' strength(g, mode="in")
#' 
#' # No weights, a warning is given
#' g <- make_ring(10)
#' strength(g)
#' @export

strength <- strength


#' Graph diversity
#' 
#' Calculates a measure of diversity for all vertices.
#' 
#' The diversity of a vertex is defined as the (scaled) Shannon entropy of the
#' weights of its incident edges:
#' \deqn{D(i)=\frac{H(i)}{\log k_i}}{D(i)=H(i)/log(k[i])}
#' and
#' \deqn{H(i)=-\sum_{j=1}^{k_i} p_{ij}\log p_{ij},}{H(i) =
#'   -sum(p[i,j] log(p[i,j]), j=1..k[i]),} where
#' \deqn{p_{ij}=\frac{w_{ij}}{\sum_{l=1}^{k_i}}V_{il},}{p[i,j] = w[i,j] /
#' sum(w[i,l], l=1..k[i]),} and \eqn{k_i}{k[i]} is the (total) degree of vertex
#' \eqn{i}, \eqn{w_{ij}}{w[i,j]} is the weight of the edge(s) between vertices
#' \eqn{i} and \eqn{j}.
#' 
#' For vertices with degree less than two the function returns \code{NaN}.
#' 
#' @aliases graph.diversity diversity
#' @param graph The input graph. Edge directions are ignored.
#' @param weights \code{NULL}, or the vector of edge weights to use for the
#' computation. If \code{NULL}, then the \sQuote{weight} attibute is used. Note
#' that this measure is not defined for unweighted graphs.
#' @param vids The vertex ids for which to calculate the measure.
#' @return A numeric vector, its length is the number of vertices.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @references Nathan Eagle, Michael Macy and Rob Claxton: Network Diversity
#' and Economic Development, \emph{Science} \bold{328}, 1029--1031, 2010.
#' @keywords graphs
#' @examples
#' 
#' g1 <- sample_gnp(20, 2/20)
#' g2 <- sample_gnp(20, 2/20)
#' g3 <- sample_gnp(20, 5/20)
#' E(g1)$weight <- 1
#' E(g2)$weight <- runif(ecount(g2))
#' E(g3)$weight <- runif(ecount(g3))
#' diversity(g1)
#' diversity(g2)
#' diversity(g3)
#' @export

diversity <- diversity


#' Kleinberg's hub centrality scores.
#' 
#' The hub scores of the vertices are defined as the principal eigenvector
#' of \eqn{A A^T}{A*t(A)}, where \eqn{A} is the adjacency matrix of the
#' graph.
#' 
#' For undirected matrices the adjacency matrix is symmetric and the hub
#' scores are the same as authority scores, see
#' \code{\link{authority_score}}.
#' 
#' @aliases hub.score
#' @param graph The input graph.
#' @param scale Logical scalar, whether to scale the result to have a maximum
#' score of one. If no scaling is used then the result vector has unit length
#' in the Euclidean norm.
#' @param weights Optional positive weight vector for calculating weighted
#' scores. If the graph has a \code{weight} edge attribute, then this is used
#' by default.
#' This function interprets edge weights as connection strengths. In the
#' random surfer model, an edge with a larger weight is more likely to be
#' selected by the surfer.
#' @param options A named list, to override some ARPACK options. See
#' \code{\link{arpack}} for details.
#' @return A named list with members:
#'   \item{vector}{The authority/hub scores of the vertices.}
#'   \item{value}{The corresponding eigenvalue of the calculated
#'     principal eigenvector.}
#'   \item{options}{Some information about the ARPACK computation, it has
#'     the same members as the \code{options} member returned 
#'     by \code{\link{arpack}}, see that for documentation.}
#' @seealso \code{\link{authority_score}},
#' \code{\link{eigen_centrality}} for eigenvector centrality,
#' \code{\link{page_rank}} for the Page Rank scores. \code{\link{arpack}} for
#' the underlining machinery of the computation.
#' @references J. Kleinberg. Authoritative sources in a hyperlinked
#' environment. \emph{Proc. 9th ACM-SIAM Symposium on Discrete Algorithms},
#' 1998. Extended version in \emph{Journal of the ACM} 46(1999). Also appears
#' as IBM Research Report RJ 10076, May 1997.
#' @examples
#' ## An in-star
#' g <- make_star(10)
#' hub_score(g)$vector
#' 
#' ## A ring
#' g2 <- make_ring(10)
#' hub_score(g2)$vector

hub_score <- hub_score


#' Kleinberg's authority centrality scores.
#' 
#' The authority scores of the vertices are defined as the principal
#' eigenvector of \eqn{A^T A}{t(A)*A}, where \eqn{A} is the adjacency
#' matrix of the graph.
#' 
#' For undirected matrices the adjacency matrix is symmetric and the
#' authority scores are the same as hub scores, see
#' \code{\link{hub_score}}.
#' 
#' @aliases authority.score
#' @param graph The input graph.
#' @param scale Logical scalar, whether to scale the result to have a maximum
#' score of one. If no scaling is used then the result vector has unit length
#' in the Euclidean norm.
#' @param weights Optional positive weight vector for calculating weighted
#' scores. If the graph has a \code{weight} edge attribute, then this is used
#' by default.
#' This function interprets edge weights as connection strengths. In the
#' random surfer model, an edge with a larger weight is more likely to be
#' selected by the surfer.
#' @param options A named list, to override some ARPACK options. See
#' \code{\link{arpack}} for details.
#' @return A named list with members:
#'   \item{vector}{The authority/hub scores of the vertices.}
#'   \item{value}{The corresponding eigenvalue of the calculated
#'     principal eigenvector.}
#'   \item{options}{Some information about the ARPACK computation, it has
#'     the same members as the \code{options} member returned 
#'     by \code{\link{arpack}}, see that for documentation.}
#' @seealso \code{\link{hub_score}}, \code{\link{eigen_centrality}} for
#' eigenvector centrality, \code{\link{page_rank}} for the Page Rank
#' scores. \code{\link{arpack}} for the underlining machinery of the
#' computation.
#' @references J. Kleinberg. Authoritative sources in a hyperlinked
#' environment. \emph{Proc. 9th ACM-SIAM Symposium on Discrete Algorithms},
#' 1998. Extended version in \emph{Journal of the ACM} 46(1999). Also appears
#' as IBM Research Report RJ 10076, May 1997.
#' @examples
#' ## An in-star
#' g <- make_star(10)
#' hub_score(g)$vector
#' authority_score(g)$vector
#' 
#' ## A ring
#' g2 <- make_ring(10)
#' hub_score(g2)$vector
#' authority_score(g2)$vector

authority_score <- authority_score


#' The Page Rank algorithm
#' 
#' Calculates the Google PageRank for the specified vertices.
#' 
#' For the explanation of the PageRank algorithm, see the following webpage:
#' \url{http://infolab.stanford.edu/~backrub/google.html}, or the following
#' reference:
#' 
#' Sergey Brin and Larry Page: The Anatomy of a Large-Scale Hypertextual Web
#' Search Engine. Proceedings of the 7th World-Wide Web Conference, Brisbane,
#' Australia, April 1998.
#' 
#' igraph 0.5 (and later) contains two PageRank calculation implementations.
#' The \code{page_rank} function uses ARPACK to perform the calculation, see
#' also \code{\link{arpack}}.
#' 
#' The \code{page_rank_old} function performs a simple power method, this is
#' the implementation that was available under the name \code{page_rank} in pre
#' 0.5 igraph versions. Note that \code{page_rank_old} has an argument called
#' \code{old}. If this argument is \code{FALSE} (the default), then the proper
#' PageRank algorithm is used, i.e. \eqn{(1-d)/n} is added to the weighted
#' PageRank of vertices to calculate the next iteration. If this argument is
#' \code{TRUE} then \eqn{(1-d)} is added, just like in the PageRank paper;
#' \eqn{d} is the damping factor, and \eqn{n} is the total number of vertices.
#' A further difference is that the old implementation does not renormalize the
#' page rank vector after each iteration.  Note that the \code{old=FALSE}
#' method is not stable, is does not necessarily converge to a fixed point. It
#' should be avoided for new code, it is only included for compatibility with
#' old igraph versions.
#' 
#' Please note that the PageRank of a given vertex depends on the PageRank of
#' all other vertices, so even if you want to calculate the PageRank for only
#' some of the vertices, all of them must be calculated. Requesting the
#' PageRank for only some of the vertices does not result in any performance
#' increase at all.
#' 
#' Since the calculation is an iterative process, the algorithm is stopped
#' after a given count of iterations or if the PageRank value differences
#' between iterations are less than a predefined value.
#' 
#' @aliases page.rank page_rank page.rank.old page_rank_old
#' @param graph The graph object.
#' @param algo Character scalar, which implementation to use to carry out the
#' calculation. The default is \code{"prpack"}, which uses the PRPACK library
#' (https://github.com/dgleich/prpack). This is a new implementation in igraph
#' version 0.7, and the suggested one, as it is the most stable and the fastest
#' for all but small graphs.  \code{"arpack"} uses the ARPACK library, the
#' default implementation from igraph version 0.5 until version 0.7.
#' \code{power} uses a simple implementation of the power method, this was the
#' default in igraph before version 0.5 and is the same as calling
#' \code{page_rank_old}.
#' @param vids The vertices of interest.
#' @param directed Logical, if true directed paths will be considered for
#' directed graphs. It is ignored for undirected graphs.
#' @param damping The damping factor (\sQuote{d} in the original paper).
#' @param personalized Optional vector giving a probability distribution to
#' calculate personalized PageRank. For personalized PageRank, the probability
#' of jumping to a node when abandoning the random walk is not uniform, but it
#' is given by this vector. The vector should contains an entry for each vertex
#' and it will be rescaled to sum up to one.
#' @param weights A numerical vector or \code{NULL}. This argument can be used
#' to give edge weights for calculating the weighted PageRank of vertices. If
#' this is \code{NULL} and the graph has a \code{weight} edge attribute then
#' that is used. If \code{weights} is a numerical vector then it used, even if
#' the graph has a \code{weights} edge attribute. If this is \code{NA}, then no
#' edge weights are used (even if the graph has a \code{weight} edge attribute.
#' This function interprets edge weights as connection strengths. In the
#' random surfer model, an edge with a larger weight is more likely to be
#' selected by the surfer.
#' @param options Either a named list, to override some ARPACK options. See
#' \code{\link{arpack}} for details; or a named list to override the default
#' options for the power method (if \code{algo="power"}).  The default options
#' for the power method are \code{niter=1000} and \code{eps=0.001}. This
#' argument is ignored if the PRPACK implementation is used.
#' @param niter The maximum number of iterations to perform.
#' @param eps The algorithm will consider the calculation as complete if the
#' difference of PageRank values between iterations change less than this value
#' for every node.
#' @param old A logical scalar, whether the old style (pre igraph 0.5)
#' normalization to use. See details below.
#' @return For \code{page_rank} a named list with entries: \item{vector}{A
#' numeric vector with the PageRank scores.} \item{value}{The eigenvalue
#' corresponding to the eigenvector with the page rank scores. It should be
#' always exactly one.} \item{options}{Some information about the underlying
#' ARPACK calculation. See \code{\link{arpack}} for details. This entry is
#' \code{NULL} if not the ARPACK implementation was used.}
#' 
#' For \code{page_rank_old} a numeric vector of Page Rank scores.
#' @author Tamas Nepusz \email{ntamas@@gmail.com} and Gabor Csardi
#' \email{csardi.gabor@@gmail.com}
#' @seealso Other centrality scores: \code{\link{closeness}},
#' \code{\link{betweenness}}, \code{\link{degree}}
#' @references Sergey Brin and Larry Page: The Anatomy of a Large-Scale
#' Hypertextual Web Search Engine. Proceedings of the 7th World-Wide Web
#' Conference, Brisbane, Australia, April 1998.
#' @keywords graphs
#' @examples
#' 
#' g <- sample_gnp(20, 5/20, directed=TRUE)
#' page_rank(g)$vector
#' 
#' g2 <- make_star(10)
#' page_rank(g2)$vector
#' 
#' # Personalized PageRank
#' g3 <- make_ring(10)
#' page_rank(g3)$vector
#' reset <- seq(vcount(g3))
#' page_rank(g3, personalized=reset)$vector
#' @export

page_rank <- page_rank

#' @export
#' @rdname page_rank

page_rank_old <- page_rank_old
