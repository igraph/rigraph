test_that("constraint works", {
  constraint.orig <- function(graph, nodes = V(graph), attr = NULL) {
    ensure_igraph(graph)
    idx <- degree(graph) != 0
    A <- as_adj(graph, attr = attr, sparse = FALSE)
    A <- A[idx, idx]
    n <- sum(idx)

    one <- c(rep(1, n))
    CZ <- A + t(A)
    cs <- CZ %*% one # degree of vertices
    ics <- 1 / cs
    CS <- ics %*% t(one) # 1/degree of vertices
    P <- CZ * CS # intermediate result: proportionate tie strengths
    PSQ <- P %*% P # sum paths of length two
    P.bi <- as.numeric(P > 0) # exclude paths to non-contacts (& reflexive):
    PC <- (P + (PSQ * P.bi))^2 # dyadic constraint
    ci <- PC %*% one # overall constraint
    dim(ci) <- NULL

    ci2 <- numeric(vcount(graph))
    ci2[idx] <- ci
    ci2[!idx] <- NaN
    ci2[nodes]
  }

  karate <- make_graph("Zachary")

  c1 <- constraint(karate)
  c2 <- constraint.orig(karate)
  expect_equal(c1, c2)

  withr::local_seed(42)
  E(karate)$weight <- sample(1:10, replace = TRUE, ecount(karate))
  wc1 <- constraint(karate)
  wc2 <- constraint.orig(karate, attr = "weight")
  expect_equal(wc1, wc2)
})
