test_that("graph_from_biadjacency_matrix() works -- dense", {
  local_igraph_options(print.id = FALSE)
  withr::local_seed(42)

  inc <- matrix(sample(0:1, 15, repl = TRUE), 3, 5)
  colnames(inc) <- letters[1:5]
  rownames(inc) <- LETTERS[1:3]

  expect_snapshot((g <- graph_from_biadjacency_matrix(inc)))
  expect_false(is_weighted(g))

  expect_snapshot((weighted_g <- graph_from_biadjacency_matrix(inc, weighted = TRUE)))
  expect_true(is_weighted(weighted_g))
})

test_that("graph_from_biadjacency_matrix() works - dense, modes", {
  local_igraph_options(print.id = FALSE)
  withr::local_seed(42)

  inc <- matrix(sample(0:1, 15, repl = TRUE), 3, 5)
  colnames(inc) <- letters[1:5]
  rownames(inc) <- LETTERS[1:3]

  out_g <- graph_from_biadjacency_matrix(inc, directed = TRUE, mode = "out")
  expect_true(is_directed(out_g))
  expect_length(E(out_g), 7)
  expect_equal(as_adj_list(out_g, mode = "out")$A %>% as.numeric(), c(6, 7))

  in_g <- graph_from_biadjacency_matrix(inc, directed = TRUE, mode = "in")
  expect_true(is_directed(in_g))
  expect_length(E(in_g), 7)
  expect_equal(as_adj_list(in_g, mode = "in")$A %>% as.numeric(), c(6, 7))

  total_g <- graph_from_biadjacency_matrix(inc, directed = TRUE, mode = "total")
  expect_true(is_directed(total_g))
  expect_length(E(total_g), 14)
  expect_equal(as_adj_list(total_g, mode = "all")$A %>% as.numeric(), c(6, 6, 7, 7))
})

test_that("graph_from_biadjacency_matrix() works - dense, modes, weighted", {
  local_igraph_options(print.id = FALSE)
  withr::local_seed(42)

  inc <- matrix(sample(0:1, 15, repl = TRUE), 3, 5)
  colnames(inc) <- letters[1:5]
  rownames(inc) <- LETTERS[1:3]

  out_g <- graph_from_biadjacency_matrix(inc, directed = TRUE, mode = "out", weighted = TRUE)
  expect_true(is_directed(out_g))
  expect_length(E(out_g), 7)
  expect_equal(as_adj_list(out_g, mode = "out")$A %>% as.numeric(), c(6, 7))

  in_g <- graph_from_biadjacency_matrix(inc, directed = TRUE, mode = "in", weighted = TRUE)
  expect_true(is_directed(in_g))
  expect_length(E(in_g), 7)
  expect_equal(as_adj_list(in_g, mode = "in")$A %>% as.numeric(), c(6, 7))

  total_g <- graph_from_biadjacency_matrix(inc, directed = TRUE, mode = "total", weighted = TRUE)
  expect_true(is_directed(total_g))
  expect_length(E(total_g), 14)
  expect_equal(as_adj_list(total_g, mode = "all")$A %>% as.numeric(), c(6, 6, 7, 7))
})

test_that("graph_from_biadjacency_matrix() works -- sparse", {
  local_igraph_options(print.id = FALSE)
  withr::local_seed(42)

  inc <- matrix(sample(0:1, 15, repl = TRUE), 3, 5)
  inc <- Matrix::Matrix(inc, sparse = TRUE)
  colnames(inc) <- letters[1:5]
  rownames(inc) <- LETTERS[1:3]

  expect_snapshot((g <- graph_from_biadjacency_matrix(inc)))
  expect_false(is_weighted(g))

  expect_snapshot((weighted_g <- graph_from_biadjacency_matrix(inc, weighted = TRUE)))
  expect_true(is_weighted(weighted_g))
})

test_that("graph_from_biadjacency_matrix() works -- sparse + multiple", {
  local_igraph_options(print.id = FALSE)
  withr::local_seed(42)

  inc <- matrix(sample(0:2, 15, repl = TRUE), 3, 5)
  inc <- Matrix::Matrix(inc, sparse = TRUE)
  colnames(inc) <- letters[1:5]
  rownames(inc) <- LETTERS[1:3]

  expect_snapshot((g <- graph_from_biadjacency_matrix(inc, multiple = TRUE)))
  expect_false(is_weighted(g))
})

test_that("graph_from_biadjacency_matrix() works - sparse, modes", {
  local_igraph_options(print.id = FALSE)
  withr::local_seed(42)

  inc <- matrix(sample(0:1, 15, repl = TRUE), 3, 5)
  inc <- Matrix::Matrix(inc, sparse = TRUE)
  colnames(inc) <- letters[1:5]
  rownames(inc) <- LETTERS[1:3]

  out_g <- graph_from_biadjacency_matrix(inc, directed = TRUE, mode = "out")
  expect_true(is_directed(out_g))
  expect_length(E(out_g), 7)
  expect_equal(as_adj_list(out_g, mode = "out")$A %>% as.numeric(), c(6, 7))

  in_g <- graph_from_biadjacency_matrix(inc, directed = TRUE, mode = "in")
  expect_true(is_directed(in_g))
  expect_length(E(in_g), 7)
  expect_equal(as_adj_list(in_g, mode = "in")$A %>% as.numeric(), c(6, 7))

  total_g <- graph_from_biadjacency_matrix(inc, directed = TRUE, mode = "total")
  expect_true(is_directed(total_g))
  expect_length(E(total_g), 14)
  expect_equal(as_adj_list(total_g, mode = "all")$A %>% as.numeric(), c(6, 6, 7, 7))
})

test_that("graph_from_biadjacency_matrix() works - sparse, modes, weighted", {
  local_igraph_options(print.id = FALSE)
  withr::local_seed(42)

  inc <- matrix(sample(0:1, 15, repl = TRUE), 3, 5)
  inc <- Matrix::Matrix(inc, sparse = TRUE)
  colnames(inc) <- letters[1:5]
  rownames(inc) <- LETTERS[1:3]

  out_g <- graph_from_biadjacency_matrix(inc, directed = TRUE, mode = "out", weighted= TRUE)
  expect_true(is_directed(out_g))
  expect_length(E(out_g), 7)
  expect_equal(as_adj_list(out_g, mode = "out")$A %>% as.numeric(), c(6, 7))

  in_g <- graph_from_biadjacency_matrix(inc, directed = TRUE, mode = "in", weighted= TRUE)
  expect_true(is_directed(in_g))
  expect_length(E(in_g), 7)
  expect_equal(as_adj_list(in_g, mode = "in")$A %>% as.numeric(), c(6, 7))

  total_g <- graph_from_biadjacency_matrix(inc, directed = TRUE, mode = "total", weighted= TRUE)
  expect_true(is_directed(total_g))
  expect_length(E(total_g), 14)
  expect_equal(as_adj_list(total_g, mode = "all")$A %>% as.numeric(), c(6, 6, 7, 7))
})

test_that("graph_from_biadjacency_matrix() errors well", {
  inc <- matrix(sample(0:1, 15, repl = TRUE), 3, 5)
  colnames(inc) <- letters[1:5]
  rownames(inc) <- LETTERS[1:3]

  expect_snapshot(error= TRUE, {
    (g <- graph_from_biadjacency_matrix(inc, weight = FALSE))
  })
  expect_snapshot(error = TRUE, {
    (g <- graph_from_biadjacency_matrix(inc, weight = 42))
  })
})
