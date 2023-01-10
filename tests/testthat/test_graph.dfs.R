test_that("DFS uses 1-based root vertex index", {
  g <- make_ring(3)
  expect_that(dfs(g, root = 1)$root, equals(1))
})
