test_that("as_directed works", {
  gnp_undirected <- sample_gnp(100, 2 / 100)
  gnp_mutual <- as_directed(gnp_undirected, mode = "mutual")
  expect_equal(degree(gnp_undirected), degree(gnp_mutual) / 2)
  expect_isomorphic(gnp_undirected, as_undirected(gnp_mutual))

  gnp_arbitrary <- as_directed(gnp_undirected, mode = "arbitrary")
  expect_equal(degree(gnp_undirected), degree(gnp_arbitrary))
  expect_isomorphic(gnp_undirected, as_undirected(gnp_arbitrary))

  gnp_random <- as_directed(gnp_undirected, mode = "random")
  expect_equal(degree(gnp_undirected), degree(gnp_random))
  expect_isomorphic(gnp_undirected, as_undirected(gnp_random))

  gnp_acyclic <- as_directed(gnp_undirected, mode = "acyclic")
  expect_equal(degree(gnp_undirected), degree(gnp_acyclic))
  expect_isomorphic(gnp_undirected, as_undirected(gnp_acyclic))
})

test_that("as_directed keeps attributes", {
  g <- graph_from_literal(A - B - C, D - A, E)
  g$name <- "Small graph"
  g_mutual <- as_directed(g, mode = "mutual")
  expect_equal(g_mutual$name, g$name)
  expect_equal(V(g_mutual)$name, V(g)$name)

  g_arbitrary <- as_directed(g, mode = "arbitrary")
  expect_equal(g_arbitrary$name, g$name)
  expect_equal(V(g_arbitrary)$name, V(g)$name)

  E(g)$weight <- seq_len(ecount(g))
  g_mutual <- as_directed(g, "mutual")
  df_mutual <- as_data_frame(g_mutual)
  expect_equal(df_mutual[order(df_mutual[, 1], df_mutual[, 2]), ]$weight, c(1, 2, 1, 3, 3, 2))

  g_arbitrary <- as_directed(g, "arbitrary")
  df_arbitrary <- as_data_frame(g_arbitrary)
  expect_equal(df_arbitrary[order(df_arbitrary[, 1], df_arbitrary[, 2]), ]$weight, 1:3)
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
  g <- graph_from_literal(A +-+ B, A --+ C, C +-+ D)
  g$name <- "Tiny graph"
  E(g)$weight <- seq_len(ecount(g))

  g_tiny <- as_undirected(g, mode = "collapse")
  df_tiny <- as_data_frame(g_tiny)
  expect_equal(g_tiny$name, g$name)
  expect_equal(df_tiny[order(df_tiny[, 1], df_tiny[, 2]), ]$weight, c(4, 2, 9))

  g_each <- as_undirected(g, mode = "each")
  df_each <- as_data_frame(g_each)
  expect_equal(g_each$name, g$name)
  expect_equal(df_each[order(df_each[, 1], df_each[, 2]), ]$weight, c(1, 3, 2, 4, 5))

  g_mutual <- as_undirected(g, mode = "mutual")
  df_mutual <- as_data_frame(g_mutual)
  expect_equal(g_mutual$name, g$name)
  expect_equal(df_mutual[order(df_mutual[, 1], df_mutual[, 2]), ]$weight, c(4, 9))
})

test_that("as_adjacency_matrix() works -- sparse", {
  g <- make_graph(c(1, 2, 2, 1, 2, 2, 3, 3, 3, 3, 3, 4, 4, 2, 4, 2, 4, 2), directed = TRUE)
  basic_adj_matrix <- as_adjacency_matrix(g)
  expect_s4_class(basic_adj_matrix, "dgCMatrix")
  expected_matrix <- matrix(
    c(0, 1, 0, 0, 1, 1, 0, 3, 0, 0, 2, 0, 0, 0, 1, 0),
    nrow = 4L, ncol = 4L
  )
  basic_adj_matrix_dense <- as_unnamed_dense_matrix(basic_adj_matrix)
  expect_equal(basic_adj_matrix_dense, expected_matrix)

  V(g)$name <- letters[1:vcount(g)]
  letter_adj_matrix <- as_adjacency_matrix(g)
  expect_s4_class(letter_adj_matrix, "dgCMatrix")
  expect_setequal(rownames(letter_adj_matrix), letters[1:vcount(g)])
  letter_adj_matrix_dense <- as_unnamed_dense_matrix(letter_adj_matrix)
  expect_equal(basic_adj_matrix_dense, letter_adj_matrix_dense)

  E(g)$weight <- c(1.2, 3.4, 2.7, 5.6, 6.0, 0.1, 6.1, 3.3, 4.3)
  weight_adj_matrix <- as_adjacency_matrix(g, attr = "weight")
  expect_s4_class(weight_adj_matrix, "dgCMatrix")
  expect_equal(
    as.matrix(weight_adj_matrix),
    matrix(
      c(0, 3.4, 0, 0, 1.2, 2.7, 0, 13.7, 0, 0, 11.6, 0, 0, 0, 0.1, 0),
      nrow = 4L,
      ncol = 4L,
      dimnames = list(c("a", "b", "c", "d"), c("a", "b", "c", "d"))
    )
  )
})

