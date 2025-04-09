test_that("cliques() works", {
  withr::local_seed(42)

  is_clique <- function(graph, vids) {
    s <- induced_subgraph(graph, vids)
    ecount(s) == vcount(s) * (vcount(s) - 1) / 2
  }

  gnp <- sample_gnp(100, 0.3)
  expect_equal(clique_num(gnp), 6)

  cl <- sapply(cliques(gnp, min = 6), is_clique, graph = gnp)
  lcl <- sapply(largest_cliques(gnp), is_clique, graph = gnp)
  expect_equal(cl, lcl)
  expect_equal(cl, rep(TRUE, 17))
  expect_equal(lcl, rep(TRUE, 17))

  ## To have a bit less maximal cliques, about 100-200 usually
  gnp100 <- sample_gnp(100, 0.03)
  expect_true(all(sapply(max_cliques(gnp100), is_clique, graph = gnp100)))
})

test_that("clique_size_counts() works", {
  g <- make_full_graph(5) %du% make_full_graph(3)

  expect_equal(clique_size_counts(g), c(8, 13, 11, 5, 1))
  expect_equal(clique_size_counts(g, min = 3), c(0, 0, 11, 5, 1))
  expect_equal(clique_size_counts(g, max = 4), c(8, 13, 11, 5))
  expect_equal(clique_size_counts(g, min = 2, max = 4), c(0, 13, 11, 5))

  expect_equal(clique_size_counts(g, maximal = TRUE), c(0, 0, 1, 0, 1))
  expect_equal(clique_size_counts(g, min = 3, maximal = TRUE), c(0, 0, 1, 0, 1))
  expect_equal(clique_size_counts(g, max = 4, maximal = TRUE), c(0, 0, 1))
  expect_equal(clique_size_counts(g, min = 2, max = 4, maximal = TRUE), c(0, 0, 1))
})

test_that("weighted_cliques works", {
  g <- make_graph(~ A - B - C - A - D - E - F - G - H - D - F - H - E - G - D)
  weights <- c(5, 5, 5, 3, 3, 3, 3, 2)

  is_clique_weight <- function(graph, vids, min_weight) {
    s <- induced_subgraph(graph, vids)
    ecount(s) == vcount(s) * (vcount(s) - 1) / 2 && sum(V(s)$weight) >= min_weight
  }

  expect_equal(
    lapply(largest_weighted_cliques(g, vertex.weights = weights), as.numeric),
    list(c(1, 2, 3))
  )

  V(g)$weight <- weights
  cl <- sapply(weighted_cliques(g, min.weight = 9), is_clique_weight, graph = g, min_weight = 9)
  expect_equal(cl, rep(TRUE, 14))

  karate <- make_graph("zachary")
  weights <- rep(1, vcount(karate))
  weights[c(1, 2, 3, 4, 14)] <- 3
  expect_equal(weighted_clique_num(karate, vertex.weights = weights), 15)

  V(karate)$weight <- weights * 2
  expect_equal(weighted_clique_num(karate), 30)
})

