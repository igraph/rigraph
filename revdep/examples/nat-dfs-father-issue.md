# nat dfs(father = ) defunct argument

## Issue
`nat:::as.seglist.igraph()` calls `igraph::dfs(x, root = origin, father = TRUE, mode = "all")`, which is defunct in igraph 2.2.0. Breaks examples, 38 test failures, and the `neurons-intro.Rmd` vignette.

## Reproducible Example

```r
library(igraph)

g <- make_tree(10, children = 2, mode = "out")

# Mirrors the call in nat -- now defunct
dfs(g, root = 1, father = TRUE, mode = "all")
#> Error:
#> ! The `father` argument of `dfs()` was deprecated in igraph 2.2.0 and is
#>   now defunct.
#> i Please use the `parent` argument instead.

# Working replacement
dfs(g, root = 1, parent = TRUE, mode = "all")$parent
```

## Root Cause
- `dfs(father = )` was deprecated in igraph 2.2.0 in favour of `parent =`.
- Advanced from `deprecate_warn` to `deprecate_stop` in [#2634](https://github.com/igraph/rigraph/pull/2634).

## Assessment
Direct caller (not a cascade). Intentional API rename in igraph.

## Recommendation
**For nat**: change `father = TRUE` to `parent = TRUE` in `as.seglist.igraph()` and update any code reading `res$father` to read `res$parent`.
