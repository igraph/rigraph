test_that("find_cycle() works", {
  g <- make_graph(c(1, 2, 2, 3, 1, 3, 1, 1), directed = TRUE)

  cycle <- find_cycle(g)
  expect_equal(length(cycle$vertices), 1)
  expect_equal(length(cycle$edges), 1)

  # Finding a cycle of length 1 or 3 are both valid here
  cycle <- find_cycle(g, mode = "all")
  expect_equal(length(cycle$vertices), 3)
  expect_equal(length(cycle$edges), 3)
})

test_that("simple_cycle() works directed", {
  g <- graph_from_literal(A -+ B -+ C -+ A -+ D -+ E +- F -+ A, E -+ E, A -+ F, simplify = FALSE)
  all_simple_cycles <- simple_cycles(g)
  expect_length(all_simple_cycles$vertices, 3)
  expect_length(all_simple_cycles$edges, 3)
  true_length <- list(vertices = c(3, 2, 1), edges = c(3, 2, 1))

  for (i in 1:3) {
    expect_length(all_simple_cycles$vertices[[i]], true_length$vertices[[i]])
    expect_length(all_simple_cycles$edges[[i]], true_length$edges[[i]])
  }

  expect_equal(as.numeric(all_simple_cycles$vertices[[1]]), 1:3)
})

test_that("simple_cycle() works undirected", {
  g <- graph_from_literal(A -+ B -+ C -+ A -+ D -+ E +- F -+ A, E -+ E, A -+ F, simplify = FALSE)
  all_simple_cycles <- simple_cycles(g, mode = "all")
  expect_length(all_simple_cycles$vertices, 5)
  expect_length(all_simple_cycles$edges, 5)

  true_length <- list(vertices = c(3, 4, 4, 2, 1), edges = c(3, 4, 4, 2, 1))
  for (i in 1:5) {
    expect_length(all_simple_cycles$vertices[[i]], true_length$vertices[[i]])
    expect_length(all_simple_cycles$edges[[i]], true_length$edges[[i]])
  }
  expect_equal(as.numeric(all_simple_cycles$vertices[[2]]), c(1, 4, 5, 6))

  all_simple_cycles_23 <- simple_cycles(g, mode = "all", min = 2, max = 3)
  expect_length(all_simple_cycles$vertices, 5)
  expect_length(all_simple_cycles$edges, 5)
})

# Tests for callback function
test_that("simple_cycles_callback works", {
  withr::local_seed(123)
  
  g <- graph_from_literal(A -+ B -+ C -+ A -+ D -+ E +- F -+ A)
  
  # Count cycles using callback
  count <- 0
  cycle_lengths <- integer(0)
  
  simple_cycles(g, callback = function(vertices, edges) {
    count <<- count + 1
    cycle_lengths <<- c(cycle_lengths, length(vertices))
    TRUE # continue search
  })
  
  expect_true(count > 0)
  expect_true(all(cycle_lengths >= 1))
})

test_that("simple_cycles_callback can stop early", {
  withr::local_seed(123)
  
  g <- graph_from_literal(A -+ B -+ C -+ A -+ D -+ E -+ D)
  
  # Stop after finding 2 cycles
  count <- 0
  
  simple_cycles(g, callback = function(vertices, edges) {
    count <<- count + 1
    if (count >= 2) {
      FALSE # stop after 2 cycles
    } else {
      TRUE # continue
    }
  })
  
  expect_equal(count, 2)
})

test_that("simple_cycles_callback receives correct arguments", {
  g <- make_ring(5, directed = TRUE)
  
  # Check argument types
  simple_cycles(g, callback = function(vertices, edges) {
    expect_true(is.integer(vertices))
    expect_true(is.integer(edges))
    expect_equal(length(vertices), length(edges))
    expect_true(length(vertices) >= 1)
    FALSE # stop after first cycle
  })
})

test_that("simple_cycles_callback handles errors in callback", {
  g <- make_ring(5, directed = TRUE)
  
  # Callback that throws an error
  expect_error(
    simple_cycles(g, callback = function(vertices, edges) {
      stop("Intentional error in callback")
    }),
    "Error in R callback function"
  )
})
