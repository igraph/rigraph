igraph 2.1.1

## R CMD check results

- [x] Checked locally, R 4.3.3
- [x] Checked on CI system, R 4.4.1
- [x] Checked on win-builder, R devel

## Current CRAN check results

- [x] Checked on 2024-10-18, problems found: https://cran.r-project.org/web/checks/check_results_igraph.html
- [ ] NOTE: r-devel-linux-x86_64-debian-clang, r-devel-linux-x86_64-debian-gcc, r-devel-linux-x86_64-fedora-clang, r-devel-linux-x86_64-fedora-gcc
     File ‘igraph/libs/igraph.so’:
     Found non-API calls to R: ‘PRENV’, ‘R_PromiseExpr’
     
     Compiled code should not call non-API entry points in R.
     
     See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual,
     and section ‘Moving into C API compliance’ for issues with the use of
     non-API entry points.
- [ ] WARN: r-devel-linux-x86_64-debian-gcc
     Found the following significant warnings:
     Warning: Obsolescent feature: Old-style character length at (1)
     See ‘/home/hornik/tmp/R.check/r-devel-gcc/Work/PKGS/igraph.Rcheck/00install.out’ for details.
     * used C compiler: ‘gcc-14 (Debian 14.2.0-6) 14.2.0’
     * used C++ compiler: ‘g++-14 (Debian 14.2.0-6) 14.2.0’
- [ ] WARN: r-devel-linux-x86_64-fedora-gcc
     Found the following significant warnings:
     Warning: Obsolescent feature: Old-style character length at (1)
     See ‘/data/gannet/ripley/R/packages/tests-devel/igraph.Rcheck/00install.out’ for details.
     * used C compiler: ‘gcc-14 (GCC) 14.2.0’
     * used C++ compiler: ‘g++-14 (GCC) 14.2.0’
- [ ] WARN: r-devel-windows-x86_64
     Found the following significant warnings:
     Warning: Obsolescent feature: Old-style character length at (1)
     See 'd:/Rcompile/CRANpkg/local/4.5/igraph.Rcheck/00install.out' for details.
     * used C compiler: 'gcc.exe (GCC) 13.2.0'
     * used C++ compiler: 'g++.exe (GCC) 13.2.0'
- [ ] NOTE: r-devel-windows-x86_64
     File 'igraph/libs/x64/igraph.dll':
     Found non-API calls to R: 'PRENV', 'R_PromiseExpr'
     
     Compiled code should not call non-API entry points in R.
     
     See 'Writing portable packages' in the 'Writing R Extensions' manual,
     and section 'Moving into C API compliance' for issues with the use of
     non-API entry points.
- [ ] other_issue: NA
See: <https://www.stats.ox.ac.uk/pub/bdr/gcc/igraph.out>
- [ ] other_issue: NA
See: <https://www.stats.ox.ac.uk/pub/bdr/noSuggests/igraph.out>
- [ ] other_issue: NA
See: <https://raw.githubusercontent.com/kalibera/cran-checks/master/rchk/results/igraph.out>

Check results at: https://cran.r-project.org/web/checks/check_results_igraph.html
