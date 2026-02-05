test_that("as_veincidence_matrix works for simple undirected graph", {
  g <- make_ring(3, circular = FALSE)
  inc <- as_veincidence_matrix(g, sparse = FALSE)
  
  expect_equal(nrow(inc), 3)
  expect_equal(ncol(inc), 2)
  
  # Vertices 1 and 2 are incident to edge 1
  expect_equal(inc[1, 1], 1)
  expect_equal(inc[2, 1], 1)
  expect_equal(inc[3, 1], 0)
  
  # Vertices 2 and 3 are incident to edge 2
  expect_equal(inc[1, 2], 0)
  expect_equal(inc[2, 2], 1)
  expect_equal(inc[3, 2], 1)
})

test_that("as_veincidence_matrix works for simple directed graph", {
  g <- make_ring(3, circular = FALSE, directed = TRUE)
  inc <- as_veincidence_matrix(g, sparse = FALSE)
  
  expect_equal(nrow(inc), 3)
  expect_equal(ncol(inc), 2)
  
  # Edge 1 goes from vertex 1 to vertex 2
  expect_equal(inc[1, 1], -1)
  expect_equal(inc[2, 1], 1)
  expect_equal(inc[3, 1], 0)
  
  # Edge 2 goes from vertex 2 to vertex 3
  expect_equal(inc[1, 2], 0)
  expect_equal(inc[2, 2], -1)
  expect_equal(inc[3, 2], 1)
})

test_that("as_veincidence_matrix works with weights for undirected graph", {
  g <- make_ring(3, circular = FALSE)
  E(g)$weight <- c(2, 3)
  inc <- as_veincidence_matrix(g, attr = "weight", sparse = FALSE)
  
  expect_equal(inc[1, 1], 2)
  expect_equal(inc[2, 1], 2)
  expect_equal(inc[2, 2], 3)
  expect_equal(inc[3, 2], 3)
})

test_that("as_veincidence_matrix works with weights for directed graph", {
  g <- make_ring(3, circular = FALSE, directed = TRUE)
  E(g)$weight <- c(2, 5)
  inc <- as_veincidence_matrix(g, attr = "weight", sparse = FALSE)
  
  expect_equal(inc[1, 1], -2)
  expect_equal(inc[2, 1], 2)
  expect_equal(inc[2, 2], -5)
  expect_equal(inc[3, 2], 5)
})

test_that("as_veincidence_matrix works with vertex names", {
  g <- graph_from_literal(a-b, b-c, c-d)
  inc <- as_veincidence_matrix(g, sparse = FALSE)
  
  expect_equal(rownames(inc), c("a", "b", "c", "d"))
  expect_equal(ncol(inc), 3)
})

test_that("as_veincidence_matrix works with edge labels", {
  g <- graph_from_literal(a-b, b-c)
  E(g)$label <- c("e1", "e2")
  inc <- as_veincidence_matrix(g, sparse = FALSE)
  
  expect_equal(colnames(inc), c("e1", "e2"))
})

test_that("as_veincidence_matrix works with undirected loops", {
  g <- make_graph(c(1, 1, 1, 2), directed = FALSE)
  inc <- as_veincidence_matrix(g, sparse = FALSE)
  
  expect_equal(nrow(inc), 2)
  expect_equal(ncol(inc), 2)
  
  # First edge is a loop on vertex 1, should have value 2
  expect_equal(inc[1, 1], 2)
  expect_equal(inc[2, 1], 0)
  
  # Second edge connects vertices 1 and 2
  expect_equal(inc[1, 2], 1)
  expect_equal(inc[2, 2], 1)
})

