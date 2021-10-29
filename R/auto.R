#' @export
gorder <- function(graph) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_vcount, graph)


  res
}

#' @export
graph_from_lcf <- function(n, shifts, repeats=1) {
  # Argument checks
  n <- as.integer(n)
  shifts <- as.numeric(shifts)
  repeats <- as.integer(repeats)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_lcf_vector, n, shifts, repeats)

  res <- set.graph.attribute(res, 'name', 'LCF graph')
  res
}

#' @export
graph_from_adj_list <- function(adjlist, mode=c("out", "in", "all", "total"), duplicate=TRUE) {
  # Argument checks
  adjlist <- lapply(adjlist, function(x) as.integer(x)-1L)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  duplicate <- as.logical(duplicate)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_adjlist, adjlist, mode, duplicate)

  res
}

#' @export
sample_forestfire <- function(nodes, fw.prob, bw.factor=1, ambs=1, directed=TRUE) {
  # Argument checks
  nodes <- as.integer(nodes)
  fw.prob <- as.numeric(fw.prob)
  bw.factor <- as.numeric(bw.factor)
  ambs <- as.integer(ambs)
  directed <- as.logical(directed)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_forest_fire_game, nodes, fw.prob, bw.factor, ambs, directed)

  res <- set.graph.attribute(res, 'name', 'Forest fire model')
  res <- set.graph.attribute(res, 'fw.prob', fw.prob)
  res <- set.graph.attribute(res, 'bw.factor', bw.factor)
  res <- set.graph.attribute(res, 'ambs', ambs)
  res
}

#' @export
sample_islands <- function(islands.n, islands.size, islands.pin, n.inter) {
  # Argument checks
  islands.n <- as.integer(islands.n)
  islands.size <- as.integer(islands.size)
  islands.pin <- as.numeric(islands.pin)
  n.inter <- as.integer(n.inter)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_simple_interconnected_islands_game, islands.n, islands.size, islands.pin, n.inter)

  res <- set.graph.attribute(res, 'name', 'Interconnected islands model')
  res <- set.graph.attribute(res, 'islands.n', islands.n)
  res <- set.graph.attribute(res, 'islands.size', islands.size)
  res <- set.graph.attribute(res, 'islands.pin', islands.pin)
  res <- set.graph.attribute(res, 'n.inter', n.inter)
  res
}

#' @export
sample_fitness <- function(no.of.edges, fitness.out, fitness.in=NULL, loops=FALSE, multiple=FALSE) {
  # Argument checks
  no.of.edges <- as.integer(no.of.edges)
  fitness.out <- as.numeric(fitness.out)
  if (!is.null(fitness.in)) fitness.in <- as.numeric(fitness.in)
  loops <- as.logical(loops)
  multiple <- as.logical(multiple)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_static_fitness_game, no.of.edges, fitness.out, fitness.in, loops, multiple)

  res <- set.graph.attribute(res, 'name', 'Static fitness model')
  res <- set.graph.attribute(res, 'loops', loops)
  res <- set.graph.attribute(res, 'multiple', multiple)
  res
}

#' @export
sample_fitness_pl <- function(no.of.nodes, no.of.edges, exponent.out, exponent.in=-1, loops=FALSE, multiple=FALSE, finite.size.correction=TRUE) {
  # Argument checks
  no.of.nodes <- as.integer(no.of.nodes)
  no.of.edges <- as.integer(no.of.edges)
  exponent.out <- as.numeric(exponent.out)
  exponent.in <- as.numeric(exponent.in)
  loops <- as.logical(loops)
  multiple <- as.logical(multiple)
  finite.size.correction <- as.logical(finite.size.correction)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_static_power_law_game, no.of.nodes, no.of.edges, exponent.out, exponent.in, loops, multiple, finite.size.correction)

  res <- set.graph.attribute(res, 'name', 'Static power law model')
  res <- set.graph.attribute(res, 'exponent.out', exponent.out)
  res <- set.graph.attribute(res, 'exponent.in', exponent.in)
  res <- set.graph.attribute(res, 'loops', loops)
  res <- set.graph.attribute(res, 'multiple', multiple)
  res <- set.graph.attribute(res, 'finite.size.correction', finite.size.correction)
  res
}

