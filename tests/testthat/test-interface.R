test_that("add_edges keeps edge id order", {
  g <- make_empty_graph(10)
  edges <- c(1, 2, 2, 3, 3, 4, 1, 6, 1, 7, 9, 10)
  g2 <- add_edges(g, edges)

  expect_equal(ecount(g2), length(edges) / 2)
  expect_equal(get_edge_ids(g2, edges), seq_len(length(edges) / 2))
})

test_that("add_edges adds attributes", {
  g <- make_empty_graph(10)
  edges <- c(1, 5, 2, 6, 3, 10, 4, 5)
  weights <- c(1, 2, 1, -1)
  g3 <- add_edges(g, edges, attr = list(weight = weights))

  expect_equal(ecount(g3), (length(edges) / 2))
  expect_equal(get_edge_ids(g3, edges), seq_len(length(edges) / 2))
  expect_equal(E(g3)$weight, weights)
})

test_that("add_edges unknown attributes to NA", {
  g <- make_empty_graph(10)
  edges <- c(1, 2, 2, 3, 3, 4, 1, 6, 1, 7, 9, 10)
  g2 <- add_edges(g, edges)
  g4 <- add_edges(g2, c(1, 4, 4, 6, 7, 1), attr = list(weight = c(-1, 1, -2.5)))

  expect_true(all(is.na(E(g4)$weight[seq_len(length(edges) / 2)])))
})

test_that("add_edges appends attributes properly", {
  g <- make_empty_graph(10)
  edges1 <- c(1, 5, 2, 6, 3, 10, 4, 5)
  weights1 <- c(1, 2, 1, -1)
  g2 <- add_edges(g, edges1, attr = list(weight = weights1))

  edges2 <- c(10, 9, 10, 10, 1, 1)
  weights2 <- c(100, 100, 100)
  g3 <- add_edges(g2, edges2, attr = list(weight = weights2))
  expect_equal(E(g3)$weight, c(weights1, weights2))
})

test_that("add_edges signals error for zero vertex ids", {
  g <- make_full_graph(5) %du% make_full_graph(5) %du% make_full_graph(5)
  expect_error(add_edges(g, c(0, 5, 0, 10, 5, 10)), "Invalid vertex")
})

test_that("add_vertices works", {
  g <- graph_from_literal(A - B - C - D - E)
  nv <- 4
  g2 <- add_vertices(g, nv = nv)

  expect_equal(vcount(g2), vcount(g) + nv)
  expect_equal(ecount(g2), ecount(g))
  expect_equal(as_edgelist(g2), as_edgelist(g))
})

test_that("add_vertices handles attributes properly", {
  g <- graph_from_literal(A - B - C - D - E)
  nv <- 3
  names <- c("F", "G", "H")
  weights <- 1:3
  g3 <- add_vertices(g, nv = nv, attr = list(name = names, weight = weights))

  expect_equal(V(g3)$name, c(V(g)$name, names))
  expect_equal(V(g3)$weight, c(rep(NA, vcount(g)), weights))
})

test_that("delete_vertices works", {
  g <- graph_from_literal(A:B:C - D:E:F, D - E - F)

  g2 <- delete_vertices(g, "A")
  expect_equal(V(g2)$name, c("B", "C", "D", "E", "F"))

  g3 <- delete_vertices(g, match("A", V(g)$name))
  expect_isomorphic(g2, g3)
})

test_that("neighbors works", {
  g <- sample_gnp(100, 20 / 100)
  al <- as_adj_list(g, mode = "all")
  expect_s3_class(neighbors(g, v = 1, mode = "out"), "igraph.vs")
  for (i in seq_along(al)) {
    n <- neighbors(g, v = i, mode = "out")
    expect_setequal(sort(n), al[[i]])
  }

  # test with return.vs.es = FALSE
  on.exit(try(igraph_options(old)), add = TRUE)
  old <- igraph_options(return.vs.es = FALSE)

  al <- as_adj_list(g, mode = "all")
  expect_s3_class(neighbors(g, v = 1, mode = "out"), NA)
  for (i in seq_along(al)) {
    n <- neighbors(g, v = i, mode = "out")
    expect_setequal(sort(n), al[[i]])
  }
})


