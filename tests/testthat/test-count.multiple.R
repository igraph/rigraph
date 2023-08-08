test_that("any_multiple, count_multiple, which_multiple works", {
  skip("Random seed not applied")
  set.seed(42)

  g <- barabasi.game(10, m = 3, algorithm = "bag")
  im <- which_multiple(g)
  cm <- count_multiple(g)
  expect_true(any_multiple(g))
  expect_that(im, equals(c(
    FALSE, TRUE, TRUE, FALSE, FALSE, TRUE,
    FALSE, FALSE, TRUE, FALSE, TRUE, TRUE,
    FALSE, FALSE, FALSE, TRUE, TRUE, FALSE,
    FALSE, FALSE, TRUE, FALSE, TRUE, FALSE,
    FALSE, FALSE, FALSE
  )))
  expect_that(cm, equals(c(
    3, 3, 3, 3, 3, 3, 1, 2, 2, 3, 3, 3, 2, 1,
    2, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1
  )))
  expect_that(
    count_multiple(simplify(g)),
    equals(rep(1, ecount(simplify(g))))
  )


  ## Direction of the edge is important
  expect_false(any_multiple(graph(c(1, 2, 2, 1))))
  expect_that(which_multiple(graph(c(1, 2, 2, 1))), equals(c(FALSE, FALSE)))
  expect_that(
    which_multiple(graph(c(1, 2, 2, 1), dir = FALSE)),
    equals(c(FALSE, TRUE))
  )

  ## Remove multiple edges but keep multiplicity
  g <- barabasi.game(10, m = 3, algorithm = "bag")
  E(g)$weight <- 1
  g <- simplify(g)
  expect_false(any_multiple(g))
  expect_false(any(which_multiple(g)))
  expect_that(E(g)$weight, equals(c(
    3, 2, 1, 2, 1, 2, 1, 3, 3, 2, 1,
    1, 1, 1, 1, 1, 1
  )))
})
