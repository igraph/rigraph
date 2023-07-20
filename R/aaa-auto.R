# styler: off

copy_impl <- function(from) {
  # Argument checks
  ensure_igraph(from)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_copy, from)

  res
}

delete_vertices_idx_impl <- function(graph, vertices) {
  # Argument checks
  ensure_igraph(graph)
  vertices <- as_igraph_vs(graph, vertices)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_delete_vertices_idx, graph, vertices-1)

  res
}

vcount_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_vcount, graph)


  res
}

empty_attrs_impl <- function(n, directed, attr) {
  # Argument checks
  n <- as.integer(n)
  directed <- as.logical(directed)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_empty_attrs, n, directed, attr)

  res
}

get_all_eids_between_impl <- function(graph, from, to, directed=TRUE) {
  # Argument checks
  ensure_igraph(graph)
  from <- as_igraph_vs(graph, from)
  if (length(from) == 0) {
    stop("No vertex was specified")
  }
  to <- as_igraph_vs(graph, to)
  if (length(to) == 0) {
    stop("No vertex was specified")
  }
  directed <- as.logical(directed)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_get_all_eids_between, graph, from-1, to-1, directed)

  res
}

sparse_adjacency_impl <- function(adjmatrix, mode=DIRECTED, loops=ONCE) {
  # Argument checks
  require(Matrix); adjmatrix <- as(as(as(adjmatrix, "dMatrix"), "generalMatrix"), "CsparseMatrix")

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_sparse_adjacency, adjmatrix, mode, loops)

  res
}

sparse_weighted_adjacency_impl <- function(adjmatrix, mode=DIRECTED, loops=ONCE) {
  # Argument checks
  require(Matrix); adjmatrix <- as(as(as(adjmatrix, "dMatrix"), "generalMatrix"), "CsparseMatrix")

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_sparse_weighted_adjacency, adjmatrix, mode, loops)

  res
}

wheel_impl <- function(n, mode=OUT, center=0) {
  # Argument checks
  n <- as.integer(n)
  center <- as.integer(center)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_wheel, n, mode, center)

  res
}

square_lattice_impl <- function(dimvector, nei=1, directed=FALSE, mutual=FALSE, periodic) {
  # Argument checks
  dimvector <- as.numeric(dimvector)
  nei <- as.integer(nei)
  directed <- as.logical(directed)
  mutual <- as.logical(mutual)
  periodic <- as.logical(periodic)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_square_lattice, dimvector, nei, directed, mutual, periodic)

  res
}

triangular_lattice_impl <- function(dimvector, directed=FALSE, mutual=FALSE) {
  # Argument checks
  dimvector <- as.numeric(dimvector)
  directed <- as.logical(directed)
  mutual <- as.logical(mutual)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_triangular_lattice, dimvector, directed, mutual)

  res
}

kary_tree_impl <- function(n, children=2, type=OUT) {
  # Argument checks
  n <- as.integer(n)
  children <- as.integer(children)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_kary_tree, n, children, type)

  res
}

symmetric_tree_impl <- function(branches, type=OUT) {
  # Argument checks
  branches <- as.numeric(branches)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_symmetric_tree, branches, type)

  res
}

regular_tree_impl <- function(h, k=3, type=UNDIRECTED) {
  # Argument checks
  h <- as.integer(h)
  k <- as.integer(k)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_regular_tree, h, k, type)

  res
}

graph_power_impl <- function(graph, order, directed=false) {
  # Argument checks
  ensure_igraph(graph)
  order <- as.integer(order)
  directed <- as.logical(directed)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_graph_power, graph, order, directed)

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
  adjlist <- lapply(adjlist, function(x) as.double(x)-1L)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  duplicate <- as.logical(duplicate)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_adjlist, adjlist, mode, duplicate)

  res
}

full_multipartite_impl <- function(n, directed=FALSE, mode=c("all", "out", "in", "total")) {
  # Argument checks
  n <- as.numeric(n)
  directed <- as.logical(directed)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_full_multipartite, n, directed, mode)

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

circulant_impl <- function(n, shifts, directed=FALSE) {
  # Argument checks
  n <- as.integer(n)
  shifts <- as.numeric(shifts)
  directed <- as.logical(directed)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_circulant, n, shifts, directed)

  res
}

generalized_petersen_impl <- function(n, k) {
  # Argument checks
  n <- as.integer(n)
  k <- as.integer(k)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_generalized_petersen, n, k)

  res
}

turan_impl <- function(n, r) {
  # Argument checks
  n <- as.integer(n)
  r <- as.integer(r)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_turan, n, r)

  res
}

weighted_sparsemat_impl <- function(A, directed, attr, loops=FALSE) {
  # Argument checks
  require(Matrix); A <- as(as(as(A, "dMatrix"), "generalMatrix"), "CsparseMatrix")
  directed <- as.logical(directed)
  loops <- as.logical(loops)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_weighted_sparsemat, A, directed, attr, loops)

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