#' @export
sample_k_regular <- function(no.of.nodes, k, directed=FALSE, multiple=FALSE) {
  # Argument checks
  no.of.nodes <- as.integer(no.of.nodes)
  k <- as.integer(k)
  directed <- as.logical(directed)
  multiple <- as.logical(multiple)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_k_regular_game, no.of.nodes, k, directed, multiple)

  res <- set.graph.attribute(res, 'name', 'k-regular graph')
  res <- set.graph.attribute(res, 'k', k)
  res
}

#' @export
sample_sbm <- function(n, pref.matrix, block.sizes, directed=FALSE, loops=FALSE) {
  # Argument checks
  n <- as.integer(n)
  pref.matrix <- as.matrix(structure(as.double(pref.matrix), dim=dim(pref.matrix)))
  block.sizes <- as.integer(block.sizes)
  directed <- as.logical(directed)
  loops <- as.logical(loops)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_sbm_game, n, pref.matrix, block.sizes, directed, loops)

  res <- set.graph.attribute(res, 'name', 'Stochastic block-model')
  res <- set.graph.attribute(res, 'loops', loops)
  res
}

hsbm.1.game <- function(n, m, rho, C, p) {
  # Argument checks
  n <- as.integer(n)
  m <- as.integer(m)
  rho <- as.numeric(rho)
  C <- as.matrix(structure(as.double(C), dim=dim(C)))
  p <- as.numeric(p)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_hsbm_game, n, m, rho, C, p)

  res <- set.graph.attribute(res, 'name', 'Hierarchical stochastic block model')
  res <- set.graph.attribute(res, 'm', m)
  res <- set.graph.attribute(res, 'rho', rho)
  res <- set.graph.attribute(res, 'C', C)
  res <- set.graph.attribute(res, 'p', p)
  res
}

hsbm.list.game <- function(n, mlist, rholist, Clist, p) {
  # Argument checks
  n <- as.integer(n)
  mlist <- as.integer(mlist)
  if (!all(sapply(Clist, is.matrix))) { stop("%I is not a list of matrices") }
  p <- as.numeric(p)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_hsbm_list_game, n, mlist, rholist, Clist, p)

  res <- set.graph.attribute(res, 'name', 'Hierarchical stochastic block model')
  res <- set.graph.attribute(res, 'p', p)
  res
}

#' @export
sample_correlated_gnp <- function(old.graph, corr, p=old.graph$p, permutation=NULL) {
  # Argument checks
  if (!is_igraph(old.graph)) { stop("Not a graph object") }
  corr <- as.numeric(corr)
  p <- as.numeric(p)
  if (!is.null(permutation)) permutation <- as.numeric(permutation)-1

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_correlated_game, old.graph, corr, p, permutation)

  res <- set.graph.attribute(res, 'name', 'Correlated random graph')
  res <- set.graph.attribute(res, 'corr', corr)
  res <- set.graph.attribute(res, 'p', p)
  res
}

#' @export
sample_correlated_gnp_pair <- function(n, corr, p, directed=FALSE, permutation=NULL) {
  # Argument checks
  n <- as.integer(n)
  corr <- as.numeric(corr)
  p <- as.numeric(p)
  directed <- as.logical(directed)
  if (!is.null(permutation)) permutation <- as.numeric(permutation)-1

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_correlated_pair_game, n, corr, p, directed, permutation)

  res
}

#' @export
sample_dot_product <- function(vecs, directed=FALSE) {
  # Argument checks
  vecs <- as.matrix(structure(as.double(vecs), dim=dim(vecs)))
  directed <- as.logical(directed)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_dot_product_game, vecs, directed)

  res
}

#' @export
sample_sphere_surface <- function(dim, n=1, radius=1, positive=TRUE) {
  # Argument checks
  dim <- as.integer(dim)
  n <- as.integer(n)
  radius <- as.numeric(radius)
  positive <- as.logical(positive)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_sample_sphere_surface, dim, n, radius, positive)

  res
}

#' @export
sample_sphere_volume <- function(dim, n=1, radius=1, positive=TRUE) {
  # Argument checks
  dim <- as.integer(dim)
  n <- as.integer(n)
  radius <- as.numeric(radius)
  positive <- as.logical(positive)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_sample_sphere_volume, dim, n, radius, positive)

  res
}

#' @export
sample_dirichlet <- function(n, alpha) {
  # Argument checks
  n <- as.integer(n)
  alpha <- as.numeric(alpha)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_sample_dirichlet, n, alpha)

  res
}

