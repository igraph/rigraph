
#' Graphon kernels
#'
#' TODO
#'
#' @export

graphon_kernels <- list(
  NULL,                                 # dummy, to make [[2]] == "w2"
  w2 = function(i, j) {
    i <- pmax(i, 1/100)
    j <- pmax(j, 1/100)
    1 / 100 * sqrt(i * j)
  },

  w3 = function(i, j) {
    2 * (i - 1/2) ^ 2 + 2 * (j - 1/2) ^ 2
  },

  w4 = function(i, j) {
    ifelse(i + j > 1, 1 / 4, 1 /3)
  },

  w5 = function(i, j) {
    (i + j) / 2
  },

  w6 = function(i, j) {
    1 / (1 + exp(50 * (- i - j + 1)))
  },

  w7 = function(i, j) {
    i * j
  },

  w8 = function(i, j) {
    pmin(i, j)
  },

  w9 = function(i, j) {
    1 / (1 + exp(- i - j))
  },

  w10 = function(i, j) {
    sin(i + j + sqrt(i * j)) ^ 4
  },

  w11 = function(i, j) {
    sin((i + j) * (2 - i - j)) ^ 6
  },

  w12 = function(i, j) {
    sin(i * (1 - i) + j * (1 - j))
  },

  w13 = function(i, j) {
    sin(2 * i ^ 2 + 2 * j ^ 2) ^ 2
  },

  w14 = function(i, j) {
    sin(i * (1 - i) + j * (1 - j)) ^ 2
  },

  w15 = function(i, j) {
    ifelse(abs(i - j) < 0.05 || abs(i - j) > 0.95, 0.9, 0.1)
  },

  w16 = function(i, j) {
    i * j
  },

  w17 = function(i, j) {
    i <- pmax(i, 1/250)
    j <- pmax(j, 1/250)
    1 / (250 * sqrt(i * j))
  },

  w18 = function(i, j) {
    i <- pmax(i, 1/10)
    j <- pmax(j, 1/10)
    1 / (10 * sqrt(i * j))
  },

  w19 = function(i, j) {
    i <- pmax(i, 1/50)
    j <- pmax(j, 1/50)
    1 / (50 * sqrt(i * j))
  }
)


get_graphon_kernel <- function(kernel) {
  if (is.numeric(kernel) && length(kernel) == 1 && kernel >= 2 &&
      kernel <= length(graphon_kernels)) {
    graphon_kernels[[kernel]]

  } else if (is.character(kernel) && length(kernel) == 1 &&
             kernel %in% names(graphon_kernels)) {
    graphon_kernels[[kernel]]

  } else if (is.function(kernel)) {
    ## Good, a function and we don't check what it does
    kernel

  } else {
    stop("Invalid 'kernel'")
  }
}


plot_graphon_internal <- function(matrix, ..., plotter = graphics::image) {
  plotter(matrix, ...)
}


plot_graphon_kernel <- function(kernel, n = 30, ...,
                                plotter = graphics::image) {
  stopifnot(is.numeric(n), length(n) == 1, n >= 2, is.finite(n))
  kernel <- get_graphon_kernel(kernel)

  u <- seq(0, 1, length.out = n)
  P <- outer(u, u, kernel)

  plot_graphon_internal(P, ..., plotter = plotter)
}


#' Sample from simple graphons based on a single kernel
#'
#' @details
#' TODO
#'
#' @param n Number of vertices
#' @param kernel A numeric (integer) scalar or a character scalar
#'   giving the kernel function to use. See \code{\link{graphon_kernels}}.
#'   Alternatively, a function that is used as a kernel. This function
#'   must be vectorized.
#' @return An igraph graph generated from the graphon. It has graph
#'   attributes \describe{
#'     \item{kernel}{The original \code{kernel} argument.}
#'     \item{kernel_function}{The actual kernel function.}
#'   } and vertex attribute \code{u}, the \dQuote{values} of the
#'   graphon vertices.
#'
#' @export
#' @examples
#' ## TODO

