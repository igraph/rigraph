# styler: off

vcount_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_vcount, graph)


  res
}

lcf_vector_impl <- function(n, shifts, repeats=1) {
  # Argument checks
  n <- as.integer(n)
  shifts <- as.numeric(shifts)
  repeats <- as.integer(repeats)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_lcf_vector, n, shifts, repeats)

  if (igraph_opt("add.params")) {
    res$name <- 'LCF graph'
  }

  res
}

adjlist_impl <- function(adjlist, mode=c("out", "in", "all", "total"), duplicate=TRUE) {
  # Argument checks
  adjlist <- lapply(adjlist, function(x) as.integer(x)-1L)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  duplicate <- as.logical(duplicate)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_adjlist, adjlist, mode, duplicate)

  res
}

realize_degree_sequence_impl <- function(out.deg, in.deg=NULL, allowed.edge.types=c("simple", "loops", "multi", "all"), method=c("smallest", "largest", "index")) {
  # Argument checks
  out.deg <- as.numeric(out.deg)
  if (!is.null(in.deg)) in.deg <- as.numeric(in.deg)
  allowed.edge.types <- switch(igraph.match.arg(allowed.edge.types),
    "simple"=0L, "loop"=1L, "loops"=1L, "multi"=6L, "multiple"=6L, "all"=7L)
  method <- switch(igraph.match.arg(method), "smallest"=0L, "largest"=1L, "index"=2L)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_realize_degree_sequence, out.deg, in.deg, allowed.edge.types, method)

  if (igraph_opt("add.params")) {
    res$name <- 'Graph from degree sequence'
    res$out.deg <- out.deg
    res$in.deg <- in.deg
    res$allowed.edge.types <- allowed.edge.types
    res$method <- method
  }

  res
}

forest_fire_game_impl <- function(nodes, fw.prob, bw.factor=1, ambs=1, directed=TRUE) {
  # Argument checks
  nodes <- as.integer(nodes)
  fw.prob <- as.numeric(fw.prob)
  bw.factor <- as.numeric(bw.factor)
  ambs <- as.integer(ambs)
  directed <- as.logical(directed)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_forest_fire_game, nodes, fw.prob, bw.factor, ambs, directed)

  if (igraph_opt("add.params")) {
    res$name <- 'Forest fire model'
    res$fw.prob <- fw.prob
    res$bw.factor <- bw.factor
    res$ambs <- ambs
  }

  res
}

simple_interconnected_islands_game_impl <- function(islands.n, islands.size, islands.pin, n.inter) {
  # Argument checks
  islands.n <- as.integer(islands.n)
  islands.size <- as.integer(islands.size)
  islands.pin <- as.numeric(islands.pin)
  n.inter <- as.integer(n.inter)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_simple_interconnected_islands_game, islands.n, islands.size, islands.pin, n.inter)

  if (igraph_opt("add.params")) {
    res$name <- 'Interconnected islands model'
    res$islands.n <- islands.n
    res$islands.size <- islands.size
    res$islands.pin <- islands.pin
    res$n.inter <- n.inter
  }

  res
}

static_fitness_game_impl <- function(no.of.edges, fitness.out, fitness.in=NULL, loops=FALSE, multiple=FALSE) {
  # Argument checks
  no.of.edges <- as.integer(no.of.edges)
  fitness.out <- as.numeric(fitness.out)
  if (!is.null(fitness.in)) fitness.in <- as.numeric(fitness.in)
  loops <- as.logical(loops)
  multiple <- as.logical(multiple)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_static_fitness_game, no.of.edges, fitness.out, fitness.in, loops, multiple)

  if (igraph_opt("add.params")) {
    res$name <- 'Static fitness model'
    res$loops <- loops
    res$multiple <- multiple
  }

  res
}

static_power_law_game_impl <- function(no.of.nodes, no.of.edges, exponent.out, exponent.in=-1, loops=FALSE, multiple=FALSE, finite.size.correction=TRUE) {
  # Argument checks
  no.of.nodes <- as.integer(no.of.nodes)
  no.of.edges <- as.integer(no.of.edges)
  exponent.out <- as.numeric(exponent.out)
  exponent.in <- as.numeric(exponent.in)
  loops <- as.logical(loops)
  multiple <- as.logical(multiple)
  finite.size.correction <- as.logical(finite.size.correction)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_static_power_law_game, no.of.nodes, no.of.edges, exponent.out, exponent.in, loops, multiple, finite.size.correction)

  if (igraph_opt("add.params")) {
    res$name <- 'Static power law model'
    res$exponent.out <- exponent.out
    res$exponent.in <- exponent.in
    res$loops <- loops
    res$multiple <- multiple
    res$finite.size.correction <- finite.size.correction
  }

  res
}

k_regular_game_impl <- function(no.of.nodes, k, directed=FALSE, multiple=FALSE) {
  # Argument checks
  no.of.nodes <- as.integer(no.of.nodes)
  k <- as.integer(k)
  directed <- as.logical(directed)
  multiple <- as.logical(multiple)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_k_regular_game, no.of.nodes, k, directed, multiple)

  if (igraph_opt("add.params")) {
    res$name <- 'k-regular graph'
    res$k <- k
  }

  res
}

sbm_game_impl <- function(n, pref.matrix, block.sizes, directed=FALSE, loops=FALSE) {
  # Argument checks
  n <- as.integer(n)
  pref.matrix <- as.matrix(structure(as.double(pref.matrix), dim=dim(pref.matrix)))
  block.sizes <- as.integer(block.sizes)
  directed <- as.logical(directed)
  loops <- as.logical(loops)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_sbm_game, n, pref.matrix, block.sizes, directed, loops)

  if (igraph_opt("add.params")) {
    res$name <- 'Stochastic block model'
    res$loops <- loops
  }

  res
}

hsbm_game_impl <- function(n, m, rho, C, p) {
  # Argument checks
  n <- as.integer(n)
  m <- as.integer(m)
  rho <- as.numeric(rho)
  C <- as.matrix(structure(as.double(C), dim=dim(C)))
  p <- as.numeric(p)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_hsbm_game, n, m, rho, C, p)

  if (igraph_opt("add.params")) {
    res$name <- 'Hierarchical stochastic block model'
    res$m <- m
    res$rho <- rho
    res$C <- C
    res$p <- p
  }

  res
}

hsbm_list_game_impl <- function(n, mlist, rholist, Clist, p) {
  # Argument checks
  n <- as.integer(n)
  mlist <- as.integer(mlist)
  if (!all(sapply(Clist, is.matrix))) {
    stop("Clist is not a list of matrices")
  }
  p <- as.numeric(p)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_hsbm_list_game, n, mlist, rholist, Clist, p)

  if (igraph_opt("add.params")) {
    res$name <- 'Hierarchical stochastic block model'
    res$p <- p
  }

  res
}