#' @export
page_rank_old <- function(graph, vids=V(graph), directed=TRUE, niter=1000, eps=0.001, damping=0.85, old=FALSE) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  vids <- as.igraph.vs(graph, vids)
  directed <- as.logical(directed)
  niter <- as.integer(niter)
  eps <- as.numeric(eps)
  damping <- as.numeric(damping)
  old <- as.logical(old)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_pagerank_old, graph, vids-1, directed, niter, eps, damping, old)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
  names(res) <- vertex_attr(graph, "name", vids)
  }
  res
}

#' @export
page_rank <- function(graph, algo=c("prpack", "arpack", "power"), vids=V(graph), directed=TRUE, damping=0.85, personalized=NULL, weights=NULL, options=NULL) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  algo <- switch(igraph.match.arg(algo), "power"=0L, "arpack"=1L,
  "prpack"=2L)
  vids <- as.igraph.vs(graph, vids)
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

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_personalized_pagerank, graph, algo, vids-1, directed, damping, personalized, weights, options)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
  names(res$vector) <- vertex_attr(graph, "name", vids)
  }
  res
}

#' @export
distance_table <- function(graph, directed=TRUE) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  directed <- as.logical(directed)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_path_length_hist, graph, directed)

  res
}

#' @export
simplify <- function(graph, remove.multiple=TRUE, remove.loops=TRUE, edge.attr.comb=igraph_opt("edge.attr.comb")) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  remove.multiple <- as.logical(remove.multiple)
  remove.loops <- as.logical(remove.loops)
  edge.attr.comb <- igraph.i.attribute.combination(edge.attr.comb)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_simplify, graph, remove.multiple, remove.loops, edge.attr.comb)

  res
}

#' @export
is_dag <- function(graph) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_is_dag, graph)

  res
}

#' @export
is_simple <- function(graph) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_is_simple, graph)

  res
}

#' @export
any_multiple <- function(graph) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_has_multiple, graph)

  res
}

#' @export
eigen_centrality <- function(graph, directed=FALSE, scale=TRUE, weights=NULL, options=arpack_defaults) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
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

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_eigenvector_centrality, graph, directed, scale, weights, options)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
  names(res$vector) <- vertex_attr(graph, "name", V(graph))
  }
  res
}

#' @export
hub_score <- function(graph, scale=TRUE, weights=NULL, options=arpack_defaults) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
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

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_hub_score, graph, scale, weights, options)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
  names(res$vector) <- vertex_attr(graph, "name", V(graph))
  }
  res
}

#' @export
authority_score <- function(graph, scale=TRUE, weights=NULL, options=arpack_defaults) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
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

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_authority_score, graph, scale, weights, options)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
  names(res$vector) <- vertex_attr(graph, "name", V(graph))
  }
  res
}

#' @export
which_mutual <- function(graph, es=E(graph)) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  es <- as.igraph.es(graph, es)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_is_mutual, graph, es-1)

  res
}

#' @export
max_cardinality <- function(graph) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_maximum_cardinality_search, graph)
  if (igraph_opt("return.vs.es")) {
  res$alpha <- create_vs(graph, res$alpha)
  }
  res
}

#' @export
knn <- function(graph, vids=V(graph), mode=c("all", "out", "in", "total"), neighbor.degree.mode=c("all", "out", "in", "total"), weights=NULL) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  vids <- as.igraph.vs(graph, vids)
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

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_avg_nearest_neighbor_degree, graph, vids-1, mode, neighbor.degree.mode, weights)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
  names(res$knn) <- vertex_attr(graph, "name", vids)
  }
  res
}

#' @export
strength <- function(graph, vids=V(graph), mode=c("all", "out", "in", "total"), loops=TRUE, weights=NULL) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  vids <- as.igraph.vs(graph, vids)
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

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_strength, graph, vids-1, mode, loops, weights)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
  names(res) <- vertex_attr(graph, "name", vids)
  }
  res
}

#' @export
centralize <- function(scores, theoretical.max=0, normalized=TRUE) {
  # Argument checks
  scores <- as.numeric(scores)
  theoretical.max <- as.numeric(theoretical.max)
  normalized <- as.logical(normalized)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_centralization, scores, theoretical.max, normalized)


  res
}

