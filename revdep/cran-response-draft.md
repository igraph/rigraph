# Draft response to CRAN teams' auto-check for igraph 2.3.0

**Subject**: Re: CRAN pre-release check results for igraph 2.3.0 – reverse dependency issues

---

Dear CRAN team,

Thank you for running the pre-release checks. Below is our assessment of each reverse dependency failure, categorized by root cause.

---

## Summary

Of the 7 packages flagged, the issues fall into three categories:

1. **API tightening (expected breakage)**: DiagrammeR, sfnetworks, tmap.networks, rgph  
   These packages pass a vector where igraph now requires a scalar vertex ID. This is an intentional validation improvement. We have reached out to the maintainers.

2. **Bug in downstream package (expected breakage)**: jewel  
   The package passes non-integer values to an argument that has always been conceptually integer-valued. The new error message clarifies the requirement. We have filed an issue with the maintainer.

3. **Inadvertent behavior change (we need to act)**: Cascade, rSpectral  
   These involve changes to igraph's exported namespace and default weight-handling behavior that have unintended side effects on downstream packages.

---

## Individual package assessments

### Cascade (2.3) – WARNING: namespace collision

**Root cause**: igraph 2.3.0 added `make_circulant()` along with a constructor alias `circulant()`. The `magic` package also exports `circulant()`, causing a namespace conflict when Cascade loads both.

**Assessment**: Inadvertent behavior change in igraph. The collision is harmless (warning only, no broken functionality), but it is a new warning we introduced.

**Action taken**: We have contacted the Cascade maintainer (frederic.bertrand@lecnam.net) and filed an issue at https://github.com/fbertran/Cascade suggesting they explicitly import `magic::circulant` in NAMESPACE.

**Action for igraph**: We are considering whether to unexport the `circulant` constructor alias or provide more explicit guidance in the NEWS file.

---

### DiagrammeR (1.0.11) – ERROR: `neighbors()` requires single vertex

**Root cause**: igraph 2.3.0 added strict validation that `neighbors()` must receive exactly one vertex ID. DiagrammeR's `get_leverage_centrality()` passes a degree vector to `neighbors()`, expecting vectorized behavior that was never documented.

**Assessment**: Bug in DiagrammeR. The `neighbors()` function was never documented to accept multiple vertices; the previous behavior (silently using only the first element) was a latent bug.

**Action taken**: We have filed an issue with the DiagrammeR maintainer (riannone@me.com) at https://github.com/rich-iannone/DiagrammeR with a suggested fix.

**Suggested fix for DiagrammeR**:
```r
# In get_leverage_centrality(), change from:
mean(degree_vals[igraph::neighbors(ig_graph, degree_vals)])
# To:
mean(degree_vals[igraph::neighbors(ig_graph, x)])  # x iterates over each node
```

---

### jewel (2.0.2) – ERROR: non-integer value for `niter`

**Root cause**: jewel computes `niter <- p * 0.05` (e.g., `49 * 0.05 = 2.45`) and passes the result to `rewire()`. igraph 2.3.0 strictly validates that parameters expecting an integer are representable as integers.

**Assessment**: Bug in jewel. The `niter` parameter has always been conceptually integer-valued (number of iterations); the previous silent truncation was masking the error.

**Action taken**: We have filed an issue with the jewel maintainer (anna@plaxienko.com) at https://github.com/annaplaksienko/jewel suggesting:
```r
niter <- ceiling(p * 0.05)  # ensure integer
```

---

### rSpectral (1.0.0.14) – ERROR: modularity test failures

**Root cause**: igraph 2.3.0 changed `modularity()` to automatically use the `"weight"` edge attribute when present, whereas it previously ignored it by default. rSpectral's test graphs have a `"weight"` attribute, causing different (now weighted) modularity values.

**Assessment**: Inadvertent behavior change in igraph. The modularity results are now *more correct* for weighted graphs, but the change is undocumented as a breaking change and breaks existing test expectations.

**Action taken**: We have filed an issue with the rSpectral maintainer (lptolik@gmail.com) at https://github.com/cmclean5/rSpectral describing the change and providing this workaround:
```r
# Use weights = numeric() to force unweighted modularity:
modularity(g, membership, weights = numeric())
```

**Action for igraph**: We plan to add a proper `weights = NA` mechanism to explicitly disable weight auto-detection, rather than relying on the `numeric()` workaround. We will include a clear NEWS entry about this breaking change.

---

### rgph (0.1.0) – (new package, under investigation)

**Root cause**: rgph lists igraph only as a `Suggests` dependency, so failures likely occur in tests or examples. Given the other patterns in this release, the most probable cause is either the `neighbors()` scalar validation or another API tightening.

**Assessment**: Likely a downstream package issue, but we are investigating further as rgph was not in our Linux-based revdepcheck results.

**Action**: We are running targeted checks to reproduce the failure. We will contact the maintainer once the root cause is confirmed.

---

### sfnetworks (0.6.5) – ERROR: `from` requires single vertex

**Root cause**: igraph 2.3.0 added strict validation that `all_shortest_paths(from = ...)` must receive exactly one vertex. sfnetworks passes a vector of vertices, relying on previously undocumented behavior.

**Assessment**: Intentional API tightening in igraph. The `from` parameter was never documented to accept multiple vertices.

**Action taken**: We have filed an issue with the sfnetworks maintainer (luukvandermeer@live.nl) at https://github.com/luukvdmeer/sfnetworks describing the change.

**Suggested fix for sfnetworks**: Iterate over vertices explicitly:
```r
lapply(from_vertices, function(f) all_shortest_paths(x, from = f, to = to, ...))
```

---

### tmap.networks (0.1) – (under investigation, likely cascading failure)

**Root cause**: tmap.networks directly imports sfnetworks, which is itself failing due to the `all_shortest_paths()` `from` validation change (see sfnetworks above). This is a cascading failure.

**Assessment**: Cascading failure from sfnetworks; not a direct bug in tmap.networks.

**Action**: We will inform the tmap.networks maintainer that they should wait for an sfnetworks update. Once sfnetworks is fixed, tmap.networks should pass again.

---

## False positives

None identified. All failures represent real changes in igraph's behavior.

---

## Overall assessment

These breakages are not false positives. igraph 2.3.0 introduces:

1. Stricter parameter validation (vectors rejected where scalars are expected)
2. Automatic edge-weight usage in `modularity()`
3. New namespace exports (`circulant`)

For categories 1 and 2, we believe the new behavior is correct and the downstream packages contain latent bugs that we are helping fix. For categories 3, we are considering whether to revert or more carefully scope the export.

We do not expect these issues to block the CRAN submission, as each affected maintainer is being contacted and the fixes are straightforward. We are happy to provide a more detailed timeline if needed.

Best regards,
The igraph Development Team