test_that("as_adjacency_matrix() works -- sparse + not both", {
  dg <- make_graph(c(1, 2, 2, 1, 2, 2, 3, 3, 3, 3, 3, 4, 4, 2, 4, 2, 4, 2), directed = TRUE)
  g <- as_undirected(dg, mode = "each")

  lower_adj_matrix <- as_adjacency_matrix(g, type = "lower")
  expect_s4_class(lower_adj_matrix, "dgCMatrix")
  lower_expected_matrix <- matrix(
    c(0, 2, 0, 0, 0, 1, 0, 3, 0, 0, 2, 1, 0, 0, 0, 0),
    nrow = 4L, ncol = 4L
  )
  lower_expected_matrix_dense <- as_unnamed_dense_matrix(lower_expected_matrix)
  expect_equal(lower_expected_matrix, lower_expected_matrix_dense)

  upper_adj_matrix <- as_adjacency_matrix(g, type = "upper")
  expect_s4_class(upper_adj_matrix, "dgCMatrix")
  upper_expected_matrix <- matrix(
    c(0, 0, 0, 0, 2, 1, 0, 0, 0, 0, 2, 0, 0, 3, 1, 0),
    nrow = 4L, ncol = 4L
  )
  upper_adj_matrix_dense <- as_unnamed_dense_matrix(upper_adj_matrix)
  expect_equal(upper_adj_matrix_dense, upper_expected_matrix)
})

test_that("as_adjacency_matrix() errors well -- sparse", {
  g <- make_graph(c(1, 2, 2, 1, 2, 2, 3, 3, 3, 3, 3, 4, 4, 2, 4, 2, 4, 2), directed = TRUE)
  expect_snapshot(as_adjacency_matrix(g, attr = "bla"), error = TRUE)

  E(g)$bla <- letters[1:ecount(g)]
  expect_snapshot(as_adjacency_matrix(g, attr = "bla"), error = TRUE)
})

test_that("as_adjacency_matrix() works -- sparse undirected", {
  dg <- make_graph(c(1, 2, 2, 1, 2, 2, 3, 3, 3, 3, 3, 4, 4, 2, 4, 2, 4, 2), directed = TRUE)
  ug <- as_undirected(dg, mode = "each")
  adj_matrix <- as_adjacency_matrix(ug)
  expect_s4_class(adj_matrix, "dgCMatrix")

  adj_matrix_dense <- as_unnamed_dense_matrix(adj_matrix)

  expect_equal(
    adj_matrix_dense,
    matrix(
      c(0, 2, 0, 0, 2, 1, 0, 3, 0, 0, 2, 1, 0, 3, 1, 0),
      nrow = 4L,
      ncol = 4L
    )
  )
})

test_that("as_adjacency_matrix() works -- dense", {
  g <- make_graph(c(1, 2, 2, 1, 2, 2, 3, 3, 3, 3, 3, 4, 4, 2, 4, 2, 4, 2), directed = TRUE)

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
      c(0, 3.4, 0, 0, 1.2, 2.7, 0, 13.7, 0, 0, 11.6, 0, 0, 0, 0.1, 0),
      nrow = 4L,
      ncol = 4L,
      dimnames = list(c("a", "b", "c", "d"), c("a", "b", "c", "d"))
    )
  )
})

test_that("as_adjacency_matrix() errors well -- dense", {
  g <- make_graph(c(1, 2, 2, 1, 2, 2, 3, 3, 3, 3, 3, 4, 4, 2, 4, 2, 4, 2), directed = TRUE)
  expect_snapshot(as_adjacency_matrix(g, attr = "bla", sparse = FALSE), error = TRUE)

  E(g)$bla <- letters[1:ecount(g)]
  expect_snapshot(as_adjacency_matrix(g, attr = "bla", sparse = FALSE), error = TRUE)
})


