# Interactive plotting of graphs

**\[deprecated\]**

`tkplot.setcoords()` was renamed to
[`tk_set_coords()`](https://r.igraph.org/reference/tkplot.md) to create
a more consistent API.

## Usage

``` r
tkplot.setcoords(tkp.id, coords)
```

## Arguments

- tkp.id:

  The id of the tkplot window to close/reshape/etc.

- coords:

  Two-column numeric matrix, the new coordinates of the vertices, in
  absolute coordinates.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
