# comato layout.spring() defunct

## Issue
`comato:::plot.conceptmaps()` passes `layout = "spring"`, which dispatches to `igraph::layout.spring()` — defunct since igraph 2.1.0. The package also still calls `graph.union()` (currently deprecated but slated to become defunct).

## Reproducible Example

```r
library(igraph)

g <- make_ring(10)

# Old call -- now defunct
layout.spring(g)
#> Error:
#> ! `layout.spring()` was deprecated in igraph 2.1.0 and is now defunct.
#> i Please use `layout_with_fr()` instead.

# Working replacement
coords <- layout_with_fr(g)
```

## Root Cause
`layout.spring()`, `layout.svd()`, and `layout.fruchterman.reingold.grid()` all advanced from deprecated to defunct in [#2634](https://github.com/igraph/rigraph/pull/2634). comato hardcodes `layout = "spring"`.

## Assessment
Bug in comato — references a layout function deprecated since igraph 2.1.0.

## Recommendation
**For comato**: switch `layout = "spring"` to a Fruchterman–Reingold layout (e.g. `layout = layout_with_fr` or precompute coordinates). Also rename `graph.union()` → `union()` to silence the remaining deprecation warning.