test_that("as_adjacency_matrix() works -- dense undirected", {
  dg <- make_graph(c(1, 2, 2, 1, 2, 2, 3, 3, 3, 3, 3, 4, 4, 2, 4, 2, 4, 2), directed = TRUE)
  ug <- as_undirected(dg, mode = "each")
  adj_matrix <- as_adjacency_matrix(ug, sparse = FALSE)
  dimnames(adj_matrix) <- NULL
  expect_equal(
    adj_matrix,
    matrix(
      c(0, 2, 0, 0, 2, 1, 0, 3, 0, 0, 2, 1, 0, 3, 1, 0),
      nrow = 4L, ncol = 4L
    )
  )

  E(ug)$weight <- c(1.2, 3.4, 2.7, 5.6, 6.0, 0.1, 6.1, 3.3, 4.3)
  weight_adj_matrix <- as_adjacency_matrix(ug, sparse = FALSE, attr = "weight")
  dimnames(weight_adj_matrix) <- NULL
  expect_equal(
    weight_adj_matrix,
    matrix(
      c(0, 4.6, 0, 0, 4.6, 2.7, 0, 13.7, 0, 0, 11.6, 0.1, 0, 13.7, 0.1, 0),
      nrow = 4L,
      ncol = 4L
    )
  )
})

test_that("as_adjacency_matrix() works -- dense + not both", {
  dg <- make_graph(c(1, 2, 2, 1, 2, 2, 3, 3, 3, 3, 3, 4, 4, 2, 4, 2, 4, 2), directed = TRUE)
  g <- as_undirected(dg, mode = "each")
  E(g)$attribute <- c(1.2, 3.4, 2.7, 5.6, 6.0, 0.1, 6.1, 3.3, 4.3)

  lower_adj_matrix <- as_adjacency_matrix(
    g,
    type = "lower",
    sparse = FALSE,
    attr = "attribute"
  )
  dimnames(lower_adj_matrix) <- NULL

  expect_equal(
    lower_adj_matrix,
    matrix(
      c(0, 4.6, 0, 0, 0, 2.7, 0, 13.7, 0, 0, 11.6, 0.1, 0, 0, 0, 0),
      nrow = 4L,
      ncol = 4L
    )
  )

  upper_adj_matrix <- as_adjacency_matrix(
    g,
    type = "upper",
    sparse = FALSE,
    attr = "attribute"
  )
  dimnames(upper_adj_matrix) <- NULL
  expect_equal(
    upper_adj_matrix,
    matrix(
      c(0, 0, 0, 0, 4.6, 2.7, 0, 0, 0, 0, 11.6, 0, 0, 13.7, 0.1, 0),
      nrow = 4L,
      ncol = 4L
    )
  )
})

test_that("as_adjacency_matrix() works -- dense + weights", {
  g <- make_full_graph(5, directed = FALSE)
  E(g)$weight <- 1:10
  mat <- matrix(0, 5, 5)
  mat[lower.tri(mat)] <- 1:10
  mat <- mat + t(mat)
  A <- as_adjacency_matrix(g, attr = "weight", sparse = FALSE)
  expect_equal(as_unnamed_dense_matrix(A), mat)
})

test_that("as_biadjacency_matrix() works -- dense + weights", {
  g <- make_bipartite_graph(c(0, 1, 0, 1, 0, 0), c(1, 2, 2, 3, 3, 4))
  E(g)$weight <- c(2, 4, 6)
  A <- as_biadjacency_matrix(g, attr = "weight", sparse = FALSE)
  mat <- matrix(
    c(2, 4, 0, 0, 0, 6, 0, 0),
    nrow = 4L,
    ncol = 2L,
    dimnames = list(c("1", "3", "5", "6"), c("2", "4"))
  )
  expect_equal(as_unnamed_dense_matrix(A), as_unnamed_dense_matrix(mat))
})

test_that("as_adj works", {
  g <- sample_gnp(50, 1 / 50)
  A <- as_adjacency_matrix(g, sparse = FALSE)
  g2 <- graph_from_adjacency_matrix(A, mode = "undirected")
  expect_isomorphic(g, g2)

  A <- as_adjacency_matrix(g, sparse = TRUE)
  g2 <- graph_from_adjacency_matrix(A, mode = "undirected")
  expect_isomorphic(g, g2)

  g <- sample_gnp(50, 2 / 50, directed = TRUE)
  A <- as_adjacency_matrix(g, sparse = FALSE)
  g2 <- graph_from_adjacency_matrix(A)
  expect_isomorphic(g, g2)

  A <- as_adjacency_matrix(g, sparse = TRUE)
  g2 <- graph_from_adjacency_matrix(A)
  expect_isomorphic(g, g2)
})

