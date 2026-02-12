# Generate an evolving random graph with preferential attachment and aging

**\[deprecated\]**

`aging.barabasi.game()` was renamed to
[`sample_pa_age()`](https://r.igraph.org/reference/sample_pa_age.md) to
create a more consistent API.

## Usage

``` r
aging.barabasi.game(
  n,
  pa.exp,
  aging.exp,
  m = NULL,
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
)
```

## Arguments

- n:

  The number of vertices in the graph.

- pa.exp:

  The preferential attachment exponent, see the details below.

- aging.exp:

  The exponent of the aging, usually a non-positive number, see details
  below.

- m:

  The number of edges each new vertex creates (except the very first
  vertex). This argument is used only if both the `out.dist` and
  `out.seq` arguments are NULL.

- aging.bin:

  The number of bins to use for measuring the age of vertices, see
  details below.

- out.dist:

  The discrete distribution to generate the number of edges to add in
  each time step if `out.seq` is NULL. See details below.

- out.seq:

  The number of edges to add in each time step, a vector containing as
  many elements as the number of vertices. See details below.

- out.pref:

  Logical constant, whether to include edges not initiated by the vertex
  as a basis of preferential attachment. See details below.

- directed:

  Logical constant, whether to generate a directed graph. See details
  below.

- zero.deg.appeal:

  The degree-dependent part of the ‘attractiveness’ of the vertices with
  no adjacent edges. See also details below.

- zero.age.appeal:

  The age-dependent part of the ‘attrativeness’ of the vertices with age
  zero. It is usually zero, see details below.

- deg.coef:

  The coefficient of the degree-dependent ‘attractiveness’. See details
  below.

- age.coef:

  The coefficient of the age-dependent part of the ‘attractiveness’. See
  details below.

- time.window:

  Integer constant, if NULL only adjacent added in the last
  `time.windows` time steps are counted as a basis of the preferential
  attachment. See also details below.
