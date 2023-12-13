test_that("any_multiple(), count_multiple(), which_multiple() works", {
  # g <- sample_pa(10, m = 3, algorithm = "bag")
  g <- graph_from_edgelist(cbind(
    c(2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 7, 7, 7, 8, 8, 8, 9, 9, 9, 10, 10, 10),
    c(1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 3, 4, 3, 1, 1, 1, 3, 1, 2, 4, 1, 1, 2, 4, 1, 4, 1)
  ))
  im <- which_multiple(g)
  cm <- count_multiple(g)
  expect_true(any_multiple(g))
  expect_that(im, equals(c(
    FALSE, TRUE, TRUE, FALSE, TRUE, TRUE,
    FALSE, FALSE, FALSE, FALSE, FALSE, TRUE,
    FALSE, FALSE, TRUE, FALSE, FALSE, TRUE,
    FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE, TRUE
  )))
  expect_that(cm, equals(c(
    3, 3, 3, 3, 3, 3, 1, 1, 1, 2, 1, 2, 1, 2,
    2, 2, 1, 2, 1, 1, 1, 1, 1, 1, 2, 1, 2
  )))
  expect_that(
    count_multiple(simplify(g)),
    equals(rep(1, ecount(simplify(g))))
  )


  ## Direction of the edge is important
  expect_false(any_multiple(make_graph(c(1, 2, 2, 1))))
  expect_that(which_multiple(make_graph(c(1, 2, 2, 1))), equals(c(FALSE, FALSE)))
  expect_that(
    which_multiple(make_graph(c(1, 2, 2, 1), dir = FALSE)),
    equals(c(FALSE, TRUE))
  )

  ## Remove multiple edges but keep multiplicity
  # g <- sample_pa(10, m = 3, algorithm = "bag")
  g <- graph_from_edgelist(cbind(
    c(2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 7, 7, 7, 8, 8, 8, 9, 9, 9, 10, 10, 10),
    c(1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 4, 1, 4, 1, 1, 6, 4, 1, 5, 8)
  ))
  E(g)$weight <- 1
  g <- simplify(g)
  expect_false(any_multiple(g))
  expect_false(any(which_multiple(g)))
  expect_that(E(g)$weight, equals(c(
    3, 2, 1, 2, 1, 3, 2, 1, 2, 1, 2,
    1, 1, 1, 1, 1, 1, 1
  )))
})
