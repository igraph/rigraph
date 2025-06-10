test_that("community detection functions work", {
  withr::local_seed(42)

  cluster_algos <- list(
    "cluster_edge_betweenness", "cluster_fast_greedy",
    "cluster_label_prop", "cluster_leading_eigen",
    "cluster_louvain", "cluster_spinglass", "cluster_walktrap"
  )
  if (has_glpk()) cluster_algos <- c(cluster_algos, "cluster_optimal")

  karate <- make_graph("Zachary")

  for (algo in cluster_algos) {
    karate_clustering <- do.call(algo, list(karate))

    expect_equal(
      modularity(karate_clustering),
      modularity(karate, membership(karate_clustering))
    )

    karate_comunities <- communities(karate_clustering)
    flat_karate_communities <- unlist(karate_comunities)
    is_vertex_in_several_clusters <- duplicated(flat_karate_communities)
    expect_false(any(is_vertex_in_several_clusters))
    is_cluster_id_valid <- flat_karate_communities <= vcount(karate) & flat_karate_communities >= 1
    expect_true(all(is_cluster_id_valid))
    expect_length(karate_clustering, max(membership(karate_clustering)))
  }

  karate_fgreedy <- cluster_fast_greedy(karate)
  m1 <- modularity(karate, cut_at(karate_fgreedy, no = 1))
  expect_equal(m1, 0)

  m2 <- modularity(karate, cut_at(karate_fgreedy, no = 2))
  expect_equal(m2, 0.3717948718)

  m3 <- modularity(karate, cut_at(karate_fgreedy, no = 3))
  expect_equal(m3, 0.3806706114)

  m4 <- modularity(karate, cut_at(karate_fgreedy, no = 4))
  expect_equal(m4, 0.3759861933)

  cr <- crossing(karate_fgreedy, karate)
  expect_equal(
    cr,
    c(
      TRUE, TRUE, TRUE, FALSE, FALSE,
      FALSE, TRUE, TRUE, FALSE, FALSE,
      TRUE, TRUE, TRUE, FALSE, TRUE, TRUE,
      FALSE, FALSE, FALSE, FALSE, FALSE, TRUE,
      FALSE, TRUE, FALSE, FALSE, TRUE, TRUE, TRUE,
      FALSE, TRUE, FALSE, FALSE, FALSE, FALSE,
      FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
      FALSE, FALSE, FALSE, TRUE, TRUE, FALSE,
      FALSE, FALSE, FALSE, FALSE, FALSE, TRUE,
      FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
      FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
      FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
      FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE
    )
  )
})

test_that("creating communities objects works", {
  withr::local_seed(42)

  karate <- make_graph("Zachary")

  membership <- sample.int(2, vcount(karate), replace = TRUE)
  mod <- modularity(karate, membership)
  comm <- make_clusters(
    algorithm = "random", membership = membership,
    modularity = mod
  )

  expect_equal(membership(comm), membership)
  expect_equal(modularity(comm), mod)
  expect_equal(algorithm(comm), "random")
})

test_that("communities function works", {
  skip_if_no_glpk()
  karate <- make_graph("Zachary")
  karate_optimal <- cluster_optimal(karate)
  karate_coms <- communities(karate_optimal)
  expect_equal(
    karate_coms,
    structure(
      list(
        `1` = c(1L, 2L, 3L, 4L, 8L, 12L, 13L, 14L, 18L, 20L, 22L),
        `2` = c(5L, 6L, 7L, 11L, 17L),
        `3` = c(9L, 10L, 15L, 16L, 19L, 21L, 23L, 27L, 30L, 31L, 33L, 34L),
        `4` = c(24L, 25L, 26L, 28L, 29L, 32L)
      ),
      .Dim = 4L, .Dimnames = list(c("1", "2", "3", "4"))
    )
  )

  double_ring <- make_ring(5) + make_ring(5)
  V(double_ring)$name <- letters[1:10]
  double_ring_optimal <- cluster_optimal(double_ring)
  double_ring_coms <- communities(double_ring_optimal)
  expect_equal(
    double_ring_coms,
    structure(
      list(
        `1` = letters[1:5],
        `2` = letters[6:10]
      ),
      .Dim = 2L, .Dimnames = list(c("1", "2"))
    )
  )
})