static_fitness_game_impl <- function(no.of.edges, fitness.out, fitness.in, loops=FALSE, multiple=FALSE) {
  # Argument checks
  no.of.edges <- as.integer(no.of.edges)
  fitness.out <- as.numeric(fitness.out)
  fitness.in <- as.numeric(fitness.in)
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
  block.sizes <- as.numeric(block.sizes)
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
  mlist <- as.numeric(mlist)
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
  permutation <- as.numeric(permutation)-1L

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
  permutation <- as.numeric(permutation)-1L

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

distances_impl <- function(graph, from=V(graph), to=V(graph), mode=c("out", "in", "all", "total")) {
  # Argument checks
  ensure_igraph(graph)
  from <- as_igraph_vs(graph, from)
  to <- as_igraph_vs(graph, to)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_distances, graph, from-1, to-1, mode)

  res
}

distances_cutoff_impl <- function(graph, from=V(graph), to=V(graph), mode=c("out", "in", "all", "total"), cutoff=-1) {
  # Argument checks
  ensure_igraph(graph)
  from <- as_igraph_vs(graph, from)
  to <- as_igraph_vs(graph, to)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  cutoff <- as.numeric(cutoff)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_distances_cutoff, graph, from-1, to-1, mode, cutoff)

  res
}

get_shortest_path_impl <- function(graph, from, to, mode=c("out", "in", "all", "total")) {
  # Argument checks
  ensure_igraph(graph)
  from <- as_igraph_vs(graph, from)
  if (length(from) == 0) {
    stop("No vertex was specified")
  }
  to <- as_igraph_vs(graph, to)
  if (length(to) == 0) {
    stop("No vertex was specified")
  }
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_get_shortest_path, graph, from-1, to-1, mode)

  res
}

get_shortest_path_bellman_ford_impl <- function(graph, from, to, weights=NULL, mode=c("out", "in", "all", "total")) {
  # Argument checks
  ensure_igraph(graph)
  from <- as_igraph_vs(graph, from)
  if (length(from) == 0) {
    stop("No vertex was specified")
  }
  to <- as_igraph_vs(graph, to)
  if (length(to) == 0) {
    stop("No vertex was specified")
  }
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_get_shortest_path_bellman_ford, graph, from-1, to-1, weights, mode)

  res
}

get_shortest_path_dijkstra_impl <- function(graph, from, to, weights=NULL, mode=c("out", "in", "all", "total")) {
  # Argument checks
  ensure_igraph(graph)
  from <- as_igraph_vs(graph, from)
  if (length(from) == 0) {
    stop("No vertex was specified")
  }
  to <- as_igraph_vs(graph, to)
  if (length(to) == 0) {
    stop("No vertex was specified")
  }
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_get_shortest_path_dijkstra, graph, from-1, to-1, weights, mode)

  res
}

distances_dijkstra_impl <- function(graph, from=V(graph), to=V(graph), weights, mode=c("out", "in", "all", "total")) {
  # Argument checks
  ensure_igraph(graph)
  from <- as_igraph_vs(graph, from)
  to <- as_igraph_vs(graph, to)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_distances_dijkstra, graph, from-1, to-1, weights, mode)

  res
}

distances_dijkstra_cutoff_impl <- function(graph, from=V(graph), to=V(graph), weights, mode=c("out", "in", "all", "total"), cutoff=-1) {
  # Argument checks
  ensure_igraph(graph)
  from <- as_igraph_vs(graph, from)
  to <- as_igraph_vs(graph, to)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  cutoff <- as.numeric(cutoff)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_distances_dijkstra_cutoff, graph, from-1, to-1, weights, mode, cutoff)

  res
}

distances_bellman_ford_impl <- function(graph, from=V(graph), to=V(graph), weights, mode=c("out", "in", "all", "total")) {
  # Argument checks
  ensure_igraph(graph)
  from <- as_igraph_vs(graph, from)
  to <- as_igraph_vs(graph, to)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_distances_bellman_ford, graph, from-1, to-1, weights, mode)

  res
}

distances_johnson_impl <- function(graph, from=V(graph), to=V(graph), weights) {
  # Argument checks
  ensure_igraph(graph)
  from <- as_igraph_vs(graph, from)
  to <- as_igraph_vs(graph, to)
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
  res <- .Call(R_igraph_distances_johnson, graph, from-1, to-1, weights)

  res
}

distances_floyd_warshall_impl <- function(graph, from=V(graph), to=V(graph), weights=NULL, mode=c("out", "in", "all", "total"), method) {
  # Argument checks
  ensure_igraph(graph)
  from <- as_igraph_vs(graph, from)
  to <- as_igraph_vs(graph, to)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_distances_floyd_warshall, graph, from-1, to-1, weights, mode, method)

  res
}

voronoi_impl <- function(graph, generators, weights=NULL, mode=c("out", "in", "all", "total"), tiebreaker=RANDOM) {
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
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_voronoi, graph, generators, weights, mode, tiebreaker)

  res
}

get_k_shortest_paths_impl <- function(graph, weights, k, from, to, mode=c("out", "in", "all", "total")) {
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
  k <- as.integer(k)
  from <- as_igraph_vs(graph, from)
  if (length(from) == 0) {
    stop("No vertex was specified")
  }
  to <- as_igraph_vs(graph, to)
  if (length(to) == 0) {
    stop("No vertex was specified")
  }
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_get_k_shortest_paths, graph, weights, k, from-1, to-1, mode)
  if (igraph_opt("return.vs.es")) {
    verts <- V(graph)
    for (i_ in seq_along(res$vertex.paths)) {
      res$vertex.paths[[i_]] <- unsafe_create_vs(graph, res$vertex.paths[[i_]], verts = verts)
    }
  }
  if (igraph_opt("return.vs.es")) {
    es <- E(graph)
    for (i_ in seq_along(res$edge.paths)) {
      res$edge.paths[[i_]] <- unsafe_create_es(graph, res$edge.paths[[i_]], es = es)
    }
  }
  res
}

