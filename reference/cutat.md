# Functions to deal with the result of network community detection

**\[deprecated\]**

`cutat()` was renamed to
[`cut_at()`](https://r.igraph.org/reference/communities.md) to create a
more consistent API.

## Usage

``` r
cutat(communities, no, steps)
```

## Arguments

- no:

  Integer scalar, the desired number of communities. If too low or two
  high, then an error message is given. Exactly one of `no` and `steps`
  must be supplied.

- steps:

  The number of merge operations to perform to produce the communities.
  Exactly one of `no` and `steps` must be supplied.