#' @export
centr_degree <- function(graph, mode=c("all", "out", "in", "total"), loops=TRUE, normalized=TRUE) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  loops <- as.logical(loops)
  normalized <- as.logical(normalized)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_centralization_degree, graph, mode, loops, normalized)

  res
}

#' @export
centr_degree_tmax <- function(graph=NULL, nodes=0, mode=c("all", "out", "in", "total"), loops=FALSE) {
  # Argument checks
  if (!is.null(graph) && !is_igraph(graph)) { stop("Not a graph object") }
  nodes <- as.integer(nodes)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  loops <- as.logical(loops)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_centralization_degree_tmax, graph, nodes, mode, loops)

  res
}

#' @export
centr_betw <- function(graph, directed=TRUE, nobigint=TRUE, normalized=TRUE) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  directed <- as.logical(directed)
  nobigint <- as.logical(nobigint)
  normalized <- as.logical(normalized)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_centralization_betweenness, graph, directed, nobigint, normalized)

  res
}

#' @export
centr_betw_tmax <- function(graph=NULL, nodes=0, directed=TRUE) {
  # Argument checks
  if (!is.null(graph) && !is_igraph(graph)) { stop("Not a graph object") }
  nodes <- as.integer(nodes)
  directed <- as.logical(directed)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_centralization_betweenness_tmax, graph, nodes, directed)

  res
}

#' @export
centr_clo <- function(graph, mode=c("out", "in", "all", "total"), normalized=TRUE) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  normalized <- as.logical(normalized)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_centralization_closeness, graph, mode, normalized)

  res
}

#' @export
centr_clo_tmax <- function(graph=NULL, nodes=0, mode=c("out", "in", "all", "total")) {
  # Argument checks
  if (!is.null(graph) && !is_igraph(graph)) { stop("Not a graph object") }
  nodes <- as.integer(nodes)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_centralization_closeness_tmax, graph, nodes, mode)

  res
}

#' @export
centr_eigen <- function(graph, directed=FALSE, scale=TRUE, options=arpack_defaults, normalized=TRUE) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  directed <- as.logical(directed)
  scale <- as.logical(scale)
  options.tmp <- arpack_defaults; options.tmp[ names(options) ] <- options ; options <- options.tmp
  normalized <- as.logical(normalized)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_centralization_eigenvector_centrality, graph, directed, scale, options, normalized)

  res
}

#' @export
centr_eigen_tmax <- function(graph=NULL, nodes=0, directed=FALSE, scale=TRUE) {
  # Argument checks
  if (!is.null(graph) && !is_igraph(graph)) { stop("Not a graph object") }
  nodes <- as.integer(nodes)
  directed <- as.logical(directed)
  scale <- as.logical(scale)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_centralization_eigenvector_centrality_tmax, graph, nodes, directed, scale)

  res
}

#' @export
assortativity_nominal <- function(graph, types, directed=TRUE) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  types <- as.numeric(types)-1
  directed <- as.logical(directed)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_assortativity_nominal, graph, types, directed)

  res
}

#' @export
assortativity <- function(graph, types1, types2=NULL, directed=TRUE) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  types1 <- as.numeric(types1)
  if (!is.null(types2)) types2 <- as.numeric(types2)
  directed <- as.logical(directed)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_assortativity, graph, types1, types2, directed)

  res
}

#' @export
assortativity_degree <- function(graph, directed=TRUE) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  directed <- as.logical(directed)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_assortativity_degree, graph, directed)

  res
}

#' @export
contract <- function(graph, mapping, vertex.attr.comb=igraph_opt("vertex.attr.comb")) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  mapping <- as.numeric(mapping)-1
  vertex.attr.comb <- igraph.i.attribute.combination(vertex.attr.comb)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_contract_vertices, graph, mapping, vertex.attr.comb)

  res
}

#' @export
eccentricity <- function(graph, vids=V(graph), mode=c("all", "out", "in", "total")) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  vids <- as.igraph.vs(graph, vids)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_eccentricity, graph, vids-1, mode)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
  names(res) <- vertex_attr(graph, "name", vids)
  }
  res
}

#' @export
radius <- function(graph, mode=c("all", "out", "in", "total")) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_radius, graph, mode)

  res
}

