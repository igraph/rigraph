test_that("dfs() uses 1-based root vertex index", {
  g <- make_ring(3)
  expect_equal(dfs(g, root = 1)$root, 1)
})

test_that("dfs() does not pad order", {
  g <- make_star(3)
  expect_equal(as.numeric(dfs(g, root = 2, unreachable = FALSE)$order), c(2, 1))

  local_igraph_options(return.vs.es = FALSE)
  expect_equal(as.numeric(dfs(g, root = 2, unreachable = FALSE)$order), c(2, 1))
  expect_equal(
    as.numeric(
      dfs(g, root = 2, unreachable = FALSE, order.out = TRUE)$order.out
    ),
    c(1, 2)
  )
})

test_that("dfs() deprecated arguments", {
  g <- make_star(3)

  expect_snapshot(error = TRUE, {
    d <- dfs(
      g,
      root = 2,
      unreachable = FALSE,
      neimode = "out",
      father = TRUE
    )
  })
})

test_that("degree() works", {
  gnp1 <- sample_gnp(100, 1 / 100)
  gnp1_deg <- degree(gnp1)
  el <- as_edgelist(gnp1)
  expect_equal(as.numeric(table(el)), gnp1_deg[gnp1_deg != 0])

  expect_equal(gnp1_deg / (vcount(gnp1) - 1), degree(gnp1, normalized = TRUE))

  gnp2 <- sample_gnp(100, 2 / 100, directed = TRUE)
  gnp2_deg_in <- degree(gnp2, mode = "in")
  el2 <- as_edgelist(gnp2)
  expect_equal(as.numeric(table(el2[, 2])), gnp2_deg_in[gnp2_deg_in != 0])

  gnp2_deg_out <- degree(gnp2, mode = "out")
  expect_equal(as.numeric(table(el2[, 1])), gnp2_deg_out[gnp2_deg_out != 0])

  expect_equal(
    gnp2_deg_in / (vcount(gnp2) - 1),
    degree(gnp2, mode = "in", normalized = TRUE)
  )
  expect_equal(
    gnp2_deg_out / (vcount(gnp2) - 1),
    degree(gnp2, mode = "out", normalized = TRUE)
  )
  expect_equal(
    degree(gnp2, mode = "all") / (vcount(gnp2) - 1),
    degree(gnp2, mode = "all", normalized = TRUE)
  )
})

test_that("max_degree() works", {
  g <- make_graph(c(1, 2, 2, 2, 2, 3), directed = TRUE)
  expect_equal(max_degree(g), 4)
  expect_equal(max_degree(g, mode = "out"), 2)
  expect_equal(max_degree(g, loops = FALSE), 2)
  expect_equal(max_degree(g, mode = "out", loops = FALSE), 1)
  expect_equal(max_degree(g, mode = "in", loops = FALSE), 1)
  expect_equal(max_degree(g, v = c()), 0)
  expect_equal(max_degree(make_empty_graph()), 0)
})

test_that("BFS uses 1-based root vertex index", {
  g <- make_ring(3)
  expect_equal(bfs(g, root = 1)$root, 1)
})

test_that("BFS works from multiple root vertices", {
  g <- make_ring(10) %du% make_ring(10)

  expect_equal(
    as.vector(bfs(g, 1)$order),
    c(1, 2, 10, 3, 9, 4, 8, 5, 7, 6, 11, 12, 20, 13, 19, 14, 18, 15, 17, 16)
  )

  expect_equal(
    as.vector(bfs(g, 1, unreachable = FALSE)$order),
    c(1, 2, 10, 3, 9, 4, 8, 5, 7, 6)
  )

  expect_equal(
    as.vector(bfs(g, c(1, 12), unreachable = FALSE)$order),
    c(1, 2, 10, 3, 9, 4, 8, 5, 7, 6, 12, 11, 13, 20, 14, 19, 15, 18, 16, 17)
  )

  expect_equal(
    as.vector(bfs(g, c(12, 1, 15), unreachable = FALSE)$order),
    c(12, 11, 13, 20, 14, 19, 15, 18, 16, 17, 1, 2, 10, 3, 9, 4, 8, 5, 7, 6)
  )
})

test_that("BFS the restricted set is one indexed", {
  # https://github.com/igraph/rigraph/issues/133
  g <- graph_from_edgelist(matrix(c(1, 2, 2, 3), ncol = 2, byrow = TRUE))

  expect_equal(
    as.numeric(bfs(g, 1, restricted = c(1, 2), unreachable = FALSE)$order),
    c(1, 2)
  )
})

