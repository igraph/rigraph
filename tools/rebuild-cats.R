#!/usr/bin/env Rscript
# Rebuild tools/aaa-categories.yaml so every R_igraph_* symbol has a home.
#
# Source of truth: the set of R_igraph_* symbols `.Call()`'d in R/aaa-auto.R
# (or its per-category split R/aaa-<cat>.R replacements), with nine hand-
# written R-binding wrappers in src/rcallback.c mapped back to the underlying
# C function they call.

suppressPackageStartupMessages({
  library(yaml)
})

script_path <- (function() {
  args <- commandArgs(trailingOnly = FALSE)
  m <- grep("^--file=", args, value = TRUE)
  if (length(m)) sub("^--file=", "", m[1]) else "tools/rebuild-cats.R"
})()
REPO <- normalizePath(file.path(dirname(script_path), ".."))
CATS <- file.path(REPO, "tools", "aaa-categories.yaml")

# Canonical source of `.Call(R_igraph_*)` symbols: either the original
# monolithic R/aaa-auto.R (transitional / pre-split) or the set of per-category
# R/aaa-<cat>.R files produced by tools/split-aaa-auto.R.
AUTO_MONO <- file.path(REPO, "R", "aaa-auto.R")
AUTO_SPLIT <- list.files(
  file.path(REPO, "R"),
  pattern = "^aaa-.*\\.R$",
  full.names = TRUE
)
# Exclude aaa-auto.R from the split list so we never double-count during a
# transitional state where both exist.
AUTO_SPLIT <- AUTO_SPLIT[basename(AUTO_SPLIT) != "aaa-auto.R"]

AUTO <- if (file.exists(AUTO_MONO)) AUTO_MONO else AUTO_SPLIT
if (length(AUTO) == 0) {
  stop("No R/aaa-auto.R nor R/aaa-*.R files found — nothing to read.")
}

# ---- 1. Extract canonical list ---------------------------------------------

# Every _closure symbol that appears in aaa-auto.R wraps a C function of this
# name (verified from src/rcallback.c: each closure wrapper's body calls the
# mapped name). `igraph_transitive_closure` and `igraph_transitive_closure_dag`
# are unrelated graph-theory functions, not wrappers.
closure_map <- c(
  "igraph_bfs_closure"                                     = "igraph_bfs",
  "igraph_dfs_closure"                                     = "igraph_dfs",
  "igraph_cliques_callback_closure"                        = "igraph_cliques_callback",
  "igraph_maximal_cliques_callback_closure"                = "igraph_maximal_cliques_callback",
  "igraph_simple_cycles_callback_closure"                  = "igraph_simple_cycles_callback",
  "igraph_get_isomorphisms_vf2_callback_closure"           = "igraph_get_isomorphisms_vf2_callback",
  "igraph_get_subisomorphisms_vf2_callback_closure"        = "igraph_get_subisomorphisms_vf2_callback",
  "igraph_motifs_randesu_callback_closure"                 = "igraph_motifs_randesu_callback",
  "igraph_community_leading_eigenvector_callback_closure"  = "igraph_community_leading_eigenvector"
)

auto_lines <- unlist(lapply(AUTO, readLines))
raw <- unique(regmatches(
  auto_lines,
  regexpr("R_igraph_[a-z0-9_]+", auto_lines)
))
raw <- raw[nzchar(raw)]
raw <- sub("^R_", "", raw)

canonical <- unname(ifelse(raw %in% names(closure_map), closure_map[raw], raw))
canonical <- sort(unique(canonical))

message("canonical function count: ", length(canonical))


# ---- 2. Placements: authoritative (category, subcategory, fn) for every
#        function we're adding, moving, or splitting. Any fn listed here
#        overrides its current placement in cats.yml. Omitted fns keep
#        their current placement. -------------------------------------------

