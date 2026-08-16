# Call `fn(...)` the way a user would.
#
# Two things stand between a test and what a user sees. The environment a test
# runs in belongs to igraph, and lifecycle exempts the test suite of the
# deprecating package from its "is this the user's doing?" question, treating
# igraph's own frames as direct (see setup-lifecycle.R). Both would make these
# tests pass whether or not the check reports anything. So call from an
# environment that belongs to no package, with the exemption cleared.
as_user <- function(fn, ...) {
  withr::local_envvar(TESTTHAT_PKG = "")
  user <- rlang::new_function(
    args = rlang::pairlist2(... = ),
    body = quote(fn(...)),
    env = rlang::env(globalenv(), fn = fn)
  )
  user(...)
}

# The deprecated function warns again when igraph goes on to call it, unless
# lifecycle recognizes the repeat. Capturing every warning keeps a second one
# from escaping the test, and asserts that nothing else did.
expect_deprecation <- function(expr, regexp) {
  warnings <- testthat::capture_warnings(expr)
  expect_gt(length(warnings), 0)
  expect_match(warnings, regexp, all = TRUE)
  # The point of the exercise: lifecycle appends this to a deprecation it holds
  # igraph responsible for, and asks the user to report a bug about it.
  expect_no_match(warnings, "likely used in")
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

  expect_deprecation(
    as_user(plot, g, layout = layout.circle),
    "layout_in_circle"
  )
})

test_that("plot() reports a deprecated layout graph attribute", {
  g <- make_ring(5)
  g$layout <- layout.random
  withr::local_pdf(NULL)

  expect_deprecation(as_user(plot, g), "layout_randomly")
})

test_that("plot() is silent about a current layout function", {
  g <- make_ring(5)
  withr::local_pdf(NULL)

  expect_no_condition(plot(g, layout = layout_in_circle))
})

test_that("layout_nicely() reports a deprecated layout graph attribute", {
  g <- make_ring(5)
  g$layout <- layout.circle

  expect_deprecation(as_user(layout_nicely, g), "layout_in_circle")
})

test_that("layout_components() reports a deprecated layout function", {
  g <- make_ring(5) + make_ring(4)

  expect_deprecation(
    as_user(layout_components, g, layout.circle),
    "layout_in_circle"
  )
})

test_that("add_shape() reports deprecated clip and plot functions", {
  expect_deprecation(
    as_user(add_shape, "test-clip", clip = igraph.shape.noclip),
    "shape_noclip"
  )
  expect_deprecation(
    as_user(add_shape, "test-plot", plot = igraph.shape.noplot),
    "shape_noplot"
  )
})

test_that("local_scan() reports a deprecated FUN", {
  g <- make_ring(5)

  expect_deprecation(
    as_user(local_scan, g, FUN = graph.density),
    "edge_density"
  )
})

test_that("attribute combinations report a deprecated function", {
  g <- make_graph(c(1, 2, 1, 2))
  E(g)$weight <- c(1, 2)

  # `is.igraph()` is not a meaningful combiner, but it is softly deprecated and
  # accepts the vector of attribute values that a combiner is handed.
  expect_deprecation(
    as_user(simplify, g, edge.attr.comb = list(weight = is.igraph)),
    "is_igraph"
  )
})

test_that("callbacks report a deprecated function", {
  # A graph without cliques, so that the callback is reported but never called.
  g <- make_empty_graph(0)

  expect_deprecation(
    as_user(cliques, g, callback = graph.density),
    "edge_density"
  )
})

# ---- deprecation levels are preserved ----------------------------------

# A function that igraph deprecates, without the noise of one that also does
# something. Its name is what tells lifecycle's deduplication one deprecation
# apart from the other, so each test needs its own.
deprecated_igraph_function <- function(what, signaller = "deprecate_soft") {
  rlang::new_function(
    args = rlang::pairlist2(... = ),
    body = rlang::call2(signaller, "2.0.0", what, .ns = "lifecycle"),
    env = asNamespace("igraph")
  )
}

# An igraph function that calls a function argument, with and without the check
# under test.
igraph_function <- function(checked) {
  fn <- if (checked) {
    function(callback, ...) {
      check_deprecated_function(callback)
      callback(...)
    }
  } else {
    function(callback, ...) callback(...)
  }
  environment(fn) <- asNamespace("igraph")
  fn
}

test_that("a soft deprecation reaches the user that caused it", {
  # Silent as things stand: lifecycle sees an igraph frame as the caller, and
  # does not report a package's own use of a softly deprecated function.
  expect_no_warning(
    as_user(igraph_function(FALSE), deprecated_igraph_function("soft_silent()"))
  )

  expect_deprecation(
    as_user(igraph_function(TRUE), deprecated_igraph_function("soft_heard()")),
    "soft_heard"
  )
})

test_that("a soft deprecation stays silent for another package", {
  fn <- deprecated_igraph_function("soft_other_package()")
  call_igraph <- function() igraph_function(TRUE)(fn)
  environment(call_igraph) <- rlang::env(
    asNamespace("stats"),
    fn = fn,
    igraph_function = igraph_function
  )

  withr::local_envvar(TESTTHAT_PKG = "")
  expect_no_warning(call_igraph())
})

test_that("a warning deprecation stops blaming igraph for the user's choice", {
  blamed <- testthat::capture_warnings(
    as_user(
      igraph_function(FALSE),
      deprecated_igraph_function("warn_blamed()", "deprecate_warn")
    )
  )
  expect_match(blamed, "likely used in the .*igraph.* package")

  # Reported once, not twice: the check replays the deprecation of the function
  # verbatim, so lifecycle recognizes the one the function itself signals when
  # it is called next as a repeat.
  attributed <- testthat::capture_warnings(
    as_user(
      igraph_function(TRUE),
      deprecated_igraph_function("warn_attributed()", "deprecate_warn")
    )
  )
  expect_length(attributed, 1)
  expect_no_match(attributed, "likely used in")
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