#' @export
diversity <- function(graph, weights=NULL, vids=V(graph)) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
  weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
  weights <- as.numeric(weights)
  } else {
  weights <- NULL
  }
  vids <- as.igraph.vs(graph, vids)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_diversity, graph, weights, vids-1)
  if (igraph_opt("add.vertex.names") && is_named(graph)) {
  names(res) <- vertex_attr(graph, "name", vids)
  }
  res
}

#' @export
is_degseq <- function(out.deg, in.deg=NULL) {
  # Argument checks
  out.deg <- as.numeric(out.deg)
  if (!is.null(in.deg)) in.deg <- as.numeric(in.deg)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_is_degree_sequence, out.deg, in.deg)

  res
}

#' @export
is_graphical <- function(out.deg, in.deg=NULL) {
  # Argument checks
  out.deg <- as.numeric(out.deg)
  if (!is.null(in.deg)) in.deg <- as.numeric(in.deg)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_is_graphical_degree_sequence, out.deg, in.deg)

  res
}

#' @export
bipartite_projection_size <- function(graph, types=NULL) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  if (is.null(types) && "type" %in% vertex_attr_names(graph)) {
  types <- V(graph)$type
  }
  if (!is.null(types)) {
  if (!is.logical(types)) {
  warning("vertex types converted to logical")
  }
  types <- as.logical(types)
  if (any(is.na(types))) {
  stop("`NA' is not allowed in vertex types")
  }
  } else {
  stop("Not a bipartite graph, supply `types' argument")
  }

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_bipartite_projection_size, graph, types)

  res
}

#' @export
bipartite_mapping <- function(graph) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_is_bipartite, graph)

  res
}

#' @export
articulation_points <- function(graph) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_articulation_points, graph)
  if (igraph_opt("return.vs.es")) {
  res <- create_vs(graph, res)
  }
  res
}

#' @export
biconnected_components <- function(graph) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_biconnected_components, graph)
  if (igraph_opt("return.vs.es")) {
  for (i_ in seq_along(res$tree_edges)) {
  res$tree_edges[[i_]] <- create_es(graph, res$tree_edges[[i_]])
  }
  }
  if (igraph_opt("return.vs.es")) {
  for (i_ in seq_along(res$component_edges)) {
  res$component_edges[[i_]] <- create_es(graph, res$component_edges[[i_]])
  }
  }
  if (igraph_opt("return.vs.es")) {
  for (i_ in seq_along(res$components)) {
  res$components[[i_]] <- create_vs(graph, res$components[[i_]])
  }
  }
  if (igraph_opt("return.vs.es")) {
  res$articulation_points <- create_vs(graph, res$articulation_points)
  }
  res
}

#' @export
similarity.jaccard <- function(graph, vids=V(graph), mode=c("all", "out", "in", "total"), loops=FALSE) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  vids <- as.igraph.vs(graph, vids)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  loops <- as.logical(loops)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_similarity_jaccard, graph, vids-1, mode, loops)

  res
}

#' @export
similarity.dice <- function(graph, vids=V(graph), mode=c("all", "out", "in", "total"), loops=FALSE) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  vids <- as.igraph.vs(graph, vids)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)
  loops <- as.logical(loops)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_similarity_dice, graph, vids-1, mode, loops)

  res
}

#' @export
similarity.invlogweighted <- function(graph, vids=V(graph), mode=c("all", "out", "in", "total")) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  vids <- as.igraph.vs(graph, vids)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2, "all"=3, "total"=3)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_similarity_inverse_log_weighted, graph, vids-1, mode)

  res
}

#' @export
cluster_fluid_communities <- function(graph, no.of.communities) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  no.of.communities <- as.integer(no.of.communities)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_community_fluid_communities, graph, no.of.communities)

  res
}

#' @export
sample_hrg <- function(hrg) {
  # Argument checks
  if (is.null(hrg)) {
  hrg <- list(left=c(), right=c(), prob=c(), edges=c(),
  vertices=c())
  }
  hrg <- lapply(hrg[c("left","right","prob","edges","vertices")],
  as.numeric)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_hrg_game, hrg)

  res <- set.graph.attribute(res, 'name', 'Hierarchical random graph model')
  res
}

#' @export
hrg_tree <- function(hrg) {
  # Argument checks
  if (is.null(hrg)) {
  hrg <- list(left=c(), right=c(), prob=c(), edges=c(),
  vertices=c())
  }
  hrg <- lapply(hrg[c("left","right","prob","edges","vertices")],
  as.numeric)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_hrg_dendrogram, hrg)

  res
}

