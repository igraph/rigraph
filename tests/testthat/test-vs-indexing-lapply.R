
context("VS/ES indexing")

test_that("VS/ES indexing works in tricky situations", {

  g <- make_ring(10)
  x <- list(V(g)[1:5], V(g)[6:10])
  lapply(x, function(i) { V(g)[i] })
  lapply(x, function(i) { V(g)[[i]] })

})
