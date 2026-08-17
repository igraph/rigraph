# Helper functions extracted from individual test files. They live here (rather
# than at the top of each test file) so they are sourced into the testthat
# environment before tests run. The `test_that` override in setup.R re-injects
# test code from a different scope, which would otherwise put file-local helpers
# out of reach. Each block is annotated with the test file that uses it.

# ---- test-embedding.R -------------------------------------------------------

standardize_eigen_signs <- function(x) {
  x <- zapsmall(x)
  apply(x, 2, function(col) {
    if (any(col < 0) && col[which(col != 0)[1]] < 0) {
      -col
    } else {
      col
    }
  })
}

order_by_magnitude <- function(x) {
  order(abs(x), sign(x), decreasing = TRUE)
}

sort_by_magnitude <- function(x) {
  x[order_by_magnitude(x)]
}

# ---- test-operators.R -------------------------------------------------------

order_by_two_first_columns <- function(x) x[order(x[, 1], x[, 2]), ]

rn <- function(D) {
  rownames(D) <- paste(D[, 1], D[, 2], sep = "-")
  D
}

# Input/expected pairs for the unique()-on-vertex-sequence tests.
unique_tests <- function() {
  list(
    list(1:5, 1:5),
    list(c(1, 1, 2:5), 1:5),
    list(c(1, 1, 1, 1), 1),
    list(c(1, 2, 2, 2), 1:2),
    list(c(2, 2, 1, 1), 2:1),
    list(c(1, 2, 1, 2), 1:2),
    list(c(), c())
  )
}

# A fresh already-simple graph with two edge attributes, one of which the
# default combination list keeps and one of which it drops. Each caller needs
# its own: the C core's property cache lives in the graph object, and merely
# asking whether the graph is simple changes what simplifying it does.
simple_graph_with_attrs <- function() {
  g <- make_graph(c(1, 2, 2, 3), directed = FALSE)
  E(g)$weight <- c(1, 2)
  E(g)$foo <- c("a", "b")
  g
}

# ---- test-glet.R ------------------------------------------------------------

# Shared fixture: the weighted overlapping-groups graph from the examples.
# Its `weight` edge attribute has four distinct threshold levels.
make_graphlet_graph <- function() {
  D1 <- matrix(0, 5, 5)
  D2 <- matrix(0, 5, 5)
  D3 <- matrix(0, 5, 5)
  D1[1:3, 1:3] <- 2
  D2[3:5, 3:5] <- 3
  D3[2:5, 2:5] <- 1
  simplify(graph_from_adjacency_matrix(
    D1 + D2 + D3,
    mode = "undirected",
    weighted = TRUE
  ))
}

sortgl <- function(x) {
  cl <- lapply(x$cliques, sort)
  n <- lengths(cl)
  list(cliques = cl[order(n)], thresholds = x$thresholds[order(n)])
}

threshold.net <- function(graph, level) {
  graph.t <- delete_edges(graph, which(E(graph)$weight < level))

  clqt <- unvs(max_cliques(graph.t))
  clqt <- lapply(clqt, sort)
  clqt[order(lengths(clqt), decreasing = TRUE)]
}

