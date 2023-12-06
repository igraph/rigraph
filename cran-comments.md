igraph 1.6.0

## R CMD check results

- [x] Checked locally, R 4.3.2
- [x] Checked on CI system, R 4.3.2
- [x] Checked on win-builder, R devel

## Current CRAN check results

- [x] Checked on 2023-12-06, problems found: https://cran.r-project.org/web/checks/check_results_igraph.html
- [x] LTO issues to be fixed in igraph 2.0.0.
- [x] WARN: r-devel-linux-x86_64-debian-clang, r-devel-linux-x86_64-fedora-clang
     Found the following significant warnings:
     rinterface_extra.c:255:16: warning: format string is not a string literal (potentially insecure) [-Wformat-security]: Fixed
- [x] NOTE: r-devel-linux-x86_64-debian-clang, r-devel-linux-x86_64-debian-gcc
     checkRd: Lost braces: Fixed
