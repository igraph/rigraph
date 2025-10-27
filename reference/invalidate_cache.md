# Invalidate the cache of a graph

igraph graphs cache some basic properties (such as whether the graph is
a DAG or whether it is simple) in an internal data structure for faster
repeated queries. This function invalidates the cache, forcing a
recalculation of the cached properties the next time they are needed.

## Usage

``` r
invalidate_cache(graph)
```

## Arguments

- graph:

  The graph whose cache is to be invalidated.

## Value

The graph with its cache invalidated. Since the graph is modified in
place in R as well, you can also ignore the return value.

## Details

You should not need to call this function during normal usage; however,
it may be useful for debugging cache-related issues. A tell-tale sign of
an invalid cache entry is when the result of a cached function (such as
[`is_dag()`](https://r.igraph.org/reference/is_dag.md) or
[`is_simple()`](https://r.igraph.org/reference/simplify.md)) changes
after calling this function.

## Examples

``` r
g <- make_ring(10)
# Cache is populated when calling is_simple()
is_simple(g)
#> [1] TRUE
# Invalidate cache (for debugging purposes)
invalidate_cache(g)
#> IGRAPH f510d80 U--- 10 10 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l)
#> + edges from f510d80:
#>  [1] 1-- 2 2-- 3 3-- 4 4-- 5 5-- 6 6-- 7 7-- 8 8-- 9 9--10 1--10
# Result should be the same
is_simple(g)
#> [1] TRUE
```
