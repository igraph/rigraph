test_that("are_adjacent() works", {
  g <- graph_from_literal(A - B - C, B - D)
  expect_true(are_adjacent(g, "A", "B"))
  expect_true(are_adjacent(g, "B", "A"))
  expect_false(are_adjacent(g, "A", "D"))

  g2 <- make_graph(c(1, 2, 2, 3, 3, 4, 1, 1, 3, 4), directed = FALSE)
  expect_true(are_adjacent(g2, 1, 2))
  expect_true(are_adjacent(g2, 3, 2))
  expect_true(are_adjacent(g2, 3, 4))
  expect_true(are_adjacent(g2, 1, 1))
  expect_false(are_adjacent(g2, 4, 1))
  expect_false(are_adjacent(g2, 3, 3))

  g3 <- graph_from_literal(A -+ B -+ C, B -+ D)
  expect_false(are_adjacent(g3, "A", "C"))
  expect_true(are_adjacent(g3, "A", "B"))
  expect_false(are_adjacent(g3, "B", "A"))
})