test_that("as_adj_list works", {
  g <- sample_gnp(50, 2 / 50)
  adj_list <- as_adj_list(g)
  expect_s3_class(adj_list[[1]], "igraph.vs")
  g_same <- graph_from_adj_list(adj_list, mode = "all")
  expect_isomorphic(g, g_same)
  expect_isomorphic(g, g_same,
    method = "vf2",
    vertex.color1 = seq_len(vcount(g)),
    vertex.color2 = seq_len(vcount(g_same))
  )

  adj_el_list <- as_adj_edge_list(g)
  expect_s3_class(adj_el_list[[1]], "igraph.es")
  for (i in seq_len(vcount(g))) {
    incident_to_i <- E(g)[.inc(i)]
    expect_equal(length(incident_to_i), length(adj_el_list[[i]]), ignore_attr = TRUE)
    expect_equal(sort(adj_el_list[[i]]), sort(incident_to_i), ignore_attr = TRUE)
  }

  g <- sample_gnp(50, 4 / 50, directed = TRUE)
  adj_el_list_out <- as_adj_edge_list(g, mode = "out")
  for (i in seq_len(vcount(g))) {
    incident_to_i <- E(g)[.from(i)]
    expect_equal(length(incident_to_i), length(adj_el_list_out[[i]]), ignore_attr = TRUE)
    expect_equal(sort(adj_el_list_out[[i]]), sort(incident_to_i), ignore_attr = TRUE)
  }

  adj_el_list_in <- as_adj_edge_list(g, mode = "in")
  for (i in seq_len(vcount(g))) {
    incident_to_i <- E(g)[.to(i)]
    expect_equal(length(incident_to_i), length(adj_el_list_in[[i]]), ignore_attr = TRUE)
    expect_equal(sort(adj_el_list_in[[i]]), sort(incident_to_i), ignore_attr = TRUE)
  }
})

test_that("as_adj_list works when return.vs.es is FALSE", {
  on.exit(try(igraph_options(old)), add = TRUE)
  old <- igraph_options(return.vs.es = FALSE)

  g <- sample_gnp(50, 2 / 50)
  adj_list <- as_adj_list(g)
  expect_s3_class(adj_list[[1]], NA)
  g2 <- graph_from_adj_list(adj_list, mode = "all")
  expect_isomorphic(g, g2)
  expect_isomorphic(g, g2,
    method = "vf2",
    vertex.color1 = 1:vcount(g),
    vertex.color2 = 1:vcount(g2)
  )

  adj_el_list <- as_adj_edge_list(g)
  for (i in seq_len(vcount(g))) {
    incident_to_i <- E(g)[.inc(i)]
    expect_equal(length(incident_to_i), length(adj_el_list[[i]]), ignore_attr = TRUE)
    expect_equal(sort(adj_el_list[[i]]), sort(incident_to_i), ignore_attr = TRUE)
  }

  g <- sample_gnp(50, 4 / 50, directed = TRUE)
  adj_el_list_out <- as_adj_edge_list(g, mode = "out")
  for (i in seq_len(vcount(g))) {
    incident_to_i <- E(g)[.from(i)]
    expect_equal(length(incident_to_i), length(adj_el_list_out[[i]]), ignore_attr = TRUE)
    expect_equal(sort(adj_el_list_out[[i]]), sort(incident_to_i), ignore_attr = TRUE)
  }

  adj_el_list_in <- as_adj_edge_list(g, mode = "in")
  for (i in seq_len(vcount(g))) {
    incident_to_i <- E(g)[.to(i)]
    expect_equal(length(incident_to_i), length(adj_el_list_in[[i]]), ignore_attr = TRUE)
    expect_equal(sort(adj_el_list_in[[i]]), sort(incident_to_i), ignore_attr = TRUE)
  }
})

test_that("as_edgelist works", {
  g <- sample_gnp(100, 3 / 100)
  el <- as_edgelist(g)
  g2 <- make_graph(t(el), n = vcount(g), dir = FALSE)
  expect_isomorphic(g, g2)
})

