# Generate random graphs with a given degree sequence

**\[deprecated\]**

`degree.sequence.game()` was renamed to
[`sample_degseq()`](https://r.igraph.org/reference/sample_degseq.md) to
create a more consistent API.

## Usage

``` r
degree.sequence.game(
  out.deg,
  in.deg = NULL,
  method = c("simple", "vl", "simple.no.multiple", "simple.no.multiple.uniform")
)
```

## Arguments

- out.deg:

  Numeric vector, the sequence of degrees (for undirected graphs) or
  out-degrees (for directed graphs). For undirected graphs its sum
  should be even. For directed graphs its sum should be the same as the
  sum of `in.deg`.

- in.deg:

  For directed graph, the in-degree sequence. By default this is `NULL`
  and an undirected graph is created.

- method:

  Character, the method for generating the graph. See Details.

## Related documentation in the C library

[`degree_sequence_game()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_degree_sequence_game)
