# ECoL hub.score() defunct

## Issue
`ECoL:::c.Hubs()` calls `igraph::hub.score(graph)`, defunct in igraph 2.0.0. Breaks examples and 3 tests.

## Reproducible Example

```r
library(igraph)

g <- sample_gnp(20, 0.2, directed = TRUE)

hub.score(g)
#> Error:
#> ! `hub.score()` was deprecated in igraph 2.0.0 and is now defunct.
#> i Please use `hits_scores()` instead.

# Working replacement
scores <- hits_scores(g)
scores$hub
scores$authority
```

## Root Cause
`hub.score()` and `authority.score()` were deprecated in igraph 2.0.0 (both replaced by `hits_scores()`, which returns both vectors). Advanced from `deprecate_warn` to `deprecate_stop` in [#2634](https://github.com/igraph/rigraph/pull/2634).

## Assessment
Bug in ECoL — uses a function name deprecated for the entire 2.x series.

## Recommendation
**For ECoL**: replace `igraph::hub.score(graph)` with `igraph::hits_scores(graph)$hub`. Replace any `authority.score()` calls with `hits_scores(graph)$authority`.
