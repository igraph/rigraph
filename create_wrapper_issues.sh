#!/bin/bash
# Script to create GitHub issues for replacing _impl function aliases with explicit wrappers
# Run this script after: git fetch --unshallow

gh issue create --title "Replace assortativity_nominal alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`assortativity_nominal <- assortativity_nominal_impl\` in \`R/assortativity.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
assortativity_nominal <- assortativity_nominal_impl
\`\`\`

**Desired Pattern**
\`\`\`r
assortativity_nominal <- function(...) {
  assortativity_nominal_impl(...)
}
\`\`\`

**File**
\`R/assortativity.R\`"

gh issue create --title "Replace assortativity_degree alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`assortativity_degree <- assortativity_degree_impl\` in \`R/assortativity.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
assortativity_degree <- assortativity_degree_impl
\`\`\`

**Desired Pattern**
\`\`\`r
assortativity_degree <- function(...) {
  assortativity_degree_impl(...)
}
\`\`\`

**File**
\`R/assortativity.R\`"

gh issue create --title "Replace bipartite_projection_size alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`bipartite_projection_size <- bipartite_projection_size_impl\` in \`R/bipartite.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
bipartite_projection_size <- bipartite_projection_size_impl
\`\`\`

**Desired Pattern**
\`\`\`r
bipartite_projection_size <- function(...) {
  bipartite_projection_size_impl(...)
}
\`\`\`

**File**
\`R/bipartite.R\`"

gh issue create --title "Replace bipartite_mapping alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`bipartite_mapping <- is_bipartite_impl\` in \`R/bipartite.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
bipartite_mapping <- is_bipartite_impl
\`\`\`

**Desired Pattern**
\`\`\`r
bipartite_mapping <- function(...) {
  is_bipartite_impl(...)
}
\`\`\`

**File**
\`R/bipartite.R\`"

gh issue create --title "Replace strength alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`strength <- strength_impl\` in \`R/centrality.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
strength <- strength_impl
\`\`\`

**Desired Pattern**
\`\`\`r
strength <- function(...) {
  strength_impl(...)
}
\`\`\`

**File**
\`R/centrality.R\`"

gh issue create --title "Replace diversity alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`diversity <- diversity_impl\` in \`R/centrality.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
diversity <- diversity_impl
\`\`\`

**Desired Pattern**
\`\`\`r
diversity <- function(...) {
  diversity_impl(...)
}
\`\`\`

**File**
\`R/centrality.R\`"

gh issue create --title "Replace page_rank alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`page_rank <- personalized_pagerank_impl\` in \`R/centrality.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
page_rank <- personalized_pagerank_impl
\`\`\`

**Desired Pattern**
\`\`\`r
page_rank <- function(...) {
  personalized_pagerank_impl(...)
}
\`\`\`

**File**
\`R/centrality.R\`"

gh issue create --title "Replace harmonic_centrality alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`harmonic_centrality <- harmonic_centrality_cutoff_impl\` in \`R/centrality.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
harmonic_centrality <- harmonic_centrality_cutoff_impl
\`\`\`

**Desired Pattern**
\`\`\`r
harmonic_centrality <- function(...) {
  harmonic_centrality_cutoff_impl(...)
}
\`\`\`

**File**
\`R/centrality.R\`"

gh issue create --title "Replace centralize alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`centralize <- centralization_impl\` in \`R/centralization.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
centralize <- centralization_impl
\`\`\`

**Desired Pattern**
\`\`\`r
centralize <- function(...) {
  centralization_impl(...)
}
\`\`\`

**File**
\`R/centralization.R\`"

gh issue create --title "Replace centr_degree alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`centr_degree <- centralization_degree_impl\` in \`R/centralization.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
centr_degree <- centralization_degree_impl
\`\`\`

**Desired Pattern**
\`\`\`r
centr_degree <- function(...) {
  centralization_degree_impl(...)
}
\`\`\`

**File**
\`R/centralization.R\`"


gh issue create --title "Replace centr_betw_tmax alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`centr_betw_tmax <- centralization_betweenness_tmax_impl\` in \`R/centralization.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
centr_betw_tmax <- centralization_betweenness_tmax_impl
\`\`\`

**Desired Pattern**
\`\`\`r
centr_betw_tmax <- function(...) {
  centralization_betweenness_tmax_impl(...)
}
\`\`\`

**File**
\`R/centralization.R\`"

gh issue create --title "Replace centr_clo alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`centr_clo <- centralization_closeness_impl\` in \`R/centralization.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
centr_clo <- centralization_closeness_impl
\`\`\`

**Desired Pattern**
\`\`\`r
centr_clo <- function(...) {
  centralization_closeness_impl(...)
}
\`\`\`

**File**
\`R/centralization.R\`"

gh issue create --title "Replace centr_clo_tmax alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`centr_clo_tmax <- centralization_closeness_tmax_impl\` in \`R/centralization.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
centr_clo_tmax <- centralization_closeness_tmax_impl
\`\`\`

**Desired Pattern**
\`\`\`r
centr_clo_tmax <- function(...) {
  centralization_closeness_tmax_impl(...)
}
\`\`\`

**File**
\`R/centralization.R\`"

gh issue create --title "Replace cliques alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`cliques <- cliques_impl\` in \`R/cliques.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
cliques <- cliques_impl
\`\`\`

**Desired Pattern**
\`\`\`r
cliques <- function(...) {
  cliques_impl(...)
}
\`\`\`

**File**
\`R/cliques.R\`"

gh issue create --title "Replace largest_cliques alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`largest_cliques <- largest_cliques_impl\` in \`R/cliques.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
largest_cliques <- largest_cliques_impl
\`\`\`

**Desired Pattern**
\`\`\`r
largest_cliques <- function(...) {
  largest_cliques_impl(...)
}
\`\`\`

**File**
\`R/cliques.R\`"

gh issue create --title "Replace clique_num alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`clique_num <- clique_number_impl\` in \`R/cliques.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
clique_num <- clique_number_impl
\`\`\`

**Desired Pattern**
\`\`\`r
clique_num <- function(...) {
  clique_number_impl(...)
}
\`\`\`

**File**
\`R/cliques.R\`"

gh issue create --title "Replace weighted_cliques alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`weighted_cliques <- weighted_cliques_impl\` in \`R/cliques.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
weighted_cliques <- weighted_cliques_impl
\`\`\`

**Desired Pattern**
\`\`\`r
weighted_cliques <- function(...) {
  weighted_cliques_impl(...)
}
\`\`\`

**File**
\`R/cliques.R\`"

gh issue create --title "Replace largest_weighted_cliques alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`largest_weighted_cliques <- largest_weighted_cliques_impl\` in \`R/cliques.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
largest_weighted_cliques <- largest_weighted_cliques_impl
\`\`\`

**Desired Pattern**
\`\`\`r
largest_weighted_cliques <- function(...) {
  largest_weighted_cliques_impl(...)
}
\`\`\`

**File**
\`R/cliques.R\`"

gh issue create --title "Replace weighted_clique_num alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`weighted_clique_num <- weighted_clique_number_impl\` in \`R/cliques.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
weighted_clique_num <- weighted_clique_number_impl
\`\`\`

**Desired Pattern**
\`\`\`r
weighted_clique_num <- function(...) {
  weighted_clique_number_impl(...)
}
\`\`\`

**File**
\`R/cliques.R\`"

gh issue create --title "Replace is_complete alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_complete <- is_complete_impl\` in \`R/cliques.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
is_complete <- is_complete_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_complete <- function(...) {
  is_complete_impl(...)
}
\`\`\`

**File**
\`R/cliques.R\`"


gh issue create --title "Replace is_clique alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_clique <- is_clique_impl\` in \`R/cliques.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
is_clique <- is_clique_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_clique <- function(...) {
  is_clique_impl(...)
}
\`\`\`

**File**
\`R/cliques.R\`"

gh issue create --title "Replace is_ivs alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_ivs <- is_independent_vertex_set_impl\` in \`R/cliques.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
is_ivs <- is_independent_vertex_set_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_ivs <- function(...) {
  is_independent_vertex_set_impl(...)
}
\`\`\`

**File**
\`R/cliques.R\`"

gh issue create --title "Replace greedy_vertex_coloring alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`greedy_vertex_coloring <- vertex_coloring_greedy_impl\` in \`R/coloring.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
greedy_vertex_coloring <- vertex_coloring_greedy_impl
\`\`\`

**Desired Pattern**
\`\`\`r
greedy_vertex_coloring <- function(...) {
  vertex_coloring_greedy_impl(...)
}
\`\`\`

**File**
\`R/coloring.R\`"

gh issue create --title "Replace contract alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`contract <- contract_vertices_impl\` in \`R/community.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
contract <- contract_vertices_impl
\`\`\`

**Desired Pattern**
\`\`\`r
contract <- function(...) {
  contract_vertices_impl(...)
}
\`\`\`

**File**
\`R/community.R\`"

gh issue create --title "Replace voronoi_cells alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`voronoi_cells <- voronoi_impl\` in \`R/community.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
voronoi_cells <- voronoi_impl
\`\`\`

**Desired Pattern**
\`\`\`r
voronoi_cells <- function(...) {
  voronoi_impl(...)
}
\`\`\`

**File**
\`R/community.R\`"

gh issue create --title "Replace articulation_points alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`articulation_points <- articulation_points_impl\` in \`R/components.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
articulation_points <- articulation_points_impl
\`\`\`

**Desired Pattern**
\`\`\`r
articulation_points <- function(...) {
  articulation_points_impl(...)
}
\`\`\`

**File**
\`R/components.R\`"

gh issue create --title "Replace bridges alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`bridges <- bridges_impl\` in \`R/components.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
bridges <- bridges_impl
\`\`\`

**Desired Pattern**
\`\`\`r
bridges <- function(...) {
  bridges_impl(...)
}
\`\`\`

**File**
\`R/components.R\`"

gh issue create --title "Replace is_biconnected alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_biconnected <- is_biconnected_impl\` in \`R/components.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
is_biconnected <- is_biconnected_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_biconnected <- function(...) {
  is_biconnected_impl(...)
}
\`\`\`

**File**
\`R/components.R\`"

gh issue create --title "Replace as_directed alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`as_directed <- to_directed_impl\` in \`R/conversion.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
as_directed <- to_directed_impl
\`\`\`

**Desired Pattern**
\`\`\`r
as_directed <- function(...) {
  to_directed_impl(...)
}
\`\`\`

**File**
\`R/conversion.R\`"

gh issue create --title "Replace graph_from_adj_list alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`graph_from_adj_list <- adjlist_impl\` in \`R/conversion.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
graph_from_adj_list <- adjlist_impl
\`\`\`

**Desired Pattern**
\`\`\`r
graph_from_adj_list <- function(...) {
  adjlist_impl(...)
}
\`\`\`

**File**
\`R/conversion.R\`"


gh issue create --title "Replace find_cycle alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`find_cycle <- find_cycle_impl\` in \`R/cycles.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
find_cycle <- find_cycle_impl
\`\`\`

**Desired Pattern**
\`\`\`r
find_cycle <- function(...) {
  find_cycle_impl(...)
}
\`\`\`

**File**
\`R/cycles.R\`"

gh issue create --title "Replace is_graphical alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_graphical <- is_graphical_impl\` in \`R/degseq.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
is_graphical <- is_graphical_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_graphical <- function(...) {
  is_graphical_impl(...)
}
\`\`\`

**File**
\`R/degseq.R\`"

gh issue create --title "Replace global_efficiency alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`global_efficiency <- global_efficiency_impl\` in \`R/efficiency.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
global_efficiency <- global_efficiency_impl
\`\`\`

**Desired Pattern**
\`\`\`r
global_efficiency <- function(...) {
  global_efficiency_impl(...)
}
\`\`\`

**File**
\`R/efficiency.R\`"

gh issue create --title "Replace local_efficiency alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`local_efficiency <- local_efficiency_impl\` in \`R/efficiency.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
local_efficiency <- local_efficiency_impl
\`\`\`

**Desired Pattern**
\`\`\`r
local_efficiency <- function(...) {
  local_efficiency_impl(...)
}
\`\`\`

**File**
\`R/efficiency.R\`"

gh issue create --title "Replace average_local_efficiency alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`average_local_efficiency <- average_local_efficiency_impl\` in \`R/efficiency.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
average_local_efficiency <- average_local_efficiency_impl
\`\`\`

**Desired Pattern**
\`\`\`r
average_local_efficiency <- function(...) {
  average_local_efficiency_impl(...)
}
\`\`\`

**File**
\`R/efficiency.R\`"

gh issue create --title "Replace embed_adjacency_matrix alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`embed_adjacency_matrix <- adjacency_spectral_embedding_impl\` in \`R/embedding.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
embed_adjacency_matrix <- adjacency_spectral_embedding_impl
\`\`\`

**Desired Pattern**
\`\`\`r
embed_adjacency_matrix <- function(...) {
  adjacency_spectral_embedding_impl(...)
}
\`\`\`

**File**
\`R/embedding.R\`"

gh issue create --title "Replace dim_select alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`dim_select <- dim_select_impl\` in \`R/embedding.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
dim_select <- dim_select_impl
\`\`\`

**Desired Pattern**
\`\`\`r
dim_select <- function(...) {
  dim_select_impl(...)
}
\`\`\`

**File**
\`R/embedding.R\`"

gh issue create --title "Replace embed_laplacian_matrix alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`embed_laplacian_matrix <- laplacian_spectral_embedding_impl\` in \`R/embedding.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
embed_laplacian_matrix <- laplacian_spectral_embedding_impl
\`\`\`

**Desired Pattern**
\`\`\`r
embed_laplacian_matrix <- function(...) {
  laplacian_spectral_embedding_impl(...)
}
\`\`\`

**File**
\`R/embedding.R\`"

gh issue create --title "Replace eulerian_path alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`eulerian_path <- eulerian_path_impl\` in \`R/eulerian.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
eulerian_path <- eulerian_path_impl
\`\`\`

**Desired Pattern**
\`\`\`r
eulerian_path <- function(...) {
  eulerian_path_impl(...)
}
\`\`\`

**File**
\`R/eulerian.R\`"

gh issue create --title "Replace eulerian_cycle alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`eulerian_cycle <- eulerian_cycle_impl\` in \`R/eulerian.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
eulerian_cycle <- eulerian_cycle_impl
\`\`\`

**Desired Pattern**
\`\`\`r
eulerian_cycle <- function(...) {
  eulerian_cycle_impl(...)
}
\`\`\`

**File**
\`R/eulerian.R\`"


gh issue create --title "Replace st_cuts alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`st_cuts <- all_st_cuts_impl\` in \`R/flow.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
st_cuts <- all_st_cuts_impl
\`\`\`

**Desired Pattern**
\`\`\`r
st_cuts <- function(...) {
  all_st_cuts_impl(...)
}
\`\`\`

**File**
\`R/flow.R\`"

gh issue create --title "Replace st_min_cuts alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`st_min_cuts <- all_st_mincuts_impl\` in \`R/flow.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
st_min_cuts <- all_st_mincuts_impl
\`\`\`

**Desired Pattern**
\`\`\`r
st_min_cuts <- function(...) {
  all_st_mincuts_impl(...)
}
\`\`\`

**File**
\`R/flow.R\`"

gh issue create --title "Replace min_st_separators alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`min_st_separators <- all_minimal_st_separators_impl\` in \`R/flow.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
min_st_separators <- all_minimal_st_separators_impl
\`\`\`

**Desired Pattern**
\`\`\`r
min_st_separators <- function(...) {
  all_minimal_st_separators_impl(...)
}
\`\`\`

**File**
\`R/flow.R\`"

gh issue create --title "Replace max_flow alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`max_flow <- maxflow_impl\` in \`R/flow.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
max_flow <- maxflow_impl
\`\`\`

**Desired Pattern**
\`\`\`r
max_flow <- function(...) {
  maxflow_impl(...)
}
\`\`\`

**File**
\`R/flow.R\`"

gh issue create --title "Replace is_separator alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_separator <- is_separator_impl\` in \`R/flow.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
is_separator <- is_separator_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_separator <- function(...) {
  is_separator_impl(...)
}
\`\`\`

**File**
\`R/flow.R\`"

gh issue create --title "Replace is_min_separator alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_min_separator <- is_minimal_separator_impl\` in \`R/flow.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
is_min_separator <- is_minimal_separator_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_min_separator <- function(...) {
  is_minimal_separator_impl(...)
}
\`\`\`

**File**
\`R/flow.R\`"

gh issue create --title "Replace min_separators alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`min_separators <- minimum_size_separators_impl\` in \`R/flow.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
min_separators <- minimum_size_separators_impl
\`\`\`

**Desired Pattern**
\`\`\`r
min_separators <- function(...) {
  minimum_size_separators_impl(...)
}
\`\`\`

**File**
\`R/flow.R\`"

gh issue create --title "Replace sample_growing alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_growing <- growing_random_game_impl\` in \`R/games.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
sample_growing <- growing_random_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_growing <- function(...) {
  growing_random_game_impl(...)
}
\`\`\`

**File**
\`R/games.R\`"

gh issue create --title "Replace sample_sbm alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_sbm <- sbm_game_impl\` in \`R/games.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
sample_sbm <- sbm_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_sbm <- function(...) {
  sbm_game_impl(...)
}
\`\`\`

**File**
\`R/games.R\`"

gh issue create --title "Replace sample_dot_product alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_dot_product <- dot_product_game_impl\` in \`R/games.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
sample_dot_product <- dot_product_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_dot_product <- function(...) {
  dot_product_game_impl(...)
}
\`\`\`

**File**
\`R/games.R\`"


gh issue create --title "Replace sample_islands alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_islands <- simple_interconnected_islands_game_impl\` in \`R/games.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
sample_islands <- simple_interconnected_islands_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_islands <- function(...) {
  simple_interconnected_islands_game_impl(...)
}
\`\`\`

**File**
\`R/games.R\`"

gh issue create --title "Replace sample_k_regular alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_k_regular <- k_regular_game_impl\` in \`R/games.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
sample_k_regular <- k_regular_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_k_regular <- function(...) {
  k_regular_game_impl(...)
}
\`\`\`

**File**
\`R/games.R\`"

gh issue create --title "Replace sample_chung_lu alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_chung_lu <- chung_lu_game_impl\` in \`R/games.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
sample_chung_lu <- chung_lu_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_chung_lu <- function(...) {
  chung_lu_game_impl(...)
}
\`\`\`

**File**
\`R/games.R\`"

gh issue create --title "Replace sample_fitness alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_fitness <- static_fitness_game_impl\` in \`R/games.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
sample_fitness <- static_fitness_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_fitness <- function(...) {
  static_fitness_game_impl(...)
}
\`\`\`

**File**
\`R/games.R\`"

gh issue create --title "Replace sample_fitness_pl alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_fitness_pl <- static_power_law_game_impl\` in \`R/games.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
sample_fitness_pl <- static_power_law_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_fitness_pl <- function(...) {
  static_power_law_game_impl(...)
}
\`\`\`

**File**
\`R/games.R\`"

gh issue create --title "Replace sample_forestfire alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_forestfire <- forest_fire_game_impl\` in \`R/games.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
sample_forestfire <- forest_fire_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_forestfire <- function(...) {
  forest_fire_game_impl(...)
}
\`\`\`

**File**
\`R/games.R\`"

gh issue create --title "Replace sample_correlated_gnp alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_correlated_gnp <- correlated_game_impl\` in \`R/games.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
sample_correlated_gnp <- correlated_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_correlated_gnp <- function(...) {
  correlated_game_impl(...)
}
\`\`\`

**File**
\`R/games.R\`"

gh issue create --title "Replace sample_correlated_gnp_pair alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_correlated_gnp_pair <- correlated_pair_game_impl\` in \`R/games.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
sample_correlated_gnp_pair <- correlated_pair_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_correlated_gnp_pair <- function(...) {
  correlated_pair_game_impl(...)
}
\`\`\`

**File**
\`R/games.R\`"

gh issue create --title "Replace graphlets alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`graphlets <- graphlets_impl\` in \`R/glet.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
graphlets <- graphlets_impl
\`\`\`

**Desired Pattern**
\`\`\`r
graphlets <- function(...) {
  graphlets_impl(...)
}
\`\`\`

**File**
\`R/glet.R\`"

gh issue create --title "Replace consensus_tree alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`consensus_tree <- hrg_consensus_impl\` in \`R/hrg.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
consensus_tree <- hrg_consensus_impl
\`\`\`

**Desired Pattern**
\`\`\`r
consensus_tree <- function(...) {
  hrg_consensus_impl(...)
}
\`\`\`

**File**
\`R/hrg.R\`"


gh issue create --title "Replace hrg alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`hrg <- hrg_create_impl\` in \`R/hrg.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
hrg <- hrg_create_impl
\`\`\`

**Desired Pattern**
\`\`\`r
hrg <- function(...) {
  hrg_create_impl(...)
}
\`\`\`

**File**
\`R/hrg.R\`"

gh issue create --title "Replace align_layout alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`align_layout <- layout_align_impl\` in \`R/layout.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
align_layout <- layout_align_impl
\`\`\`

**Desired Pattern**
\`\`\`r
align_layout <- function(...) {
  layout_align_impl(...)
}
\`\`\`

**File**
\`R/layout.R\`"

gh issue create --title "Replace sample_tree alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sample_tree <- tree_game_impl\` in \`R/make.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
sample_tree <- tree_game_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sample_tree <- function(...) {
  tree_game_impl(...)
}
\`\`\`

**File**
\`R/make.R\`"

gh issue create --title "Replace make_from_prufer alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`make_from_prufer <- from_prufer_impl\` in \`R/make.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
make_from_prufer <- from_prufer_impl
\`\`\`

**Desired Pattern**
\`\`\`r
make_from_prufer <- function(...) {
  from_prufer_impl(...)
}
\`\`\`

**File**
\`R/make.R\`"

gh issue create --title "Replace realize_degseq alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`realize_degseq <- realize_degree_sequence_impl\` in \`R/make.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
realize_degseq <- realize_degree_sequence_impl
\`\`\`

**Desired Pattern**
\`\`\`r
realize_degseq <- function(...) {
  realize_degree_sequence_impl(...)
}
\`\`\`

**File**
\`R/make.R\`"

gh issue create --title "Replace triad_census alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`triad_census <- triad_census_impl\` in \`R/motifs.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
triad_census <- triad_census_impl
\`\`\`

**Desired Pattern**
\`\`\`r
triad_census <- function(...) {
  triad_census_impl(...)
}
\`\`\`

**File**
\`R/motifs.R\`"

gh issue create --title "Replace reverse_edges alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`reverse_edges <- reverse_edges_impl\` in \`R/operators.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
reverse_edges <- reverse_edges_impl
\`\`\`

**Desired Pattern**
\`\`\`r
reverse_edges <- function(...) {
  reverse_edges_impl(...)
}
\`\`\`

**File**
\`R/operators.R\`"

gh issue create --title "Replace convex_hull alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`convex_hull <- convex_hull_2d_impl\` in \`R/other.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
convex_hull <- convex_hull_2d_impl
\`\`\`

**Desired Pattern**
\`\`\`r
convex_hull <- function(...) {
  convex_hull_2d_impl(...)
}
\`\`\`

**File**
\`R/other.R\`"

gh issue create --title "Replace is_dag alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_dag <- is_dag_impl\` in \`R/paths.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
is_dag <- is_dag_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_dag <- function(...) {
  is_dag_impl(...)
}
\`\`\`

**File**
\`R/paths.R\`"

gh issue create --title "Replace is_acyclic alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_acyclic <- is_acyclic_impl\` in \`R/paths.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
is_acyclic <- is_acyclic_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_acyclic <- function(...) {
  is_acyclic_impl(...)
}
\`\`\`

**File**
\`R/paths.R\`"


gh issue create --title "Replace max_cardinality alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`max_cardinality <- maximum_cardinality_search_impl\` in \`R/paths.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
max_cardinality <- maximum_cardinality_search_impl
\`\`\`

**Desired Pattern**
\`\`\`r
max_cardinality <- function(...) {
  maximum_cardinality_search_impl(...)
}
\`\`\`

**File**
\`R/paths.R\`"

gh issue create --title "Replace graph_center alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`graph_center <- graph_center_impl\` in \`R/paths.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
graph_center <- graph_center_impl
\`\`\`

**Desired Pattern**
\`\`\`r
graph_center <- function(...) {
  graph_center_impl(...)
}
\`\`\`

**File**
\`R/paths.R\`"

gh issue create --title "Replace distance_table alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`distance_table <- path_length_hist_impl\` in \`R/paths.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
distance_table <- path_length_hist_impl
\`\`\`

**Desired Pattern**
\`\`\`r
distance_table <- function(...) {
  path_length_hist_impl(...)
}
\`\`\`

**File**
\`R/paths.R\`"

gh issue create --title "Replace simplify alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`simplify <- simplify_impl\` in \`R/simple.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
simplify <- simplify_impl
\`\`\`

**Desired Pattern**
\`\`\`r
simplify <- function(...) {
  simplify_impl(...)
}
\`\`\`

**File**
\`R/simple.R\`"

gh issue create --title "Replace is_simple alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_simple <- is_simple_impl\` in \`R/simple.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
is_simple <- is_simple_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_simple <- function(...) {
  is_simple_impl(...)
}
\`\`\`

**File**
\`R/simple.R\`"

gh issue create --title "Replace sir alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`sir <- sir_impl\` in \`R/sir.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
sir <- sir_impl
\`\`\`

**Desired Pattern**
\`\`\`r
sir <- function(...) {
  sir_impl(...)
}
\`\`\`

**File**
\`R/sir.R\`"

gh issue create --title "Replace k_shortest_paths alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`k_shortest_paths <- get_k_shortest_paths_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
k_shortest_paths <- get_k_shortest_paths_impl
\`\`\`

**Desired Pattern**
\`\`\`r
k_shortest_paths <- function(...) {
  get_k_shortest_paths_impl(...)
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace reciprocity alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`reciprocity <- reciprocity_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
reciprocity <- reciprocity_impl
\`\`\`

**Desired Pattern**
\`\`\`r
reciprocity <- function(...) {
  reciprocity_impl(...)
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace edge_density alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`edge_density <- density_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
edge_density <- density_impl
\`\`\`

**Desired Pattern**
\`\`\`r
edge_density <- function(...) {
  density_impl(...)
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace feedback_arc_set alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`feedback_arc_set <- feedback_arc_set_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
feedback_arc_set <- feedback_arc_set_impl
\`\`\`

**Desired Pattern**
\`\`\`r
feedback_arc_set <- function(...) {
  feedback_arc_set_impl(...)
}
\`\`\`

**File**
\`R/structural-properties.R\`"


gh issue create --title "Replace feedback_vertex_set alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`feedback_vertex_set <- feedback_vertex_set_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
feedback_vertex_set <- feedback_vertex_set_impl
\`\`\`

**Desired Pattern**
\`\`\`r
feedback_vertex_set <- function(...) {
  feedback_vertex_set_impl(...)
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace which_multiple alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`which_multiple <- is_multiple_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
which_multiple <- is_multiple_impl
\`\`\`

**Desired Pattern**
\`\`\`r
which_multiple <- function(...) {
  is_multiple_impl(...)
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace any_multiple alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`any_multiple <- has_multiple_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
any_multiple <- has_multiple_impl
\`\`\`

**Desired Pattern**
\`\`\`r
any_multiple <- function(...) {
  has_multiple_impl(...)
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace count_multiple alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`count_multiple <- count_multiple_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
count_multiple <- count_multiple_impl
\`\`\`

**Desired Pattern**
\`\`\`r
count_multiple <- function(...) {
  count_multiple_impl(...)
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace which_loop alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`which_loop <- is_loop_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
which_loop <- is_loop_impl
\`\`\`

**Desired Pattern**
\`\`\`r
which_loop <- function(...) {
  is_loop_impl(...)
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace any_loop alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`any_loop <- has_loop_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
any_loop <- has_loop_impl
\`\`\`

**Desired Pattern**
\`\`\`r
any_loop <- function(...) {
  has_loop_impl(...)
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace is_connected alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_connected <- is_connected_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
is_connected <- is_connected_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_connected <- function(...) {
  is_connected_impl(...)
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace which_mutual alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`which_mutual <- is_mutual_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
which_mutual <- is_mutual_impl
\`\`\`

**Desired Pattern**
\`\`\`r
which_mutual <- function(...) {
  is_mutual_impl(...)
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace knn alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`knn <- avg_nearest_neighbor_degree_impl\` in \`R/structural-properties.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
knn <- avg_nearest_neighbor_degree_impl
\`\`\`

**Desired Pattern**
\`\`\`r
knn <- function(...) {
  avg_nearest_neighbor_degree_impl(...)
}
\`\`\`

**File**
\`R/structural-properties.R\`"

gh issue create --title "Replace are_adjacent alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`are_adjacent <- are_adjacent_impl\` in \`R/structure.info.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
are_adjacent <- are_adjacent_impl
\`\`\`

**Desired Pattern**
\`\`\`r
are_adjacent <- function(...) {
  are_adjacent_impl(...)
}
\`\`\`

**File**
\`R/structure.info.R\`"


gh issue create --title "Replace graph.isomorphic.bliss alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`graph.isomorphic.bliss <- isomorphic_bliss_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
graph.isomorphic.bliss <- isomorphic_bliss_impl
\`\`\`

**Desired Pattern**
\`\`\`r
graph.isomorphic.bliss <- function(...) {
  isomorphic_bliss_impl(...)
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace graph.isomorphic.vf2 alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`graph.isomorphic.vf2 <- isomorphic_vf2_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
graph.isomorphic.vf2 <- isomorphic_vf2_impl
\`\`\`

**Desired Pattern**
\`\`\`r
graph.isomorphic.vf2 <- function(...) {
  isomorphic_vf2_impl(...)
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace graph.subisomorphic.vf2 alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`graph.subisomorphic.vf2 <- subisomorphic_vf2_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
graph.subisomorphic.vf2 <- subisomorphic_vf2_impl
\`\`\`

**Desired Pattern**
\`\`\`r
graph.subisomorphic.vf2 <- function(...) {
  subisomorphic_vf2_impl(...)
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace graph.count.isomorphisms.vf2 alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`graph.count.isomorphisms.vf2 <- count_isomorphisms_vf2_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
graph.count.isomorphisms.vf2 <- count_isomorphisms_vf2_impl
\`\`\`

**Desired Pattern**
\`\`\`r
graph.count.isomorphisms.vf2 <- function(...) {
  count_isomorphisms_vf2_impl(...)
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace graph.count.subisomorphisms.vf2 alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`graph.count.subisomorphisms.vf2 <- count_subisomorphisms_vf2_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
graph.count.subisomorphisms.vf2 <- count_subisomorphisms_vf2_impl
\`\`\`

**Desired Pattern**
\`\`\`r
graph.count.subisomorphisms.vf2 <- function(...) {
  count_subisomorphisms_vf2_impl(...)
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace graph.isoclass alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`graph.isoclass <- isoclass_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
graph.isoclass <- isoclass_impl
\`\`\`

**Desired Pattern**
\`\`\`r
graph.isoclass <- function(...) {
  isoclass_impl(...)
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace graph_from_isomorphism_class alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`graph_from_isomorphism_class <- isoclass_create_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
graph_from_isomorphism_class <- isoclass_create_impl
\`\`\`

**Desired Pattern**
\`\`\`r
graph_from_isomorphism_class <- function(...) {
  isoclass_create_impl(...)
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace canonical_permutation alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`canonical_permutation <- canonical_permutation_bliss_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
canonical_permutation <- canonical_permutation_bliss_impl
\`\`\`

**Desired Pattern**
\`\`\`r
canonical_permutation <- function(...) {
  canonical_permutation_bliss_impl(...)
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace permute alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`permute <- permute_vertices_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
permute <- permute_vertices_impl
\`\`\`

**Desired Pattern**
\`\`\`r
permute <- function(...) {
  permute_vertices_impl(...)
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace graph.isomorphic alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`graph.isomorphic <- isomorphic_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
graph.isomorphic <- isomorphic_impl
\`\`\`

**Desired Pattern**
\`\`\`r
graph.isomorphic <- function(...) {
  isomorphic_impl(...)
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace count_automorphisms alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`count_automorphisms <- count_automorphisms_bliss_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
count_automorphisms <- count_automorphisms_bliss_impl
\`\`\`

**Desired Pattern**
\`\`\`r
count_automorphisms <- function(...) {
  count_automorphisms_bliss_impl(...)
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace automorphism_group alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`automorphism_group <- automorphism_group_impl\` in \`R/topology.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
automorphism_group <- automorphism_group_impl
\`\`\`

**Desired Pattern**
\`\`\`r
automorphism_group <- function(...) {
  automorphism_group_impl(...)
}
\`\`\`

**File**
\`R/topology.R\`"

gh issue create --title "Replace is_forest alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`is_forest <- is_forest_impl\` in \`R/trees.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
is_forest <- is_forest_impl
\`\`\`

**Desired Pattern**
\`\`\`r
is_forest <- function(...) {
  is_forest_impl(...)
}
\`\`\`

**File**
\`R/trees.R\`"

gh issue create --title "Replace to_prufer alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`to_prufer <- to_prufer_impl\` in \`R/trees.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
to_prufer <- to_prufer_impl
\`\`\`

**Desired Pattern**
\`\`\`r
to_prufer <- function(...) {
  to_prufer_impl(...)
}
\`\`\`

**File**
\`R/trees.R\`"

gh issue create --title "Replace triangles alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`triangles <- list_triangles_impl\` in \`R/triangles.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
triangles <- list_triangles_impl
\`\`\`

**Desired Pattern**
\`\`\`r
triangles <- function(...) {
  list_triangles_impl(...)
}
\`\`\`

**File**
\`R/triangles.R\`"

gh issue create --title "Replace count_triangles alias with explicit wrapper" --body "**Context**

Before running this task, ensure you have the \`next\` branch available by running:
\`\`\`bash
git fetch --unshallow
\`\`\`

**Work Location**
This work must be done on the \`next\` branch.

**Goal**
Replace the direct aliasing of \`count_triangles <- count_adjacent_triangles_impl\` in \`R/triangles.R\` with an explicit wrapper function that calls the \`_impl\` function.

**Current Pattern**
\`\`\`r
count_triangles <- count_adjacent_triangles_impl
\`\`\`

**Desired Pattern**
\`\`\`r
count_triangles <- function(...) {
  count_adjacent_triangles_impl(...)
}
\`\`\`

**File**
\`R/triangles.R\`"

echo ""
echo "Script complete! All 108 issue creation commands added."
echo "Run this script to create all GitHub issues."
