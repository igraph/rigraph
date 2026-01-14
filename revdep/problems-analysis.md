# Analysis of Reverse Dependency Problems

This document provides minimal reproducible examples and analysis for the three packages that now fail their checks compared to the most recent CRAN version.

**Note**: Runnable R scripts demonstrating each issue can be found in the `examples/` directory.

## Summary

Three packages have newly broken checks:
1. **Cascade** (v2.3): Namespace collision warning
2. **jewel** (v2.0.2): Error due to strict integer validation
3. **rSpectral** (v1.0.0.10): Test failures due to modularity calculation changes

## 1. Cascade - Namespace Collision Warning

### Issue
```
Warning: replacing previous import 'igraph::circulant' by 'magic::circulant' when loading 'Cascade'
```

### Root Cause
igraph recently added a new function `make_circulant()` (and its constructor alias `circulant()`) in version 2.2.1.9003. This creates a namespace collision with the `magic::circulant()` function that the Cascade package also uses.

From NEWS.md:
```
# igraph 2.2.1.9003
- Add `make_circulant()` to expose `igraph_circulant()` (#1563, #2407).
```

### Assessment
**This is an inadvertent behavior change in igraph, not a bug in Cascade.**

The `circulant` function is exported from igraph but is primarily a constructor alias (used as `graph(circulant(...))`). The main function users should use is `make_circulant()`.

### Recommendation
The `circulant` constructor alias could potentially be unexported to avoid this namespace collision, as users should be using `make_circulant()` directly. However, this would be a breaking change for users already using the constructor form.

Alternatively, this is a minor warning that doesn't prevent Cascade from working, and Cascade package maintainers could resolve it by explicitly importing `magic::circulant` in their NAMESPACE.

## 2. jewel - Integer Validation Error

### Issue
```
Error in rewire_impl(rewire = graph, n = niter, mode = mode) : 
  At rinterface_extra.c:83 : The value 2.4500000000000002 is not representable as an integer. Invalid value
```

### Minimal Reproducible Example
```r
library(igraph)
g <- make_ring(10)

# This works (integer value)
rewire(g, keeping_degseq(niter = 100))  # SUCCESS

# This fails (non-integer value)
rewire(g, keeping_degseq(niter = 2.45))  # ERROR

# The jewel package computes niter dynamically, e.g., p * 0.05 where p=49
p <- 49
niter <- p * 0.05  # = 2.45
rewire(g, keeping_degseq(niter = niter))  # ERROR
```

### Root Cause
The `rewire_impl()` function in `R/aaa-auto.R` converts the `n` parameter using `as.numeric()`:

```r
rewire_impl <- function(rewire, n, mode = c("simple", "simple_loops")) {
  ensure_igraph(rewire)
  n <- as.numeric(n)  # This preserves non-integer values
  mode <- switch_igraph_arg(mode, "simple" = 0L, "simple_loops" = 1L)
  # ...
  res <- .Call(R_igraph_rewire, rewire, n, mode)
}
```

However, the C code in `src/rinterface_extra.c` now strictly validates that numeric values are representable as integers:

```c
if (((igraph_integer_t) REAL(value)[0]) != REAL(value)[0]) {
  igraph_errorf("The value %.17g is not representable as an integer.",
                __FILE__, __LINE__, IGRAPH_EINVAL, REAL(value)[0]);
}
```

Previously, the C code may have silently truncated or rounded non-integer values, but now it explicitly rejects them.

### Assessment
**This is a behavior change in igraph that uncovered a bug in the jewel package.**

The `niter` parameter should logically be an integer (number of iterations), and the jewel package should be rounding or truncating the computed value. However, igraph's stricter validation now makes this explicit.

### Recommendation
The fix should be in the jewel package - they should ensure `niter` is an integer:
```r
niter <- ceiling(p * 0.05)  # or floor() or round()
```

However, igraph could be more user-friendly by automatically rounding the value in `rewire_keeping_degseq()` before passing to `rewire_impl()`:

```r
rewire_keeping_degseq <- function(graph, loops, niter) {
  loops <- as.logical(loops)
  niter <- as.integer(niter)  # Add explicit integer conversion
  mode <- if (loops) "simple_loops" else "simple"
  
  rewire_impl(
    rewire = graph,
    n = niter,
    mode = mode
  )
}
```

This would maintain backward compatibility while still enforcing the integer requirement.

## 3. rSpectral - Modularity Calculation Changes

### Issue
Test failures showing modularity values have changed:
- Expected: 0.408, Actual: 0.432 (difference: +0.024)
- Expected: 0.3776, Actual: 0.3758 (difference: -0.0018)

### Root Cause
From NEWS.md:
```
# igraph 2.2.1.9004
- Use `"weights"` edge attribute in `modularity()` if available.
```

The `modularity_impl()` function in `R/aaa-auto.R` now has this code:

