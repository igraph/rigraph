test_that("iterators work", {
  ## Create a small ring graph, assign attributes
  ring <- graph_from_literal(A - B - C - D - E - F - G - A)
  E(ring)$weight <- seq_len(ecount(ring))

  ## Selection based on attributes
  expect_that(sort(E(ring)[weight < 4]$weight), equals(1:3))
  expect_that(V(ring)[c("A", "C")]$name, equals(c("A", "C")))

  ## TODO: %--%, %->%, other special functions
})

test_that("complex attributes work", {
  g <- make_ring(10)
  foo <- lapply(1:vcount(g), seq, from = 1)
  V(g)$foo <- foo

  V(g)$foo[[5]][1:3] <- 0
  expect_that(V(g)[(1:10)[-5]]$foo, equals(foo[-5]))
  expect_that(V(g)[[5]]$foo, equals(c(0, 0, 0, 4, 5)))
  expect_that(V(g)[5]$foo, equals(list(c(0, 0, 0, 4, 5))))

  V(g)$foo <- foo
  V(g)[[5]]$foo[1:3] <- 0
  expect_that(V(g)[(1:10)[-5]]$foo, equals(foo[-5]))
  expect_that(V(g)[[5]]$foo, equals(c(0, 0, 0, 4, 5)))
  expect_that(V(g)[5]$foo, equals(list(c(0, 0, 0, 4, 5))))

  V(g)$foo <- foo
  V(g)[5]$foo[[1]][1:3] <- 0
  expect_that(V(g)[(1:10)[-5]]$foo, equals(foo[-5]))
  expect_that(V(g)[[5]]$foo, equals(c(0, 0, 0, 4, 5)))
  expect_that(V(g)[5]$foo, equals(list(c(0, 0, 0, 4, 5))))
})

test_that("we got rid of confusing indexing by numbers", {
  g <- make_ring(10)
  V(g)$name <- letters[1:10]
  E(g)$weight <- seq(ecount(g))

  expect_equal(as.vector(V(g)[6:10][1:5]), 6:10)
  expect_equal(as.vector(E(g)[6:10][1:5]), 6:10)
})

test_that("selecting edges using vertex names works", {
  g <- make_ring(10)
  V(g)$name <- letters[1:10]

  e1 <- E(g)[c("a|b", "c|d")]
  expect_equal(as.vector(e1), c(1, 3))
})

test_that("indexing with characters work as expected", {
  g <- make_ring(10)
  V(g)$name <- letters[1:10]
  E(g)$name <- LETTERS[1:10]

  expect_equal(as.vector(V(g)[letters[3:6]]), 3:6)
  expect_equal(as.vector(E(g)[LETTERS[4:7]]), 4:7)
  ## expect_equal(as.vector(E(g)[c('a|b', 'c|d')]), c(1,3))

  expect_error(V(g)[1:5]["h"], "Unknown vertex selected")
  expect_error(E(g)[1:5]["H"], "Unknown edge selected")
  expect_error(E(g)[6:9]["a|b"], "Unknown edge selected")
})

test_that("variable lookup in environment works", {
  g <- make_ring(10)
  V(g)$name <- letters[1:10]
  E(g)$index <- 10:19

  name <- c("d", "e")
  index <- 3

  # attribute names take precedence over local variables by default...
  expect_equal(as.vector(V(g)[name]), 1:10)
  expect_error(E(g)[index], "Unknown edge selected")

  # ...but you can use .env to get access to the variables
  expect_equal(as.vector(V(g)[.env$name]), c(4, 5))
  expect_equal(as.vector(E(g)[.env$index]), 3)

  # ...and you can use .data to get access to the attributes explicitly
  expect_equal(as.vector(E(g)[.data$index >= 15]), 6:10)
})

test_that("V(g) returns complete iterator, completeness is lost with next subsetting", {
  g <- make_star(4)
  iter <- V(g)
  expect_true(is_complete_iterator(iter))
  expect_false(is_complete_iterator(iter[1]))
  expect_false(is_complete_iterator(iter[1:4]))
})

test_that("E(g) returns complete iterator, completeness is lost with next subsetting", {
  g <- make_full_graph(4)
  iter <- E(g)
  expect_true(is_complete_iterator(iter))
  expect_false(is_complete_iterator(iter[1]))
  expect_false(is_complete_iterator(iter[1:3]))
  expect_false(is_complete_iterator(E(g, P = 1:4)))
  expect_false(is_complete_iterator(E(g, path = 1:4)))
})
