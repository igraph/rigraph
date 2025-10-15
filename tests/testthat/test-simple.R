test_that("is_simple() works", {
  g <- graph_from_literal(1 +-+ 2 -+ 3)
  expect_true(is_simple(g))
  expect_false(is_simple(g, directed = FALSE))
})