correlated_game_impl <- function(old.graph, corr, p=edge_density(old.graph), permutation=NULL) {
  # Argument checks
  ensure_igraph(old.graph)
  corr <- as.numeric(corr)
  p <- as.numeric(p)
  if (!is.null(permutation)) permutation <- as.numeric(permutation)-1

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_correlated_game, old.graph, corr, p, permutation)

  if (igraph_opt("add.params")) {
    res$name <- 'Correlated random graph'
    res$corr <- corr
    res$p <- p
  }

  res
}

correlated_pair_game_impl <- function(n, corr, p, directed=FALSE, permutation=NULL) {
  # Argument checks
  n <- as.integer(n)
  corr <- as.numeric(corr)
  p <- as.numeric(p)
  directed <- as.logical(directed)
  if (!is.null(permutation)) permutation <- as.numeric(permutation)-1

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_correlated_pair_game, n, corr, p, directed, permutation)

  res
}

dot_product_game_impl <- function(vecs, directed=FALSE) {
  # Argument checks
  vecs <- as.matrix(structure(as.double(vecs), dim=dim(vecs)))
  directed <- as.logical(directed)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_dot_product_game, vecs, directed)

  res
}

sample_sphere_surface_impl <- function(dim, n=1, radius=1, positive=TRUE) {
  # Argument checks
  dim <- as.integer(dim)
  n <- as.integer(n)
  radius <- as.numeric(radius)
  positive <- as.logical(positive)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_sample_sphere_surface, dim, n, radius, positive)

  res
}

sample_sphere_volume_impl <- function(dim, n=1, radius=1, positive=TRUE) {
  # Argument checks
  dim <- as.integer(dim)
  n <- as.integer(n)
  radius <- as.numeric(radius)
  positive <- as.logical(positive)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_sample_sphere_volume, dim, n, radius, positive)

  res
}

sample_dirichlet_impl <- function(n, alpha) {
  # Argument checks
  n <- as.integer(n)
  alpha <- as.numeric(alpha)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_sample_dirichlet, n, alpha)

  res
}

harmonic_centrality_cutoff_impl <- function(graph, vids=V(graph), mode=c("out", "in", "all", "total"), weights=NULL, normalized=FALSE, cutoff=-1) {
  # Argument checks
  ensure_igraph(graph)
  vids <- as_igraph_vs(graph, vids)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  normalized <- as.logical(normalized)
  cutoff <- as.numeric(cutoff)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_harmonic_centrality_cutoff, graph, vids-1, mode, weights, normalized, cutoff)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res) <- vertex_attr(graph, "name", vids)
  }
  res
}

personalized_pagerank_impl <- function(graph, algo=c("prpack", "arpack"), vids=V(graph), directed=TRUE, damping=0.85, personalized=NULL, weights=NULL, options=NULL) {
  # Argument checks
  ensure_igraph(graph)
  algo <- switch(igraph.match.arg(algo), "arpack"=1L, "prpack"=2L)
  vids <- as_igraph_vs(graph, vids)
  directed <- as.logical(directed)
  damping <- as.numeric(damping)
  if (!is.null(personalized)) personalized <- as.numeric(personalized)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  if (is.null(options)) {
    if (algo == 0L) {
      options <- list(niter=1000, eps=0.001)
    } else if (algo == 1L) {
      options <- arpack_defaults
    } else {
      options <- NULL
    }
  }

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_personalized_pagerank, graph, algo, vids-1, directed, damping, personalized, weights, options)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res$vector) <- vertex_attr(graph, "name", vids)
  }
  res
}

reverse_edges_impl <- function(graph, eids=E(graph)) {
  # Argument checks
  ensure_igraph(graph)
  eids <- as_igraph_es(graph, eids)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_reverse_edges, graph, eids-1)

  res
}

average_path_length_dijkstra_impl <- function(graph, weights=NULL, directed=TRUE, unconnected=TRUE, details=FALSE) {
  # Argument checks
  ensure_igraph(graph)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  directed <- as.logical(directed)
  unconnected <- as.logical(unconnected)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_average_path_length_dijkstra, graph, weights, directed, unconnected)
  if (!details) {
    res <- res$res
  }
  res
}

path_length_hist_impl <- function(graph, directed=TRUE) {
  # Argument checks
  ensure_igraph(graph)
  directed <- as.logical(directed)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_path_length_hist, graph, directed)

  res
}

simplify_impl <- function(graph, remove.multiple=TRUE, remove.loops=TRUE, edge.attr.comb=igraph_opt("edge.attr.comb")) {
  # Argument checks
  ensure_igraph(graph)
  remove.multiple <- as.logical(remove.multiple)
  remove.loops <- as.logical(remove.loops)
  edge.attr.comb <- igraph.i.attribute.combination(edge.attr.comb)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_simplify, graph, remove.multiple, remove.loops, edge.attr.comb)

  res
}

feedback_arc_set_impl <- function(graph, weights=NULL, algo=c("approx_eades", "exact_ip")) {
  # Argument checks
  ensure_igraph(graph)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  algo <- switch(igraph.match.arg(algo), "exact_ip"=0L, "approx_eades"=1L)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_feedback_arc_set, graph, weights, algo)
  if (igraph_opt("return.vs.es")) {
    res <- create_es(graph, res)
  }
  res
}

is_loop_impl <- function(graph, eids=E(graph)) {
  # Argument checks
  ensure_igraph(graph)
  eids <- as_igraph_es(graph, eids)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_is_loop, graph, eids-1)

  res
}

is_dag_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_is_dag, graph)

  res
}

is_simple_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_is_simple, graph)

  res
}

is_multiple_impl <- function(graph, eids=E(graph)) {
  # Argument checks
  ensure_igraph(graph)
  eids <- as_igraph_es(graph, eids)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_is_multiple, graph, eids-1)

  res
}

has_loop_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_has_loop, graph)

  res
}

has_multiple_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_has_multiple, graph)

  res
}

count_multiple_impl <- function(graph, eids=E(graph)) {
  # Argument checks
  ensure_igraph(graph)
  eids <- as_igraph_es(graph, eids)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_count_multiple, graph, eids-1)

  res
}

eigenvector_centrality_impl <- function(graph, directed=FALSE, scale=TRUE, weights=NULL, options=arpack_defaults) {
  # Argument checks
  ensure_igraph(graph)
  directed <- as.logical(directed)
  scale <- as.logical(scale)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  options.tmp <- arpack_defaults; options.tmp[ names(options) ] <- options ; options <- options.tmp

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_eigenvector_centrality, graph, directed, scale, weights, options)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res$vector) <- vertex_attr(graph, "name", V(graph))
  }
  res
}

