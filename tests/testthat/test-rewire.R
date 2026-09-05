test_that("rewire(each_edge(mode='in')) keeps the in-degree distribution", {
  igraph_local_seed(42)
  g <- sample_pa(1000)

  g2 <- g |> rewire(each_edge(mode = "in", multiple = T, prob = 0.2))
  expect_equal(degree(g, mode = "in"), degree(g2, mode = "in"))
  expect_false(all(degree(g, mode = "out") == degree(g2, mode = "out")))
})

test_that("rewire(each_edge(mode='out')) keeps the out-degree distribution", {
  igraph_local_seed(42)
  g <- sample_pa(1000)

  g2 <- g |> rewire(each_edge(mode = "out", multiple = T, prob = 0.2))
  expect_equal(degree(g, mode = "out"), degree(g2, mode = "out"))
  expect_false(all(degree(g, mode = "in") == degree(g2, mode = "in")))
})

test_that("rewire() with zero probability does not do anything", {
  igraph_local_seed(42)
  g <- sample_pa(100)
  g2 <- g |> rewire(each_edge(prob = 0))
  expect_identical_graphs(g, g2)
})

# ---- ellipsis migration: argument coverage ----------------------------------

test_that("each_edge() takes all tail arguments by name", {
  igraph_local_seed(42)
  g <- sample_pa(100)

  g2 <- g |>
    rewire(each_edge(prob = 1, loops = TRUE, multiple = TRUE, mode = "out"))
  # Rewiring only the heads keeps the out-degree sequence and the edge count.
  expect_equal(degree(g2, mode = "out"), degree(g, mode = "out"))
  expect_ecount(g2, ecount(g))
  # With this seed the rewiring uses the freedom that `loops = TRUE` grants.
  expect_true(any(which_loop(g2)))

  # On a single-vertex graph the rewired edge can only stay a loop.
  g_loop <- make_graph(c(1, 1))
  expect_identical_graphs(
    rewire(g_loop, each_edge(prob = 1, loops = TRUE, multiple = TRUE)),
    g_loop
  )
})

test_that("each_edge() recovers legacy positional arguments", {
  rlang::local_options(lifecycle_verbosity = "warning")
  lifecycle::expect_deprecated(
    res <- each_edge(0.3, TRUE)
  )
  expect_identical(res, each_edge(0.3, loops = TRUE))
})