```r
if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
  weights <- E(graph)$weight
}
```

This means that:
1. If the graph has a "weight" edge attribute, it will be automatically used for modularity calculations
2. Even if you explicitly pass `weights = NULL`, the function will still use the graph's weight attribute
3. There is no way to disable weights if the graph has a weight attribute

Previously, `weights = NULL` meant "don't use weights", but now it means "use default weights if available".

Additionally, there's a note in the test output:
```
This graph was created by an old(er) igraph version.
i Call `igraph::upgrade_graph()` on it to use with the current igraph version.
For now we convert it on the fly...
```

This suggests the test is using pre-existing graph objects that may have been created with an older version of igraph, and those graphs may have inadvertently gained or lost weight attributes during the upgrade process.

### Assessment
**This is an inadvertent breaking change in igraph, but a workaround exists.**

The automatic use of weights in modularity calculations is a behavior change that:
1. Affects existing code that doesn't expect weights to be used
2. Cannot be overridden by passing `weights = NULL` (which intuitively should mean "don't use weights")
3. Makes the behavior dependent on whether the graph happens to have a "weight" attribute

The modularity differences are small but significant for tests that check exact values.

**However**, passing `weights = numeric()` provides a simple workaround to force unweighted calculations.

### Workaround
**A workaround exists**: Passing `weights = numeric()` (an empty numeric vector) effectively disables auto-detection and forces unweighted modularity calculation.

```r
# With weight attribute, but want unweighted modularity
E(g)$weight <- runif(ecount(g))
modularity(g, membership, weights = numeric())  # Unweighted result
```

This works because:
1. `numeric()` is not `NULL`, so auto-detection is skipped
2. The condition `!all(is.na(numeric()))` is `FALSE` (since `all()` of empty vector returns `TRUE`)
3. This causes the code to set `weights <- NULL` internally

### Recommendation
**For rSpectral** (and other affected packages):
1. Update saved graph objects using `upgrade_graph()`
2. Review whether graphs should have weights or not
3. If unweighted modularity is needed despite weight attribute, use `weights = numeric()`
4. Alternatively, remove unintended weights: `g <- delete_edge_attr(g, "weight")`
5. Update expected test values if the new weighted behavior is correct

**For igraph maintainers** (design decision):
- **Option 1**: Document `weights = numeric()` as the official way to disable auto-detection
- **Option 2**: Change logic so `weights = NULL` explicitly disables auto-detection (requires distinguishing missing argument from explicit `NULL`)
- **Option 3**: Revert to old behavior (no auto-detection, require explicit `weights = E(graph)$weight`)

## Conclusion

| Package | Issue Type | Root Cause | Recommendation |
|---------|-----------|------------|----------------|
| Cascade | Namespace collision | New `circulant()` export | Consider unexported constructor or document as known issue |
| jewel | Integer validation | Stricter type checking in C code | Add `as.integer()` conversion in igraph for backward compatibility |
| rSpectral | Modularity changes | Automatic weight usage that cannot be overridden with `weights = NULL` | Use `weights = numeric()` workaround, or remove weight attributes |

**Overall Assessment**: 
- **1 inadvertent behavior change** (Cascade - namespace collision with minor impact)
- **1 uncovered downstream bug** (jewel - should use integer niter, but igraph could be more forgiving)
- **1 breaking change** (rSpectral - automatic weights in modularity that cannot be disabled)

### Detailed Recommendations

#### For Cascade (Namespace Collision)
- **Impact**: Minor - just a warning, doesn't prevent package from working
- **igraph action**: Consider not exporting the `circulant` constructor alias, only export `make_circulant()`
- **Package action**: Cascade can add explicit import: `importFrom(magic, circulant)` in NAMESPACE

#### For jewel (Integer Validation)
- **Impact**: High - package completely breaks
- **igraph action**: Add backward compatibility by converting to integer in `rewire_keeping_degseq()`:
  ```r
  rewire_keeping_degseq <- function(graph, loops, niter) {
    loops <- as.logical(loops)
    niter <- as.integer(round(niter))  # Round and convert to integer
    mode <- if (loops) "simple_loops" else "simple"
    rewire_impl(rewire = graph, n = niter, mode = mode)
  }
  ```
- **Package action**: jewel should fix their code to use `ceiling(p * 0.05)` instead of `p * 0.05`

#### For rSpectral (Modularity Changes)  
- **Impact**: Medium - tests fail but core functionality may still work
- **Workaround available**: Use `weights = numeric()` to disable auto-detection
- **Package action**: 
  1. Update saved graphs with `upgrade_graph()`
  2. Check for unintended weight attributes
  3. Use `modularity(g, membership, weights = numeric())` for unweighted calculation
  4. Or remove weights: `g <- delete_edge_attr(g, "weight")`
  5. Update test expectations if weighted behavior is correct