hub_score_impl <- function(graph, scale=TRUE, weights=NULL, options=arpack_defaults) {
  # Argument checks
  ensure_igraph(graph)
  scale <- as.logical(scale)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  options.tmp <- arpack_defaults; options.tmp[ names(options) ] <- options ; options <- options.tmp

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_hub_score, graph, scale, weights, options)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res$vector) <- vertex_attr(graph, "name", V(graph))
  }
  res
}

authority_score_impl <- function(graph, scale=TRUE, weights=NULL, options=arpack_defaults) {
  # Argument checks
  ensure_igraph(graph)
  scale <- as.logical(scale)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  options.tmp <- arpack_defaults; options.tmp[ names(options) ] <- options ; options <- options.tmp

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_authority_score, graph, scale, weights, options)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res$vector) <- vertex_attr(graph, "name", V(graph))
  }
  res
}

is_mutual_impl <- function(graph, eids=E(graph)) {
  # Argument checks
  ensure_igraph(graph)
  eids <- as_igraph_es(graph, eids)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_is_mutual, graph, eids-1)

  res
}

maximum_cardinality_search_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_maximum_cardinality_search, graph)
  if (igraph_opt("return.vs.es")) {
    res$alpham1 <- create_vs(graph, res$alpham1)
  }
  res
}

avg_nearest_neighbor_degree_impl <- function(graph, vids=V(graph), mode=c("all", "out", "in", "total"), neighbor.degree.mode=c("all", "out", "in", "total"), weights=NULL) {
  # Argument checks
  ensure_igraph(graph)
  vids <- as_igraph_vs(graph, vids)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  neighbor.degree.mode <- switch(igraph.match.arg(neighbor.degree.mode), "out"=1, "in"=2, "all"=3, "total"=3)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_avg_nearest_neighbor_degree, graph, vids-1, mode, neighbor.degree.mode, weights)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res$knn) <- vertex_attr(graph, "name", vids)
  }
  res
}

strength_impl <- function(graph, vids=V(graph), mode=c("all", "out", "in", "total"), loops=TRUE, weights=NULL) {
  # Argument checks
  ensure_igraph(graph)
  vids <- as_igraph_vs(graph, vids)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  loops <- as.logical(loops)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_strength, graph, vids-1, mode, loops, weights)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res) <- vertex_attr(graph, "name", vids)
  }
  res
}

centralization_impl <- function(scores, theoretical.max=0, normalized=TRUE) {
  # Argument checks
  scores <- as.numeric(scores)
  theoretical.max <- as.numeric(theoretical.max)
  normalized <- as.logical(normalized)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_centralization, scores, theoretical.max, normalized)


  res
}

centralization_degree_impl <- function(graph, mode=c("all", "out", "in", "total"), loops=TRUE, normalized=TRUE) {
  # Argument checks
  ensure_igraph(graph)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  loops <- as.logical(loops)
  normalized <- as.logical(normalized)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_centralization_degree, graph, mode, loops, normalized)

  res
}

centralization_betweenness_impl <- function(graph, directed=TRUE, normalized=TRUE) {
  # Argument checks
  ensure_igraph(graph)
  directed <- as.logical(directed)
  normalized <- as.logical(normalized)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_centralization_betweenness, graph, directed, normalized)

  res
}

centralization_betweenness_tmax_impl <- function(graph=NULL, nodes=0, directed=TRUE) {
  # Argument checks
  ensure_igraph(graph, optional = TRUE)
  nodes <- as.integer(nodes)
  directed <- as.logical(directed)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_centralization_betweenness_tmax, graph, nodes, directed)

  res
}

centralization_closeness_impl <- function(graph, mode=c("out", "in", "all", "total"), normalized=TRUE) {
  # Argument checks
  ensure_igraph(graph)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  normalized <- as.logical(normalized)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_centralization_closeness, graph, mode, normalized)

  res
}

centralization_closeness_tmax_impl <- function(graph=NULL, nodes=0, mode=c("out", "in", "all", "total")) {
  # Argument checks
  ensure_igraph(graph, optional = TRUE)
  nodes <- as.integer(nodes)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_centralization_closeness_tmax, graph, nodes, mode)

  res
}

centralization_eigenvector_centrality_impl <- function(graph, directed=FALSE, scale=TRUE, options=arpack_defaults, normalized=TRUE) {
  # Argument checks
  ensure_igraph(graph)
  directed <- as.logical(directed)
  scale <- as.logical(scale)
  options.tmp <- arpack_defaults; options.tmp[ names(options) ] <- options ; options <- options.tmp
  normalized <- as.logical(normalized)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_centralization_eigenvector_centrality, graph, directed, scale, options, normalized)

  res
}

centralization_eigenvector_centrality_tmax_impl <- function(graph=NULL, nodes=0, directed=FALSE, scale=TRUE) {
  # Argument checks
  ensure_igraph(graph, optional = TRUE)
  nodes <- as.integer(nodes)
  directed <- as.logical(directed)
  scale <- as.logical(scale)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_centralization_eigenvector_centrality_tmax, graph, nodes, directed, scale)

  res
}

assortativity_nominal_impl <- function(graph, types, directed=TRUE) {
  # Argument checks
  ensure_igraph(graph)
  types <- as.numeric(types)-1
  directed <- as.logical(directed)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_assortativity_nominal, graph, types, directed)

  res
}

assortativity_impl <- function(graph, types1, types2=NULL, directed=TRUE) {
  # Argument checks
  ensure_igraph(graph)
  types1 <- as.numeric(types1)
  if (!is.null(types2)) types2 <- as.numeric(types2)
  directed <- as.logical(directed)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_assortativity, graph, types1, types2, directed)

  res
}

assortativity_degree_impl <- function(graph, directed=TRUE) {
  # Argument checks
  ensure_igraph(graph)
  directed <- as.logical(directed)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_assortativity_degree, graph, directed)

  res
}

contract_vertices_impl <- function(graph, mapping, vertex.attr.comb=igraph_opt("vertex.attr.comb")) {
  # Argument checks
  ensure_igraph(graph)
  mapping <- as.numeric(mapping)-1
  vertex.attr.comb <- igraph.i.attribute.combination(vertex.attr.comb)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_contract_vertices, graph, mapping, vertex.attr.comb)

  res
}

eccentricity_impl <- function(graph, vids=V(graph), mode=c("all", "out", "in", "total")) {
  # Argument checks
  ensure_igraph(graph)
  vids <- as_igraph_vs(graph, vids)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_eccentricity, graph, vids-1, mode)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res) <- vertex_attr(graph, "name", vids)
  }
  res
}

radius_impl <- function(graph, mode=c("all", "out", "in", "total")) {
  # Argument checks
  ensure_igraph(graph)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_radius, graph, mode)

  res
}

