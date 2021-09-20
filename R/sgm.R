
solve_LSAP <- function (x, maximum = FALSE) {
  if (!is.matrix(x) || any(x < 0)) {
    stop("x must be a matrix with nonnegative entries.")
  }
  nr <- nrow(x)
  nc <- ncol(x)
  if (nr > nc) stop("x must not have more rows than columns.")
  if (nc > nr)  x <- rbind(x, matrix(2 * sum(x), nc - nr, nc))
  if (maximum)  x <- max(x) - x
  storage.mode(x) <- "double"
  out <- .Call(C_R_igraph_solve_lsap, x, as.integer(nc)) + 1L
  out[seq_len(nr)]
}

#' Match Graphs given a seeding of vertex correspondences
#' 
#' Given two adjacency matrices \code{A} and \code{B} of the same size, match
#' the two graphs with the help of \code{m} seed vertex pairs which correspond
#' to the first \code{m} rows (and columns) of the adjacency matrices.
#' 
#' The approximate graph matching problem is to find a bijection between the
#' vertices of two graphs , such that the number of edge disagreements between
#' the corresponding vertex pairs is minimized. For seeded graph matching, part
#' of the bijection that consist of known correspondences (the seeds) is known
#' and the problem task is to complete the bijection by estimating the
#' permutation matrix that permutes the rows and columns of the adjacency
#' matrix of the second graph.
#' 
#' It is assumed that for the two supplied adjacency matrices \code{A} and
#' \code{B}, both of size \eqn{n\times n}{n*n}, the first \eqn{m} rows(and
#' columns) of \code{A} and \code{B} correspond to the same vertices in both
#' graphs. That is, the \eqn{n \times n}{n*n} permutation matrix that defines
#' the bijection is \eqn{I_{m} \bigoplus P} for a \eqn{(n-m)\times
#' (n-m)}{(n-m)*(n-m)} permutation matrix \eqn{P} and \eqn{m} times \eqn{m}
#' identity matrix \eqn{I_{m}}. The function \code{match_vertices} estimates
#' the permutation matrix \eqn{P} via an optimization algorithm based on the
#' Frank-Wolfe algorithm.
#' 
#' See references for further details.
#' 
#' @aliases match_vertices seeded.graph.match
#' @param A a numeric matrix, the adjacency matrix of the first graph
#' @param B a numeric matrix, the adjacency matrix of the second graph
#' @param m The number of seeds. The first \code{m} vertices of both graphs are
#' matched.
#' @param start a numeric matrix, the permutation matrix estimate is
#' initialized with \code{start}
#' @param iteration The number of iterations for the Frank-Wolfe algorithm
#' @return A numeric matrix which is the permutation matrix that determines the
#' bijection between the graphs of \code{A} and \code{B}
#' @author Vince Lyzinski \url{http://www.ams.jhu.edu/~lyzinski/}
#' @seealso
#' \code{\link{sample_correlated_gnp}},\code{\link{sample_correlated_gnp_pair}}
#' @references Vogelstein, J. T., Conroy, J. M., Podrazik, L. J., Kratzer, S.
#' G., Harley, E. T., Fishkind, D. E.,Vogelstein, R. J., Priebe, C. E. (2011).
#' Fast Approximate Quadratic Programming for Large (Brain) Graph Matching.
#' Online: \url{https://arxiv.org/abs/1112.5507}
#' 
#' Fishkind, D. E., Adali, S., Priebe, C. E. (2012). Seeded Graph Matching
#' Online: \url{https://arxiv.org/abs/1209.0367}
#' @keywords graphs
#' @examples
#' 
#'  #require(Matrix)
#'  g1 <- erdos.renyi.game(10, .1)
#'  randperm <- c(1:3, 3+sample(7))
#'  g2 <- sample_correlated_gnp(g1, corr=1, p=g1$p, perm=randperm)
#'  A  <- as.matrix(get.adjacency(g1))
#'  B  <- as.matrix(get.adjacency(g2))
#'  P  <-match_vertices (A, B, m=3, start=diag(rep(1, nrow(A)-3)), 20)
#'  P
#' @export

match_vertices <- function(A, B, m, start, iteration) {
  ## Seeds are assumed to be vertices 1:m in both graphs
  totv <- ncol(A)
  n <- totv - m
  if (m != 0) {
    A12 <- A[1:m, (m+1):(m+n), drop=FALSE]
    A21 <- A[(m+1):(m+n), 1:m, drop=FALSE]
    B12 <- B[1:m, (m+1):(m+n), drop=FALSE]
    B21 <- B[(m+1):(m+n), 1:m, drop=FALSE]
  }
  if ( m==0 ) {
    A12 <- Matrix::Matrix(0, n, n)
    A21 <- Matrix::Matrix(0, n, n)
    B12 <- Matrix::Matrix(0, n, n)
    B21 <- Matrix::Matrix(0, n, n)
  }
  A22 <- A[(m+1):(m+n), (m+1):(m+n)]
  B22 <- B[(m+1):(m+n), (m+1):(m+n)]
  patience <- iteration
  tol <- 1
  P <- start
  toggle <- 1
  iter <- 0
  while (toggle == 1 & iter < patience)  {
    iter <- iter+1
    x <-  A21 %*% Matrix::t(B21)
    y <-  Matrix::t(A12) %*% B12
    z <-  A22 %*% P %*% Matrix::t(B22)
    w <-  Matrix::t(A22) %*% P %*% B22
    Grad <- x + y + z + w
    ind <- unclass(solve_LSAP(as.matrix(Grad), maximum = TRUE))
    ind2 <- cbind(1:n, ind)
    T <- Matrix::Diagonal(n)
    T <- T[ind, ]
    wt <- Matrix::t(A22)[,order(ind)] %*% B22
    c <- sum(w * P)
    d <- sum(wt * P) + sum(w [ ind2 ])
    e <- sum(wt[ind2])
    u <- sum(P * (x + y))
    v <- sum((x + y)[ind2])
    if ( c-d+e == 0 && d-2*e+u-v == 0) {
      alpha <- 0
    } else {
      alpha <- -(d-2*e+u-v) / (2*(c-d+e))}
    f0 <- 0
    f1 <-  c-e+u-v
    falpha <- (c-d+e) * alpha^2 + (d-2*e+u-v) * alpha
    if (alpha < tol && alpha > 0 && falpha > f0 && falpha > f1) {
      P <-  alpha*P + (1-alpha) * T
    } else if (f0 > f1) {
      P <- T
    } else {
      toggle <- 0
    }
  }
  D <- P
  corr <- matrix(solve_LSAP(as.matrix(P),  maximum = TRUE))
  P = Matrix::diag(n)
  P = rbind(cbind(Matrix::diag(m), matrix(0, m, n)),
    cbind(matrix(0, n, m), P[corr, ]))
  corr <- cbind(matrix((m+1):totv,  n), matrix(m+corr, n))
  list(corr=corr,  P=P,  D=D)
}
