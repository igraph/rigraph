vector_to_square_matrix <- function(...) {
  v <- as.numeric(as.vector(list(...)))
  matrix(v, nrow = sqrt(length(v)))
}

as_unnamed_dense_matrix <- function(x) {
  x <- as.matrix(x)
  dimnames(x) <- NULL
  x
}

make_test_named_tree <- function() {
  g <- make_tree(20)
  V(g)$name <- letters[1:vcount(g)]
  g
}

make_test_weighted_tree <- function() {
  g <- make_tree(20)
  V(g)$name <- letters[1:vcount(g)]
  el <- as_edgelist(g, names = FALSE)
  E(g)$weight <- el[, 1] * el[, 2]
  g
}

make_scan_graphs <- function(version = 1) {
  local_rng_version("3.5.0")
  if (version == 1) {
    withr::local_seed(12345)
    n <- 10^3
    p <- 0.1
    g <- sample_gnp(n, p)
    E(g)$weight <- sample(ecount(g))
    gp <- sample_gnp(n, p)
    E(gp)$weight <- sample(ecount(gp))

    list(g = g, gp = gp)
  } else if (version == 2) {
    withr::local_seed(42)
    n <- 10^3
    p <- 0.1
    g <- sample_gnp(n, p, directed = TRUE)
    E(g)$weight <- sample(ecount(g))
    gp <- sample_gnp(n, p)
    E(gp)$weight <- sample(ecount(gp))
    list(g = g, gp = gp)
  }
}