get_widest_path_impl <- function(graph, from, to, weights=NULL, mode=c("out", "in", "all", "total")) {
  # Argument checks
  ensure_igraph(graph)
  from <- as_igraph_vs(graph, from)
  if (length(from) == 0) {
    stop("No vertex was specified")
  }
  to <- as_igraph_vs(graph, to)
  if (length(to) == 0) {
    stop("No vertex was specified")
  }
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_get_widest_path, graph, from-1, to-1, weights, mode)

  res
}

get_widest_paths_impl <- function(graph, from, to=V(graph), weights=NULL, mode=c("out", "in", "all", "total")) {
  # Argument checks
  ensure_igraph(graph)
  from <- as_igraph_vs(graph, from)
  if (length(from) == 0) {
    stop("No vertex was specified")
  }
  to <- as_igraph_vs(graph, to)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_get_widest_paths, graph, from-1, to-1, weights, mode)
  if (igraph_opt("return.vs.es")) {
    verts <- V(graph)
    for (i_ in seq_along(res$vertices)) {
      res$vertices[[i_]] <- unsafe_create_vs(graph, res$vertices[[i_]], verts = verts)
    }
  }
  if (igraph_opt("return.vs.es")) {
    es <- E(graph)
    for (i_ in seq_along(res$edges)) {
      res$edges[[i_]] <- unsafe_create_es(graph, res$edges[[i_]], es = es)
    }
  }
  res
}

widest_path_widths_dijkstra_impl <- function(graph, from=V(graph), to=V(graph), weights, mode=c("out", "in", "all", "total")) {
  # Argument checks
  ensure_igraph(graph)
  from <- as_igraph_vs(graph, from)
  to <- as_igraph_vs(graph, to)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_widest_path_widths_dijkstra, graph, from-1, to-1, weights, mode)

  res
}

widest_path_widths_floyd_warshall_impl <- function(graph, from=V(graph), to=V(graph), weights, mode=c("out", "in", "all", "total")) {
  # Argument checks
  ensure_igraph(graph)
  from <- as_igraph_vs(graph, from)
  to <- as_igraph_vs(graph, to)
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
    weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
    weights <- as.numeric(weights)
  } else {
    weights <- NULL
  }
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_widest_path_widths_floyd_warshall, graph, from-1, to-1, weights, mode)

  res
}

spanner_impl <- function(graph, stretch, weights) {
  # Argument checks
  ensure_igraph(graph)
  stretch <- as.numeric(stretch)
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
  res <- .Call(R_igraph_spanner, graph, stretch, weights)

  res
}

betweenness_subset_impl <- function(graph, vids=V(graph), directed=TRUE, sources=V(graph), targets=V(graph), weights=NULL) {
  # Argument checks
  ensure_igraph(graph)
  vids <- as_igraph_vs(graph, vids)
  directed <- as.logical(directed)
  sources <- as_igraph_vs(graph, sources)
  targets <- as_igraph_vs(graph, targets)
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
  res <- .Call(R_igraph_betweenness_subset, graph, vids-1, directed, sources-1, targets-1, weights)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res) <- vertex_attr(graph, "name", )
  }
  res
}

edge_betweenness_subset_impl <- function(graph, eids=E(graph), directed=TRUE, sources=V(graph), targets=V(graph), weights=NULL) {
  # Argument checks
  ensure_igraph(graph)
  eids <- as_igraph_es(graph, eids)
  directed <- as.logical(directed)
  sources <- as_igraph_vs(graph, sources)
  targets <- as_igraph_vs(graph, targets)
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
  res <- .Call(R_igraph_edge_betweenness_subset, graph, eids-1, directed, sources-1, targets-1, weights)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res) <- vertex_attr(graph, "name", )
  }
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

personalized_pagerank_impl <- function(graph, algo=c("prpack", "arpack"), vids=V(graph), directed=TRUE, damping=0.85, personalized, weights, options=NULL) {
  # Argument checks
  ensure_igraph(graph)
  algo <- switch(igraph.match.arg(algo), "arpack"=1L, "prpack"=2L)
  vids <- as_igraph_vs(graph, vids)
  directed <- as.logical(directed)
  damping <- as.numeric(damping)
  personalized <- as.numeric(personalized)
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

personalized_pagerank_vs_impl <- function(graph, algo=c("prpack", "arpack"), vids=V(graph), directed=TRUE, damping=0.85, reset.vids, weights=NULL, options=NULL, details=FALSE) {
  # Argument checks
  ensure_igraph(graph)
  algo <- switch(igraph.match.arg(algo), "arpack"=1L, "prpack"=2L)
  vids <- as_igraph_vs(graph, vids)
  directed <- as.logical(directed)
  damping <- as.numeric(damping)
  reset.vids <- as_igraph_vs(graph, reset.vids)
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
  res <- .Call(R_igraph_personalized_pagerank_vs, graph, algo, vids-1, directed, damping, reset.vids-1, weights, options)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res$vector) <- vertex_attr(graph, "name", vids)
  }
  if (!details) {
    res <- res$vector
  }
  res
}

