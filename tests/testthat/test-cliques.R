test_that("cliques works", {
  withr::local_seed(42)

  check.clique <- function(graph, vids) {
    s <- induced_subgraph(graph, vids)
    ecount(s) == vcount(s) * (vcount(s) - 1) / 2
  }

  g <- sample_gnp(100, 0.3)
  expect_that(clique_num(g), equals(6))

  cl <- sapply(cliques(g, min = 6), check.clique, graph = g)
  lcl <- sapply(largest_cliques(g), check.clique, graph = g)
  expect_that(cl, equals(lcl))
  expect_that(cl, equals(rep(TRUE, 17)))
  expect_that(lcl, equals(rep(TRUE, 17)))

  ## To have a bit less maximal cliques, about 100-200 usually
  g <- sample_gnp(100, 0.03)
  expect_true(all(sapply(max_cliques(g), check.clique, graph = g)))
})

test_that("clique_size_counts works", {
  g <- make_full_graph(5) %du% make_full_graph(3)

  expect_that(clique_size_counts(g), equals(c(8, 13, 11, 5, 1)))
  expect_that(clique_size_counts(g, min = 3), equals(c(0, 0, 11, 5, 1)))
  expect_that(clique_size_counts(g, max = 4), equals(c(8, 13, 11, 5)))
  expect_that(clique_size_counts(g, min = 2, max = 4), equals(c(0, 13, 11, 5)))

  expect_that(clique_size_counts(g, maximal = TRUE), equals(c(0, 0, 1, 0, 1)))
  expect_that(clique_size_counts(g, min = 3, maximal = TRUE), equals(c(0, 0, 1, 0, 1)))
  expect_that(clique_size_counts(g, max = 4, maximal = TRUE), equals(c(0, 0, 1)))
  expect_that(clique_size_counts(g, min = 2, max = 4, maximal = TRUE), equals(c(0, 0, 1)))
})