placements <- rbind(
  # --- Previously-new additions (from initial reconciliation) ---------------

  # basic-igraph / adding-and-deleting-vertices-and-edges
  c("basic-igraph", "adding-and-deleting-vertices-and-edges", "igraph_delete_vertices_idx"),

  # bipartite / create-two-mode-networks
  c("bipartite", "create-two-mode-networks", "igraph_bipartite_game"),

  # generators / regular-structure-generators  (typo fix; replaces removed igraph_lcf)
  c("generators", "regular-structure-generators", "igraph_lcf_vector"),

  # generators / adjacency-generators
  c("generators", "adjacency-generators", "igraph_weighted_sparsemat"),

  # motifs / graph-motifs
  c("motifs", "graph-motifs", "igraph_motifs_randesu_callback"),

  # visitors / random-walks
  c("visitors", "random-walks", "igraph_random_edge_walk"),

  # processes / evolutionary-dynamics
  c("processes", "evolutionary-dynamics", "igraph_deterministic_optimal_imitation"),
  c("processes", "evolutionary-dynamics", "igraph_moran_process"),
  c("processes", "evolutionary-dynamics", "igraph_roulette_wheel_imitation"),
  c("processes", "evolutionary-dynamics", "igraph_stochastic_imitation"),

  # games / random-vectors
  c("games", "random-vectors", "igraph_sample_dirichlet"),
  c("games", "random-vectors", "igraph_sample_sphere_surface"),
  c("games", "random-vectors", "igraph_sample_sphere_volume"),

  # nongraph / internal
  c("nongraph", "internal", "igraph_finalizer"),

  # --- Centrality / trees / basic-properties additions ---------------------

  c("centrality", "centrality-measures", "igraph_authority_score"),
  c("centrality", "centrality-measures", "igraph_hub_score"),
  c("trees", "spanning-trees-and-forests", "igraph_minimum_spanning_tree_prim"),
  c("trees", "spanning-trees-and-forests", "igraph_minimum_spanning_tree_unweighted"),
  c("structural", "basic-properties", "igraph_are_connected"),

  # --- Tier 1: retire `undocumented` into real subcategories ---------------

  c("flows",      "maximum-flows",       "igraph_residual_graph"),
  c("flows",      "maximum-flows",       "igraph_reverse_residual_graph"),
  c("hrg",        "hrg-sampling",        "igraph_hrg_sample_many"),
  c("nongraph",   "internal",            "igraph_has_attribute_table"),
  c("structural", "spectral-properties", "igraph_eigen_adjacency"),
  c("nongraph",   "linear-algebra",      "igraph_eigen_matrix"),
  c("nongraph",   "linear-algebra",      "igraph_eigen_matrix_symmetric"),
  c("nongraph",   "linear-algebra",      "igraph_solve_lsap"),

  # --- Tier 3: move transitive closures into operators ---------------------

  c("operators", "miscellaneous-operators", "igraph_transitive_closure"),
  c("operators", "miscellaneous-operators", "igraph_transitive_closure_dag"),

  # --- Tier 4a: split structural/shortest-path-related-functions, then
  #     promote the resulting subs into a new top-level `paths` category. -----

  # paths/distances-and-metrics: scalar/vector metrics over the graph
  c("paths", "distances-and-metrics", "igraph_average_path_length"),
  c("paths", "distances-and-metrics", "igraph_average_path_length_dijkstra"),
  c("paths", "distances-and-metrics", "igraph_diameter"),
  c("paths", "distances-and-metrics", "igraph_diameter_dijkstra"),
  c("paths", "distances-and-metrics", "igraph_distances"),
  c("paths", "distances-and-metrics", "igraph_distances_bellman_ford"),
  c("paths", "distances-and-metrics", "igraph_distances_cutoff"),
  c("paths", "distances-and-metrics", "igraph_distances_dijkstra"),
  c("paths", "distances-and-metrics", "igraph_distances_dijkstra_cutoff"),
  c("paths", "distances-and-metrics", "igraph_distances_floyd_warshall"),
  c("paths", "distances-and-metrics", "igraph_distances_johnson"),
  c("paths", "distances-and-metrics", "igraph_eccentricity"),
  c("paths", "distances-and-metrics", "igraph_eccentricity_dijkstra"),
  c("paths", "distances-and-metrics", "igraph_girth"),
  c("paths", "distances-and-metrics", "igraph_graph_center"),
  c("paths", "distances-and-metrics", "igraph_graph_center_dijkstra"),
  c("paths", "distances-and-metrics", "igraph_path_length_hist"),
  c("paths", "distances-and-metrics", "igraph_pseudo_diameter"),
  c("paths", "distances-and-metrics", "igraph_pseudo_diameter_dijkstra"),
  c("paths", "distances-and-metrics", "igraph_radius"),
  c("paths", "distances-and-metrics", "igraph_radius_dijkstra"),
  c("paths", "distances-and-metrics", "igraph_voronoi"),

  # paths/shortest-paths: functions returning actual path sequences
  c("paths", "shortest-paths", "igraph_get_all_shortest_paths"),
  c("paths", "shortest-paths", "igraph_get_all_shortest_paths_dijkstra"),
  c("paths", "shortest-paths", "igraph_get_all_simple_paths"),
  c("paths", "shortest-paths", "igraph_get_k_shortest_paths"),
  c("paths", "shortest-paths", "igraph_get_shortest_path"),
  c("paths", "shortest-paths", "igraph_get_shortest_path_astar"),
  c("paths", "shortest-paths", "igraph_get_shortest_path_bellman_ford"),
  c("paths", "shortest-paths", "igraph_get_shortest_path_dijkstra"),
  c("paths", "shortest-paths", "igraph_get_shortest_paths"),
  c("paths", "shortest-paths", "igraph_get_shortest_paths_bellman_ford"),
  c("paths", "shortest-paths", "igraph_get_shortest_paths_dijkstra"),
  c("paths", "shortest-paths", "igraph_vertex_path_from_edge_path"),

  # --- Tier 4b: split structural/other-operations --------------------------

  c("structural", "matrix-representations", "igraph_get_adjacency"),
  c("structural", "matrix-representations", "igraph_get_adjacency_sparse"),
  c("structural", "matrix-representations", "igraph_get_edgelist"),
  c("structural", "matrix-representations", "igraph_get_stochastic"),
  c("structural", "matrix-representations", "igraph_get_stochastic_sparse"),

  c("structural", "mutual-edges", "igraph_has_mutual"),
  c("structural", "mutual-edges", "igraph_is_mutual"),
  c("structural", "mutual-edges", "igraph_reciprocity"),

  c("structural", "summary-statistics", "igraph_density"),
  c("structural", "summary-statistics", "igraph_diversity"),
  c("structural", "summary-statistics", "igraph_mean_degree")
)
colnames(placements) <- c("category", "subcategory", "fn")
placements <- as.data.frame(placements, stringsAsFactors = FALSE)

