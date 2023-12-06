igraph 1.6.0

## R CMD check results

- [x] Checked locally, R 4.3.2
- [x] Checked on CI system, R 4.3.2
- [x] Checked on win-builder, R devel

## Current CRAN check results

- [x] Checked on 2023-12-06, problems found: https://cran.r-project.org/web/checks/check_results_igraph.html
- [ ] other_issue: NA
See: <https://www.stats.ox.ac.uk/pub/bdr/LTO/igraph.out>
- [ ] other_issue: NA
See: <https://www.stats.ox.ac.uk/pub/bdr/LTO/igraph.out>
- [ ] WARN: r-devel-linux-x86_64-debian-clang
     Found the following significant warnings:
     rinterface_extra.c:255:16: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
     See ‘/home/hornik/tmp/R.check/r-devel-clang/Work/PKGS/igraph.Rcheck/00install.out’ for details.
     * used C compiler: ‘Debian clang version 17.0.5 (1)’
     * used C++ compiler: ‘Debian clang version 17.0.5 (1)’
- [ ] NOTE: r-devel-linux-x86_64-debian-clang, r-devel-linux-x86_64-debian-gcc
     checkRd: (-1) print.igraph.es.Rd:24: Lost braces
     24 | screen. Use \code{\link[=print]{print()}} explicitly and the code{full} argument to
     |                                                                  ^
     checkRd: (-1) radius.Rd:46: Lost braces
     46 | calculations, code{\link{distances}} for general shortest path
     |                   ^
- [ ] WARN: r-devel-linux-x86_64-fedora-clang
     Found the following significant warnings:
     rinterface_extra.c:255:16: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
     See ‘/data/gannet/ripley/R/packages/tests-clang/igraph.Rcheck/00install.out’ for details.
     * used C compiler: ‘clang version 17.0.5’
     * used C++ compiler: ‘clang version 17.0.5’

Check results at: https://cran.r-project.org/web/checks/check_results_igraph.html