subgraph_from_edges_impl <- function(graph, eids, delete.vertices=TRUE) {
  # Argument checks
  ensure_igraph(graph)
  eids <- as_igraph_es(graph, eids)
  delete.vertices <- as.logical(delete.vertices)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_subgraph_from_edges, graph, eids-1, delete.vertices)

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

ecc_impl <- function(graph, eids=E(graph), k=3, offset=FALSE, normalize=TRUE) {
  # Argument checks
  ensure_igraph(graph)
  eids <- as_igraph_es(graph, eids)
  k <- as.integer(k)
  offset <- as.logical(offset)
  normalize <- as.logical(normalize)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_ecc, graph, eids-1, k, offset, normalize)

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

is_acyclic_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_is_acyclic, graph)

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

is_perfect_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_is_perfect, graph)

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

hub_and_authority_scores_impl <- function(graph, scale=TRUE, weights=NULL, options=arpack_defaults) {
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
  res <- .Call(R_igraph_hub_and_authority_scores, graph, scale, weights, options)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res$hub.vector) <- vertex_attr(graph, "name", )
  }
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res$authority.vector) <- vertex_attr(graph, "name", )
  }
  res
}

is_mutual_impl <- function(graph, eids=E(graph), loops=TRUE) {
  # Argument checks
  ensure_igraph(graph)
  eids <- as_igraph_es(graph, eids)
  loops <- as.logical(loops)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_is_mutual, graph, eids-1, loops)

  res
}

has_mutual_impl <- function(graph, loops=TRUE) {
  # Argument checks
  ensure_igraph(graph)
  loops <- as.logical(loops)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_has_mutual, graph, loops)

  res
}

maximum_cardinality_search_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_maximum_cardinality_search, graph)

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

centralization_betweenness_tmax_impl <- function(graph, nodes=0, directed=TRUE) {
  # Argument checks
  ensure_igraph(graph)
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

centralization_closeness_tmax_impl <- function(graph, nodes=0, mode=c("out", "in", "all", "total")) {
  # Argument checks
  ensure_igraph(graph)
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

centralization_eigenvector_centrality_tmax_impl <- function(graph, nodes=0, directed=FALSE, scale=TRUE) {
  # Argument checks
  ensure_igraph(graph)
  nodes <- as.integer(nodes)
  directed <- as.logical(directed)
  scale <- as.logical(scale)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_centralization_eigenvector_centrality_tmax, graph, nodes, directed, scale)

  res
}

assortativity_nominal_impl <- function(graph, types, directed=TRUE, normalized=TRUE) {
  # Argument checks
  ensure_igraph(graph)
  types <- as.numeric(types)-1L
  directed <- as.logical(directed)
  normalized <- as.logical(normalized)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_assortativity_nominal, graph, types, directed, normalized)

  res
}

assortativity_impl <- function(graph, values, values.in, directed=TRUE, normalized=TRUE) {
  # Argument checks
  ensure_igraph(graph)
  values <- as.numeric(values)
  values.in <- as.numeric(values.in)
  directed <- as.logical(directed)
  normalized <- as.logical(normalized)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_assortativity, graph, values, values.in, directed, normalized)

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
  mapping <- as.numeric(mapping)-1L
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

eccentricity_dijkstra_impl <- function(graph, weights=NULL, vids=V(graph), mode=c("all", "out", "in", "total")) {
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
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_eccentricity_dijkstra, graph, weights, vids-1, mode)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res) <- vertex_attr(graph, "name", vids)
  }
  res
}

graph_center_impl <- function(graph, mode=c("all", "out", "in", "total")) {
  # Argument checks
  ensure_igraph(graph)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_graph_center, graph, mode)

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

pseudo_diameter_impl <- function(graph, start.vid, directed=TRUE, unconnected=TRUE) {
  # Argument checks
  ensure_igraph(graph)
  start.vid <- as_igraph_vs(graph, start.vid)
  if (length(start.vid) == 0) {
    stop("No vertex was specified")
  }
  directed <- as.logical(directed)
  unconnected <- as.logical(unconnected)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_pseudo_diameter, graph, start.vid-1, directed, unconnected)

  res
}

pseudo_diameter_impl <- function(graph, weights=NULL, start.vid, directed=TRUE, unconnected=TRUE) {
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
  start.vid <- as_igraph_vs(graph, start.vid)
  if (length(start.vid) == 0) {
    stop("No vertex was specified")
  }
  directed <- as.logical(directed)
  unconnected <- as.logical(unconnected)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_pseudo_diameter_dijkstra, graph, weights, start.vid-1, directed, unconnected)

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

random_walk_impl <- function(graph, start, steps, weights=NULL, mode=c("out", "in", "all", "total"), stuck=c("return", "error")) {
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
  res <- .Call(R_igraph_random_walk, graph, weights, start-1, mode, steps, stuck)

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

transitive_closure_dag_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_transitive_closure_dag, graph)

  res
}

trussness_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_trussness, graph)

  res
}

