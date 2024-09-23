test_that("as_directed works", {
  g <- sample_gnp(100, 2 / 100)
  g2 <- as_directed(g, mode = "mutual")
  g3 <- as_directed(g, mode = "arbitrary")
  g4 <- as_directed(g, mode = "random")
  g5 <- as_directed(g, mode = "acyclic")

  expect_equal(degree(g), degree(g2) / 2)
  expect_equal(degree(g), degree(g3))
  expect_equal(degree(g), degree(g4))
  expect_equal(degree(g), degree(g5))

  expect_isomorphic(g, as_undirected(g2))
  expect_isomorphic(g, as_undirected(g3))
  expect_isomorphic(g, as_undirected(g4))
  expect_isomorphic(g, as_undirected(g5))
})

test_that("as_directed keeps attributes", {
  g <- graph_from_literal(A - B - C, D - A, E)
  g$name <- "Small graph"
  g2 <- as_directed(g, mode = "mutual")
  g3 <- as_directed(g, mode = "arbitrary")
  expect_equal(g2$name, g$name)
  expect_equal(V(g2)$name, V(g)$name)
  expect_equal(g3$name, g$name)
  expect_equal(V(g3)$name, V(g)$name)

  E(g)$weight <- seq_len(ecount(g))
  g4 <- as_directed(g, "mutual")
  df4 <- as_data_frame(g4)
  g5 <- as_directed(g, "arbitrary")
  df5 <- as_data_frame(g5)
  expect_equal(df4[order(df4[, 1], df4[, 2]), ]$weight, c(1, 2, 1, 3, 3, 2))
  expect_equal(df5[order(df5[, 1], df5[, 2]), ]$weight, 1:3)
})

test_that("as.directed() deprecation", {
  local_igraph_options(print.id = FALSE)

  g <- sample_gnp(100, 2 / 100)
  expect_snapshot(is_directed(as.directed(g, mode = "mutual")))
})

test_that("as.undirected() deprecation", {
  local_igraph_options(print.id = FALSE)

  g <- sample_gnp(100, 2 / 100)
  expect_snapshot(is_directed(as.undirected(g, mode = "collapse")))
})

test_that("as_undirected() keeps attributes", {
  g <- graph_from_literal(A + -+B, A - -+C, C + -+D)
  g$name <- "Tiny graph"
  E(g)$weight <- seq_len(ecount(g))

  g2 <- as_undirected(g, mode = "collapse")
  df2 <- as_data_frame(g2)
  g3 <- as_undirected(g, mode = "each")
  df3 <- as_data_frame(g3)
  g4 <- as_undirected(g, mode = "mutual")
  df4 <- as_data_frame(g4)

  expect_equal(g2$name, g$name)
  expect_equal(g3$name, g$name)
  expect_equal(g4$name, g$name)

  expect_equal(df2[order(df2[, 1], df2[, 2]), ]$weight, c(4, 2, 9))
  expect_equal(df3[order(df3[, 1], df3[, 2]), ]$weight, c(1, 3, 2, 4, 5))
  expect_equal(df4[order(df4[, 1], df4[, 2]), ]$weight, c(4, 9))
})

test_that("as_adjacency_matrix() works -- sparse", {
  withr::local_seed(42)

  g <- sample_gnp(10, 2 / 10)
  basic_adj_matrix <- as_adjacency_matrix(g)
  expected_matrix <- new(
    "dgCMatrix" %>%
      structure(package = "Matrix"),
    i = c(
      8L, 2L, 3L, 6L, 1L, 3L, 4L, 5L, 7L, 1L, 2L, 2L, 6L, 2L, 6L, 7L, 9L, 1L, 4L,
      5L, 7L, 9L, 2L, 5L, 6L, 0L, 5L, 6L
    ),
    p = c(0L, 1L, 4L, 9L, 11L, 13L, 17L, 22L, 25L, 26L, 28L),
    Dim = c(10L, 10L),
    Dimnames = list(NULL, NULL),
    x = rep(1, 28L),
    factors = list()
  )
  expect_equal(basic_adj_matrix, expected_matrix)

  V(g)$name <- letters[1:vcount(g)]
  letter_adj_matrix <- as_adjacency_matrix(g)
  expect_s4_class(letter_adj_matrix, "dgCMatrix")
  expect_setequal(rownames(letter_adj_matrix), letters[1:vcount(g)])
  expect_equal(basic_adj_matrix, unname(letter_adj_matrix))

  E(g)$weight <- runif(ecount(g))
  weight_adj_matrix <- as_adjacency_matrix(g, attr = "weight")
  expect_s4_class(weight_adj_matrix, "dgCMatrix")
  expect_equal(weight_adj_matrix[3, 2], 0.9575766)
})

test_that("as_adjacency_matrix() works -- sparse + not both", {
  withr::local_seed(42)
  g <- sample_gnp(10, 2 / 10)

  lower_adj_matrix <- as_adjacency_matrix(g, type = "lower")
  lower_expected_matrix <- new(
    "dgCMatrix" %>%
      structure(package = "Matrix"),
    i = c(8L, 2L, 3L, 6L, 3L, 4L, 5L, 7L, 6L, 6L, 7L, 9L, 7L, 9L),
    p = c(0L, 1L, 4L, 8L, 8L, 9L, 12L, 14L, 14L, 14L, 14L),
    Dim = c(10L, 10L),
    Dimnames = list(NULL, NULL),
    x = rep(1, 14L),
    factors = list()
  )
  expect_equal(lower_adj_matrix, lower_expected_matrix)

  upper_adj_matrix <- as_adjacency_matrix(g, type = "upper")
  upper_expected_matrix <- new(
    "dgCMatrix" %>%
      structure(package = "Matrix"),
    i = c(1L, 1L, 2L, 2L, 2L, 1L, 4L, 5L, 2L, 5L, 6L, 0L, 5L, 6L),
    p = c(0L, 0L, 0L, 1L, 3L, 4L, 5L, 8L, 11L, 12L, 14L),
    Dim = c(10L, 10L),
    Dimnames = list(NULL, NULL),
    x = rep(1, 14L),
    factors = list()
  )

  expect_equal(upper_adj_matrix, upper_expected_matrix)
})

