# lifecycle reports a deprecation only once per session, but not inside the
# test suite of the deprecating package: there it treats igraph as the user
# (see setup-lifecycle.R), so a deprecated function igraph calls after the
# check has reported it warns a second time. Capturing every warning keeps
# that second one from escaping the test, and asserts that nothing else did.
expect_deprecation <- function(expr, regexp) {
  warnings <- testthat::capture_warnings(expr)
  expect_gt(length(warnings), 0)
  expect_match(warnings, regexp, all = TRUE)
}

test_that("function_deprecation() reads the deprecation a function signals", {
  expect_equal(
    function_deprecation(layout.circle),
    list(
      signaller = "deprecate_warn",
      when = "2.1.0",
      what = "layout.circle()",
      with = "layout_in_circle()",
      details = NULL
    )
  )
})

test_that("function_deprecation() ignores anything that is not a deprecated function", {
  expect_null(function_deprecation(layout_in_circle))
  expect_null(function_deprecation(NULL))
  expect_null(function_deprecation("layout.circle"))
  expect_null(function_deprecation(sum))
  expect_null(function_deprecation(function(graph) NULL))
})

test_that("function_deprecation() ignores deprecations of an argument", {
  # bfs() deprecates its `father` argument, conditionally on it being passed;
  # bfs() itself is not deprecated.
  expect_null(function_deprecation(bfs))
})

test_that("check_deprecated_function() returns its argument invisibly", {
  expect_invisible(out <- check_deprecated_function(layout_in_circle))
  expect_identical(out, layout_in_circle)
})

test_that("check_deprecated_function() reports a deprecated function", {
  lifecycle::expect_deprecated(
    check_deprecated_function(layout.circle),
    "layout_in_circle"
  )
})

test_that("check_deprecated_function() reports a defunct function", {
  expect_snapshot(error = TRUE, {
    check_deprecated_function(hub.score)
  })
})

test_that("igraph_user_env() skips igraph's own frames", {
  igraph_frame <- function() igraph_user_env()
  environment(igraph_frame) <- asNamespace("igraph")

  caller <- environment()
  expect_identical(igraph_frame(), caller)
})

# ---- deprecated functions passed as arguments -------------------------

test_that("plot() reports a deprecated layout function", {
  g <- make_ring(5)
  withr::local_pdf(NULL)

  expect_deprecation(plot(g, layout = layout.circle), "layout_in_circle")
})

test_that("plot() reports a deprecated layout graph attribute", {
  g <- make_ring(5)
  g$layout <- layout.random
  withr::local_pdf(NULL)

  expect_deprecation(plot(g), "layout_randomly")
})

test_that("plot() is silent about a current layout function", {
  g <- make_ring(5)
  withr::local_pdf(NULL)

  expect_no_condition(plot(g, layout = layout_in_circle))
})

test_that("layout_nicely() reports a deprecated layout graph attribute", {
  g <- make_ring(5)
  g$layout <- layout.circle

  expect_deprecation(layout_nicely(g), "layout_in_circle")
})

test_that("layout_components() reports a deprecated layout function", {
  g <- make_ring(5) + make_ring(4)

  expect_deprecation(layout_components(g, layout.circle), "layout_in_circle")
})

test_that("add_shape() reports deprecated clip and plot functions", {
  expect_deprecation(
    add_shape("test-clip", clip = igraph.shape.noclip),
    "shape_noclip"
  )
  expect_deprecation(
    add_shape("test-plot", plot = igraph.shape.noplot),
    "shape_noplot"
  )
})

test_that("local_scan() reports a deprecated FUN", {
  g <- make_ring(5)

  expect_deprecation(local_scan(g, FUN = graph.density), "edge_density")
})

test_that("attribute combinations report a deprecated function", {
  expect_deprecation(
    igraph.i.attribute.combination(list(weight = graph.density)),
    "edge_density"
  )
})

test_that("callbacks report a deprecated function", {
  # A graph without cliques, so that the callback is reported but never called.
  g <- make_empty_graph(0)

  expect_deprecation(cliques(g, callback = graph.density), "edge_density")
})

# ---- deprecation levels are preserved ----------------------------------

# A function that igraph deprecates, without the noise of one that also does
# something. Its name is what tells lifecycle's deduplication one deprecation
# apart from the other, so each test needs its own.
deprecated_igraph_function <- function(what, signaller = "deprecate_warn") {
  rlang::new_function(
    args = NULL,
    body = rlang::call2(signaller, "2.0.0", what, .ns = "lifecycle"),
    env = asNamespace("igraph")
  )
}

test_that("a soft deprecation is only reported to the user that caused it", {
  # Called from the global environment, as a test is, this is the user's doing.
  lifecycle::expect_deprecated(
    check_deprecated_function(
      deprecated_igraph_function("soft_direct()", "deprecate_soft")
    )
  )

  # From another package it is not, and stays silent for lack of an audience.
  fn <- deprecated_igraph_function("soft_indirect()", "deprecate_soft")
  other_pkg <- function() check_deprecated_function(fn)
  environment(other_pkg) <- rlang::env(
    asNamespace("stats"),
    fn = fn,
    check_deprecated_function = check_deprecated_function
  )
  expect_no_warning(other_pkg())
})

test_that("a deprecation is reported once, not once per call site", {
  fn <- deprecated_igraph_function("reported_once()")

  # The check replays the deprecation of `fn` verbatim, so that lifecycle
  # recognizes the one `fn` signals when it is called next as a repeat.
  # Deduplication is what a user sees; the test suite of the deprecating
  # package is exempt from it, hence the explicit verbosity.
  rlang::local_options(lifecycle_verbosity = "default")
  expect_warning(check_deprecated_function(fn), "reported_once")
  expect_no_warning(fn())
})

# ---- un-deprecated layout callbacks ------------------------------------

test_that("the layout functions that plot() may be handed still work", {
  g <- make_ring(5)

  expect_deprecation(coords <- layout.spring(g), "layout_with_fr")
  expect_equal(dim(coords), c(5, 2))

  expect_deprecation(coords <- layout.svd(g), "layout_with_fr")
  expect_equal(dim(coords), c(5, 2))

  expect_deprecation(
    coords <- layout.fruchterman.reingold.grid(g),
    "layout_with_fr"
  )
  expect_equal(dim(coords), c(5, 2))
})
