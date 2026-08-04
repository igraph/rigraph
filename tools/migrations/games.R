# Argument-signature migrations: games
# Schema: see tools/migrations.R. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  asym_pref = list(
    old = function(nodes, types, type.dist.matrix, pref.matrix, loops) {},
    new = function(
      nodes,
      types,
      ...,
      type.dist.matrix = matrix(1, types, types),
      pref.matrix = matrix(1, types, types),
      loops = FALSE
    ) {},
    when = "3.0.0"
  ),

  cit_cit_types = list(
    old = function(n, edges, types, pref, directed, attr) {},
    new = function(
      n,
      edges = 1,
      types = rep(0, n),
      ...,
      pref = matrix(1, nrow = length(types), ncol = length(types)),
      directed = TRUE,
      attr = TRUE
    ) {},
    when = "3.0.0"
  ),

  cit_types = list(
    old = function(n, edges, types, pref, directed, attr) {},
    new = function(
      n,
      edges = 1,
      types = rep(0, n),
      ...,
      pref = rep(1, length(types)),
      directed = TRUE,
      attr = TRUE
    ) {},
    when = "3.0.0"
  ),

  dot_product = list(
    old = function(vecs, directed) {},
    new = function(
      vecs,
      ...,
      directed = FALSE
    ) {},
    when = "3.0.0"
  ),

  gnm = list(
    old = function(n, m, directed, loops) {},
    new = function(
      n,
      m,
      ...,
      directed = FALSE,
      loops = FALSE
    ) {},
    when = "3.0.0"
  ),

  gnp = list(
    old = function(n, p, directed, loops) {},
    new = function(
      n,
      p,
      ...,
      directed = FALSE,
      loops = FALSE
    ) {},
    when = "3.0.0"
  ),

  grg = list(
    old = function(nodes, radius, torus, coords) {},
    new = function(
      nodes,
      radius,
      ...,
      torus = FALSE,
      coords = FALSE
    ) {},
    when = "3.0.0"
  ),

  last_cit = list(
    old = function(n, edges, agebins, pref, directed) {},
    new = function(
      n,
      edges = 1,
      ...,
      agebins = n / 7100,
      pref = (1:(agebins + 1))^-3,
      directed = TRUE
    ) {},
    when = "3.0.0"
  ),

  pa = list(
    old = function(
      n,
      power,
      m,
      out.dist,
      out.seq,
      out.pref,
      zero.appeal,
      directed,
      algorithm,
      start.graph
    ) {},
    new = function(
      n,
      power = 1,
      m = NULL,
      ...,
      out.dist = NULL,
      out.seq = NULL,
      out.pref = FALSE,
      zero.appeal = 1,
      directed = TRUE,
      algorithm = c("psumtree", "psumtree-multiple", "bag"),
      start.graph = NULL
    ) {},
    when = "3.0.0"
  ),

  pa_age = list(
    old = function(
      n,
      pa.exp,
      aging.exp,
      m,
      aging.bin,
      out.dist,
      out.seq,
      out.pref,
      directed,
      zero.deg.appeal,
      zero.age.appeal,
      deg.coef,
      age.coef,
      time.window
    ) {},
    new = function(
      n,
      pa.exp,
      aging.exp,
      m = NULL,
      ...,
      aging.bin = 300,
      out.dist = NULL,
      out.seq = NULL,
      out.pref = FALSE,
      directed = TRUE,
      zero.deg.appeal = 1,
      zero.age.appeal = 0,
      deg.coef = 1,
      age.coef = 1,
      time.window = NULL
    ) {},
    when = "3.0.0"
  ),

  pref = list(
    old = function(
      nodes,
      types,
      type.dist,
      fixed.sizes,
      pref.matrix,
      directed,
      loops
    ) {},
    new = function(
      nodes,
      types,
      ...,
      type.dist = rep(1, types),
      fixed.sizes = FALSE,
      pref.matrix = matrix(1, types, types),
      directed = FALSE,
      loops = FALSE
    ) {},
    when = "3.0.0"
  ),

  sample_asym_pref = list(
    old = function(nodes, types, type.dist.matrix, pref.matrix, loops) {},
    new = function(
      nodes,
      types,
      ...,
      type.dist.matrix = matrix(1, types, types),
      pref.matrix = matrix(1, types, types),
      loops = FALSE
    ) {},
    when = "3.0.0"
  ),

  sample_cit_cit_types = list(
    old = function(n, edges, types, pref, directed, attr) {},
    new = function(
      n,
      edges = 1,
      types = rep(0, n),
      ...,
      pref = matrix(1, nrow = length(types), ncol = length(types)),
      directed = TRUE,
      attr = TRUE
    ) {},
    when = "3.0.0"
  ),

  sample_cit_types = list(
    old = function(n, edges, types, pref, directed, attr) {},
    new = function(
      n,
      edges = 1,
      types = rep(0, n),
      ...,
      pref = rep(1, length(types)),
      directed = TRUE,
      attr = TRUE
    ) {},
    when = "3.0.0"
  ),

  sample_correlated_gnp = list(
    old = function(old.graph, corr, p, permutation) {},
    new = function(
      old.graph,
      corr,
      ...,
      p = edge_density(old.graph),
      permutation = NULL
    ) {},
    when = "3.0.0"
  ),

  sample_degseq = list(
    old = function(out.deg, in.deg, method) {},
    new = function(
      out.deg,
      in.deg = NULL,
      ...,
      method = c(
        "configuration",
        "vl",
        "fast.heur.simple",
        "configuration.simple",
        "edge.switching.simple"
      )
    ) {},
    when = "3.0.0"
  ),

  sample_dot_product = list(
    old = function(vecs, directed) {},
    new = function(
      vecs,
      ...,
      directed = FALSE
    ) {},
    when = "3.0.0"
  ),

  sample_fitness = list(
    old = function(no.of.edges, fitness.out, fitness.in, loops, multiple) {},
    new = function(
      no.of.edges,
      fitness.out,
      fitness.in = NULL,
      ...,
      loops = FALSE,
      multiple = FALSE
    ) {},
    when = "3.0.0"
  ),

  sample_fitness_pl = list(
    old = function(
      no.of.nodes,
      no.of.edges,
      exponent.out,
      exponent.in,
      loops,
      multiple,
      finite.size.correction
    ) {},
    new = function(
      no.of.nodes,
      no.of.edges,
      exponent.out,
      exponent.in = -1,
      ...,
      loops = FALSE,
      multiple = FALSE,
      finite.size.correction = TRUE
    ) {},
    when = "3.0.0"
  ),

  sample_forestfire = list(
    old = function(nodes, fw.prob, bw.factor, ambs, directed) {},
    new = function(
      nodes,
      fw.prob,
      ...,
      bw.factor = 1,
      ambs = 1,
      directed = TRUE
    ) {},
    when = "3.0.0"
  ),

  sample_gnm = list(
    old = function(n, m, directed, loops) {},
    new = function(
      n,
      m,
      ...,
      directed = FALSE,
      loops = FALSE
    ) {},
    when = "3.0.0"
  ),

  sample_gnp = list(
    old = function(n, p, directed, loops) {},
    new = function(
      n,
      p,
      ...,
      directed = FALSE,
      loops = FALSE
    ) {},
    when = "3.0.0"
  ),

  sample_grg = list(
    old = function(nodes, radius, torus, coords) {},
    new = function(
      nodes,
      radius,
      ...,
      torus = FALSE,
      coords = FALSE
    ) {},
    when = "3.0.0"
  ),

  sample_k_regular = list(
    old = function(no.of.nodes, k, directed, multiple) {},
    new = function(
      no.of.nodes,
      k,
      ...,
      directed = FALSE,
      multiple = FALSE
    ) {},
    when = "3.0.0"
  ),

  sample_last_cit = list(
    old = function(n, edges, agebins, pref, directed) {},
    new = function(
      n,
      edges = 1,
      ...,
      agebins,
      pref,
      directed = TRUE
    ) {},
    when = "3.0.0"
  ),

  sample_pa = list(
    old = function(
      n,
      power,
      m,
      out.dist,
      out.seq,
      out.pref,
      zero.appeal,
      directed,
      algorithm,
      start.graph
    ) {},
    new = function(
      n,
      power = 1,
      m = NULL,
      ...,
      out.dist = NULL,
      out.seq = NULL,
      out.pref = FALSE,
      zero.appeal = 1,
      directed = TRUE,
      algorithm = c(
        "psumtree",
        "psumtree-multiple",
        "bag"
      ),
      start.graph = NULL
    ) {},
    when = "3.0.0"
  ),

  sample_pa_age = list(
    old = function(
      n,
      pa.exp,
      aging.exp,
      m,
      aging.bin,
      out.dist,
      out.seq,
      out.pref,
      directed,
      zero.deg.appeal,
      zero.age.appeal,
      deg.coef,
      age.coef,
      time.window
    ) {},
    new = function(
      n,
      pa.exp,
      aging.exp,
      m = NULL,
      ...,
      aging.bin = 300,
      out.dist = NULL,
      out.seq = NULL,
      out.pref = FALSE,
      directed = TRUE,
      zero.deg.appeal = 1,
      zero.age.appeal = 0,
      deg.coef = 1,
      age.coef = 1,
      time.window = NULL
    ) {},
    when = "3.0.0"
  ),

  sample_pref = list(
    old = function(
      nodes,
      types,
      type.dist,
      fixed.sizes,
      pref.matrix,
      directed,
      loops
    ) {},
    new = function(
      nodes,
      types,
      ...,
      type.dist = rep(1, types),
      fixed.sizes = FALSE,
      pref.matrix = matrix(1, types, types),
      directed = FALSE,
      loops = FALSE
    ) {},
    when = "3.0.0"
  ),

  sample_sbm = list(
    old = function(n, pref.matrix, block.sizes, directed, loops) {},
    new = function(
      n,
      pref.matrix,
      block.sizes,
      ...,
      directed = FALSE,
      loops = FALSE
    ) {},
    when = "3.0.0"
  ),

  sample_smallworld = list(
    old = function(dim, size, nei, p, loops, multiple) {},
    new = function(
      dim,
      size,
      nei,
      p,
      ...,
      loops = FALSE,
      multiple = FALSE
    ) {},
    when = "3.0.0"
  ),

  sample_traits = list(
    old = function(nodes, types, k, type.dist, pref.matrix, directed) {},
    new = function(
      nodes,
      types,
      k = 1,
      ...,
      type.dist = rep(1, types),
      pref.matrix = matrix(1, types, types),
      directed = FALSE
    ) {},
    when = "3.0.0"
  ),

  sample_traits_callaway = list(
    old = function(
      nodes,
      types,
      edge.per.step,
      type.dist,
      pref.matrix,
      directed
    ) {},
    new = function(
      nodes,
      types,
      ...,
      edge.per.step = 1,
      type.dist = rep(1, types),
      pref.matrix = matrix(1, types, types),
      directed = FALSE
    ) {},
    when = "3.0.0"
  ),

  sbm = list(
    old = function(n, pref.matrix, block.sizes, directed, loops) {},
    new = function(
      n,
      pref.matrix,
      block.sizes,
      ...,
      directed = FALSE,
      loops = FALSE
    ) {},
    when = "3.0.0"
  ),

  smallworld = list(
    old = function(dim, size, nei, p, loops, multiple) {},
    new = function(
      dim,
      size,
      nei,
      p,
      ...,
      loops = FALSE,
      multiple = FALSE
    ) {},
    when = "3.0.0"
  ),

  traits = list(
    old = function(nodes, types, k, type.dist, pref.matrix, directed) {},
    new = function(
      nodes,
      types,
      k = 1,
      ...,
      type.dist = rep(1, types),
      pref.matrix = matrix(1, types, types),
      directed = FALSE
    ) {},
    when = "3.0.0"
  ),

  traits_callaway = list(
    old = function(
      nodes,
      types,
      edge.per.step,
      type.dist,
      pref.matrix,
      directed
    ) {},
    new = function(
      nodes,
      types,
      ...,
      edge.per.step = 1,
      type.dist = rep(1, types),
      pref.matrix = matrix(1, types, types),
      directed = FALSE
    ) {},
    when = "3.0.0"
  )
)
