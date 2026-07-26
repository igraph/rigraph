# Argument-signature migrations: structural-properties
# Schema: see tools/migrations/README.md. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  decompose = list(
    old = function(graph, mode, max.comps, min.vertices) {},
    new = function(
      graph,
      ...,
      mode = c("weak", "strong"),
      max.comps = NA,
      min.vertices = 0
    ) {},
    when = "3.0.0"
  ),

  largest_component = list(
    old = function(graph, mode) {},
    new = function(
      graph,
      ...,
      mode = c("weak", "strong")
    ) {},
    when = "3.0.0"
  ),

  connect = list(
    old = function(graph, order, mode) {},
    new = function(
      graph,
      order,
      ...,
      mode = c("all", "out", "in", "total")
    ) {},
    when = "3.0.0"
  ),

  all_simple_paths = list(
    old = function(graph, from, to, mode, cutoff) {},
    new = function(
      graph,
      from,
      to = V(graph),
      ...,
      mode = c("out", "in", "all", "total"),
      cutoff = -1
    ) {},
    when = "3.0.0"
  ),

  distance_table = list(
    old = function(graph, directed) {},
    new = function(
      graph,
      ...,
      directed = TRUE
    ) {},
    when = "3.0.0"
  ),

  all_shortest_paths = list(
    old = function(graph, from, to, mode, weights) {},
    new = function(
      graph,
      from,
      to = V(graph),
      ...,
      mode = c("out", "all", "in"),
      weights = NULL
    ) {},
    when = "3.0.0"
  ),

  components = list(
    old = function(graph, mode) {},
    new = function(
      graph,
      ...,
      mode = c("weak", "strong")
    ) {},
    when = "3.0.0"
  ),

  constraint = list(
    old = function(graph, nodes, weights) {},
    new = function(
      graph,
      nodes = V(graph),
      ...,
      weights = NULL
    ) {},
    when = "3.0.0"
  ),

  coreness = list(
    old = function(graph, mode) {},
    new = function(
      graph,
      ...,
      mode = c("all", "out", "in")
    ) {},
    when = "3.0.0"
  ),

  count_components = list(
    old = function(graph, mode) {},
    new = function(
      graph,
      ...,
      mode = c("weak", "strong")
    ) {},
    when = "3.0.0"
  ),

  count_reachable = list(
    old = function(graph, mode) {},
    new = function(
      graph,
      ...,
      mode = c("out", "in", "all", "total")
    ) {},
    when = "3.0.0"
  ),

  degree = list(
    old = function(graph, v, mode, loops, normalized) {},
    new = function(
      graph,
      v = V(graph),
      ...,
      mode = c("all", "out", "in", "total"),
      loops = TRUE,
      normalized = FALSE
    ) {},
    when = "3.0.0"
  ),

  diameter = list(
    old = function(graph, directed, unconnected, weights) {},
    new = function(
      graph,
      ...,
      directed = TRUE,
      unconnected = TRUE,
      weights = NULL
    ) {},
    when = "3.0.0"
  ),

  distances = list(
    old = function(graph, v, to, mode, weights, algorithm) {},
    new = function(
      graph,
      v = V(graph),
      to = V(graph),
      ...,
      mode = c("all", "out", "in"),
      weights = NULL,
      algorithm = c( "automatic", "unweighted", "dijkstra", "bellman-ford", "johnson", "floyd-warshall" )
    ) {},
    when = "3.0.0"
  ),

  edge_density = list(
    old = function(graph, loops) {},
    new = function(
      graph,
      ...,
      loops = FALSE
    ) {},
    when = "3.0.0"
  ),

  ego = list(
    old = function(graph, order, nodes, mode, mindist) {},
    new = function(
      graph,
      order = 1,
      nodes = V(graph),
      ...,
      mode = c("all", "out", "in"),
      mindist = 0
    ) {},
    when = "3.0.0"
  ),

  ego_size = list(
    old = function(graph, order, nodes, mode, mindist) {},
    new = function(
      graph,
      order = 1,
      nodes = V(graph),
      ...,
      mode = c("all", "out", "in"),
      mindist = 0
    ) {},
    when = "3.0.0"
  ),

  farthest_vertices = list(
    old = function(graph, directed, unconnected, weights) {},
    new = function(
      graph,
      ...,
      directed = TRUE,
      unconnected = TRUE,
      weights = NULL
    ) {},
    when = "3.0.0"
  ),

  feedback_arc_set = list(
    old = function(graph, weights, algo) {},
    new = function(
      graph,
      ...,
      weights = NULL,
      algo = c("approx_eades", "exact_ip")
    ) {},
    when = "3.0.0"
  ),

  feedback_vertex_set = list(
    old = function(graph, weights, algo) {},
    new = function(
      graph,
      ...,
      weights = NULL,
      algo = c("exact_ip")
    ) {},
    when = "3.0.0"
  ),

  get_diameter = list(
    old = function(graph, directed, unconnected, weights) {},
    new = function(
      graph,
      ...,
      directed = TRUE,
      unconnected = TRUE,
      weights = NULL
    ) {},
    when = "3.0.0"
  ),

  girth = list(
    old = function(graph, circle) {},
    new = function(
      graph,
      ...,
      circle = TRUE
    ) {},
    when = "3.0.0"
  ),

  induced_subgraph = list(
    old = function(graph, vids, impl) {},
    new = function(
      graph,
      vids,
      ...,
      impl = c("auto", "copy_and_delete", "create_from_scratch")
    ) {},
    when = "3.0.0"
  ),

  is_connected = list(
    old = function(graph, mode) {},
    new = function(
      graph,
      ...,
      mode = c("weak", "strong")
    ) {},
    when = "3.0.0"
  ),

  knn = list(
    old = function(graph, vids, mode, neighbor.degree.mode, weights) {},
    new = function(
      graph,
      vids = V(graph),
      ...,
      mode = c("all", "out", "in", "total"),
      neighbor.degree.mode = c("all", "out", "in", "total"),
      weights = NULL
    ) {},
    when = "3.0.0"
  ),

  make_ego_graph = list(
    old = function(graph, order, nodes, mode, mindist) {},
    new = function(
      graph,
      order = 1,
      nodes = V(graph),
      ...,
      mode = c("all", "out", "in"),
      mindist = 0
    ) {},
    when = "3.0.0"
  ),

  max_bipartite_match = list(
    old = function(graph, types, weights, eps) {},
    new = function(
      graph,
      types = NULL,
      ...,
      weights = NULL,
      eps = .Machine$double.eps
    ) {},
    when = "3.0.0"
  ),

  mean_degree = list(
    old = function(graph, loops) {},
    new = function(
      graph,
      ...,
      loops = TRUE
    ) {},
    when = "3.0.0"
  ),

  mean_distance = list(
    old = function(graph, weights, directed, unconnected, details) {},
    new = function(
      graph,
      ...,
      weights = NULL,
      directed = TRUE,
      unconnected = TRUE,
      details = FALSE
    ) {},
    when = "3.0.0"
  ),

  reciprocity = list(
    old = function(graph, ignore.loops, mode) {},
    new = function(
      graph,
      ...,
      ignore.loops = TRUE,
      mode = c("default", "ratio")
    ) {},
    when = "3.0.0"
  ),

  shortest_paths = list(
    old = function(
      graph,
      from,
      to,
      mode,
      weights,
      output,
      predecessors,
      inbound.edges,
      algorithm
    ) {},
    new = function(
      graph,
      from,
      to = V(graph),
      ...,
      mode = c("out", "all", "in"),
      weights = NULL,
      output = c("vpath", "epath", "both"),
      predecessors = FALSE,
      inbound.edges = FALSE,
      algorithm = c("automatic", "unweighted", "dijkstra", "bellman-ford")
    ) {},
    when = "3.0.0"
  ),

  subcomponent = list(
    old = function(graph, v, mode) {},
    new = function(
      graph,
      v,
      ...,
      mode = c("all", "out", "in")
    ) {},
    when = "3.0.0"
  ),

  subgraph_from_edges = list(
    old = function(graph, eids, delete.vertices) {},
    new = function(
      graph,
      eids,
      ...,
      delete.vertices = TRUE
    ) {},
    when = "3.0.0"
  ),

  topo_sort = list(
    old = function(graph, mode) {},
    new = function(
      graph,
      ...,
      mode = c("out", "all", "in")
    ) {},
    when = "3.0.0"
  ),

  transitivity = list(
    old = function(graph, type, vids, weights, isolates) {},
    new = function(
      graph,
      type = c( "undirected", "global", "globalundirected", "localundirected", "local", "average", "localaverage", "localaverageundirected", "barrat", "weighted" ),
      ...,
      vids = NULL,
      weights = NULL,
      isolates = c("NaN", "zero")
    ) {},
    when = "3.0.0"
  ),

  unfold_tree = list(
    old = function(graph, mode, roots) {},
    new = function(
      graph,
      ...,
      mode = c("all", "out", "in", "total"),
      roots
    ) {},
    when = "3.0.0"
  ),

  which_mutual = list(
    old = function(graph, eids, loops) {},
    new = function(
      graph,
      eids = E(graph),
      ...,
      loops = TRUE
    ) {},
    when = "3.0.0"
  )
)
