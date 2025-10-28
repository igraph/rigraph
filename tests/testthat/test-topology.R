test_that("automorphisms works", {
  ring <- make_ring(10)
  expect_equal(count_automorphisms(ring)$group_size, "20")

  full <- make_full_graph(4)
  expect_equal(count_automorphisms(full)$group_size, "24")
})


test_that("automorphisms works with colored graphs", {
  g <- make_full_graph(4)
  expect_equal(count_automorphisms(g, colors = c(1, 2, 1, 2))$group_size, "4")

  V(g)$color <- c(1, 2, 1, 2)
  expect_equal(count_automorphisms(g)$group_size, "4")
  expect_equal(count_automorphisms(g, colors = NULL)$group_size, "24")
})


test_that("automorphism_group works", {
  ring <- make_ring(10)
  aut_ring <- lapply(automorphism_group(ring), as.vector)
  aut_ring <- aut_ring[order(sapply(aut_ring, "[[", 1))]
  expect_equal(aut_ring, list(c(1, 10:2), c(2:10, 1)))

  full <- make_full_graph(4)
  aut_full <- lapply(automorphism_group(full), as.vector)
  aut_full <- aut_full[order(sapply(aut_full, "[[", 1))]
  expect_equal(aut_full, list(c(1, 2, 4, 3), c(1, 3, 2, 4), c(2, 1, 3, 4)))
})


test_that("automorphism_group works with colored graphs", {
  full <- make_full_graph(4)
  aut_full <- lapply(
    automorphism_group(full, colors = c(1, 2, 1, 2)),
    as.vector
  )
  aut_full <- aut_full[order(sapply(aut_full, "[[", 1))]
  expect_equal(aut_full, list(c(1, 4, 3, 2), c(3, 2, 1, 4)))

  V(full)$color <- c(1, 2, 1, 2)
  aut_full_col <- lapply(automorphism_group(full), as.vector)
  aut_full_col <- aut_full_col[order(sapply(aut_full_col, "[[", 1))]
  expect_equal(aut_full_col, list(c(1, 4, 3, 2), c(3, 2, 1, 4)))
})

test_that("isomorphisms() works", {
  motif <- make_empty_graph(directed = FALSE) +
    vertices("D1", "D2", type = c("type1", "type1")) +
    edges("D1", "D2", type = c("type2"))
  motif_iso <- isomorphisms(
    motif,
    motif,
    method = "vf2",
    vertex.color1 = 2:1,
    vertex.color2 = 1:2
  )
  expect_length(motif_iso, 1)
  expect_equal(as.numeric(motif_iso[[1]]), 2:1)
})

test_that("subgraph_isomorphisms works", {
  motif <- make_empty_graph(directed = FALSE) +
    vertices("D1", "D2", type = c("type1", "type1")) +
    edges("D1", "D2", type = c("type2"))
  out <- subgraph_isomorphisms(
    target = motif,
    pattern = motif,
    method = "vf2",
    vertex.color1 = 2:1,
    vertex.color2 = 1:2
  )
  expect_length(out, 1)
  expect_equal(as.numeric(out[[1]]), 2:1)
})

test_that("graph.get.subisomorphisms.vf2() works even if the graph has a vertex attribute named x", {
  g <- make_full_graph(4)
  V(g)$x <- 1:4
  subs <- graph.get.subisomorphisms.vf2(g, make_ring(4))
  expect_equal(length(subs), 24)
})

test_that("VF2 isomorphism considers colors", {
  full <- make_full_graph(3)
  path <- make_ring(3, circular = FALSE)
  V(full)$color <- c(1, 1, 2)
  V(path)$color <- c(1, 2, 1)
  n <- count_subgraph_isomorphisms(path, full, method = "vf2")
  expect_equal(n, 2)
})

test_that("canonical_permutation works", {
  g1 <- sample_gnm(10, 20)
  cp1 <- canonical_permutation(g1)
  cf1 <- permute(g1, cp1$labeling)

  ## Do the same with a random permutation of it
  g2 <- permute(g1, sample(vcount(g1)))
  cp2 <- canonical_permutation(g2)
  cf2 <- permute(g2, cp2$labeling)

  ## Check that they are the same
  el1 <- as_edgelist(cf1)
  el2 <- as_edgelist(cf2)
  el1 <- el1[order(el1[, 1], el1[, 2]), ]
  el2 <- el2[order(el2[, 1], el2[, 2]), ]

  expect_equal(el1, el2)
})

