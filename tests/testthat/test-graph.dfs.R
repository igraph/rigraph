test_that("DFS uses 1-based root vertex index", {
  g <- make_ring(3)
  expect_equal(dfs(g, root = 1)$root, 1)
})

test_that("DFS does not pad order", {
  g <- make_star(3)
  expect_equal(as.numeric(dfs(g, root = 2, unreachable = FALSE)$order), c(2, 1))
})
