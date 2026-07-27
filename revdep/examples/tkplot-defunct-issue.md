# tkplot() defunct (igraph 3.0.0)

## Issue
`igraph::tkplot()` advanced to `deprecate_stop("3.0.0", "tkplot()")` in [#2615](https://github.com/igraph/rigraph/pull/2615). Five revdep packages call it directly from their examples and now hard-error with the same message.

| Package | Caller |
|---|---|
| Boptbd | `Boptbd::graphoptBbd()` |
| c3net | `c3net::netplot()` (via `c3net::c3net(..., network = TRUE)`) |
| ggm | `ggm::AG(..., plot = TRUE)` |
| optbdmaeAT | `optbdmaeAT::graphoptbd.mae()` |
| optrcdmaeAT | `optrcdmaeAT::graphoptrcd.mae()` |

## Reproducible Example

```r
library(igraph)
g <- make_ring(5)

tkplot(g)
#> Error:
#> ! `tkplot()` was deprecated in igraph 3.0.0 and is now defunct.

# Working replacement
plot(g)
```

## Root Cause
The interactive Tk-based plotter has been removed. Non-interactive `plot()` (i.e. `plot.igraph()`) is the recommended drop-in replacement.

## Assessment
Intentional removal in igraph (#2615). All five packages are direct callers; no cascading.

## Recommendation
**For each affected package**: replace `igraph::tkplot(g, ...)` with `igraph::plot.igraph(g, ...)` (or just `plot(g, ...)`).

Tk-specific tuning functions (`tkplot.canvas`, `tkplot.setcoords`, …) are themselves deprecated and have no direct replacement. Packages that genuinely needed interactive graph editing should adopt a JS-based plotter (e.g. `visNetwork`) instead.
