test_that("global_efficiency works", {
  g <- graph_from_literal(A - B - C - D - A)
  expect_that(global_efficiency(g), equals(5 / 6))

  g <- graph_from_literal(A -+ B -+ C -+ D -+ A)
  expect_that(global_efficiency(g), equals(11 / 18))
  expect_that(global_efficiency(g, directed = F), equals(5 / 6))
})

test_that("local_efficiency works", {
  g <- graph_from_literal(A - B - C - D - A)
  expect_that(as.vector(local_efficiency(g)), equals(rep(0.5, vcount(g))))
  expect_that(average_local_efficiency(g), equals(mean(local_efficiency(g))))

  g <- graph_from_literal(A -+ B -+ C -+ D -+ A)
  expect_that(as.vector(local_efficiency(g)), equals(rep(0.25, vcount(g))))
  expect_that(average_local_efficiency(g), equals(mean(local_efficiency(g))))

  g <- graph_from_literal(A -+ B -+ C -+ D -+ A)
  expect_that(as.vector(local_efficiency(g, directed = F)), equals(rep(0.5, vcount(g))))
  expect_that(average_local_efficiency(g, directed = F), equals(mean(local_efficiency(g, directed = F))))
  expect_that(as.vector(local_efficiency(g, mode = "in")), equals(rep(0, vcount(g))))
  expect_that(as.vector(local_efficiency(g, mode = "out")), equals(rep(0, vcount(g))))
})