test_that("max_cliques() work", {
  withr::local_seed(42)
  gnp <- sample_gnm(1000, 1000)
  full10 <- make_full_graph(10)
  for (i in 1:10) {
    gnp <- permute(gnp, sample(vcount(gnp)))
    gnp <- gnp %u% full10
  }
  gnp <- simplify(gnp)

  mysort <- function(x) {
    xl <- sapply(x, length)
    x <- lapply(x, sort)
    xc <- sapply(x, paste, collapse = "-")
    x[order(xl, xc)]
  }

  bk4 <- function(graph, min = 0, max = Inf) {
    Gamma <- function(v) {
      neighbors(graph, v)
    }

    bkpivot <- function(PX, R) {
      P <- if (PX$PE >= PX$PS) {
        PX$PX[PX$PS:PX$PE]
      } else {
        numeric()
      }
      X <- if (PX$XE >= PX$XS) {
        PX$PX[PX$XS:PX$XE]
      } else {
        numeric()
      }
      if (length(P) == 0 && length(X) == 0) {
        if (length(R) >= min && length(R) <= max) {
          list(R)
        } else {
          list()
        }
      } else if (length(P) != 0) {
        psize <- sapply(c(P, X), function(u) {
          length(intersect(P, Gamma(u)))
        })
        u <- c(P, X)[which.max(psize)]

        pres <- list()
        for (v in setdiff(P, Gamma(u))) {
          p0 <- if (PX$PS > 1) {
            PX$PX[1:(PX$PS - 1)]
          } else {
            numeric()
          }
          p1 <- setdiff(P, Gamma(v))
          p2 <- intersect(P, Gamma(v))
          x1 <- intersect(X, Gamma(v))
          x2 <- setdiff(X, Gamma(v))
          x0 <- if (PX$XE < length(PX$PX)) {
            PX$PX[(PX$XE + 1):length(PX$PX)]
          } else {
            numeric()
          }

          newPX <- list(
            PX = c(p0, p1, p2, x1, x2, x0),
            PS = length(p0) + length(p1) + 1,
            PE = length(p0) + length(p1) + length(p2),
            XS = length(p0) + length(p1) + length(p2) + 1,
            XE = length(p0) + length(p1) + length(p2) + length(x1)
          )

          pres <- c(pres, bkpivot(newPX, c(R, v)))

          vpos <- which(PX$PX == v)
          tmp <- PX$PX[PX$PE]
          PX$PX[PX$PE] <- v
          PX$PX[vpos] <- tmp
          PX$PE <- PX$PE - 1
          PX$XS <- PX$XS - 1
          P <- if (PX$PE >= PX$PS) {
            PX$PX[PX$PS:PX$PE]
          } else {
            numeric()
          }
          X <- if (PX$XE >= PX$XS) {
            PX$PX[PX$XS:PX$XE]
          } else {
            numeric()
          }
          if (any(duplicated(PX$PX))) {
            stop("foo2")
          }
        }
        pres
      }
    }

    res <- list()
    cord <- order(coreness(graph))
    for (v in seq_along(cord)) {
      if (v != length(cord)) {
        P <- intersect(Gamma(cord[v]), cord[(v + 1):length(cord)])
      } else {
        P <- numeric()
      }
      if (v != 1) {
        X <- intersect(Gamma(cord[v]), cord[1:(v - 1)])
      } else {
        X <- numeric()
      }
      PX <- list(
        PX = c(P, X), PS = 1, PE = length(P),
        XS = length(P) + 1, XE = length(P) + length(X)
      )
      res <- c(res, bkpivot(PX, cord[v]))
    }
    lapply(res, as.integer)
  }

  cl1 <- mysort(bk4(gnp, min = 3))
  cl2 <- mysort(unvs(max_cliques(gnp, min = 3)))

  expect_identical(cl1, cl2)
})

test_that("max_cliques() work for subsets", {
  withr::local_seed(42)
  gnp <- sample_gnp(100, .5)

  mysort <- function(x) {
    xl <- sapply(x, length)
    x <- lapply(x, sort)
    xc <- sapply(x, paste, collapse = "-")
    x[order(xl, xc)]
  }

  cl1 <- mysort(unvs(max_cliques(gnp, min = 8)))

  c1 <- unvs(max_cliques(gnp, min = 8, subset = 1:13))
  c2 <- unvs(max_cliques(gnp, min = 8, subset = 14:100))
  cl2 <- mysort(c(c1, c2))

  expect_identical(cl1, cl2)
})

test_that("count_max_cliques works", {
  withr::local_seed(42)
  gnp <- sample_gnp(100, .5)

  cl1 <- count_max_cliques(gnp, min = 8)

  c1 <- count_max_cliques(gnp, min = 8, subset = 1:13)
  c2 <- count_max_cliques(gnp, min = 8, subset = 14:100)
  cl2 <- c1 + c2

  expect_identical(cl1, cl2)
})

