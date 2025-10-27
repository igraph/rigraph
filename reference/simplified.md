# Constructor modifier to drop multiple and loop edges

Constructor modifier to drop multiple and loop edges

## Usage

``` r
simplified()
```

## See also

Constructor modifiers (and related functions)
[`make_()`](https://r.igraph.org/reference/make_.md),
[`sample_()`](https://r.igraph.org/reference/sample_.md),
[`with_edge_()`](https://r.igraph.org/reference/with_edge_.md),
[`with_graph_()`](https://r.igraph.org/reference/with_graph_.md),
[`with_vertex_()`](https://r.igraph.org/reference/with_vertex_.md),
[`without_attr()`](https://r.igraph.org/reference/without_attr.md),
[`without_loops()`](https://r.igraph.org/reference/without_loops.md),
[`without_multiples()`](https://r.igraph.org/reference/without_multiples.md)

## Examples

``` r
sample_(pa(10, m = 3, algorithm = "bag"))
#> IGRAPH 0a86968 D--- 10 27 -- Barabasi graph
#> + attr: name (g/c), power (g/n), m (g/n), zero.appeal (g/n), algorithm
#> | (g/c)
#> + edges from 0a86968:
#>  [1]  2->1  2->1  2->1  3->1  3->2  3->1  4->2  4->1  4->1  5->1  5->1  5->1
#> [13]  6->4  6->1  6->5  7->1  7->1  7->5  8->1  8->1  8->1  9->3  9->5  9->1
#> [25] 10->9 10->2 10->1
sample_(pa(10, m = 3, algorithm = "bag"), simplified())
#> IGRAPH 470df53 D--- 10 17 -- Barabasi graph
#> + attr: name (g/c), power (g/n), m (g/n), zero.appeal (g/n), algorithm
#> | (g/c)
#> + edges from 470df53:
#>  [1]  2->1  3->1  4->1  5->1  5->2  5->3  6->1  6->3  7->1  7->2  7->5  8->1
#> [13]  8->5  9->1  9->2 10->1 10->2
```
