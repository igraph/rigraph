sortgl <- function(x) {
  cl <- lapply(x$cliques, sort)
  n <- sapply(cl, length)
  list(cliques = cl[order(n)], thresholds = x$thresholds[order(n)])
}

test_that("Graphlets work for some simple graphs", {
  full <- make_full_graph(5)
  E(full)$weight <- 1
  full_glet <- graphlet_basis(full)

  expect_equal(names(full_glet), c("cliques", "thresholds"))
  expect_equal(length(full_glet$cliques), 1)
  expect_equal(sort(full_glet$cliques[[1]]), 1:vcount(full))
  expect_equal(full_glet$thresholds, 1)

  E(full)[1 %--% 2]$weight <- 2
  full_glet2 <- sortgl(graphlet_basis(full))

  expect_equal(
    full_glet2,
    list(cliques = list(1:2, 1:5), thresholds = c(2, 1))
  )
})

test_that("Graphlets filtering works", {
  df <- data.frame(
    from = c("A", "A", "B", "B", "B", "C", "C", "D"),
    to = c("B", "C", "C", "D", "E", "D", "E", "E"),
    weight = c(8, 8, 8, 5, 5, 5, 5, 5)
  )

  g <- graph_from_data_frame(
    df,
    directed = FALSE,
    vertices = data.frame(LETTERS[1:5])
  )
  glet <- sortgl(graphlet_basis(g))

  expect_equal(glet$cliques, list(1:3, 2:5))
  expect_equal(glet$thresholds, c(8, 5))
})

threshold.net <- function(graph, level) {
  N <- vcount(graph)
  graph.t <- delete_edges(graph, which(E(graph)$weight < level))

  clqt <- unvs(max_cliques(graph.t))
  clqt <- lapply(clqt, sort)
  clqt[order(sapply(clqt, length), decreasing = TRUE)]
}

graphlets.old <- function(graph) {
  if (!is_weighted(graph)) {
    cli::cli_abort("Graph not weighted")
  }
  if (min(E(graph)$weight) <= 0 || any(!is.finite(E(graph)$weight))) {
    cli::cli_abort("Edge weights must be non-negative and finite")
  }

  ## Do all thresholds
  cl <- lapply(sort(unique(E(graph)$weight)), function(w) {
    threshold.net(graph, w)
  })

  ## Put the cliques in one long list
  clv <- unlist(cl, recursive = FALSE)

  ## Sort the vertices within the cliques
  cls <- lapply(clv, sort)

  ## Delete duplicate cliques
  clu <- unique(cls)

  ## Delete cliques that consist of single vertices
  clf <- clu[sapply(clu, length) != 1]

  clf
}

test_that("Graphlets work for a bigger graph", {
  withr::local_seed(42)
  g <- make_graph("zachary")
  E(g)$weight <- sample(1:5, ecount(g), replace = TRUE)

  gl <- graphlet_basis(g)
  gl2 <- graphlets.old(g)

  glo <- sort(sapply(unvs(gl$cliques), paste, collapse = "-"))
  gl2o <- sort(sapply(gl2, paste, collapse = "-"))

  expect_equal(glo, gl2o)
})

graphlets.project.old <- function(graph, cliques, iter, Mu = NULL) {
  if (!is_weighted(graph)) {
    cli::cli_abort("Graph not weighted")
  }
  if (min(E(graph)$weight) <= 0 || any(!is.finite(E(graph)$weight))) {
    cli::cli_abort("Edge weights must be non-negative and finite")
  }
  if (
    length(iter) != 1 ||
      !is.numeric(iter) ||
      !is.finite(iter) ||
      iter != as.integer(iter)
  ) {
    cli::cli_abort("`iter' must be a non-negative finite integer scalar")
  }

  clf <- cliques

  ## Create vertex-clique list first
  vcl <- vector(length = vcount(graph), mode = "list")
  for (i in 1:length(clf)) {
    for (j in clf[[i]]) {
      vcl[[j]] <- c(vcl[[j]], i)
    }
  }

  ## Create edge-clique list from this, it is useful to have the edge list
  ## of the graph at hand
  el <- as_edgelist(graph, names = FALSE)
  ecl <- vector(length = ecount(graph), mode = "list")
  for (i in 1:ecount(graph)) {
    edge <- el[i, ]
    ecl[[i]] <- intersect(vcl[[edge[1]]], vcl[[edge[2]]])
  }

  ## We will also need a clique-edge list, the edges in the cliques
  system.time({
    cel <- vector(length = length(clf), mode = "list")
    for (i in 1:length(ecl)) {
      for (j in ecl[[i]]) {
        cel[[j]] <- c(cel[[j]], i)
      }
    }
  })

  ## OK, we are ready to do the projection now
  if (is.null(Mu)) {
    Mu <- rep(1, length(clf))
  }
  origw <- E(graph)$weight
  w <- numeric(length(ecl))
  a <- sapply(clf, function(x) length(x) * (length(x) + 1) / 2)
  for (i in 1:iter) {
    for (j in 1:length(ecl)) {
      w[j] <- sum(Mu[ecl[[j]]])
    }
    for (j in 1:length(clf)) {
      Mu[j] <- Mu[j] * sum(origw[cel[[j]]] / (w[cel[[j]]] + .0001)) / a[j]
    }
  }

  ## Sort the cliques according to their weights
  Smb <- sort(Mu, decreasing = TRUE, index.return = TRUE)
  list(cliques = clf[Smb$ix], Mu = Mu[Smb$ix])
}

test_that("Graphlet projection works", {
  D1 <- matrix(0, 5, 5)
  D2 <- matrix(0, 5, 5)
  D3 <- matrix(0, 5, 5)
  D1[1:3, 1:3] <- 2
  D2[3:5, 3:5] <- 3
  D3[2:5, 2:5] <- 1
  g <- graph_from_adjacency_matrix(
    D1 + D2 + D3,
    mode = "undirected",
    weighted = TRUE
  )
  g <- simplify(g)

  gl <- graphlet_basis(g)
  glp <- graphlets(g)
  glp2 <- graphlets.project.old(g, cliques = gl$cliques, iter = 1000)

  glp$cliques <- unvs(glp$cliques)
  expect_equal(glp, glp2)
})
