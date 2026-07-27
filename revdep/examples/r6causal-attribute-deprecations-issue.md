# R6causal install-time attribute setter deprecation warnings

## Issue
```
checking whether package ‘R6causal’ can be installed ... WARNING
Found the following significant warnings:
  Warning: `set.edge.attribute()` was deprecated in igraph 2.0.0.
  Warning: `induced.subgraph()` was deprecated in igraph 2.0.0.
  Warning: `get.vertex.attribute()` was deprecated in igraph 2.0.0.
```

## Reproducible Example

```r
library(igraph)

g <- make_ring(5)

g <- set.edge.attribute(g, "weight", value = 1:5)
#> Warning: `set.edge.attribute()` was deprecated in igraph 2.0.0. ...
sub <- induced.subgraph(g, 1:3)
#> Warning: `induced.subgraph()` was deprecated in igraph 2.0.0. ...
get.vertex.attribute(sub, "name")
#> Warning: `get.vertex.attribute()` was deprecated in igraph 2.0.0. ...

# Working replacements
g2 <- set_edge_attr(make_ring(5), "weight", value = 1:5)
sub2 <- induced_subgraph(g2, 1:3)
vertex_attr(sub2, "name")
```

## Root Cause
All three were deprecated in igraph 2.0.0 and still emit warnings (not yet defunct). R CMD check surfaces them as a package-install WARNING because they appear during `.onLoad` / package-build time.

## Assessment
Bug in R6causal — replace with current API names; will hard-fail when any of these is promoted to defunct.

## Recommendation
**For R6causal**:

| Deprecated | Replacement |
|---|---|
| `set.edge.attribute()` | `set_edge_attr()` |
| `induced.subgraph()` | `induced_subgraph()` |
| `get.vertex.attribute()` | `vertex_attr()` |
