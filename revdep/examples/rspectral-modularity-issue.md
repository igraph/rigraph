# rSpectral modularity calculation issue

## Issue
Modularity values have changed due to automatic weight detection

## Reproducible Example

```r
library(igraph)

# Create a test graph
g <- make_full_graph(5) + make_full_graph(5) + make_full_graph(5)
membership <- c(1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3)

# Test 1: Modularity without weights
mod1 <- modularity(g, membership, weights = NULL)
mod1
#> [1] 0.6666667

# Add weights to demonstrate the issue
set.seed(42)
E(g)$weight <- runif(ecount(g))
mod2 <- modularity(g, membership)
mod2
#> [1] 0.6663506

# Test: weights = NULL doesn't disable auto-detection!
mod3 <- modularity(g, membership, weights = NULL)
mod3  # Same as mod2, not mod1!
#> [1] 0.6663506

# WORKAROUND: Using weights = numeric() to disable auto-detection
mod4 <- modularity(g, membership, weights = numeric())
mod4  # Matches mod1!
#> [1] 0.6666667
```

## Root Cause
- igraph v2.2.1.9004 added: 'Use "weights" edge attribute in modularity() if available'
- `modularity()` now automatically uses edge weights if present
- `weights = NULL` doesn't disable this auto-detection
- `numeric()` is not NULL (skips auto-detection), but `!all(is.na(numeric()))` is FALSE, so weights gets set to NULL internally

## Assessment
- This is an inadvertent behavior change in igraph
- Modularity differences are small but significant for exact tests
- Expected: 0.408, Actual: 0.432 (difference: +0.024)
- Expected: 0.3776, Actual: 0.3758 (difference: -0.0018)

## Recommendation for rSpectral
1. Update saved graph objects using `upgrade_graph()`
2. Review whether graphs should have weights or not
3. WORKAROUND: Use `weights = numeric()` to get unweighted modularity
4. Or remove unintended weights: `g <- delete_edge_attr(g, 'weight')`
5. Update expected test values if the new weighted modularity is correct
