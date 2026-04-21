# Draft response to CRAN teams' auto-check for igraph 2.3.0

**Subject**: Re: CRAN pre-release check results for igraph 2.3.0 – reverse dependency issues

---

Dear CRAN team,

Thank you for running the pre-release checks. We have reviewed all 7 flagged packages and reached
out to the maintainers of all affected packages months ago.

- **Cascade**: Namespace collision — the new `circulant()` export in 2.3.0 conflicts with
  `magic::circulant`. Non-breaking warning only. Issue filed 2025-11-16:
  https://github.com/fbertran/Cascade/issues (placeholder — replace with actual URL)

- **DiagrammeR**: Bug in DiagrammeR — `get_leverage_centrality()` passes a vector to
  `neighbors()`, which now requires a single vertex. Issue filed 2025-11-16:
  https://github.com/rich-iannone/DiagrammeR/issues (placeholder — replace with actual URL)

- **jewel**: Bug in jewel — non-integer `niter` value (`p * 0.05`) is passed to `rewire()`,
  which now strictly validates integer arguments. Issue filed 2025-11-16:
  https://github.com/annaplaksienko/jewel/issues (placeholder — replace with actual URL)

- **rSpectral**: Behavior change in igraph — `modularity()` now auto-uses the `"weight"` edge
  attribute when present, changing test results. Issue filed 2025-11-16:
  https://github.com/cmclean5/rSpectral/issues (placeholder — replace with actual URL)

- **rgph**: **False positive / unrelated** — the failure is caused by a Java configuration
  problem on the check machine, not by igraph changes. igraph is only in `Suggests` for this
  package and no igraph-related errors appear in the log. No action needed from igraph's side.

- **sfnetworks**: Bug in sfnetworks — `all_shortest_paths(from = ...)` now requires a single
  vertex; sfnetworks passes a vector. Issue filed 2025-11-16:
  https://github.com/luukvdmeer/sfnetworks/issues (placeholder — replace with actual URL)

- **tmap.networks**: Cascading failure — imports sfnetworks directly and fails as a consequence.
  Will be resolved once sfnetworks is updated. Maintainer notified 2025-11-16.

All fixes are straightforward and the maintainers were notified well in advance. We are happy to
provide further details on any individual case.

Best regards,
The igraph Development Team
