test_that("cluster_louvain works", {
  set.seed(20231029)

  g <- make_graph("Zachary")
  mc <- cluster_louvain(g)

  expect_true(all(as.vector(membership(mc)) %in% 1:4))
  expect_that(modularity(g, mc$membership), equals(max(mc$modularity)))
  # 3   4
  # 2 998
  expect_true(length(mc) %in% 3:4)
  expect_true(all(as.vector(membership(mc)) %in% seq_len(length(mc))))
  expect_s3_class(sizes(mc), "table")
  expect_equal(sum(sizes(mc)), vcount(g))
  expect_identical(sizes(mc), table(membership(mc), dnn = "Community sizes"))
})
