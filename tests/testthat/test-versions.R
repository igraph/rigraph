test_that("we create graphs of the current version", {
  g <- make_ring(10)
  v1 <- graph_version(g)
  v2 <- graph_version()
  expect_equal(v1, v2)
})

test_that("we can't upgrade from 0.1.1 to 1.5.0, on the fly", {
  expect_snapshot(error = TRUE, {
    oldsample_0_1_1()
  })
})

test_that("we can't upgrade from 0.1.1 to 1.5.0, explicitly", {
  g <- oldsample_0_1_1()

  expect_equal(graph_version(g), ver_0_1_1)

  expect_snapshot(error = TRUE, {
    upgrade_graph(g)
  })
})

test_that("we can't upgrade from 0.2 to 1.5.0, on the fly", {
  expect_snapshot(error = TRUE, {
    oldsample_0_2()
  })
})

test_that("we can upgrade from 0.2 to 1.5.0, explicitly", {
  g <- oldsample_0_2()

  expect_equal(graph_version(g), ver_0_4)

  g2 <- upgrade_graph(g)
  expect_equal(graph_version(g2), ver_1_5_0)
})

test_that("we can't upgrade from 0.5 to 1.5.0, on the fly", {
  expect_snapshot(error = TRUE, {
    oldsample_0_5()
  })
})

test_that("we can upgrade from 0.5 to 1.5.0, explicitly", {
  g <- oldsample_0_5()

  expect_equal(graph_version(g), ver_0_4)

  g2 <- upgrade_graph(g)
  expect_equal(graph_version(g2), ver_1_5_0)
})

test_that("we can't upgrade from 0.6 to 1.5.0, on the fly", {
  expect_snapshot(error = TRUE, {
    oldsample_0_6()
  })
})

test_that("we can upgrade from 0.6 to 1.5.0, explicitly", {
  g <- oldsample_0_6()

  expect_equal(graph_version(g), ver_0_4)

  g2 <- upgrade_graph(g)
  expect_equal(graph_version(g2), ver_1_5_0)
})

test_that("we can upgrade from 1.0.0 to 1.5.0, on the fly", {
  local_igraph_options(print.id = FALSE)

  expect_snapshot({
    g <- oldsample_1_0_0()
    graph_version(g)
    g
    graph_version(g)
  })
})

test_that("we can upgrade from 1.0.0 to 1.5.0, explicitly", {
  g <- oldsample_1_0_0()
  graph_version(g)
  g2 <- upgrade_graph(g)
  graph_version(g2)

  g3 <- oldsample_1_5_0()

  expect_identical(
    unclass(clear_native_ptr(g2)),
    unclass(clear_native_ptr(g3))
  )
})

test_that("reading of old igraph formats", {
  local_igraph_options(print.id = FALSE)

  s <- oldsamples()
  expect_snapshot(error = TRUE, {
    s[["0.1.1"]]
  })
  expect_snapshot(error = TRUE, {
    s[["0.2"]]
  })
  expect_snapshot(error = TRUE, {
    s[["0.5"]]
  })
  expect_snapshot(error = TRUE, {
    s[["0.6"]]
  })
  expect_snapshot({
    s[["1.0.0"]]
  })
  expect_snapshot({
    s[["1.5.0"]]
  })
})

test_that("igraph_version returns a version string", {
  ## This is essentially a semver regex, we do not allow a
  ## leading 'v' and space after
  regex <- paste0(
    "\\b", # word boundary
    "(?:0|[1-9][0-9]*)\\.", # major
    "(?:0|[1-9][0-9]*)\\.", # minor
    "(?:0|[1-9][0-9]*)", # patch
    "(?:-[\\da-zA-Z\\-]+(?:\\.[\\da-zA-Z\\-]+)*)?", # prerelease
    "(?:\\+[\\da-zA-Z\\-]+(?:\\.[\\da-zA-Z\\-]+)*)?", # word boundary
    "\\b"
  )

  expect_match(igraph_version("R"), regex)
  expect_match(igraph_version(), regex)

  c_regex <- paste0(
    "\\b", # word boundary
    "(?:0|[1-9][0-9]*)\\.", # major
    "(?:0|[1-9][0-9]*)\\.", # minor
    "(?:0|[1-9][0-9]*)", # subminor
    "\\b"
  )

  expect_match(igraph_version("C"), c_regex)
})