test_that("ivs() works", {
  gnp <- sample_gnp(50, 0.8)
  ivs <- ivs(gnp, min = ivs_size(gnp))
  edges_iv <- sapply(seq_along(ivs), function(x) {
    ecount(induced_subgraph(gnp, ivs[[x]]))
  })
  expect_equal(unique(edges_iv), 0)
})

test_that("ivs() works, cliques of complement", {
  # 2385298846 https://github.com/igraph/rigraph/pull/1541#issuecomment-2385298846
  # that the independent vertex sets of G are
  # the same as the cliques of the complement of G (and vice versa)
  gnp <- sample_gnp(50, 0.8)
  ivs <- ivs(gnp, min = ivs_size(gnp)) %>% lapply(as.numeric)
  complement <- complementer(gnp)
  cliques <- cliques(complement, min = ivs_size(gnp)) %>% lapply(as.numeric)

  expect_equal(length(ivs), length(cliques))

  ivs_with_equivalent <- map_lgl(
    ivs,
    function(element, cliques) any(map_lgl(cliques, function(x) identical(x, element))),
    cliques = cliques
  )
  expect_equal(sum(ivs_with_equivalent), length(ivs))

  cliques_with_equivalent <- map_lgl(
    cliques,
    function(element, ivs) any(map_lgl(ivs, function(x) identical(x, element))),
    ivs = ivs
  )
  expect_equal(sum(cliques_with_equivalent), length(cliques))
})

test_that("largest_cliques() works", {
  adj <- matrix(1, nrow = 11, ncol = 11) - diag(11)
  g <- graph_from_adjacency_matrix(adj)
  expect_warning(
    lc <- largest_cliques(g),
    "Edge directions are ignored for maximal clique calculation"
  )
  expect_equal(lapply(unvs(lc), sort), list(1:11))
})

test_that("largest_ivs() works", {
  g <- sample_gnp(50, 0.8)
  livs <- largest_ivs(g)
  expect_equal(
    unique(sapply(livs, length)),
    ivs_size(g)
  )

  ec <- sapply(seq_along(livs), function(x) {
    ecount(induced_subgraph(g, livs[[x]]))
  })
  expect_equal(unique(ec), 0)

  expect_length(ivs(g, min = length(livs[[1]]) + 1), 0)
})

test_that("largest_cliques works", {
  g <- sample_gnp(50, 20 / 50)
  lc <- largest_cliques(g)
  expect_length(cliques(g, min = length(lc[[1]]) + 1), 0)

  lc_ring <- largest_cliques(make_ring(10))
  expect_equal(max(sapply(lc_ring, length)), 2)
})

test_that("is_clique works", {
  withr::local_seed(42)

  g <- make_full_graph(5)
  expect_true(is_clique(g, V(g)))

  g <- sample_gnp(15, 0.5)
  max_cl <- max_cliques(g)
  all_are_cliques <- all(sapply(max_cl, function(x) is_clique(g, x)))
  expect_true(all_are_cliques)
})

test_that("is_ivs works", {
  withr::local_seed(42)

  g <- make_full_bipartite_graph(5, 5)
  expect_true(is_ivs(g, V(g)[V(g)$type]))

  g <- sample_gnp(15, 0.5)
  max_ivs <- max_ivs(g)
  all_are_ivs <- all(sapply(max_ivs, function(x) is_ivs(g, x)))
  expect_true(all_are_ivs)
})

test_that("is_complete works", {
  g1 <- make_full_graph(5)
  expect_true(is_complete(g1))

  g2 <- make_full_graph(5, directed = TRUE)
  expect_true(is_complete(g1))

  g3 <- delete_edges(g2, 1)
  expect_false(is_complete(g3))

  g4 <- as_undirected(g3)
  expect_true(is_complete(g4))
})
