test_that("deprecated indexing functions are indeed deprecated", {
  g <- make_ring(10)

  expect_error(V(g)[nei(1)], "was deprecated")
  expect_error(V(g)[innei(1)], "was deprecated")
  expect_error(V(g)[outnei(1)], "was deprecated")
  expect_error(V(g)[inc(1)], "was deprecated")
  expect_error(V(g)[adj(1)], "was deprecated")
  expect_error(V(g)[from(1)], "was deprecated")
  expect_error(V(g)[to(1)], "was deprecated")

  expect_error(E(g)[adj(1)], "was deprecated")
  expect_error(E(g)[inc(1)], "was deprecated")
  expect_error(E(g)[from(1)], "was deprecated")
  expect_error(E(g)[to(1)], "was deprecated")
})
