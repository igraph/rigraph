# Compare two graphs by their edge structure (ignoring the auto-generated
# `myid` UUID and `igraph` pointer that differ per object).
expect_same_graph <- function(g1, g2) {
  expect_identical(as_edgelist(g1), as_edgelist(g2))
  expect_identical(vcount(g1), vcount(g2))
  expect_identical(is_directed(g1), is_directed(g2))
}

test_that("random graph generators are reproducible with set.seed()", {
  expect_same_graph(
    withr::with_seed(42, sample_gnp(50, 0.1)),
    withr::with_seed(42, sample_gnp(50, 0.1))
  )
  expect_same_graph(
    withr::with_seed(42, sample_gnm(50, 100)),
    withr::with_seed(42, sample_gnm(50, 100))
  )
  expect_same_graph(
    withr::with_seed(42, sample_pa(50, m = 2)),
    withr::with_seed(42, sample_pa(50, m = 2))
  )
  expect_same_graph(
    withr::with_seed(42, sample_smallworld(1, 20, 5, 0.05)),
    withr::with_seed(42, sample_smallworld(1, 20, 5, 0.05))
  )
})

test_that("random_walk() is reproducible with set.seed()", {
  g <- make_ring(20)
  expect_identical(
    withr::with_seed(42, as.integer(random_walk(g, start = 1, steps = 10))),
    withr::with_seed(42, as.integer(random_walk(g, start = 1, steps = 10)))
  )
})

test_that("community detection is reproducible with set.seed()", {
  g <- make_graph("Zachary")

  expect_identical(
    withr::with_seed(42, membership(cluster_walktrap(g))),
    withr::with_seed(42, membership(cluster_walktrap(g)))
  )
  expect_identical(
    withr::with_seed(42, membership(cluster_louvain(g))),
    withr::with_seed(42, membership(cluster_louvain(g)))
  )
  expect_identical(
    withr::with_seed(42, membership(cluster_leiden(g))),
    withr::with_seed(42, membership(cluster_leiden(g)))
  )
})