test_that("cluster_edge_betweenness works", {
  karate <- make_graph("Zachary")
  karate_ebc <- cluster_edge_betweenness(karate)

  expect_equal(max(karate_ebc$modularity), modularity(karate, karate_ebc$membership))
  expect_equal(
    membership(karate_ebc),
    c(
      1, 1, 2, 1, 3, 3, 3, 1, 4, 5, 3,
      1, 1, 1, 4, 4, 3, 1, 4, 1, 4, 1,
      4, 4, 2, 2, 4, 2, 2, 4, 4, 2, 4, 4
    )
  )
  expect_length(karate_ebc, 5)
  expect_equal(as.numeric(sizes(karate_ebc)), c(10, 6, 5, 12, 1))

  karate_dendro <- as.dendrogram(karate_ebc)
  expect_output(print(karate_dendro), "2 branches.*34 members.*height 33")
  expect_output(
    print(karate_dendro[[1]]),
    "2 branches.*15 members.*height 31"
  )
  expect_output(
    print(karate_dendro[[2]]),
    "2 branches.*19 members.*height 32"
  )
  m2 <- cut_at(karate_ebc, no = 3)
  expect_equal(
    modularity(karate, m2),
    karate_ebc$modularity[length(karate_ebc$modularity) - 2]
  )
})

test_that("cluster_fast_greedy works", {
  withr::local_seed(42)

  karate <- make_graph("Zachary")
  karate_fc <- cluster_fast_greedy(karate)

  expect_equal(modularity(karate, karate_fc$membership), max(karate_fc$modularity))
  expect_equal(
    membership(karate_fc),
    c(
      1, 3, 3, 3, 1, 1, 1, 3, 2, 3, 1,
      1, 3, 3, 2, 2, 1, 3, 2, 1, 2, 3,
      2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
    )
  )
  expect_length(karate_fc, 3)
  expect_equal(as.numeric(sizes(karate_fc)), c(8, 17, 9))

  karate_dendro <- as.dendrogram(karate_fc)
  expect_output(print(karate_dendro), "2 branches.*34 members.*height 33")
  expect_output(print(karate_dendro[[1]]), "2 branches.*17 members.*height 32")
  expect_output(print(karate_dendro[[2]]), "2 branches.*17 members.*height 30")
  m2 <- cut_at(karate_fc, no = 3)
  expect_equal(
    modularity(karate, m2),
    karate_fc$modularity[length(karate_fc$modularity) - 2]
  )
})

test_that("label.propagation.community works", {
  karate <- make_graph("Zachary")
  withr::local_seed(20231029)
  karate_lpc <- cluster_label_prop(karate)
  expect_equal(karate_lpc$modularity, modularity(karate, karate_lpc$membership))

  expect_in(length(karate_lpc), 1:5)
  expect_in(membership(karate_lpc), seq_len(length(karate_lpc)))
  expect_s3_class(sizes(karate_lpc), "table")
  expect_equal(sum(sizes(karate_lpc)), vcount(karate))
  expect_identical(sizes(karate_lpc), table(membership(karate_lpc), dnn = "Community sizes"))
})

test_that("cluster_leading_eigen works", {
  withr::local_seed(20230115)

  check_eigen_value <- function(membership, community, value, vector, multiplier, extra) {
    M <- sapply(1:length(vector), function(x) {
      v <- rep(0, length(vector))
      v[x] <- 1
      multiplier(v)
    })
    ev <- eigen(M)
    ret <- 0
    expect_equal(ev$values[1], value)
    if (sign(ev$vectors[1, 1]) != sign(vector[1])) {
      ev$vectors <- -ev$vectors
    }
    expect_equal(ev$vectors[, 1], vector)
    0
  }

  karate <- make_graph("Zachary")
  karate_lc <- cluster_leading_eigen(karate, callback = check_eigen_value)

  expect_equal(karate_lc$modularity, modularity(karate, karate_lc$membership))
  expect_equal(
    membership(karate_lc),
    c(
      1, 3, 3, 3, 1, 1, 1, 3, 2, 2, 1,
      1, 3, 3, 2, 2, 1, 3, 2, 3, 2, 3,
      2, 4, 4, 4, 2, 4, 4, 2, 2, 4, 2, 2
    )
  )
  expect_length(karate_lc, 4)
  expect_equal(
    sizes(karate_lc),
    structure(
      c(7L, 12L, 9L, 6L),
      .Dim = 4L,
      .Dimnames = structure(list(`Community sizes` = c("1", "2", "3", "4")),
        .Names = "Community sizes"
      ), class = "table"
    )
  )

  ## Check that the modularity matrix is correct

  mod_mat_caller <- function(membership, community, value, vector, multiplier, extra) {
    M <- sapply(1:length(vector), function(x) {
      v <- rep(0, length(vector))
      v[x] <- 1
      multiplier(v)
    })
    myc <- membership == community
    B <- A[myc, myc] - (deg[myc] %*% t(deg[myc])) / 2 / ec
    BG <- B - diag(rowSums(B))

    expect_equal(M, BG)
    0
  }

  A <- as_adjacency_matrix(karate, sparse = FALSE)
  ec <- ecount(karate)
  deg <- degree(karate)
  karate_lc2 <- cluster_leading_eigen(karate, callback = mod_mat_caller)
})
test_that("cluster_leading_eigen is deterministic", {
  ## Stress-test. We skip this on R 3.4 and 3.5 because it seems like
  ## the results are not entirely deterministic there.

  skip_if(getRversion() < "3.6")

  for (i in 1:100) {
    g_rand <- sample_gnm(20, sample(5:40, 1))
    lec1 <- cluster_leading_eigen(g_rand)
    lec2 <- cluster_leading_eigen(g_rand)
    expect_equal(
      membership(lec1),
      membership(lec2)
    )
  }
})

