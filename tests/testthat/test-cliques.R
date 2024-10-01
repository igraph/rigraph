test_that("cliques() works", {
  withr::local_seed(42)

  check.clique <- function(graph, vids) {
    s <- induced_subgraph(graph, vids)
    ecount(s) == vcount(s) * (vcount(s) - 1) / 2
  }

  g <- sample_gnp(100, 0.3)
  expect_equal(clique_num(g), 6)

  cl <- sapply(cliques(g, min = 6), check.clique, graph = g)
  lcl <- sapply(largest_cliques(g), check.clique, graph = g)
  expect_equal(cl, lcl)
  expect_equal(cl, rep(TRUE, 17))
  expect_equal(lcl, rep(TRUE, 17))

  ## To have a bit less maximal cliques, about 100-200 usually
  g <- sample_gnp(100, 0.03)
  expect_true(all(sapply(max_cliques(g), check.clique, graph = g)))
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

  check.clique <- function(graph, vids, min_weight) {
    s <- induced_subgraph(graph, vids)
    ecount(s) == vcount(s) * (vcount(s) - 1) / 2 && sum(V(s)$weight) >= min_weight
  }

  expect_equal(
    lapply(largest_weighted_cliques(g, vertex.weights = weights), as.numeric),
    list(c(1, 2, 3))
  )

  V(g)$weight <- weights
  cl <- sapply(weighted_cliques(g, min.weight = 9), check.clique, graph = g, min_weight = 9)
  expect_equal(cl, rep(TRUE, 14))

  g <- make_graph("zachary")
  weights <- rep(1, vcount(g))
  weights[c(1, 2, 3, 4, 14)] <- 3
  expect_equal(weighted_clique_num(g, vertex.weights = weights), 15)

  V(g)$weight <- weights * 2
  expect_equal(weighted_clique_num(g), 30)
})

test_that("max_cliques() work", {
  withr::local_seed(42)
  G <- sample_gnm(1000, 1000)
  cli <- make_full_graph(10)
  for (i in 1:10) {
    G <- permute(G, sample(vcount(G)))
    G <- G %u% cli
  }
  G <- simplify(G)

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

  cl1 <- mysort(bk4(G, min = 3))
  cl2 <- mysort(unvs(max_cliques(G, min = 3)))

  expect_identical(cl1, cl2)
})

test_that("max_cliques() work for subsets", {
  withr::local_seed(42)
  G <- sample_gnp(100, .5)

  mysort <- function(x) {
  xl <- sapply(x, length)
  x <- lapply(x, sort)
  xc <- sapply(x, paste, collapse = "-")
  x[order(xl, xc)]
}

  cl1 <- mysort(unvs(max_cliques(G, min = 8)))

  c1 <- unvs(max_cliques(G, min = 8, subset = 1:13))
  c2 <- unvs(max_cliques(G, min = 8, subset = 14:100))
  cl2 <- mysort(c(c1, c2))

  expect_identical(cl1, cl2)
})

test_that("count_max_cliques works", {
  withr::local_seed(42)
  G <- sample_gnp(100, .5)

  cl1 <- count_max_cliques(G, min = 8)

  c1 <- count_max_cliques(G, min = 8, subset = 1:13)
  c2 <- count_max_cliques(G, min = 8, subset = 14:100)
  cl2 <- c1 + c2

  expect_identical(cl1, cl2)
})

test_that("ivs() works", {
  g <- sample_gnp(50, 0.8)
  ivs <- ivs(g, min = ivs_size(g))
  ec <- sapply(seq_along(ivs), function(x) {
    ecount(induced_subgraph(g, ivs[[x]]))
  })
  expect_equal(unique(ec), 0)
})

test_that("ivs() works, cliques of complement",  {
  # 2385298846 https://github.com/igraph/rigraph/pull/1541#issuecomment-2385298846
  # that the independent vertex sets of G are
  # the same as the cliques of the complement of G (and vice versa)
  g <- sample_gnp(50, 0.8)
  ivs <- ivs(g, min = ivs_size(g)) %>% lapply(as.numeric)
  complement <- complementer(g)
  cliques <- cliques(complement, min = ivs_size(g)) %>% lapply(as.numeric)

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

  ## TODO: check that they are largest
})
