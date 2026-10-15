# Argument-signature migrations: make
# Schema: see tools/migrations.R. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  bipartite_graph = list(
    old = function(types, edges, directed) {},
    new = function(
      types,
      edges,
      ...,
      directed = FALSE
    ) {},
    when = "3.0.0"
  ),

  chordal_ring = list(
    old = function(n, w, directed) {},
    new = function(
      n,
      w,
      ...,
      directed = FALSE
    ) {},
    when = "3.0.0"
  ),

  circulant = list(
    old = function(n, shifts, directed) {},
    new = function(
      n,
      shifts,
      ...,
      directed = FALSE
    ) {},
    when = "3.0.0"
  ),

  empty_graph = list(
    old = function(n, directed) {},
    new = function(
      n = 0,
      ...,
      directed = TRUE
    ) {},
    when = "3.0.0"
  ),

  full_bipartite_graph = list(
    old = function(n1, n2, directed, mode) {},
    new = function(
      n1,
      n2,
      ...,
      directed = FALSE,
      mode = c("all", "out", "in")
    ) {},
    when = "3.0.0"
  ),

  full_citation_graph = list(
    old = function(n, directed) {},
    new = function(
      n,
      ...,
      directed = TRUE
    ) {},
    when = "3.0.0"
  ),

  full_graph = list(
    old = function(n, directed, loops) {},
    new = function(
      n,
      ...,
      directed = FALSE,
      loops = FALSE
    ) {},
    when = "3.0.0"
  ),

  full_multipartite = list(
    old = function(n, directed, mode) {},
    new = function(
      n,
      ...,
      directed = FALSE,
      mode = c("all", "out", "in")
    ) {},
    when = "3.0.0"
  ),

  make_bipartite_graph = list(
    old = function(types, edges, directed) {},
    new = function(
      types,
      edges,
      ...,
      directed = FALSE
    ) {},
    when = "3.0.0"
  ),

  make_chordal_ring = list(
    old = function(n, w, directed) {},
    new = function(
      n,
      w,
      ...,
      directed = FALSE
    ) {},
    when = "3.0.0"
  ),

  make_circulant = list(
    old = function(n, shifts, directed) {},
    new = function(
      n,
      shifts,
      ...,
      directed = FALSE
    ) {},
    when = "3.0.0"
  ),

  make_empty_graph = list(
    old = function(n, directed) {},
    new = function(
      n = 0,
      ...,
      directed = TRUE
    ) {},
    when = "3.0.0"
  ),

  make_full_bipartite_graph = list(
    old = function(n1, n2, directed, mode) {},
    new = function(
      n1,
      n2,
      ...,
      directed = FALSE,
      mode = c("all", "out", "in")
    ) {},
    when = "3.0.0"
  ),

  make_full_citation_graph = list(
    old = function(n, directed) {},
    new = function(
      n,
      ...,
      directed = TRUE
    ) {},
    when = "3.0.0"
  ),

  make_full_graph = list(
    old = function(n, directed, loops) {},
    new = function(
      n,
      ...,
      directed = FALSE,
      loops = FALSE
    ) {},
    when = "3.0.0"
  ),

  make_full_multipartite = list(
    old = function(n, directed, mode) {},
    new = function(
      n,
      ...,
      directed = FALSE,
      mode = c("all", "out", "in")
    ) {},
    when = "3.0.0"
  ),

  make_ring = list(
    old = function(n, directed, mutual, circular) {},
    new = function(
      n,
      ...,
      directed = FALSE,
      mutual = FALSE,
      circular = TRUE
    ) {},
    when = "3.0.0"
  ),

  make_star = list(
    old = function(n, mode, center) {},
    new = function(
      n,
      ...,
      mode = c("in", "out", "mutual", "undirected"),
      center = 1
    ) {},
    when = "3.0.0"
  ),

  make_tree = list(
    old = function(n, children, mode) {},
    new = function(
      n,
      children = 2,
      ...,
      mode = c("out", "in", "undirected")
    ) {},
    when = "3.0.0"
  ),

  realize_degseq = list(
    old = function(out.deg, in.deg, allowed.edge.types, method) {},
    new = function(
      out.deg,
      in.deg = NULL,
      ...,
      allowed.edge.types = c("simple", "loops", "multi", "all"),
      method = c("smallest", "largest", "index")
    ) {},
    when = "3.0.0"
  ),

  ring = list(
    old = function(n, directed, mutual, circular) {},
    new = function(
      n,
      ...,
      directed = FALSE,
      mutual = FALSE,
      circular = TRUE
    ) {},
    when = "3.0.0"
  ),

  sample_tree = list(
    old = function(n, directed, method) {},
    new = function(
      n,
      ...,
      directed = FALSE,
      method = c("lerw", "prufer")
    ) {},
    when = "3.0.0"
  ),

  star = list(
    old = function(n, mode, center) {},
    new = function(
      n,
      ...,
      mode = c("in", "out", "mutual", "undirected"),
      center = 1
    ) {},
    when = "3.0.0"
  )
)
