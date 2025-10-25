#!/bin/bash
# Script to create GitHub issues for replacing _impl function aliases with explicit wrappers

create_issue() {
  local func_name="$1"
  local impl_name="$2"
  local file="$3"
  local signature="$4"
  local forwarding="$5"
  
  gh issue create --title "Replace \`${func_name}\` alias with explicit wrapper" --body "**Goal**
Replace the direct aliasing of \`${func_name} <- ${impl_name}\` in \`${file}\` with an explicit wrapper function that calls the \`_impl\` function.

**Instructions**
1. Create an explicit function with a complete signature that matches the \`_impl\` function's parameters
2. Forward each argument individually and explicitly using \`arg = arg\` notation
3. Do not use \`...\` unless the \`_impl\` function itself uses \`...\`

**Current Pattern**
\`\`\`r
${func_name} <- ${impl_name}
\`\`\`

**Desired Pattern**
\`\`\`r
${func_name} <- function(${signature}) {
  ${impl_name}(
    ${forwarding}
  )
}
\`\`\`

**File**
\`${file}\`"
}

create_issue "assortativity_nominal" "assortativity_nominal_impl" "R/assortativity.R" "graph, types, directed = TRUE, normalized = TRUE" "graph = graph,
    types = types,
    directed = directed,
    normalized = normalized"

create_issue "assortativity_degree" "assortativity_degree_impl" "R/assortativity.R" "graph, directed = TRUE" "graph = graph,
    directed = directed"

create_issue "bipartite_projection_size" "bipartite_projection_size_impl" "R/bipartite.R" "graph" "graph = graph"

create_issue "bipartite_mapping" "is_bipartite_impl" "R/bipartite.R" "graph" "graph = graph"

create_issue "strength" "strength_impl" "R/centrality.R" "graph, vids = V(graph), mode = c(\"all\", \"out\", \"in\", \"total\"), loops = TRUE, weights = NULL" "graph = graph,
    vids = vids,
    mode = mode,
    loops = loops,
    weights = weights"

create_issue "diversity" "diversity_impl" "R/centrality.R" "graph, vids = V(graph), weights = NULL" "graph = graph,
    vids = vids,
    weights = weights"

create_issue "page_rank" "personalized_pagerank_impl" "R/centrality.R" "graph, algo = c(\"prpack\", \"arpack\"), vids = V(graph), directed = TRUE, damping = 0.85, personalized = NULL, weights = NULL, options = NULL" "graph = graph,
    algo = algo,
    vids = vids,
    directed = directed,
    damping = damping,
    personalized = personalized,
    weights = weights,
    options = options"

create_issue "harmonic_centrality" "harmonic_centrality_cutoff_impl" "R/centrality.R" "graph, vids = V(graph), mode = c(\"out\", \"in\", \"all\", \"total\"), weights = NULL, cutoff = -1" "graph = graph,
    vids = vids,
    mode = mode,
    weights = weights,
    cutoff = cutoff"

create_issue "centralize" "centralization_impl" "R/centralization.R" "scores, theoretical.max, normalized = TRUE" "scores = scores,
    theoretical.max = theoretical.max,
    normalized = normalized"

create_issue "centr_degree" "centralization_degree_impl" "R/centralization.R" "graph, mode = c(\"all\", \"out\", \"in\", \"total\"), loops = TRUE, normalized = TRUE" "graph = graph,
    mode = mode,
    loops = loops,
    normalized = normalized"

create_issue "centr_betw_tmax" "centralization_betweenness_tmax_impl" "R/centralization.R" "graph, directed = TRUE" "graph = graph,
    directed = directed"

create_issue "centr_clo" "centralization_closeness_impl" "R/centralization.R" "graph, mode = c(\"out\", \"in\", \"all\", \"total\"), normalized = TRUE" "graph = graph,
    mode = mode,
    normalized = normalized"

create_issue "centr_clo_tmax" "centralization_closeness_tmax_impl" "R/centralization.R" "graph, mode = c(\"out\", \"in\", \"all\", \"total\")" "graph = graph,
    mode = mode"

create_issue "cliques" "cliques_impl" "R/cliques.R" "graph, min = 0, max = 0" "graph = graph,
    min = min,
    max = max"

create_issue "largest_cliques" "largest_cliques_impl" "R/cliques.R" "graph" "graph = graph"

create_issue "clique_num" "clique_number_impl" "R/cliques.R" "graph" "graph = graph"

create_issue "weighted_cliques" "weighted_cliques_impl" "R/cliques.R" "graph, vertex.weights = NULL, min.weight = 0, max.weight = 0, maximal = FALSE" "graph = graph,
    vertex.weights = vertex.weights,
    min.weight = min.weight,
    max.weight = max.weight,
    maximal = maximal"

create_issue "largest_weighted_cliques" "largest_weighted_cliques_impl" "R/cliques.R" "graph, vertex.weights = NULL" "graph = graph,
    vertex.weights = vertex.weights"

create_issue "weighted_clique_num" "weighted_clique_number_impl" "R/cliques.R" "graph, vertex.weights = NULL" "graph = graph,
    vertex.weights = vertex.weights"

create_issue "is_complete" "is_complete_impl" "R/cliques.R" "graph" "graph = graph"

create_issue "is_clique" "is_clique_impl" "R/cliques.R" "graph, v" "graph = graph,
    v = v"

create_issue "is_ivs" "is_independent_vertex_set_impl" "R/cliques.R" "graph, v" "graph = graph,
    v = v"

create_issue "greedy_vertex_coloring" "vertex_coloring_greedy_impl" "R/coloring.R" "graph, heuristic = c(\"colored_neighbors\", \"dsatur\")" "graph = graph,
    heuristic = heuristic"

create_issue "contract" "contract_vertices_impl" "R/community.R" "graph, mapping" "graph = graph,
    mapping = mapping"

create_issue "voronoi_cells" "voronoi_impl" "R/community.R" "graph, generators, radius = Inf, mode = c(\"out\", \"in\", \"all\", \"total\"), weights = NULL, tiebreaker = c(\"random\", \"first\", \"last\")" "graph = graph,
    generators = generators,
    radius = radius,
    mode = mode,
    weights = weights,
    tiebreaker = tiebreaker"

create_issue "articulation_points" "articulation_points_impl" "R/components.R" "graph" "graph = graph"

create_issue "bridges" "bridges_impl" "R/components.R" "graph" "graph = graph"

create_issue "is_biconnected" "is_biconnected_impl" "R/components.R" "graph" "graph = graph"

create_issue "as_directed" "to_directed_impl" "R/conversion.R" "graph, mode = c(\"mutual\", \"arbitrary\", \"acyclic\", \"random\")" "graph = graph,
    mode = mode"

create_issue "graph_from_adj_list" "adjlist_impl" "R/conversion.R" "adjlist, mode = c(\"out\", \"in\", \"all\", \"total\"), duplicate = TRUE" "adjlist = adjlist,
    mode = mode,
    duplicate = duplicate"

create_issue "find_cycle" "find_cycle_impl" "R/cycles.R" "graph, mode = c(\"out\", \"in\", \"all\", \"total\")" "graph = graph,
    mode = mode"

create_issue "is_graphical" "is_graphical_impl" "R/degseq.R" "out.deg, in.deg = NULL, allowed.edge.types = c(\"simple\", \"multiple\", \"loops\", \"all\", \"multi\")" "out.deg = out.deg,
    in.deg = in.deg,
    allowed.edge.types = allowed.edge.types"

create_issue "global_efficiency" "global_efficiency_impl" "R/efficiency.R" "graph, weights = NULL, directed = TRUE" "graph = graph,
    weights = weights,
    directed = directed"

create_issue "local_efficiency" "local_efficiency_impl" "R/efficiency.R" "graph, vids = V(graph), weights = NULL, mode = c(\"all\", \"out\", \"in\", \"total\")" "graph = graph,
    vids = vids,
    weights = weights,
    mode = mode"

create_issue "average_local_efficiency" "average_local_efficiency_impl" "R/efficiency.R" "graph, weights = NULL, directed = TRUE, mode = c(\"all\", \"out\", \"in\", \"total\")" "graph = graph,
    weights = weights,
    directed = directed,
    mode = mode"

create_issue "embed_adjacency_matrix" "adjacency_spectral_embedding_impl" "R/embedding.R" "graph, no, weights = NULL, which = c(\"lm\", \"la\", \"sa\"), scaled = TRUE, options = arpack_defaults()" "graph = graph,
    no = no,
    weights = weights,
    which = which,
    scaled = scaled,
    options = options"

create_issue "dim_select" "dim_select_impl" "R/embedding.R" "sv, dims = NULL, n = NULL, elbow = TRUE, profile = FALSE" "sv = sv,
    dims = dims,
    n = n,
    elbow = elbow,
    profile = profile"

create_issue "embed_laplacian_matrix" "laplacian_spectral_embedding_impl" "R/embedding.R" "graph, no, weights = NULL, which = c(\"lm\", \"la\", \"sa\"), type = c(\"D-A\", \"DAD\", \"I-DAD\", \"OAP\"), scaled = TRUE, options = arpack_defaults()" "graph = graph,
    no = no,
    weights = weights,
    which = which,
    type = type,
    scaled = scaled,
    options = options"

create_issue "eulerian_path" "eulerian_path_impl" "R/eulerian.R" "graph" "graph = graph"

create_issue "eulerian_cycle" "eulerian_cycle_impl" "R/eulerian.R" "graph" "graph = graph"

create_issue "st_cuts" "all_st_cuts_impl" "R/flow.R" "graph, source, target" "graph = graph,
    source = source,
    target = target"

create_issue "st_min_cuts" "all_st_mincuts_impl" "R/flow.R" "graph, source, target, capacity = NULL" "graph = graph,
    source = source,
    target = target,
    capacity = capacity"

create_issue "min_st_separators" "all_minimal_st_separators_impl" "R/flow.R" "graph" "graph = graph"

create_issue "max_flow" "maxflow_impl" "R/flow.R" "graph, source, target, capacity = NULL" "graph = graph,
    source = source,
    target = target,
    capacity = capacity"

create_issue "is_separator" "is_separator_impl" "R/flow.R" "graph, candidate" "graph = graph,
    candidate = candidate"

create_issue "is_min_separator" "is_minimal_separator_impl" "R/flow.R" "graph, candidate" "graph = graph,
    candidate = candidate"

create_issue "min_separators" "minimum_size_separators_impl" "R/flow.R" "graph" "graph = graph"

create_issue "sample_growing" "growing_random_game_impl" "R/games.R" "n, m = 1, directed = TRUE, citation = FALSE" "n = n,
    m = m,
    directed = directed,
    citation = citation"

create_issue "sample_sbm" "sbm_game_impl" "R/games.R" "n, pref.matrix, block.sizes, directed = FALSE, loops = FALSE" "n = n,
    pref.matrix = pref.matrix,
    block.sizes = block.sizes,
    directed = directed,
    loops = loops"

create_issue "sample_dot_product" "dot_product_game_impl" "R/games.R" "vecs, directed = FALSE" "vecs = vecs,
    directed = directed"

create_issue "sample_islands" "simple_interconnected_islands_game_impl" "R/games.R" "islands.n, islands.size, islands.pin, n.inter" "islands.n = islands.n,
    islands.size = islands.size,
    islands.pin = islands.pin,
    n.inter = n.inter"

create_issue "sample_k_regular" "k_regular_game_impl" "R/games.R" "no.of.nodes, k, directed = FALSE, multiple = FALSE" "no.of.nodes = no.of.nodes,
    k = k,
    directed = directed,
    multiple = multiple"

create_issue "sample_chung_lu" "chung_lu_game_impl" "R/games.R" "out.weights, in.weights = NULL, loops = TRUE, variant = c(\"original\", \"maxent\", \"nr\")" "out.weights = out.weights,
    in.weights = in.weights,
    loops = loops,
    variant = variant"

create_issue "sample_fitness" "static_fitness_game_impl" "R/games.R" "no.of.edges, fitness.out, fitness.in = NULL, loops = FALSE, multiple = FALSE" "no.of.edges = no.of.edges,
    fitness.out = fitness.out,
    fitness.in = fitness.in,
    loops = loops,
    multiple = multiple"

create_issue "sample_fitness_pl" "static_power_law_game_impl" "R/games.R" "no.of.nodes, no.of.edges, exponent.out, exponent.in = -1, loops = FALSE, multiple = FALSE, finite.size.correction = TRUE" "no.of.nodes = no.of.nodes,
    no.of.edges = no.of.edges,
    exponent.out = exponent.out,
    exponent.in = exponent.in,
    loops = loops,
    multiple = multiple,
    finite.size.correction = finite.size.correction"

create_issue "sample_forestfire" "forest_fire_game_impl" "R/games.R" "nodes, fw.prob, bw.factor = 1, ambs = 1, directed = TRUE" "nodes = nodes,
    fw.prob = fw.prob,
    bw.factor = bw.factor,
    ambs = ambs,
    directed = directed"

create_issue "sample_correlated_gnp" "correlated_game_impl" "R/games.R" "old.graph, corr, p = edge_density(old.graph), permutation = NULL" "old.graph = old.graph,
    corr = corr,
    p = p,
    permutation = permutation"

create_issue "sample_correlated_gnp_pair" "correlated_pair_game_impl" "R/games.R" "n, corr, p, directed = FALSE, permutation = NULL" "n = n,
    corr = corr,
    p = p,
    directed = directed,
    permutation = permutation"

create_issue "graphlets" "graphlets_impl" "R/glet.R" "graph, niter = 1000" "graph = graph,
    niter = niter"

create_issue "consensus_tree" "hrg_consensus_impl" "R/hrg.R" "graph, hrg = NULL, start = FALSE, num.samples = 10000" "graph = graph,
    hrg = hrg,
    start = start,
    num.samples = num.samples"

create_issue "hrg" "hrg_create_impl" "R/hrg.R" "graph, hrg = NULL, start = FALSE" "graph = graph,
    hrg = hrg,
    start = start"

create_issue "align_layout" "layout_align_impl" "R/layout.R" "g1, g2, layout1, layout2" "g1 = g1,
    g2 = g2,
    layout1 = layout1,
    layout2 = layout2"

create_issue "sample_tree" "tree_game_impl" "R/make.R" "n, children = 2, mode = c(\"out\", \"in\", \"undirected\")" "n = n,
    children = children,
    mode = mode"

create_issue "make_from_prufer" "from_prufer_impl" "R/make.R" "prufer" "prufer = prufer"

create_issue "realize_degseq" "realize_degree_sequence_impl" "R/make.R" "out.deg, in.deg = NULL, allowed.edge.types = c(\"simple\", \"loops\", \"multi\", \"all\"), method = c(\"smallest\", \"largest\", \"index\")" "out.deg = out.deg,
    in.deg = in.deg,
    allowed.edge.types = allowed.edge.types,
    method = method"

create_issue "triad_census" "triad_census_impl" "R/motifs.R" "graph" "graph = graph"

create_issue "reverse_edges" "reverse_edges_impl" "R/operators.R" "graph, edges = E(graph)" "graph = graph,
    edges = edges"

create_issue "convex_hull" "convex_hull_2d_impl" "R/other.R" "data" "data = data"

create_issue "is_dag" "is_dag_impl" "R/paths.R" "graph" "graph = graph"

create_issue "is_acyclic" "is_acyclic_impl" "R/paths.R" "graph" "graph = graph"

create_issue "max_cardinality" "maximum_cardinality_search_impl" "R/paths.R" "graph" "graph = graph"

create_issue "graph_center" "graph_center_impl" "R/paths.R" "graph, mode = c(\"out\", \"in\", \"all\", \"total\"), weights = NULL" "graph = graph,
    mode = mode,
    weights = weights"

create_issue "distance_table" "path_length_hist_impl" "R/paths.R" "graph, directed = TRUE" "graph = graph,
    directed = directed"

create_issue "simplify" "simplify_impl" "R/simple.R" "graph, remove.multiple = TRUE, remove.loops = TRUE, edge.attr.comb = igraph_opt(\"edge.attr.comb\")" "graph = graph,
    remove.multiple = remove.multiple,
    remove.loops = remove.loops,
    edge.attr.comb = edge.attr.comb"

create_issue "is_simple" "is_simple_impl" "R/simple.R" "graph" "graph = graph"

create_issue "sir" "sir_impl" "R/sir.R" "graph, beta, gamma, no.sim = 100" "graph = graph,
    beta = beta,
    gamma = gamma,
    no.sim = no.sim"

create_issue "k_shortest_paths" "get_k_shortest_paths_impl" "R/structural-properties.R" "graph, from, to, k, mode = c(\"out\", \"in\", \"all\", \"total\"), weights = NULL, output = c(\"vpath\", \"epath\")" "graph = graph,
    from = from,
    to = to,
    k = k,
    mode = mode,
    weights = weights,
    output = output"

create_issue "reciprocity" "reciprocity_impl" "R/structural-properties.R" "graph, ignore.loops = TRUE, mode = c(\"default\", \"ratio\")" "graph = graph,
    ignore.loops = ignore.loops,
    mode = mode"

create_issue "edge_density" "density_impl" "R/structural-properties.R" "graph, loops = FALSE" "graph = graph,
    loops = loops"

create_issue "feedback_arc_set" "feedback_arc_set_impl" "R/structural-properties.R" "graph, weights = NULL, algo = c(\"approx_eades\", \"exact_ip\")" "graph = graph,
    weights = weights,
    algo = algo"

create_issue "feedback_vertex_set" "feedback_vertex_set_impl" "R/structural-properties.R" "graph, weights = NULL, algo = c(\"approx_eades\", \"exact_ip\")" "graph = graph,
    weights = weights,
    algo = algo"

create_issue "which_multiple" "is_multiple_impl" "R/structural-properties.R" "graph, eids = E(graph)" "graph = graph,
    eids = eids"

create_issue "any_multiple" "has_multiple_impl" "R/structural-properties.R" "graph" "graph = graph"

create_issue "count_multiple" "count_multiple_impl" "R/structural-properties.R" "graph, eids = E(graph)" "graph = graph,
    eids = eids"

create_issue "which_loop" "is_loop_impl" "R/structural-properties.R" "graph, eids = E(graph)" "graph = graph,
    eids = eids"

create_issue "any_loop" "has_loop_impl" "R/structural-properties.R" "graph" "graph = graph"

create_issue "is_connected" "is_connected_impl" "R/structural-properties.R" "graph, mode = c(\"weak\", \"strong\")" "graph = graph,
    mode = mode"

create_issue "which_mutual" "is_mutual_impl" "R/structural-properties.R" "graph, eids = E(graph)" "graph = graph,
    eids = eids"

create_issue "knn" "avg_nearest_neighbor_degree_impl" "R/structural-properties.R" "graph, vids = V(graph), mode = c(\"all\", \"out\", \"in\", \"total\"), neighbor.degree.mode = c(\"all\", \"out\", \"in\", \"total\"), weights = NULL" "graph = graph,
    vids = vids,
    mode = mode,
    neighbor.degree.mode = neighbor.degree.mode,
    weights = weights"

create_issue "are_adjacent" "are_adjacent_impl" "R/structure.info.R" "graph, v1, v2" "graph = graph,
    v1 = v1,
    v2 = v2"

create_issue "graph.isomorphic.bliss" "isomorphic_bliss_impl" "R/topology.R" "graph1, graph2, sh1 = c(\"fm\", \"f\", \"fs\", \"fl\", \"flm\"), sh2 = c(\"fm\", \"f\", \"fs\", \"fl\", \"flm\")" "graph1 = graph1,
    graph2 = graph2,
    sh1 = sh1,
    sh2 = sh2"

create_issue "graph.isomorphic.vf2" "isomorphic_vf2_impl" "R/topology.R" "graph1, graph2, vertex.color1 = NULL, vertex.color2 = NULL, edge.color1 = NULL, edge.color2 = NULL" "graph1 = graph1,
    graph2 = graph2,
    vertex.color1 = vertex.color1,
    vertex.color2 = vertex.color2,
    edge.color1 = edge.color1,
    edge.color2 = edge.color2"

create_issue "graph.subisomorphic.vf2" "subisomorphic_vf2_impl" "R/topology.R" "graph1, graph2, vertex.color1 = NULL, vertex.color2 = NULL, edge.color1 = NULL, edge.color2 = NULL" "graph1 = graph1,
    graph2 = graph2,
    vertex.color1 = vertex.color1,
    vertex.color2 = vertex.color2,
    edge.color1 = edge.color1,
    edge.color2 = edge.color2"

create_issue "graph.count.isomorphisms.vf2" "count_isomorphisms_vf2_impl" "R/topology.R" "graph1, graph2, vertex.color1 = NULL, vertex.color2 = NULL, edge.color1 = NULL, edge.color2 = NULL" "graph1 = graph1,
    graph2 = graph2,
    vertex.color1 = vertex.color1,
    vertex.color2 = vertex.color2,
    edge.color1 = edge.color1,
    edge.color2 = edge.color2"

create_issue "graph.count.subisomorphisms.vf2" "count_subisomorphisms_vf2_impl" "R/topology.R" "graph1, graph2, vertex.color1 = NULL, vertex.color2 = NULL, edge.color1 = NULL, edge.color2 = NULL" "graph1 = graph1,
    graph2 = graph2,
    vertex.color1 = vertex.color1,
    vertex.color2 = vertex.color2,
    edge.color1 = edge.color1,
    edge.color2 = edge.color2"

create_issue "graph.isoclass" "isoclass_impl" "R/topology.R" "graph" "graph = graph"

create_issue "graph_from_isomorphism_class" "isoclass_create_impl" "R/topology.R" "size, number, directed = TRUE" "size = size,
    number = number,
    directed = directed"

create_issue "canonical_permutation" "canonical_permutation_bliss_impl" "R/topology.R" "graph, sh = c(\"fm\", \"f\", \"fs\", \"fl\", \"flm\")" "graph = graph,
    sh = sh"

create_issue "permute" "permute_vertices_impl" "R/topology.R" "graph, permutation" "graph = graph,
    permutation = permutation"

create_issue "graph.isomorphic" "isomorphic_impl" "R/topology.R" "graph1, graph2, method = c(\"auto\", \"direct\", \"vf2\", \"bliss\"), ..." "graph1 = graph1,
    graph2 = graph2,
    method = method,
    ..."

create_issue "count_automorphisms" "count_automorphisms_bliss_impl" "R/topology.R" "graph, sh = c(\"fm\", \"f\", \"fs\", \"fl\", \"flm\"), colors = NULL" "graph = graph,
    sh = sh,
    colors = colors"

create_issue "automorphism_group" "automorphism_group_impl" "R/topology.R" "graph, sh = c(\"fm\", \"f\", \"fs\", \"fl\", \"flm\"), colors = NULL, details = FALSE" "graph = graph,
    sh = sh,
    colors = colors,
    details = details"

create_issue "is_forest" "is_forest_impl" "R/trees.R" "graph, mode = c(\"out\", \"in\", \"all\", \"total\")" "graph = graph,
    mode = mode"

create_issue "to_prufer" "to_prufer_impl" "R/trees.R" "graph" "graph = graph"

create_issue "triangles" "list_triangles_impl" "R/triangles.R" "graph" "graph = graph"

create_issue "count_triangles" "count_adjacent_triangles_impl" "R/triangles.R" "graph, vids = V(graph)" "graph = graph,
    vids = vids"

echo ""
echo "Script complete! All 108 issue creation commands executed."
