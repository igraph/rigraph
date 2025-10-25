# Merging graph layouts

**\[deprecated\]**

`layout.merge()` was renamed to
[`merge_coords()`](https://r.igraph.org/reference/merge_coords.md) to
create a more consistent API.

## Usage

``` r
layout.merge(graphs, layouts, method = "dla")
```

## Arguments

- graphs:

  A list of graph objects.

- layouts:

  A list of two-column matrices.

- method:

  Character constant giving the method to use. Right now only `dla` is
  implemented.