diversity_impl <- function(graph, weights=NULL, vids=V(graph)) {
  # Argument checks
  ensure_igraph(graph)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  vids <- as_igraph_vs(graph, vids)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_diversity, graph, weights, vids-1)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res) <- vertex_attr(graph, "name", vids)
  }
  res
}

random_walk_impl <- function(graph, start, steps, mode=c("out", "in", "all", "total"), stuck=c("return", "error")) {
  # Argument checks
  ensure_igraph(graph)
  start <- as_igraph_vs(graph, start)
  if (length(start) == 0) {
    stop("No vertex was specified")
  }
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  steps <- as.integer(steps)
  stuck <- switch(igraph.match.arg(stuck), "error" = 0L, "return" = 1L)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_random_walk, graph, start-1, mode, steps, stuck)
  if (igraph_opt("return.vs.es")) {
    res <- create_vs(graph, res)
  }
  res
}

random_edge_walk_impl <- function(graph, start, steps, weights=NULL, mode=c("out", "in", "all", "total"), stuck=c("return", "error")) {
  # Argument checks
  ensure_igraph(graph)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  start <- as_igraph_vs(graph, start)
  if (length(start) == 0) {
    stop("No vertex was specified")
  }
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  steps <- as.integer(steps)
  stuck <- switch(igraph.match.arg(stuck), "error" = 0L, "return" = 1L)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_random_edge_walk, graph, weights, start-1, mode, steps, stuck)
  if (igraph_opt("return.vs.es")) {
    res <- create_es(graph, res)
  }
  res
}

global_efficiency_impl <- function(graph, weights=NULL, directed=TRUE) {
  # Argument checks
  ensure_igraph(graph)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  directed <- as.logical(directed)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_global_efficiency, graph, weights, directed)

  res
}

local_efficiency_impl <- function(graph, vids=V(graph), weights=NULL, directed=TRUE, mode=c("all", "out", "in", "total")) {
  # Argument checks
  ensure_igraph(graph)
  vids <- as_igraph_vs(graph, vids)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  directed <- as.logical(directed)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_local_efficiency, graph, vids-1, weights, directed, mode)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res) <- vertex_attr(graph, "name", vids)
  }
  res
}

average_local_efficiency_impl <- function(graph, weights=NULL, directed=TRUE, mode=c("all", "out", "in", "total")) {
  # Argument checks
  ensure_igraph(graph)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  directed <- as.logical(directed)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_average_local_efficiency, graph, weights, directed, mode)

  res
}

is_graphical_impl <- function(out.deg, in.deg=NULL, allowed.edge.types=c("simple", "loops", "multi", "all")) {
  # Argument checks
  out.deg <- as.numeric(out.deg)
  if (!is.null(in.deg)) in.deg <- as.numeric(in.deg)
  allowed.edge.types <- switch(igraph.match.arg(allowed.edge.types),
    "simple"=0L, "loop"=1L, "loops"=1L, "multi"=6L, "multiple"=6L, "all"=7L)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_is_graphical, out.deg, in.deg, allowed.edge.types)

  res
}

bipartite_projection_size_impl <- function(graph, types=NULL) {
  # Argument checks
  ensure_igraph(graph)
  types <- handle_vertex_type_arg(types, graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_bipartite_projection_size, graph, types)

  res
}

is_bipartite_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_is_bipartite, graph)

  res
}

is_connected_impl <- function(graph, mode=c("weak", "strong")) {
  # Argument checks
  ensure_igraph(graph)
  mode <- switch(igraph.match.arg(mode), "weak"=1, "strong"=2)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_is_connected, graph, mode)

  res
}

articulation_points_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_articulation_points, graph)
  if (igraph_opt("return.vs.es")) {
    res <- create_vs(graph, res)
  }
  res
}

biconnected_components_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_biconnected_components, graph)
  if (igraph_opt("return.vs.es")) {
    es <- E(graph)
    for (i_ in seq_along(res$tree.edges)) {
      res$tree.edges[[i_]] <- unsafe_create_es(graph, res$tree.edges[[i_]], es = es)
    }
  }
  if (igraph_opt("return.vs.es")) {
    es <- E(graph)
    for (i_ in seq_along(res$component.edges)) {
      res$component.edges[[i_]] <- unsafe_create_es(graph, res$component.edges[[i_]], es = es)
    }
  }
  if (igraph_opt("return.vs.es")) {
    verts <- V(graph)
    for (i_ in seq_along(res$components)) {
      res$components[[i_]] <- unsafe_create_vs(graph, res$components[[i_]], verts = verts)
    }
  }
  if (igraph_opt("return.vs.es")) {
    res$articulation.points <- create_vs(graph, res$articulation.points)
  }
  res
}

bridges_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_bridges, graph)
  if (igraph_opt("return.vs.es")) {
    res <- create_es(graph, res)
  }
  res
}

cliques_impl <- function(graph, min=0, max=0) {
  # Argument checks
  ensure_igraph(graph)
  min <- as.integer(min)
  max <- as.integer(max)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_cliques, graph, min, max)
  if (igraph_opt("return.vs.es")) {
    verts <- V(graph)
    for (i_ in seq_along(res)) {
      res[[i_]] <- unsafe_create_vs(graph, res[[i_]], verts = verts)
    }
  }
  res
}

clique_size_hist_impl <- function(graph, min.size=0, max.size=0) {
  # Argument checks
  ensure_igraph(graph)
  min.size <- as.integer(min.size)
  max.size <- as.integer(max.size)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_clique_size_hist, graph, min.size, max.size)

  res
}

largest_cliques_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_largest_cliques, graph)
  if (igraph_opt("return.vs.es")) {
    verts <- V(graph)
    for (i_ in seq_along(res)) {
      res[[i_]] <- unsafe_create_vs(graph, res[[i_]], verts = verts)
    }
  }
  res
}

maximal_cliques_hist_impl <- function(graph, min.size=0, max.size=0) {
  # Argument checks
  ensure_igraph(graph)
  min.size <- as.integer(min.size)
  max.size <- as.integer(max.size)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_maximal_cliques_hist, graph, min.size, max.size)

  res
}

clique_number_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_clique_number, graph)

  res
}

weighted_cliques_impl <- function(graph, vertex.weights=NULL, min.weight=0, max.weight=0, maximal=FALSE) {
  # Argument checks
  ensure_igraph(graph)
  if (is.null(vertex.weights) && "weight" %in% vertex_attr_names(graph)) {
    vertex.weights <- V(graph)$weight
  }
  if (!is.null(vertex.weights) && any(!is.na(vertex.weights))) {
    vertex.weights <- as.numeric(vertex.weights)
  } else {
    vertex.weights <- NULL
  }
  min.weight <- as.numeric(min.weight)
  max.weight <- as.numeric(max.weight)
  maximal <- as.logical(maximal)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_weighted_cliques, graph, vertex.weights, min.weight, max.weight, maximal)
  if (igraph_opt("return.vs.es")) {
    verts <- V(graph)
    for (i_ in seq_along(res)) {
      res[[i_]] <- unsafe_create_vs(graph, res[[i_]], verts = verts)
    }
  }
  res
}