sample_graphon0 <- function(n, kernel) {

  orig_kernel <- kernel

  stopifnot(is.numeric(n), length(n) == 1, n >= 1, is.finite(n))
  kernel <- get_graphon_kernel(kernel)

  u <- sort(runif(n))
  P <- outer(u, u, kernel)
  diag(P) <- 0

  res <- sample_prob_matrix(P, directed = FALSE)

  if (getIgraphOpt("add.params")) {
    res$kernel <- orig_kernel
    res$kernel_function <- kernel
    V(res)$u <- u
  }
  res
}


#' @rdname sample_graphon0
#' @param ... Passed to \code{sample_graphon0}.
#' @export

graphon0 <- function(...) constructor_spec(sample_graphon0, ...)


#' Sample from a graphon defined via a stochastic block model
#'
#' @details
#' TODO
#'
#' @param n Number of vertices.
#' @param num_blocks Number of blocks.
#' @param block_size_type Whether to have \sQuote{varying} or \sQuote{even}
#'   block sizes. Note that the blocks are stochastic, always. With
#'   \sQuote{even} block memberships of vertices are uniformly distributed
#'   among blocks. With \sQuote{varying} block membership probabilities
#'   are drawn from a Dirichlet distribution with parameters
#'   \code{[1,1,1..., 1]}.
#' @return An igraph graph.
#'
#' @export
#' @examples
#' g1 <- sample_graphon_blocks(20, 4, block_size_type = "varying")
#' g1
#'
#' g2 <- sample_graphon_blocks(20, 4, block_size_type = "even")
#' g2

sample_graphon_blocks <- function(
  n, num_blocks, block_size_type = c("varying","even")) {

  stopifnot(is.numeric(n), length(n) == 1, n >= 1, is.finite(n))
  stopifnot(is.numeric(num_blocks), length(num_blocks) == 1,
            num_blocks >= 1, is.finite(num_blocks))
  block_size_type <- igraph.match.arg(block_size_type)

  u <- sort(runif(n))
  block_matrix <- matrix(runif(num_blocks * num_blocks), nrow = num_blocks)
  block_matrix[ lower.tri(block_matrix) ] <-
    t(block_matrix)[ lower.tri(block_matrix) ]

  if (block_size_type == "varying") {
    block_size_p <- rdirichlet(1, rep(1, num_blocks))

  } else if (block_size_type == "even") {
    block_size_p <- rep(1 / num_blocks, num_blocks)
  }
  block_sizes <- table(cut(u, breaks = cumsum(c(0, block_size_p)),
                           right = FALSE))

  res <- sample_sbm(n, pref.matrix = block_matrix,
                    block.sizes = block_sizes)

  if (getIgraphOpt("add.params")) {
    res$block_sizes <- block_sizes
    res$block_matrix <- block_matrix
    res$block_size_type <- block_size_type
    V(res)$u <- u
  }
  res
}


#' @rdname sample_graphon_blocks
#' @param ... Passed to \code{sample_graphon_blocks}.
#' @export

graphon_blocks <- function(...) {
  constructor_spec(sample_graphon_blocks, ...)
}


#' Sample from a core-periphery graphon
#'
#' @details
#' TODO
#'
#' @param n Number of vertices.
#' @return An igraph graph.
#'
#' @export
#' @examples
#' gg <- sample_graphon_core_periphery(20)
#' gg

sample_graphon_core_periphery <- function(n) {

  stopifnot(is.numeric(n), length(n) == 1, n >= 1, is.finite(n))

  u <- sort(runif(n))

  size_core <- runif(1, min = 0,   max = 0.3)

  core_prob <- runif(1, min = 0.8, max = 1.0)
  per_prob  <- runif(1, min = 0.3, max = 0.5)

  res <- sample_sbm(
    n = n,
    pref.matrix = cbind( c(core_prob, per_prob), c(per_prob, 0) ),
    block.sizes = c(sum(u < size_core), sum(u >= size_core))
  )

  if (getIgraphOpt("add.params")) {
    res$size_core <- size_core
    res$core_prob <- core_prob
    res$per_prob <- per_prob
    V(res)$u <- u
  }
  res
}


#' @rdname sample_graphon_core_periphery
#' @param ... Passed to \code{sample_graphon_core_periphery}.
#' @export

graphon_core_periphery <- function(...) {
  constructor_spec(sample_graphon_core_periphery, ...)
}


