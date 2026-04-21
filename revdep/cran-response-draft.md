# Draft response to CRAN teams' auto-check for igraph 2.3.0

**Subject**: Re: CRAN pre-release check results for igraph 2.3.0 – reverse dependency issues

---

Dear CRAN team,

Thank you for running the pre-release checks. We have reviewed all 7 flagged packages.

We have proactively reached out to the maintainers of all affected packages. Here is a brief
summary and the status of each:

| Package | Root cause | Action taken |
|---------|-----------|--------------|
| **Cascade** | Namespace collision (`circulant` export added in 2.3.0 conflicts with `magic::circulant`) | Issue filed with maintainer on 2026-04-19: https://github.com/fbertran/Cascade/issues |
| **DiagrammeR** | Bug in DiagrammeR: `get_leverage_centrality()` passes a vector to `neighbors()`, which now requires a single vertex | Issue filed with maintainer on 2026-04-19: https://github.com/rich-iannone/DiagrammeR/issues |
| **jewel** | Bug in jewel: non-integer `niter` value (`p * 0.05`) passed to `rewire()`, which now validates integer arguments | Issue filed with maintainer on 2026-04-19: https://github.com/annaplaksienko/jewel/issues |
| **rSpectral** | Behavior change in igraph: `modularity()` now auto-uses the `"weight"` edge attribute, changing test results | Issue filed with maintainer on 2026-04-19: https://github.com/cmclean5/rSpectral/issues |
| **rgph** | **False positive / unrelated**: the failure is caused by a Java configuration problem on the check machine, not by igraph. igraph is only in `Suggests` for this package and no igraph-related errors appear in the log. | No action needed from igraph's side. |
| **sfnetworks** | Bug in sfnetworks: `all_shortest_paths(from = ...)` now requires a single vertex; sfnetworks passes a vector | Issue filed with maintainer on 2026-04-19: https://github.com/luukvdmeer/sfnetworks/issues |
| **tmap.networks** | Cascading failure: imports sfnetworks directly; will be resolved once sfnetworks is updated | Maintainer informed on 2026-04-19. |

We believe none of the failures represent false positives in our changes (with the exception of
rgph, which is a pre-existing Java infrastructure issue). The fixes required in downstream packages
are straightforward and the maintainers have been notified.

We are happy to provide further details on any individual case.

Best regards,
The igraph Development Team
