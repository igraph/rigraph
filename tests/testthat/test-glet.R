# Helper functions used here live in helper-test-functions.R.

test_that("Graphlets work for some simple graphs", {
  full <- make_full_graph(5)
  E(full)$weight <- 1
  full_glet <- graphlet_basis(full)

  expect_named(full_glet, c("cliques", "thresholds"))
  expect_length(full_glet$cliques, 1)
  expect_equal(sort(full_glet$cliques[[1]]), V(full)[seq_len(vcount(full))])
  expect_equal(full_glet$thresholds, 1)

  E(full)[1 %--% 2]$weight <- 2
  full_glet2 <- sortgl(graphlet_basis(full))

  expect_equal(
    full_glet2,
    list(
      cliques = lapply(
        list(1:2, 1:5),
        unsafe_create_vs,
        graph = full,
        verts = V(full)
      ),
      thresholds = c(2, 1)
    )
  )
})

test_that("Graphlets filtering works", {
  df <- data.frame(
    from = c("A", "A", "B", "B", "B", "C", "C", "D"),
    to = c("B", "C", "C", "D", "E", "D", "E", "E"),
    weight = c(8, 8, 8, 5, 5, 5, 5, 5)
  )

  g <- graph_from_data_frame(
    df,
    directed = FALSE,
    vertices = data.frame(LETTERS[1:5])
  )
  glet <- sortgl(graphlet_basis(g))

  expect_equal(unvs(glet$cliques), list(1:3, 2:5))
  expect_equal(glet$thresholds, c(8, 5))
})

test_that("Graphlets work for a bigger graph", {
  igraph_local_seed(42)
  g <- make_graph("zachary")
  E(g)$weight <- sample(1:5, ecount(g), replace = TRUE)

  gl <- graphlet_basis(g)
  gl2 <- graphlets.old(g)

  glo <- sort(sapply(unvs(gl$cliques), paste, collapse = "-"))
  gl2o <- sort(sapply(gl2, paste, collapse = "-"))

  expect_equal(glo, gl2o)
})

test_that("Graphlet projection works", {
  D1 <- matrix(0, 5, 5)
  D2 <- matrix(0, 5, 5)
  D3 <- matrix(0, 5, 5)
  D1[1:3, 1:3] <- 2
  D2[3:5, 3:5] <- 3
  D3[2:5, 2:5] <- 1
  g <- graph_from_adjacency_matrix(
    D1 + D2 + D3,
    mode = "undirected",
    weighted = TRUE
  )
  g <- simplify(g)

  gl <- graphlet_basis(g)
  glp <- graphlets(g)
  glp2 <- graphlets.project.old(g, cliques = gl$cliques, iter = 1000)

  expect_equal(glp, glp2)
})

# ---- ellipsis migration: argument coverage ----------------------------

# Shared fixture: the weighted overlapping-groups graph from the examples.
# Its `weight` edge attribute has four distinct threshold levels.
make_graphlet_graph <- function() {
  D1 <- matrix(0, 5, 5)
  D2 <- matrix(0, 5, 5)
  D3 <- matrix(0, 5, 5)
  D1[1:3, 1:3] <- 2
  D2[3:5, 3:5] <- 3
  D3[2:5, 2:5] <- 1
  simplify(graph_from_adjacency_matrix(
    D1 + D2 + D3,
    mode = "undirected",
    weighted = TRUE
  ))
}

test_that("graphlet_basis() covers weights", {
  g <- make_graphlet_graph()

  # The attribute weights yield a four-clique candidate basis,
  # uniform explicit weights override them and collapse the basis
  # to the two maximal cliques.
  expect_length(graphlet_basis(g)$cliques, 4)
  res <- graphlet_basis(g, weights = rep(1, ecount(g)))
  expect_named(res, c("cliques", "thresholds"))
  expect_length(res$cliques, 2)
  expect_equal(res$thresholds, c(1, 1))

  # Legacy positional `weights` is recovered with a deprecation warning.
  lifecycle::expect_deprecated(
    res_legacy <- graphlet_basis(g, rep(1, ecount(g)))
  )
  expect_identical(res_legacy, res)
})

test_that("graphlet_proj() covers all tail arguments", {
  g <- make_graphlet_graph()
  cl <- graphlet_basis(g)$cliques

  # The projection returns one non-negative weight per basis clique.
  res <- graphlet_proj(
    g,
    weights = E(g)$weight,
    cliques = cl,
    niter = 100,
    Mu = rep(2, length(cl))
  )
  expect_type(res, "double")
  expect_length(res, length(cl))
  expect_true(all(res >= 0))

  # Legacy positional `weights` is recovered with a deprecation warning.
  lifecycle::expect_deprecated(
    res_legacy <- graphlet_proj(g, E(g)$weight, cliques = cl)
  )
  expect_identical(
    res_legacy,
    graphlet_proj(g, weights = E(g)$weight, cliques = cl)
  )
})

test_that("graphlets() covers all tail arguments", {
  g <- make_graphlet_graph()
  w <- rep(1, ecount(g))

  # Uniform weights collapse the basis to the two maximal cliques.
  res <- graphlets(g, weights = w, niter = 50)
  expect_named(res, c("cliques", "Mu"))
  expect_length(res$cliques, 2)
  expect_length(res$Mu, length(res$cliques))

  # Legacy positional `weights` is recovered with a deprecation warning.
  lifecycle::expect_deprecated(
    res_legacy <- graphlets(g, w)
  )
  expect_identical(res_legacy, graphlets(g, weights = w))
})
