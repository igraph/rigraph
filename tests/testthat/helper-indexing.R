vector_to_square_matrix <- function(...) {
  v <- as.numeric(as.vector(list(...)))
  matrix(v, nrow = sqrt(length(v)))
}

canonicalize_matrix <- function(x) {
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
