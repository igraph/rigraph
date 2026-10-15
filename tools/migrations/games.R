# Argument-signature migrations: games
# Schema: see tools/migrations.R. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  asym_pref = list(
    old = function(
      nodes,
      types,
      type.dist.matrix = type_dist_matrix,
      pref.matrix = pref_matrix,
      loops
    ) {},
    new = function(
      n,
      types,
      ...,
      type_dist_matrix = NULL,
      pref_matrix = NULL,
      loops = FALSE,
      nodes = deprecated()
    ) {},
    when = "3.0.0"
  ),

  cit_cit_types = list(
    old = function(n, edges, types, pref, directed, attr) {},
    new = function(
      n,
      edges = 1,
      types = NULL,
      ...,
      pref = NULL,
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
      types = NULL,
      ...,
      pref = NULL,
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
      n,
      radius,
      ...,
      torus = FALSE,
      coords = FALSE,
      nodes = deprecated()
    ) {},
    when = "3.0.0"
  ),

  last_cit = list(
    old = function(n, edges, agebins, pref, directed) {},
    new = function(
      n,
      edges = 1,
      ...,
      agebins = NULL,
      pref = NULL,
      directed = TRUE
    ) {},
    when = "3.0.0"
  ),

  pa = list(
    old = function(
      n,
      power,
      m,
      out.dist = out_dist,
      out.seq = out_seq,
      out.pref = out_pref,
      zero.appeal = zero_appeal,
      directed,
      algorithm,
      start.graph = start_graph
    ) {},
    new = function(
      n,
      power = 1,
      m = NULL,
      ...,
      out_dist = NULL,
      out_seq = NULL,
      out_pref = FALSE,
      zero_appeal = 1,
      directed = TRUE,
      algorithm = c("psumtree", "psumtree-multiple", "bag"),
      start_graph = NULL
    ) {},
    when = "3.0.0"
  ),

  pa_age = list(
    old = function(
      n,
      pa.exp,
      aging.exp,
      m,
      aging.bin = aging_bin,
      out.dist = out_dist,
      out.seq = out_seq,
      out.pref = out_pref,
      directed,
      zero.deg.appeal = zero_deg_appeal,
      zero.age.appeal = zero_age_appeal,
      deg.coef = deg_coef,
      age.coef = age_coef,
      time.window = time_window
    ) {},
    new = function(
      n,
      pa_exp,
      aging_exp,
      m = NULL,
      ...,
      aging_bin = 300,
      out_dist = NULL,
      out_seq = NULL,
      out_pref = FALSE,
      directed = TRUE,
      zero_deg_appeal = 1,
      zero_age_appeal = 0,
      deg_coef = 1,
      age_coef = 1,
      time_window = NULL,
      pa.exp = deprecated(),
      aging.exp = deprecated()
    ) {},
    when = "3.0.0"
  ),

  pref = list(
    old = function(
      nodes,
      types,
      type.dist = type_dist,
      fixed.sizes = fixed_sizes,
      pref.matrix = pref_matrix,
      directed,
      loops
    ) {},
    new = function(
      n,
      types,
      ...,
      type_dist = NULL,
      fixed_sizes = FALSE,
      pref_matrix = NULL,
      directed = FALSE,
      loops = FALSE,
      nodes = deprecated()
    ) {},
    when = "3.0.0"
  ),

  sample_asym_pref = list(
    old = function(
      nodes,
      types,
      type.dist.matrix = type_dist_matrix,
      pref.matrix = pref_matrix,
      loops
    ) {},
    new = function(
      n,
      types,
      ...,
      type_dist_matrix = NULL,
      pref_matrix = NULL,
      loops = FALSE,
      nodes = deprecated()
    ) {},
    when = "3.0.0"
  ),

  sample_cit_cit_types = list(
    old = function(n, edges, types, pref, directed, attr) {},
    new = function(
      n,
      edges = 1,
      types = NULL,
      ...,
      pref = NULL,
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
      types = NULL,
      ...,
      pref = NULL,
      directed = TRUE,
      attr = TRUE
    ) {},
    when = "3.0.0"
  ),

  sample_correlated_gnp = list(
    old = function(old.graph, corr, p, permutation) {},
    new = function(
      old_graph,
      corr,
      ...,
      p = NULL,
      permutation = NULL,
      old.graph = deprecated()
    ) {},
    when = "3.0.0"
  ),

  sample_degseq = list(
    old = function(out.deg, in.deg, method = algorithm) {},
    new = function(
      out_deg,
      in_deg = NULL,
      ...,
      algorithm = c(
        "configuration",
        "vl",
        "fast.heur.simple",
        "configuration.simple",
        "edge.switching.simple"
      ),
      out.deg = deprecated(),
      in.deg = deprecated()
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
      n_edges,
      fitness_out,
      fitness_in = NULL,
      ...,
      loops = FALSE,
      multiple = FALSE,
      no.of.edges = deprecated(),
      fitness.out = deprecated(),
      fitness.in = deprecated()
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
      finite.size.correction = finite_size_correction
    ) {},
    new = function(
      n,
      n_edges,
      exponent_out,
      exponent_in = -1,
      ...,
      loops = FALSE,
      multiple = FALSE,
      finite_size_correction = TRUE,
      no.of.nodes = deprecated(),
      no.of.edges = deprecated(),
      exponent.out = deprecated(),
      exponent.in = deprecated()
    ) {},
    when = "3.0.0"
  ),

  sample_forestfire = list(
    old = function(nodes, fw.prob, bw.factor = bw_factor, ambs, directed) {},
    new = function(
      n,
      fw_prob,
      ...,
      bw_factor = 1,
      ambs = 1,
      directed = TRUE,
      nodes = deprecated(),
      fw.prob = deprecated()
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
      n,
      radius,
      ...,
      torus = FALSE,
      coords = FALSE,
      nodes = deprecated()
    ) {},
    when = "3.0.0"
  ),

  sample_k_regular = list(
    old = function(no.of.nodes, k, directed, multiple) {},
    new = function(
      n,
      k,
      ...,
      directed = FALSE,
      multiple = FALSE,
      no.of.nodes = deprecated()
    ) {},
    when = "3.0.0"
  ),

  sample_last_cit = list(
    old = function(n, edges, agebins, pref, directed) {},
    new = function(
      n,
      edges = 1,
      ...,
      agebins = NULL,
      pref = NULL,
      directed = TRUE
    ) {},
    when = "3.0.0"
  ),

  sample_pa = list(
    old = function(
      n,
      power,
      m,
      out.dist = out_dist,
      out.seq = out_seq,
      out.pref = out_pref,
      zero.appeal = zero_appeal,
      directed,
      algorithm,
      start.graph = start_graph
    ) {},
    new = function(
      n,
      power = 1,
      m = NULL,
      ...,
      out_dist = NULL,
      out_seq = NULL,
      out_pref = FALSE,
      zero_appeal = 1,
      directed = TRUE,
      algorithm = c(
        "psumtree",
        "psumtree-multiple",
        "bag"
      ),
      start_graph = NULL
    ) {},
    when = "3.0.0"
  ),

  sample_pa_age = list(
    old = function(
      n,
      pa.exp,
      aging.exp,
      m,
      aging.bin = aging_bin,
      out.dist = out_dist,
      out.seq = out_seq,
      out.pref = out_pref,
      directed,
      zero.deg.appeal = zero_deg_appeal,
      zero.age.appeal = zero_age_appeal,
      deg.coef = deg_coef,
      age.coef = age_coef,
      time.window = time_window
    ) {},
    new = function(
      n,
      pa_exp,
      aging_exp,
      m = NULL,
      ...,
      aging_bin = 300,
      out_dist = NULL,
      out_seq = NULL,
      out_pref = FALSE,
      directed = TRUE,
      zero_deg_appeal = 1,
      zero_age_appeal = 0,
      deg_coef = 1,
      age_coef = 1,
      time_window = NULL,
      pa.exp = deprecated(),
      aging.exp = deprecated()
    ) {},
    when = "3.0.0"
  ),

  sample_pref = list(
    old = function(
      nodes,
      types,
      type.dist = type_dist,
      fixed.sizes = fixed_sizes,
      pref.matrix = pref_matrix,
      directed,
      loops
    ) {},
    new = function(
      n,
      types,
      ...,
      type_dist = NULL,
      fixed_sizes = FALSE,
      pref_matrix = NULL,
      directed = FALSE,
      loops = FALSE,
      nodes = deprecated()
    ) {},
    when = "3.0.0"
  ),

  sample_sbm = list(
    old = function(n, pref.matrix, block.sizes, directed, loops) {},
    new = function(
      n,
      pref_matrix,
      block_sizes,
      ...,
      directed = FALSE,
      loops = FALSE,
      pref.matrix = deprecated(),
      block.sizes = deprecated()
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
    old = function(
      nodes,
      types,
      k,
      type.dist = type_dist,
      pref.matrix = pref_matrix,
      directed
    ) {},
    new = function(
      n,
      types,
      k = 1,
      ...,
      type_dist = NULL,
      pref_matrix = NULL,
      directed = FALSE,
      nodes = deprecated()
    ) {},
    when = "3.0.0"
  ),

  sample_traits_callaway = list(
    old = function(
      nodes,
      types,
      edge.per.step = edge_per_step,
      type.dist = type_dist,
      pref.matrix = pref_matrix,
      directed
    ) {},
    new = function(
      n,
      types,
      ...,
      edge_per_step = 1,
      type_dist = NULL,
      pref_matrix = NULL,
      directed = FALSE,
      nodes = deprecated()
    ) {},
    when = "3.0.0"
  ),

  sbm = list(
    old = function(n, pref.matrix, block.sizes, directed, loops) {},
    new = function(
      n,
      pref_matrix,
      block_sizes,
      ...,
      directed = FALSE,
      loops = FALSE,
      pref.matrix = deprecated(),
      block.sizes = deprecated()
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
    old = function(
      nodes,
      types,
      k,
      type.dist = type_dist,
      pref.matrix = pref_matrix,
      directed
    ) {},
    new = function(
      n,
      types,
      k = 1,
      ...,
      type_dist = NULL,
      pref_matrix = NULL,
      directed = FALSE,
      nodes = deprecated()
    ) {},
    when = "3.0.0"
  ),

  traits_callaway = list(
    old = function(
      nodes,
      types,
      edge.per.step = edge_per_step,
      type.dist = type_dist,
      pref.matrix = pref_matrix,
      directed
    ) {},
    new = function(
      n,
      types,
      ...,
      edge_per_step = 1,
      type_dist = NULL,
      pref_matrix = NULL,
      directed = FALSE,
      nodes = deprecated()
    ) {},
    when = "3.0.0"
  )
)