is_graphical_impl <- function(out.deg, in.deg, allowed.edge.types=c("simple", "loops", "multi", "all")) {
  # Argument checks
  out.deg <- as.numeric(out.deg)
  in.deg <- as.numeric(in.deg)
  allowed.edge.types <- switch(igraph.match.arg(allowed.edge.types),
    "simple"=0L, "loop"=1L, "loops"=1L, "multi"=6L, "multiple"=6L, "all"=7L)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_is_graphical, out.deg, in.deg, allowed.edge.types)

  res
}

bfs_simple_impl <- function(graph, root, mode=c("out", "in", "all", "total")) {
  # Argument checks
  ensure_igraph(graph)
  root <- as_igraph_vs(graph, root)
  if (length(root) == 0) {
    stop("No vertex was specified")
  }
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_bfs_simple, graph, root-1, mode)

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

biadjacency_impl <- function(incidence, directed=FALSE, mode=c("all", "out", "in", "total"), multiple=FALSE) {
  # Argument checks
  incidence <- as.matrix(structure(as.double(incidence), dim=dim(incidence)))
  directed <- as.logical(directed)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  multiple <- as.logical(multiple)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_biadjacency, incidence, directed, mode, multiple)
  if (igraph_opt("add.vertex.names") && is_named()) {
    names(res$types) <- vertex_attr(, "name", )
  }
  res
}

get_biadjacency_impl <- function(graph, types=NULL) {
  # Argument checks
  ensure_igraph(graph)
  types <- handle_vertex_type_arg(types, graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_get_biadjacency, graph, types)

  res
}

is_bipartite_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_is_bipartite, graph)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res$type) <- vertex_attr(graph, "name", )
  }
  res
}

bipartite_game_impl <- function(type, n1, n2, p=0.0, m=0, directed=FALSE, mode=c("all", "out", "in", "total")) {
  # Argument checks
  n1 <- as.integer(n1)
  n2 <- as.integer(n2)
  p <- as.numeric(p)
  m <- as.integer(m)
  directed <- as.logical(directed)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_bipartite_game, type, n1, n2, p, m, directed, mode)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res$types) <- vertex_attr(graph, "name", )
  }
  res
}

get_laplacian_impl <- function(graph, mode=c("out", "in", "all", "total"), normalization=UNNORMALIZED, weights=NULL) {
  # Argument checks
  ensure_igraph(graph)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
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
  res <- .Call(R_igraph_get_laplacian, graph, mode, normalization, weights)

  res
}

get_laplacian_sparse_impl <- function(graph, mode=c("out", "in", "all", "total"), normalization=UNNORMALIZED, weights=NULL) {
  # Argument checks
  ensure_igraph(graph)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
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
  res <- .Call(R_igraph_get_laplacian_sparse, graph, mode, normalization, weights)

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
  res
}

bridges_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_bridges, graph)

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

maximal_cliques_subset_impl <- function(graph, subset, outfile=NULL, min.size=0, max.size=0, details=FALSE) {
  # Argument checks
  ensure_igraph(graph)
  min.size <- as.integer(min.size)
  max.size <- as.integer(max.size)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_maximal_cliques_subset, graph, subset, outfile, min.size, max.size)
  if (igraph_opt("return.vs.es")) {
    verts <- V(graph)
    for (i_ in seq_along(res$res)) {
      res$res[[i_]] <- unsafe_create_vs(graph, res$res[[i_]], verts = verts)
    }
  }
  if (!details) {
    res <- res$res
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

roots_for_tree_layout_impl <- function(graph, mode=c("out", "in", "all", "total"), heuristic) {
  # Argument checks
  ensure_igraph(graph)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_roots_for_tree_layout, graph, mode, heuristic)

  res
}

layout_umap_impl <- function(graph, res, use.seed=FALSE, distances=NULL, min.dist=0.0, epochs=200, distances.are.weights=FALSE) {
  # Argument checks
  ensure_igraph(graph)
  res <- as.matrix(structure(as.double(res), dim=dim(res)))
  use.seed <- as.logical(use.seed)
  distances <- as.numeric(distances)
  min.dist <- as.numeric(min.dist)
  epochs <- as.integer(epochs)
  distances.are.weights <- as.logical(distances.are.weights)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_layout_umap, graph, res, use.seed, distances, min.dist, epochs, distances.are.weights)

  res
}

layout_umap_3d_impl <- function(graph, res, use.seed=FALSE, distances=NULL, min.dist=0.0, epochs=200, distances.are.weights=FALSE) {
  # Argument checks
  ensure_igraph(graph)
  res <- as.matrix(structure(as.double(res), dim=dim(res)))
  use.seed <- as.logical(use.seed)
  distances <- as.numeric(distances)
  min.dist <- as.numeric(min.dist)
  epochs <- as.integer(epochs)
  distances.are.weights <- as.logical(distances.are.weights)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_layout_umap_3d, graph, res, use.seed, distances, min.dist, epochs, distances.are.weights)

  res
}

layout_umap_compute_weights_impl <- function(graph, distances, weights) {
  # Argument checks
  ensure_igraph(graph)
  distances <- as.numeric(distances)
  weights <- as.numeric(weights)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_layout_umap_compute_weights, graph, distances, weights)

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

similarity_dice_es_impl <- function(graph, es=E(graph), mode=c("all", "out", "in", "total"), loops=FALSE) {
  # Argument checks
  ensure_igraph(graph)
  es <- as_igraph_es(graph, es)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  loops <- as.logical(loops)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_similarity_dice_es, graph, es-1, mode, loops)

  res
}