#' @export
consensus_tree <- function(graph, hrg=NULL, start=FALSE, num.samples=10000) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  if (is.null(hrg)) {
  hrg <- list(left=c(), right=c(), prob=c(), edges=c(),
  vertices=c())
  }
  hrg <- lapply(hrg[c("left","right","prob","edges","vertices")],
  as.numeric)
  start <- as.logical(start)
  num.samples <- as.integer(num.samples)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_hrg_consensus, graph, hrg, start, num.samples)

  res
}

#' @export
hrg <- function(graph, prob) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  prob <- as.numeric(prob)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_hrg_create, graph, prob)

  class(res) <- "igraphHRG"
  res
}

#' @export
graphlets <- function(graph, weights=NULL, niter=1000) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
  weights <- E(graph)$weight
  }
  if (!is.null(weights) && any(!is.na(weights))) {
  weights <- as.numeric(weights)
  } else {
  weights <- NULL
  }
  niter <- as.integer(niter)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_graphlets, graph, weights, niter)
  if (igraph_opt("return.vs.es")) {
  for (i_ in seq_along(res$cliques)) {
  res$cliques[[i_]] <- create_vs(graph, res$cliques[[i_]])
  }
  }
  res
}

#' @export
dyad_census <- function(graph) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_dyad_census, graph)

  res
}

#' @export
triad_census <- function(graph) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_triad_census, graph)

  res
}

#' @export
count_triangles <- function(graph, vids=V(graph)) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  vids <- as.igraph.vs(graph, vids)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_adjacent_triangles, graph, vids-1)

  res
}

#' @export
triangles <- function(graph) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_list_triangles, graph)
  if (igraph_opt("return.vs.es")) {
  res <- create_vs(graph, res)
  }
  res
}

#' @export
max_flow <- function(graph, source, target, capacity=NULL) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  source <- as.igraph.vs(graph, source)
  target <- as.igraph.vs(graph, target)
  if (is.null(capacity) && "capacity" %in% edge_attr_names(graph)) {
  capacity <- E(graph)$capacity
  }
  if (!is.null(capacity) && any(!is.na(capacity))) {
  capacity <- as.numeric(capacity)
  } else {
  capacity <- NULL
  }

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_maxflow, graph, source-1, target-1, capacity)
  if (igraph_opt("return.vs.es")) {
  res$partition1 <- create_vs(graph, res$partition1)
  }
  if (igraph_opt("return.vs.es")) {
  res$partition2 <- create_vs(graph, res$partition2)
  }
  res
}

#' @export
dominator_tree <- function(graph, root, mode=c("out", "in")) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  root <- as.igraph.vs(graph, root)
  mode <- switch(igraph.match.arg(mode), "out"=1, "in"=2)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_dominator_tree, graph, root-1, mode)
  if (igraph_opt("return.vs.es")) {
  res$dom <- create_vs(graph, res$dom)
  }
  if (igraph_opt("return.vs.es")) {
  res$leftout <- create_vs(graph, res$leftout)
  }
  res
}

#' @export
st_cuts <- function(graph, source, target) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  source <- as.igraph.vs(graph, source)
  target <- as.igraph.vs(graph, target)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_all_st_cuts, graph, source-1, target-1)
  if (igraph_opt("return.vs.es")) {
  for (i_ in seq_along(res$cuts)) {
  res$cuts[[i_]] <- create_es(graph, res$cuts[[i_]])
  }
  }
  if (igraph_opt("return.vs.es")) {
  for (i_ in seq_along(res$partition1s)) {
  res$partition1s[[i_]] <- create_vs(graph, res$partition1s[[i_]])
  }
  }
  res
}

#' @export
st_min_cuts <- function(graph, source, target, capacity=NULL) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  source <- as.igraph.vs(graph, source)
  target <- as.igraph.vs(graph, target)
  if (is.null(capacity) && "weight" %in% edge_attr_names(graph)) {
  capacity <- E(graph)$weight
  }
  if (!is.null(capacity) && any(!is.na(capacity))) {
  capacity <- as.numeric(capacity)
  } else {
  capacity <- NULL
  }

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_all_st_mincuts, graph, source-1, target-1, capacity)
  if (igraph_opt("return.vs.es")) {
  for (i_ in seq_along(res$cuts)) {
  res$cuts[[i_]] <- create_es(graph, res$cuts[[i_]])
  }
  }
  if (igraph_opt("return.vs.es")) {
  for (i_ in seq_along(res$partition1s)) {
  res$partition1s[[i_]] <- create_vs(graph, res$partition1s[[i_]])
  }
  }
  res
}

