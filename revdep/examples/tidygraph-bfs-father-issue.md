# tidygraph bfs(father = ) defunct argument

## Issue
`tidygraph::map_bfs*()` / `map_dfs*()` call `igraph::bfs(..., father = TRUE)`, which is defunct in igraph 2.2.0. The same call breaks the dci, ggraph, and scistreer downstream packages.

## Reproducible Example

```r
library(igraph)

g <- make_tree(10, children = 2, mode = "out")

# Old call -- now defunct
bfs(g, root = 1, father = TRUE)
#> Error:
#> ! The `father` argument of `bfs()` was deprecated in igraph 2.2.0 and is
#>   now defunct.
#> i Please use the `parent` argument instead.

# Working replacement
res <- bfs(g, root = 1, parent = TRUE)
res$parent
#> + 10/10 vertices, from <hash>:
#>  [1] NA  1  1  2  2  3  3  4  4  5
```

## Root Cause
- `bfs(father = )` and `dfs(father = )` were deprecated in igraph 2.2.0 in favour of `parent =`.
- Both advanced from `deprecate_warn` to `deprecate_stop` in [#2634](https://github.com/igraph/rigraph/pull/2634).
- `tidygraph:::bfs_df()` still passes `father = TRUE`.

## Assessment
Intentional API rename in igraph. tidygraph is the root of the visible cascade — dci, ggraph, and scistreer all funnel through `tidygraph::map_bfs*`.

## Recommendation
**For tidygraph**: rename `father` → `parent` in every `igraph::bfs()` and `igraph::dfs()` call, and update any code reading `$father` from the result to read `$parent` instead. Once tidygraph releases the fix, dci/ggraph/scistreer pass without changes.