# ---- 2b. Subcategory renames: applied before placements -----------------
# Each entry: list(category, old, new). If `new` has length > 1 it's a split:
# the old subcategory is replaced by the listed new ones (functions are
# redistributed via the placements table; this just preserves ordering).

subcategory_renames <- list(
  list(
    category = "generators",
    old = "regular-structre-generators",
    new = "regular-structure-generators"
  ),
  list(category = "structural", old = "Sparsifiers", new = "sparsifiers"),
  list(category = "motifs", old = "uncategorized", new = "graph-census"),
  list(
    category = "structural",
    old = "shortest-path-related-functions",
    new = c("distances-and-metrics", "shortest-paths")
  ),
  list(
    category = "structural",
    old = "other-operations",
    new = c("matrix-representations", "mutual-edges", "summary-statistics")
  ),
  # Cosmetic rename ahead of moving into the new top-level `trees` category
  list(
    category = "structural",
    old = "trees",
    new = "spanning-trees-and-forests"
  )
)

# ---- 2bb. Top-level category moves: relocate whole (cat, sub) groups
#         into a new top-level category. Applied AFTER subcategory_renames
#         on the flattened table; subcategory names are preserved unless
#         a rename above already changed them.
category_moves <- list(
  list(
    from = "structural",
    subs = c(
      "centrality-measures",
      "centralization",
      "range-limited-centrality-measures",
      "subset-limited-centrality-measures"
    ),
    to = "centrality"
  ),
  list(
    from = "structural",
    subs = c(
      "distances-and-metrics",
      "shortest-paths",
      "widest-path-related-functions"
    ),
    to = "paths"
  ),
  list(
    from = "structural",
    subs = c("spanning-trees-and-forests", "unfolding-a-graph-into-a-tree"),
    to = "trees"
  )
)

