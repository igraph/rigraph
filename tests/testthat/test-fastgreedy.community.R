test_that("cluster_fast_greedy works", {
  withr::local_seed(42)

  g <- make_graph("Zachary")
  fc <- cluster_fast_greedy(g)

  expect_equal(modularity(g, fc$membership), max(fc$modularity))
  expect_equal(
    as.vector(membership(fc)),
    c(1, 3, 3, 3, 1, 1, 1, 3, 2, 3, 1, 1, 3, 3, 2, 2, 1, 3, 2, 1, 2, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2)
  )
  expect_equal(length(fc), 3)
  expect_equal(as.numeric(sizes(fc)), c(8, 17, 9))

  d <- as.dendrogram(fc)
  expect_output(print(d), "2 branches.*34 members.*height 33")
  expect_output(print(d[[1]]), "2 branches.*17 members.*height 32")
  expect_output(print(d[[2]]), "2 branches.*17 members.*height 30")
  m2 <- cut_at(fc, no = 3)
  expect_equal(
    modularity(g, m2),
    fc$modularity[length(fc$modularity) - 2]
  )
})