largest_weighted_cliques_impl <- function(graph, vertex.weights=NULL) {
  # Argument checks
  ensure_igraph(graph)
  if (is.null(vertex.weights) && "weight" %in% vertex_attr_names(graph)) {
    vertex.weights <- V(graph)$weight
  }
  if (!is.null(vertex.weights) && any(!is.na(vertex.weights))) {
    vertex.weights <- as.numeric(vertex.weights)
  } else {
    vertex.weights <- NULL
  }

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_largest_weighted_cliques, graph, vertex.weights)
  if (igraph_opt("return.vs.es")) {
    verts <- V(graph)
    for (i_ in seq_along(res)) {
      res[[i_]] <- unsafe_create_vs(graph, res[[i_]], verts = verts)
    }
  }
  res
}

weighted_clique_number_impl <- function(graph, vertex.weights=NULL) {
  # Argument checks
  ensure_igraph(graph)
  if (is.null(vertex.weights) && "weight" %in% vertex_attr_names(graph)) {
    vertex.weights <- V(graph)$weight
  }
  if (!is.null(vertex.weights) && any(!is.na(vertex.weights))) {
    vertex.weights <- as.numeric(vertex.weights)
  } else {
    vertex.weights <- NULL
  }

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_weighted_clique_number, graph, vertex.weights)

  res
}

similarity_jaccard_impl <- function(graph, vids=V(graph), mode=c("all", "out", "in", "total"), loops=FALSE) {
  # Argument checks
  ensure_igraph(graph)
  vids <- as_igraph_vs(graph, vids)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  loops <- as.logical(loops)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_similarity_jaccard, graph, vids-1, mode, loops)

  res
}

similarity_dice_impl <- function(graph, vids=V(graph), mode=c("all", "out", "in", "total"), loops=FALSE) {
  # Argument checks
  ensure_igraph(graph)
  vids <- as_igraph_vs(graph, vids)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  loops <- as.logical(loops)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_similarity_dice, graph, vids-1, mode, loops)

  res
}

similarity_inverse_log_weighted_impl <- function(graph, vids=V(graph), mode=c("all", "out", "in", "total")) {
  # Argument checks
  ensure_igraph(graph)
  vids <- as_igraph_vs(graph, vids)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_similarity_inverse_log_weighted, graph, vids-1, mode)

  res
}

hrg_game_impl <- function(hrg) {
  # Argument checks
  if (is.null(hrg)) {
    hrg <- list(left=c(), right=c(), prob=c(), edges=c(), vertices=c())
  }
  hrg <- lapply(hrg[c("left","right","prob","edges","vertices")], as.numeric)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_hrg_game, hrg)

  if (igraph_opt("add.params")) {
    res$name <- 'Hierarchical random graph model'
  }

  res
}

hrg_dendrogram_impl <- function(hrg) {
  # Argument checks
  if (is.null(hrg)) {
    hrg <- list(left=c(), right=c(), prob=c(), edges=c(), vertices=c())
  }
  hrg <- lapply(hrg[c("left","right","prob","edges","vertices")], as.numeric)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_hrg_dendrogram, hrg)

  res
}

hrg_consensus_impl <- function(graph, hrg=NULL, start=FALSE, num.samples=10000) {
  # Argument checks
  ensure_igraph(graph)
  if (is.null(hrg)) {
    hrg <- list(left=c(), right=c(), prob=c(), edges=c(), vertices=c())
  }
  hrg <- lapply(hrg[c("left","right","prob","edges","vertices")], as.numeric)
  start <- as.logical(start)
  num.samples <- as.integer(num.samples)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_hrg_consensus, graph, hrg, start, num.samples)

  res
}

hrg_create_impl <- function(graph, prob) {
  # Argument checks
  ensure_igraph(graph)
  prob <- as.numeric(prob)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_hrg_create, graph, prob)

  class(res) <- "igraphHRG"
  res
}

graphlets_impl <- function(graph, weights=NULL, niter=1000) {
  # Argument checks
  ensure_igraph(graph)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  niter <- as.integer(niter)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_graphlets, graph, weights, niter)
  if (igraph_opt("return.vs.es")) {
    verts <- V(graph)
    for (i_ in seq_along(res$cliques)) {
      res$cliques[[i_]] <- unsafe_create_vs(graph, res$cliques[[i_]], verts = verts)
    }
  }
  res
}

to_directed_impl <- function(graph, mode=c("mutual", "arbitrary", "random", "acyclic")) {
  # Argument checks
  ensure_igraph(graph)
  mode <- switch(igraph.match.arg(mode), "arbitrary"=0, "mutual"=1, "random"=2, "acyclic"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_to_directed, graph, mode)

  res
}

dyad_census_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_dyad_census, graph)

  res
}

triad_census_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_triad_census, graph)

  res
}

adjacent_triangles_impl <- function(graph, vids=V(graph)) {
  # Argument checks
  ensure_igraph(graph)
  vids <- as_igraph_vs(graph, vids)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_adjacent_triangles, graph, vids-1)

  res
}

list_triangles_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_list_triangles, graph)
  if (igraph_opt("return.vs.es")) {
    res <- create_vs(graph, res)
  }
  res
}

maxflow_impl <- function(graph, source, target, capacity=NULL) {
  # Argument checks
  ensure_igraph(graph)
  source <- as_igraph_vs(graph, source)
  if (length(source) == 0) {
    stop("No vertex was specified")
  }
  target <- as_igraph_vs(graph, target)
  if (length(target) == 0) {
    stop("No vertex was specified")
  }
  if (is.null(capacity) && "capacity" %in% edge_attr_names(graph)) {
    capacity <- E(graph)$capacity
  }
  if (!is.null(capacity) && any(!is.na(capacity))) {
    capacity <- as.numeric(capacity)
  } else {
    capacity <- NULL
  }

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_maxflow, graph, source-1, target-1, capacity)
  if (igraph_opt("return.vs.es")) {
    res$partition1 <- create_vs(graph, res$partition1)
  }
  if (igraph_opt("return.vs.es")) {
    res$partition2 <- create_vs(graph, res$partition2)
  }
  res
}

dominator_tree_impl <- function(graph, root, mode=c("out", "in", "all", "total")) {
  # Argument checks
  ensure_igraph(graph)
  root <- as_igraph_vs(graph, root)
  if (length(root) == 0) {
    stop("No vertex was specified")
  }
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_dominator_tree, graph, root-1, mode)
  if (igraph_opt("return.vs.es")) {
    res$leftout <- create_vs(graph, res$leftout)
  }
  res
}

