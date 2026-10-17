# Call `fn(...)` the way a user would.
#
# Two things stand between a test and what a user sees. The environment a test
# runs in belongs to igraph, and lifecycle exempts the test suite of the
# deprecating package from its "is this the user's doing?" question, treating
# igraph's own frames as direct (see setup-lifecycle.R). Both would make these
# tests pass whether or not the callback is attributed to its caller. So call
# from an environment that belongs to no package, with the exemption cleared.
as_user <- function(fn, ...) {
  withr::local_envvar(TESTTHAT_PKG = "")
  user <- rlang::new_function(
    args = rlang::pairlist2(... = ),
    body = quote(fn(...)),
    env = rlang::env(globalenv(), fn = fn)
  )
  user(...)
}

# A function that igraph deprecates, without the noise of one that also does
# something. Its name is what tells lifecycle's deduplication one deprecation
# apart from the other, so each test needs its own.
deprecated_igraph_function <- function(
  what,
  signaller = "deprecate_soft",
  value = quote(invisible(NULL))
) {
  rlang::new_function(
    args = rlang::pairlist2(... = ),
    body = call(
      "{",
      rlang::call2(signaller, "2.0.0", what, .ns = "lifecycle"),
      value
    ),
    env = asNamespace("igraph")
  )
}

# An igraph function that hands a function argument on, with and without the
# treatment under test.
igraph_function <- function(wrapped) {
  fn <- if (wrapped) {
    function(callback, ...) call_user_callback(callback, ...)
  } else {
    function(callback, ...) callback(...)
  }
  environment(fn) <- asNamespace("igraph")
  fn
}

test_that("as_user_callback() leaves everything but a function alone", {
  expect_null(as_user_callback(NULL))
  expect_identical(as_user_callback("ecount"), "ecount")
})

test_that("a callback is called by the user, not by igraph", {
  caller_package <- function() environmentName(topenv(parent.frame()))

  expect_equal(as_user(igraph_function(FALSE), caller_package), "igraph")
  expect_equal(as_user(igraph_function(TRUE), caller_package), "R_GlobalEnv")
})

test_that("lifecycle names the user rather than igraph", {
  rlang::local_options(lifecycle_verbosity = "warning")

  expect_snapshot({
    # As things stand, a soft deprecation goes unmentioned, because lifecycle
    # does not report a package's own use of one ...
    as_user(igraph_function(FALSE), deprecated_igraph_function("soft_plain()"))

    # ... and a warning deprecation asks the user to report an igraph bug.
    as_user(
      igraph_function(FALSE),
      deprecated_igraph_function("warn_plain()", "deprecate_warn")
    )

    # Called from the environment igraph was called from, both name the user.
    as_user(igraph_function(TRUE), deprecated_igraph_function("soft_wrapped()"))
    as_user(
      igraph_function(TRUE),
      deprecated_igraph_function("warn_wrapped()", "deprecate_warn")
    )
  })
})

test_that("a soft deprecation stays silent for another package", {
  fn <- deprecated_igraph_function("soft_other_package()")
  call_igraph <- function() call_user_callback(fn)
  environment(call_igraph) <- rlang::env(asNamespace("stats"), fn = fn)
  igraph_caller <- function() call_igraph()
  environment(igraph_caller) <- rlang::env(
    asNamespace("igraph"),
    call_igraph = call_igraph
  )

  withr::local_envvar(TESTTHAT_PKG = "")
  expect_no_warning(igraph_caller())
})

# ---- deprecated functions passed as arguments -------------------------

test_that("plot() reports a deprecated layout function", {
  g <- make_ring(5)
  withr::local_pdf(NULL)
  rlang::local_options(lifecycle_verbosity = "warning")

  # expect_snapshot() has no way to replay the plot a plotting call records,
  # so capture the warnings first and snapshot those.
  warnings <- testthat::capture_warnings(
    as_user(plot, g, layout = layout.circle)
  )
  expect_snapshot(cat(warnings, sep = "\n"))
})

test_that("plot() reports a deprecated layout graph attribute", {
  g <- make_ring(5)
  g$layout <- layout.random
  withr::local_pdf(NULL)
  rlang::local_options(lifecycle_verbosity = "warning")

  warnings <- testthat::capture_warnings(as_user(plot, g))
  expect_snapshot(cat(warnings, sep = "\n"))
})

test_that("plot() is silent about a current layout function", {
  g <- make_ring(5)
  withr::local_pdf(NULL)

  expect_no_condition(plot(g, layout = layout_in_circle))
})

test_that("layout_nicely() reports a deprecated layout graph attribute", {
  g <- make_ring(5)
  g$layout <- layout.circle
  rlang::local_options(lifecycle_verbosity = "warning")

  expect_snapshot(coords <- as_user(layout_nicely, g))
})

test_that("layout_components() reports a deprecated layout function", {
  g <- make_ring(5) + make_ring(4)
  rlang::local_options(lifecycle_verbosity = "warning")

  expect_snapshot(coords <- as_user(layout_components, g, layout.circle))
})

test_that("add_shape() reports a deprecated shape function when it is used", {
  g <- make_ring(5)
  withr::local_pdf(NULL)
  rlang::local_options(lifecycle_verbosity = "warning")

  as_user(add_shape, "test-noplot", plot = igraph.shape.noplot)
  warnings <- testthat::capture_warnings(plot(g, vertex.shape = "test-noplot"))
  expect_snapshot(cat(warnings, sep = "\n"))
})

test_that("local_scan() reports a deprecated FUN", {
  # Two vertices, so that the snapshot stays short: `FUN` is called for each of
  # them, and the "warning" verbosity these tests need turns off the
  # deduplication that leaves a user with one warning.
  g <- make_ring(2)
  rlang::local_options(lifecycle_verbosity = "warning")

  expect_snapshot(scan <- as_user(local_scan, g, FUN = graph.density))
})

test_that("attribute combinations report a deprecated function", {
  g <- make_graph(c(1, 2, 1, 2))
  E(g)$weight <- c(1, 2)
  rlang::local_options(lifecycle_verbosity = "warning")

  # `is.igraph()` is not a meaningful combiner, but it is softly deprecated and
  # accepts the vector of attribute values that a combiner is handed.
  expect_snapshot(
    simple <- as_user(simplify, g, edge.attr.comb = list(weight = is.igraph))
  )
})

test_that("callbacks report a deprecated function", {
  g <- make_ring(3)
  rlang::local_options(lifecycle_verbosity = "warning")

  # Called with each clique -- the one triangle -- and FALSE keeps the search
  # going.
  expect_snapshot(as_user(cliques, g, min = 3, callback = is.igraph))
})
