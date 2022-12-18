test_that("deprecated indexing functions are indeed deprecated", {
  g <- make_ring(10)

  expect_warning(V(g)[nei(1)], "is deprecated")
  expect_warning(V(g)[innei(1)], "is deprecated")
  expect_warning(V(g)[outnei(1)], "is deprecated")
  expect_warning(V(g)[inc(1)], "is deprecated")
  expect_warning(V(g)[adj(1)], "is deprecated")
  expect_warning(V(g)[from(1)], "is deprecated")
  expect_warning(V(g)[to(1)], "is deprecated")

  expect_warning(E(g)[adj(1)], "is deprecated")
  expect_warning(E(g)[inc(1)], "is deprecated")
  expect_warning(E(g)[from(1)], "is deprecated")
  expect_warning(E(g)[to(1)], "is deprecated")
})
