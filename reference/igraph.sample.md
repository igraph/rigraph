# Sampling a random integer sequence

**\[deprecated\]**

`igraph.sample()` was renamed to
[`sample_seq()`](https://r.igraph.org/reference/sample_seq.md) to create
a more consistent API.

## Usage

``` r
igraph.sample(low, high, length)
```

## Arguments

- low:

  The lower limit of the interval (inclusive).

- high:

  The higher limit of the interval (inclusive).

- length:

  The length of the sample.

## Related documentation in the C library

[`random_sample`](https://igraph.org/c/html/0.10.17/igraph-Nongraph.html#igraph_random_sample)
