# Argument-signature migrations: layout
# Schema: see tools/migrations.R. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  layout_as_bipartite = list(
    old = function(graph, types, hgap, vgap, maxiter = max_iter) {},
    new = function(
      graph,
      types = NULL,
      ...,
      hgap = 1,
      vgap = 1,
      max_iter = 100
    ) {},
    when = "3.0.0"
  ),

  layout_as_star = list(
    old = function(graph, center, order) {},
    new = function(
      graph,
      ...,
      center = NULL,
      order = NULL
    ) {},
    when = "3.0.0"
  ),

  layout_as_tree = list(
    old = function(graph, root, circular, rootlevel, mode, flip.y = flip_y) {},
    new = function(
      graph,
      ...,
      root = numeric(),
      circular = FALSE,
      rootlevel = numeric(),
      mode = c("out", "in", "all"),
      flip_y = TRUE
    ) {},
    when = "3.0.0"
  ),

  layout_on_grid = list(
    old = function(graph, width, height, dim) {},
    new = function(
      graph,
      ...,
      width = 0,
      height = 0,
      dim = 2
    ) {},
    when = "3.0.0"
  ),

  layout_randomly = list(
    old = function(graph, dim) {},
    new = function(
      graph,
      ...,
      dim = c(2, 3)
    ) {},
    when = "3.0.0"
  ),

  layout_with_dh = list(
    old = function(
      graph,
      coords,
      maxiter = n_iter,
      fineiter = n_fine_iter,
      cool.fact = cool_fact,
      weight.node.dist = weight_node_dist,
      weight.border = weight_border,
      weight.edge.lengths = weight_edge_lengths,
      weight.edge.crossings = weight_edge_crossings,
      weight.node.edge.dist = weight_node_edge_dist
    ) {},
    new = function(
      graph,
      ...,
      coords = NULL,
      n_iter = 10,
      n_fine_iter = NULL,
      cool_fact = 0.75,
      weight_node_dist = 1.0,
      weight_border = 0.0,
      weight_edge_lengths = NULL,
      weight_edge_crossings = NULL,
      weight_node_edge_dist = NULL
    ) {},
    when = "3.0.0"
  ),

  layout_with_drl = list(
    old = function(graph, use.seed = use_seed, seed, options, weights, dim) {},
    new = function(
      graph,
      ...,
      use_seed = FALSE,
      seed = NULL,
      options = NULL,
      weights = NULL,
      dim = c(2, 3)
    ) {},
    when = "3.0.0"
  ),

  layout_with_fr = list(
    old = function(
      graph,
      coords,
      dim,
      niter = n_iter,
      start.temp = start_temp,
      grid,
      weights,
      minx,
      maxx,
      miny,
      maxy,
      minz,
      maxz,
      coolexp,
      maxdelta,
      area,
      repulserad,
      maxiter = n_iter
    ) {},
    new = function(
      graph,
      ...,
      coords = NULL,
      dim = c(2, 3),
      n_iter = 500,
      start_temp = NULL,
      grid = c("auto", "grid", "nogrid"),
      weights = NULL,
      minx = NULL,
      maxx = NULL,
      miny = NULL,
      maxy = NULL,
      minz = NULL,
      maxz = NULL,
      coolexp = deprecated(),
      maxdelta = deprecated(),
      area = deprecated(),
      repulserad = deprecated()
    ) {},
    when = "3.0.0"
  ),

  layout_with_gem = list(
    old = function(
      graph,
      coords,
      maxiter = max_iter,
      temp.max = temp_max,
      temp.min = temp_min,
      temp.init = temp_init
    ) {},
    new = function(
      graph,
      ...,
      coords = NULL,
      max_iter = NULL,
      temp_max = NULL,
      temp_min = 0.1,
      temp_init = NULL
    ) {},
    when = "3.0.0"
  ),

  layout_with_graphopt = list(
    old = function(
      graph,
      start,
      niter = n_iter,
      charge,
      mass,
      spring.length = spring_length,
      spring.constant = spring_constant,
      max.sa.movement = max_sa_movement
    ) {},
    new = function(
      graph,
      ...,
      start = NULL,
      n_iter = 500,
      charge = 0.001,
      mass = 30,
      spring_length = 0,
      spring_constant = 1,
      max_sa_movement = 5
    ) {},
    when = "3.0.0"
  ),

  layout_with_kk = list(
    old = function(
      graph,
      coords,
      dim,
      maxiter = max_iter,
      epsilon,
      kkconst,
      weights,
      minx,
      maxx,
      miny,
      maxy,
      minz,
      maxz,
      niter,
      sigma,
      initemp,
      coolexp,
      start
    ) {},
    new = function(
      graph,
      ...,
      coords = NULL,
      dim = c(2, 3),
      max_iter = NULL,
      epsilon = 0.0,
      kkconst = NULL,
      weights = NULL,
      minx = NULL,
      maxx = NULL,
      miny = NULL,
      maxy = NULL,
      minz = NULL,
      maxz = NULL,
      niter = deprecated(),
      sigma = deprecated(),
      initemp = deprecated(),
      coolexp = deprecated(),
      start = deprecated()
    ) {},
    when = "3.0.0"
  ),

  layout_with_lgl = list(
    old = function(
      graph,
      maxiter = max_iter,
      maxdelta,
      area,
      coolexp,
      repulserad,
      cellsize,
      root
    ) {},
    new = function(
      graph,
      ...,
      max_iter = 150,
      maxdelta = NULL,
      area = NULL,
      coolexp = 1.5,
      repulserad = NULL,
      cellsize = NULL,
      root = NULL
    ) {},
    when = "3.0.0"
  ),

  layout_with_sugiyama = list(
    old = function(
      graph,
      layers,
      hgap,
      vgap,
      maxiter = max_iter,
      weights,
      attributes
    ) {},
    new = function(
      graph,
      ...,
      layers = NULL,
      hgap = 1,
      vgap = 1,
      max_iter = 100,
      weights = NULL,
      attributes = c("default", "all", "none")
    ) {},
    when = "3.0.0"
  ),

  merge_coords = list(
    old = function(graphs, layouts, method = algorithm) {},
    new = function(
      graphs,
      layouts,
      ...,
      algorithm = "dla"
    ) {},
    when = "3.0.0"
  ),

  norm_coords = list(
    old = function(layout, xmin, xmax, ymin, ymax, zmin, zmax) {},
    new = function(
      layout,
      ...,
      xmin = -1,
      xmax = 1,
      ymin = -1,
      ymax = 1,
      zmin = -1,
      zmax = 1
    ) {},
    when = "3.0.0"
  )
)
