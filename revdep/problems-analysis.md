# Analysis of Reverse Dependency Problems

This document provides minimal reproducible examples and analysis for packages that now fail their checks compared to the most recent CRAN version.

**Note**: Runnable R scripts and markdown outputs demonstrating each issue can be found in the `examples/` directory.

## Summary

Six packages have newly broken checks:
1. **Cascade** (v2.3): Namespace collision warning
2. **DiagrammeR** (v1.0.11): `neighbors()` requires exactly one vertex
3. **jewel** (v2.0.2): Error due to strict integer validation
4. **manynet** (v1.7.0): Scalar integer validation in `sample_last_cit()`
5. **rSpectral** (v1.0.0.14): Test failures due to modularity calculation changes
6. **sfnetworks** (v0.6.5): `from` parameter requires exactly one vertex

## 1. Cascade - Namespace Collision Warning

### Issue
```
Warning: replacing previous import 'igraph::circulant' by 'magic::circulant' when loading 'Cascade'
```

### Root Cause
igraph added `make_circulant()` and its constructor alias `circulant()` in version 2.2.1.9003, creating a namespace collision with `magic::circulant()`.

### Assessment
**Inadvertent behavior change in igraph, not a bug in Cascade.**

The `circulant` function is exported as a constructor alias. Users should use `make_circulant()` directly.

### Recommendation
- **For Cascade**: Explicitly import `magic::circulant` in NAMESPACE
- **For igraph**: Consider unexported the constructor alias or document this known collision

**Severity**: Low - Warning only, no functionality broken

---

## 2. DiagrammeR - neighbors() Requires Single Vertex

### Issue
```
Error in `igraph::neighbors()`:
! `vid` must specify exactly one vertex
```

### Root Cause
igraph added stricter validation requiring exactly one vertex for `neighbors()`. DiagrammeR's `get_leverage_centrality()` passes a vector to `neighbors()`, which previously may have used implicit vectorization or only the first element.

### Assessment
**Intentional API tightening in igraph for safety and clarity.**

The code `mean(degree_vals[igraph::neighbors(ig_graph, degree_vals)])` attempts to pass a vector where a scalar is expected.

### Recommendation
**For DiagrammeR**: Iterate over vertices individually:
```r
# Change from:
neighbors(ig_graph, degree_vals)

# To:
lapply(seq_along(degree_vals), function(i) neighbors(ig_graph, i))
```

**Severity**: High - Package functionality broken

---

## 3. jewel - Integer Validation Error

### Issue
```
Error in rewire_impl(rewire = graph, n = niter, mode = mode) : 
  The value 2.4500000000000002 is not representable as an integer. Invalid value
```

### Minimal Reproducible Example
See `examples/jewel-integer-issue.R` and `.md`

### Root Cause
- `rewire_impl()` converts n with `as.numeric()`, preserving fractional parts
- C code now strictly validates that numeric values are representable as integers
- Previously may have silently truncated, now explicitly rejects

### Assessment
**This uncovered a bug in the jewel package.**

The `niter` parameter should logically be an integer (number of iterations). jewel computes `niter <- p * 0.05` which results in non-integer values.

### Recommendation
**For jewel**: Use integer rounding:
```r
niter <- ceiling(p * 0.05)  # or floor() or round()
```

**For igraph** (backward compatibility option): Add `as.integer()` in `rewire_keeping_degseq()` before calling `rewire_impl()`.

**Severity**: High - Package functionality broken

---

## 4. manynet - Scalar Integer Validation

### Issue
```
Error in `lastcit_game_impl(...)`:
Expecting a scalar integer but received a vector of length 2.
```

### Root Cause
igraph added stricter validation for scalar parameters. The C code now validates that parameters expecting scalars are indeed scalars, not vectors.

### Assessment
**Stricter type checking in igraph.**

manynet's `generate_citations()` may be passing a vector where a scalar is expected.

### Recommendation
**For manynet**: Ensure scalar values:
```r
# If only first value intended:
edges <- edges[1]

# If multiple values intended, iterate:
lapply(edges_vec, function(e) sample_last_cit(n, edges = e, ...))
```

**Severity**: High - Package functionality broken

---

## 5. rSpectral - Modularity Calculation Changes

### Issue
Test failures due to different modularity values:
- Expected: 0.408, Actual: 0.432 (difference: +0.024)
- Expected: 0.3776, Actual: 0.3758 (difference: -0.0018)

### Minimal Reproducible Example
See `examples/rspectral-modularity-issue.R` and `.md`

### Root Cause
igraph v2.2.1.9004 changed `modularity()` to automatically use the `"weight"` edge attribute if present:

```r
if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
  weights <- E(graph)$weight
}
```

### Workaround
**A workaround exists**: Passing `weights = numeric()` effectively disables auto-detection:

```r
modularity(g, membership, weights = numeric())  # Forces unweighted calculation
```

This works because `numeric()` is not `NULL` (skips auto-detection), but `!all(is.na(numeric()))` is `FALSE`, causing the code to set `weights <- NULL` internally.

### Assessment
**Inadvertent breaking change in igraph, but workaround available.**

### Recommendation
**For rSpectral**:
1. Update saved graph objects using `upgrade_graph()`
2. Review whether graphs should have weights
3. Use `weights = numeric()` for unweighted modularity
4. Or remove weights: `g <- delete_edge_attr(g, 'weight')`
5. Update test expectations if weighted behavior is correct

**For igraph**: Document `weights = numeric()` as the official workaround or fix so `weights = NULL` explicitly disables auto-detection.

**Severity**: Medium - Tests fail but workaround available

---

## 6. sfnetworks - from Parameter Requires Single Vertex

### Issue
```
Error in `all_shortest_paths(x, from, to, weights = weights, ...)`:
! `from` must specify exactly one vertex
```

### Root Cause
igraph added stricter validation requiring exactly one vertex for the `from` parameter in `all_shortest_paths()`. sfnetworks passes multiple vertices, which previously may have used only the first vertex implicitly.

### Assessment
**Intentional API tightening in igraph for safety and clarity.**

### Recommendation
**For sfnetworks**:
```r
# If only first vertex intended:
from <- from[1]

# If all vertices intended, iterate:
lapply(from, function(f) all_shortest_paths(g, from = f, to = to))

# Or provide clear warning about multiple vertices
```

**Severity**: High - Package functionality broken

---

## Conclusion

| Package | Issue Type | Root Cause | Severity | Recommendation |
|---------|-----------|------------|----------|----------------|
| Cascade | Namespace collision | New `circulant()` export | Low | Fix in Cascade NAMESPACE |
| DiagrammeR | API tightening | `neighbors()` requires scalar | High | Iterate over vertices |
| jewel | Type validation | Stricter integer checking | High | Round niter values |
| manynet | Type validation | Scalar parameter checking | High | Ensure scalar inputs |
| rSpectral | Behavior change | Automatic weight usage | Medium | Use `weights = numeric()` |
| sfnetworks | API tightening | `from` requires scalar | High | Handle single/multiple vertices |

### Overall Assessment

- **1 namespace collision** (Cascade) - Minor impact
- **3 API tightening changes** (DiagrammeR, manynet, sfnetworks) - Intentional safety improvements
- **1 uncovered downstream bug** (jewel) - Should use integer values
- **1 behavior change** (rSpectral) - Automatic weights with workaround available

Most issues stem from igraph's improved type safety and parameter validation. These are generally positive changes that make the API more explicit and catch errors earlier. Downstream packages need updates to handle the stricter requirements.