all_st_cuts_impl <- function(graph, source, target) {
  # Argument checks
  ensure_igraph(graph)
  source <- as_igraph_vs(graph, source)
  if (length(source) == 0) {
    stop("No vertex was specified")
  }
  target <- as_igraph_vs(graph, target)
  if (length(target) == 0) {
    stop("No vertex was specified")
  }

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_all_st_cuts, graph, source-1, target-1)
  if (igraph_opt("return.vs.es")) {
    es <- E(graph)
    for (i_ in seq_along(res$cuts)) {
      res$cuts[[i_]] <- unsafe_create_es(graph, res$cuts[[i_]], es = es)
    }
  }
  if (igraph_opt("return.vs.es")) {
    verts <- V(graph)
    for (i_ in seq_along(res$partition1s)) {
      res$partition1s[[i_]] <- unsafe_create_vs(graph, res$partition1s[[i_]], verts = verts)
    }
  }
  res
}

all_st_mincuts_impl <- function(graph, source, target, capacity=NULL) {
  # Argument checks
  ensure_igraph(graph)
  source <- as_igraph_vs(graph, source)
  if (length(source) == 0) {
    stop("No vertex was specified")
  }
  target <- as_igraph_vs(graph, target)
  if (length(target) == 0) {
    stop("No vertex was specified")
  }
  if (is.null(capacity) && "weight" %in% edge_attr_names(graph)) {
    capacity <- E(graph)$weight
  }
  if (!is.null(capacity) && any(!is.na(capacity))) {
    capacity <- as.numeric(capacity)
  } else {
    capacity <- NULL
  }

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_all_st_mincuts, graph, source-1, target-1, capacity)
  if (igraph_opt("return.vs.es")) {
    es <- E(graph)
    for (i_ in seq_along(res$cuts)) {
      res$cuts[[i_]] <- unsafe_create_es(graph, res$cuts[[i_]], es = es)
    }
  }
  if (igraph_opt("return.vs.es")) {
    verts <- V(graph)
    for (i_ in seq_along(res$partition1s)) {
      res$partition1s[[i_]] <- unsafe_create_vs(graph, res$partition1s[[i_]], verts = verts)
    }
  }
  res
}

is_separator_impl <- function(graph, candidate) {
  # Argument checks
  ensure_igraph(graph)
  candidate <- as_igraph_vs(graph, candidate)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_is_separator, graph, candidate-1)

  res
}

is_minimal_separator_impl <- function(graph, candidate) {
  # Argument checks
  ensure_igraph(graph)
  candidate <- as_igraph_vs(graph, candidate)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_is_minimal_separator, graph, candidate-1)

  res
}

all_minimal_st_separators_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_all_minimal_st_separators, graph)
  if (igraph_opt("return.vs.es")) {
    verts <- V(graph)
    for (i_ in seq_along(res)) {
      res[[i_]] <- unsafe_create_vs(graph, res[[i_]], verts = verts)
    }
  }
  res
}

minimum_size_separators_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_minimum_size_separators, graph)
  if (igraph_opt("return.vs.es")) {
    verts <- V(graph)
    for (i_ in seq_along(res)) {
      res[[i_]] <- unsafe_create_vs(graph, res[[i_]], verts = verts)
    }
  }
  res
}

isoclass_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_isoclass, graph)

  res
}

isomorphic_impl <- function(graph1, graph2) {
  # Argument checks
  ensure_igraph(graph1)
  ensure_igraph(graph2)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_isomorphic, graph1, graph2)

  res
}

isoclass_create_impl <- function(size, number, directed=TRUE) {
  # Argument checks
  size <- as.integer(size)
  number <- as.integer(number)
  directed <- as.logical(directed)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_isoclass_create, size, number, directed)

  res
}

isomorphic_vf2_impl <- function(graph1, graph2, vertex.color1, vertex.color2, edge.color1, edge.color2) {
  # Argument checks
  ensure_igraph(graph1)
  ensure_igraph(graph2)
  if (missing(vertex.color1)) {
    if ("color" %in% vertex_attr_names(graph1)) {
      vertex.color1 <- V(graph1)$color
    } else {
      vertex.color1 <- NULL
    }
  }
  if (!is.null(vertex.color1)) {
    vertex.color1 <- as.integer(vertex.color1)-1L
  }
  if (missing(vertex.color2)) {
    if ("color" %in% vertex_attr_names(graph2)) {
      vertex.color2 <- V(graph2)$color
    } else {
      vertex.color2 <- NULL
    }
  }
  if (!is.null(vertex.color2)) {
    vertex.color2 <- as.integer(vertex.color2)-1L
  }
  if (missing(edge.color1)) {
    if ("color" %in% edge_attr_names(graph1)) {
      edge.color1 <- E(graph1)$color
    } else {
      edge.color1 <- NULL
    }
  }
  if (!is.null(edge.color1)) {
    edge.color1 <- as.integer(edge.color1)-1L
  }
  if (missing(edge.color2)) {
    if ("color" %in% edge_attr_names(graph2)) {
      edge.color2 <- E(graph2)$color
    } else {
      edge.color2 <- NULL
    }
  }
  if (!is.null(edge.color2)) {
    edge.color2 <- as.integer(edge.color2)-1L
  }

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_isomorphic_vf2, graph1, graph2, vertex.color1, vertex.color2, edge.color1, edge.color2)

  res
}

count_isomorphisms_vf2_impl <- function(graph1, graph2, vertex.color1, vertex.color2, edge.color1, edge.color2) {
  # Argument checks
  ensure_igraph(graph1)
  ensure_igraph(graph2)
  if (missing(vertex.color1)) {
    if ("color" %in% vertex_attr_names(graph1)) {
      vertex.color1 <- V(graph1)$color
    } else {
      vertex.color1 <- NULL
    }
  }
  if (!is.null(vertex.color1)) {
    vertex.color1 <- as.integer(vertex.color1)-1L
  }
  if (missing(vertex.color2)) {
    if ("color" %in% vertex_attr_names(graph2)) {
      vertex.color2 <- V(graph2)$color
    } else {
      vertex.color2 <- NULL
    }
  }
  if (!is.null(vertex.color2)) {
    vertex.color2 <- as.integer(vertex.color2)-1L
  }
  if (missing(edge.color1)) {
    if ("color" %in% edge_attr_names(graph1)) {
      edge.color1 <- E(graph1)$color
    } else {
      edge.color1 <- NULL
    }
  }
  if (!is.null(edge.color1)) {
    edge.color1 <- as.integer(edge.color1)-1L
  }
  if (missing(edge.color2)) {
    if ("color" %in% edge_attr_names(graph2)) {
      edge.color2 <- E(graph2)$color
    } else {
      edge.color2 <- NULL
    }
  }
  if (!is.null(edge.color2)) {
    edge.color2 <- as.integer(edge.color2)-1L
  }

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_count_isomorphisms_vf2, graph1, graph2, vertex.color1, vertex.color2, edge.color1, edge.color2)

  res
}

