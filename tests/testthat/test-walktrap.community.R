test_that("cluster_walktrap works", {
  g <- make_graph("Zachary")
  withr::local_seed(42)
  wc <- cluster_walktrap(g)

  expect_equal(modularity(g, membership(wc)), modularity(wc))
  expect_equal(
    as.vector(membership(wc)),
    c(1, 1, 2, 1, 5, 5, 5, 1, 2, 2, 5, 1, 1, 2, 3, 3, 5, 1, 3, 1, 3, 1, 3, 4, 4, 4, 3, 4, 2, 3, 2, 2, 3, 3)
  )
  expect_equal(length(wc), 5)
  expect_equal(sizes(wc), structure(c(9L, 7L, 9L, 4L, 5L), .Dim = 5L, .Dimnames = structure(list(`Community sizes` = c("1", "2", "3", "4", "5")), .Names = "Community sizes"), class = "table"))

  d <- as.dendrogram(wc)
  expect_output(print(d), "2 branches.*34 members.*height 33")
  expect_output(print(d[[1]]), "2 branches.*20 members.*height 31")
  expect_output(print(d[[2]]), "2 branches.*14 members.*height 32")
  m2 <- cut_at(wc, no = 3)
  expect_equal(
    modularity(g, m2),
    wc$modularity[length(wc$modularity) - 2]
  )
})