similarity_dice_pairs_impl <- function(graph, pairs, mode=c("all", "out", "in", "total"), loops=FALSE) {
  # Argument checks
  ensure_igraph(graph)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  loops <- as.logical(loops)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_similarity_dice_pairs, graph, pairs, mode, loops)

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

similarity_jaccard_es_impl <- function(graph, es=E(graph), mode=c("all", "out", "in", "total"), loops=FALSE) {
  # Argument checks
  ensure_igraph(graph)
  es <- as_igraph_es(graph, es)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  loops <- as.logical(loops)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_similarity_jaccard_es, graph, es-1, mode, loops)

  res
}

similarity_jaccard_pairs_impl <- function(graph, pairs, mode=c("all", "out", "in", "total"), loops=FALSE) {
  # Argument checks
  ensure_igraph(graph)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  loops <- as.logical(loops)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_similarity_jaccard_pairs, graph, pairs, mode, loops)

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

hrg_sample_impl <- function(hrg) {
  # Argument checks
  if (is.null(hrg)) {
    hrg <- list(left=c(), right=c(), prob=c(), edges=c(), vertices=c())
  }
  hrg <- lapply(hrg[c("left","right","prob","edges","vertices")], as.numeric)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_hrg_sample, hrg)

  res
}

hrg_sample_many_impl <- function(hrg, num.samples) {
  # Argument checks
  if (is.null(hrg)) {
    hrg <- list(left=c(), right=c(), prob=c(), edges=c(), vertices=c())
  }
  hrg <- lapply(hrg[c("left","right","prob","edges","vertices")], as.numeric)
  num.samples <- as.integer(num.samples)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_hrg_sample_many, hrg, num.samples)

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

hrg_resize_impl <- function(hrg, newsize) {
  # Argument checks
  if (is.null(hrg)) {
    hrg <- list(left=c(), right=c(), prob=c(), edges=c(), vertices=c())
  }
  hrg <- lapply(hrg[c("left","right","prob","edges","vertices")], as.numeric)
  newsize <- as.integer(newsize)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_hrg_resize, hrg, newsize)

  res
}

hrg_size_impl <- function(hrg) {
  # Argument checks
  if (is.null(hrg)) {
    hrg <- list(left=c(), right=c(), prob=c(), edges=c(), vertices=c())
  }
  hrg <- lapply(hrg[c("left","right","prob","edges","vertices")], as.numeric)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_hrg_size, hrg)


  res
}

from_hrg_dendrogram_impl <- function(hrg) {
  # Argument checks
  if (is.null(hrg)) {
    hrg <- list(left=c(), right=c(), prob=c(), edges=c(), vertices=c())
  }
  hrg <- lapply(hrg[c("left","right","prob","edges","vertices")], as.numeric)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_from_hrg_dendrogram, hrg)

  res
}

get_adjacency_sparse_impl <- function(graph, type=BOTH, weights=NULL, loops=ONCE) {
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

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_get_adjacency_sparse, graph, type, weights, loops)

  res
}

get_stochastic_sparse_impl <- function(graph, column.wise=FALSE, weights=NULL) {
  # Argument checks
  ensure_igraph(graph)
  column.wise <- as.logical(column.wise)
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
  res <- .Call(R_igraph_get_stochastic_sparse, graph, column.wise, weights)

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

read_graph_dimacs_flow_impl <- function(instream, directed=TRUE) {
  # Argument checks
  directed <- as.logical(directed)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_read_graph_dimacs_flow, instream, directed)

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

local_scan_subset_ecount_impl <- function(graph, weights=NULL, subsets) {
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

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_local_scan_subset_ecount, graph, weights, subsets)

  res
}

list_triangles_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_list_triangles, graph)

  res
}

induced_subgraph_map_impl <- function(graph, vids, impl) {
  # Argument checks
  ensure_igraph(graph)
  vids <- as_igraph_vs(graph, vids)
  impl <- switch(igraph.match.arg(impl), "auto"=0, "copy_and_delete"=1, "create_from_scratch"=2)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_induced_subgraph_map, graph, vids-1, impl)

  res
}

gomory_hu_tree_impl <- function(graph, capacity) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_gomory_hu_tree, graph, capacity)

  res
}

maxflow_impl <- function(graph, source, target, capacity) {
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
  res <- .Call(R_igraph_maxflow, graph, source-1, target-1, capacity)

  res
}

residual_graph_impl <- function(graph, capacity, flow) {
  # Argument checks
  ensure_igraph(graph)
  flow <- as.numeric(flow)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_residual_graph, graph, capacity, flow)

  res
}

reverse_residual_graph_impl <- function(graph, capacity, flow) {
  # Argument checks
  ensure_igraph(graph)
  flow <- as.numeric(flow)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_reverse_residual_graph, graph, capacity, flow)

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

