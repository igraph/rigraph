
context("New integer igraph_t data type")

test_that("We are compatible with old objects", {

  library(igraph)
  g <- graph.ring(10)
  c1 <- closeness(g)

  g <- unclass(g)
  g[[1]] <- as.numeric(g[[1]])
  g[[3]] <- as.numeric(g[[3]])
  g[[4]] <- as.numeric(g[[4]])
  g[[5]] <- as.numeric(g[[5]])
  g[[6]] <- as.numeric(g[[6]])
  g[[7]] <- as.numeric(g[[7]])
  g[[8]] <- as.numeric(g[[8]])

  class(g) <- "igraph"
  expect_that(c2 <- closeness(g), gives_warning("old format"))

  expect_that(c1, equals(c2))
})

test_that("Update_format works", {

  library(igraph)
  g <- graph.ring(10)
  c1 <- closeness(g)

  g <- unclass(g)
  g[[1]] <- as.numeric(g[[1]])
  g[[3]] <- as.numeric(g[[3]])
  g[[4]] <- as.numeric(g[[4]])
  g[[5]] <- as.numeric(g[[5]])
  g[[6]] <- as.numeric(g[[6]])
  g[[7]] <- as.numeric(g[[7]])
  g[[8]] <- as.numeric(g[[8]])

  class(g) <- "igraph"

  g2 <- update_format(g)
  expect_that(g2, equals(g))

  g2u <- unclass(g2)
  expect_that(is.integer(g2u[[1]]), is_true())
  expect_that(is.integer(g2u[[3]]), is_true())
  expect_that(is.integer(g2u[[4]]), is_true())
  expect_that(is.integer(g2u[[5]]), is_true())
  expect_that(is.integer(g2u[[6]]), is_true())
  expect_that(is.integer(g2u[[7]]), is_true())
  expect_that(is.integer(g2u[[8]]), is_true())

  g3 <- update_format(g2)
  expect_that(g3, equals(g2))

  g3u <- unclass(g3)
  expect_that(is.integer(g3u[[1]]), is_true())
  expect_that(is.integer(g3u[[3]]), is_true())
  expect_that(is.integer(g3u[[4]]), is_true())
  expect_that(is.integer(g3u[[5]]), is_true())
  expect_that(is.integer(g3u[[6]]), is_true())
  expect_that(is.integer(g3u[[7]]), is_true())
  expect_that(is.integer(g3u[[8]]), is_true())
  
})