#' @export
is_separator <- function(graph, candidate) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  candidate <- as.igraph.vs(graph, candidate)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_is_separator, graph, candidate-1)

  res
}

#' @export
is_min_separator <- function(graph, candidate) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  candidate <- as.igraph.vs(graph, candidate)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_is_minimal_separator, graph, candidate-1)

  res
}

#' @export
min_st_separators <- function(graph) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_all_minimal_st_separators, graph)
  if (igraph_opt("return.vs.es")) {
  for (i_ in seq_along(res)) {
  res[[i_]] <- create_vs(graph, res[[i_]])
  }
  }
  res
}

#' @export
min_separators <- function(graph) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_minimum_size_separators, graph)
  if (igraph_opt("return.vs.es")) {
  for (i_ in seq_along(res)) {
  res[[i_]] <- create_vs(graph, res[[i_]])
  }
  }
  res
}

#' @export
graph.isoclass <- function(graph) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_isoclass, graph)

  res
}

#' @export
graph.isomorphic <- function(graph1, graph2) {
  # Argument checks
  if (!is_igraph(graph1)) { stop("Not a graph object") }
  if (!is_igraph(graph2)) { stop("Not a graph object") }

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_isomorphic, graph1, graph2)

  res
}

#' @export
graph_from_isomorphism_class <- function(size, number, directed=TRUE) {
  # Argument checks
  size <- as.integer(size)
  number <- as.integer(number)
  directed <- as.logical(directed)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_isoclass_create, size, number, directed)

  res
}

#' @export
graph.isomorphic.vf2 <- function(graph1, graph2, vertex.color1, vertex.color2, edge.color1, edge.color2) {
  # Argument checks
  if (!is_igraph(graph1)) { stop("Not a graph object") }
  if (!is_igraph(graph2)) { stop("Not a graph object") }
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

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_isomorphic_vf2, graph1, graph2, vertex.color1, vertex.color2, edge.color1, edge.color2)

  res
}

#' @export
graph.count.isomorphisms.vf2 <- function(graph1, graph2, vertex.color1, vertex.color2, edge.color1, edge.color2) {
  # Argument checks
  if (!is_igraph(graph1)) { stop("Not a graph object") }
  if (!is_igraph(graph2)) { stop("Not a graph object") }
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

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_count_isomorphisms_vf2, graph1, graph2, vertex.color1, vertex.color2, edge.color1, edge.color2)

  res
}

#' @export
graph.subisomorphic.vf2 <- function(graph1, graph2, vertex.color1, vertex.color2, edge.color1, edge.color2) {
  # Argument checks
  if (!is_igraph(graph1)) { stop("Not a graph object") }
  if (!is_igraph(graph2)) { stop("Not a graph object") }
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

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_subisomorphic_vf2, graph1, graph2, vertex.color1, vertex.color2, edge.color1, edge.color2)

  res
}

#' @export
graph.count.subisomorphisms.vf2 <- function(graph1, graph2, vertex.color1, vertex.color2, edge.color1, edge.color2) {
  # Argument checks
  if (!is_igraph(graph1)) { stop("Not a graph object") }
  if (!is_igraph(graph2)) { stop("Not a graph object") }
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

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_count_subisomorphisms_vf2, graph1, graph2, vertex.color1, vertex.color2, edge.color1, edge.color2)

  res
}

#' @export
graph.isomorphic.34 <- function(graph1, graph2) {
  # Argument checks
  if (!is_igraph(graph1)) { stop("Not a graph object") }
  if (!is_igraph(graph2)) { stop("Not a graph object") }

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_isomorphic_34, graph1, graph2)

  res
}

#' @export
canonical_permutation <- function(graph, sh="fm") {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  sh <- switch(igraph.match.arg(sh), "f"=0, "fl"=1, "fs"=2, "fm"=3, "flm"=4, "fsm"=5)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_canonical_permutation, graph, sh)

  res
}