subisomorphic_vf2_impl <- function(graph1, graph2, vertex.color1, vertex.color2, edge.color1, edge.color2) {
  # Argument checks
  ensure_igraph(graph1)
  ensure_igraph(graph2)
  if (missing(vertex.color1)) {
    if ("color" %in% vertex_attr_names(graph1)) {
      vertex.color1 <- V(graph1)$color
    } else {
      vertex.color1 <- NULL
    }
  }
  if (!is.null(vertex.color1)) {
    vertex.color1 <- as.integer(vertex.color1)-1L
  }
  if (missing(vertex.color2)) {
    if ("color" %in% vertex_attr_names(graph2)) {
      vertex.color2 <- V(graph2)$color
    } else {
      vertex.color2 <- NULL
    }
  }
  if (!is.null(vertex.color2)) {
    vertex.color2 <- as.integer(vertex.color2)-1L
  }
  if (missing(edge.color1)) {
    if ("color" %in% edge_attr_names(graph1)) {
      edge.color1 <- E(graph1)$color
    } else {
      edge.color1 <- NULL
    }
  }
  if (!is.null(edge.color1)) {
    edge.color1 <- as.integer(edge.color1)-1L
  }
  if (missing(edge.color2)) {
    if ("color" %in% edge_attr_names(graph2)) {
      edge.color2 <- E(graph2)$color
    } else {
      edge.color2 <- NULL
    }
  }
  if (!is.null(edge.color2)) {
    edge.color2 <- as.integer(edge.color2)-1L
  }

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_subisomorphic_vf2, graph1, graph2, vertex.color1, vertex.color2, edge.color1, edge.color2)

  res
}

count_subisomorphisms_vf2_impl <- function(graph1, graph2, vertex.color1, vertex.color2, edge.color1, edge.color2) {
  # Argument checks
  ensure_igraph(graph1)
  ensure_igraph(graph2)
  if (missing(vertex.color1)) {
    if ("color" %in% vertex_attr_names(graph1)) {
      vertex.color1 <- V(graph1)$color
    } else {
      vertex.color1 <- NULL
    }
  }
  if (!is.null(vertex.color1)) {
    vertex.color1 <- as.integer(vertex.color1)-1L
  }
  if (missing(vertex.color2)) {
    if ("color" %in% vertex_attr_names(graph2)) {
      vertex.color2 <- V(graph2)$color
    } else {
      vertex.color2 <- NULL
    }
  }
  if (!is.null(vertex.color2)) {
    vertex.color2 <- as.integer(vertex.color2)-1L
  }
  if (missing(edge.color1)) {
    if ("color" %in% edge_attr_names(graph1)) {
      edge.color1 <- E(graph1)$color
    } else {
      edge.color1 <- NULL
    }
  }
  if (!is.null(edge.color1)) {
    edge.color1 <- as.integer(edge.color1)-1L
  }
  if (missing(edge.color2)) {
    if ("color" %in% edge_attr_names(graph2)) {
      edge.color2 <- E(graph2)$color
    } else {
      edge.color2 <- NULL
    }
  }
  if (!is.null(edge.color2)) {
    edge.color2 <- as.integer(edge.color2)-1L
  }

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_count_subisomorphisms_vf2, graph1, graph2, vertex.color1, vertex.color2, edge.color1, edge.color2)

  res
}

isomorphic_34_impl <- function(graph1, graph2) {
  # Argument checks
  ensure_igraph(graph1)
  ensure_igraph(graph2)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_isomorphic, graph1, graph2)

  res
}

canonical_permutation_impl <- function(graph, colors, sh=c("fm", "f", "fs", "fl", "flm", "fsm")) {
  # Argument checks
  ensure_igraph(graph)
  if (missing(colors)) {
    if ("color" %in% vertex_attr_names(graph)) {
      colors <- V(graph)$color
    } else {
      colors <- NULL
    }
  }
  if (!is.null(colors)) {
    colors <- as.integer(colors)-1L
  }
  sh <- switch(igraph.match.arg(sh), "f"=0, "fl"=1, "fs"=2, "fm"=3, "flm"=4, "fsm"=5)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_canonical_permutation, graph, colors, sh)

  res
}

permute_vertices_impl <- function(graph, permutation) {
  # Argument checks
  ensure_igraph(graph)
  permutation <- as.numeric(permutation)-1

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_permute_vertices, graph, permutation)

  res
}

isomorphic_bliss_impl <- function(graph1, graph2, colors1, colors2, sh=c("fm", "f", "fs", "fl", "flm", "fsm")) {
  # Argument checks
  ensure_igraph(graph1)
  ensure_igraph(graph2)
  if (missing(colors1)) {
    if ("color" %in% vertex_attr_names(graph1)) {
      colors1 <- V(graph1)$color
    } else {
      colors1 <- NULL
    }
  }
  if (!is.null(colors1)) {
    colors1 <- as.integer(colors1)-1L
  }
  if (missing(colors2)) {
    if ("color" %in% vertex_attr_names(graph2)) {
      colors2 <- V(graph2)$color
    } else {
      colors2 <- NULL
    }
  }
  if (!is.null(colors2)) {
    colors2 <- as.integer(colors2)-1L
  }
  sh <- switch(igraph.match.arg(sh), "f"=0, "fl"=1, "fs"=2, "fm"=3, "flm"=4, "fsm"=5)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_isomorphic_bliss, graph1, graph2, colors1, colors2, sh)

  res
}

automorphisms_impl <- function(graph, colors, sh=c("fm", "f", "fs", "fl", "flm", "fsm")) {
  # Argument checks
  ensure_igraph(graph)
  if (missing(colors)) {
    if ("color" %in% vertex_attr_names(graph)) {
      colors <- V(graph)$color
    } else {
      colors <- NULL
    }
  }
  if (!is.null(colors)) {
    colors <- as.integer(colors)-1L
  }
  sh <- switch(igraph.match.arg(sh), "f"=0, "fl"=1, "fs"=2, "fm"=3, "flm"=4, "fsm"=5)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_automorphisms, graph, colors, sh)

  res
}

