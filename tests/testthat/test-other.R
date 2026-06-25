test_that("convex_hull works", {
  xy <- cbind(
    c(0, 1, 2, 3, 4, 0, 1, 2, 3, 1, 2),
    c(0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2)
  )
  vp <- convex_hull(xy)
  expect_equal(vp$resverts, c(1, 6, 10, 11, 5))
  expect_equal(vp$rescoords, xy[vp$resverts, ])
})

test_that("convex_hull uses 1-based indexing, #613", {
  withr::local_seed(45)
  n <- 10
  xy <- cbind(runif(n), runif(n))
  vp <- convex_hull(xy)
  expect_equal(vp$resverts, c(8, 10, 7, 2, 1))
})

test_that("can create graphs when igraph is not attached", {
  g <- callr::r(function() {
    igraph::make_ring(3, directed = TRUE)
  })
  g2 <- make_ring(3, directed = TRUE)
  expect_identical(
    unclass(g)[-igraph_t_idx_env],
    unclass(g2)[-igraph_t_idx_env]
  )
})

test_that("running_mean works", {
  expect_equal(running_mean(1:10, 2), 2:10 - 0.5)
  expect_snapshot_igraph_error(
    running_mean(1:3, 4)
  )
})

test_that("R help contains guarantee on number of RNG bits", {
  skip_on_cran()

  # utils:::.getHelpFile
  get_help_file <- get(".getHelpFile", envir = asNamespace("utils"))
  text <- capture.output(tools::Rd2txt(get_help_file(help("Random"))))

  expect_true(any(grepl(
    "all give at least 30 varying bits",
    text,
    fixed = TRUE
  )))
})

test_that("serialization works", {
  g <- make_ring(3, directed = TRUE)
  gs <- unserialize(serialize(g, NULL))

  expect_identical(
    unclass(g)[-igraph_t_idx_env],
    unclass(gs)[-igraph_t_idx_env]
  )

  expect_snapshot({
    g
    gs
  })
})

# The old-format `karate_oldstyle` fixture (and its `karate_oldstyle_names`)
# used below live in helper-test-functions.R.

test_that("VS/ES require explicit conversion", {
  expect_snapshot_igraph_error({
    V(karate_oldstyle)
  })
})

test_that("VS/ES work with old data type", {
  karate2 <- upgrade_graph(karate_oldstyle)
  vs2 <- V(karate2)

  expect_length(vs2, 34)
  expect_equal(vs2$name, karate_oldstyle_names)
})