test_that("as_biadjacency_matrix() works -- dense", {
  biadj_mat <- matrix(sample(0:1, 35, replace = TRUE, prob = c(3, 1)), ncol = 5)
  g <- graph_from_biadjacency_matrix(biadj_mat)
  biadj_mat2 <- as_biadjacency_matrix(g)
  expect_equal(biadj_mat, biadj_mat2, ignore_attr = TRUE)
  expect_identical(rownames(biadj_mat2), as.character(1:7))
  expect_identical(colnames(biadj_mat2), as.character(8:12))
})

test_that("as_biadjacency_matrix() works -- dense named", {
  biadj_mat <- matrix(sample(0:1, 35, replace = TRUE, prob = c(3, 1)), ncol = 5)
  g <- graph_from_biadjacency_matrix(biadj_mat)
  V(g)$name <- letters[1:length(V(g))]

  expect_true(is_named(g))

  biadj_mat2 <- as_biadjacency_matrix(g)
  expect_equal(biadj_mat, biadj_mat2, ignore_attr = TRUE)
  expect_identical(rownames(biadj_mat2), c("a", "b", "c", "d", "e", "f", "g"))
  expect_identical(colnames(biadj_mat2), c("h", "i", "j", "k", "l"))
})

test_that("as_biadjacency_matrix() works -- sparse", {
  biadj_mat <- matrix(sample(0:1, 35, replace = TRUE, prob = c(3, 1)), ncol = 5)
  g <- graph_from_biadjacency_matrix(biadj_mat)
  biadj_mat2 <- as_biadjacency_matrix(g, sparse = TRUE)
  expect_equal(as.matrix(biadj_mat2), biadj_mat, ignore_attr = TRUE)
  expect_identical(rownames(biadj_mat2), as.character(1:7))
  expect_identical(colnames(biadj_mat2), as.character(8:12))
})

test_that("graph_from_adj_list works", {
  g <- sample_gnp(100, 3 / 100)
  adj_list <- as_adj_list(g)
  g2 <- graph_from_adj_list(adj_list, mode = "all")
  expect_isomorphic(g, g2)

  ##

  g <- sample_gnp(100, 3 / 100, directed = TRUE)
  adj_list_out <- as_adj_list(g, mode = "out")
  g2 <- graph_from_adj_list(adj_list_out, mode = "out")
  expect_isomorphic(g, g2)
})

test_that("graph_from_edgelist works", {
  withr::local_seed(20230115)

  g <- sample_gnp(50, 5 / 50)
  el <- as_edgelist(g)
  g2 <- graph_from_edgelist(el, directed = FALSE)
  expect_isomorphic(g, g2)

  ####

  g <- sample_gnp(50, 5 / 50, directed = TRUE)
  el <- as_edgelist(g)
  g2 <- graph_from_edgelist(el, directed = TRUE)
  expect_isomorphic(g, g2)

  ####

  g <- sample_gnp(26, 5 / 26, directed = TRUE)
  el <- as_edgelist(g)
  n <- letters[1:26]
  names(n) <- 1:26
  mode(el) <- "character"
  el[] <- n[el]
  g2 <- graph_from_edgelist(el, directed = TRUE)
  expect_isomorphic(g, g2)
})

test_that("graphNEL conversion works", {
  skip_if_not_installed("graph")

  set.seed(20250122)

  g <- sample_gnp(100, 5 / 100)
  g_graphnel <- as_graphnel(g)
  g2 <- graph_from_graphnel(g_graphnel)
  gi <- isomorphic(g, g2, method = "vf2")
  expect_true(gi)

  ## Attributes

  V(g)$name <- as.character(vcount(g):1)
  E(g)$weight <- sample(1:10, ecount(g), replace = TRUE)
  g$name <- "Foobar"

  g_graphnel1 <- as_graphnel(g)
  g2 <- graph_from_graphnel(g_graphnel1)
  expect_isomorphic(g, g2)
  expect_equal(V(g)$name, V(g2)$name)

  A <- as_adjacency_matrix(g, attr = "weight", sparse = FALSE)
  A2 <- as_adjacency_matrix(g2, attr = "weight", sparse = FALSE)
  expect_equal(A, A)
  expect_equal(g$name, g2$name)
})

