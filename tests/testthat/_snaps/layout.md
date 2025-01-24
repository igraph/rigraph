# layout_with_fr() deprecated argument

    Code
      l <- layout_with_fr(g, niter = 50, start.temp = sqrt(10) / 10, coolexp = 1,
      maxdelta = 1, area = 1, repulserad = 1)
    Condition
      Error:
      ! The `coolexp` argument of `layout_with_fr()` was deprecated in igraph 0.8.0 and is now defunct.

# layout_with_kk() deprecated arguments

    Code
      l <- layout_with_kk(g, maxiter = 50, coords = layout_in_circle(g), niter = 1,
      sigma = 1, initemp = 1, coolexp = 1)
    Condition
      Error:
      ! The `niter` argument of `layout_with_kk()` was deprecated in igraph 0.8.0 and is now defunct.

