# Argument-signature migrations: plotting
# Schema: see tools/migrations/README.md. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  igraph_opt = list(
    old = function(x, default) {},
    new = function(
      x,
      ...,
      default = NULL
    ) {},
    when = "3.0.0"
  ),

  curve_multiple = list(
    old = function(graph, start) {},
    new = function(
      graph,
      ...,
      start = 0.5
    ) {},
    when = "3.0.0"
  ),

  add_shape = list(
    old = function(shape, clip, plot, parameters) {},
    new = function(
      shape,
      ...,
      clip = shape_noclip,
      plot = shape_noplot,
      parameters = list()
    ) {},
    when = "3.0.0"
  ),

  tk_close = list(
    old = function(tkp.id, window.close) {},
    new = function(
      tkp.id,
      ...,
      window.close = TRUE
    ) {},
    when = "3.0.0"
  ),

  tk_coords = list(
    old = function(tkp.id, norm) {},
    new = function(
      tkp.id,
      ...,
      norm = FALSE
    ) {},
    when = "3.0.0"
  ),

  tk_fit = list(
    old = function(tkp.id, width, height) {},
    new = function(
      tkp.id,
      ...,
      width = NULL,
      height = NULL
    ) {},
    when = "3.0.0"
  ),

  tk_rotate = list(
    old = function(tkp.id, degree, rad) {},
    new = function(
      tkp.id,
      ...,
      degree = NULL,
      rad = NULL
    ) {},
    when = "3.0.0"
  )
)
