test_that("assortativity works", {
  g <- read_graph(f <- gzfile("celegansneural.gml.gz"), format = "gml")

  reference_assortativity <- function(graph) {
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

  assortativity_igraph <- assortativity(
    g,
    values = degree(g, mode = "out"),
    values.in = degree(g, mode = "in")
  )

  expect_equal(assortativity_degree(g), assortativity_igraph)
  expect_equal(assortativity_degree(g), reference_assortativity(g))

  asu <- assortativity_degree(simplify(as_undirected(g, mode = "collapse")))
  expect_equal(asu, -0.16319921031570466807)

  p <- read_graph(f <- gzfile("power.gml.gz"), format = "gml")
  expect_equal(assortativity_degree(p), assortativity(p, degree(p)))
  expect_equal(assortativity_degree(p), reference_assortativity(as_directed(p, mode = "mutual")))
})

test_that("nominal assortativity works", {
  o <- read_graph(f <- gzfile("football.gml.gz"), format = "gml")
  o <- simplify(o)
  nominal_assortativity <- assortativity_nominal(o, V(o)$value + 1)

  el <- as_edgelist(o, names = FALSE)
  etm <- matrix(0, nrow = max(V(o)$value) + 1, ncol = max(V(o)$value) + 1)
  for (e in seq_len(nrow(el))) {
    t1 <- V(o)$value[el[e, 1]] + 1
    t2 <- V(o)$value[el[e, 2]] + 1
    etm[t1, t2] <- etm[t1, t2] + 1
    etm[t2, t1] <- etm[t2, t1] + 1
  }
  etm <- etm / sum(etm)
  reference_nominal_assortativity <- (sum(diag(etm)) - sum(etm %*% etm)) / (1 - sum(etm %*% etm))

  expect_equal(nominal_assortativity, reference_nominal_assortativity)
})