test_that("isomorphism_class works", {
  g_iso10 <- graph_from_isomorphism_class(3, 10)
  g_iso11 <- graph_from_isomorphism_class(3, 11)
  expect_equal(isomorphism_class(g_iso10), 10)
  expect_equal(isomorphism_class(g_iso11), 11)

  g_iso10_1 <- add_vertices(g_iso10, 3)
  expect_equal(graph.isoclass.subgraph(g_iso10_1, 1:3), 10)
  expect_equal(graph.isoclass.subgraph(g_iso10_1 %du% g_iso11, 1:3), 10)
  expect_equal(graph.isoclass.subgraph(g_iso10_1 %du% g_iso11, 7:9), 11)
})

test_that("graph.subisomorphic, method = 'lad' works", {
  pattern <- graph_from_literal(
    1:2:3:4:5,
    1 - 2:5, 2 - 1:5:3, 3 - 2:4, 4 - 3:5, 5 - 4:2:1
  )
  target <- graph_from_literal(
    1:2:3:4:5:6:7:8:9,
    1 - 2:5:7, 2 - 1:5:3, 3 - 2:4, 4 - 3:5:6:8:9,
    5 - 1:2:4:6:7, 6 - 7:5:4:9, 7 - 1:5:6,
    8 - 4:9, 9 - 6:4:8
  )
  domains <- list(
    `1` = c(1, 3, 9),
    `2` = c(5, 6, 7, 8),
    `3` = c(2, 4, 6, 7, 8, 9),
    `4` = c(1, 3, 9),
    `5` = c(2, 4, 8, 9)
  )
  sub_iso1 <- subgraph_isomorphic(pattern, target, method = "lad")
  sub_iso2 <- subgraph_isomorphic(
    pattern,
    target,
    induced = TRUE,
    method = "lad"
  )
  sub_iso3 <- subgraph_isomorphic(
    pattern,
    target,
    domains = domains,
    method = "lad"
  )

  expect_true(sub_iso1)
  expect_true(sub_iso2)
  expect_true(sub_iso3)
})

test_that("LAD stress test", {
  local_rng_version("3.5.0")
  withr::local_seed(42)
  N <- 100

  for (i in 1:N) {
    target <- sample_gnp(20, .5)
    pn <- sample(4:18, 1)
    pattern <- induced_subgraph(target, sample(vcount(target), pn))
    iso <- subgraph_isomorphic(pattern, target, induced = TRUE, method = "lad")
    expect_true(iso)
  }

  withr::local_seed(42)

  for (i in 1:N) {
    target <- sample_gnp(20, 1 / 20)
    pn <- sample(5:18, 1)
    pattern <- sample_gnp(pn, .6)
    iso <- subgraph_isomorphic(pattern, target, induced = TRUE, method = "lad")
    expect_false(iso)
  }
})

test_that("graph.subisomorphic.vf2 works", {
  withr::local_seed(42)

  gnp1 <- sample_gnp(20, 6 / 20)
  gnp2 <- sample_gnp(20, 6 / 20)
  g <- gnp1 %du% gnp2

  g1_iso <- graph.subisomorphic.vf2(g, gnp1)

  expect_true(g1_iso$iso)
  expect_equal(g1_iso$map12, c(1:vcount(gnp1), rep(0, vcount(gnp2))))
  expect_equal(g1_iso$map21, 1:vcount(gnp1))

  g2_iso <- graph.subisomorphic.vf2(g, gnp2)
  expect_true(g2_iso$iso)
  expect_equal(g2_iso$map12, c(rep(0, vcount(gnp1)), 1:vcount(gnp2)))
  expect_equal(g2_iso$map21, 1:vcount(gnp2) + vcount(gnp1))
})

test_that("isomorphic", {
  g1 <- graph_from_literal(A - B - C - A)
  expect_isomorphic(g1, g1)
  expect_isomorphic(g1, g1, method = "direct")
  expect_isomorphic(g1, g1, method = "vf2")
  expect_isomorphic(g1, g1, method = "bliss")

  g2 <- graph_from_literal(A - B - C)
  expect_not_isomorphic(g1, g2)
  expect_not_isomorphic(g1, g2, method = "direct")
  expect_not_isomorphic(g1, g2, method = "vf2")
  expect_not_isomorphic(g1, g2, method = "bliss")
})

test_that("subgraph_isomorphic", {
  g1 <- graph_from_literal(A - B - C - D - E - A)
  g2 <- graph_from_literal(A - B - C - D)

  expect_true(subgraph_isomorphic(g2, g1))
  expect_true(subgraph_isomorphic(g2, g1, method = "vf2"))
  expect_true(subgraph_isomorphic(g2, g1, method = "lad"))

  g3 <- graph_from_literal(A - B - C - A)
  expect_false(subgraph_isomorphic(g3, g1))
  expect_false(subgraph_isomorphic(g3, g1, method = "vf2"))
  expect_false(subgraph_isomorphic(g3, g1, method = "lad"))
})

