test_that("is_chordal works", {
  ## The examples from the Tarjan-Yannakakis paper
  g1 <- graph_from_literal(
    A - B:C:I, B - A:C:D, C - A:B:E:H, D - B:E:F,
    E - C:D:F:H, F - D:E:G, G - F:H, H - C:E:G:I,
    I - A:H
  )

  mc <- max_cardinality(g1)
  mc$alpham1 <- as.vector(mc$alpham1)
  expect_equal(
    mc,
    list(
      alpha = c(9, 4, 6, 8, 3, 5, 7, 2, 1),
      alpham1 = c(9, 8, 5, 2, 6, 3, 7, 4, 1)
    )
  )

  ic <- is_chordal(g1, fillin = TRUE)
  expect_equal(ic$chordal, FALSE)
  expect_equal(unique(sort(ic$fillin)), c(1, 2, 5, 6, 7, 8))
  expect_equal(ic$newgraph, NULL)

  g2 <- graph_from_literal(
    A - B:E, B - A:E:F:D, C - E:D:G, D - B:F:E:C:G,
    E - A:B:C:D:F, F - B:D:E, G - C:D:H:I, H - G:I:J,
    I - G:H:J, J - H:I
  )

  mc2 <- max_cardinality(g2)
  mc2$alpham1 <- as.vector(mc2$alpham1)
  expect_equal(
    mc2,
    list(
      alpha = c(10, 8, 9, 6, 7, 5, 4, 2, 3, 1),
      alpham1 = c(10, 8, 9, 7, 6, 4, 5, 2, 3, 1)
    )
  )

  ic2 <- is_chordal(g2, fillin = TRUE)
  expect_equal(ic2, list(chordal = TRUE, fillin = numeric(), newgraph = NULL))
})