test_that("neighbors prints an error for an empty input vector", {
  g <- make_tree(10)
  expect_error(neighbors(g, numeric()), "No vertex was specified")
})


test_that("adjacent_vertices works", {
  g <- sample_gnp(100, 20 / 100)
  al <- as_adj_list(g, mode = "all")
  test_vertices <- c(1, 7, 38, 75, 99)
  adj_vertices <- adjacent_vertices(g, v = test_vertices)
  expect_s3_class(adj_vertices[[1]], "igraph.vs")
  for (i in seq_along(test_vertices)) {
    expect_setequal(adj_vertices[[i]], al[[test_vertices[i]]])
  }

  # test with return.vs.es = FALSE
  on.exit(try(igraph_options(old)), add = TRUE)
  old <- igraph_options(return.vs.es = FALSE)

  al <- as_adj_list(g, mode = "all")
  test_vertices <- c(1, 7, 38, 75, 99)
  adj_vertices <- adjacent_vertices(g, v = test_vertices)
  expect_s3_class(adj_vertices[[1]], NA)
  for (i in seq_along(test_vertices)) {
    expect_setequal(adj_vertices[[i]], al[[test_vertices[i]]])
  }
})


test_that("incident_edges works", {
  g <- sample_gnp(100, 20 / 100)
  el <- as_adj_edge_list(g, mode = "all")
  test_vertices <- c(1, 7, 38, 75, 99)
  inc_edges <- incident_edges(g, v = test_vertices)
  expect_s3_class(inc_edges[[1]], "igraph.es")
  for (i in seq_along(test_vertices)) {
    expect_setequal(inc_edges[[i]], el[[test_vertices[i]]])
  }

  # test with return.vs.es = FALSE
  on.exit(try(igraph_options(old)), add = TRUE)
  old <- igraph_options(return.vs.es = FALSE)

  el <- as_adj_edge_list(g, mode = "all")
  test_vertices <- c(1, 7, 38, 75, 99)
  inc_edges <- incident_edges(g, v = test_vertices)
  expect_s3_class(inc_edges[[1]], NA)
  for (i in seq_along(test_vertices)) {
    expect_setequal(inc_edges[[i]], el[[test_vertices[i]]])
  }
})

test_that("delete_edges works", {
  g <- graph_from_literal(A:B:C - D:E:F, D - E - F)
  g2 <- delete_edges(g, E(g, P = c("D", "E")))

  expected_matrix <- matrix(
    c(
      0, 0, 0, 1, 1, 1,
      0, 0, 0, 1, 1, 1,
      0, 0, 0, 1, 1, 1,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 1,
      1, 1, 1, 0, 1, 0
    ),
    nrow = 6L,
    ncol = 6L,
    dimnames = list(c("A", "B", "C", "D", "E", "F"), c("A", "B", "C", "D", "E", "F"))
  )

  expect_equal(as.matrix(g2[]), expected_matrix)
})

test_that("ends works", {
  g <- sample_gnp(100, 3 / 100)
  edges <- unlist(lapply(seq_len(ecount(g)), ends, graph = g))
  g2 <- make_graph(edges, dir = FALSE, n = vcount(g))
  expect_isomorphic(g, g2)
})

test_that("get.edge.ids() deprecation", {
  g <- make_empty_graph(10)
  expect_snapshot(get.edge.ids(g, 1:2))
  expect_snapshot(get.edge.ids(g, 1:2, multi = TRUE), error = TRUE)
})

test_that("get_edge_id() works with data frame", {
  g <- make_full_graph(3, directed = FALSE)
  el_df <- data.frame(from = c(1, 1), to = c(2, 3))
  expect_equal(get_edge_ids(g, el_df), c(1, 2))
})

test_that("get_edge_id() errors correctly", {
  g <- make_full_graph(3, directed = FALSE)
  el_g <- make_empty_graph()
  expect_error(get_edge_ids(g, el_g))
  expect_error(get_edge_ids(g, NULL))
  expect_error(get_edge_ids(g, NA))
})
