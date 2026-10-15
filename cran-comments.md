igraph 2.3.4

## Cran Repository Policy

- [x] Reviewed CRP last edited 2026-04-21.

## Current CRAN check results

- [x] Checked on 2026-09-27, problems found: https://cran.r-project.org/web/checks/check_results_igraph.html
- [x] NOTE on all r-devel flavors: calls to `structure()` with deprecated special names, and `pipe.Rd` without `\usage`.
  Both fixed.
- [x] BLIS: the `layout_with_mds()` stress test fails because LAPACK's DSYEVR does not converge for some random graphs.
  The test is now skipped with BLIS, until this is fixed in the igraph C core.
