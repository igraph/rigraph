
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
  c2 <- closeness(g)

  expect_that(c1, equals(c2))
})
  
  