automorphism_group_impl <- function(graph, colors, sh=c("fm", "f", "fs", "fl", "flm", "fsm"), details=FALSE) {
  # Argument checks
  ensure_igraph(graph)
  if (missing(colors)) {
    if ("color" %in% vertex_attr_names(graph)) {
      colors <- V(graph)$color
    } else {
      colors <- NULL
    }
  }
  if (!is.null(colors)) {
    colors <- as.integer(colors)-1L
  }
  sh <- switch(igraph.match.arg(sh), "f"=0, "fl"=1, "fs"=2, "fm"=3, "flm"=4, "fsm"=5)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_automorphism_group, graph, colors, sh)
  if (igraph_opt("return.vs.es")) {
    verts <- V(graph)
    for (i_ in seq_along(res$generators)) {
      res$generators[[i_]] <- unsafe_create_vs(graph, res$generators[[i_]], verts = verts)
    }
  }
  if (!details) {
    res <- res$generators
  }
  res
}

scg_norm_eps_impl <- function(V, groups, mtype=c("symmetric", "laplacian", "stochastic"), p=NULL, norm=c("row", "col")) {
  # Argument checks
  V <- as.matrix(structure(as.double(V), dim=dim(V)))
  groups <- as.numeric(groups)-1
  mtype <- switch(igraph.match.arg(mtype), "symmetric"=1, "laplacian"=2, "stochastic"=3)
  if (!is.null(p)) p <- as.numeric(p)
  norm <- switch(igraph.match.arg(norm), "row"=1, "col"=2)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_scg_norm_eps, V, groups, mtype, p, norm)

  res
}

adjacency_spectral_embedding_impl <- function(graph, no, weights=NULL, which=c("lm", "la", "sa"), scaled=TRUE, cvec=graph.strength(graph, weights=weights)/(vcount(graph)-1), options=igraph.arpack.default) {
  # Argument checks
  ensure_igraph(graph)
  no <- as.integer(no)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  which <- switch(igraph.match.arg(which), "lm"=0L, "la"=2L, "sa"=3L)
  scaled <- as.logical(scaled)
  cvec <- as.numeric(cvec)
  options.tmp <- arpack_defaults; options.tmp[ names(options) ] <- options ; options <- options.tmp

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_adjacency_spectral_embedding, graph, no, weights, which, scaled, cvec, options)

  res
}

laplacian_spectral_embedding_impl <- function(graph, no, weights=NULL, which=c("lm", "la", "sa"), type=c("default", "D-A", "DAD", "I-DAD", "OAP"), scaled=TRUE, options=igraph.arpack.default) {
  # Argument checks
  ensure_igraph(graph)
  no <- as.integer(no)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  which <- switch(igraph.match.arg(which), "lm"=0L, "la"=2L, "sa"=3L)
  type <- switch(igraph.match.arg(type),
    "default"=if (is.directed(graph)) 3L else 0L,
    "da"=0L, "d-a"=0L, "idad"=1L, "i-dad"=1L, "dad"=2L,
    "oap"=3L)
  scaled <- as.logical(scaled)
  options.tmp <- arpack_defaults; options.tmp[ names(options) ] <- options ; options <- options.tmp

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_laplacian_spectral_embedding, graph, no, weights, which, type, scaled, options)

  res
}

eigen_adjacency_impl <- function(graph, algorithm=c("arpack", "auto", "lapack", "comp_auto", "comp_lapack", "comp_arpack"), which=list(), options=arpack_defaults) {
  # Argument checks
  ensure_igraph(graph)
  algorithm <- switch(igraph.match.arg(algorithm), "auto"=0, "lapack"=1,
    "arpack"=2, "comp_auto"=3, "comp_lapack"=4,
    "comp_arpack"=5)
  which.tmp <- eigen_defaults();
  which.tmp[ names(which) ] <- which ; which <- which.tmp
  options.tmp <- arpack_defaults; options.tmp[ names(options) ] <- options ; options <- options.tmp

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_eigen_adjacency, graph, algorithm, which, options)

  res
}

sir_impl <- function(graph, beta, gamma, no.sim=100) {
  # Argument checks
  ensure_igraph(graph)
  beta <- as.numeric(beta)
  gamma <- as.numeric(gamma)
  no.sim <- as.integer(no.sim)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_sir, graph, beta, gamma, no.sim)

  class(res) <- "sir"
  res
}

convex_hull_impl <- function(data) {
  # Argument checks
  data <- as.matrix(structure(as.double(data), dim=dim(data)))

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_convex_hull, data)

  res
}

dim_select_impl <- function(sv) {
  # Argument checks
  sv <- as.numeric(sv)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_dim_select, sv)

  res
}

is_eulerian_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_is_eulerian, graph)

  res
}

eulerian_path_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_eulerian_path, graph)
  if (igraph_opt("return.vs.es")) {
    res$epath <- create_es(graph, res$epath)
  }
  if (igraph_opt("return.vs.es")) {
    res$vpath <- create_vs(graph, res$vpath)
  }
  res
}

eulerian_cycle_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_eulerian_cycle, graph)
  if (igraph_opt("return.vs.es")) {
    res$epath <- create_es(graph, res$epath)
  }
  if (igraph_opt("return.vs.es")) {
    res$vpath <- create_vs(graph, res$vpath)
  }
  res
}

is_tree_impl <- function(graph, mode=c("out", "in", "all", "total"), details=FALSE) {
  # Argument checks
  ensure_igraph(graph)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_is_tree, graph, mode)
  if (igraph_opt("return.vs.es")) {
    res$root <- create_vs(graph, res$root)
  }
  if (!details) {
    res <- res$res
  }
  res
}

from_prufer_impl <- function(prufer) {
  # Argument checks
  prufer <- as.integer(prufer)-1L

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_from_prufer, prufer)

  if (igraph_opt("add.params")) {
    res$name <- 'Tree from Prufer sequence'
    res$prufer <- prufer
  }

  res
}

to_prufer_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_to_prufer, graph)
  res <- res+1
  res
}

random_spanning_tree_impl <- function(graph, vid=0) {
  # Argument checks
  ensure_igraph(graph)
  vid <- as_igraph_vs(graph, vid)
  if (length(vid) == 0) {
    stop("No vertex was specified")
  }

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_random_spanning_tree, graph, vid-1)
  if (igraph_opt("return.vs.es")) {
    res <- create_es(graph, res)
  }
  res
}

tree_game_impl <- function(n, directed=FALSE, method=c("lerw", "prufer")) {
  # Argument checks
  n <- as.integer(n)
  directed <- as.logical(directed)
  method <- switch(igraph.match.arg(method), "prufer"=0L, "lerw"=1L)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_tree_game, n, directed, method)

  res
}

vertex_coloring_greedy_impl <- function(graph, heuristic=c("colored_neighbors")) {
  # Argument checks
  ensure_igraph(graph)
  heuristic <- switch(igraph.match.arg(heuristic), "colored_neighbors"=0L)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_vertex_coloring_greedy, graph, heuristic)
  res <- res+1L
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res) <- vertex_attr(graph, "name")
  }
  res
}

