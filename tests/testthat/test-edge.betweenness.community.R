test_that("cluster_edge_betweenness works", {
  g <- make_graph("Zachary")
  ebc <- cluster_edge_betweenness(g)

  expect_equal(max(ebc$modularity), modularity(g, ebc$membership))
  expect_equal(
    as.vector(membership(ebc)),
    c(1, 1, 2, 1, 3, 3, 3, 1, 4, 5, 3, 1, 1, 1, 4, 4, 3, 1, 4, 1, 4, 1, 4, 4, 2, 2, 4, 2, 2, 4, 4, 2, 4, 4)
  )
  expect_equal(length(ebc), 5)
  expect_equal(as.numeric(sizes(ebc)), c(10, 6, 5, 12, 1))

  d <- as.dendrogram(ebc)
  expect_that(print(d), prints_text("2 branches.*34 members.*height 33"))
  expect_that(
    print(d[[1]]),
    prints_text("2 branches.*15 members.*height 31")
  )
  expect_that(
    print(d[[2]]),
    prints_text("2 branches.*19 members.*height 32")
  )
  m2 <- cut_at(ebc, no = 3)
  expect_equal(
    modularity(g, m2),
    ebc$modularity[length(ebc$modularity) - 2]
  )
})
