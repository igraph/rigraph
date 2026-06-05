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

# ---------------------------------------------------------------------------
# Group #5 - vertex/edge sequence construction on named graphs
# Functions that return (many) vertex/edge sequences pay for building the
# `names`/`vnames` attribute and attaching a graph reference to every object.
# These benchmarks exercise that construction path on *named* graphs, where
# the cost is highest. `max_cliques()` is the canonical case: it returns tens
# of thousands of vertex sequences, one per clique.
# ---------------------------------------------------------------------------
benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_gnp(200L, 0.16, directed = FALSE)
    V(g)$name <- paste0("v", seq_len(gorder(g)))
  },
  max_cliques_named = max_cliques(g),
  n = 20
)

benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_gnm(1000L, 5000L)
    V(g)$name <- paste0("v", seq_len(1000L))
    es <- E(g)
  },
  head_of_named = head_of(g, es),
  n = 20
)

benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_gnm(20000L, 50000L)
    V(g)$name <- paste0("v", seq_len(20000L))
  },
  V_named = V(g),
  n = 20
)

benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_gnm(20000L, 50000L)
    V(g)$name <- paste0("v", seq_len(20000L))
  },
  E_named = E(g),
  n = 20
)

# ---------------------------------------------------------------------------
# Group #6 - what lazy names + batch construction buy
# These illustrate the three distinct wins on named graphs:
#   * batch construction of many vertex sequences (one shared graph reference
#     and one hoisted name source instead of per-object work);
#   * lazy names that are never paid for when only the IDs/sizes are used;
#   * O(1) lazy subsetting of a vertex sequence (ALTREP Extract_subset).
# ---------------------------------------------------------------------------

# ego() returns one vertex sequence per node -- a few thousand sequences built
# in one call. Exercises create_vs_list() through neighborhood().
benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_gnm(2000L, 10000L)
    V(g)$name <- paste0("v", seq_len(2000L))
  },
  ego_order2_named = ego(g, order = 2, nodes = V(g)),
  n = 20
)

# Construct many cliques but only read their sizes: with lazy names the name
# vectors are never materialized at all, so this is close to the numeric path.
benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_gnp(200L, 0.16, directed = FALSE)
    V(g)$name <- paste0("v", seq_len(gorder(g)))
  },
  max_cliques_sizes_named = lengths(max_cliques(g)),
  n = 20
)

# Enumerate simple paths between hubs on a named graph: another high-volume
# vertex-sequence-list path (create_vs_list via all_simple_paths()).
benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_gnm(500L, 2500L)
    V(g)$name <- paste0("v", seq_len(500L))
  },
  all_simple_paths_named = all_simple_paths(g, 1, 2:6, cutoff = 5),
  n = 20
)

# Positional subset of a large named vertex sequence. Subsetting a lazy-names
# sequence composes indices in O(1) (ALTREP Extract_subset) instead of copying
# a subset of the name vector.
benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_gnm(50000L, 100000L)
    V(g)$name <- paste0("v", seq_len(50000L))
    v <- V(g)
    pick <- sample(50000L, 10000L)
  },
  vs_subset_positional = v[pick],
  n = 20
)

# Create the artifacts consumed by the GitHub Action.
benchmark_analyze()
