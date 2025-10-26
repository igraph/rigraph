# Convert object to a graph

This is a generic function to convert R objects to igraph graphs.

## Usage

``` r
graph_(...)
```

## Arguments

- ...:

  Parameters, see details below.

## Details

TODO

## Examples

``` r
## These are equivalent
graph_(cbind(1:5, 2:6), from_edgelist(directed = FALSE))
#> Warning: `graph_()` was deprecated in igraph 2.1.0.
#> ℹ Please use constructors directly, for instance graph_from_edgelist().
#> ℹ graph_() will be removed in a future version of igraph.
#> IGRAPH 9feddfd U--- 6 5 -- 
#> + edges from 9feddfd:
#> [1] 1--2 2--3 3--4 4--5 5--6
graph_(cbind(1:5, 2:6), from_edgelist(), directed = FALSE)
#> IGRAPH d0edfe4 U--- 6 5 -- 
#> + edges from d0edfe4:
#> [1] 1--2 2--3 3--4 4--5 5--6
```
