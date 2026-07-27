# Touchstone benchmarks for igraph.
#
# See `help(run_script, package = "touchstone")` on how to run this
# interactively.
#
# These benchmarks deliberately target functions whose runtime is dominated by
# *R* code (name resolution via match(), data.frame assembly, attribute loops,
# Matrix manipulation, rlang quosure evaluation), not thin wrappers around the
# vendored C core. The CI workflow only triggers on `R/**` changes, so the C
# library performance is intentionally out of scope here.
#
# Each benchmark is fully self-contained: touchstone evaluates every iteration
# in a fresh subprocess that only sees its own `expr_before_benchmark` and the
# benchmarked expression -- top-level variables defined in this script are NOT
# visible there. So each setup block rebuilds its input graph from scratch
# (~1000 vertices / ~5000 edges). A fixed seed makes the inputs identical on the
# base and head branches, and the setup cost is excluded from the measured time.

library(touchstone)

# Install the head and base branches into separate libraries.
branch_install()

# ---------------------------------------------------------------------------
# Group #1 - construction from a data frame
# graph_from_data_frame(): unique(), double match() for name -> id, NA checks,
# and per-column vertex/edge attribute loops.
# ---------------------------------------------------------------------------
benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    nm <- paste0("v", seq_len(1000L))
    edges <- data.frame(
      from = sample(nm, 5000L, replace = TRUE),
      to = sample(nm, 5000L, replace = TRUE),
      weight = runif(5000L),
      type = sample(letters[1:5], 5000L, replace = TRUE),
      stringsAsFactors = FALSE
    )
    verts <- data.frame(
      name = nm,
      color = sample(c("red", "blue"), 1000L, replace = TRUE),
      value = runif(1000L),
      stringsAsFactors = FALSE
    )
  },
  graph_from_data_frame = graph_from_data_frame(edges, vertices = verts),
  n = 20
)

# ---------------------------------------------------------------------------
# Group #2 - conversion back to data frames
# as_long_data_frame(): builds two data frames and index-joins vertex
# attributes onto edges. as_data_frame(what = "both"): assembles both frames.
# ---------------------------------------------------------------------------
benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_gnm(1000L, 5000L)
    V(g)$name <- paste0("v", seq_len(1000L))
    V(g)$color <- sample(c("red", "blue"), 1000L, replace = TRUE)
    E(g)$weight <- runif(5000L)
    E(g)$type <- sample(letters[1:5], 5000L, replace = TRUE)
  },
  as_long_data_frame = as_long_data_frame(g),
  n = 20
)

benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_gnm(1000L, 5000L)
    V(g)$name <- paste0("v", seq_len(1000L))
    V(g)$color <- sample(c("red", "blue"), 1000L, replace = TRUE)
    E(g)$weight <- runif(5000L)
    E(g)$type <- sample(letters[1:5], 5000L, replace = TRUE)
  },
  as_data_frame_both = as_data_frame(g, what = "both"),
  n = 20
)

# ---------------------------------------------------------------------------
# Group #3 - adjacency matrix round-trip
# as_adjacency_matrix() / graph_from_adjacency_matrix(): Matrix tril/triu/t/
# drop0, summary(), and edge-count expansion via rep().
# ---------------------------------------------------------------------------
benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_gnm(1000L, 5000L)
    E(g)$weight <- runif(5000L)
  },
  as_adjacency_matrix = as_adjacency_matrix(g, attr = "weight"),
  n = 20
)

benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_gnm(1000L, 5000L)
    E(g)$weight <- runif(5000L)
    m <- as_adjacency_matrix(g, attr = "weight")
  },
  graph_from_adjacency_matrix = graph_from_adjacency_matrix(
    m,
    mode = "undirected",
    weighted = TRUE
  ),
  n = 20
)

# as_biadjacency_matrix(): the sparse branch (get.incidence.sparse) builds a
# recode vector, swaps edge columns, boolean-filters by vertex type, and feeds
# Matrix::spMatrix(). Needs a bipartite graph (boolean `type` attribute).
benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_bipartite_gnm(500L, 500L, m = 5000L)
    E(g)$weight <- runif(5000L)
  },
  as_biadjacency_matrix = as_biadjacency_matrix(
    g,
    attr = "weight",
    sparse = TRUE
  ),
  n = 20
)

# ---------------------------------------------------------------------------
# Group #4 - vertex/edge sequence indexing
# `[.igraph.vs` / `[.igraph.es`: rlang enquos()/eval_tidy() data masks for
# attribute predicates, and match()-based name resolution.
# ---------------------------------------------------------------------------
benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_gnm(1000L, 5000L)
    V(g)$name <- paste0("v", seq_len(1000L))
    V(g)$color <- sample(c("red", "blue", "green"), 1000L, replace = TRUE)
    E(g)$weight <- runif(5000L)
  },
  vs_attr_filter = V(g)[color == "red"],
  n = 20
)

benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_gnm(1000L, 5000L)
    V(g)$name <- paste0("v", seq_len(1000L))
    V(g)$color <- sample(c("red", "blue", "green"), 1000L, replace = TRUE)
    E(g)$weight <- runif(5000L)
  },
  es_attr_filter = E(g)[weight > 0.5],
  n = 20
)

benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_gnm(1000L, 5000L)
    V(g)$name <- paste0("v", seq_len(1000L))
    V(g)$color <- sample(c("red", "blue", "green"), 1000L, replace = TRUE)
    E(g)$weight <- runif(5000L)
    pick <- sample(V(g)$name, 200)
  },
  vs_by_name = V(g)[pick],
  n = 20
)

# Create the artifacts consumed by the GitHub Action.
benchmark_analyze()