test_that("count_isomorphisms", {
  g1 <- graph_from_literal(A - B - C - D - A)
  expect_equal(count_isomorphisms(g1, g1), 8)

  g2 <- graph_from_literal(A - B - C - A)
  expect_equal(count_isomorphisms(g1, g2), 0)
})

test_that("count_isomorphisms_with_colors", {
  expect_equal(
    count_isomorphisms(
      make_ring(3),
      make_ring(3),
      edge.color1 = c(2, 2, 2),
      edge.color2 = c(2, 2, 2),
      vertex.color1 = c(3, 3, 3),
      vertex.color2 = c(3, 3, 3),
      method = "vf2"
    ),
    6
  )

  expect_equal(
    count_isomorphisms(
      make_ring(3),
      make_ring(3),
      edge.color1 = c(2, 2, 2),
      edge.color2 = c(2, 2, 2),
      vertex.color1 = c(1, 2, 3),
      vertex.color2 = c(1, 2, 3),
      method = "vf2"
    ),
    1
  )

  expect_equal(
    count_isomorphisms(
      make_ring(3),
      make_ring(3),
      edge.color1 = c(2, 2, 3),
      edge.color2 = c(3, 2, 2),
      vertex.color1 = c(3, 3, 3),
      vertex.color2 = c(3, 3, 3),
      method = "vf2"
    ),
    2
  )
})

test_that("count_subgraph_isomorphisms", {
  g1 <- graph_from_literal(A - B - C - D - A)
  g2 <- graph_from_literal(A - B - C - D)

  expect_equal(count_subgraph_isomorphisms(g2, g1, method = "lad"), 8)
  expect_equal(count_subgraph_isomorphisms(g2, g1, method = "vf2"), 8)

  g3 <- graph_from_literal(A - B - C - A)
  expect_equal(count_subgraph_isomorphisms(g3, g1, method = "lad"), 0)
  expect_equal(count_subgraph_isomorphisms(g3, g1, method = "vf2"), 0)
})

test_that("isomorphisms", {
  g1 <- graph_from_literal(A - B - C - D - A)
  g2 <- graph_from_literal(W - X - Y - Z - W)

  res <- list(
    V(g2)[1, 2, 3, 4],
    V(g2)[1, 4, 3, 2],
    V(g2)[2, 1, 4, 3],
    V(g2)[2, 3, 4, 1],
    V(g2)[3, 2, 1, 4],
    V(g2)[3, 4, 1, 2],
    V(g2)[4, 1, 2, 3],
    V(g2)[4, 3, 2, 1]
  )

  expect_equal(ignore_attr = TRUE, isomorphisms(g1, g2), res)

  g3 <- graph_from_literal(X - Y - Z - X)
  expect_equal(isomorphisms(g1, g3), list())
})

test_that("subgraph_isomorphisms, lad", {
  g1 <- graph_from_literal(A - B - C - D - A)
  g2 <- graph_from_literal(Z - X - Y)

  res <- list(
    V(g1)[1, 4, 3],
    V(g1)[1, 2, 3],
    V(g1)[2, 1, 4],
    V(g1)[2, 3, 4],
    V(g1)[3, 2, 1],
    V(g1)[3, 4, 1],
    V(g1)[4, 3, 2],
    V(g1)[4, 1, 2]
  )

  expect_equal(
    ignore_attr = TRUE,
    subgraph_isomorphisms(g2, g1, method = "lad"),
    res
  )

  g3 <- graph_from_literal(X - Y - Z - X)
  expect_equal(subgraph_isomorphisms(g3, g1, method = "lad"), list())
})

test_that("subgraph_isomorphisms, vf2", {
  g1 <- graph_from_literal(A - B - C - D - A)
  g2 <- graph_from_literal(Z - X - Y)

  res <- list(
    V(g1)[1, 2, 3],
    V(g1)[1, 4, 3],
    V(g1)[2, 1, 4],
    V(g1)[2, 3, 4],
    V(g1)[3, 2, 1],
    V(g1)[3, 4, 1],
    V(g1)[4, 1, 2],
    V(g1)[4, 3, 2]
  )

  expect_equal(
    ignore_attr = TRUE,
    subgraph_isomorphisms(g2, g1, method = "vf2"),
    res
  )

  g3 <- graph_from_literal(X - Y - Z - X)
  expect_equal(subgraph_isomorphisms(g3, g1, method = "vf2"), list())
})
