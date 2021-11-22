
context("Fruchterman-Reingold layout")

test_that("", {

  skip_on_os("solaris")

  library(igraph)
  set.seed(42)
  g <- make_ring(10)
  l <- layout_with_fr(g, niter=50, start.temp=sqrt(10)/10)
  expect_true(
    isTRUE(all.equal(sum(l), 10.8, tolerance = 0.1))
  )

  set.seed(42)
  g <- make_star(30)
  l <- layout_with_fr(g, niter=500, dim=3, start.temp=20)
  expect_true(
    (Sys.info()["machine"] %in% c("aarch64", "ppc64", "ppc64le", "s390x") &&
     isTRUE(all.equal(sum(l), 1079, tolerance = 1))) ||
    isTRUE(all.equal(sum(l), 1004.00737470853)) ||
    isTRUE(all.equal(sum(l), 941.472420651506))
  )

})
