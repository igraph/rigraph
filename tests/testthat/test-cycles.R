
test_that("find_cycle works", {
  g <- make_graph(c(1,2, 2,3, 1,3, 1,1), directed = TRUE)

  cycle <- find_cycle(g)
  expect_equal(length(cycle$vertices), 1)
  expect_equal(length(cycle$edges), 1)

  # Finding a cycle of length 1 or 3 are both valid here
  cycle <- find_cycle(g, mode = "all")
  expect_equal(length(cycle$vertices), 3)
  expect_equal(length(cycle$edges), 3)
})
