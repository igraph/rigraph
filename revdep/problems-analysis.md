# Analysis of Reverse Dependency Problems

This document provides minimal reproducible examples and analysis for packages that now fail their checks compared to the most recent CRAN version.

**Note**: Runnable R scripts and markdown outputs demonstrating each issue can be found in the `examples/` directory. A draft response to the CRAN review email is in `cran-response-draft.md`.

## Summary

Six packages have newly broken checks in our revdepcheck run; two additional packages (rgph, tmap.networks) appeared in the CRAN win-builder check:
1. **Cascade** (v2.3): Namespace collision warning
2. **DiagrammeR** (v1.0.11): `neighbors()` requires exactly one vertex
3. **jewel** (v2.0.2): Error due to strict integer validation
4. **manynet** (v1.7.0): Scalar integer validation in `sample_last_cit()`
5. **rSpectral** (v1.0.0.14): Test failures due to modularity calculation changes
6. **sfnetworks** (v0.6.5): `from` parameter requires exactly one vertex
7. **rgph** (v0.1.0): Under investigation (igraph is `Suggests` only; win-builder failure)
8. **tmap.networks** (v0.1): Cascading failure from sfnetworks

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

### Hacky workaround (do not recommend to revdep maintainers)
Passing `weights = numeric()` happens to disable auto-detection due to implementation details:

```r
modularity(g, membership, weights = numeric())
```

This is **not** a robust solution and should **not** be recommended to rSpectral or other downstream maintainers, as it relies on internal behavior that may change.

### Assessment
**Inadvertent breaking change in igraph. igraph needs to provide a clean fix.**

### Recommendation
**For igraph** (action required before notifying revdep maintainers):
- Add a proper `weights = NA` mechanism to explicitly disable weight auto-detection, with a documented user-facing contract.
- Document this as a breaking change in NEWS.md.
- Until a clean solution exists, the recommendation to rSpectral maintainers should be to remove unintended weight attributes: `g <- delete_edge_attr(g, "weight")`

**For rSpectral** (once root cause is understood):
1. Determine whether graphs are *intended* to have a `"weight"` attribute
2. If not: `g <- igraph::delete_edge_attr(g, "weight")` before calling `modularity()`
3. If yes: update expected test values to the weighted modularity
4. Call `igraph::upgrade_graph()` on stored graph objects

**Severity**: Medium - Tests fail; igraph behavior change needs a clean fix

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

## 7. rgph (0.1.0) – Under Investigation

### Issue
Reported as failing in the CRAN win-builder check for igraph 2.3.0. Not reproduced in our Linux-based `revdepcheck` run.

### Root Cause (preliminary)
rgph lists igraph only as a `Suggests` dependency. Failures likely occur in tests or examples that optionally use igraph. The most probable cause, given the other patterns in this release, is either the `neighbors()` scalar validation or another strict type-checking change.

### Assessment
Preliminary assessment: likely a downstream issue (using undocumented behavior of igraph). Investigation ongoing.

### Recommendation
Run targeted checks to reproduce:
```r
install.packages("rgph")
tools::testInstalledPackage("rgph")  # or devtools::check()
```
Once the error is reproduced, contact the rgph maintainer with a targeted fix.

**Severity**: Unknown – under investigation

---

## 8. tmap.networks (0.1) – Cascading Failure from sfnetworks

### Issue
tmap.networks imports sfnetworks directly. Since sfnetworks fails due to the `all_shortest_paths()` `from` validation change, tmap.networks fails as a cascade.

### Root Cause
Not a direct bug in tmap.networks; it inherits the sfnetworks breakage.

### Assessment
**Cascading failure**: tmap.networks will pass once sfnetworks is fixed.

### Recommendation
No action needed for tmap.networks directly. Once sfnetworks is updated, inform the tmap.networks maintainer that a new sfnetworks release is available.

**Severity**: High (package broken), but resolved automatically when sfnetworks is fixed

---

## Conclusion

| Package | Issue Type | Root Cause | Severity | Action |
|---------|-----------|------------|----------|--------|
| Cascade | Namespace collision | New `circulant()` export | Low | Fix in Cascade NAMESPACE; igraph to reconsider export |
| DiagrammeR | API tightening | `neighbors()` requires scalar | High | DiagrammeR to iterate vertices |
| jewel | Type validation | Stricter integer checking | High | jewel to use `ceiling()` on computed niter |
| manynet | Type validation | Scalar parameter checking | High | manynet to ensure scalar inputs |
| rSpectral | Behavior change | Automatic weight usage | Medium | igraph needs clean fix; rSpectral to check weight intent |
| sfnetworks | API tightening | `from` requires scalar | High | sfnetworks to iterate vertices |
| rgph | Under investigation | Likely API tightening | Unknown | Reproduce and contact maintainer |
| tmap.networks | Cascading | sfnetworks failure | High | Wait for sfnetworks fix |

### Overall Assessment

- **1 namespace collision** (Cascade) – Minor impact; inadvertent igraph export
- **3 API tightening changes** (DiagrammeR, manynet, sfnetworks) – Intentional safety improvements; downstream bugs exposed
- **1 uncovered downstream bug** (jewel) – Should use integer values
- **1 behavior change needing igraph fix** (rSpectral) – Automatic weights; igraph must provide a clean `NA` mechanism
- **1 cascading failure** (tmap.networks) – Resolved when sfnetworks is fixed
- **1 under investigation** (rgph) – Likely API tightening

Most issues stem from igraph's improved type safety and parameter validation. These are generally positive changes. However, the modularity weight auto-detection change (rSpectral) requires a proper igraph-side fix before we can issue clear guidance to downstream maintainers.
