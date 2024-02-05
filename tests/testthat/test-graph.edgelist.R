test_that("graph_from_edgelist works", {
  withr::local_seed(20230115)

  g <- sample_gnp(50, 5 / 50)
  el <- as_edgelist(g)
  g2 <- graph_from_edgelist(el, directed = FALSE)
  expect_true(graph.isomorphic(g, g2))

  ####

  g <- sample_gnp(50, 5 / 50, directed = TRUE)
  el <- as_edgelist(g)
  g2 <- graph_from_edgelist(el, directed = TRUE)
  expect_true(graph.isomorphic(g, g2))

  ####

  g <- sample_gnp(26, 5 / 26, directed = TRUE)
  el <- as_edgelist(g)
  n <- letters[1:26]
  names(n) <- 1:26
  mode(el) <- "character"
  el[] <- n[el]
  g2 <- graph_from_edgelist(el, directed = TRUE)
  expect_true(graph.isomorphic(g, g2))
})
