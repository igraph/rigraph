test_that("bipartite_projection works", {
  local_rng_version("3.5.0")
  withr::local_seed(42)

  g <- make_full_bipartite_graph(10, 5)
  proj <- bipartite_projection(g)
  expect_isomorphic(proj[[1]], make_full_graph(10))
  expect_isomorphic(proj[[2]], make_full_graph(5))

  biadj_mat <- matrix(0, nrow = 5, ncol = 3)
  rownames(biadj_mat) <- c("Alice", "Bob", "Cecil", "Dan", "Ethel")
  colnames(biadj_mat) <- c("Party", "Skiing", "Badminton")
  biadj_mat[] <- sample(0:1, length(biadj_mat), replace = TRUE)
  biadj_mat
  g2 <- graph_from_biadjacency_matrix(biadj_mat)
  expect_equal(as.matrix(g2[1:5, 6:8]), biadj_mat)
  expect_equal(as_unnamed_dense_matrix(g2[1:5, 1:5]), matrix(0, 5, 5))
  expect_equal(as_unnamed_dense_matrix(g2[6:8, 6:8]), matrix(0, 3, 3))

  g2$name <- "Event network"
  proj2 <- bipartite_projection(g2)
  expect_equal(
    as_unnamed_dense_matrix(proj2[[1]][]),
    cbind(c(0, 2, 0, 2, 2), c(2, 0, 1, 2, 2), c(0, 1, 0, 0, 0), c(2, 2, 0, 0, 2), c(2, 2, 0, 2, 0))
  )
  expect_equal(
    as_unnamed_dense_matrix(proj2[[2]][]),
    cbind(c(0, 4, 1), c(4, 0, 1), c(1, 1, 0))
  )

  bip_proj_size <- bipartite_projection_size(g2)
  expect_equal(bip_proj_size$vcount1, vcount(proj2[[1]]))
  expect_equal(bip_proj_size$ecount1, ecount(proj2[[1]]))
  expect_equal(bip_proj_size$vcount2, vcount(proj2[[2]]))
  expect_equal(bip_proj_size$ecount2, ecount(proj2[[2]]))
})

test_that("bipartite_projection can calculate only one projection", {
  withr::local_seed(42)

  g <- sample_bipartite_gnp(5, 10, p = 0.3)
  proj <- bipartite_projection(g)
  proj_false <- bipartite_projection(g, which = "false")
  proj_true <- bipartite_projection(g, which = "true")

  expect_isomorphic(proj$proj1, proj_false)
  expect_isomorphic(proj$proj2, proj_true)
  expect_equal(vertex.attributes(proj$proj1), vertex.attributes(proj_false))
  expect_equal(vertex.attributes(proj$proj2), vertex.attributes(proj_true))
  expect_equal(edge_attr(proj$proj1), edge_attr(proj_false))
  expect_equal(edge_attr(proj$proj2), edge_attr(proj_true))
})

test_that("bipartite_projection removes 'type' attribute if requested", {
  g <- make_full_bipartite_graph(10, 5)
  proj <- bipartite_projection(g)
  proj_false <- bipartite_projection(g, which = "true")
  proj_true <- bipartite_projection(g, which = "false")

  proj_rmtype <- bipartite_projection(g, remove.type = FALSE)
  proj_rm_false <- bipartite_projection(g, which = "true", remove.type = FALSE)
  proj_rm_true <- bipartite_projection(g, which = "false", remove.type = FALSE)

  expect_false("type" %in% vertex_attr_names(proj[[1]]))
  expect_false("type" %in% vertex_attr_names(proj[[2]]))
  expect_false("type" %in% vertex_attr_names(proj_false))
  expect_false("type" %in% vertex_attr_names(proj_true))

  expect_true("type" %in% vertex_attr_names(proj_rmtype[[1]]))
  expect_true("type" %in% vertex_attr_names(proj_rmtype[[2]]))
  expect_true("type" %in% vertex_attr_names(proj_rm_false))
  expect_true("type" %in% vertex_attr_names(proj_rm_true))
})

test_that("bipartite_projection breaks for non-bipartite graphs (#543)", {
  g <- graph_from_literal(A - 0, B - 1, A - 1, 0 - 1)
  V(g)$type <- V(g)$name %in% LETTERS

  expect_error(
    bipartite_projection_size(g),
    "Non-bipartite edge found in bipartite projection"
  )
  expect_error(
    bipartite_projection(g),
    "Non-bipartite edge found in bipartite projection"
  )
})

test_that("bipartite_projection prints a warning if the type attribute is non-logical (#476)", {
  g <- make_full_bipartite_graph(10, 5)
  V(g)$type <- as.numeric(V(g)$type)
  expect_warning(bipartite_projection(g), "logical")
  expect_warning(bipartite_projection_size(g), "logical")
})
