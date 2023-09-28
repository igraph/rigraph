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
})
