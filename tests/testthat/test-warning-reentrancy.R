# A warning from the C core is signalled while the C function that raised it
# is still on the stack. R code that runs at that point, a calling handler for
# instance, may call igraph again; the nested call must not free the vectors of
# the outer call or drop the attributes of the graph it is about to return.

test_that("a warning handler that calls igraph does not corrupt the call", {
  g <- make_ring(4)
  expected <- suppressWarnings(triad_census(g))

  out <- withCallingHandlers(
    triad_census(g),
    warning = function(w) {
      degree(make_ring(3))
      invokeRestart("muffleWarning")
    }
  )

  expect_identical(out, expected)
})

test_that("a logging handler can look at the graph that warned", {
  graphs <- list(make_ring(4), make_star(5))
  log <- character()

  census <- lapply(graphs, function(g) {
    withCallingHandlers(
      triad_census(g),
      warning = function(w) {
        log <<- c(log, paste0(vcount(g), ": ", conditionMessage(w)))
        invokeRestart("muffleWarning")
      }
    )
  })

  expect_length(log, 1)
  expect_match(log, "^4: Triad census called on an undirected graph")
  expect_identical(census, suppressWarnings(lapply(graphs, triad_census)))
})

test_that("a returned graph keeps its attributes when the handler collects garbage", {
  g <- make_ring(5)
  V(g)$name <- letters[1:5]
  E(g)$weight <- 1:5

  out <- withCallingHandlers(
    connect(g, 1),
    warning = function(w) {
      for (i in 1:5) {
        h <- make_ring(20)
        V(h)$name <- as.character(1:20)
      }
      gc()
      invokeRestart("muffleWarning")
    }
  )

  expect_identical(V(out)$name, letters[1:5])
  expect_identical(E(out)$weight, 1:5)
})

test_that("igraph stays usable after a warning handler jumps out", {
  g <- make_ring(4)

  expect_identical(
    tryCatch(triad_census(g), warning = function(w) "caught"),
    "caught"
  )
  expect_error(
    withCallingHandlers(
      triad_census(g),
      warning = function(w) {
        degree(g)
        stop("from the handler")
      }
    ),
    "from the handler"
  )
  expect_identical(degree(g), rep(2, 4))
})

test_that("C warnings keep their text, source and count", {
  messages <- character()
  withCallingHandlers(
    triad_census(make_ring(4)),
    warning = function(w) {
      messages <<- c(messages, conditionMessage(w))
      invokeRestart("muffleWarning")
    }
  )

  expect_length(messages, 1)
  expect_match(
    messages,
    "^Triad census called on an undirected graph\\. All connections will be treated as mutual\\.\nSource: misc/motifs\\.c:[0-9]+$"
  )
})

test_that("C warnings name the R function that called into C", {
  # Also when that function is not byte-compiled, as under load_all() or covr.
  w <- tryCatch(triad_census(make_ring(4)), warning = identity)
  expect_identical(conditionCall(w), quote(triad_census_impl(graph = graph)))
})