all_st_mincuts_impl <- function(graph, source, target, capacity) {
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

even_tarjan_reduction_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_even_tarjan_reduction, graph)

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
    vertex.color1 <- as.numeric(vertex.color1)-1L
  }
  if (missing(vertex.color2)) {
    if ("color" %in% vertex_attr_names(graph2)) {
      vertex.color2 <- V(graph2)$color
    } else {
      vertex.color2 <- NULL
    }
  }
  if (!is.null(vertex.color2)) {
    vertex.color2 <- as.numeric(vertex.color2)-1L
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
    vertex.color1 <- as.numeric(vertex.color1)-1L
  }
  if (missing(vertex.color2)) {
    if ("color" %in% vertex_attr_names(graph2)) {
      vertex.color2 <- V(graph2)$color
    } else {
      vertex.color2 <- NULL
    }
  }
  if (!is.null(vertex.color2)) {
    vertex.color2 <- as.numeric(vertex.color2)-1L
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

subisomorphic_impl <- function(graph1, graph2) {
  # Argument checks
  ensure_igraph(graph1)
  ensure_igraph(graph2)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_subisomorphic, graph1, graph2)

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
    vertex.color1 <- as.numeric(vertex.color1)-1L
  }
  if (missing(vertex.color2)) {
    if ("color" %in% vertex_attr_names(graph2)) {
      vertex.color2 <- V(graph2)$color
    } else {
      vertex.color2 <- NULL
    }
  }
  if (!is.null(vertex.color2)) {
    vertex.color2 <- as.numeric(vertex.color2)-1L
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

subisomorphic_function_vf2_impl <- function(graph1, graph2, vertex.color1, vertex.color2, edge.color1, edge.color2, ishohandler.fn) {
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
    vertex.color1 <- as.numeric(vertex.color1)-1L
  }
  if (missing(vertex.color2)) {
    if ("color" %in% vertex_attr_names(graph2)) {
      vertex.color2 <- V(graph2)$color
    } else {
      vertex.color2 <- NULL
    }
  }
  if (!is.null(vertex.color2)) {
    vertex.color2 <- as.numeric(vertex.color2)-1L
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
  res <- .Call(R_igraph_subisomorphic_function_vf2, graph1, graph2, vertex.color1, vertex.color2, edge.color1, edge.color2, ishohandler.fn)

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
    vertex.color1 <- as.numeric(vertex.color1)-1L
  }
  if (missing(vertex.color2)) {
    if ("color" %in% vertex_attr_names(graph2)) {
      vertex.color2 <- V(graph2)$color
    } else {
      vertex.color2 <- NULL
    }
  }
  if (!is.null(vertex.color2)) {
    vertex.color2 <- as.numeric(vertex.color2)-1L
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
    colors <- as.numeric(colors)-1L
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
  permutation <- as.numeric(permutation)-1L

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
    colors1 <- as.numeric(colors1)-1L
  }
  if (missing(colors2)) {
    if ("color" %in% vertex_attr_names(graph2)) {
      colors2 <- V(graph2)$color
    } else {
      colors2 <- NULL
    }
  }
  if (!is.null(colors2)) {
    colors2 <- as.numeric(colors2)-1L
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
    colors <- as.numeric(colors)-1L
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
    colors <- as.numeric(colors)-1L
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

graph_count_impl <- function(n, directed=FALSE) {
  # Argument checks
  n <- as.integer(n)
  directed <- as.logical(directed)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_graph_count, n, directed)

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

almost_equals_impl <- function(a, b, eps) {
  # Argument checks


  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_almost_equals, a, b, eps)


  res
}

cmp_epsilon_impl <- function(a, b, eps) {
  # Argument checks


  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_cmp_epsilon, a, b, eps)


  res
}

eigen_matrix_impl <- function(A, sA, fun, n, algorithm, which, options=igraph.arpack.default) {
  # Argument checks
  A <- as.matrix(structure(as.double(A), dim=dim(A)))
  require(Matrix); sA <- as(as(as(sA, "dMatrix"), "generalMatrix"), "CsparseMatrix")
  n <- as.integer(n)
  algorithm <- switch(igraph.match.arg(algorithm), "auto"=0, "lapack"=1,
    "arpack"=2, "comp_auto"=3, "comp_lapack"=4,
    "comp_arpack"=5)
  which.tmp <- eigen_defaults();
  which.tmp[ names(which) ] <- which ; which <- which.tmp
  options.tmp <- arpack_defaults; options.tmp[ names(options) ] <- options ; options <- options.tmp

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_eigen_matrix, A, sA, fun, n, algorithm, which, options)

  res
}

eigen_matrix_symmetric_impl <- function(A, sA, fun, n, algorithm, which, options=igraph.arpack.default) {
  # Argument checks
  A <- as.matrix(structure(as.double(A), dim=dim(A)))
  require(Matrix); sA <- as(as(as(sA, "dMatrix"), "generalMatrix"), "CsparseMatrix")
  n <- as.integer(n)
  algorithm <- switch(igraph.match.arg(algorithm), "auto"=0, "lapack"=1,
    "arpack"=2, "comp_auto"=3, "comp_lapack"=4,
    "comp_arpack"=5)
  which.tmp <- eigen_defaults();
  which.tmp[ names(which) ] <- which ; which <- which.tmp
  options.tmp <- arpack_defaults; options.tmp[ names(options) ] <- options ; options <- options.tmp

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_eigen_matrix_symmetric, A, sA, fun, n, algorithm, which, options)

  res
}

solve_lsap_impl <- function(c, n) {
  # Argument checks
  c <- as.matrix(structure(as.double(c), dim=dim(c)))
  n <- as.integer(n)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_solve_lsap, c, n)

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

  res
}