test_that("cluster_leiden works", {
  withr::local_seed(42)

  karate <- make_graph("Zachary")
  karate_leiden <- cluster_leiden(karate, resolution = 0.06)

  expect_equal(
    membership(karate_leiden),
    c(
      1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1,
      1, 1, 1, 2, 2, 1, 1, 2, 1, 2, 1,
      2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
    )
  )
  expect_length(karate_leiden, 2)
  expect_equal(
    sizes(karate_leiden),
    structure(
      c(17L, 17L),
      .Dim = 2L,
      .Dimnames = structure(list(`Community sizes` = c("1", "2")),
        .Names = "Community sizes"
      ), class = "table"
    )
  )

  karate_leiden_mod <- cluster_leiden(karate, "modularity")

  expect_equal(
    membership(karate_leiden_mod),
    c(
      1, 1, 1, 1, 2, 2, 2, 1, 3, 3, 2, 1, 1,
      1, 3, 3, 2, 1, 3, 1, 3, 1, 3, 4, 4, 4,
      3, 4, 4, 3, 3, 4, 3, 3
    )
  )
  expect_length(karate_leiden_mod, 4)
  expect_equal(
    sizes(karate_leiden_mod),
    structure(
      c(11L, 5L, 12L, 6L),
      .Dim = 4L,
      .Dimnames = structure(list(`Community sizes` = c("1", "2", "3", "4")),
        .Names = "Community sizes"
      ), class = "table"
    )
  )
})

test_that("modularity_matrix works", {
  karate <- make_graph("zachary")

  karate_fc <- cluster_fast_greedy(karate)

  karate_m1 <- modularity(karate, membership(karate_fc))
  karate_m2 <- modularity(karate, membership(karate_fc), weights = rep(1, ecount(karate)))
  expect_equal(karate_m1, karate_m2)

  karate_modmat1 <- modularity_matrix(karate)
  karate_modmat2 <- modularity_matrix(karate, weights = rep(1, ecount(karate)))

  expect_equal(karate_modmat1, karate_modmat2)
})

test_that("modularity_matrix still accepts a membership argument for compatibility", {
  karate <- make_graph("zachary")
  expect_snapshot(
    x <- modularity_matrix(karate, membership = rep(1, vcount(karate)))
  )
})

test_that("cluster_louvain works", {
  withr::local_seed(20231029)

  karate <- make_graph("Zachary")
  karate_mc <- cluster_louvain(karate)

  expect_in(membership(karate_mc), 1:4)
  expect_equal(modularity(karate, karate_mc$membership), max(karate_mc$modularity))
  expect_in(length(karate_mc), 3:4)
  expect_in(membership(karate_mc), seq_len(length(karate_mc)))
  expect_s3_class(sizes(karate_mc), "table")
  expect_equal(sum(sizes(karate_mc)), vcount(karate))
  expect_identical(sizes(karate_mc), table(membership(karate_mc), dnn = "Community sizes"))
})

test_that("cluster_optimal works", {
  skip_if_no_glpk()

  karate <- make_graph("Zachary")
  karate_optimal <- cluster_optimal(karate)

  expect_equal(
    membership(karate_optimal),
    c(
      1, 1, 1, 1, 2, 2, 2, 1, 3, 3, 2,
      1, 1, 1, 3, 3, 2, 1, 3, 1, 3, 1,
      3, 4, 4, 4, 3, 4, 4, 3, 3, 4, 3, 3
    )
  )
  expect_equal(modularity(karate, karate_optimal$membership), karate_optimal$modularity)
  expect_length(karate_optimal, 4)
  expect_equal(
    sizes(karate_optimal),
    structure(
      c(11L, 5L, 12L, 6L),
      .Dim = 4L,
      .Dimnames = structure(list(`Community sizes` = c("1", "2", "3", "4")),
        .Names = "Community sizes"
      ), class = "table"
    )
  )
})