#' @export
permute <- function(graph, permutation) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  permutation <- as.numeric(permutation)-1

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_permute_vertices, graph, permutation)

  res
}

#' @export
graph.isomorphic.bliss <- function(graph1, graph2, sh="fm") {
  # Argument checks
  if (!is_igraph(graph1)) { stop("Not a graph object") }
  if (!is_igraph(graph2)) { stop("Not a graph object") }
  sh <- switch(igraph.match.arg(sh), "f"=0, "fl"=1, "fs"=2, "fm"=3, "flm"=4, "fsm"=5)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_isomorphic_bliss, graph1, graph2, sh)

  res
}

#' @export
automorphisms <- function(graph, sh="fm") {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  sh <- switch(igraph.match.arg(sh), "f"=0, "fl"=1, "fs"=2, "fm"=3, "flm"=4, "fsm"=5)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_automorphisms, graph, sh)

  res
}

#' @export
scg_eps <- function(V, groups, mtype=c("symmetric", "laplacian", "stochastic"), p=NULL, norm=c("row", "col")) {
  # Argument checks
  V <- as.matrix(structure(as.double(V), dim=dim(V)))
  groups <- as.numeric(groups)-1
  mtype <- switch(igraph.match.arg(mtype), "symmetric"=1,
  "laplacian"=2, "stochastic"=3)
  if (!is.null(p)) p <- as.numeric(p)
  norm <- switch(igraph.match.arg(norm), "row"=1, "col"=2)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_scg_norm_eps, V, groups, mtype, p, norm)

  res
}

#' @export
embed_adjacency_matrix <- function(graph, no, weights=NULL, which=c("lm", "la", "sa"), scaled=TRUE, cvec=graph.strength(graph, weights=weights)/(vcount(graph)-1), options=igraph.arpack.default) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
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

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_adjacency_spectral_embedding, graph, no, weights, which, scaled, cvec, options)

  res
}

#' @export
embed_laplacian_matrix <- function(graph, no, weights=NULL, which=c("lm", "la", "sa"), degmode=c("out", "in", "all", "total"), type=c("default", "D-A", "DAD", "I-DAD", "OAP"), scaled=TRUE, options=igraph.arpack.default) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
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
  degmode <- switch(igraph.match.arg(degmode), "out"=1, "in"=2, "all"=3, "total"=3)
  type <- switch(igraph.match.arg(type),
  "default"=if (is.directed(graph)) 3L else 0L,
  "da"=0L, "d-a"=0L, "idad"=1L, "i-dad"=1L, "dad"=2L,
  "oap"=3L)
  scaled <- as.logical(scaled)
  options.tmp <- arpack_defaults; options.tmp[ names(options) ] <- options ; options <- options.tmp

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_laplacian_spectral_embedding, graph, no, weights, which, degmode, type, scaled, options)

  res
}

#' @export
spectrum <- function(graph, algorithm=c("arpack", "auto", "lapack", "comp_auto", "comp_lapack", "comp_arpack"), which=list(), options=arpack_defaults) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  algorithm <- switch(igraph.match.arg(algorithm), "auto"=0, "lapack"=1,
  "arpack"=2, "comp_auto"=3, "comp_lapack"=4,
  "comp_arpack"=5)
  which.tmp <- eigen_defaults;
  which.tmp[ names(which) ] <- which ; which <- which.tmp
  options.tmp <- arpack_defaults; options.tmp[ names(options) ] <- options ; options <- options.tmp

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_eigen_adjacency, graph, algorithm, which, options)

  res
}

#' @export
sir <- function(graph, beta, gamma, no.sim=100) {
  # Argument checks
  if (!is_igraph(graph)) { stop("Not a graph object") }
  beta <- as.numeric(beta)
  gamma <- as.numeric(gamma)
  no.sim <- as.integer(no.sim)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_sir, graph, beta, gamma, no.sim)

  class(res) <- "sir"
  res
}

#' @export
convex_hull <- function(data) {
  # Argument checks
  data <- as.matrix(structure(as.double(data), dim=dim(data)))

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_convex_hull, data)

  res
}

#' @export
dim_select <- function(sv) {
  # Argument checks
  sv <- as.numeric(sv)

  on.exit( .Call(C_R_igraph_finalizer) )
  # Function call
  res <- .Call(C_R_igraph_dim_select, sv)

  res
}