test_that("as_veincidence_matrix works with directed loops", {
  g <- make_graph(c(1, 1, 1, 2), directed = TRUE)
  inc <- as_veincidence_matrix(g, sparse = FALSE)
  
  expect_equal(nrow(inc), 2)
  expect_equal(ncol(inc), 2)
  
  # First edge is a loop on vertex 1, should have value 0
  expect_equal(inc[1, 1], 0)
  expect_equal(inc[2, 1], 0)
  
  # Second edge goes from vertex 1 to vertex 2
  expect_equal(inc[1, 2], -1)
  expect_equal(inc[2, 2], 1)
})

test_that("as_veincidence_matrix works with sparse matrices", {
  g <- make_ring(5, circular = FALSE)
  inc_sparse <- as_veincidence_matrix(g, sparse = TRUE)
  inc_dense <- as_veincidence_matrix(g, sparse = FALSE)
  
  expect_true(inherits(inc_sparse, "Matrix"))
  expect_true(inherits(inc_sparse, "sparseMatrix"))
  expect_equal(as.matrix(inc_sparse), inc_dense)
})

test_that("as_veincidence_matrix works with multi-edges", {
  g <- make_graph(c(1, 2, 1, 2, 2, 3), directed = FALSE)
  inc <- as_veincidence_matrix(g, sparse = FALSE)
  
  expect_equal(nrow(inc), 3)
  expect_equal(ncol(inc), 3)
  
  # Two edges between vertices 1 and 2
  expect_equal(inc[1, 1], 1)
  expect_equal(inc[2, 1], 1)
  expect_equal(inc[1, 2], 1)
  expect_equal(inc[2, 2], 1)
  
  # One edge between vertices 2 and 3
  expect_equal(inc[2, 3], 1)
  expect_equal(inc[3, 3], 1)
})

test_that("as_veincidence_matrix works with weighted multi-edges", {
  g <- make_graph(c(1, 2, 1, 2, 2, 3), directed = TRUE)
  E(g)$weight <- c(2, 3, 5)
  inc <- as_veincidence_matrix(g, attr = "weight", sparse = FALSE)
  
  expect_equal(inc[1, 1], -2)
  expect_equal(inc[2, 1], 2)
  expect_equal(inc[1, 2], -3)
  expect_equal(inc[2, 2], 3)
  expect_equal(inc[2, 3], -5)
  expect_equal(inc[3, 3], 5)
})

test_that("as_veincidence_matrix works with empty graph", {
  g <- make_empty_graph(5)
  inc <- as_veincidence_matrix(g, sparse = FALSE)
  
  expect_equal(nrow(inc), 5)
  expect_equal(ncol(inc), 0)
})

test_that("as_veincidence_matrix fails with non-numeric edge attribute", {
  g <- make_ring(3, circular = FALSE)
  E(g)$label <- c("a", "b")
  
  expect_error(
    as_veincidence_matrix(g, attr = "label"),
    "must be numeric"
  )
})

test_that("as_veincidence_matrix fails with non-existent edge attribute", {
  g <- make_ring(3, circular = FALSE)
  
  expect_error(
    as_veincidence_matrix(g, attr = "nonexistent"),
    "No such edge attribute"
  )
})

test_that("as_veincidence_matrix relationship with Laplacian", {
  # For a graph's incidence matrix B:
  # - For undirected graphs: B * B^T = D + A (signless Laplacian), not D - A
  # - For directed graphs: B * B^T gives a symmetric matrix (not the out-Laplacian)
  g <- make_ring(4, circular = TRUE)
  
  B <- as_veincidence_matrix(g, sparse = FALSE, names = FALSE)
  
  # For undirected graphs: B * B^T gives the signless Laplacian Q = D + A
  Q_computed <- B %*% t(B)
  
  # Verify it's positive semidefinite (all diagonal elements are positive)
  expect_true(all(diag(Q_computed) > 0))
  
  # Verify dimensions
  expect_equal(nrow(B), vcount(g))
  expect_equal(ncol(B), ecount(g))
  expect_equal(nrow(Q_computed), vcount(g))
  expect_equal(ncol(Q_computed), vcount(g))
  
  # Verify symmetry
  expect_true(isSymmetric(Q_computed))
})

