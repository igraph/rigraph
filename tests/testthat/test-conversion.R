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
  g <- make_graph(c(1,2, 2,1, 2,2, 3,3, 3,3, 3,4, 4,2, 4,2, 4,2), directed = TRUE)
  basic_adj_matrix <- as_adjacency_matrix(g)
  expect_s4_class(basic_adj_matrix, "dgCMatrix")
  expected_matrix <- matrix(
    c(0, 1, 0, 0, 1, 1, 0, 3, 0, 0, 2, 0, 0, 0, 1, 0),
    nrow = 4L, ncol = 4L
  )
  basic_adj_matrix <- as.matrix(basic_adj_matrix)
  dimnames(basic_adj_matrix) <- NULL
  expect_equal(basic_adj_matrix, expected_matrix)

  V(g)$name <- letters[1:vcount(g)]
  letter_adj_matrix <- as_adjacency_matrix(g)
  expect_s4_class(letter_adj_matrix, "dgCMatrix")
  expect_setequal(rownames(letter_adj_matrix), letters[1:vcount(g)])
  letter_adj_matrix <- as.matrix(letter_adj_matrix)
  dimnames(letter_adj_matrix) <- NULL
  expect_equal(basic_adj_matrix, letter_adj_matrix)

  E(g)$weight <- c(1.2, 3.4, 2.7, 5.6, 6.0, 0.1, 6.1, 3.3, 4.3)
  weight_adj_matrix <- as_adjacency_matrix(g, attr = "weight")
  expect_s4_class(weight_adj_matrix, "dgCMatrix")
  expect_equal(as.matrix(weight_adj_matrix),
    matrix(
      c(0, 3.4, 0, 0, 1.2, 2.7, 0, 13.7, 0, 0, 11.6, 0, 0, 0, 0.1, 0),
      nrow = 4L,
      ncol = 4L,
      dimnames = list(c("a", "b", "c", "d"), c("a", "b", "c", "d"))
    ))
})

test_that("as_adjacency_matrix() works -- sparse + not both", {
  dg <- make_graph(c(1,2, 2,1, 2,2, 3,3, 3,3, 3,4, 4,2, 4,2, 4,2), directed = TRUE)
  g <- as_undirected(dg, mode = "each")

  lower_adj_matrix <- as_adjacency_matrix(g, type = "lower")
  expect_s4_class(lower_adj_matrix, "dgCMatrix")
  lower_expected_matrix <- matrix(
    c(0, 2, 0, 0, 0, 1, 0, 3, 0, 0, 2, 1, 0, 0, 0, 0),
    nrow = 4L, ncol = 4L
  )
  lower_expected_matrix <- as.matrix(lower_expected_matrix)
  dimnames(lower_expected_matrix) <- NULL
  expect_equal(lower_expected_matrix, lower_expected_matrix)

  upper_adj_matrix <- as_adjacency_matrix(g, type = "upper")
  expect_s4_class(upper_adj_matrix, "dgCMatrix")
  upper_expected_matrix <- matrix(
    c(0, 0, 0, 0, 2, 1, 0, 0, 0, 0, 2, 0, 0, 3, 1, 0),
    nrow = 4L, ncol = 4L
  )
  upper_adj_matrix <- as.matrix(upper_adj_matrix)
  dimnames(upper_adj_matrix) <- NULL
  expect_equal(upper_adj_matrix, upper_expected_matrix)
})

test_that("as_adjacency_matrix() errors well -- sparse", {
  g <- make_graph(c(1,2, 2,1, 2,2, 3,3, 3,3, 3,4, 4,2, 4,2, 4,2), directed = TRUE)
  expect_snapshot(as_adjacency_matrix(g, attr = "bla"), error = TRUE)

  E(g)$bla <- letters[1:ecount(g)]
  expect_snapshot(as_adjacency_matrix(g, attr = "bla"), error = TRUE)

})

test_that("as_adjacency_matrix() works -- sparse undirected", {
  dg <- make_graph(c(1,2, 2,1, 2,2, 3,3, 3,3, 3,4, 4,2, 4,2, 4,2), directed = TRUE)
  ug <- as_undirected(dg, mode = "each")
  adj_matrix <- as_adjacency_matrix(ug)
  expect_s4_class(adj_matrix, "dgCMatrix")

  adj_matrix <- as.matrix(adj_matrix)
  dimnames(adj_matrix) <- NULL
  expect_equal(
    adj_matrix,
    matrix(
      c(0, 2, 0, 0, 2, 1, 0, 3, 0, 0, 2, 1, 0, 3, 1, 0),
      nrow = 4L,
      ncol = 4L
    )
  )
})