test_that("BFS callback works", {
  env <- new.env()
  env$history <- list()

  callback <- function(graph, data, extra) {
    env$history <- append(env$history, list(data))
    FALSE
  }

  g <- make_ring(5, directed = TRUE)
  bfs(g, root = 3, mode = "out", callback = callback)

  names <- c("vid", "pred", "succ", "rank", "dist")
  expect_equal(
    env$history,
    list(
      setNames(c(3, 0, 4, 1, 0), names),
      setNames(c(4, 3, 5, 2, 1), names),
      setNames(c(5, 4, 1, 3, 2), names),
      setNames(c(1, 5, 2, 4, 3), names),
      setNames(c(2, 1, 0, 5, 4), names)
    )
  )
})

test_that("BFS callback does not blow up when an invalid value is returned", {
  env <- new.env()
  env$history <- list()

  callback <- function(graph, data, extra) {
    env$history <- append(env$history, list(data))
    data
  }

  g <- make_ring(5, directed = TRUE)
  bfs(g, root = 3, mode = "out", callback = callback)

  # returned value is coerced to TRUE so it should terminate the search after
  # one step

  names <- c("vid", "pred", "succ", "rank", "dist")
  expect_equal(
    env$history,
    list(setNames(c(3, 0, 4, 1, 0), names))
  )
})

test_that("BFS callback does not blow up when an error is raised within the callback", {
  callback <- function(graph, data, extra) {
    cli::cli_abort("test")
    FALSE
  }

  g <- make_ring(5, directed = TRUE)
  expect_error(bfs(g, root = 3, mode = "out", callback = callback), "test")

  expect_true(TRUE)
})

test_that("BFS callback does not blow up when another igraph function is raised within the callback", {
  skip("nested igraph call handling not implemented yet")

  callback <- function(graph, data, extra) {
    neighbors(graph, 1)
    FALSE
  }

  g <- make_ring(5, directed = TRUE)
  bfs(g, root = 3, mode = "out", callback = callback)

  expect_true(TRUE)
})

test_that("bfs() works", {
  local_igraph_options(print.id = FALSE)

  expect_snapshot({
    g <- graph_from_literal(a -+ b -+ c, z -+ a, d)
    bfs(
      g,
      root = 2,
      mode = "out",
      unreachable = FALSE,
      order = TRUE,
      rank = TRUE,
      parent = TRUE,
      pred = TRUE,
      succ = TRUE,
      dist = TRUE
    )
  })
})

test_that("bfs() deprecated arguments", {
  g <- graph_from_literal(a -+ b -+ c, z -+ a, d)

  expect_snapshot(error = TRUE, {
    b <- bfs(
      g,
      root = 2,
      neimode = "out",
      unreachable = FALSE,
      order = TRUE,
      rank = TRUE,
      father = TRUE,
      pred = TRUE,
      succ = TRUE,
      dist = TRUE
    )
  })
})

test_that("bfs() does not pad order", {
  g <- make_star(3)
  expect_equal(as.numeric(bfs(g, root = 2, unreachable = FALSE)$order), c(2, 1))

  local_igraph_options(return.vs.es = FALSE)
  expect_equal(as.numeric(bfs(g, root = 2, unreachable = FALSE)$order), c(2, 1))
})

test_that("diameter() works -- undirected", {
  g <- largest_component(sample_gnp(30, 3 / 30))
  sp <- distances(g)
  expect_equal(max(sp), diameter(g))

  g <- largest_component(sample_gnp(100, 1 / 100))
  sp <- distances(g)
  sp[sp == Inf] <- NA
  expect_equal(max(sp, na.rm = TRUE), diameter(g))
})

test_that("diameter() works -- directed", {
  g <- sample_gnp(30, 3 / 30, directed = TRUE)
  sp <- distances(g, mode = "out")
  sp[sp == Inf] <- NA
  expect_equal(max(sp, na.rm = TRUE), diameter(g, unconnected = TRUE))
})

test_that("diameter() works -- weighted", {
  g <- sample_gnp(30, 3 / 30, directed = TRUE)
  E(g)$weight <- sample(1:10, ecount(g), replace = TRUE)
  sp <- distances(g, mode = "out")
  sp[sp == Inf] <- NA
  expect_equal(max(sp, na.rm = TRUE), diameter(g, unconnected = TRUE))
})