#' Fit a graphon to a graph
#'
#' @details
#' TODO
#'
#' @param graph
#' @param method Method to use. Currently only \sQuote{costa} is
#'   implemented.
#' @return TODO
#'
#' @references
#' TODO
#'
#' @export
#' @examples
#' gg <- sample_graphon0(50, "w8")
#' fg <- fit_graphon(gg)
#'
#' layout(rbind(1:2))
#' plot_graphon_kernel("w8", n = 50)
#' plot_graphon_fit(fg)

fit_graphon <- function(graph, method = c("costa")) {

  stopifnot(is_igraph(graph))
  method <- igraph.match.arg(method)

  if (method == "costa") {
    fit_graphon_costa(graph)
  }
}


plot_graphon_fit <- function(fit, ..., plotter = graphics::image) {

  P <- fit$best_estimation$graphon_lattice
  plot_graphon_internal(P, ..., plotter = plotter)
}


fit_graphon_costa <- function(graph) {

  dist <- abs(get_dist(graph))
  max_dist <- max(dist)
  min_dist <- min(dist)

  num_delta <- 30

  best_risk <- Inf
  best_delta <- best_clusters <- best_estimation <- NULL
  risk <- numeric(num_delta)

  deltas <- (1:num_delta) * (max_dist - min_dist) / num_delta + min_dist
  for (i in seq_along(deltas)) {
    clusters <- get_clusters(dist, deltas[i])
    estimation <- histogram3d(graph, clusters)
    risk[i] <- estimation_risk(gorder(graph), estimation$block_sizes)
    if (risk[i] < best_risk) {
      best_risk <- risk[i]
      best_delta <- deltas[i]
      best_clusters <- clusters
      best_estimation <- estimation
    }
  }

  res <- list(
    method = "costa",
    best_risk = best_risk,
    best_delta = best_delta,
    best_clusters = best_clusters,
    best_estimation = best_estimation
  )

  res
}


get_pairs <- function(rij) {
  n <- nrow(rij)
  dist <- matrix(NA, n , n)
  for (i in 1:n) {
    for (j in 1:n) {
      dist[i, j] <- mean(abs(rij[i,] - rij[,j]))
    }
  }

  diag(dist) <- Inf
  min_dist <- apply(dist, 1, min)
  cbind(
    seq_len(n),
    sapply(1:n, function(i) safe_sample(which(dist[i,] == min_dist[i]), 1))
  )
}


get_rij <- function(graph) {
  n <- gorder(graph)
  res <- bibcoupling(graph) / (n - 2)
  diag(res) <- degree(graph) / (n - 1)
  pairs <- get_pairs(res)
  res
}


get_dist <- function(graph) {
  n <- gorder(graph)
  rij <- get_rij(graph)
  dij <- matrix(NA, n, n)
  for (i in 1:n) {
    for (j in 1:n) {
      dij[i,j] <- rij[i,i] + rij[j,j] - rij[i,j] - rij[j,i]
    }
  }
  dij
}


## Iteratively choose random vertices as cluster centers, and then
## add all other vertices within delta distance to the same cluster.

get_clusters <- function(dist, delta) {
  n <- ncol(dist)
  clusters <- rep(NA_integer_, n)
  label <- 1

  unass <- which(is.na(clusters))
  while (length(unass)) {
    v <- safe_sample(unass, 1)
    new_cluster <- unass[ abs(dist[v, unass]) < delta ]
    clusters[new_cluster] <- label

    unass <- which(is.na(clusters))
    label <- label + 1
  }

  clusters
}


histogram3d <- function(graph, clusters) {

  n <- gorder(graph)
  k <- max(clusters)
  block_matrix <- matrix(NA, k, k)
  graphon_lattice <- matrix(NA, n, n)
  for (i in 1:k) {
    for (j in 1:k) {
      block_matrix[i, j] <-
        mean(as.vector(graph[clusters == i, clusters == j]))
      graphon_lattice[clusters == i, clusters == j] <- block_matrix[i, j]
    }
  }

  list(
    block_matrix = block_matrix,
    block_sizes = unname(table(clusters)) / n,
    graphon_lattice = graphon_lattice
  )
}


estimation_risk <- function(n, p) {
  h <- 1 / length(p)
  2 / (h * (n - 1)) - ((n + 1) / (h * (n - 1))) * sum(p^2)
}
