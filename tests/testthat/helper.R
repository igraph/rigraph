skip_if_no_glpk <- function() {
  if (!has_glpk()) skip("No GLPK library")
}

skip_if_no_graphml <- function() {
  if (!has_graphml()) skip("No GraphML support")
}

with_rng_version <- function(version, expr) {
  orig <- RNGkind()
  on.exit(do.call(RNGkind, as.list(orig)), add = TRUE)
  suppressWarnings(RNGversion(version))
  expr
}

local_rng_version <- function(version, .local_envir = parent.frame()) {
  orig <- RNGkind()
  withr::defer(do.call(RNGkind, as.list(orig)), envir = .local_envir)
  suppressWarnings(RNGversion(version))
  orig
}

expect_isomorphic <- function(g1, g2, ...) {
  expect_true(isomorphic(g1, g2, ...))
}

expect_not_isomorphic <- function(g1, g2, ...) {
  expect_false(isomorphic(g1, g2, ...))
}

expect_vcount <- function(graph, expected, ...) {
  expect_equal(object = vcount(graph), expected = expected, ...)
}

expect_ecount <- function(graph, expected, ...) {
  expect_equal(object = ecount(graph), expected = expected, ...)
}

expect_identical_graphs <- function(g1, g2, ...) {
  expect_true(identical_graphs(g1, g2, ...))
}

expect_not_identical_graphs <- function(g1, g2, ...) {
  expect_false(identical_graphs(g1, g2, ...))
}
