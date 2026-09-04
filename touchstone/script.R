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
# ---------------------------------------------------------------------------
# How touchstone measures, and what that forces on us
# ---------------------------------------------------------------------------
# touchstone runs *every* data point in a fresh `callr::r()` subprocess and
# hard-codes `bench::mark(..., iterations = 1)`. One data point is therefore a
# single, completely cold call. Two consequences drive the shape of this file:
#
# 1. WARM UP IN THE SETUP BLOCK. A cold call pays for R's JIT compiling the
#    whole call path, for the igraph lazy-load database being faulted in, for
#    Matrix's S4 method tables being built on first dispatch (~300 ms!), and for
#    lifecycle's first `deprecate_warn()` (~11 ms). Those costs are one to three
#    orders of magnitude larger than the R code we want to measure, and they do
#    not respond to changes under `R/`, so leaving them in the measurement both
#    hides real regressions and invents fake ones. Every setup block below runs
#    the benchmarked expression a few times and then calls `gc()`, so the
#    measured region starts warm and from a comparable heap.
#
# 2. REPEAT INSIDE THE MEASURED EXPRESSION. A single warm call here takes
#    0.07-1.5 ms, far too short to time reliably across processes. Each measured
#    expression is a `for` loop with a fixed repeat count chosen so the measured
#    region lands around 100 ms.
#
#    The repeat counts MUST stay literal constants. Calibrating them at runtime
#    would let base and head measure a different number of calls, which biases
#    the comparison outright.
#
# Each benchmark is fully self-contained: the subprocess only sees its own
# `expr_before_benchmark` and the benchmarked expression -- top-level variables
# defined in this script are NOT visible there. So each setup block rebuilds its
# input graph from scratch (~1000 vertices / ~5000 edges). A fixed seed makes
# the inputs identical on the base and head branches, and the setup cost is
# excluded from the measured time.

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
    for (i in 1:5) {
      graph_from_data_frame(edges, vertices = verts)
    }
    gc(full = TRUE)
  },
  graph_from_data_frame = for (i in 1:150) {
    graph_from_data_frame(edges, vertices = verts)
  },
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
    for (i in 1:5) {
      as_long_data_frame(g)
    }
    gc(full = TRUE)
  },
  as_long_data_frame = for (i in 1:70) {
    as_long_data_frame(g)
  },
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
    for (i in 1:5) {
      as_data_frame(g, what = "both")
    }
    gc(full = TRUE)
  },
  as_data_frame_both = for (i in 1:370) {
    as_data_frame(g, what = "both")
  },
  n = 20
)

# ---------------------------------------------------------------------------
# Group #3 - adjacency matrix round-trip
# as_adjacency_matrix() / graph_from_adjacency_matrix(): Matrix tril/triu/t/
# drop0, summary(), and edge-count expansion via rep().
#
# These pass `weights=`, not the deprecated `attr=`. `attr=` routes through
# lifecycle::deprecate_warn(), which costs ~11 ms the first time it fires in a
# process -- i.e. more than 10x the work being benchmarked, on every single
# data point, since every data point is a fresh process.
# ---------------------------------------------------------------------------
benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_gnm(1000L, 5000L)
    E(g)$weight <- runif(5000L)
    for (i in 1:5) {
      as_adjacency_matrix(g, weights = "weight")
    }
    gc(full = TRUE)
  },
  as_adjacency_matrix = for (i in 1:180) {
    as_adjacency_matrix(g, weights = "weight")
  },
  n = 20
)

benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_gnm(1000L, 5000L)
    E(g)$weight <- runif(5000L)
    m <- as_adjacency_matrix(g, weights = "weight")
    for (i in 1:5) {
      graph_from_adjacency_matrix(m, mode = "undirected", weighted = TRUE)
    }
    gc(full = TRUE)
  },
  graph_from_adjacency_matrix = for (i in 1:160) {
    graph_from_adjacency_matrix(m, mode = "undirected", weighted = TRUE)
  },
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
    for (i in 1:5) {
      as_biadjacency_matrix(g, weights = "weight", sparse = TRUE)
    }
    gc(full = TRUE)
  },
  as_biadjacency_matrix = for (i in 1:230) {
    as_biadjacency_matrix(g, weights = "weight", sparse = TRUE)
  },
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
    for (i in 1:5) {
      V(g)[color == "red"]
    }
    gc(full = TRUE)
  },
  vs_attr_filter = for (i in 1:750) {
    V(g)[color == "red"]
  },
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
    for (i in 1:5) {
      E(g)[weight > 0.5]
    }
    gc(full = TRUE)
  },
  es_attr_filter = for (i in 1:120) {
    E(g)[weight > 0.5]
  },
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
    for (i in 1:5) {
      V(g)[pick]
    }
    gc(full = TRUE)
  },
  vs_by_name = for (i in 1:1410) {
    V(g)[pick]
  },
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
    for (i in 1:2) {
      max_cliques(g)
    }
    gc(full = TRUE)
  },
  max_cliques_named = for (i in 1:4) {
    max_cliques(g)
  },
  n = 20
)

benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_gnm(1000L, 5000L)
    V(g)$name <- paste0("v", seq_len(1000L))
    es <- E(g)
    for (i in 1:5) {
      head_of(g, es)
    }
    gc(full = TRUE)
  },
  head_of_named = for (i in 1:320) {
    head_of(g, es)
  },
  n = 20
)

benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_gnm(20000L, 50000L)
    V(g)$name <- paste0("v", seq_len(20000L))
    for (i in 1:5) {
      V(g)
    }
    gc(full = TRUE)
  },
  V_named = for (i in 1:2700) {
    V(g)
  },
  n = 20
)

benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_gnm(20000L, 50000L)
    V(g)$name <- paste0("v", seq_len(20000L))
    for (i in 1:2) {
      E(g)
    }
    gc(full = TRUE)
  },
  E_named = for (i in 1:15) {
    E(g)
  },
  n = 20
)

# ---------------------------------------------------------------------------
# Group #6 - batch construction of many vertex sequences
# One shared graph reference and one hoisted name source, with the whole
# per-element loop in C, instead of per-object R work. These two calls each
# return thousands of vertex sequences from a single C core call.
# ---------------------------------------------------------------------------

# ego() returns one vertex sequence per node -- a few thousand sequences built
# in one call. Exercises create_vs_list() through neighborhood().
benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_gnm(2000L, 10000L)
    V(g)$name <- paste0("v", seq_len(2000L))
    for (i in 1:2) {
      ego(g, order = 2, nodes = V(g))
    }
    gc(full = TRUE)
  },
  ego_order2_named = for (i in 1:16) {
    ego(g, order = 2, nodes = V(g))
  },
  n = 20
)

# Enumerate simple paths between hubs on a named graph: another high-volume
# vertex-sequence-list path (create_vs_list() via all_simple_paths()).
benchmark_run(
  expr_before_benchmark = {
    library(igraph)
    set.seed(42)
    g <- sample_gnm(500L, 2500L)
    V(g)$name <- paste0("v", seq_len(500L))
    for (i in 1:2) {
      all_simple_paths(g, 1, 2:6, cutoff = 5)
    }
    gc(full = TRUE)
  },
  all_simple_paths_named = for (i in 1:33) {
    all_simple_paths(g, 1, 2:6, cutoff = 5)
  },
  n = 20
)

# Create the artifacts consumed by the GitHub Action.
benchmark_analyze()