test_that("as_adjacency_matrix() works -- dense", {
  g <- make_graph(c(1,2, 2,1, 2,2, 3,3, 3,3, 3,4, 4,2, 4,2, 4,2), directed = TRUE)

  basic_adj_matrix <- as_adjacency_matrix(g, sparse = FALSE)
  expected_matrix <- matrix(
    c(0, 1, 0, 0, 1, 1, 0, 3, 0, 0, 2, 0, 0, 0, 1, 0),
    nrow = 4L, ncol = 4L
  )
  expect_equal(basic_adj_matrix, expected_matrix)

  V(g)$name <- letters[1:vcount(g)]
  letter_adj_matrix <- as_adjacency_matrix(g, sparse = FALSE)
  expect_true(inherits(letter_adj_matrix, "matrix"))
  expect_setequal(rownames(letter_adj_matrix), letters[1:vcount(g)])
  expect_equal(basic_adj_matrix, unname(letter_adj_matrix))

  E(g)$weight <- c(1.2, 3.4, 2.7, 5.6, 6.0, 0.1, 6.1, 3.3, 4.3)
  weight_adj_matrix <- as_adjacency_matrix(g, attr = "weight", sparse = FALSE)
  expect_equal(
    weight_adj_matrix,
    matrix(
      c(0, 3.4, 0, 0, 1.2, 2.7, 0, 4.3, 0, 0, 6, 0, 0, 0, 0.1, 0),
      nrow = 4L,
      ncol = 4L,
      dimnames = list(c("a", "b", "c", "d"), c("a", "b", "c", "d"))
    )
  )
})

test_that("as_adjacency_matrix() errors well -- dense", {
  g <- make_graph(c(1,2, 2,1, 2,2, 3,3, 3,3, 3,4, 4,2, 4,2, 4,2), directed = TRUE)
  expect_snapshot(as_adjacency_matrix(g, attr = "bla", sparse = FALSE), error = TRUE)

  E(g)$bla <- letters[1:ecount(g)]
  expect_snapshot(as_adjacency_matrix(g, attr = "bla", sparse = FALSE), error = TRUE)

})


test_that("as_adjacency_matrix() works -- dense undirected", {
  dg <- make_graph(c(1,2, 2,1, 2,2, 3,3, 3,3, 3,4, 4,2, 4,2, 4,2), directed = TRUE)
  ug <- as_undirected(dg, mode = "each")
  # no different treatment than undirected if no attribute?!
  adj_matrix <- as_adjacency_matrix(ug, sparse = FALSE)
  expect_equal(
    adj_matrix,
    matrix(
      c(0, 2, 0, 0, 2, 1, 0, 3, 0, 0, 2, 1, 0, 3, 1, 0),
      nrow = 4L, ncol = 4L
    )
  )

  E(ug)$weight <- c(1.2, 3.4, 2.7, 5.6, 6.0, 0.1, 6.1, 3.3, 4.3)
  weight_adj_matrix <- as_adjacency_matrix(ug, sparse = FALSE, attr = "weight")
  expect_equal(
    weight_adj_matrix,
    matrix(
      c(0, 3.4, 0, 0, 3.4, 2.7, 0, 4.3, 0, 0, 6, 0.1, 0, 4.3, 0.1, 0),
      nrow = 4L,
      ncol = 4L
    )
  )
})

test_that("as_adjacency_matrix() works -- dense + not both", {
  dg <- make_graph(c(1,2, 2,1, 2,2, 3,3, 3,3, 3,4, 4,2, 4,2, 4,2), directed = TRUE)
  g <- as_undirected(dg, mode = "each")
  E(g)$attribute <- c(1.2, 3.4, 2.7, 5.6, 6.0, 0.1, 6.1, 3.3, 4.3)

  lower_adj_matrix <- as_adjacency_matrix(
    g,
    type = "lower",
    sparse = FALSE,
    attr = "attribute"
  )

  expect_equal(
    lower_adj_matrix,
    matrix(
      c(0, 3.4, 0, 0, 0, 2.7, 0, 4.3, 0, 0, 6, 0.1, 0, 0, 0, 0),
      nrow = 4L,
      ncol = 4L
    )
  )

  upper_adj_matrix  <- as_adjacency_matrix(
    g,
    type = "upper",
    sparse = FALSE,
    attr = "attribute"
  )

  expect_equal(
    upper_adj_matrix,
    matrix(
      c(0, 0, 0, 0, 3.4, 2.7, 0, 0, 0, 0, 6, 0, 0, 4.3, 0.1, 0),
      nrow = 4L,
      ncol = 4L
    )
  )
})

test_that("as_edgelist() works", {
  g <- sample_gnp(100, 3 / 100)
  e <- as_edgelist(g)
  g2 <- make_graph(t(e), n = vcount(g), dir = FALSE)
  expect_isomorphic(g, g2)
})

