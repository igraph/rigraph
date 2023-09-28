test_that("assortativity works", {
  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "1.txt"))
  g <- read_graph(f <- gzfile("celegansneural.gml.gz"), format = "gml")

  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "2.txt"))
  assR <- function(graph) {
    indeg <- degree(graph, mode = "in")
    outdeg <- degree(graph, mode = "out")
    el <- as_edgelist(graph, names = FALSE)
    J <- outdeg[el[, 1]] - 1
    K <- indeg[el[, 2]] - 1
    num <- sum(J * K) - sum(J) * sum(K) / ecount(graph)
    den1 <- sum(J * J) - sum(J)^2 / ecount(graph)
    den2 <- sum(K * K) - sum(K)^2 / ecount(graph)
    num / sqrt(den1) / sqrt(den2)
  }

  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "3.txt"))
  asd <- assortativity_degree(g)
  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "4.txt"))
  as <- assortativity(g, degree(g, mode = "out"), degree(g, mode = "in"))
  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "5.txt"))
  as2 <- assR(g)

  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "6.txt"))
  expect_that(asd, equals(as))
  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "7.txt"))
  expect_that(asd, equals(as2))

  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "8.txt"))
  asu <- assortativity_degree(simplify(as.undirected(g, mode = "collapse")))
  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "9.txt"))
  expect_that(asu, equals(-0.16319921031570466807))

  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "10.txt"))
  p <- read_graph(f <- gzfile("power.gml.gz"), format = "gml")
  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "11.txt"))
  p.asd <- assortativity_degree(p)
  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "12.txt"))
  p.as <- assortativity(p, degree(p))
  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "13.txt"))
  p.as2 <- assR(as.directed(p, mode = "mutual"))

  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "14.txt"))
  expect_that(p.asd, equals(p.as))
  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "15.txt"))
  expect_that(p.asd, equals(p.as2))
})

test_that("nominal assortativity works", {
  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "101.txt"))
  o <- read_graph(f <- gzfile("football.gml.gz"), format = "gml")
  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "102.txt"))
  o <- simplify(o)
  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "103.txt"))
  an <- assortativity_nominal(o, V(o)$value + 1)

  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "104.txt"))
  el <- as_edgelist(o, names = FALSE)
  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "105.txt"))
  etm <- matrix(0, nrow = max(V(o)$value) + 1, ncol = max(V(o)$value) + 1)
  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "106.txt"))
  for (e in 1:nrow(el)) {
    t1 <- V(o)$value[el[e, 1]] + 1
    t2 <- V(o)$value[el[e, 2]] + 1
    etm[t1, t2] <- etm[t1, t2] + 1
    etm[t2, t1] <- etm[t2, t1] + 1
  }
  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "107.txt"))
  etm <- etm / sum(etm)
  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "108.txt"))
  an2 <- (sum(diag(etm)) - sum(etm %*% etm)) / (1 - sum(etm %*% etm))

  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "109.txt"))
  expect_that(an, equals(an2))
})
