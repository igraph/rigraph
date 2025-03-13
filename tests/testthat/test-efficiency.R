test_that("global_efficiency works", {
  g <- graph_from_literal(A - B - C - D - A)
  expect_equal(global_efficiency(g), 5 / 6)

  g <- graph_from_literal(A -+ B -+ C -+ D -+ A)
  expect_equal(global_efficiency(g), 11 / 18)
  expect_equal(global_efficiency(g, directed = F), 5 / 6)
})

test_that("local_efficiency works", {
  g <- graph_from_literal(A - B - C - D - A)
  expect_equal(as.vector(local_efficiency(g)), rep(0.5, vcount(g)))
  expect_equal(average_local_efficiency(g), mean(local_efficiency(g)))

  g <- graph_from_literal(A -+ B -+ C -+ D -+ A)
  expect_equal(as.vector(local_efficiency(g)), rep(0.25, vcount(g)))
  expect_equal(average_local_efficiency(g), mean(local_efficiency(g)))

  g <- graph_from_literal(A -+ B -+ C -+ D -+ A)
  expect_equal(
    as.vector(local_efficiency(g, directed = F)),
    rep(0.5, vcount(g))
  )
  expect_equal(
    average_local_efficiency(g, directed = F),
    mean(local_efficiency(g, directed = F))
  )
  expect_equal(as.vector(local_efficiency(g, mode = "in")), rep(0, vcount(g)))
  expect_equal(as.vector(local_efficiency(g, mode = "out")), rep(0, vcount(g)))
})
