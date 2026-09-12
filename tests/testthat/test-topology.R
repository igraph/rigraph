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
  expect_length(subs, 24)
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
  igraph_local_seed(42)
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
  igraph_local_seed(42, rng_version = "3.5.0")
  N <- 100

  for (i in 1:N) {
    target <- sample_gnp(20, 0.5)
    pn <- sample(4:18, 1)
    pattern <- induced_subgraph(target, sample(vcount(target), pn))
    iso <- subgraph_isomorphic(pattern, target, induced = TRUE, method = "lad")
    expect_true(iso)
  }

  igraph_local_seed(42)

  for (i in 1:N) {
    target <- sample_gnp(20, 1 / 20)
    pn <- sample(5:18, 1)
    pattern <- sample_gnp(pn, 0.6)
    iso <- subgraph_isomorphic(pattern, target, induced = TRUE, method = "lad")
    expect_false(iso)
  }
})

test_that("graph.subisomorphic.vf2 works", {
  igraph_local_seed(42)

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

test_that("graph.get.isomorphisms.vf2 respects return.vs.es option", {
  g <- make_tree(6, children = 2)
  V(g)$name <- paste0("V", 1:6)

  # Test with return.vs.es = TRUE (default)
  local_igraph_options(return.vs.es = TRUE)
  result <- graph.get.isomorphisms.vf2(g, g)
  expect_s3_class(result[[1]], "igraph.vs")
  expect_length(result[[1]], 6)

  # Test with return.vs.es = FALSE
  local_igraph_options(return.vs.es = FALSE)
  result <- graph.get.isomorphisms.vf2(g, g)
  expect_type(result[[1]], "double")
  expect_length(result[[1]], 6)
})

test_that("graph.get.subisomorphisms.vf2 respects return.vs.es option", {
  g <- make_tree(6, children = 2)

  # Test with return.vs.es = TRUE (default)
  local_igraph_options(return.vs.es = TRUE)
  result <- graph.get.subisomorphisms.vf2(g, g)
  expect_s3_class(result[[1]], "igraph.vs")
  expect_length(result[[1]], 6)

  # Test with return.vs.es = FALSE
  local_igraph_options(return.vs.es = FALSE)
  result <- graph.get.subisomorphisms.vf2(g, g)
  expect_type(result[[1]], "double")
  expect_length(result[[1]], 6)
})

test_that("graph.subisomorphic.lad respects return.vs.es option", {
  g <- make_tree(6, children = 2)

  # Test with return.vs.es = TRUE (default)
  local_igraph_options(return.vs.es = TRUE)
  result <- graph.subisomorphic.lad(g, g, all.maps = TRUE)
  expect_s3_class(result$maps[[1]], "igraph.vs")
  expect_length(result$maps[[1]], 6)

  # Test with return.vs.es = FALSE
  local_igraph_options(return.vs.es = FALSE)
  result <- graph.subisomorphic.lad(g, g, all.maps = TRUE)
  expect_type(result$maps[[1]], "double")
  expect_length(result$maps[[1]], 6)
})

test_that("transitive_closure works for directed graphs", {
  # Simple directed path
  g <- make_graph(c(1, 2, 2, 3, 3, 4))
  tc <- transitive_closure(g)

  # Should have edges for all reachable pairs
  expect_equal(vcount(tc), 4)
  expect_equal(ecount(tc), 6) # 1->2, 1->3, 1->4, 2->3, 2->4, 3->4
  expect_true(are_adjacent(tc, 1, 2))
  expect_true(are_adjacent(tc, 1, 3))
  expect_true(are_adjacent(tc, 1, 4))
  expect_true(are_adjacent(tc, 2, 3))
  expect_true(are_adjacent(tc, 2, 4))
  expect_true(are_adjacent(tc, 3, 4))

  # Check that reverse edges don't exist
  expect_false(are_adjacent(tc, 2, 1))
  expect_false(are_adjacent(tc, 3, 1))
})

test_that("transitive_closure works for undirected graphs", {
  # Two disconnected components with 2 vertices each
  g <- make_graph(c(1, 2, 3, 4), directed = FALSE)
  tc <- transitive_closure(g)

  # Each 2-vertex component already forms a complete graph,
  # so transitive closure doesn't add new edges
  expect_equal(vcount(tc), 4)
  expect_equal(ecount(tc), 2) # Same as input: one edge per 2-vertex component
  expect_true(are_adjacent(tc, 1, 2))
  expect_true(are_adjacent(tc, 3, 4))
  expect_false(are_adjacent(tc, 1, 3))
  expect_false(are_adjacent(tc, 1, 4))

  # Test with a path that needs closure
  g2 <- make_graph(c(1, 2, 2, 3), directed = FALSE)
  tc2 <- transitive_closure(g2)

  # Should create a complete graph (triangle)
  expect_equal(vcount(tc2), 3)
  expect_equal(ecount(tc2), 3) # Complete graph on 3 vertices
  expect_true(are_adjacent(tc2, 1, 2))
  expect_true(are_adjacent(tc2, 2, 3))
  expect_true(are_adjacent(tc2, 1, 3)) # This edge is added by closure
})

test_that("transitive_closure handles graphs with cycles", {
  # Directed cycle
  g <- make_graph(c(1, 2, 2, 3, 3, 1))
  tc <- transitive_closure(g)

  # Should be fully connected
  expect_equal(vcount(tc), 3)
  expect_equal(ecount(tc), 6) # Complete directed graph on 3 vertices
})

test_that("transitive_closure preserves isolated vertices", {
  # Graph with isolated vertex
  g <- make_graph(c(1, 2, 2, 3), n = 5)
  tc <- transitive_closure(g)

  # Isolated vertices should remain
  expect_equal(vcount(tc), 5)
  expect_equal(degree(tc, 4, mode = "all"), 0)
  expect_equal(degree(tc, 5, mode = "all"), 0)
})

# Tests for isomorphism callback functions
test_that("isomorphisms works with callback", {
  igraph_local_seed(123)

  # Create two isomorphic graphs
  g1 <- make_ring(8)
  g2 <- permute(g1, sample(vcount(g1)))

  # Count isomorphisms using callback
  count <- 0

  isomorphisms(g1, g2, method = "vf2", callback = function(map12, map21) {
    count <<- count + 1
    if (count >= 10) {
      return(FALSE)
    }
    TRUE
  })

  expect_true(count > 0)
  expect_true(count <= 10)
})

test_that("isomorphisms can stop early", {
  igraph_local_seed(42)
  # Create two isomorphic graphs
  g1 <- make_ring(6)
  g2 <- permute(g1, sample(vcount(g1)))

  # Stop after finding 3 isomorphisms
  count <- 0

  isomorphisms(g1, g2, method = "vf2", callback = function(map12, map21) {
    count <<- count + 1
    if (count >= 3) {
      TRUE # stop after 3 isomorphisms
    } else {
      FALSE # continue
    }
  })

  expect_equal(count, 3)
})

test_that("isomorphisms receives correct arguments", {
  igraph_local_seed(42)
  g1 <- make_ring(5)
  g2 <- permute(g1, sample(vcount(g1)))

  # Extract graph information before callback (cannot call igraph functions from callback)
  n1 <- vcount(g1)
  n2 <- vcount(g2)

  # Check argument types
  isomorphisms(g1, g2, method = "vf2", callback = function(map12, map21) {
    expect_type(map12, "integer")
    expect_type(map21, "integer")
    expect_length(map12, n1)
    expect_length(map21, n2)
    FALSE # stop after first isomorphism
  })
})

test_that("isomorphisms handles errors in callback", {
  g1 <- make_ring(5)
  g2 <- make_ring(5)

  # Callback that throws an error
  expect_error(
    isomorphisms(g1, g2, method = "vf2", callback = function(map12, map21) {
      stop("Intentional error in callback")
    }),
    "Error in R callback function"
  )
})

test_that("subisomorphisms works with callback works", {
  igraph_local_seed(123)

  # Find triangles in a larger graph
  g1 <- make_ring(3) # triangle
  g2 <- sample_gnp(15, 0.3)

  # Count subisomorphisms using callback
  count <- 0

  subgraph_isomorphisms(
    g1,
    g2,
    method = "vf2",
    callback = function(map12, map21) {
      count <<- count + 1
      if (count >= 5) {
        return(FALSE)
      } # stop after 5
      TRUE # continue search
    }
  )

  # May or may not find triangles, depending on the random graph
  expect_true(count >= 0)
  expect_true(count <= 5)
})

test_that("subisomorphisms works with callback can stop early", {
  # Find triangles in a complete graph
  g1 <- make_full_graph(6)
  g2 <- make_ring(3) # triangle

  # Stop after finding 3 subisomorphisms
  count <- 0

  subgraph_isomorphisms(
    g1,
    g2,
    method = "vf2",
    callback = function(map12, map21) {
      count <<- count + 1
      if (count >= 3) {
        TRUE # stop after 3 subisomorphisms
      } else {
        FALSE # continue
      }
    }
  )

  expect_equal(count, 3)
})

test_that("subisomorphisms works with callback receives correct arguments", {
  g1 <- make_full_graph(5)
  g2 <- make_ring(3)

  # Extract graph information before callback (cannot call igraph functions from callback)
  n1 <- vcount(g1)
  n2 <- vcount(g2)

  # Check argument types
  subgraph_isomorphisms(
    g1,
    g2,
    method = "vf2",
    callback = function(map12, map21) {
      expect_type(map12, "integer")
      expect_type(map21, "integer")
      expect_length(map12, n1)
      expect_length(map21, n2)
      FALSE # stop after first subisomorphism
    }
  )
})

test_that("subisomorphisms works with callback handles errors in callback", {
  skip(
    "FIXME: Errors in callback are silently gobbled, check with v1.0 and report upstream"
  )
  g1 <- make_ring(3)
  g2 <- make_full_graph(5)

  # Callback that throws an error
  expect_error(
    subgraph_isomorphisms(
      g1,
      g2,
      method = "vf2",
      callback = function(map12, map21) {
        stop("Intentional error in callback")
      }
    ),
    "Error in R callback function"
  )
})

# ---- ellipsis migration: argument coverage ----------------------------

test_that("graph.subisomorphic.lad() tail arguments and legacy positional recovery", {
  path <- make_ring(3, circular = FALSE)
  ring <- make_ring(4)
  # Restrict the middle path vertex to ring vertex 2.
  domains <- list(c(1, 3), 2, c(1, 3))

  res <- graph.subisomorphic.lad(
    path,
    ring,
    domains = domains,
    induced = TRUE,
    map = FALSE,
    all.maps = TRUE,
    time.limit = 60
  )
  expect_true(res$iso)
  # Both maps must route the middle path vertex through ring vertex 2.
  expect_length(res$maps, 2)
  expect_true(
    all(vapply(res$maps, function(m) as.vector(m)[[2]], numeric(1)) == 2)
  )

  lifecycle::expect_deprecated(
    res2 <- graph.subisomorphic.lad(path, ring, domains)
  )
  expect_identical(res2, graph.subisomorphic.lad(path, ring, domains = domains))
})

test_that("graph.isomorphic.bliss() tail arguments and legacy positional recovery", {
  ring <- make_ring(4)

  # The block coloring and the alternating coloring of a 4-ring are not
  # isomorphic as colored graphs.
  res <- graph.isomorphic.bliss(
    ring,
    ring,
    colors1 = c(1, 1, 2, 2),
    colors2 = c(1, 2, 1, 2),
    sh = "fl"
  )
  expect_false(res$iso)

  # With identical colorings the graphs remain isomorphic.
  res_same <- graph.isomorphic.bliss(
    ring,
    ring,
    colors1 = c(1, 2, 1, 2),
    colors2 = c(1, 2, 1, 2),
    sh = "fl"
  )
  expect_true(res_same$iso)

  lifecycle::expect_deprecated(
    res2 <- graph.isomorphic.bliss(ring, ring, c(1, 1, 2, 2), c(1, 2, 1, 2))
  )
  expect_identical(
    res2,
    graph.isomorphic.bliss(
      ring,
      ring,
      colors1 = c(1, 1, 2, 2),
      colors2 = c(1, 2, 1, 2)
    )
  )
})

test_that("graph.isomorphic.vf2() tail arguments and legacy positional recovery", {
  tri <- make_ring(3)

  res <- graph.isomorphic.vf2(
    tri,
    tri,
    vertex.color1 = c(1, 2, 3),
    vertex.color2 = c(1, 2, 3),
    edge.color1 = c(1, 1, 2),
    edge.color2 = c(1, 1, 2)
  )
  expect_true(res$iso)
  expect_equal(res$map12, 1:3)

  # Different vertex color multiplicities break the colored isomorphism.
  res_no <- graph.isomorphic.vf2(
    tri,
    tri,
    vertex.color1 = c(1, 1, 2),
    vertex.color2 = c(1, 2, 2)
  )
  expect_false(res_no$iso)

  lifecycle::expect_deprecated(
    res2 <- graph.isomorphic.vf2(tri, tri, c(1, 2, 3), c(1, 2, 3))
  )
  expect_identical(
    res2,
    graph.isomorphic.vf2(
      tri,
      tri,
      vertex.color1 = c(1, 2, 3),
      vertex.color2 = c(1, 2, 3)
    )
  )
})

test_that("graph.subisomorphic.vf2() tail arguments and legacy positional recovery", {
  full <- make_full_graph(4)
  tri <- make_ring(3)

  res <- graph.subisomorphic.vf2(
    full,
    tri,
    vertex.color1 = c(1, 1, 1, 2),
    vertex.color2 = c(1, 1, 1),
    edge.color1 = rep(1, 6),
    edge.color2 = rep(1, 3)
  )
  expect_true(res$iso)
  # The triangle can only map onto the three like-colored vertices.
  expect_true(all(res$map21 <= 3))

  lifecycle::expect_deprecated(
    res2 <- graph.subisomorphic.vf2(full, tri, c(1, 1, 1, 2), c(1, 1, 1))
  )
  expect_identical(
    res2,
    graph.subisomorphic.vf2(
      full,
      tri,
      vertex.color1 = c(1, 1, 1, 2),
      vertex.color2 = c(1, 1, 1)
    )
  )
})

test_that("graph.count.isomorphisms.vf2() tail arguments and legacy positional recovery", {
  tri <- make_ring(3)

  # Mutually distinct vertex colors leave only the identity mapping.
  res <- graph.count.isomorphisms.vf2(
    tri,
    tri,
    vertex.color1 = c(1, 2, 3),
    vertex.color2 = c(1, 2, 3),
    edge.color1 = c(2, 2, 2),
    edge.color2 = c(2, 2, 2)
  )
  expect_equal(res, 1)

  lifecycle::expect_deprecated(
    res2 <- graph.count.isomorphisms.vf2(tri, tri, c(1, 2, 3), c(1, 2, 3))
  )
  expect_identical(
    res2,
    graph.count.isomorphisms.vf2(
      tri,
      tri,
      vertex.color1 = c(1, 2, 3),
      vertex.color2 = c(1, 2, 3)
    )
  )
})

test_that("graph.count.subisomorphisms.vf2() tail arguments and legacy positional recovery", {
  full <- make_full_graph(4)
  tri <- make_ring(3)

  # Uncolored, the triangle maps into the full graph in 24 ways.
  # Coloring one vertex differently leaves the 6 mappings within the
  # like-colored triangle.
  res <- graph.count.subisomorphisms.vf2(
    full,
    tri,
    vertex.color1 = c(1, 1, 1, 2),
    vertex.color2 = c(1, 1, 1),
    edge.color1 = rep(1, 6),
    edge.color2 = rep(1, 3)
  )
  expect_equal(res, 6)
  expect_equal(graph.count.subisomorphisms.vf2(full, tri), 24)

  lifecycle::expect_deprecated(
    res2 <- graph.count.subisomorphisms.vf2(
      full,
      tri,
      c(1, 1, 1, 2),
      c(1, 1, 1)
    )
  )
  expect_identical(
    res2,
    graph.count.subisomorphisms.vf2(
      full,
      tri,
      vertex.color1 = c(1, 1, 1, 2),
      vertex.color2 = c(1, 1, 1)
    )
  )
})

test_that("graph_from_isomorphism_class() tail arguments and legacy positional recovery", {
  # Undirected isomorphism class 3 on 3 vertices is the triangle.
  g <- graph_from_isomorphism_class(3, 3, directed = FALSE)
  expect_false(is_directed(g))
  expect_equal(vcount(g), 3)
  expect_equal(ecount(g), 3)
  expect_equal(isomorphism_class(g), 3)

  lifecycle::expect_deprecated(
    res <- graph_from_isomorphism_class(3, 3, FALSE)
  )
  expect_identical_graphs(
    res,
    graph_from_isomorphism_class(3, 3, directed = FALSE)
  )
})

test_that("canonical_permutation() tail arguments and legacy positional recovery", {
  ring <- make_ring(4)

  # Alternating colors cut the automorphism group of the 4-ring from 8 to 4.
  res <- canonical_permutation(ring, colors = c(1, 2, 1, 2), sh = "fs")
  expect_setequal(res$labeling, 1:4)
  expect_equal(res$info$group_size, "4")

  lifecycle::expect_deprecated(
    res2 <- canonical_permutation(ring, NULL, "fs")
  )
  expect_identical(res2, canonical_permutation(ring, NULL, sh = "fs"))
})

test_that("count_automorphisms() tail arguments and legacy positional recovery", {
  ring <- make_ring(10)

  # The 10-ring has 20 automorphisms whatever the splitting heuristics.
  res <- count_automorphisms(ring, colors = NULL, sh = "fl")
  expect_equal(res$group_size, "20")

  lifecycle::expect_deprecated(
    res2 <- count_automorphisms(ring, NULL, "fl")
  )
  expect_identical(res2, count_automorphisms(ring, NULL, sh = "fl"))
})

test_that("automorphism_group() tail arguments and legacy positional recovery", {
  ring <- make_ring(10)

  res <- automorphism_group(ring, colors = NULL, sh = "fl", details = TRUE)
  expect_named(res, c("generators", "info"))
  expect_equal(res$info$group_size, "20")
  # Each generator is a permutation of the vertices.
  for (gen in res$generators) {
    expect_setequal(as.vector(gen), 1:10)
  }

  lifecycle::expect_deprecated(
    res2 <- automorphism_group(ring, NULL, "fl")
  )
  ref <- automorphism_group(ring, NULL, sh = "fl")
  expect_identical(lapply(res2, as.vector), lapply(ref, as.vector))
})
