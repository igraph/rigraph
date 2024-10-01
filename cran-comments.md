igraph 2.1.0

## R CMD check results

- [x] Checked locally, R 4.3.3
- [x] Checked on CI system, R 4.4.1
- [x] Checked on win-builder, R devel

## Current CRAN check results

- [x] Checked on 2024-09-26, problems found: https://cran.r-project.org/web/checks/check_results_igraph.html
- [x] NOTE: r-devel-linux-x86_64-debian-clang, r-devel-linux-x86_64-debian-gcc, r-devel-linux-x86_64-fedora-clang, r-devel-linux-x86_64-fedora-gcc
     File ‘igraph/libs/igraph.so’:
     Found non-API calls to R: ‘PRENV’, ‘R_PromiseExpr’
     
     Fixed.
- [x] WARN: r-devel-linux-x86_64-fedora-gcc
     Found the following significant warnings:
     Warning: Obsolescent feature: Old-style character length at (1)
     See ‘/data/gannet/ripley/R/packages/tests-devel/igraph.Rcheck/00install.out’ for details.
     
     Need fix upstream.

Check results at: https://cran.r-project.org/web/checks/check_results_igraph.html