test_that("diameter() works -- Bug #680538", {
  g <- make_tree(30, mode = "undirected")
  E(g)$weight <- 2
  expect_equal(diameter(g, unconnected = FALSE), 16)
})

test_that("diameter() correctly handles disconnected graphs", {
  g <- make_tree(7, 2, mode = "undirected") %du%
    make_tree(4, 3, mode = "undirected")
  expect_equal(diameter(g, unconnected = TRUE), 4)
  expect_equal(diameter(g, unconnected = FALSE), Inf)
  E(g)$weight <- 2
  expect_equal(diameter(g, unconnected = FALSE), Inf)
})

test_that("get_diameter() works", {
  g <- make_ring(10)
  E(g)$weight <- sample(seq_len(ecount(g)))
  d <- diameter(g)
  gd <- get_diameter(g)
  sp <- distances(g)

  expect_equal(d, max(sp))
  expect_equal(sp[gd[1], gd[length(gd)]], d)

  d <- diameter(g, weights = NA)
  gd <- get_diameter(g, weights = NA)
  sp <- distances(g, weights = NA)

  expect_equal(d, max(sp))
  length(gd) == d + 1
  expect_equal(sp[gd[1], gd[length(gd)]], d)
})

test_that("farthest_vertices() works", {
  kite <- graph_from_literal(
    Andre - Beverly:Carol:Diane:Fernando,
    Beverly - Andre:Diane:Ed:Garth,
    Carol - Andre:Diane:Fernando,
    Diane - Andre:Beverly:Carol:Ed:Fernando:Garth,
    Ed - Beverly:Diane:Garth,
    Fernando - Andre:Carol:Diane:Garth:Heather,
    Garth - Beverly:Diane:Ed:Fernando:Heather,
    Heather - Fernando:Garth:Ike,
    Ike - Heather:Jane,
    Jane - Ike
  )

  fn <- farthest_vertices(kite)
  fn$vertices <- as.vector(fn$vertices)
  expect_equal(fn, list(vertices = c(1, 10), distance = 4))

  expect_equal(
    distances(kite, v = fn$vertices[1], to = fn$vertices[2])[1],
    fn$distance
  )
  expect_equal(diameter(kite), fn$distance)
})

test_that("distances() works", {
  g <- make_graph(
    c(1, 5, 1, 7, 1, 8, 1, 10, 2, 6, 2, 7, 2, 8, 2, 10, 3, 4, 3, 5, 3, 9, 5, 6, 5, 7, 5, 10, 6, 8, 7, 8, 7, 9, 8, 9, 8, 10, 9, 10),
    directed = FALSE
  )

  mu <- distances(g, algorithm = "unweighted")

  # unit weights
  E(g)$weight <- rep(1, ecount(g))

  ma <- distances(g) # automatic
  md <- distances(g, algorithm = "dijkstra")
  mbf <- distances(g, algorithm = "bellman-ford")
  mj <- distances(g, algorithm = "johnson")
  mfw <- distances(g, algorithm = "floyd-warshall")

  expect_equal(mu, ma)
  expect_equal(mu, md)
  expect_equal(mu, mbf)
  expect_equal(mu, mj)
  expect_equal(mu, mfw)

  E(g)$weight <- 0.25 * (1:ecount(g))

  ma <- distances(g) # automatic
  md <- distances(g, algorithm = "dijkstra")
  mbf <- distances(g, algorithm = "bellman-ford")
  mj <- distances(g, algorithm = "johnson")
  mfw <- distances(g, algorithm = "floyd-warshall")

  expect_equal(ma, md)
  expect_equal(ma, mbf)
  expect_equal(ma, mj)
  expect_equal(ma, mfw)
})


