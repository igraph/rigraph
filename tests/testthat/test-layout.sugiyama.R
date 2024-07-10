test_that("layout_with_sugiyama does not demote matrices to vectors in res$layout.dummy", {
  ex <- graph_from_literal(A - +B:C, B - +C:D)
  layex <- layout_with_sugiyama(ex, layers = NULL)
  expect_equal(nrow(layex$layout.dummy), 1)
})
