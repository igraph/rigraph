# jewel integer validation issue

## Issue
`rewire_impl` now strictly validates that n is an integer

## Reproducible Example

```r
library(igraph)

# Create a simple graph for testing
g <- make_ring(10)

# This works - integer value
result1 <- rewire(g, keeping_degseq(niter = 100))
vcount(result1)
#> [1] 10
ecount(result1)
#> [1] 10

# This fails - non-integer value
rewire(g, keeping_degseq(niter = 2.45))
#> Error: The value 2.4500000000000002 is not representable as an integer

# Simulating jewel package scenario
p <- 49
niter <- p * 0.05  # = 2.45

# This also fails
rewire(g, keeping_degseq(niter = niter))
#> Error: The value 2.4500000000000002 is not representable as an integer

# Workaround using as.integer()
result2 <- rewire(g, keeping_degseq(niter = as.integer(niter)))
vcount(result2)
#> [1] 10
```

## Root Cause
- `rewire_impl()` converts n with `as.numeric()`, preserving fractional parts
- C code in `rinterface_extra.c` now strictly validates integer values
- Previously may have silently truncated, now explicitly rejects

## Assessment
- This uncovered a bug in the jewel package
- `niter` should logically be an integer (number of iterations)
- jewel should use `ceiling()`, `floor()`, or `round()` on computed niter

## Recommendation
- Fix in jewel: `niter <- ceiling(p * 0.05)`
- OR fix in igraph for backward compatibility: Add `as.integer()` in `rewire_keeping_degseq()` before calling `rewire_impl()`