test_that("as_adjacency_matrix() errors well -- sparse", {
  g <- sample_gnp(10, 2 / 10)
  expect_snapshot(as_adjacency_matrix(g, attr = "bla"), error = TRUE)

  E(g)$bla <- letters[1:ecount(g)]
  expect_snapshot(as_adjacency_matrix(g, attr = "bla"), error = TRUE)

})

test_that("as_adjacency_matrix() works -- sparse directed", {
  g <- make_ring(10, directed = TRUE)
  adj_matrix <- as_adjacency_matrix(g)
  expect_equal(
    adj_matrix,
    new(
      "dgCMatrix" %>%
        structure(package = "Matrix"),
      i = c(9L, 0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L),
      p = 0:10,
      Dim = c(10L, 10L),
      Dimnames = list(NULL, NULL),
      x = rep(1, 10L),
      factors = list()
    )
  )
})

test_that("as_adjacency_matrix() works -- dense", {
  withr::local_seed(42)

  g <- sample_gnp(10, 2 / 10)
  basic_adj_matrix <- as_adjacency_matrix(g, sparse = FALSE)
  expected_matrix <- matrix(
    rep(
      c(
        0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1,
        0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0
      ),
      c(
        8L, 1L, 3L, 2L, 2L, 1L, 4L, 1L, 1L, 3L, 1L, 1L, 3L, 2L, 9L, 1L, 3L, 1L, 5L,
        1L, 3L, 2L, 1L, 1L, 1L, 1L, 2L, 2L, 1L, 1L, 1L, 1L, 2L, 1L, 2L, 2L, 3L, 1L,
        14L, 2L, 3L
      )
    ),
    nrow = 10L,
    ncol = 10L
  )
  expect_equal(basic_adj_matrix, expected_matrix)

  V(g)$name <- letters[1:vcount(g)]
  letter_adj_matrix <- as_adjacency_matrix(g, sparse = FALSE)
  expect_true(inherits(letter_adj_matrix, "matrix"))
  expect_setequal(rownames(letter_adj_matrix), letters[1:vcount(g)])
  expect_equal(basic_adj_matrix, unname(letter_adj_matrix))

  E(g)$weight <- runif(ecount(g))
  weight_adj_matrix <- as_adjacency_matrix(g, attr = "weight", sparse = FALSE)
  expect_true(inherits(weight_adj_matrix, "matrix"))
  expect_equal(weight_adj_matrix[3, 2], 0.9575766)
})

test_that("as_adjacency_matrix() errors well -- dense", {
  g <- sample_gnp(10, 2 / 10)
  expect_snapshot(as_adjacency_matrix(g, attr = "bla", sparse = FALSE), error = TRUE)

  E(g)$bla <- letters[1:ecount(g)]
  expect_snapshot(as_adjacency_matrix(g, attr = "bla", sparse = FALSE), error = TRUE)

})


test_that("as_adjacency_matrix() works -- dense directed", {
  withr::local_seed(42)
  g <- make_ring(10, directed = TRUE)
  # no different treatment than undirected if no attribute?!
  adj_matrix <- as_adjacency_matrix(g, sparse = FALSE)
  expect_equal(
    adj_matrix,
    matrix(
      rep(
        c(0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0),
        c(9L, 2L, 10L, 1L, 10L, 1L, 10L, 1L, 10L, 1L, 10L, 1L, 10L, 1L, 10L, 1L, 10L, 1L, 1L)
      ),
      nrow = 10L,
      ncol = 10L
    )
  )

  E(g)$weight <- runif(ecount(g))
  weight_adj_matrix <- as_adjacency_matrix(g, sparse = FALSE, attr = "weight")
  expect_true(inherits(weight_adj_matrix, "matrix"))
  expect_equal(weight_adj_matrix[1, 2], 0.914806, tolerance = 1e-5)
})

test_that("as_adjacency_matrix() works -- dense + not both", {
  withr::local_seed(42)
  g <- sample_gnp(10, 2 / 10)

  lower_adj_matrix <- as_adjacency_matrix(g, type = "lower", sparse = FALSE)
  lower_expected_matrix <- matrix(
    rep(
      c(0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0),
      c(8L, 1L, 3L, 2L, 2L, 1L, 6L, 3L, 1L, 1L, 18L, 1L, 9L, 2L, 1L, 1L, 7L, 1L, 1L, 1L, 30L)
    ),
    nrow = 10L,
    ncol = 10L
  )
  expect_equal(lower_adj_matrix, lower_expected_matrix)

  upper_adj_matrix <- as_adjacency_matrix(g, type = "upper")
  upper_expected_matrix <- new(
    "dgCMatrix" %>%
      structure(package = "Matrix"),
    i = c(1L, 1L, 2L, 2L, 2L, 1L, 4L, 5L, 2L, 5L, 6L, 0L, 5L, 6L),
    p = c(0L, 0L, 0L, 1L, 3L, 4L, 5L, 8L, 11L, 12L, 14L),
    Dim = c(10L, 10L),
    Dimnames = list(NULL, NULL),
    x = rep(1, 14L),
    factors = list()
  )
  expect_equal(upper_adj_matrix, upper_expected_matrix)
})
