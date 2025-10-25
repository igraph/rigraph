# Normalize coordinates for plotting graphs

**\[deprecated\]**

`layout.norm()` was renamed to
[`norm_coords()`](https://r.igraph.org/reference/norm_coords.md) to
create a more consistent API.

## Usage

``` r
layout.norm(
  layout,
  xmin = -1,
  xmax = 1,
  ymin = -1,
  ymax = 1,
  zmin = -1,
  zmax = 1
)
```

## Arguments

- layout:

  A matrix with two or three columns, the layout to normalize.

- xmin, xmax:

  The limits for the first coordinate, if one of them or both are `NULL`
  then no normalization is performed along this direction.

- ymin, ymax:

  The limits for the second coordinate, if one of them or both are
  `NULL` then no normalization is performed along this direction.

- zmin, zmax:

  The limits for the third coordinate, if one of them or both are `NULL`
  then no normalization is performed along this direction.