test_that("all_shortest_paths() works", {
  edges <- matrix(
    c(
      "s", "a", 2, "s", "b", 4, "a", "t", 4, "b",
      "t", 2, "a", "1", 1, "a", "2", 1, "a", "3",
      2, "1", "b", 1, "2", "b", 2, "3", "b", 1
    ),
    byrow = TRUE,
    ncol = 3,
    dimnames = list(NULL, c("from", "to", "weight"))
  )
  edges <- as.data.frame(edges)
  edges[[3]] <- as.numeric(as.character(edges[[3]]))

  g <- graph_from_data_frame(as.data.frame(edges))

  sortlist <- function(list) {
    list <- lapply(list, sort)
    list <- lapply(list, as.vector)
    list[order(sapply(list, paste, collapse = "!"))]
  }

  sp1 <- all_shortest_paths(g, "s", "t", weights = NA)

  expect_equal(
    sortlist(sp1$vpaths),
    list(c(1, 2, 7), c(1, 3, 7))
  )
  expect_equal(
    sp1$nrgeo,
    c(1, 1, 1, 1, 1, 1, 2)
  )

  sp2 <- all_shortest_paths(g, "s", "t")

  expect_equal(
    sortlist(sp2$vpaths),
    list(c(1, 2, 3, 4, 7), c(1, 2, 7), c(1, 3, 7))
  )
  expect_equal(sp2$nrgeo, c(1, 1, 2, 1, 1, 1, 3))
})

test_that("shortest_paths() works", {
  edges <- matrix(
    c(
      "s", "a", 2, "s", "b", 4, "a", "t", 4,
      "b", "t", 2, "a", "1", 1, "a", "2", 1,
      "a", "3", 2, "1", "b", 1, "2", "b", 2,
      "3", "b", 1
    ),
    byrow = TRUE,
    ncol = 3,
    dimnames = list(NULL, c("from", "to", "weight"))
  )
  edges <- as.data.frame(edges)
  edges[[3]] <- as.numeric(as.character(edges[[3]]))

  g <- graph_from_data_frame(as.data.frame(edges))

  all1 <- all_shortest_paths(g, "s", "t", weights = NA)$vpaths

  s1 <- shortest_paths(g, "s", "t", weights = NA)

  expect_true(s1$vpath %in% all1)
})

test_that("shortest_paths() can handle negative weights", {
  g <- make_tree(7)
  E(g)$weight <- -1
  sps <- shortest_paths(g, 2)$vpath

  expect_true(length(sps) == 7)
  expect_equal(ignore_attr = TRUE, as.vector(sps[[1]]), integer(0))
  expect_equal(ignore_attr = TRUE, as.vector(sps[[2]]), c(2))
  expect_equal(ignore_attr = TRUE, as.vector(sps[[3]]), integer(0))
  expect_equal(ignore_attr = TRUE, as.vector(sps[[4]]), c(2, 4))
  expect_equal(ignore_attr = TRUE, as.vector(sps[[5]]), c(2, 5))
  expect_equal(ignore_attr = TRUE, as.vector(sps[[6]]), integer(0))
  expect_equal(ignore_attr = TRUE, as.vector(sps[[7]]), integer(0))
})

test_that("k_shortest_paths() works", {
  g <- make_ring(5)
  res <- k_shortest_paths(g, 1, 2, k = 3)
  expect_length(res$vpaths, 2)
  expect_length(res$epaths, 2)
  expect_equal(as.numeric(res$vpaths[[1]]), c(1, 2))
  expect_equal(as.numeric(res$epaths[[1]]), c(1))
  expect_equal(as.numeric(res$vpaths[[2]]), c(1, 5, 4, 3, 2))
  expect_equal(as.numeric(res$epaths[[2]]), c(5, 4, 3, 2))
})

test_that("k_shortest_paths() works with weights", {
  g <- make_graph(c(1, 2, 1, 3, 3, 2))
  E(g)$weight <- c(5, 2, 1)
  res <- k_shortest_paths(g, 1, 2, k = 3)
  expect_length(res$vpaths, 2)
  expect_length(res$epaths, 2)
  expect_equal(as.numeric(res$vpaths[[1]]), c(1, 3, 2))
  expect_equal(as.numeric(res$epaths[[1]]), c(2, 3))
  expect_equal(as.numeric(res$vpaths[[2]]), c(1, 2))
  expect_equal(as.numeric(res$epaths[[2]]), c(1))
})

test_that("transitivity() works", {
  withr::local_seed(42)
  g <- sample_gnp(100, p = 10 / 100)

  t1 <- transitivity(g, type = "global")
  expect_equal(t1, 0.10483870967741935887)

  t2 <- transitivity(g, type = "average")
  expect_equal(t2, 0.10159943848720931481)

  t3 <- transitivity(g, type = "local", vids = V(g))
  t33 <- transitivity(g, type = "local")
  est3 <- structure(
    c(0, 0.06667, 0.1028, 0.1016, 0.1333, 0.2222),
    .Names = c(
      "Min.",
      "1st Qu.",
      "Median",
      "Mean",
      "3rd Qu.",
      "Max."
    ),
    class = c("summaryDefault", "table")
  )
  expect_equal(summary(t3), est3, tolerance = 1e-3)
  expect_equal(summary(t33), est3, tolerance = 1e-3)
})

