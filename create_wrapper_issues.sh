#!/bin/bash
# Script to create GitHub issues for replacing _impl function aliases with explicit wrappers
# Run this script after: git fetch --unshallow

gh issue create --title "Replace `assortativity_nominal` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`assortativity_nominal <- assortativity_nominal_impl\` in \`R/assortativity.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
assortativity_nominal <- assortativity_nominal_impl
\`\`\`

**Desired Pattern**
\`\`\`r
assortativity_nominal <- function(graph, types, directed = TRUE, normalized = TRUE) {
  assortativity_nominal_impl(
    graph = graph,
    types = types,
    directed = directed,
    normalized = normalized
  )
}
\`\`\`

**File**
\`R/assortativity.R\`"

gh issue create --title "Replace `assortativity_degree` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`assortativity_degree <- assortativity_degree_impl\` in \`R/assortativity.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
assortativity_degree <- assortativity_degree_impl
\`\`\`

**Desired Pattern**
\`\`\`r
assortativity_degree <- function(graph, directed = TRUE) {
  assortativity_degree_impl(
    graph = graph,
    directed = directed
  )
}
\`\`\`

**File**
\`R/assortativity.R\`"

gh issue create --title "Replace `bipartite_projection_size` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`bipartite_projection_size <- bipartite_projection_size_impl\` in \`R/bipartite.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
bipartite_projection_size <- bipartite_projection_size_impl
\`\`\`

**Desired Pattern**
\`\`\`r
bipartite_projection_size <- function(graph) {
  bipartite_projection_size_impl(
    graph = graph
  )
}
\`\`\`

**File**
\`R/bipartite.R\`"

gh issue create --title "Replace `bipartite_mapping` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`bipartite_mapping <- is_bipartite_impl\` in \`R/bipartite.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
bipartite_mapping <- is_bipartite_impl
\`\`\`

**Desired Pattern**
\`\`\`r
bipartite_mapping <- function(graph) {
  is_bipartite_impl(
    graph = graph
  )
}
\`\`\`

**File**
\`R/bipartite.R\`"

gh issue create --title "Replace `strength` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`strength <- strength_impl\` in \`R/centrality.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
strength <- strength_impl
\`\`\`

**Desired Pattern**
\`\`\`r
strength <- function(graph, vids = V(graph), mode = c("all", "out", "in", "total"), loops = TRUE, weights = NULL) {
  strength_impl(
    graph = graph,
    vids = vids,
    mode = mode,
    loops = loops,
    weights = weights
  )
}
\`\`\`

**File**
\`R/centrality.R\`"

gh issue create --title "Replace `diversity` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`diversity <- diversity_impl\` in \`R/centrality.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
diversity <- diversity_impl
\`\`\`

**Desired Pattern**
\`\`\`r
diversity <- function(graph, vids = V(graph), weights = NULL) {
  diversity_impl(
    graph = graph,
    vids = vids,
    weights = weights
  )
}
\`\`\`

**File**
\`R/centrality.R\`"

gh issue create --title "Replace `page_rank` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`page_rank <- personalized_pagerank_impl\` in \`R/centrality.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
page_rank <- personalized_pagerank_impl
\`\`\`

**Desired Pattern**
\`\`\`r
page_rank <- function(graph, algo = c("prpack", "arpack"), vids = V(graph), directed = TRUE, damping = 0.85, personalized = NULL, weights = NULL, options = NULL) {
  personalized_pagerank_impl(
    graph = graph,
    algo = algo,
    vids = vids,
    directed = directed,
    damping = damping,
    personalized = personalized,
    weights = weights,
    options = options
  )
}
\`\`\`

**File**
\`R/centrality.R\`"

gh issue create --title "Replace `harmonic_centrality` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`harmonic_centrality <- harmonic_centrality_cutoff_impl\` in \`R/centrality.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
harmonic_centrality <- harmonic_centrality_cutoff_impl
\`\`\`

**Desired Pattern**
\`\`\`r
harmonic_centrality <- function(graph, vids = V(graph), mode = c("out", "in", "all", "total"), weights = NULL, cutoff = -1) {
  harmonic_centrality_cutoff_impl(
    graph = graph,
    vids = vids,
    mode = mode,
    weights = weights,
    cutoff = cutoff
  )
}
\`\`\`

**File**
\`R/centrality.R\`"

gh issue create --title "Replace `centralize` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`centralize <- centralization_impl\` in \`R/centralization.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
centralize <- centralization_impl
\`\`\`

**Desired Pattern**
\`\`\`r
centralize <- function(scores, theoretical.max, normalized = TRUE) {
  centralization_impl(
    scores = scores,
    theoretical.max = theoretical.max,
    normalized = normalized
  )
}
\`\`\`

**File**
\`R/centralization.R\`"

gh issue create --title "Replace `centr_degree` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`centr_degree <- centralization_degree_impl\` in \`R/centralization.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
centr_degree <- centralization_degree_impl
\`\`\`

**Desired Pattern**
\`\`\`r
centr_degree <- function(graph, mode = c("all", "out", "in", "total"), loops = TRUE, normalized = TRUE) {
  centralization_degree_impl(
    graph = graph,
    mode = mode,
    loops = loops,
    normalized = normalized
  )
}
\`\`\`

**File**
\`R/centralization.R\`"

gh issue create --title "Replace `centr_betw_tmax` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`centr_betw_tmax <- centralization_betweenness_tmax_impl\` in \`R/centralization.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
centr_betw_tmax <- centralization_betweenness_tmax_impl
\`\`\`

**Desired Pattern**
\`\`\`r
centr_betw_tmax <- function(graph, directed = TRUE) {
  centralization_betweenness_tmax_impl(
    graph = graph,
    directed = directed
  )
}
\`\`\`

**File**
\`R/centralization.R\`"

gh issue create --title "Replace `centr_clo` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`centr_clo <- centralization_closeness_impl\` in \`R/centralization.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
centr_clo <- centralization_closeness_impl
\`\`\`

**Desired Pattern**
\`\`\`r
centr_clo <- function(graph, mode = c("out", "in", "all", "total"), normalized = TRUE) {
  centralization_closeness_impl(
    graph = graph,
    mode = mode,
    normalized = normalized
  )
}
\`\`\`

**File**
\`R/centralization.R\`"

gh issue create --title "Replace `centr_clo_tmax` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`centr_clo_tmax <- centralization_closeness_tmax_impl\` in \`R/centralization.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
centr_clo_tmax <- centralization_closeness_tmax_impl
\`\`\`

**Desired Pattern**
\`\`\`r
centr_clo_tmax <- function(graph, mode = c("out", "in", "all", "total")) {
  centralization_closeness_tmax_impl(
    graph = graph,
    mode = mode
  )
}
\`\`\`

**File**
\`R/centralization.R\`"

gh issue create --title "Replace `cliques` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`cliques <- cliques_impl\` in \`R/cliques.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
cliques <- cliques_impl
\`\`\`

**Desired Pattern**
\`\`\`r
cliques <- function(graph, min = 0, max = 0) {
  cliques_impl(
    graph = graph,
    min = min,
    max = max
  )
}
\`\`\`

**File**
\`R/cliques.R\`"

gh issue create --title "Replace `largest_cliques` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`largest_cliques <- largest_cliques_impl\` in \`R/cliques.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
largest_cliques <- largest_cliques_impl
\`\`\`

**Desired Pattern**
\`\`\`r
largest_cliques <- function(graph) {
  largest_cliques_impl(
    graph = graph
  )
}
\`\`\`

**File**
\`R/cliques.R\`"

gh issue create --title "Replace `clique_num` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`clique_num <- clique_number_impl\` in \`R/cliques.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
clique_num <- clique_number_impl
\`\`\`

**Desired Pattern**
\`\`\`r
clique_num <- function(graph) {
  clique_number_impl(
    graph = graph
  )
}
\`\`\`

**File**
\`R/cliques.R\`"

gh issue create --title "Replace `weighted_cliques` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`weighted_cliques <- weighted_cliques_impl\` in \`R/cliques.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
weighted_cliques <- weighted_cliques_impl
\`\`\`

**Desired Pattern**
\`\`\`r
weighted_cliques <- function(graph, vertex.weights = NULL, min.weight = 0, max.weight = 0, maximal = FALSE) {
  weighted_cliques_impl(
    graph = graph,
    vertex.weights = vertex.weights,
    min.weight = min.weight,
    max.weight = max.weight,
    maximal = maximal
  )
}
\`\`\`

**File**
\`R/cliques.R\`"

gh issue create --title "Replace `largest_weighted_cliques` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`largest_weighted_cliques <- largest_weighted_cliques_impl\` in \`R/cliques.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
largest_weighted_cliques <- largest_weighted_cliques_impl
\`\`\`

**Desired Pattern**
\`\`\`r
largest_weighted_cliques <- function(graph, vertex.weights = NULL) {
  largest_weighted_cliques_impl(
    graph = graph,
    vertex.weights = vertex.weights
  )
}
\`\`\`

**File**
\`R/cliques.R\`"

gh issue create --title "Replace `weighted_clique_num` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`weighted_clique_num <- weighted_clique_number_impl\` in \`R/cliques.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
weighted_clique_num <- weighted_clique_number_impl
\`\`\`

**Desired Pattern**
\`\`\`r
weighted_clique_num <- function(graph, vertex.weights = NULL) {
  weighted_clique_number_impl(
    graph = graph,
    vertex.weights = vertex.weights
  )
}
\`\`\`

**File**
\`R/cliques.R\`"

gh issue create --title "Replace `is_complete` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_complete <- is_complete_impl\` in \`R/cliques.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
is_complete <- is_complete_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_complete <- function(graph) {
  is_complete_impl(
    graph = graph
  )
}
\`\`\`

**File**
\`R/cliques.R\`"

gh issue create --title "Replace `is_clique` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_clique <- is_clique_impl\` in \`R/cliques.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
is_clique <- is_clique_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_clique <- function(graph, v) {
  is_clique_impl(
    graph = graph,
    v = v
  )
}
\`\`\`

**File**
\`R/cliques.R\`"

gh issue create --title "Replace `is_ivs` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_ivs <- is_independent_vertex_set_impl\` in \`R/cliques.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
is_ivs <- is_independent_vertex_set_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_ivs <- function(graph, v) {
  is_independent_vertex_set_impl(
    graph = graph,
    v = v
  )
}
\`\`\`

**File**
\`R/cliques.R\`"

gh issue create --title "Replace `greedy_vertex_coloring` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`greedy_vertex_coloring <- vertex_coloring_greedy_impl\` in \`R/coloring.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
greedy_vertex_coloring <- vertex_coloring_greedy_impl
\`\`\`

**Desired Pattern**
\`\`\`r
greedy_vertex_coloring <- function(graph, heuristic = c("colored_neighbors", "dsatur")) {
  vertex_coloring_greedy_impl(
    graph = graph,
    heuristic = heuristic
  )
}
\`\`\`

**File**
\`R/coloring.R\`"

gh issue create --title "Replace `contract` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`contract <- contract_vertices_impl\` in \`R/community.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
contract <- contract_vertices_impl
\`\`\`

**Desired Pattern**
\`\`\`r
contract <- function(graph, mapping) {
  contract_vertices_impl(
    graph = graph,
    mapping = mapping
  )
}
\`\`\`

**File**
\`R/community.R\`"

gh issue create --title "Replace `voronoi_cells` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`voronoi_cells <- voronoi_impl\` in \`R/community.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
voronoi_cells <- voronoi_impl
\`\`\`

**Desired Pattern**
\`\`\`r
voronoi_cells <- function(graph, generators, radius = Inf, mode = c("out", "in", "all", "total"), weights = NULL, tiebreaker = c("random", "first", "last")) {
  voronoi_impl(
    graph = graph,
    generators = generators,
    radius = radius,
    mode = mode,
    weights = weights,
    tiebreaker = tiebreaker
  )
}
\`\`\`

**File**
\`R/community.R\`"

gh issue create --title "Replace `articulation_points` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`articulation_points <- articulation_points_impl\` in \`R/components.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
articulation_points <- articulation_points_impl
\`\`\`

**Desired Pattern**
\`\`\`r
articulation_points <- function(graph) {
  articulation_points_impl(
    graph = graph
  )
}
\`\`\`

**File**
\`R/components.R\`"

gh issue create --title "Replace `bridges` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`bridges <- bridges_impl\` in \`R/components.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
bridges <- bridges_impl
\`\`\`

**Desired Pattern**
\`\`\`r
bridges <- function(graph) {
  bridges_impl(
    graph = graph
  )
}
\`\`\`

**File**
\`R/components.R\`"

gh issue create --title "Replace `is_biconnected` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_biconnected <- is_biconnected_impl\` in \`R/components.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
is_biconnected <- is_biconnected_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_biconnected <- function(graph) {
  is_biconnected_impl(
    graph = graph
  )
}
\`\`\`

**File**
\`R/components.R\`"

gh issue create --title "Replace `as_directed` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`as_directed <- to_directed_impl\` in \`R/conversion.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
as_directed <- to_directed_impl
\`\`\`

**Desired Pattern**
\`\`\`r
as_directed <- function(graph, mode = c("mutual", "arbitrary", "acyclic", "random")) {
  to_directed_impl(
    graph = graph,
    mode = mode
  )
}
\`\`\`

**File**
\`R/conversion.R\`"

gh issue create --title "Replace `graph_from_adj_list` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`graph_from_adj_list <- adjlist_impl\` in \`R/conversion.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
graph_from_adj_list <- adjlist_impl
\`\`\`

**Desired Pattern**
\`\`\`r
graph_from_adj_list <- function(adjlist, mode = c("out", "in", "all", "total"), duplicate = TRUE) {
  adjlist_impl(
    adjlist = adjlist,
    mode = mode,
    duplicate = duplicate
  )
}
\`\`\`

**File**
\`R/conversion.R\`"

gh issue create --title "Replace `find_cycle` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`find_cycle <- find_cycle_impl\` in \`R/cycles.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
find_cycle <- find_cycle_impl
\`\`\`

**Desired Pattern**
\`\`\`r
find_cycle <- function(graph, mode = c("out", "in", "all", "total")) {
  find_cycle_impl(
    graph = graph,
    mode = mode
  )
}
\`\`\`

**File**
\`R/cycles.R\`"

gh issue create --title "Replace `is_graphical` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_graphical <- is_graphical_impl\` in \`R/degseq.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
is_graphical <- is_graphical_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_graphical <- function(out.deg, in.deg = NULL, allowed.edge.types = c("simple", "multiple", "loops", "all", "multi")) {
  is_graphical_impl(
    out.deg = out.deg,
    in.deg = in.deg,
    allowed.edge.types = allowed.edge.types
  )
}
\`\`\`

**File**
\`R/degseq.R\`"

gh issue create --title "Replace `global_efficiency` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`global_efficiency <- global_efficiency_impl\` in \`R/efficiency.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
global_efficiency <- global_efficiency_impl
\`\`\`

**Desired Pattern**
\`\`\`r
global_efficiency <- function(graph, weights = NULL, directed = TRUE) {
  global_efficiency_impl(
    graph = graph,
    weights = weights,
    directed = directed
  )
}
\`\`\`

**File**
\`R/efficiency.R\`"

gh issue create --title "Replace `local_efficiency` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`local_efficiency <- local_efficiency_impl\` in \`R/efficiency.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
local_efficiency <- local_efficiency_impl
\`\`\`

**Desired Pattern**
\`\`\`r
local_efficiency <- function(graph, vids = V(graph), weights = NULL, mode = c("all", "out", "in", "total")) {
  local_efficiency_impl(
    graph = graph,
    vids = vids,
    weights = weights,
    mode = mode
  )
}
\`\`\`

**File**
\`R/efficiency.R\`"

gh issue create --title "Replace `average_local_efficiency` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`average_local_efficiency <- average_local_efficiency_impl\` in \`R/efficiency.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
average_local_efficiency <- average_local_efficiency_impl
\`\`\`

**Desired Pattern**
\`\`\`r
average_local_efficiency <- function(graph, weights = NULL, directed = TRUE, mode = c("all", "out", "in", "total")) {
  average_local_efficiency_impl(
    graph = graph,
    weights = weights,
    directed = directed,
    mode = mode
  )
}
\`\`\`

**File**
\`R/efficiency.R\`"

gh issue create --title "Replace `embed_adjacency_matrix` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`embed_adjacency_matrix <- adjacency_spectral_embedding_impl\` in \`R/embedding.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
embed_adjacency_matrix <- adjacency_spectral_embedding_impl
\`\`\`

**Desired Pattern**
\`\`\`r
embed_adjacency_matrix <- function(graph, no, weights = NULL, which = c("lm", "la", "sa"), scaled = TRUE, options = arpack_defaults()) {
  adjacency_spectral_embedding_impl(
    graph = graph,
    no = no,
    weights = weights,
    which = which,
    scaled = scaled,
    options = options
  )
}
\`\`\`

**File**
\`R/embedding.R\`"

gh issue create --title "Replace `dim_select` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`dim_select <- dim_select_impl\` in \`R/embedding.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
dim_select <- dim_select_impl
\`\`\`

**Desired Pattern**
\`\`\`r
dim_select <- function(sv, dims = NULL, n = NULL, elbow = TRUE, profile = FALSE) {
  dim_select_impl(
    sv = sv,
    dims = dims,
    n = n,
    elbow = elbow,
    profile = profile
  )
}
\`\`\`

**File**
\`R/embedding.R\`"

gh issue create --title "Replace `embed_laplacian_matrix` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`embed_laplacian_matrix <- laplacian_spectral_embedding_impl\` in \`R/embedding.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
embed_laplacian_matrix <- laplacian_spectral_embedding_impl
\`\`\`

**Desired Pattern**
\`\`\`r
embed_laplacian_matrix <- function(graph, no, weights = NULL, which = c("lm", "la", "sa"), type = c("D-A", "DAD", "I-DAD", "OAP"), scaled = TRUE, options = arpack_defaults()) {
  laplacian_spectral_embedding_impl(
    graph = graph,
    no = no,
    weights = weights,
    which = which,
    type = type,
    scaled = scaled,
    options = options
  )
}
\`\`\`

**File**
\`R/embedding.R\`"

gh issue create --title "Replace `eulerian_path` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`eulerian_path <- eulerian_path_impl\` in \`R/eulerian.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
eulerian_path <- eulerian_path_impl
\`\`\`

**Desired Pattern**
\`\`\`r
eulerian_path <- function(graph) {
  eulerian_path_impl(
    graph = graph
  )
}
\`\`\`

**File**
\`R/eulerian.R\`"

gh issue create --title "Replace `eulerian_cycle` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`eulerian_cycle <- eulerian_cycle_impl\` in \`R/eulerian.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
eulerian_cycle <- eulerian_cycle_impl
\`\`\`

**Desired Pattern**
\`\`\`r
eulerian_cycle <- function(graph) {
  eulerian_cycle_impl(
    graph = graph
  )
}
\`\`\`

**File**
\`R/eulerian.R\`"

gh issue create --title "Replace `st_cuts` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`st_cuts <- all_st_cuts_impl\` in \`R/flow.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
st_cuts <- all_st_cuts_impl
\`\`\`

**Desired Pattern**
\`\`\`r
st_cuts <- function(graph, source, target) {
  all_st_cuts_impl(
    graph = graph,
    source = source,
    target = target
  )
}
\`\`\`

**File**
\`R/flow.R\`"

gh issue create --title "Replace `st_min_cuts` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`st_min_cuts <- all_st_mincuts_impl\` in \`R/flow.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
st_min_cuts <- all_st_mincuts_impl
\`\`\`

**Desired Pattern**
\`\`\`r
st_min_cuts <- function(graph, source, target, capacity = NULL) {
  all_st_mincuts_impl(
    graph = graph,
    source = source,
    target = target,
    capacity = capacity
  )
}
\`\`\`

**File**
\`R/flow.R\`"

gh issue create --title "Replace `min_st_separators` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`min_st_separators <- all_minimal_st_separators_impl\` in \`R/flow.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
min_st_separators <- all_minimal_st_separators_impl
\`\`\`

**Desired Pattern**
\`\`\`r
min_st_separators <- function(graph) {
  all_minimal_st_separators_impl(
    graph = graph
  )
}
\`\`\`

**File**
\`R/flow.R\`"

gh issue create --title "Replace `max_flow` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`max_flow <- maxflow_impl\` in \`R/flow.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
max_flow <- maxflow_impl
\`\`\`

**Desired Pattern**
\`\`\`r
max_flow <- function(graph, source, target, capacity = NULL) {
  maxflow_impl(
    graph = graph,
    source = source,
    target = target,
    capacity = capacity
  )
}
\`\`\`

**File**
\`R/flow.R\`"

gh issue create --title "Replace `is_separator` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_separator <- is_separator_impl\` in \`R/flow.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
is_separator <- is_separator_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_separator <- function(graph, candidate) {
  is_separator_impl(
    graph = graph,
    candidate = candidate
  )
}
\`\`\`

**File**
\`R/flow.R\`"

gh issue create --title "Replace `is_min_separator` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_min_separator <- is_minimal_separator_impl\` in \`R/flow.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
is_min_separator <- is_minimal_separator_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_min_separator <- function(graph, candidate) {
  is_minimal_separator_impl(
    graph = graph,
    candidate = candidate
  )
}
\`\`\`

**File**
\`R/flow.R\`"

gh issue create --title "Replace `min_separators` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`min_separators <- minimum_size_separators_impl\` in \`R/flow.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
min_separators <- minimum_size_separators_impl
\`\`\`

**Desired Pattern**
\`\`\`r
min_separators <- function(graph) {
  minimum_size_separators_impl(
    graph = graph
  )
}
\`\`\`

**File**
\`R/flow.R\`"

gh issue create --title "Replace `sample_growing` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_growing <- growing_random_game_impl\` in \`R/games.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
sample_growing <- growing_random_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_growing <- function(n, m = 1, directed = TRUE, citation = FALSE) {
  growing_random_game_impl(
    n = n,
    m = m,
    directed = directed,
    citation = citation
  )
}
\`\`\`

**File**
\`R/games.R\`"

gh issue create --title "Replace `sample_sbm` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_sbm <- sbm_game_impl\` in \`R/games.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
sample_sbm <- sbm_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_sbm <- function(n, pref.matrix, block.sizes, directed = FALSE, loops = FALSE) {
  sbm_game_impl(
    n = n,
    pref.matrix = pref.matrix,
    block.sizes = block.sizes,
    directed = directed,
    loops = loops
  )
}
\`\`\`

**File**
\`R/games.R\`"

gh issue create --title "Replace `sample_dot_product` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_dot_product <- dot_product_game_impl\` in \`R/games.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
sample_dot_product <- dot_product_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_dot_product <- function(vecs, directed = FALSE) {
  dot_product_game_impl(
    vecs = vecs,
    directed = directed
  )
}
\`\`\`

**File**
\`R/games.R\`"

gh issue create --title "Replace `sample_islands` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_islands <- simple_interconnected_islands_game_impl\` in \`R/games.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
sample_islands <- simple_interconnected_islands_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_islands <- function(islands.n, islands.size, islands.pin, n.inter) {
  simple_interconnected_islands_game_impl(
    islands.n = islands.n,
    islands.size = islands.size,
    islands.pin = islands.pin,
    n.inter = n.inter
  )
}
\`\`\`

**File**
\`R/games.R\`"

gh issue create --title "Replace `sample_k_regular` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_k_regular <- k_regular_game_impl\` in \`R/games.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
sample_k_regular <- k_regular_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_k_regular <- function(no.of.nodes, k, directed = FALSE, multiple = FALSE) {
  k_regular_game_impl(
    no.of.nodes = no.of.nodes,
    k = k,
    directed = directed,
    multiple = multiple
  )
}
\`\`\`

**File**
\`R/games.R\`"

gh issue create --title "Replace `sample_chung_lu` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_chung_lu <- chung_lu_game_impl\` in \`R/games.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
sample_chung_lu <- chung_lu_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_chung_lu <- function(out.weights, in.weights = NULL, loops = TRUE, variant = c("original", "maxent", "nr")) {
  chung_lu_game_impl(
    out.weights = out.weights,
    in.weights = in.weights,
    loops = loops,
    variant = variant
  )
}
\`\`\`

**File**
\`R/games.R\`"

gh issue create --title "Replace `sample_fitness` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_fitness <- static_fitness_game_impl\` in \`R/games.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
sample_fitness <- static_fitness_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_fitness <- function(no.of.edges, fitness.out, fitness.in = NULL, loops = FALSE, multiple = FALSE) {
  static_fitness_game_impl(
    no.of.edges = no.of.edges,
    fitness.out = fitness.out,
    fitness.in = fitness.in,
    loops = loops,
    multiple = multiple
  )
}
\`\`\`

**File**
\`R/games.R\`"

gh issue create --title "Replace `sample_fitness_pl` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_fitness_pl <- static_power_law_game_impl\` in \`R/games.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
sample_fitness_pl <- static_power_law_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_fitness_pl <- function(no.of.nodes, no.of.edges, exponent.out, exponent.in = -1, loops = FALSE, multiple = FALSE, finite.size.correction = TRUE) {
  static_power_law_game_impl(
    no.of.nodes = no.of.nodes,
    no.of.edges = no.of.edges,
    exponent.out = exponent.out,
    exponent.in = exponent.in,
    loops = loops,
    multiple = multiple,
    finite.size.correction = finite.size.correction
  )
}
\`\`\`

**File**
\`R/games.R\`"

gh issue create --title "Replace `sample_forestfire` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_forestfire <- forest_fire_game_impl\` in \`R/games.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
sample_forestfire <- forest_fire_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_forestfire <- function(nodes, fw.prob, bw.factor = 1, ambs = 1, directed = TRUE) {
  forest_fire_game_impl(
    nodes = nodes,
    fw.prob = fw.prob,
    bw.factor = bw.factor,
    ambs = ambs,
    directed = directed
  )
}
\`\`\`

**File**
\`R/games.R\`"

gh issue create --title "Replace `sample_correlated_gnp` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_correlated_gnp <- correlated_game_impl\` in \`R/games.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
sample_correlated_gnp <- correlated_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_correlated_gnp <- function(old.graph, corr, p = edge_density(old.graph), permutation = NULL) {
  correlated_game_impl(
    old.graph = old.graph,
    corr = corr,
    p = p,
    permutation = permutation
  )
}
\`\`\`

**File**
\`R/games.R\`"

gh issue create --title "Replace `sample_correlated_gnp_pair` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_correlated_gnp_pair <- correlated_pair_game_impl\` in \`R/games.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
sample_correlated_gnp_pair <- correlated_pair_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_correlated_gnp_pair <- function(n, corr, p, directed = FALSE, permutation = NULL) {
  correlated_pair_game_impl(
    n = n,
    corr = corr,
    p = p,
    directed = directed,
    permutation = permutation
  )
}
\`\`\`

**File**
\`R/games.R\`"

gh issue create --title "Replace `graphlets` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`graphlets <- graphlets_impl\` in \`R/glet.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
graphlets <- graphlets_impl
\`\`\`

**Desired Pattern**
\`\`\`r
graphlets <- function(graph, niter = 1000) {
  graphlets_impl(
    graph = graph,
    niter = niter
  )
}
\`\`\`

**File**
\`R/glet.R\`"

gh issue create --title "Replace `consensus_tree` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`consensus_tree <- hrg_consensus_impl\` in \`R/hrg.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
consensus_tree <- hrg_consensus_impl
\`\`\`

**Desired Pattern**
\`\`\`r
consensus_tree <- function(graph, hrg = NULL, start = FALSE, num.samples = 10000) {
  hrg_consensus_impl(
    graph = graph,
    hrg = hrg,
    start = start,
    num.samples = num.samples
  )
}
\`\`\`

**File**
\`R/hrg.R\`"

gh issue create --title "Replace `hrg` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`hrg <- hrg_create_impl\` in \`R/hrg.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
hrg <- hrg_create_impl
\`\`\`

**Desired Pattern**
\`\`\`r
hrg <- function(graph, hrg = NULL, start = FALSE) {
  hrg_create_impl(
    graph = graph,
    hrg = hrg,
    start = start
  )
}
\`\`\`

**File**
\`R/hrg.R\`"

gh issue create --title "Replace `align_layout` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`align_layout <- layout_align_impl\` in \`R/layout.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
align_layout <- layout_align_impl
\`\`\`

**Desired Pattern**
\`\`\`r
align_layout <- function(g1, g2, layout1, layout2) {
  layout_align_impl(
    g1 = g1,
    g2 = g2,
    layout1 = layout1,
    layout2 = layout2
  )
}
\`\`\`

**File**
\`R/layout.R\`"

gh issue create --title "Replace `sample_tree` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_tree <- tree_game_impl\` in \`R/make.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
sample_tree <- tree_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_tree <- function(n, children = 2, mode = c("out", "in", "undirected")) {
  tree_game_impl(
    n = n,
    children = children,
    mode = mode
  )
}
\`\`\`

**File**
\`R/make.R\`"

gh issue create --title "Replace `make_from_prufer` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`make_from_prufer <- from_prufer_impl\` in \`R/make.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
make_from_prufer <- from_prufer_impl
\`\`\`

**Desired Pattern**
\`\`\`r
make_from_prufer <- function(prufer) {
  from_prufer_impl(
    prufer = prufer
  )
}
\`\`\`

**File**
\`R/make.R\`"

gh issue create --title "Replace `realize_degseq` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`realize_degseq <- realize_degree_sequence_impl\` in \`R/make.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
realize_degseq <- realize_degree_sequence_impl
\`\`\`

**Desired Pattern**
\`\`\`r
realize_degseq <- function(out.deg, in.deg = NULL, allowed.edge.types = c("simple", "loops", "multi", "all"), method = c("smallest", "largest", "index")) {
  realize_degree_sequence_impl(
    out.deg = out.deg,
    in.deg = in.deg,
    allowed.edge.types = allowed.edge.types,
    method = method
  )
}
\`\`\`

**File**
\`R/make.R\`"

gh issue create --title "Replace `triad_census` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`triad_census <- triad_census_impl\` in \`R/motifs.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
triad_census <- triad_census_impl
\`\`\`

**Desired Pattern**
\`\`\`r
triad_census <- function(graph) {
  triad_census_impl(
    graph = graph
  )
}
\`\`\`

**File**
\`R/motifs.R\`"

gh issue create --title "Replace `reverse_edges` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`reverse_edges <- reverse_edges_impl\` in \`R/operators.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
reverse_edges <- reverse_edges_impl
\`\`\`

**Desired Pattern**
\`\`\`r
reverse_edges <- function(graph, edges = E(graph)) {
  reverse_edges_impl(
    graph = graph,
    edges = edges
  )
}
\`\`\`

**File**
\`R/operators.R\`"

gh issue create --title "Replace `convex_hull` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`convex_hull <- convex_hull_2d_impl\` in \`R/other.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
convex_hull <- convex_hull_2d_impl
\`\`\`

**Desired Pattern**
\`\`\`r
convex_hull <- function(data) {
  convex_hull_2d_impl(
    data = data
  )
}
\`\`\`

**File**
\`R/other.R\`"

gh issue create --title "Replace `is_dag` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_dag <- is_dag_impl\` in \`R/paths.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
is_dag <- is_dag_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_dag <- function(graph) {
  is_dag_impl(
    graph = graph
  )
}
\`\`\`

**File**
\`R/paths.R\`"

gh issue create --title "Replace `is_acyclic` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_acyclic <- is_acyclic_impl\` in \`R/paths.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
is_acyclic <- is_acyclic_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_acyclic <- function(graph) {
  is_acyclic_impl(
    graph = graph
  )
}
\`\`\`

**File**
\`R/paths.R\`"

gh issue create --title "Replace `max_cardinality` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`max_cardinality <- maximum_cardinality_search_impl\` in \`R/paths.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
max_cardinality <- maximum_cardinality_search_impl
\`\`\`

**Desired Pattern**
\`\`\`r
max_cardinality <- function(graph) {
  maximum_cardinality_search_impl(
    graph = graph
  )
}
\`\`\`

**File**
\`R/paths.R\`"

gh issue create --title "Replace `graph_center` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`graph_center <- graph_center_impl\` in \`R/paths.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
graph_center <- graph_center_impl
\`\`\`

**Desired Pattern**
\`\`\`r
graph_center <- function(graph, mode = c("out", "in", "all", "total"), weights = NULL) {
  graph_center_impl(
    graph = graph,
    mode = mode,
    weights = weights
  )
}
\`\`\`

**File**
\`R/paths.R\`"

gh issue create --title "Replace `distance_table` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`distance_table <- path_length_hist_impl\` in \`R/paths.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
distance_table <- path_length_hist_impl
\`\`\`

**Desired Pattern**
\`\`\`r
distance_table <- function(graph, directed = TRUE) {
  path_length_hist_impl(
    graph = graph,
    directed = directed
  )
}
\`\`\`

**File**
\`R/paths.R\`"

gh issue create --title "Replace `simplify` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`simplify <- simplify_impl\` in \`R/simple.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
simplify <- simplify_impl
\`\`\`

**Desired Pattern**
\`\`\`r
simplify <- function(graph, remove.multiple = TRUE, remove.loops = TRUE, edge.attr.comb = igraph_opt("edge.attr.comb")) {
  simplify_impl(
    graph = graph,
    remove.multiple = remove.multiple,
    remove.loops = remove.loops,
    edge.attr.comb = edge.attr.comb
  )
}
\`\`\`

**File**
\`R/simple.R\`"

gh issue create --title "Replace `is_simple` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_simple <- is_simple_impl\` in \`R/simple.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
is_simple <- is_simple_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_simple <- function(graph) {
  is_simple_impl(
    graph = graph
  )
}
\`\`\`

**File**
\`R/simple.R\`"

gh issue create --title "Replace `sir` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sir <- sir_impl\` in \`R/sir.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
sir <- sir_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sir <- function(graph, beta, gamma, no.sim = 100) {
  sir_impl(
    graph = graph,
    beta = beta,
    gamma = gamma,
    no.sim = no.sim
  )
}
\`\`\`

**File**
\`R/sir.R\`"

gh issue create --title "Replace `k_shortest_paths` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`k_shortest_paths <- get_k_shortest_paths_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
k_shortest_paths <- get_k_shortest_paths_impl
\`\`\`

**Desired Pattern**
\`\`\`r
k_shortest_paths <- function(graph, from, to, k, mode = c("out", "in", "all", "total"), weights = NULL, output = c("vpath", "epath")) {
  get_k_shortest_paths_impl(
    graph = graph,
    from = from,
    to = to,
    k = k,
    mode = mode,
    weights = weights,
    output = output
  )
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace `reciprocity` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`reciprocity <- reciprocity_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
reciprocity <- reciprocity_impl
\`\`\`

**Desired Pattern**
\`\`\`r
reciprocity <- function(graph, ignore.loops = TRUE, mode = c("default", "ratio")) {
  reciprocity_impl(
    graph = graph,
    ignore.loops = ignore.loops,
    mode = mode
  )
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace `edge_density` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`edge_density <- density_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
edge_density <- density_impl
\`\`\`

**Desired Pattern**
\`\`\`r
edge_density <- function(graph, loops = FALSE) {
  density_impl(
    graph = graph,
    loops = loops
  )
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace `feedback_arc_set` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`feedback_arc_set <- feedback_arc_set_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
feedback_arc_set <- feedback_arc_set_impl
\`\`\`

**Desired Pattern**
\`\`\`r
feedback_arc_set <- function(graph, weights = NULL, algo = c("approx_eades", "exact_ip")) {
  feedback_arc_set_impl(
    graph = graph,
    weights = weights,
    algo = algo
  )
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace `feedback_vertex_set` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`feedback_vertex_set <- feedback_vertex_set_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
feedback_vertex_set <- feedback_vertex_set_impl
\`\`\`

**Desired Pattern**
\`\`\`r
feedback_vertex_set <- function(graph, weights = NULL, algo = c("approx_eades", "exact_ip")) {
  feedback_vertex_set_impl(
    graph = graph,
    weights = weights,
    algo = algo
  )
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace `which_multiple` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`which_multiple <- is_multiple_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
which_multiple <- is_multiple_impl
\`\`\`

**Desired Pattern**
\`\`\`r
which_multiple <- function(graph, eids = E(graph)) {
  is_multiple_impl(
    graph = graph,
    eids = eids
  )
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace `any_multiple` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`any_multiple <- has_multiple_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
any_multiple <- has_multiple_impl
\`\`\`

**Desired Pattern**
\`\`\`r
any_multiple <- function(graph) {
  has_multiple_impl(
    graph = graph
  )
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace `count_multiple` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`count_multiple <- count_multiple_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
count_multiple <- count_multiple_impl
\`\`\`

**Desired Pattern**
\`\`\`r
count_multiple <- function(graph, eids = E(graph)) {
  count_multiple_impl(
    graph = graph,
    eids = eids
  )
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace `which_loop` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`which_loop <- is_loop_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
which_loop <- is_loop_impl
\`\`\`

**Desired Pattern**
\`\`\`r
which_loop <- function(graph, eids = E(graph)) {
  is_loop_impl(
    graph = graph,
    eids = eids
  )
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace `any_loop` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`any_loop <- has_loop_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
any_loop <- has_loop_impl
\`\`\`

**Desired Pattern**
\`\`\`r
any_loop <- function(graph) {
  has_loop_impl(
    graph = graph
  )
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace `is_connected` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_connected <- is_connected_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
is_connected <- is_connected_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_connected <- function(graph, mode = c("weak", "strong")) {
  is_connected_impl(
    graph = graph,
    mode = mode
  )
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace `which_mutual` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`which_mutual <- is_mutual_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
which_mutual <- is_mutual_impl
\`\`\`

**Desired Pattern**
\`\`\`r
which_mutual <- function(graph, eids = E(graph)) {
  is_mutual_impl(
    graph = graph,
    eids = eids
  )
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace `knn` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`knn <- avg_nearest_neighbor_degree_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
knn <- avg_nearest_neighbor_degree_impl
\`\`\`

**Desired Pattern**
\`\`\`r
knn <- function(graph, vids = V(graph), mode = c("all", "out", "in", "total"), neighbor.degree.mode = c("all", "out", "in", "total"), weights = NULL) {
  avg_nearest_neighbor_degree_impl(
    graph = graph,
    vids = vids,
    mode = mode,
    neighbor.degree.mode = neighbor.degree.mode,
    weights = weights
  )
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace `are_adjacent` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`are_adjacent <- are_adjacent_impl\` in \`R/structure.info.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
are_adjacent <- are_adjacent_impl
\`\`\`

**Desired Pattern**
\`\`\`r
are_adjacent <- function(graph, v1, v2) {
  are_adjacent_impl(
    graph = graph,
    v1 = v1,
    v2 = v2
  )
}
\`\`\`

**File**
\`R/structure.info.R\`"

gh issue create --title "Replace `graph.isomorphic.bliss` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`graph.isomorphic.bliss <- isomorphic_bliss_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
graph.isomorphic.bliss <- isomorphic_bliss_impl
\`\`\`

**Desired Pattern**
\`\`\`r
graph.isomorphic.bliss <- function(graph1, graph2, sh1 = c("fm", "f", "fs", "fl", "flm"), sh2 = c("fm", "f", "fs", "fl", "flm")) {
  isomorphic_bliss_impl(
    graph1 = graph1,
    graph2 = graph2,
    sh1 = sh1,
    sh2 = sh2
  )
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace `graph.isomorphic.vf2` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`graph.isomorphic.vf2 <- isomorphic_vf2_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
graph.isomorphic.vf2 <- isomorphic_vf2_impl
\`\`\`

**Desired Pattern**
\`\`\`r
graph.isomorphic.vf2 <- function(graph1, graph2, vertex.color1 = NULL, vertex.color2 = NULL, edge.color1 = NULL, edge.color2 = NULL) {
  isomorphic_vf2_impl(
    graph1 = graph1,
    graph2 = graph2,
    vertex.color1 = vertex.color1,
    vertex.color2 = vertex.color2,
    edge.color1 = edge.color1,
    edge.color2 = edge.color2
  )
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace `graph.subisomorphic.vf2` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`graph.subisomorphic.vf2 <- subisomorphic_vf2_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
graph.subisomorphic.vf2 <- subisomorphic_vf2_impl
\`\`\`

**Desired Pattern**
\`\`\`r
graph.subisomorphic.vf2 <- function(graph1, graph2, vertex.color1 = NULL, vertex.color2 = NULL, edge.color1 = NULL, edge.color2 = NULL) {
  subisomorphic_vf2_impl(
    graph1 = graph1,
    graph2 = graph2,
    vertex.color1 = vertex.color1,
    vertex.color2 = vertex.color2,
    edge.color1 = edge.color1,
    edge.color2 = edge.color2
  )
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace `graph.count.isomorphisms.vf2` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`graph.count.isomorphisms.vf2 <- count_isomorphisms_vf2_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
graph.count.isomorphisms.vf2 <- count_isomorphisms_vf2_impl
\`\`\`

**Desired Pattern**
\`\`\`r
graph.count.isomorphisms.vf2 <- function(graph1, graph2, vertex.color1 = NULL, vertex.color2 = NULL, edge.color1 = NULL, edge.color2 = NULL) {
  count_isomorphisms_vf2_impl(
    graph1 = graph1,
    graph2 = graph2,
    vertex.color1 = vertex.color1,
    vertex.color2 = vertex.color2,
    edge.color1 = edge.color1,
    edge.color2 = edge.color2
  )
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace `graph.count.subisomorphisms.vf2` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`graph.count.subisomorphisms.vf2 <- count_subisomorphisms_vf2_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
graph.count.subisomorphisms.vf2 <- count_subisomorphisms_vf2_impl
\`\`\`

**Desired Pattern**
\`\`\`r
graph.count.subisomorphisms.vf2 <- function(graph1, graph2, vertex.color1 = NULL, vertex.color2 = NULL, edge.color1 = NULL, edge.color2 = NULL) {
  count_subisomorphisms_vf2_impl(
    graph1 = graph1,
    graph2 = graph2,
    vertex.color1 = vertex.color1,
    vertex.color2 = vertex.color2,
    edge.color1 = edge.color1,
    edge.color2 = edge.color2
  )
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace `graph.isoclass` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`graph.isoclass <- isoclass_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
graph.isoclass <- isoclass_impl
\`\`\`

**Desired Pattern**
\`\`\`r
graph.isoclass <- function(graph) {
  isoclass_impl(
    graph = graph
  )
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace `graph_from_isomorphism_class` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`graph_from_isomorphism_class <- isoclass_create_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
graph_from_isomorphism_class <- isoclass_create_impl
\`\`\`

**Desired Pattern**
\`\`\`r
graph_from_isomorphism_class <- function(size, number, directed = TRUE) {
  isoclass_create_impl(
    size = size,
    number = number,
    directed = directed
  )
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace `canonical_permutation` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`canonical_permutation <- canonical_permutation_bliss_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
canonical_permutation <- canonical_permutation_bliss_impl
\`\`\`

**Desired Pattern**
\`\`\`r
canonical_permutation <- function(graph, sh = c("fm", "f", "fs", "fl", "flm")) {
  canonical_permutation_bliss_impl(
    graph = graph,
    sh = sh
  )
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace `permute` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`permute <- permute_vertices_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
permute <- permute_vertices_impl
\`\`\`

**Desired Pattern**
\`\`\`r
permute <- function(graph, permutation) {
  permute_vertices_impl(
    graph = graph,
    permutation = permutation
  )
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace `graph.isomorphic` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`graph.isomorphic <- isomorphic_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
graph.isomorphic <- isomorphic_impl
\`\`\`

**Desired Pattern**
\`\`\`r
graph.isomorphic <- function(graph1, graph2, method = c("auto", "direct", "vf2", "bliss"), ...)) {
  isomorphic_impl(
    graph1 = graph1,
    graph2 = graph2,
    method = method,
    ... = ...
  )
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace `count_automorphisms` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`count_automorphisms <- count_automorphisms_bliss_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
count_automorphisms <- count_automorphisms_bliss_impl
\`\`\`

**Desired Pattern**
\`\`\`r
count_automorphisms <- function(graph, sh = c("fm", "f", "fs", "fl", "flm"), colors = NULL) {
  count_automorphisms_bliss_impl(
    graph = graph,
    sh = sh,
    colors = colors
  )
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace `automorphism_group` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`automorphism_group <- automorphism_group_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
automorphism_group <- automorphism_group_impl
\`\`\`

**Desired Pattern**
\`\`\`r
automorphism_group <- function(graph, sh = c("fm", "f", "fs", "fl", "flm"), colors = NULL, details = FALSE) {
  automorphism_group_impl(
    graph = graph,
    sh = sh,
    colors = colors,
    details = details
  )
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace `is_forest` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_forest <- is_forest_impl\` in \`R/trees.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
is_forest <- is_forest_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_forest <- function(graph, mode = c("out", "in", "all", "total")) {
  is_forest_impl(
    graph = graph,
    mode = mode
  )
}
\`\`\`

**File**
\`R/trees.R\`"

gh issue create --title "Replace `to_prufer` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`to_prufer <- to_prufer_impl\` in \`R/trees.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
to_prufer <- to_prufer_impl
\`\`\`

**Desired Pattern**
\`\`\`r
to_prufer <- function(graph) {
  to_prufer_impl(
    graph = graph
  )
}
\`\`\`

**File**
\`R/trees.R\`"

gh issue create --title "Replace `triangles` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`triangles <- list_triangles_impl\` in \`R/triangles.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
triangles <- list_triangles_impl
\`\`\`

**Desired Pattern**
\`\`\`r
triangles <- function(graph) {
  list_triangles_impl(
    graph = graph
  )
}
\`\`\`

**File**
\`R/triangles.R\`"

gh issue create --title "Replace `count_triangles` alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`count_triangles <- count_adjacent_triangles_impl\` in \`R/triangles.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` - instead, list all parameters explicitly

**Current Pattern**
\`\`\`r
count_triangles <- count_adjacent_triangles_impl
\`\`\`

**Desired Pattern**
\`\`\`r
count_triangles <- function(graph, vids = V(graph)) {
  count_adjacent_triangles_impl(
    graph = graph,
    vids = vids
  )
}
\`\`\`

**File**
\`R/triangles.R\`"


echo ""
echo "Script complete! All 108 issue creation commands added."
echo "Run this script to create all GitHub issues."
