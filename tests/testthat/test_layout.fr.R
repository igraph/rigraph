
context("Fruchterman-Reingold layout")

test_that("", {

  skip_on_os("solaris")

  library(igraph)
  set.seed(42)
  g <- make_ring(10)
  l <- layout_with_fr(g, niter=50, start.temp=sqrt(10)/10)
  expect_true(
    isTRUE(all.equal(sum(l), 10.794223604849)) ||
    isTRUE(all.equal(sum(l), 10.7943032688805))
  )

  set.seed(42)
  g <- make_star(30)
  l <- layout_with_fr(g, niter=500, dim=3, start.temp=20)
  expect_true(
    isTRUE(all.equal(sum(l), 1004.00737470853)) ||
    isTRUE(all.equal(sum(l), 941.472420651506))
  )

})
