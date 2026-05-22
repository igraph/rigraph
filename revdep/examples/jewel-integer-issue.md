# jewel non-integer rewire iteration count

## Issue
```
Error in rewire_impl(rewire = graph, n = niter, mode = mode) :
  The value 2.4500000000000002 is not representable as an integer. Invalid value
Source: rinterface_extra.c:83
```

`jewel:::generateData_rewire()` computes `niter = p * 0.05` (often fractional) and passes it through `igraph::rewire()`, whose C interface now strictly rejects non-integer values.

## Reproducible Example

```r
library(igraph)
g <- make_ring(20)
p <- 49
niter_bad <- p * 0.05    # 2.45

rewire(g, with = keeping_degseq(niter = niter_bad))
#> Error in rewire_impl(rewire = graph, n = niter, mode = mode) :
#>   The value 2.45 is not representable as an integer. Invalid value

# Working replacement
rewire(g, with = keeping_degseq(niter = as.integer(ceiling(p * 0.05))))
```

## Root Cause
igraph's C interface now strictly validates that numeric arguments are exactly representable as integers. Previously, fractional values were silently truncated.

## Assessment
Bug in jewel — a count of iterations should always be an integer.

## Recommendation
**For jewel**: integer-round the value before the `rewire()` call: `niter <- as.integer(ceiling(p * 0.05))` (or `floor()`, or `round()` — pick the one that matches intended semantics).

**For igraph** (optional defensive measure): consider adding `as.integer()` on the R side in `rewire_keeping_degseq()` before calling `rewire_impl()`. The strict C-side check is the correct contract, but the R wrapper could be friendlier.