# ---- 2c. Explicit subcategory ordering for categories whose natural order
#        has been scrambled by splits. Only needed where the position of
#        a split's new subs matters and can't be inferred from the input
#        YAML (e.g. after the split has already been applied once).
subcategory_order_overrides <- list(
  structural = c(
    "basic-properties",
    "degree-sequences",
    "directedness-conversion",
    "efficiency-measures",
    "graph-components",
    "k-cores",
    "matchings",
    "matrix-representations",
    "maximum-cardinality-search-chordal-graphs",
    "mixing-patterns",
    "mutual-edges",
    "neighborhood-of-a-vertex",
    "non-simple-graphs-multiple-and-loop-edges",
    "percolation",
    "pre-calculated-subsets",
    "similarity-measures",
    "sparsifiers",
    "spectral-properties",
    "summary-statistics",
    "them-statistics",
    "transitivity-or-clustering-coefficient",
    "us-statistics"
  ),
  centrality = c(
    "centrality-measures",
    "centralization",
    "range-limited-centrality-measures",
    "subset-limited-centrality-measures"
  ),
  paths = c(
    "distances-and-metrics",
    "shortest-paths",
    "widest-path-related-functions"
  ),
  trees = c(
    "spanning-trees-and-forests",
    "unfolding-a-graph-into-a-tree"
  )
)

# ---- 3. Truly stale entries to remove --------------------------------------

stale_to_remove <- c(
  "igraph_automorphism_group_bliss",
  "igraph_canonical_permutation_bliss",
  "igraph_count_automorphisms_bliss",
  "igraph_bipartite_iea_game",
  "igraph_iea_game",
  "igraph_community_leiden_simple",
  "igraph_delete_vertices_map",
  "igraph_hamming",
  "igraph_lcf",
  "igraph_weighted_biadjacency",
  "igraph_beta_weighted_gabriel_graph",
  "igraph_circle_beta_skeleton",
  "igraph_delaunay_graph",
  "igraph_gabriel_graph",
  "igraph_lune_beta_skeleton",
  "igraph_nearest_neighbor_graph",
  "igraph_relative_neighborhood_graph",
  "igraph_spatial_edge_lengths"
)

# ---- 4. Load current cats.yml and build the working structure --------------

d <- yaml::read_yaml(CATS)

# Flatten to a table: (category, subcategory, fn)
flatten_cats <- function(d) {
  rows <- list()
  for (cat in names(d)) {
    node <- d[[cat]]
    if (is.null(node)) {
      next
    }
    if (is.character(node)) {
      # direct list under category
      for (fn in node) {
        rows[[length(rows) + 1]] <- c(cat, NA_character_, fn)
      }
    } else if (is.list(node)) {
      for (sub in names(node)) {
        fns <- node[[sub]]
        for (fn in fns) {
          rows[[length(rows) + 1]] <- c(cat, sub, fn)
        }
      }
    }
  }
  df <- do.call(rbind, rows)
  colnames(df) <- c("category", "subcategory", "fn")
  as.data.frame(df, stringsAsFactors = FALSE)
}

tbl <- flatten_cats(d)

# Remove stale entries
tbl <- tbl[!tbl$fn %in% stale_to_remove, ]

# Apply 1:1 subcategory renames on the flattened table. Splits (length>1) are
# handled entirely by placements, which reassign each function explicitly.
for (r in subcategory_renames) {
  if (length(r$new) != 1) {
    next
  }
  m <- tbl$category == r$category &
    !is.na(tbl$subcategory) &
    tbl$subcategory == r$old
  tbl$subcategory[m] <- r$new
}

# Apply category_moves: relocate (cat, sub) groups to a new top-level category.
for (mv in category_moves) {
  m <- tbl$category == mv$from &
    !is.na(tbl$subcategory) &
    tbl$subcategory %in% mv$subs
  tbl$category[m] <- mv$to
}

