test_that("simplify(remove.multiple = , remove.loops = ) are renamed", {
  g <- make_graph(c(1, 1, 1, 2, 1, 2), directed = FALSE)
  expect_legacy_arg(
    simplify,
    list(g),
    "remove.multiple",
    "remove_multiple",
    FALSE
  )
  expect_legacy_arg(simplify, list(g), "remove.loops", "remove_loops", FALSE)
})
