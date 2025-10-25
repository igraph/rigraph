# Running mean of a time series

**\[deprecated\]**

`running.mean()` was renamed to
[`running_mean()`](https://r.igraph.org/reference/running_mean.md) to
create a more consistent API.

## Usage

``` r
running.mean(v, binwidth)
```

## Arguments

- v:

  The numeric vector.

- binwidth:

  Numeric constant, the size of the bin, should be meaningful, i.e.
  smaller than the length of `v`.
