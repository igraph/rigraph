# manynet scalar integer issue

## Issue
`lastcit_game_impl` expects scalar integer but receives vector

## Reproducible Example

```r
library(igraph)

# This works - scalar values
g1 <- sample_last_cit(n = 10, edges = 5, agebins = 10, directed = TRUE)
vcount(g1)
#> [1] 10
ecount(g1)
#> [1] 50

# This fails - vector for edges parameter
edges_vec <- c(5, 10)
g2 <- sample_last_cit(n = 10, edges = edges_vec, agebins = 10, directed = TRUE)
#> Error: Expecting a scalar integer but received a vector of length 2
```

## Root Cause
- igraph added stricter validation for scalar parameters
- C code in `rinterface_extra.c` now validates that scalar parameters are indeed scalars
- manynet's `generate_citations()` may be passing a vector where scalar is expected

## Assessment
- This is stricter type checking in igraph
- manynet needs to ensure it passes scalar values to `sample_last_cit()`
- The error message clearly indicates the parameter should be scalar

## Recommendation for manynet
- Check `generate_citations()` implementation
- Ensure 'edges' parameter is scalar: `edges <- edges[1]` or similar
- Or iterate if multiple values are intended: `lapply(edges_vec, function(e) sample_last_cit(...))`