test_that("graphNEL does not duplicate loop edges", {
  skip_if_not_installed("graph")

  mat <- matrix(c(1, 0.5, 0.5, 0), nrow = 2)
  dimnames(mat) <- list(c("A", "B"), c("A", "B"))

  igr <- graph_from_adjacency_matrix(mat, mode = "undirected", weighted = T)

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

test_that("graph_from_data_frame works", {
  local_igraph_options(print.full = TRUE)

  actors <- data.frame(
    name = c(
      "Alice", "Bob", "Cecil", "David",
      "Esmeralda"
    ),
    age = c(48, 33, 45, 34, 21),
    gender = c("F", "M", "F", "M", "F"),
    stringsAsFactors = FALSE
  )
  relations <- data.frame(
    from = c(
      "Bob", "Cecil", "Cecil", "David",
      "David", "Esmeralda"
    ),
    to = c(
      "Alice", "Bob", "Alice", "Alice",
      "Bob", "Alice"
    ),
    same.dept = c(FALSE, FALSE, TRUE, FALSE, FALSE, TRUE),
    friendship = c(4, 5, 5, 2, 1, 1), advice = c(4, 5, 5, 4, 2, 3),
    stringsAsFactors = FALSE
  )
  g <- graph_from_data_frame(relations, directed = TRUE, vertices = actors)

  df <- as_data_frame(g, what = "both")
  expect_equal(df$vertices, actors, ignore_attr = TRUE)
  expect_equal(df$edges, relations)
})

test_that("graph_from_data_frame() creates attributes for zero-row data frames (#466)", {
  x <- data.frame(from = integer(), to = integer(), foo = integer(), bar = numeric())
  g <- graph_from_data_frame(x)
  expect_identical(E(g)$foo, integer())
  expect_identical(E(g)$bar, numeric())
})

test_that("graph_from_data_frame works on matrices", {
  el <- cbind(1:5, 5:1, weight = 1:5)
  g <- graph_from_data_frame(el)
  g <- delete_vertex_attr(g, "name")
  el2 <- as_data_frame(g)
  expect_equal(as.data.frame(el), el2, ignore_attr = TRUE)
})

test_that("edge names work", {
  ## named edges
  local_igraph_options(print.edge.attributes = TRUE)
  g <- make_ring(10)
  E(g)$name <- letters[1:ecount(g)]
  g2 <- delete_edges(g, c("b", "d", "e"))
  expect_equal(
    as_edgelist(g2),
    structure(c(1, 3, 6, 7, 8, 9, 1, 2, 4, 7, 8, 9, 10, 10), .Dim = c(7L, 2L))
  )

  ## named vertices
  g <- make_ring(10)
  V(g)$name <- letters[1:vcount(g)]
  g3 <- delete_edges(g, c("a|b", "f|g", "c|b"))
  expect_equal(
    as_edgelist(g3),
    structure(c("c", "d", "e", "g", "h", "i", "a", "d", "e", "f", "h", "i", "j", "j"), .Dim = c(7L, 2L))
  )


  ## no names at all, but select edges based on vertices
  g <- make_ring(10)
  g4 <- delete_edges(g, c("1|2", "8|7", "1|10"))
  expect_equal(
    as_edgelist(g4),
    structure(c(2, 3, 4, 5, 6, 8, 9, 3, 4, 5, 6, 7, 9, 10), .Dim = c(7L, 2L))
  )


  ## mix edge names and vertex names
  g <- make_ring(10)
  V(g)$name <- letters[1:vcount(g)]
  E(g)$name <- LETTERS[1:ecount(g)]
  g5 <- delete_edges(g, c("a|b", "F", "j|i"))
  expect_equal(
    as_edgelist(g5),
    structure(c("b", "c", "d", "e", "g", "h", "a", "c", "d", "e", "f", "h", "i", "j"), .Dim = c(7L, 2L))
  )
})

test_that("graph_from_data_frame works with factors", {
  actors <- data.frame(
    name = c("Alice", "Bob", "Cecil", "David", "Esmeralda"),
    age = c(48, 33, 45, 34, 21),
    gender = factor(c("F", "M", "F", "M", "F"))
  )
  relations <- data.frame(
    from = c(
      "Bob", "Cecil", "Cecil", "David",
      "David", "Esmeralda"
    ),
    to = c("Alice", "Bob", "Alice", "Alice", "Bob", "Alice"),
    same.dept = c(FALSE, FALSE, TRUE, FALSE, FALSE, TRUE),
    friendship = c(4, 5, 5, 2, 1, 1), advice = c(4, 5, 5, 4, 2, 3)
  )
  g <- graph_from_data_frame(relations, directed = TRUE, vertices = actors)

  g_actors <- as_data_frame(g, what = "vertices")

  expect_true(is.factor(V(g)$gender))
  expect_true(is.factor(g_actors$gender))
})
