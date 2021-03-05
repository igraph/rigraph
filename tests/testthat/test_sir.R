
context("SIR epidemics model on a network")

test_that("SIR works", {

  skip_on_os("solaris")

  set.seed(42)
  library(digest)
  library(igraph)

  g <- sample_gnm(50, 50)
  res <- sir(g, beta=5, gamma=1, no.sim=10)
  exps <- c(
    "b73a8ad03b832b3543f2f03d07330398",
    "bc42d0cbe0bb3321e83979c0432f9cea"
  )
  expect_true(digest(res) %in% exps)
})