test_that("no integer overflow", {
  withr::local_seed(42)
  g <- make_star(80000, mode = "undirected") + edges(sample(2:1000), 100)
  mtr <- min(transitivity(g, type = "local"), na.rm = TRUE)
  expect_true(mtr > 0)
})

# Check that transitivity() produces named vectors, see #943
# The four tests below check four existing code paths
test_that("local transitivity() produces named vectors", {
  g <- make_graph(~ a - b - c - a - d)
  E(g)$weight <- 1:4
  t1 <- transitivity(g, type = "local")
  expect_equal(names(t1), V(g)$name)

  t2 <- transitivity(g, type = "barrat")
  expect_equal(names(t2), V(g)$name)

  vs <- c("a", "c")
  t3 <- transitivity(g, type = "local", vids = vs)
  expect_equal(names(t3), vs)

  t4 <- transitivity(g, type = "barrat", vids = vs)
  expect_equal(names(t4), vs)
})

test_that("constraint() works", {
  constraint.orig <- function(graph, nodes = V(graph), attr = NULL) {
    ensure_igraph(graph)
    idx <- degree(graph) != 0
    A <- as_adjacency_matrix(graph, attr = attr, sparse = FALSE)
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

test_that("ego() works", {
  neig <- function(graph, order, vertices) {
    sp <- distances(graph)
    v <- unique(unlist(lapply(vertices, function(x) {
      w <- which(sp[x, ] <= order)
    })))
    induced_subgraph(graph, c(v, vertices))
  }

  g <- sample_gnp(50, 5 / 50)

  v <- sample(vcount(g), 1)
  g1 <- make_ego_graph(g, 2, v)[[1]]
  g2 <- neig(g, 2, v)
  expect_isomorphic(g1, g2)

  #########

  nei <- function(graph, order, vertices) {
    sp <- distances(graph)
    v <- unique(unlist(lapply(vertices, function(x) {
      w <- which(sp[x, ] <= order)
    })))
    v
  }

  v1 <- ego(g, 2, v)[[1]]
  v2 <- nei(g, 2, v)
  expect_equal(as.vector(sort(v1)), sort(v2))

  #########

  s <- ego_size(g, 2, v)[[1]]
  expect_equal(s, length(v1))
})

test_that("mindist works", {
  g <- make_ring(10)
  expect_equal(ego_size(g, order = 2, mindist = 0), rep(5, 10))
  expect_equal(ego_size(g, order = 2, mindist = 1), rep(4, 10))
  expect_equal(ego_size(g, order = 2, mindist = 2), rep(2, 10))

  n0 <- unvs(ego(g, order = 2, 5:6, mindist = 0))
  n1 <- unvs(ego(g, order = 2, 5:6, mindist = 1))
  n2 <- unvs(ego(g, order = 2, 5:6, mindist = 2))

  expect_equal(lapply(n0, sort), list(3:7, 4:8))
  expect_equal(lapply(n1, sort), list(c(3, 4, 6, 7), c(4, 5, 7, 8)))
  expect_equal(lapply(n2, sort), list(c(3, 7), c(4, 8)))

  ng0 <- make_ego_graph(g, order = 2, 5:6, mindist = 0)
  ng1 <- make_ego_graph(g, order = 2, 5:6, mindist = 1)
  ng2 <- make_ego_graph(g, order = 2, 5:6, mindist = 2)

  expect_equal(sapply(ng0, vcount), c(5, 5))
  expect_equal(sapply(ng1, vcount), c(4, 4))
  expect_equal(sapply(ng2, vcount), c(2, 2))

  expect_equal(sapply(ng0, ecount), c(4, 4))
  expect_equal(sapply(ng1, ecount), c(2, 2))
  expect_equal(sapply(ng2, ecount), c(0, 0))
})

test_that("is_matching() works", {
  df <- data.frame(x = 1:5, y = letters[1:5])
  g <- graph_from_data_frame(df)

  expect_true(is_matching(g, c(6:10, 1:5)))
  expect_true(is_matching(g, c(6:9, NA, 1:4, NA)))
  expect_true(is_matching(g, rep(NA, 10)))

  expect_false(is_matching(g, c(1:10)))
  expect_false(is_matching(g, c(6:10, 5:1)))
  expect_false(is_matching(g, c(2)))
})

test_that("is_matching() works with names", {
  df <- data.frame(x = 1:5, y = letters[1:5])
  g <- graph_from_data_frame(df)

  expect_true(is_matching(
    g,
    c("a", "b", "c", "d", "e", "1", "2", "3", "4", "5")
  ))
  expect_true(is_matching(g, c("a", "b", "c", "d", NA, "1", "2", "3", "4", NA)))

  expect_false(is_matching(
    g,
    c("1", "2", "3", "4", "5", "a", "b", "c", "d", "e")
  ))
  expect_false(is_matching(
    g,
    c("a", "b", "c", "d", "e", "5", "4", "3", "2", "1")
  ))
  expect_false(is_matching(g, c("a", "b")))
})

test_that("is_max_matching() works", {
  df <- data.frame(x = 1:5, y = letters[1:5])
  g <- graph_from_data_frame(df)

  expect_true(is_max_matching(g, c(6:10, 1:5)))
  expect_false(is_max_matching(g, c(6:9, NA, 1:4, NA)))
  expect_false(is_max_matching(g, rep(NA, 10)))

  expect_false(is_max_matching(g, c(1:10)))
  expect_false(is_max_matching(g, c(6:10, 5:1)))
  expect_false(is_max_matching(g, c(2)))
})

test_that("is_max_matching() works with names", {
  df <- data.frame(x = 1:5, y = letters[1:5])
  g <- graph_from_data_frame(df)

  expect_true(is_max_matching(
    g,
    c("a", "b", "c", "d", "e", "1", "2", "3", "4", "5")
  ))
  expect_false(is_max_matching(
    g,
    c("a", "b", "c", "d", NA, "1", "2", "3", "4", NA)
  ))

  expect_false(is_max_matching(
    g,
    c("1", "2", "3", "4", "5", "a", "b", "c", "d", "e")
  ))
  expect_false(is_max_matching(
    g,
    c("a", "b", "c", "d", "e", "5", "4", "3", "2", "1")
  ))
  expect_false(is_max_matching(g, c("a", "b")))
})

test_that("max_bipartite_match() works", {
  df <- data.frame(x = 1:5, y = letters[1:5])
  g <- graph_from_data_frame(df)
  V(g)$type <- 1:vcount(g) > 5
  match <- max_bipartite_match(g)

  expect_equal(match$matching_size, 5)
  expect_equal(match$matching_weight, 5)
  expect_equal(sort(as.vector(match$matching)), sort(V(g)$name))
})

test_that("max_bipartite_match() handles missing types gracefully", {
  df <- data.frame(x = 1:5, y = letters[1:5])
  g <- graph_from_data_frame(df)
  expect_error(max_bipartite_match(g), "supply .*types.* argument")
})

test_that("unfold_tree() works", {
  g <- make_tree(7, 2)
  g <- add_edges(g, c(2, 7, 1, 4))
  g2 <- unfold_tree(g, roots = 1)
  expect_isomorphic(
    g2$tree,
    make_graph(c(
      1, 2, 1, 3, 2, 8, 2, 5, 3, 6, 3, 9, 2, 7, 1, 4
    ))
  )
  expect_equal(g2$vertex_index, c(1, 2, 3, 4, 5, 6, 7, 4, 7))
})

test_that("count_components() counts correctly", {
  g <- make_star(20, "undirected")
  h <- make_ring(10)

  G <- disjoint_union(g, h)

  expect_equal(count_components(G), 2L)
})

test_that("a null graph has zero components", {
  g <- make_empty_graph(0)

  expect_equal(count_components(g), 0L)
})

test_that("girth() works", {
  ## No circle in a tree
  g <- make_tree(1000, 3)
  gi <- girth(g)
  expect_equal(gi$girth, Inf)
  expect_equal(as.vector(gi$circle), numeric())

  ## The worst case running time is for a ring
  g <- make_ring(100)
  gi <- girth(g)
  expect_equal(gi$girth, 100)
  expect_equal(sort(diff(as.vector(gi$circle))), c(-99, rep(1, 98)))
})

test_that("coreness() works", {
  g <- make_ring(10)
  g <- add_edges(g, c(1, 2, 2, 3, 1, 3))
  gc <- coreness(g)
  expect_equal(gc, c(3, 3, 3, 2, 2, 2, 2, 2, 2, 2))
})

test_that("laplacian_matrix() works", {
  skip_if_not_installed("Matrix")
  mat <- rbind(
    c(116, 210, 200),
    c(210, 386, 380),
    c(200, 380, 401)
  )

  Ai <- graph_from_adjacency_matrix(
    as(mat, "dgCMatrix"),
    weighted = TRUE,
    mode = "undirected"
  )

  expect_snapshot(laplacian_matrix(Ai, normalization = "unnormalized"))
})

test_that("mean_distance works", {
  avg_path_length <- function(graph) {
    sp <- distances(graph, mode = "out")
    if (is_directed(graph)) {
      diag(sp) <- NA
    } else {
      sp[lower.tri(sp, diag = TRUE)] <- NA
    }
    sp[sp == "Inf"] <- NA
    mean(sp, na.rm = TRUE)
  }

  giant.component <- function(graph, mode = "weak") {
    clu <- components(graph, mode = mode)
    induced_subgraph(graph, which(clu$membership == which.max(clu$csize)))
  }

  g <- giant.component(sample_gnp(100, 3 / 100))
  expect_equal(avg_path_length(g), mean_distance(g))

  g <- giant.component(
    sample_gnp(100, 6 / 100, directed = TRUE),
    mode = "strong"
  )
  expect_equal(avg_path_length(g), mean_distance(g))

  g <- sample_gnp(100, 2 / 100)
  expect_equal(avg_path_length(g), mean_distance(g))

  g <- sample_gnp(100, 4 / 100, directed = TRUE)
  expect_equal(avg_path_length(g), mean_distance(g))
})

test_that("mean_distance works correctly for disconnected graphs", {
  g <- make_full_graph(5) %du% make_full_graph(7)
  md <- mean_distance(g, unconnected = FALSE)
  expect_equal(Inf, md)
  md <- mean_distance(g, unconnected = TRUE)
  expect_equal(1, md)
})

test_that("mean_distance can provide details", {
  avg_path_length <- function(graph) {
    sp <- distances(graph, mode = "out")
    if (is_directed(graph)) {
      diag(sp) <- NA
    } else {
      sp[lower.tri(sp, diag = TRUE)] <- NA
    }
    sp[sp == "Inf"] <- NA
    mean(sp, na.rm = TRUE)
  }

  giant.component <- function(graph, mode = "weak") {
    clu <- components(graph, mode = mode)
    induced_subgraph(graph, which(clu$membership == which.max(clu$csize)))
  }

  g <- giant.component(sample_gnp(100, 3 / 100))
  md <- mean_distance(g, details = TRUE)
  expect_equal(avg_path_length(g), md$res)

  g <- make_full_graph(5) %du% make_full_graph(7)
  md <- mean_distance(g, details = TRUE, unconnected = TRUE)
  expect_equal(1, md$res)
  expect_equal(70, md$unconnected)

  g <- make_full_graph(5) %du% make_full_graph(7)
  md <- mean_distance(g, details = TRUE, unconnected = FALSE)
  expect_equal(Inf, md$res)
  expect_equal(70, md$unconnected)
})

test_that("any_multiple(), count_multiple(), which_multiple() works", {
  # g <- sample_pa(10, m = 3, algorithm = "bag")
  g <- graph_from_edgelist(cbind(
    c(2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 7, 7, 7, 8, 8, 8, 9, 9, 9, 10, 10, 10),
    c(1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 3, 4, 3, 1, 1, 1, 3, 1, 2, 4, 1, 1, 2, 4, 1, 4, 1)
  ))
  im <- which_multiple(g)
  cm <- count_multiple(g)
  expect_true(any_multiple(g))
  expect_equal(
    im,
    c(
      FALSE, TRUE, TRUE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE,
      FALSE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, TRUE,
      FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE
    )
  )
  expect_equal(
    cm,
    c(3, 3, 3, 3, 3, 3, 1, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1, 2, 1, 1, 1, 1, 1, 1, 2, 1, 2)
  )
  expect_equal(
    count_multiple(simplify(g)),
    rep(1, ecount(simplify(g)))
  )

  ## Direction of the edge is important
  expect_false(any_multiple(make_graph(c(1, 2, 2, 1))))
  expect_equal(which_multiple(make_graph(c(1, 2, 2, 1))), c(FALSE, FALSE))
  expect_equal(
    which_multiple(make_graph(c(1, 2, 2, 1), dir = FALSE)),
    c(FALSE, TRUE)
  )

  ## Remove multiple edges but keep multiplicity
  # g <- sample_pa(10, m = 3, algorithm = "bag")
  g <- graph_from_edgelist(cbind(
    c(2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 7, 7, 7, 8, 8, 8, 9, 9, 9, 10, 10, 10),
    c(1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 4, 1, 4, 1, 1, 6, 4, 1, 5, 8)
  ))
  E(g)$weight <- 1
  g <- simplify(g)
  expect_false(any_multiple(g))
  expect_false(any(which_multiple(g)))
  expect_equal(
    E(g)$weight,
    c(3, 2, 1, 2, 1, 3, 2, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1)
  )
})

test_that("edge_density works", {
  g <- sample_gnp(50, 4 / 50)
  gd <- edge_density(g)
  gd2 <- ecount(g) / vcount(g) / (vcount(g) - 1) * 2
  expect_equal(gd, gd2)

  ####

  g <- sample_gnp(50, 4 / 50, directed = TRUE)
  gd <- edge_density(g)
  gd2 <- ecount(g) / vcount(g) / (vcount(g) - 1)
  expect_equal(gd, gd2)
})

test_that("knn works", {
  withr::local_seed(42)

  ## Some trivial ones
  g <- make_ring(10)
  expect_equal(knn(g), list(knn = rep(2, 10), knnk = c(NaN, 2)))

  g2 <- make_star(10)
  expect_equal(
    knn(g2),
    list(knn = c(1, rep(9, 9)), knnk = c(9, rep(NaN, 7), 1))
  )

  ## A scale-free one, try to plot 'knnk'
  g3 <- simplify(sample_pa(1000, m = 5))
  r3 <- knn(g3)
  expect_equal(r3$knn[43], 46)
  expect_equal(r3$knn[1000], 192.4)
  expect_equal(r3$knnk[100], 18.78)
  expect_equal(length(r3$knnk), 359)

  ## A random graph
  g4 <- sample_gnp(1000, p = 5 / 1000)
  r4 <- knn(g4)
  expect_equal(r4$knn[1000], 20 / 3)
  expect_equal(length(r4$knnk), 15)
  expect_equal(r4$knnk[12], 19 / 3)

  ## A weighted graph
  g5 <- make_star(10)
  E(g5)$weight <- seq(ecount(g5))
  r5 <- knn(g5)
  expect_equal(
    r5,
    structure(
      list(
        knn = c(1, rep(9, 9)),
        knnk = c(9, NaN, NaN, NaN, NaN, NaN, NaN, NaN, 1)
      ),
      .Names = c("knn", "knnk")
    )
  )
})

test_that("reciprocity works", {
  g <- make_graph(c(1, 2, 2, 1, 2, 3, 3, 4, 4, 4), directed = TRUE)
  expect_equal(reciprocity(g), 0.5)
  expect_equal(reciprocity(g, ignore.loops = FALSE), 0.6)
})

test_that("feedback_arc_set works", {
  skip_if_no_glpk()

  g <- make_graph(c(1, 2, 2, 3, 3, 1, 4, 2, 3, 4), directed = TRUE)
  fas <- feedback_arc_set(g)
  expect_equal(as.vector(fas), c(2))
})

test_that("feedback_arc_set works with weights", {
  skip_if_no_glpk()

  g <- make_ring(4, directed = TRUE)
  E(g)$weight <- 4:1
  fas <- feedback_arc_set(g)
  expect_equal(as.vector(fas), c(4))
})

test_that("feedback_arc_set works with undirected graphs", {
  skip_if_no_glpk()

  g <- make_ring(10)
  fas <- feedback_arc_set(g)
  expect_length(fas, 1)
})

test_that("feedback_vertex_set works", {
  skip_if_no_glpk()

  g <- make_lattice(c(3, 3))
  fvs <- feedback_vertex_set(g)
  expect_length(fvs, 2)
})

test_that("feedback_vertex_set works with weights", {
  skip_if_no_glpk()

  g <- make_ring(5, directed = TRUE)
  V(g)$weight <- 5:1
  fvs <- feedback_vertex_set(g)
  expect_equal(as.vector(fvs), c(5))
})