# Drop rows whose fn is being moved/added — placements will reintroduce them
tbl <- tbl[!tbl$fn %in% placements$fn, ]

# Append placements
tbl <- rbind(tbl, placements)

# ---- 6. Validate ------------------------------------------------------------
# Missing fns (in the generated wrappers but not in cats.yml) are appended to a
# top-level `uncategorized:` flat list and warned about — this keeps the YAML in
# sync with upstream Stimulus additions without erroring. Extra fns (in cats.yml
# but not in the wrappers) are warned about too, but left in place so a human
# can decide whether to move them into `stale_to_remove`.

have <- sort(unique(tbl$fn))
missing <- setdiff(canonical, have)
extra <- setdiff(have, canonical)

if (length(missing)) {
  warning(
    "Missing from cats.yml — added under top-level `uncategorized:` flat list:\n  ",
    paste(missing, collapse = "\n  "),
    "\nMove these to a real (category, subcategory) in tools/rebuild-cats.R.",
    call. = FALSE
  )
  tbl <- rbind(
    tbl,
    data.frame(
      category = "uncategorized",
      subcategory = NA_character_,
      fn = missing,
      stringsAsFactors = FALSE
    )
  )
}
if (length(extra)) {
  warning(
    "Extra entries in cats.yml with no matching wrapper:\n  ",
    paste(extra, collapse = "\n  "),
    "\nRemove them from tools/aaa-categories.yaml or add to `stale_to_remove`.",
    call. = FALSE
  )
}

# ---- 7. Emit YAML -----------------------------------------------------------

# Preserve original category ordering, and within each category, the original
# subcategory ordering plus new subcategories at the end. Functions within a
# subcategory are sorted for stability.

orig_cat_order <- names(d)
orig_sub_order <- lapply(orig_cat_order, function(cat) {
  node <- d[[cat]]
  if (is.list(node) && !is.null(names(node))) names(node) else character()
})
names(orig_sub_order) <- orig_cat_order

# Apply renames to orig ordering so renamed / split subs keep their original
# position (splits expand into their new names at the same slot)
for (r in subcategory_renames) {
  prev <- orig_sub_order[[r$category]]
  if (is.null(prev)) {
    next
  }
  idx <- which(prev == r$old)
  if (length(idx) == 0) {
    next
  }
  orig_sub_order[[r$category]] <- append(
    prev[-idx],
    r$new,
    after = idx - 1
  )
}

cats_present <- unique(tbl$category)
cat_order <- c(intersect(orig_cat_order, cats_present),
               setdiff(cats_present, orig_cat_order))

lines <- character()
lines <- c(lines, "# Functions ordered by category")
for (cat in cat_order) {
  lines <- c(lines, paste0(cat, ":"))
  sub_tbl <- tbl[tbl$category == cat, ]
  subs_present <- unique(sub_tbl$subcategory)
  override <- subcategory_order_overrides[[cat]]
  prev <- if (!is.null(override)) override else orig_sub_order[[cat]]
  if (is.null(prev)) {
    prev <- character()
  }
  sub_order <- c(intersect(prev, subs_present), setdiff(subs_present, prev))

  # Handle direct-list entries (NA subcategory) -- emit them first, at category level
  direct <- sub_tbl$fn[is.na(sub_tbl$subcategory)]
  if (length(direct)) {
    for (fn in sort(direct)) {
      lines <- c(lines, paste0("  - ", fn))
    }
  }
  for (sub in sub_order) {
    if (is.na(sub)) {
      next
    }
    fns <- sort(sub_tbl$fn[
      !is.na(sub_tbl$subcategory) & sub_tbl$subcategory == sub
    ])
    lines <- c(lines, paste0("  ", sub, ":"))
    for (fn in fns) {
      lines <- c(lines, paste0("    - ", fn))
    }
  }
  lines <- c(lines, "")
}

writeLines(lines, CATS)
message(
  "wrote ",
  CATS,
  " with ",
  nrow(tbl),
  " entries across ",
  length(cat_order),
  " categories"
)
