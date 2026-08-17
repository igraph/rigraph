# Argument-signature migrations: layout
# Schema: see tools/migrations.R. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  layout_as_bipartite = list(
    old = function(graph, types, hgap, vgap, maxiter) {},
    new = function(
      graph,
      types = NULL,
      ...,
      hgap = 1,
      vgap = 1,
      maxiter = 100
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
    old = function(graph, root, circular, rootlevel, mode, flip.y) {},
    new = function(
      graph,
      ...,
      root = numeric(),
      circular = FALSE,
      rootlevel = numeric(),
      mode = c("out", "in", "all"),
      flip.y = TRUE
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
      maxiter,
      fineiter,
      cool.fact,
      weight.node.dist,
      weight.border,
      weight.edge.lengths,
      weight.edge.crossings,
      weight.node.edge.dist
    ) {},
    new = function(
      graph,
      ...,
      coords = NULL,
      maxiter = 10,
      fineiter = NULL,
      cool.fact = 0.75,
      weight.node.dist = 1.0,
      weight.border = 0.0,
      weight.edge.lengths = NULL,
      weight.edge.crossings = NULL,
      weight.node.edge.dist = NULL
    ) {},
    when = "3.0.0"
  ),

  layout_with_drl = list(
    old = function(graph, use.seed, seed, options, weights, dim) {},
    new = function(
      graph,
      ...,
      use.seed = FALSE,
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
      niter,
      start.temp,
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
      maxiter = niter
    ) {},
    new = function(
      graph,
      ...,
      coords = NULL,
      dim = c(2, 3),
      niter = 500,
      start.temp = NULL,
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
    old = function(graph, coords, maxiter, temp.max, temp.min, temp.init) {},
    new = function(
      graph,
      ...,
      coords = NULL,
      maxiter = NULL,
      temp.max = NULL,
      temp.min = 0.1,
      temp.init = NULL
    ) {},
    when = "3.0.0"
  ),

  layout_with_graphopt = list(
    old = function(
      graph,
      start,
      niter,
      charge,
      mass,
      spring.length,
      spring.constant,
      max.sa.movement
    ) {},
    new = function(
      graph,
      ...,
      start = NULL,
      niter = 500,
      charge = 0.001,
      mass = 30,
      spring.length = 0,
      spring.constant = 1,
      max.sa.movement = 5
    ) {},
    when = "3.0.0"
  ),

  layout_with_kk = list(
    old = function(
      graph,
      coords,
      dim,
      maxiter,
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
      maxiter = NULL,
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
      maxiter,
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
      maxiter = 150,
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
    old = function(graph, layers, hgap, vgap, maxiter, weights, attributes) {},
    new = function(
      graph,
      ...,
      layers = NULL,
      hgap = 1,
      vgap = 1,
      maxiter = 100,
      weights = NULL,
      attributes = c("default", "all", "none")
    ) {},
    when = "3.0.0"
  ),

  merge_coords = list(
    old = function(graphs, layouts, method) {},
    new = function(
      graphs,
      layouts,
      ...,
      method = "dla"
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