graphlets.old <- function(graph) {
  if (!is_weighted(graph)) {
    cli::cli_abort("Graph not weighted")
  }
  if (min(E(graph)$weight) <= 0 || !all(is.finite(E(graph)$weight))) {
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
  clf <- clu[lengths(clu) != 1]

  clf
}

graphlets.project.old <- function(graph, cliques, iter, Mu = NULL) {
  if (!is_weighted(graph)) {
    cli::cli_abort("Graph not weighted")
  }
  if (min(E(graph)$weight) <= 0 || !all(is.finite(E(graph)$weight))) {
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
  for (i in seq_along(clf)) {
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
    for (i in seq_along(ecl)) {
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
    for (j in seq_along(ecl)) {
      w[j] <- sum(Mu[ecl[[j]]])
    }
    for (j in seq_along(clf)) {
      Mu[j] <- Mu[j] * sum(origw[cel[[j]]] / (w[cel[[j]]] + 0.0001)) / a[j]
    }
  }

  ## Sort the cliques according to their weights
  Smb <- sort(Mu, decreasing = TRUE, index.return = TRUE)
  list(cliques = clf[Smb$ix], Mu = Mu[Smb$ix])
}

# ---- test-other.R -----------------------------------------------------------

# A hand-built karate-club graph in the *old* igraph data format, used to test
# that VS/ES require (and survive) an explicit upgrade. Renamed from the
# file-local `names`/`karate` to avoid shadowing base `names()` once sourced
# into the shared testthat environment.
karate_oldstyle_names <- function() {
  c(
    "Mr Hi", "Actor 2", "Actor 3", "Actor 4",
    "Actor 5", "Actor 6", "Actor 7", "Actor 8", "Actor 9", "Actor 10",
    "Actor 11", "Actor 12", "Actor 13", "Actor 14", "Actor 15", "Actor 16",
    "Actor 17", "Actor 18", "Actor 19", "Actor 20", "Actor 21", "Actor 22",
    "Actor 23", "Actor 24", "Actor 25", "Actor 26", "Actor 27", "Actor 28",
    "Actor 29", "Actor 30", "Actor 31", "Actor 32", "Actor 33", "John A"
  )
}

karate_oldstyle <- function() {
  structure(
    list(
      34,
      FALSE,
      c(
        1, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12,
        13, 17, 19, 21, 31, 2, 3, 7, 13, 17, 19, 21, 30, 3, 7, 8, 9,
        13, 27, 28, 32, 7, 12, 13, 6, 10, 6, 10, 16, 16, 30, 32, 33,
        33, 33, 32, 33, 32, 33, 32, 33, 33, 32, 33, 32, 33, 25, 27, 29,
        32, 33, 25, 27, 31, 31, 29, 33, 33, 31, 33, 32, 33, 32, 33, 32,
        33, 33
      ),
      c(
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5,
        5, 5, 6, 8, 8, 8, 9, 13, 14, 14, 15, 15, 18, 18, 19, 20, 20,
        22, 22, 23, 23, 23, 23, 23, 24, 24, 24, 25, 26, 26, 27, 28, 28,
        29, 29, 30, 30, 31, 31, 32
      ),
      c(
        0, 1, 16, 2, 17, 24, 3, 4, 5,
        35, 37, 6, 18, 25, 32, 7, 26, 27, 8, 36, 38, 9, 10, 33, 11, 19,
        28, 34, 39, 40, 12, 20, 13, 21, 14, 22, 57, 62, 29, 58, 63, 30,
        59, 66, 23, 41, 15, 64, 65, 69, 31, 42, 46, 48, 50, 53, 55, 60,
        71, 73, 75, 43, 44, 45, 47, 49, 51, 52, 54, 56, 61, 67, 68, 70,
        72, 74, 76, 77
      ),
      c(
        0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
        13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28,
        29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44,
        45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60,
        61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76,
        77
      ),
      c(
        0, 0, 1, 3, 6, 7, 8, 11, 15, 17, 18, 21, 22, 24, 28, 28,
        28, 30, 32, 32, 34, 34, 36, 36, 36, 36, 38, 38, 41, 42, 44, 46,
        50, 61, 78
      ),
      c(
        0, 16, 24, 32, 35, 37, 40, 41, 41, 44, 45, 45,
        45, 45, 46, 48, 50, 50, 50, 52, 53, 55, 55, 57, 62, 65, 66, 68,
        69, 71, 73, 75, 77, 78, 78
      ),
      list(
        c(1, 0, 1),
        structure(
          list(
            name = "Zachary's karate club network",
            Citation = "Wayne W. Zachary. An Information Flow Model for Conflict and Fission in Small Groups. Journal of Anthropological Research Vol. 33, No. 4 452-473",
            Author = "Wayne W. Zachary"
          ),
          names = c("name", "Citation", "Author")
        ),
        structure(
          list(
            Faction = c(
              1, 1, 1, 1, 1, 1, 1, 1,
              2, 2, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2,
              2, 2, 2, 2, 2
            ),
            name = karate_oldstyle_names()
          ),
          names = c("Faction", "name")
        ),
        structure(
          list(
            weight = c(
              4,
              5, 3, 3, 3, 3, 2, 2, 2, 3, 1, 3, 2, 2, 2, 2, 6, 3, 4, 5, 1, 2,
              2, 2, 3, 4, 5, 1, 3, 2, 2, 2, 3, 3, 3, 2, 3, 5, 3, 3, 3, 3, 3,
              4, 2, 3, 3, 2, 3, 4, 1, 2, 1, 3, 1, 2, 3, 5, 4, 3, 5, 4, 2, 3,
              2, 7, 4, 2, 4, 2, 2, 4, 2, 3, 3, 4, 4, 5
            )
          ),
          names = "weight"
        )
      )
    ),
    class = "igraph"
  )
}

# ---- test-cliques.R ---------------------------------------------------------

# Shared fixture: a triangle plus a disjoint edge.
# The `weight` vertex attribute favors the edge,
# an explicit weight vector can flip the result to the triangle.
make_weighted_clique_graph <- function() {
  g <- make_full_graph(3) %du% make_full_graph(2)
  V(g)$weight <- c(1, 1, 1, 4, 4)
  g
}

# ---- test-decomposition.R ---------------------------------------------------

# The first example graph from the Tarjan-Yannakakis paper.
tarjan_yannakakis_graph <- function() {
  graph_from_literal(
    A - B:C:I, B - A:C:D, C - A:B:E:H, D - B:E:F,
    E - C:D:F:H, F - D:E:G, G - F:H, H - C:E:G:I,
    I - A:H
  )
}

# ---- test-generate-migrations.R ---------------------------------------------

# Source the ellipsis-migration generator into a fresh environment and return
# it. The generator only exists in a source checkout (tools/ is
# .Rbuildignore'd), so the caller is skipped when it is missing.
local_generator <- function(env = parent.frame()) {
  generator <- testthat::test_path("..", "..", "tools", "generate-migrations.R")
  skip_if_not(file.exists(generator), "tools/generate-migrations.R not found")
  gen_env <- new.env()
  sys.source(generator, envir = gen_env)
  gen_env
}

# Write a throw-away registry file and return its path.
write_registry <- function(dir, name, code) {
  path <- file.path(dir, name)
  writeLines(code, path)
  path
}

# ---- test-hrg.R -------------------------------------------------------------

# A compact shared fixture: a tiny two-clique graph and one HRG fitted to it,
# reused by the consensus_tree() and predict_edges() blocks.
# Fitting a real HRG is the awkward part of constructing valid inputs there.
hrg_fixture <- function() {
  g <- make_full_graph(4) + make_full_graph(4)
  igraph_with_seed(1, list(graph = g, hrg = fit_hrg(g)))
}
