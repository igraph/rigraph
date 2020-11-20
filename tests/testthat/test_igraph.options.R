
context("igraph_options")

test_that("igraph_options works", {

  library(igraph)

  igraph_options(verbose=TRUE)
  expect_true(igraph_opt("verbose"))
  
  igraph_options(verbose=FALSE)
  expect_false(igraph_opt("verbose"))

})

test_that("we can restore old options", {

  old_1 <- igraph_opt("sparsematrices")
  old_2 <- igraph_opt("annotate.plot")

  old <- igraph_options(sparsematrices = FALSE,
                        annotate.plot = TRUE)

  expect_equal(igraph_opt("sparsematrices"), FALSE)
  expect_equal(igraph_opt("annotate.plot"), TRUE)

  igraph_options(old)

  expect_equal(igraph_opt("sparsematrices"), old_1)
  expect_equal(igraph_opt("annotate.plot"), old_2)

})

test_that("with_igraph_opt works", {

  on.exit(try(igraph_options(old)), add = TRUE)
  old <- igraph_options(sparsematrices = TRUE)

  res <- with_igraph_opt(list(sparsematrices = FALSE),
                         make_ring(3)[])

  expect_equal(igraph_opt("sparsematrices"), TRUE)
  expect_true(inherits(res, "matrix"))

})