test_that("as_adj_list() works", {
  g <- sample_gnp(50, 2 / 50)
  al <- as_adj_list(g)
  g2 <- graph_from_adj_list(al, mode = "all")
  expect_isomorphic(g, g2)
  expect_true(isomorphic(g, g2,
    vertex.color1 = 1:vcount(g),
    vertex.color2 = 1:vcount(g2),
    method = "vf2"
  ))

  ####

  el <- as_adj_edge_list(g)
  for (i in 1:vcount(g)) {
    a <- E(g)[.inc(i)]
    expect_equal(length(a), length(el[[i]]), ignore_attr = TRUE)
    expect_equal(sort(el[[i]]), sort(a), ignore_attr = TRUE)
  }

  g <- sample_gnp(50, 4 / 50, directed = TRUE)
  el1 <- as_adj_edge_list(g, mode = "out")
  el2 <- as_adj_edge_list(g, mode = "in")
  for (i in 1:vcount(g)) {
    a <- E(g)[.from(i)]
    expect_equal(length(a), length(el1[[i]]), ignore_attr = TRUE)
    expect_equal(sort(el1[[i]]), sort(a), ignore_attr = TRUE)
  }
  for (i in 1:vcount(g)) {
    a <- E(g)[.to(i)]
    expect_equal(length(a), length(el2[[i]]), ignore_attr = TRUE)
    expect_equal(sort(el2[[i]]), sort(a), ignore_attr = TRUE)
  }
})

test_that("graph_from_graphnel() works", {
  skip_if_not_installed("graph")
  suppressPackageStartupMessages(library(graph, warn.conflicts = FALSE))

  g <- sample_gnp(100, 5 / 100)
  N <- as_graphnel(g)
  g2 <- graph_from_graphnel(N)
  gi <- graph.isomorphic.vf2(g, g2)
  expect_true(gi$iso)
  expect_equal(gi$map12, 1:vcount(g))
  expect_equal(gi$map21, 1:vcount(g))

  ## Attributes

  V(g)$name <- as.character(vcount(g):1)
  E(g)$weight <- sample(1:10, ecount(g), replace = TRUE)
  g$name <- "Foobar"

  N <- as_graphnel(g)
  g2 <- graph_from_graphnel(N)
  expect_isomorphic(g, g2)
  expect_equal(V(g)$name, V(g2)$name)

  A <- as_adjacency_matrix(g, attr = "weight", sparse = FALSE)
  A2 <- as_adjacency_matrix(g2, attr = "weight", sparse = FALSE)
  expect_equal(A, A)
  expect_equal(g$name, g2$name)
})

test_that("as_graphnel() does not duplicate loop edges", {
  skip_if_not_installed("graph")

  mat <- matrix(c(1, 0.5, 0.5, 0), nrow = 2)
  dimnames(mat) <- list(c("A", "B"), c("A", "B"))

  igr <- graph_from_adjacency_matrix(mat, mode = "undirected", weighted = TRUE)

  grNEL <- as_graphnel(igr)
  expect_equal(graph::edgeL(grNEL)$A$edges, c(1, 2))
})


test_that("as_long_data_frame() works correctly with and without names", {
  expect_snapshot({
    ring <- make_ring(3)
    as_long_data_frame(ring)

    V(ring)$name <- letters[1:3]
    as_long_data_frame(ring)

    V(ring)$score <- LETTERS[1:3]
    as_long_data_frame(ring)

    E(ring)$info <- 3:1
    as_long_data_frame(ring)
  })
})

test_that("as_biadjacency_matrix() works -- dense", {
  I <- matrix(sample(0:1, 35, replace = TRUE, prob = c(3, 1)), ncol = 5)
  g <- graph_from_biadjacency_matrix(I)
  I2 <- as_biadjacency_matrix(g)
  expect_equal(I, I2, ignore_attr = TRUE)
  expect_identical(rownames(I2), as.character(1:7))
  expect_identical(colnames(I2), as.character(8:12))
})

test_that("as_biadjacency_matrix() works -- dense named", {
  I <- matrix(sample(0:1, 35, replace = TRUE, prob = c(3, 1)), ncol = 5)
  g <- graph_from_biadjacency_matrix(I)
  V(g)$name <- letters[1:length(V(g))]

  expect_true(is_named(g))

  I2 <- as_biadjacency_matrix(g)
  expect_equal(I, I2, ignore_attr = TRUE)
  expect_identical(rownames(I2), c("a", "b", "c", "d", "e", "f", "g"))
  expect_identical(colnames(I2), c("h", "i", "j", "k", "l"))
})

test_that("as_biadjacency_matrix() works -- sparse", {
  I <- matrix(sample(0:1, 35, replace = TRUE, prob = c(3, 1)), ncol = 5)
  g <- graph_from_biadjacency_matrix(I)
  I3 <- as_biadjacency_matrix(g, sparse = TRUE)
  expect_equal(as.matrix(I3), I, ignore_attr = TRUE)
  expect_identical(rownames(I3), as.character(1:7))
  expect_identical(colnames(I3), as.character(8:12))
})