test_that("weighted cluster_optimal works", {
  skip_if_no_glpk()
  local_rng_version("3.5.0")
  withr::local_seed(42)

  graph_full_ring <- make_full_graph(5) + make_ring(5)
  E(graph_full_ring)$weight <- sample.int(2, ecount(graph_full_ring), replace = TRUE)

  graph_full_ring_optimal <- cluster_optimal(graph_full_ring)
  expect_equal(modularity(graph_full_ring_optimal), 0.4032)
})

test_that("cluster_walktrap works", {
  withr::local_seed(42)

  karate <- make_graph("Zachary")
  karate_walktrap <- cluster_walktrap(karate)

  expect_equal(modularity(karate, membership(karate_walktrap)), modularity(karate_walktrap))
  expect_equal(
    membership(karate_walktrap),
    c(1, 1, 2, 1, 5, 5, 5, 1, 2, 2, 5, 1, 1, 2, 3, 3, 5, 1, 3, 1, 3, 1, 3, 4, 4, 4, 3, 4, 2, 3, 2, 2, 3, 3)
  )
  expect_length(karate_walktrap, 5)
  expect_equal(
    sizes(karate_walktrap),
    structure(c(9L, 7L, 9L, 4L, 5L),
      .Dim = 5L,
      .Dimnames = structure(list(`Community sizes` = c("1", "2", "3", "4", "5")), .Names = "Community sizes"), class = "table"
    )
  )

  karate_dendro <- as.dendrogram(karate_walktrap)
  expect_output(print(karate_dendro), "2 branches.*34 members.*height 33")
  expect_output(print(karate_dendro[[1]]), "2 branches.*20 members.*height 31")
  expect_output(print(karate_dendro[[2]]), "2 branches.*14 members.*height 32")
  m2 <- cut_at(karate_walktrap, no = 3)
  expect_equal(
    modularity(karate, m2),
    karate_walktrap$modularity[length(karate_walktrap$modularity) - 2]
  )
})

test_that("split_join_distance works", {
  random_sjd <- unname(split_join_distance(rep(1:2, each = 17), rep(1, 34)))
  expect_equal(random_sjd, c(0, 17))

  karate <- make_graph("Zachary")
  karate_split1 <- make_clusters(karate, rep(1:2, each = 17))
  karate_split2 <- make_clusters(karate, rep(1, 34))
  com_sjd <- unname(split_join_distance(karate_split1, karate_split2))
  expect_equal(com_sjd, c(0, 17))
})

test_that("groups works", {
  g <- make_ring(10) + make_full_graph(5)
  gr <- groups(components(g))

  expect_equal(gr, structure(list(`1` = 1:10, `2` = 11:15), .Dim = 2L, .Dimnames = list(c("1", "2"))))

  V(g)$name <- letters[1:15]
  gr <- groups(components(g))

  expect_equal(gr, structure(list(`1` = letters[1:10], `2` = letters[11:15]), .Dim = 2L, .Dimnames = list(c("1", "2"))))
})

test_that("voronoi works", {
  res <- voronoi_cells(make_ring(10), c(1, 6))
  expect_equal(res$membership, c(0, 0, 0, 1, 1, 1, 1, 1, 0, 0))
  expect_equal(res$distances, c(0, 1, 2, 2, 1, 0, 1, 2, 2, 1))
})

test_that("voronoi works with weights", {
  res <- voronoi_cells(make_ring(10), c(1, 6), weights = 1:10)
  expect_equal(res$membership, c(0, 0, 0, 0, 1, 1, 1, 1, 0, 0))
  expect_equal(res$distances, c(0, 1, 3, 6, 5, 0, 6, 13, 19, 10))
})

test_that("contract works", {
  local_rng_version("3.5.0")
  withr::local_seed(42)

  g <- make_ring(10)
  g$name <- "Ring"
  V(g)$name <- letters[1:vcount(g)]
  E(g)$weight <- sample(ecount(g))

  g2 <- contract(g, rep(1:5, each = 2),
    vertex.attr.comb = toString
  )

  expect_equal(g2$name, g$name)
  expect_equal(V(g2)$name, c("a, b", "c, d", "e, f", "g, h", "i, j"))
  expect_equal(
    as_unnamed_dense_matrix(g2[]),
    cbind(c(10, 9, 0, 0, 7), c(9, 3, 6, 0, 0), c(0, 6, 4, 8, 0), c(0, 0, 8, 5, 1), c(7, 0, 0, 1, 2))
  )
})
