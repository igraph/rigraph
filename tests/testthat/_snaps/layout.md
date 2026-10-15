# layout_with_fr() deprecated argument

    Code
      l <- layout_with_fr(g, n_iter = 50, start_temp = sqrt(10) / 10, coolexp = 1,
      maxdelta = 1, area = 1, repulserad = 1)
    Condition
      Error:
      ! The `coolexp` argument of `layout_with_fr()` was deprecated in igraph 0.8.0 and is now defunct.

# layout_with_kk() deprecated arguments

    Code
      l <- layout_with_kk(g, max_iter = 50, coords = layout_in_circle(g), niter = 1,
      sigma = 1, initemp = 1, coolexp = 1)
    Condition
      Error:
      ! The `niter` argument of `layout_with_kk()` was deprecated in igraph 0.8.0 and is now defunct.

# layout_with_mds() deprecated argument

    Code
      l <- layout_with_mds(g, options = arpack_defaults())
    Condition
      Error:
      ! The `options` argument of `layout_with_mds()` was deprecated in igraph 1.6.0 and is now defunct.

# layout_randomly() errors well

    Code
      layout_randomly(g, dim = 4)
    Condition
      Error in `layout_randomly()`:
      ! `dim` must be one of "2" or "3", not "4".

# legacy iteration argument names are deprecated but still work

    Code
      res <- layout_with_fr(g, coords = coords, niter = 20)
    Condition
      Warning:
      Calling `layout_with_fr()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: layout_with_fr(graph, niter)
      i Use instead: layout_with_fr(graph, n_iter = )