test_that("as_veincidence_matrix relationship with weighted Laplacian", {
  # For weighted graphs, just verify dimensions and basic properties
  g <- make_ring(4, circular = TRUE)
  E(g)$weight <- c(1, 2, 3, 4)
  
  B_w <- as_veincidence_matrix(g, attr = "weight", sparse = FALSE)
  L <- laplacian_matrix(g, weights = E(g)$weight, sparse = FALSE)
  
  # Verify dimensions match
  expect_equal(nrow(B_w), vcount(g))
  expect_equal(ncol(B_w), ecount(g))
  expect_equal(nrow(L), vcount(g))
  expect_equal(ncol(L), vcount(g))
  
  # Verify B_w * B_w^T is symmetric for undirected graphs
  Q <- B_w %*% t(B_w)
  expect_true(isSymmetric(Q))
})

test_that("as_veincidence_matrix names parameter works", {
  g <- graph_from_literal(a-b, b-c)
  E(g)$label <- c("e1", "e2")
  
  inc_named <- as_veincidence_matrix(g, names = TRUE, sparse = FALSE)
  inc_unnamed <- as_veincidence_matrix(g, names = FALSE, sparse = FALSE)
  
  expect_equal(rownames(inc_named), c("a", "b", "c"))
  expect_equal(colnames(inc_named), c("e1", "e2"))
  expect_null(rownames(inc_unnamed))
  expect_null(colnames(inc_unnamed))
})

test_that("as_veincidence_matrix examples from issue work correctly", {
  # Example g2: Undirected, multi edge
  g2 <- make_graph(c(1, 2, 1, 2, 2, 3), directed = FALSE)
  inc2 <- as_veincidence_matrix(g2, sparse = FALSE, names = FALSE)
  
  expected2 <- matrix(c(1, 1, 0, 1, 1, 0, 0, 1, 1), nrow = 3, ncol = 3)
  expect_equal(inc2, expected2)
  
  # Example g4w: Directed, multi edge, weighted
  g4w <- make_graph(c(1, 2, 1, 2, 2, 3), directed = TRUE)
  E(g4w)$weight <- c(2, 3, 5)
  E(g4w)$label <- c("2", "3", "5")
  inc4w <- as_veincidence_matrix(g4w, attr = "weight", sparse = FALSE, names = FALSE)
  
  expected4w <- matrix(c(-2, 2, 0, -3, 3, 0, 0, -5, 5), nrow = 3, ncol = 3)
  expect_equal(inc4w, expected4w)
  
  # Example g6: Named graph, directed
  g6 <- graph_from_literal(a-+b-+c-+a, a-+d, simplify = FALSE)
  E(g6)$label <- c("1", "2", "3", "4")
  inc6 <- as_veincidence_matrix(g6, sparse = FALSE)
  
  expect_equal(rownames(inc6), c("a", "b", "c", "d"))
  expect_equal(colnames(inc6), c("1", "2", "3", "4"))
  
  # Example g7: Undirected graph with loops
  g7 <- make_graph(c(1, 1, 1, 1, 1, 2, 1, 2), directed = FALSE)
  inc7 <- as_veincidence_matrix(g7, sparse = FALSE, names = FALSE)
  
  expected7 <- matrix(c(2, 0, 2, 0, 1, 1, 1, 1), nrow = 2, ncol = 4)
  expect_equal(inc7, expected7)
  
  # Example g8: Directed graph with loops
  g8 <- make_graph(c(1, 1, 1, 1, 1, 2, 1, 2), directed = TRUE)
  inc8 <- as_veincidence_matrix(g8, sparse = FALSE, names = FALSE)
  
  expected8 <- matrix(c(0, 0, 0, 0, -1, 1, -1, 1), nrow = 2, ncol = 4)
  expect_equal(inc8, expected8)
})
