
context("are_adjacent")

test_that("are_adjacent works", {
  library(igraph)

  g <- graph_from_literal( A-B-C, B-D )
  expect_true(are_adjacent(g, "A", "B"))
  expect_true(are_adjacent(g, "B", "A"))
  expect_false(are_adjacent(g, "A", "D"))

  g2 <- graph( c(1,2, 2,3, 3,4), dir= FALSE )
  expect_true(are_adjacent(g2, 1,2))
  expect_true(are_adjacent(g2, 3,2))
  expect_false(are_adjacent(g2, 4,1))
  
  g3 <- graph_from_literal( A-+B-+C, B-+D )
  expect_false(are_adjacent(g3, "A", "C"))
  expect_true(are_adjacent(g3, "A", "B"))
  expect_false(are_adjacent(g3, "B", "A"))
})