eulerian_cycle_impl <- function(graph) {
  # Argument checks
  ensure_igraph(graph)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_eulerian_cycle, graph)

  res
}

fundamental_cycles_impl <- function(graph, start, bfs.cutoff, weights=NULL) {
  # Argument checks
  ensure_igraph(graph)
  start <- as_igraph_vs(graph, start)
  if (length(start) == 0) {
    stop("No vertex was specified")
  }
  bfs.cutoff <- as.integer(bfs.cutoff)
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
  res <- .Call(R_igraph_fundamental_cycles, graph, start-1, bfs.cutoff, weights)
  if (igraph_opt("return.vs.es")) {
    es <- E(graph)
    for (i_ in seq_along(res)) {
      res[[i_]] <- unsafe_create_es(graph, res[[i_]], es = es)
    }
  }
  res
}

minimum_cycle_basis_impl <- function(graph, bfs.cutoff, complete, use.cycle.order, weights=NULL) {
  # Argument checks
  ensure_igraph(graph)
  bfs.cutoff <- as.integer(bfs.cutoff)
  complete <- as.logical(complete)
  use.cycle.order <- as.logical(use.cycle.order)
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
  res <- .Call(R_igraph_minimum_cycle_basis, graph, bfs.cutoff, complete, use.cycle.order, weights)
  if (igraph_opt("return.vs.es")) {
    es <- E(graph)
    for (i_ in seq_along(res)) {
      res[[i_]] <- unsafe_create_es(graph, res[[i_]], es = es)
    }
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

is_forest_impl <- function(graph, mode=c("out", "in", "all", "total"), details=FALSE) {
  # Argument checks
  ensure_igraph(graph)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_is_forest, graph, mode)
  if (!details) {
    res <- res$res
  }
  res
}

from_prufer_impl <- function(prufer) {
  # Argument checks
  prufer <- as.numeric(prufer)-1L

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

  res
}

tree_from_parent_vector_impl <- function(parents, type=OUT) {
  # Argument checks
  parents <- as.numeric(parents)-1L

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_tree_from_parent_vector, parents, type)

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

deterministic_optimal_imitation_impl <- function(graph, vid, optimality=MAXIMUM, quantities, strategies, mode=c("out", "in", "all", "total")) {
  # Argument checks
  ensure_igraph(graph)
  vid <- as_igraph_vs(graph, vid)
  if (length(vid) == 0) {
    stop("No vertex was specified")
  }
  strategies <- as.numeric(strategies)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_deterministic_optimal_imitation, graph, vid-1, optimality, quantities, strategies, mode)

  res
}

stochastic_imitation_impl <- function(graph, vid, algo, quantities, strategies, mode=c("out", "in", "all", "total")) {
  # Argument checks
  ensure_igraph(graph)
  vid <- as_igraph_vs(graph, vid)
  if (length(vid) == 0) {
    stop("No vertex was specified")
  }
  strategies <- as.numeric(strategies)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_stochastic_imitation, graph, vid-1, algo, quantities, strategies, mode)

  res
}

moran_process_impl <- function(graph, weights=NULL, quantities, strategies, mode=c("out", "in", "all", "total")) {
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
  strategies <- as.numeric(strategies)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_moran_process, graph, weights, quantities, strategies, mode)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
    names(res$quantities) <- vertex_attr(graph, "name", )
  }
  res
}

roulette_wheel_imitation_impl <- function(graph, vid, is.local, quantities, strategies, mode=c("out", "in", "all", "total")) {
  # Argument checks
  ensure_igraph(graph)
  vid <- as_igraph_vs(graph, vid)
  if (length(vid) == 0) {
    stop("No vertex was specified")
  }
  is.local <- as.logical(is.local)
  strategies <- as.numeric(strategies)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_roulette_wheel_imitation, graph, vid-1, is.local, quantities, strategies, mode)

  res
}

has_attribute_table_impl <- function() {
  # Argument checks


  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_has_attribute_table, )


  res
}

progress_impl <- function(message, percent) {
  # Argument checks
  percent <- as.numeric(percent)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_progress, message, percent)


  res
}

status_impl <- function(message) {
  # Argument checks


  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_status, message)


  res
}

strerror_impl <- function(igraph.errno) {
  # Argument checks


  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_strerror, igraph.errno)


  res
}

expand_path_to_pairs_impl <- function(path) {
  # Argument checks


  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_expand_path_to_pairs, path)

  res
}

vertex_path_from_edge_path_impl <- function(graph, start, edge.path, mode=c("out", "in", "all", "total")) {
  # Argument checks
  ensure_igraph(graph)
  start <- as_igraph_vs(graph, start)
  if (length(start) == 0) {
    stop("No vertex was specified")
  }
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_vertex_path_from_edge_path, graph, start-1, edge.path, mode)

  res
}

version_impl <- function() {
  # Argument checks


  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_version, )

  res
}

get_stochastic_sparsemat_impl <- function(graph, column.wise=FALSE) {
  # Argument checks
  ensure_igraph(graph)
  column.wise <- as.logical(column.wise)

  on.exit( .Call(R_igraph_finalizer) )
  # Function call
  res <- .Call(R_igraph_get_stochastic_sparsemat, graph, column.wise)

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

