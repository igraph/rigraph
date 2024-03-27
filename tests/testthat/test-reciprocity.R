test_that("reciprocity works", {
  g <- make_graph(c(1,2, 2,1, 2,3, 3,4, 4,4), directed = TRUE)
  expect_equal(reciprocity(g), 0.5)
  expect_equal(reciprocity(g, ignore.loops = FALSE), 0.6)
})
