# admtools

<details>

* Version: 0.6.0
* GitHub: https://github.com/MindTheGap-ERC/admtools
* Source code: https://github.com/cran/admtools
* Date/Publication: 2025-05-20 13:20:02 UTC
* Number of recursive dependencies: 82

Run `revdepcheck::cloud_details(, "admtools")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/admtools/new/admtools.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘admtools/DESCRIPTION’ ... OK
* this is package ‘admtools’ version ‘0.6.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘FossilSim’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘admtools’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... ERROR
  Running ‘spelling.R’
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Complete output:
  > # This file is part of the standard setup for testthat.
  > # It is recommended that you do not modify it.
  > #
  > # Where should you do additional test configuration?
  > # Learn more about the roles of various files in:
  > # * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
  > # * https://testthat.r-lib.org/articles/special-files.html
  > 
  > library(testthat)
  > library(admtools)
  > 
  > test_check("admtools")
  [ FAIL 5 | WARN 0 | SKIP 0 | PASS 214 ]
  
  ══ Failed tests ════════════════════════════════════════════════════════════════
  ── Error ('test_rev_dir.R:4:3'): double transformation returns original object ──
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'FossilSim'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test_rev_dir.R:4:3
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  ── Error ('test_strat_to_time.R:28:3'): transformation for fossils objects works ──
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'FossilSim'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test_strat_to_time.R:28:3
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  ── Error ('test_strat_to_time.R:37:3'): transformation for taxonomy objects works ──
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'FossilSim'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test_strat_to_time.R:37:3
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  ── Error ('test_time_to_strat.R:29:3'): transformation for fossils objects works ──
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'FossilSim'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test_time_to_strat.R:29:3
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  ── Error ('test_time_to_strat.R:38:3'): transformation for taxonomy objects works ──
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'FossilSim'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test_time_to_strat.R:38:3
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  
  [ FAIL 5 | WARN 0 | SKIP 0 | PASS 214 ]
  Error: Test failures
  Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... ERROR
Error(s) in re-building vignettes:
--- re-building ‘FossilSim_integration.Rmd’ using rmarkdown

Quitting from FossilSim_integration.Rmd:31-59 [unnamed-chunk-2]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<error/rlang_error>
Error in `loadNamespace()`:
! there is no package called 'FossilSim'
---
Backtrace:
    ▆
 1. └─base::loadNamespace(x)
 2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
 3.     └─base (local) withOneRestart(expr, restarts[[1L]])
 4.       └─base (local) doWithOneRestart(return(expr), restart)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Error: processing vignette 'FossilSim_integration.Rmd' failed with diagnostics:
there is no package called 'FossilSim'
--- failed re-building ‘FossilSim_integration.Rmd’

--- re-building ‘adm_from_sedrate.Rmd’ using rmarkdown
** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_sedrate_files/figure-html/unnamed-chunk-10-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 15424 bytes
Input file size = 15514 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 12921
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 12921

Output IDAT size = 12921 bytes (2503 bytes decrease)
Output file size = 12999 bytes (2515 bytes = 16.21% decrease)

** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_sedrate_files/figure-html/unnamed-chunk-12-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 8451 bytes
Input file size = 8541 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 6856
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 6856

Output IDAT size = 6856 bytes (1595 bytes decrease)
Output file size = 6934 bytes (1607 bytes = 18.82% decrease)

** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_sedrate_files/figure-html/unnamed-chunk-13-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 7558 bytes
Input file size = 7636 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 6178
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 6178

Output IDAT size = 6178 bytes (1380 bytes decrease)
Output file size = 6256 bytes (1380 bytes = 18.07% decrease)

** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_sedrate_files/figure-html/unnamed-chunk-17-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 12241 bytes
Input file size = 12331 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 10001
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 10001

Output IDAT size = 10001 bytes (2240 bytes decrease)
Output file size = 10079 bytes (2252 bytes = 18.26% decrease)

** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_sedrate_files/figure-html/unnamed-chunk-17-2.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 11584 bytes
Input file size = 11674 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 9625
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 9625

Output IDAT size = 9625 bytes (1959 bytes decrease)
Output file size = 9703 bytes (1971 bytes = 16.88% decrease)

** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_sedrate_files/figure-html/unnamed-chunk-20-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 11249 bytes
Input file size = 11339 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 9629
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 9629

Output IDAT size = 9629 bytes (1620 bytes decrease)
Output file size = 9707 bytes (1632 bytes = 14.39% decrease)

--- finished re-building ‘adm_from_sedrate.Rmd’

--- re-building ‘adm_from_trace_cont.Rmd’ using rmarkdown
** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_trace_cont_files/figure-html/unnamed-chunk-8-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 14964 bytes
Input file size = 15054 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 12817
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 12817

Output IDAT size = 12817 bytes (2147 bytes decrease)
Output file size = 12895 bytes (2159 bytes = 14.34% decrease)

** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_trace_cont_files/figure-html/unnamed-chunk-10-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 13076 bytes
Input file size = 13166 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 10807
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 10807

Output IDAT size = 10807 bytes (2269 bytes decrease)
Output file size = 10885 bytes (2281 bytes = 17.32% decrease)

** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_trace_cont_files/figure-html/unnamed-chunk-11-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 6268 bytes
Input file size = 6346 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 5170
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 5170

Output IDAT size = 5170 bytes (1098 bytes decrease)
Output file size = 5248 bytes (1098 bytes = 17.30% decrease)

** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_trace_cont_files/figure-html/unnamed-chunk-15-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 11796 bytes
Input file size = 11886 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 9726
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 9726

Output IDAT size = 9726 bytes (2070 bytes decrease)
Output file size = 9804 bytes (2082 bytes = 17.52% decrease)

** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_trace_cont_files/figure-html/unnamed-chunk-15-2.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 11366 bytes
Input file size = 11456 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 9393
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 9393

Output IDAT size = 9393 bytes (1973 bytes decrease)
Output file size = 9471 bytes (1985 bytes = 17.33% decrease)

** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_trace_cont_files/figure-html/unnamed-chunk-17-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 11532 bytes
Input file size = 11622 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 9372
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 9372

Output IDAT size = 9372 bytes (2160 bytes decrease)
Output file size = 9450 bytes (2172 bytes = 18.69% decrease)

** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_trace_cont_files/figure-html/unnamed-chunk-21-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 15694 bytes
Input file size = 15784 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 12939
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 12939

Output IDAT size = 12939 bytes (2755 bytes decrease)
Output file size = 13017 bytes (2767 bytes = 17.53% decrease)

--- finished re-building ‘adm_from_trace_cont.Rmd’

--- re-building ‘adm_plotting.Rmd’ using rmarkdown
** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/adm_plotting_files/figure-html/unnamed-chunk-3-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 6844 bytes
Input file size = 6922 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 5709
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 5709

Output IDAT size = 5709 bytes (1135 bytes decrease)
Output file size = 5787 bytes (1135 bytes = 16.40% decrease)

** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/adm_plotting_files/figure-html/unnamed-chunk-4-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 13447 bytes
Input file size = 13537 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 10888
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 10888

Output IDAT size = 10888 bytes (2559 bytes decrease)
Output file size = 10966 bytes (2571 bytes = 18.99% decrease)

--- finished re-building ‘adm_plotting.Rmd’

--- re-building ‘admtools.Rmd’ using rmarkdown
** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/admtools_files/figure-html/unnamed-chunk-14-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 9930 bytes
Input file size = 10020 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 8150
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 8150

Output IDAT size = 8150 bytes (1780 bytes decrease)
Output file size = 8228 bytes (1792 bytes = 17.88% decrease)

** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/admtools_files/figure-html/unnamed-chunk-15-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 12556 bytes
Input file size = 12646 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 11717
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5		IDAT size = 11616
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 5		IDAT size = 11616

Output IDAT size = 11616 bytes (940 bytes decrease)
Output file size = 11694 bytes (952 bytes = 7.53% decrease)

** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/admtools_files/figure-html/unnamed-chunk-17-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 12463 bytes
Input file size = 12553 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 10542
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 10542

Output IDAT size = 10542 bytes (1921 bytes decrease)
Output file size = 10620 bytes (1933 bytes = 15.40% decrease)

** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/admtools_files/figure-html/unnamed-chunk-22-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 17251 bytes
Input file size = 17353 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 14018
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 14018

Output IDAT size = 14018 bytes (3233 bytes decrease)
Output file size = 14096 bytes (3257 bytes = 18.77% decrease)

** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/admtools_files/figure-html/unnamed-chunk-24-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 19119 bytes
Input file size = 19221 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 16360
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 16360

Output IDAT size = 16360 bytes (2759 bytes decrease)
Output file size = 16438 bytes (2783 bytes = 14.48% decrease)

** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/admtools_files/figure-html/unnamed-chunk-25-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 14761 bytes
Input file size = 14851 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 12762
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 12762

Output IDAT size = 12762 bytes (1999 bytes decrease)
Output file size = 12840 bytes (2011 bytes = 13.54% decrease)

** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/admtools_files/figure-html/unnamed-chunk-26-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 17182 bytes
Input file size = 17284 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 14330
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 14330

Output IDAT size = 14330 bytes (2852 bytes decrease)
Output file size = 14408 bytes (2876 bytes = 16.64% decrease)

--- finished re-building ‘admtools.Rmd’

--- re-building ‘admtools_doc.Rmd’ using rmarkdown
--- finished re-building ‘admtools_doc.Rmd’

--- re-building ‘correlation.Rmd’ using rmarkdown
** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/correlation_files/figure-html/unnamed-chunk-3-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 9593 bytes
Input file size = 9683 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 7948
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 7948

Output IDAT size = 7948 bytes (1645 bytes decrease)
Output file size = 8026 bytes (1657 bytes = 17.11% decrease)

** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/correlation_files/figure-html/unnamed-chunk-5-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 9593 bytes
Input file size = 9683 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 7948
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 7948

Output IDAT size = 7948 bytes (1645 bytes decrease)
Output file size = 8026 bytes (1657 bytes = 17.11% decrease)

** Processing: /tmp/workdir/admtools/new/admtools.Rcheck/vign_test/admtools/vignettes/correlation_files/figure-html/unnamed-chunk-5-2.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 9670 bytes
Input file size = 9760 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 7959
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 7959

Output IDAT size = 7959 bytes (1711 bytes decrease)
Output file size = 8037 bytes (1723 bytes = 17.65% decrease)

--- finished re-building ‘correlation.Rmd’

SUMMARY: processing the following file failed:
  ‘FossilSim_integration.Rmd’

Error: Vignette re-building failed.
Execution halted

* DONE
Status: 2 ERRORs, 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/admtools/old/admtools.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘admtools/DESCRIPTION’ ... OK
* this is package ‘admtools’ version ‘0.6.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘FossilSim’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘admtools’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... ERROR
  Running ‘spelling.R’
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Complete output:
  > # This file is part of the standard setup for testthat.
  > # It is recommended that you do not modify it.
  > #
  > # Where should you do additional test configuration?
  > # Learn more about the roles of various files in:
  > # * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
  > # * https://testthat.r-lib.org/articles/special-files.html
  > 
  > library(testthat)
  > library(admtools)
  > 
  > test_check("admtools")
  [ FAIL 5 | WARN 0 | SKIP 0 | PASS 214 ]
  
  ══ Failed tests ════════════════════════════════════════════════════════════════
  ── Error ('test_rev_dir.R:4:3'): double transformation returns original object ──
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'FossilSim'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test_rev_dir.R:4:3
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  ── Error ('test_strat_to_time.R:28:3'): transformation for fossils objects works ──
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'FossilSim'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test_strat_to_time.R:28:3
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  ── Error ('test_strat_to_time.R:37:3'): transformation for taxonomy objects works ──
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'FossilSim'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test_strat_to_time.R:37:3
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  ── Error ('test_time_to_strat.R:29:3'): transformation for fossils objects works ──
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'FossilSim'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test_time_to_strat.R:29:3
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  ── Error ('test_time_to_strat.R:38:3'): transformation for taxonomy objects works ──
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'FossilSim'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test_time_to_strat.R:38:3
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  
  [ FAIL 5 | WARN 0 | SKIP 0 | PASS 214 ]
  Error: Test failures
  Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... ERROR
Error(s) in re-building vignettes:
--- re-building ‘FossilSim_integration.Rmd’ using rmarkdown

Quitting from FossilSim_integration.Rmd:31-59 [unnamed-chunk-2]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<error/rlang_error>
Error in `loadNamespace()`:
! there is no package called 'FossilSim'
---
Backtrace:
    ▆
 1. └─base::loadNamespace(x)
 2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
 3.     └─base (local) withOneRestart(expr, restarts[[1L]])
 4.       └─base (local) doWithOneRestart(return(expr), restart)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Error: processing vignette 'FossilSim_integration.Rmd' failed with diagnostics:
there is no package called 'FossilSim'
--- failed re-building ‘FossilSim_integration.Rmd’

--- re-building ‘adm_from_sedrate.Rmd’ using rmarkdown
** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_sedrate_files/figure-html/unnamed-chunk-10-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 15488 bytes
Input file size = 15578 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 13079
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 13079

Output IDAT size = 13079 bytes (2409 bytes decrease)
Output file size = 13157 bytes (2421 bytes = 15.54% decrease)

** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_sedrate_files/figure-html/unnamed-chunk-12-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 7827 bytes
Input file size = 7905 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 6289
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 6289

Output IDAT size = 6289 bytes (1538 bytes decrease)
Output file size = 6367 bytes (1538 bytes = 19.46% decrease)

** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_sedrate_files/figure-html/unnamed-chunk-13-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 7547 bytes
Input file size = 7625 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 6197
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 6197

Output IDAT size = 6197 bytes (1350 bytes decrease)
Output file size = 6275 bytes (1350 bytes = 17.70% decrease)

** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_sedrate_files/figure-html/unnamed-chunk-17-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 9934 bytes
Input file size = 10024 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 8184
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 8184

Output IDAT size = 8184 bytes (1750 bytes decrease)
Output file size = 8262 bytes (1762 bytes = 17.58% decrease)

** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_sedrate_files/figure-html/unnamed-chunk-17-2.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 11096 bytes
Input file size = 11186 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 9157
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 9157

Output IDAT size = 9157 bytes (1939 bytes decrease)
Output file size = 9235 bytes (1951 bytes = 17.44% decrease)

** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_sedrate_files/figure-html/unnamed-chunk-20-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 11270 bytes
Input file size = 11360 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 9610
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 9610

Output IDAT size = 9610 bytes (1660 bytes decrease)
Output file size = 9688 bytes (1672 bytes = 14.72% decrease)

--- finished re-building ‘adm_from_sedrate.Rmd’

--- re-building ‘adm_from_trace_cont.Rmd’ using rmarkdown
** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_trace_cont_files/figure-html/unnamed-chunk-8-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 14145 bytes
Input file size = 14235 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 12135
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 12135

Output IDAT size = 12135 bytes (2010 bytes decrease)
Output file size = 12213 bytes (2022 bytes = 14.20% decrease)

** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_trace_cont_files/figure-html/unnamed-chunk-10-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 13121 bytes
Input file size = 13211 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 10845
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 10845

Output IDAT size = 10845 bytes (2276 bytes decrease)
Output file size = 10923 bytes (2288 bytes = 17.32% decrease)

** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_trace_cont_files/figure-html/unnamed-chunk-11-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 6274 bytes
Input file size = 6352 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 5177
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 5177

Output IDAT size = 5177 bytes (1097 bytes decrease)
Output file size = 5255 bytes (1097 bytes = 17.27% decrease)

** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_trace_cont_files/figure-html/unnamed-chunk-15-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 10757 bytes
Input file size = 10847 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 8937
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 8937

Output IDAT size = 8937 bytes (1820 bytes decrease)
Output file size = 9015 bytes (1832 bytes = 16.89% decrease)

** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_trace_cont_files/figure-html/unnamed-chunk-15-2.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 11308 bytes
Input file size = 11398 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 9362
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 9362

Output IDAT size = 9362 bytes (1946 bytes decrease)
Output file size = 9440 bytes (1958 bytes = 17.18% decrease)

** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_trace_cont_files/figure-html/unnamed-chunk-17-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 11532 bytes
Input file size = 11622 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 9372
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 9372

Output IDAT size = 9372 bytes (2160 bytes decrease)
Output file size = 9450 bytes (2172 bytes = 18.69% decrease)

** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/adm_from_trace_cont_files/figure-html/unnamed-chunk-21-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 14909 bytes
Input file size = 14999 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 12468
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 12468

Output IDAT size = 12468 bytes (2441 bytes decrease)
Output file size = 12546 bytes (2453 bytes = 16.35% decrease)

--- finished re-building ‘adm_from_trace_cont.Rmd’

--- re-building ‘adm_plotting.Rmd’ using rmarkdown
** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/adm_plotting_files/figure-html/unnamed-chunk-3-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 6844 bytes
Input file size = 6922 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 5709
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 5709

Output IDAT size = 5709 bytes (1135 bytes decrease)
Output file size = 5787 bytes (1135 bytes = 16.40% decrease)

** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/adm_plotting_files/figure-html/unnamed-chunk-4-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 13447 bytes
Input file size = 13537 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 10888
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 10888

Output IDAT size = 10888 bytes (2559 bytes decrease)
Output file size = 10966 bytes (2571 bytes = 18.99% decrease)

--- finished re-building ‘adm_plotting.Rmd’

--- re-building ‘admtools.Rmd’ using rmarkdown
** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/admtools_files/figure-html/unnamed-chunk-14-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 9930 bytes
Input file size = 10020 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 8150
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 8150

Output IDAT size = 8150 bytes (1780 bytes decrease)
Output file size = 8228 bytes (1792 bytes = 17.88% decrease)

** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/admtools_files/figure-html/unnamed-chunk-15-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 12556 bytes
Input file size = 12646 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 11717
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5		IDAT size = 11616
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 5		IDAT size = 11616

Output IDAT size = 11616 bytes (940 bytes decrease)
Output file size = 11694 bytes (952 bytes = 7.53% decrease)

** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/admtools_files/figure-html/unnamed-chunk-17-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 12463 bytes
Input file size = 12553 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 10542
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 10542

Output IDAT size = 10542 bytes (1921 bytes decrease)
Output file size = 10620 bytes (1933 bytes = 15.40% decrease)

** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/admtools_files/figure-html/unnamed-chunk-22-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 17251 bytes
Input file size = 17353 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 14018
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 14018

Output IDAT size = 14018 bytes (3233 bytes decrease)
Output file size = 14096 bytes (3257 bytes = 18.77% decrease)

** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/admtools_files/figure-html/unnamed-chunk-24-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 19119 bytes
Input file size = 19221 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 16360
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 16360

Output IDAT size = 16360 bytes (2759 bytes decrease)
Output file size = 16438 bytes (2783 bytes = 14.48% decrease)

** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/admtools_files/figure-html/unnamed-chunk-25-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 13936 bytes
Input file size = 14026 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 11586
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 11586

Output IDAT size = 11586 bytes (2350 bytes decrease)
Output file size = 11664 bytes (2362 bytes = 16.84% decrease)

** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/admtools_files/figure-html/unnamed-chunk-26-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 16601 bytes
Input file size = 16703 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 13754
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 13754

Output IDAT size = 13754 bytes (2847 bytes decrease)
Output file size = 13832 bytes (2871 bytes = 17.19% decrease)

--- finished re-building ‘admtools.Rmd’

--- re-building ‘admtools_doc.Rmd’ using rmarkdown
--- finished re-building ‘admtools_doc.Rmd’

--- re-building ‘correlation.Rmd’ using rmarkdown
** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/correlation_files/figure-html/unnamed-chunk-3-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 9593 bytes
Input file size = 9683 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 7948
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 7948

Output IDAT size = 7948 bytes (1645 bytes decrease)
Output file size = 8026 bytes (1657 bytes = 17.11% decrease)

** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/correlation_files/figure-html/unnamed-chunk-5-1.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 9593 bytes
Input file size = 9683 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 7948
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 7948

Output IDAT size = 7948 bytes (1645 bytes decrease)
Output file size = 8026 bytes (1657 bytes = 17.11% decrease)

** Processing: /tmp/workdir/admtools/old/admtools.Rcheck/vign_test/admtools/vignettes/correlation_files/figure-html/unnamed-chunk-5-2.png
288x288 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 9670 bytes
Input file size = 9760 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 7959
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 7959

Output IDAT size = 7959 bytes (1711 bytes decrease)
Output file size = 8037 bytes (1723 bytes = 17.65% decrease)

--- finished re-building ‘correlation.Rmd’

SUMMARY: processing the following file failed:
  ‘FossilSim_integration.Rmd’

Error: Vignette re-building failed.
Execution halted

* DONE
Status: 2 ERRORs, 1 NOTE





```
# amberr

<details>

* Version: 1.2.0
* GitHub: https://github.com/obiba/amberr
* Source code: https://github.com/cran/amberr
* Date/Publication: 2025-04-03 07:30:02 UTC
* Number of recursive dependencies: 29

Run `revdepcheck::cloud_details(, "amberr")` for more info

</details>

## In both

*   checking whether package ‘amberr’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/amberr/new/amberr.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘amberr’ ...
** package ‘amberr’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘at_depth’ is not exported by 'namespace:purrr'
Execution halted
ERROR: lazy loading failed for package ‘amberr’
* removing ‘/tmp/workdir/amberr/new/amberr.Rcheck/amberr’


```
### CRAN

```
* installing *source* package ‘amberr’ ...
** package ‘amberr’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘at_depth’ is not exported by 'namespace:purrr'
Execution halted
ERROR: lazy loading failed for package ‘amberr’
* removing ‘/tmp/workdir/amberr/old/amberr.Rcheck/amberr’


```
# BGGM

<details>

* Version: 2.1.5
* GitHub: https://github.com/donaldRwilliams/BGGM
* Source code: https://github.com/cran/BGGM
* Date/Publication: 2024-12-22 21:40:02 UTC
* Number of recursive dependencies: 210

Run `revdepcheck::cloud_details(, "BGGM")` for more info

</details>

## In both

*   checking whether package ‘BGGM’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/BGGM/new/BGGM.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘BGGM’ ...
** package ‘BGGM’ successfully unpacked and MD5 sums checked
** using staged installation
configure: creating ./config.status
config.status: creating src/Makevars
** libs
using C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
using C++17
g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG -DARMA_NO_DEBUG -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I'/usr/local/lib/R/site-library/RcppDist/include' -I'/usr/local/lib/R/site-library/RcppProgress/include' -I/usr/local/include   -I../inst/include -fpic  -g -O2   -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG -DARMA_NO_DEBUG -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I'/usr/local/lib/R/site-library/RcppDist/include' -I'/usr/local/lib/R/site-library/RcppProgress/include' -I/usr/local/include   -I../inst/include -fpic  -g -O2   -c bggm_fast.cpp -o bggm_fast.o
g++ -std=gnu++17 -shared -L/opt/R/4.4.0/lib/R/lib -L/usr/local/lib -o BGGM.so RcppExports.o bggm_fast.o -llapack -lblas -lgfortran -lm -lquadmath -L/opt/R/4.4.0/lib/R/lib -lR
installing to /tmp/workdir/BGGM/new/BGGM.Rcheck/00LOCK-BGGM/00new/BGGM/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘gsl’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘BGGM’
* removing ‘/tmp/workdir/BGGM/new/BGGM.Rcheck/BGGM’


```
### CRAN

```
* installing *source* package ‘BGGM’ ...
** package ‘BGGM’ successfully unpacked and MD5 sums checked
** using staged installation
configure: creating ./config.status
config.status: creating src/Makevars
** libs
using C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
using C++17
g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG -DARMA_NO_DEBUG -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I'/usr/local/lib/R/site-library/RcppDist/include' -I'/usr/local/lib/R/site-library/RcppProgress/include' -I/usr/local/include   -I../inst/include -fpic  -g -O2   -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG -DARMA_NO_DEBUG -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I'/usr/local/lib/R/site-library/RcppDist/include' -I'/usr/local/lib/R/site-library/RcppProgress/include' -I/usr/local/include   -I../inst/include -fpic  -g -O2   -c bggm_fast.cpp -o bggm_fast.o
g++ -std=gnu++17 -shared -L/opt/R/4.4.0/lib/R/lib -L/usr/local/lib -o BGGM.so RcppExports.o bggm_fast.o -llapack -lblas -lgfortran -lm -lquadmath -L/opt/R/4.4.0/lib/R/lib -lR
installing to /tmp/workdir/BGGM/old/BGGM.Rcheck/00LOCK-BGGM/00new/BGGM/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘gsl’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘BGGM’
* removing ‘/tmp/workdir/BGGM/old/BGGM.Rcheck/BGGM’


```
# bnlearn

<details>

* Version: 5.1
* GitHub: NA
* Source code: https://github.com/cran/bnlearn
* Date/Publication: 2025-08-20 12:50:13 UTC
* Number of recursive dependencies: 35

Run `revdepcheck::cloud_details(, "bnlearn")` for more info

</details>

## In both

*   checking whether package ‘bnlearn’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/bnlearn/new/bnlearn.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘bnlearn’ ...
** package ‘bnlearn’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C compiler: ‘gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/arcs2amat.c -o arcs/arcs2amat.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/arcs2elist.c -o arcs/arcs2elist.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/bind.c -o arcs/bind.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/filter.arcs.c -o arcs/filter.arcs.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/hash.c -o arcs/hash.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/is.row.equal.c -o arcs/is.row.equal.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/bayesian.network.c -o bnlearn/bayesian.network.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/bn.recovery.c -o bnlearn/bn.recovery.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/cache.structure.c -o bnlearn/cache.structure.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/cextend.c -o bnlearn/cextend.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/colliders.c -o bnlearn/colliders.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/cpdag.c -o bnlearn/cpdag.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/fitted.c -o bnlearn/fitted.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/nparams.c -o bnlearn/nparams.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/shd.c -o bnlearn/shd.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/allocations.c -o core/allocations.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/contingency.tables.c -o core/contingency.tables.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/correlation.c -o core/correlation.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/covariance.matrix.c -o core/covariance.matrix.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/data.table.c -o core/data.table.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/math.functions.c -o core/math.functions.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/moments.c -o core/moments.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/sampling.c -o core/sampling.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/sets.c -o core/sets.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/sort.c -o core/sort.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/uppertriangular.c -o core/uppertriangular.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c fitted/enums.c -o fitted/enums.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c fitted/fitted.c -o fitted/fitted.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c fitted/nparams.c -o fitted/nparams.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c fitted/rinterface/nparams.c -o fitted/rinterface/nparams.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c foreign/parse.c -o foreign/parse.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c globals.c -o globals.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/acyclic.c -o graphs/acyclic.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/completely.directed.c -o graphs/completely.directed.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/connected.components.c -o graphs/connected.components.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/path.c -o graphs/path.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/path.matrix.c -o graphs/path.matrix.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/pdag2dag.c -o graphs/pdag2dag.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/random/graph.generation.c -o graphs/random/graph.generation.o
In file included from graphs/random/../../include/rcore.h:3,
                 from graphs/random/graph.generation.c:1:
graphs/random/graph.generation.c: In function ‘print_modelstring’:
graphs/random/graph.generation.c:719:19: warning: implicit declaration of function ‘allocLang’; did you mean ‘alloca’? [-Wimplicit-function-declaration]
  719 |   PROTECT(t = s = allocLang(2));
      |                   ^~~~~~~~~
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
graphs/random/graph.generation.c:719:17: warning: assignment to ‘SEXP’ {aka ‘struct SEXPREC *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
  719 |   PROTECT(t = s = allocLang(2));
      |                 ^
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/topological.ordering.c -o graphs/topological.ordering.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/rinterface/connected.components.c -o graphs/rinterface/connected.components.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/rinterface/path.matrix.c -o graphs/rinterface/path.matrix.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/rinterface/sid.c -o graphs/rinterface/sid.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/sid.c -o graphs/sid.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/likelihood.weighting.c -o inference/likelihood.weighting.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/common.c -o inference/loglikelihood/common.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/discrete.c -o inference/loglikelihood/discrete.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/gaussian.c -o inference/loglikelihood/gaussian.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/conditional.gaussian.c -o inference/loglikelihood/conditional.gaussian.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/rbn.c -o inference/rbn.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/rinterface/loglikelihood.c -o inference/rinterface/loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/rinterface/cpdist.c -o inference/rinterface/cpdist.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/rinterface/rbn.c -o inference/rinterface/rbn.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/rinterface/likelihood.weighting.c -o inference/rinterface/likelihood.weighting.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/averaging/averaging.c -o learning/averaging/averaging.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/averaging/bootstrap.c -o learning/averaging/bootstrap.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/local/mi.matrix.c -o learning/local/mi.matrix.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/score/hc.cache.lookup.c -o learning/score/hc.cache.lookup.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/score/score.delta.c -o learning/score/score.delta.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/score/tabu.c -o learning/score/tabu.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c math/conditional.least.squares.c -o math/conditional.least.squares.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c math/least.squares.c -o math/least.squares.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c math/linear.algebra.c -o math/linear.algebra.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/common.c -o minimal/common.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/data.frame.c -o minimal/data.frame.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/strings.c -o minimal/strings.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/table.c -o minimal/table.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/tiers.c -o minimal/tiers.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/unique.c -o minimal/unique.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/discrete/classic.discrete.c -o parameters/discrete/classic.discrete.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/discrete/hierarchical.dirichlet.c -o parameters/discrete/hierarchical.dirichlet.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/classic.discrete.c -o parameters/rinterface/classic.discrete.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/hierarchical.dirichlet.c -o parameters/rinterface/hierarchical.dirichlet.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/mixture.ordinary.least.squares.c -o parameters/rinterface/mixture.ordinary.least.squares.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/ordinary.least.squares.c -o parameters/rinterface/ordinary.least.squares.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c predict/map.lw.c -o predict/map.lw.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c predict/predict.c -o predict/predict.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c preprocessing/dedup.c -o preprocessing/dedup.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c preprocessing/discretize.c -o preprocessing/discretize.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c preprocessing/enums.c -o preprocessing/enums.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c preprocessing/rinterface/discretize.c -o preprocessing/rinterface/discretize.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c sanitization/cg.assumptions.c -o sanitization/cg.assumptions.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c sanitization/covariance.c -o sanitization/covariance.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c sanitization/data.c -o sanitization/data.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/alpha.star.c -o scores/alpha.star.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/cg.loglikelihood.c -o scores/cg.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/cg.predictive.loglikelihood.c -o scores/cg.predictive.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/cg.nal.c -o scores/cg.nal.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/custom.score.c -o scores/custom.score.o
In file included from scores/../include/rcore.h:3,
                 from scores/custom.score.c:1:
scores/custom.score.c: In function ‘custom_score_function’:
scores/custom.score.c:12:34: warning: implicit declaration of function ‘allocLang’; did you mean ‘alloca’? [-Wimplicit-function-declaration]
   12 |   PROTECT(args_iterator = call = allocLang(5));
      |                                  ^~~~~~~~~
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
scores/custom.score.c:12:32: warning: assignment to ‘SEXP’ {aka ‘struct SEXPREC *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
   12 |   PROTECT(args_iterator = call = allocLang(5));
      |                                ^
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/dirichlet.averaged.posterior.c -o scores/dirichlet.averaged.posterior.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/dirichlet.posterior.c -o scores/dirichlet.posterior.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/discrete.loglikelihood.c -o scores/discrete.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/discrete.nal.c -o scores/discrete.nal.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/discrete.predictive.loglikelihood.c -o scores/discrete.predictive.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/enum.c -o scores/enum.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/gaussian.loglikelihood.c -o scores/gaussian.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/gaussian.nal.c -o scores/gaussian.nal.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/gaussian.predictive.loglikelihood.c -o scores/gaussian.predictive.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/graph.priors.c -o scores/graph.priors.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/nml.regret.c -o scores/nml.regret.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/nml.regret.table.c -o scores/nml.regret.table.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/normalized.maximum.likelihood.c -o scores/normalized.maximum.likelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/per.node.score.c -o scores/per.node.score.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/wishart.posterior.c -o scores/wishart.posterior.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c test.counter.c -o test.counter.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/conditional.gaussian/cg.mutual.information.c -o tests/conditional.gaussian/cg.mutual.information.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/discrete/df.adjust.c -o tests/discrete/df.adjust.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/discrete/discrete.tests.c -o tests/discrete/discrete.tests.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/discrete/jonckheere.c -o tests/discrete/jonckheere.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/discrete/shrinkage.c -o tests/discrete/shrinkage.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/enums.c -o tests/enums.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/gaussian/df.adjust.c -o tests/gaussian/df.adjust.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/gaussian/gaussian.tests.c -o tests/gaussian/gaussian.tests.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/gaussian/shrinkage.c -o tests/gaussian/shrinkage.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/omnibus/custom.test.c -o tests/omnibus/custom.test.o
In file included from tests/omnibus/../../include/rcore.h:3,
                 from tests/omnibus/custom.test.c:1:
tests/omnibus/custom.test.c: In function ‘custom_test_function’:
tests/omnibus/custom.test.c:11:34: warning: implicit declaration of function ‘allocLang’; did you mean ‘alloca’? [-Wimplicit-function-declaration]
   11 |   PROTECT(args_iterator = call = allocLang(6));
      |                                  ^~~~~~~~~
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
tests/omnibus/custom.test.c:11:32: warning: assignment to ‘SEXP’ {aka ‘struct SEXPREC *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
   11 |   PROTECT(args_iterator = call = allocLang(6));
      |                                ^
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/patterns/allsubs.test.c -o tests/patterns/allsubs.test.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/patterns/ctest.c -o tests/patterns/ctest.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/patterns/roundrobin.test.c -o tests/patterns/roundrobin.test.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/patterns/utest.c -o tests/patterns/utest.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/permutation/discrete.monte.carlo.c -o tests/permutation/discrete.monte.carlo.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/permutation/gaussian.monte.carlo.c -o tests/permutation/gaussian.monte.carlo.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/allsubs.test.c -o tests/rinterface/allsubs.test.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/ctest.c -o tests/rinterface/ctest.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/htest.c -o tests/rinterface/htest.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/indep.test.c -o tests/rinterface/indep.test.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/roundrobin.test.c -o tests/rinterface/roundrobin.test.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/utest.c -o tests/rinterface/utest.o
gcc -std=gnu17 -shared -L/opt/R/4.4.0/lib/R/lib -L/usr/local/lib -o bnlearn.so arcs/arcs2amat.o arcs/arcs2elist.o arcs/bind.o arcs/filter.arcs.o arcs/hash.o arcs/is.row.equal.o bnlearn/bayesian.network.o bnlearn/bn.recovery.o bnlearn/cache.structure.o bnlearn/cextend.o bnlearn/colliders.o bnlearn/cpdag.o bnlearn/fitted.o bnlearn/nparams.o bnlearn/shd.o core/allocations.o core/contingency.tables.o core/correlation.o core/covariance.matrix.o core/data.table.o core/math.functions.o core/moments.o core/sampling.o core/sets.o core/sort.o core/uppertriangular.o fitted/enums.o fitted/fitted.o fitted/nparams.o fitted/rinterface/nparams.o foreign/parse.o globals.o graphs/acyclic.o graphs/completely.directed.o graphs/connected.components.o graphs/path.o graphs/path.matrix.o graphs/pdag2dag.o graphs/random/graph.generation.o graphs/topological.ordering.o graphs/rinterface/connected.components.o graphs/rinterface/path.matrix.o graphs/rinterface/sid.o graphs/sid.o inference/likelihood.weighting.o inference/loglikelihood/common.o inference/loglikelihood/discrete.o inference/loglikelihood/gaussian.o inference/loglikelihood/conditional.gaussian.o inference/rbn.o inference/rinterface/loglikelihood.o inference/rinterface/cpdist.o inference/rinterface/rbn.o inference/rinterface/likelihood.weighting.o learning/averaging/averaging.o learning/averaging/bootstrap.o learning/local/mi.matrix.o learning/score/hc.cache.lookup.o learning/score/score.delta.o learning/score/tabu.o math/conditional.least.squares.o math/least.squares.o math/linear.algebra.o minimal/common.o minimal/data.frame.o minimal/strings.o minimal/table.o minimal/tiers.o minimal/unique.o parameters/discrete/classic.discrete.o parameters/discrete/hierarchical.dirichlet.o parameters/rinterface/classic.discrete.o parameters/rinterface/hierarchical.dirichlet.o parameters/rinterface/mixture.ordinary.least.squares.o parameters/rinterface/ordinary.least.squares.o predict/map.lw.o predict/predict.o preprocessing/dedup.o preprocessing/discretize.o preprocessing/enums.o preprocessing/rinterface/discretize.o sanitization/cg.assumptions.o sanitization/covariance.o sanitization/data.o scores/alpha.star.o scores/cg.loglikelihood.o scores/cg.predictive.loglikelihood.o scores/cg.nal.o scores/custom.score.o scores/dirichlet.averaged.posterior.o scores/dirichlet.posterior.o scores/discrete.loglikelihood.o scores/discrete.nal.o scores/discrete.predictive.loglikelihood.o scores/enum.o scores/gaussian.loglikelihood.o scores/gaussian.nal.o scores/gaussian.predictive.loglikelihood.o scores/graph.priors.o scores/nml.regret.o scores/nml.regret.table.o scores/normalized.maximum.likelihood.o scores/per.node.score.o scores/wishart.posterior.o test.counter.o tests/conditional.gaussian/cg.mutual.information.o tests/discrete/df.adjust.o tests/discrete/discrete.tests.o tests/discrete/jonckheere.o tests/discrete/shrinkage.o tests/enums.o tests/gaussian/df.adjust.o tests/gaussian/gaussian.tests.o tests/gaussian/shrinkage.o tests/omnibus/custom.test.o tests/patterns/allsubs.test.o tests/patterns/ctest.o tests/patterns/roundrobin.test.o tests/patterns/utest.o tests/permutation/discrete.monte.carlo.o tests/permutation/gaussian.monte.carlo.o tests/rinterface/allsubs.test.o tests/rinterface/ctest.o tests/rinterface/htest.o tests/rinterface/indep.test.o tests/rinterface/roundrobin.test.o tests/rinterface/utest.o -llapack -lblas -lgfortran -lm -lquadmath -L/opt/R/4.4.0/lib/R/lib -lR
installing to /tmp/workdir/bnlearn/new/bnlearn.Rcheck/00LOCK-bnlearn/00new/bnlearn/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded from temporary location
Error: package or namespace load failed for ‘bnlearn’ in dyn.load(file, DLLpath = DLLpath, ...):
 unable to load shared object '/tmp/workdir/bnlearn/new/bnlearn.Rcheck/00LOCK-bnlearn/00new/bnlearn/libs/bnlearn.so':
  /tmp/workdir/bnlearn/new/bnlearn.Rcheck/00LOCK-bnlearn/00new/bnlearn/libs/bnlearn.so: undefined symbol: allocLang
Error: loading failed
Execution halted
ERROR: loading failed
* removing ‘/tmp/workdir/bnlearn/new/bnlearn.Rcheck/bnlearn’


```
### CRAN

```
* installing *source* package ‘bnlearn’ ...
** package ‘bnlearn’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C compiler: ‘gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/arcs2amat.c -o arcs/arcs2amat.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/arcs2elist.c -o arcs/arcs2elist.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/bind.c -o arcs/bind.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/filter.arcs.c -o arcs/filter.arcs.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/hash.c -o arcs/hash.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/is.row.equal.c -o arcs/is.row.equal.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/bayesian.network.c -o bnlearn/bayesian.network.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/bn.recovery.c -o bnlearn/bn.recovery.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/cache.structure.c -o bnlearn/cache.structure.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/cextend.c -o bnlearn/cextend.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/colliders.c -o bnlearn/colliders.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/cpdag.c -o bnlearn/cpdag.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/fitted.c -o bnlearn/fitted.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/nparams.c -o bnlearn/nparams.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/shd.c -o bnlearn/shd.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/allocations.c -o core/allocations.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/contingency.tables.c -o core/contingency.tables.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/correlation.c -o core/correlation.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/covariance.matrix.c -o core/covariance.matrix.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/data.table.c -o core/data.table.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/math.functions.c -o core/math.functions.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/moments.c -o core/moments.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/sampling.c -o core/sampling.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/sets.c -o core/sets.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/sort.c -o core/sort.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/uppertriangular.c -o core/uppertriangular.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c fitted/enums.c -o fitted/enums.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c fitted/fitted.c -o fitted/fitted.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c fitted/nparams.c -o fitted/nparams.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c fitted/rinterface/nparams.c -o fitted/rinterface/nparams.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c foreign/parse.c -o foreign/parse.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c globals.c -o globals.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/acyclic.c -o graphs/acyclic.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/completely.directed.c -o graphs/completely.directed.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/connected.components.c -o graphs/connected.components.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/path.c -o graphs/path.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/path.matrix.c -o graphs/path.matrix.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/pdag2dag.c -o graphs/pdag2dag.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/random/graph.generation.c -o graphs/random/graph.generation.o
In file included from graphs/random/../../include/rcore.h:3,
                 from graphs/random/graph.generation.c:1:
graphs/random/graph.generation.c: In function ‘print_modelstring’:
graphs/random/graph.generation.c:719:19: warning: implicit declaration of function ‘allocLang’; did you mean ‘alloca’? [-Wimplicit-function-declaration]
  719 |   PROTECT(t = s = allocLang(2));
      |                   ^~~~~~~~~
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
graphs/random/graph.generation.c:719:17: warning: assignment to ‘SEXP’ {aka ‘struct SEXPREC *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
  719 |   PROTECT(t = s = allocLang(2));
      |                 ^
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/topological.ordering.c -o graphs/topological.ordering.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/rinterface/connected.components.c -o graphs/rinterface/connected.components.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/rinterface/path.matrix.c -o graphs/rinterface/path.matrix.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/rinterface/sid.c -o graphs/rinterface/sid.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/sid.c -o graphs/sid.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/likelihood.weighting.c -o inference/likelihood.weighting.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/common.c -o inference/loglikelihood/common.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/discrete.c -o inference/loglikelihood/discrete.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/gaussian.c -o inference/loglikelihood/gaussian.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/conditional.gaussian.c -o inference/loglikelihood/conditional.gaussian.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/rbn.c -o inference/rbn.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/rinterface/loglikelihood.c -o inference/rinterface/loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/rinterface/cpdist.c -o inference/rinterface/cpdist.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/rinterface/rbn.c -o inference/rinterface/rbn.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/rinterface/likelihood.weighting.c -o inference/rinterface/likelihood.weighting.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/averaging/averaging.c -o learning/averaging/averaging.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/averaging/bootstrap.c -o learning/averaging/bootstrap.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/local/mi.matrix.c -o learning/local/mi.matrix.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/score/hc.cache.lookup.c -o learning/score/hc.cache.lookup.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/score/score.delta.c -o learning/score/score.delta.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/score/tabu.c -o learning/score/tabu.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c math/conditional.least.squares.c -o math/conditional.least.squares.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c math/least.squares.c -o math/least.squares.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c math/linear.algebra.c -o math/linear.algebra.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/common.c -o minimal/common.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/data.frame.c -o minimal/data.frame.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/strings.c -o minimal/strings.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/table.c -o minimal/table.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/tiers.c -o minimal/tiers.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/unique.c -o minimal/unique.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/discrete/classic.discrete.c -o parameters/discrete/classic.discrete.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/discrete/hierarchical.dirichlet.c -o parameters/discrete/hierarchical.dirichlet.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/classic.discrete.c -o parameters/rinterface/classic.discrete.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/hierarchical.dirichlet.c -o parameters/rinterface/hierarchical.dirichlet.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/mixture.ordinary.least.squares.c -o parameters/rinterface/mixture.ordinary.least.squares.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/ordinary.least.squares.c -o parameters/rinterface/ordinary.least.squares.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c predict/map.lw.c -o predict/map.lw.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c predict/predict.c -o predict/predict.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c preprocessing/dedup.c -o preprocessing/dedup.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c preprocessing/discretize.c -o preprocessing/discretize.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c preprocessing/enums.c -o preprocessing/enums.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c preprocessing/rinterface/discretize.c -o preprocessing/rinterface/discretize.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c sanitization/cg.assumptions.c -o sanitization/cg.assumptions.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c sanitization/covariance.c -o sanitization/covariance.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c sanitization/data.c -o sanitization/data.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/alpha.star.c -o scores/alpha.star.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/cg.loglikelihood.c -o scores/cg.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/cg.predictive.loglikelihood.c -o scores/cg.predictive.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/cg.nal.c -o scores/cg.nal.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/custom.score.c -o scores/custom.score.o
In file included from scores/../include/rcore.h:3,
                 from scores/custom.score.c:1:
scores/custom.score.c: In function ‘custom_score_function’:
scores/custom.score.c:12:34: warning: implicit declaration of function ‘allocLang’; did you mean ‘alloca’? [-Wimplicit-function-declaration]
   12 |   PROTECT(args_iterator = call = allocLang(5));
      |                                  ^~~~~~~~~
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
scores/custom.score.c:12:32: warning: assignment to ‘SEXP’ {aka ‘struct SEXPREC *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
   12 |   PROTECT(args_iterator = call = allocLang(5));
      |                                ^
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/dirichlet.averaged.posterior.c -o scores/dirichlet.averaged.posterior.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/dirichlet.posterior.c -o scores/dirichlet.posterior.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/discrete.loglikelihood.c -o scores/discrete.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/discrete.nal.c -o scores/discrete.nal.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/discrete.predictive.loglikelihood.c -o scores/discrete.predictive.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/enum.c -o scores/enum.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/gaussian.loglikelihood.c -o scores/gaussian.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/gaussian.nal.c -o scores/gaussian.nal.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/gaussian.predictive.loglikelihood.c -o scores/gaussian.predictive.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/graph.priors.c -o scores/graph.priors.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/nml.regret.c -o scores/nml.regret.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/nml.regret.table.c -o scores/nml.regret.table.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/normalized.maximum.likelihood.c -o scores/normalized.maximum.likelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/per.node.score.c -o scores/per.node.score.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/wishart.posterior.c -o scores/wishart.posterior.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c test.counter.c -o test.counter.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/conditional.gaussian/cg.mutual.information.c -o tests/conditional.gaussian/cg.mutual.information.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/discrete/df.adjust.c -o tests/discrete/df.adjust.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/discrete/discrete.tests.c -o tests/discrete/discrete.tests.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/discrete/jonckheere.c -o tests/discrete/jonckheere.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/discrete/shrinkage.c -o tests/discrete/shrinkage.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/enums.c -o tests/enums.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/gaussian/df.adjust.c -o tests/gaussian/df.adjust.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/gaussian/gaussian.tests.c -o tests/gaussian/gaussian.tests.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/gaussian/shrinkage.c -o tests/gaussian/shrinkage.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/omnibus/custom.test.c -o tests/omnibus/custom.test.o
In file included from tests/omnibus/../../include/rcore.h:3,
                 from tests/omnibus/custom.test.c:1:
tests/omnibus/custom.test.c: In function ‘custom_test_function’:
tests/omnibus/custom.test.c:11:34: warning: implicit declaration of function ‘allocLang’; did you mean ‘alloca’? [-Wimplicit-function-declaration]
   11 |   PROTECT(args_iterator = call = allocLang(6));
      |                                  ^~~~~~~~~
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
tests/omnibus/custom.test.c:11:32: warning: assignment to ‘SEXP’ {aka ‘struct SEXPREC *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
   11 |   PROTECT(args_iterator = call = allocLang(6));
      |                                ^
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/patterns/allsubs.test.c -o tests/patterns/allsubs.test.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/patterns/ctest.c -o tests/patterns/ctest.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/patterns/roundrobin.test.c -o tests/patterns/roundrobin.test.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/patterns/utest.c -o tests/patterns/utest.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/permutation/discrete.monte.carlo.c -o tests/permutation/discrete.monte.carlo.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/permutation/gaussian.monte.carlo.c -o tests/permutation/gaussian.monte.carlo.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/allsubs.test.c -o tests/rinterface/allsubs.test.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/ctest.c -o tests/rinterface/ctest.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/htest.c -o tests/rinterface/htest.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/indep.test.c -o tests/rinterface/indep.test.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/roundrobin.test.c -o tests/rinterface/roundrobin.test.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/utest.c -o tests/rinterface/utest.o
gcc -std=gnu17 -shared -L/opt/R/4.4.0/lib/R/lib -L/usr/local/lib -o bnlearn.so arcs/arcs2amat.o arcs/arcs2elist.o arcs/bind.o arcs/filter.arcs.o arcs/hash.o arcs/is.row.equal.o bnlearn/bayesian.network.o bnlearn/bn.recovery.o bnlearn/cache.structure.o bnlearn/cextend.o bnlearn/colliders.o bnlearn/cpdag.o bnlearn/fitted.o bnlearn/nparams.o bnlearn/shd.o core/allocations.o core/contingency.tables.o core/correlation.o core/covariance.matrix.o core/data.table.o core/math.functions.o core/moments.o core/sampling.o core/sets.o core/sort.o core/uppertriangular.o fitted/enums.o fitted/fitted.o fitted/nparams.o fitted/rinterface/nparams.o foreign/parse.o globals.o graphs/acyclic.o graphs/completely.directed.o graphs/connected.components.o graphs/path.o graphs/path.matrix.o graphs/pdag2dag.o graphs/random/graph.generation.o graphs/topological.ordering.o graphs/rinterface/connected.components.o graphs/rinterface/path.matrix.o graphs/rinterface/sid.o graphs/sid.o inference/likelihood.weighting.o inference/loglikelihood/common.o inference/loglikelihood/discrete.o inference/loglikelihood/gaussian.o inference/loglikelihood/conditional.gaussian.o inference/rbn.o inference/rinterface/loglikelihood.o inference/rinterface/cpdist.o inference/rinterface/rbn.o inference/rinterface/likelihood.weighting.o learning/averaging/averaging.o learning/averaging/bootstrap.o learning/local/mi.matrix.o learning/score/hc.cache.lookup.o learning/score/score.delta.o learning/score/tabu.o math/conditional.least.squares.o math/least.squares.o math/linear.algebra.o minimal/common.o minimal/data.frame.o minimal/strings.o minimal/table.o minimal/tiers.o minimal/unique.o parameters/discrete/classic.discrete.o parameters/discrete/hierarchical.dirichlet.o parameters/rinterface/classic.discrete.o parameters/rinterface/hierarchical.dirichlet.o parameters/rinterface/mixture.ordinary.least.squares.o parameters/rinterface/ordinary.least.squares.o predict/map.lw.o predict/predict.o preprocessing/dedup.o preprocessing/discretize.o preprocessing/enums.o preprocessing/rinterface/discretize.o sanitization/cg.assumptions.o sanitization/covariance.o sanitization/data.o scores/alpha.star.o scores/cg.loglikelihood.o scores/cg.predictive.loglikelihood.o scores/cg.nal.o scores/custom.score.o scores/dirichlet.averaged.posterior.o scores/dirichlet.posterior.o scores/discrete.loglikelihood.o scores/discrete.nal.o scores/discrete.predictive.loglikelihood.o scores/enum.o scores/gaussian.loglikelihood.o scores/gaussian.nal.o scores/gaussian.predictive.loglikelihood.o scores/graph.priors.o scores/nml.regret.o scores/nml.regret.table.o scores/normalized.maximum.likelihood.o scores/per.node.score.o scores/wishart.posterior.o test.counter.o tests/conditional.gaussian/cg.mutual.information.o tests/discrete/df.adjust.o tests/discrete/discrete.tests.o tests/discrete/jonckheere.o tests/discrete/shrinkage.o tests/enums.o tests/gaussian/df.adjust.o tests/gaussian/gaussian.tests.o tests/gaussian/shrinkage.o tests/omnibus/custom.test.o tests/patterns/allsubs.test.o tests/patterns/ctest.o tests/patterns/roundrobin.test.o tests/patterns/utest.o tests/permutation/discrete.monte.carlo.o tests/permutation/gaussian.monte.carlo.o tests/rinterface/allsubs.test.o tests/rinterface/ctest.o tests/rinterface/htest.o tests/rinterface/indep.test.o tests/rinterface/roundrobin.test.o tests/rinterface/utest.o -llapack -lblas -lgfortran -lm -lquadmath -L/opt/R/4.4.0/lib/R/lib -lR
installing to /tmp/workdir/bnlearn/old/bnlearn.Rcheck/00LOCK-bnlearn/00new/bnlearn/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded from temporary location
Error: package or namespace load failed for ‘bnlearn’ in dyn.load(file, DLLpath = DLLpath, ...):
 unable to load shared object '/tmp/workdir/bnlearn/old/bnlearn.Rcheck/00LOCK-bnlearn/00new/bnlearn/libs/bnlearn.so':
  /tmp/workdir/bnlearn/old/bnlearn.Rcheck/00LOCK-bnlearn/00new/bnlearn/libs/bnlearn.so: undefined symbol: allocLang
Error: loading failed
Execution halted
ERROR: loading failed
* removing ‘/tmp/workdir/bnlearn/old/bnlearn.Rcheck/bnlearn’


```
# bnpa

<details>

* Version: 0.3.0
* GitHub: NA
* Source code: https://github.com/cran/bnpa
* Date/Publication: 2019-08-01 23:20:02 UTC
* Number of recursive dependencies: 119

Run `revdepcheck::cloud_details(, "bnpa")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/bnpa/new/bnpa.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘bnpa/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘bnpa’ version ‘0.3.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'bnlearn', 'semPlot'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/bnpa/old/bnpa.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘bnpa/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘bnpa’ version ‘0.3.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'bnlearn', 'semPlot'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# cdmTools

<details>

* Version: 1.0.6
* GitHub: https://github.com/pablo-najera/cdmTools
* Source code: https://github.com/cran/cdmTools
* Date/Publication: 2025-05-19 08:10:02 UTC
* Number of recursive dependencies: 121

Run `revdepcheck::cloud_details(, "cdmTools")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/cdmTools/new/cdmTools.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘cdmTools/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘cdmTools’ version ‘1.0.6’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘cdmTools’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking whether startup messages can be suppressed ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking examples ... OK
* DONE
Status: OK





```
### CRAN

```
* using log directory ‘/tmp/workdir/cdmTools/old/cdmTools.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘cdmTools/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘cdmTools’ version ‘1.0.6’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘cdmTools’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking whether startup messages can be suppressed ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking examples ... OK
* DONE
Status: OK





```
# ClusterGVis

<details>

* Version: 0.1.4
* GitHub: https://github.com/junjunlab/ClusterGVis
* Source code: https://github.com/cran/ClusterGVis
* Date/Publication: 2025-07-19 06:10:02 UTC
* Number of recursive dependencies: 299

Run `revdepcheck::cloud_details(, "ClusterGVis")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/ClusterGVis/new/ClusterGVis.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ClusterGVis/DESCRIPTION’ ... OK
* this is package ‘ClusterGVis’ version ‘0.1.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘clusterProfiler’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘ClusterGVis’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/ClusterGVis/old/ClusterGVis.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ClusterGVis/DESCRIPTION’ ... OK
* this is package ‘ClusterGVis’ version ‘0.1.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘clusterProfiler’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘ClusterGVis’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# CompositionalClust

<details>

* Version: 1.2
* GitHub: NA
* Source code: https://github.com/cran/CompositionalClust
* Date/Publication: 2025-11-03 09:30:09 UTC
* Number of recursive dependencies: 149

Run `revdepcheck::cloud_details(, "CompositionalClust")` for more info

</details>

## In both

*   checking whether package ‘CompositionalClust’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/CompositionalClust/new/CompositionalClust.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘CompositionalClust’ ...
** package ‘CompositionalClust’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘gsl’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘CompositionalClust’
* removing ‘/tmp/workdir/CompositionalClust/new/CompositionalClust.Rcheck/CompositionalClust’


```
### CRAN

```
* installing *source* package ‘CompositionalClust’ ...
** package ‘CompositionalClust’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘gsl’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘CompositionalClust’
* removing ‘/tmp/workdir/CompositionalClust/old/CompositionalClust.Rcheck/CompositionalClust’


```
# depCensoring

<details>

* Version: 0.1.8
* GitHub: NA
* Source code: https://github.com/cran/depCensoring
* Date/Publication: 2025-11-06 17:20:08 UTC
* Number of recursive dependencies: 84

Run `revdepcheck::cloud_details(, "depCensoring")` for more info

</details>

## In both

*   checking whether package ‘depCensoring’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/depCensoring/new/depCensoring.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘OpenMx’
    ```

## Installation

### Devel

```
* installing *source* package ‘depCensoring’ ...
** package ‘depCensoring’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘gsl’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘depCensoring’
* removing ‘/tmp/workdir/depCensoring/new/depCensoring.Rcheck/depCensoring’


```
### CRAN

```
* installing *source* package ‘depCensoring’ ...
** package ‘depCensoring’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘gsl’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘depCensoring’
* removing ‘/tmp/workdir/depCensoring/old/depCensoring.Rcheck/depCensoring’


```
# DRviaSPCN

<details>

* Version: 0.1.5
* GitHub: NA
* Source code: https://github.com/cran/DRviaSPCN
* Date/Publication: 2025-01-09 11:20:06 UTC
* Number of recursive dependencies: 168

Run `revdepcheck::cloud_details(, "DRviaSPCN")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/DRviaSPCN/new/DRviaSPCN.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘DRviaSPCN/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘DRviaSPCN’ version ‘0.1.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/DRviaSPCN/old/DRviaSPCN.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘DRviaSPCN/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘DRviaSPCN’ version ‘0.1.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# dySEM

<details>

* Version: 1.1.1
* GitHub: https://github.com/jsakaluk/dySEM
* Source code: https://github.com/cran/dySEM
* Date/Publication: 2025-01-07 22:20:02 UTC
* Number of recursive dependencies: 139

Run `revdepcheck::cloud_details(, "dySEM")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/dySEM/new/dySEM.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘dySEM/DESCRIPTION’ ... OK
* this is package ‘dySEM’ version ‘1.1.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/dySEM/old/dySEM.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘dySEM/DESCRIPTION’ ... OK
* this is package ‘dySEM’ version ‘1.1.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# easybgm

<details>

* Version: 0.2.1
* GitHub: https://github.com/KarolineHuth/easybgm
* Source code: https://github.com/cran/easybgm
* Date/Publication: 2024-10-17 08:30:02 UTC
* Number of recursive dependencies: 181

Run `revdepcheck::cloud_details(, "easybgm")` for more info

</details>

## In both

*   checking whether package ‘easybgm’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/easybgm/new/easybgm.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘easybgm’ ...
** package ‘easybgm’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘gsl’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘easybgm’
* removing ‘/tmp/workdir/easybgm/new/easybgm.Rcheck/easybgm’


```
### CRAN

```
* installing *source* package ‘easybgm’ ...
** package ‘easybgm’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘gsl’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘easybgm’
* removing ‘/tmp/workdir/easybgm/old/easybgm.Rcheck/easybgm’


```
# EGAnet

<details>

* Version: 2.3.0
* GitHub: https://github.com/hfgolino/EGAnet
* Source code: https://github.com/cran/EGAnet
* Date/Publication: 2025-04-09 23:10:15 UTC
* Number of recursive dependencies: 185

Run `revdepcheck::cloud_details(, "EGAnet")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/EGAnet/new/EGAnet.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘EGAnet/DESCRIPTION’ ... OK
* this is package ‘EGAnet’ version ‘2.3.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/EGAnet/old/EGAnet.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘EGAnet/DESCRIPTION’ ... OK
* this is package ‘EGAnet’ version ‘2.3.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# FAfA

<details>

* Version: 0.3
* GitHub: NA
* Source code: https://github.com/cran/FAfA
* Date/Publication: 2025-05-23 19:42:09 UTC
* Number of recursive dependencies: 254

Run `revdepcheck::cloud_details(, "FAfA")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/FAfA/new/FAfA.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘FAfA/DESCRIPTION’ ... OK
* this is package ‘FAfA’ version ‘0.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'MBESS', 'semPlot'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/FAfA/old/FAfA.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘FAfA/DESCRIPTION’ ... OK
* this is package ‘FAfA’ version ‘0.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'MBESS', 'semPlot'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# fAssets

<details>

* Version: 4023.85
* GitHub: NA
* Source code: https://github.com/cran/fAssets
* Date/Publication: 2023-04-24 14:00:02 UTC
* Number of recursive dependencies: 37

Run `revdepcheck::cloud_details(, "fAssets")` for more info

</details>

## In both

*   checking whether package ‘fAssets’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/fAssets/new/fAssets.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘fAssets’ ...
** package ‘fAssets’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘gsl’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘fAssets’
* removing ‘/tmp/workdir/fAssets/new/fAssets.Rcheck/fAssets’


```
### CRAN

```
* installing *source* package ‘fAssets’ ...
** package ‘fAssets’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘gsl’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘fAssets’
* removing ‘/tmp/workdir/fAssets/old/fAssets.Rcheck/fAssets’


```
# fdm2id

<details>

* Version: 0.9.9
* GitHub: NA
* Source code: https://github.com/cran/fdm2id
* Date/Publication: 2023-06-12 13:10:02 UTC
* Number of recursive dependencies: 243

Run `revdepcheck::cloud_details(, "fdm2id")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/fdm2id/new/fdm2id.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘fdm2id/DESCRIPTION’ ... OK
* this is package ‘fdm2id’ version ‘0.9.9’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'arules', 'arulesViz'

Package which this enhances but not available for checking: ‘NMF’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/fdm2id/old/fdm2id.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘fdm2id/DESCRIPTION’ ... OK
* this is package ‘fdm2id’ version ‘0.9.9’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'arules', 'arulesViz'

Package which this enhances but not available for checking: ‘NMF’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# galvanizer

<details>

* Version: 0.5.3
* GitHub: https://github.com/jonlinca/galvanizer
* Source code: https://github.com/cran/galvanizer
* Date/Publication: 2021-05-28 15:10:07 UTC
* Number of recursive dependencies: 47

Run `revdepcheck::cloud_details(, "galvanizer")` for more info

</details>

## In both

*   checking whether package ‘galvanizer’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/galvanizer/new/galvanizer.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘galvanizer’ ...
** package ‘galvanizer’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** byte-compile and prepare package for lazy loading
Error: object ‘at_depth’ is not exported by 'namespace:purrr'
Execution halted
ERROR: lazy loading failed for package ‘galvanizer’
* removing ‘/tmp/workdir/galvanizer/new/galvanizer.Rcheck/galvanizer’


```
### CRAN

```
* installing *source* package ‘galvanizer’ ...
** package ‘galvanizer’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** byte-compile and prepare package for lazy loading
Error: object ‘at_depth’ is not exported by 'namespace:purrr'
Execution halted
ERROR: lazy loading failed for package ‘galvanizer’
* removing ‘/tmp/workdir/galvanizer/old/galvanizer.Rcheck/galvanizer’


```
# genekitr

<details>

* Version: 1.2.8
* GitHub: https://github.com/GangLiLab/genekitr
* Source code: https://github.com/cran/genekitr
* Date/Publication: 2024-09-06 13:00:06 UTC
* Number of recursive dependencies: 205

Run `revdepcheck::cloud_details(, "genekitr")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/genekitr/new/genekitr.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘genekitr/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘genekitr’ version ‘1.2.8’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/genekitr/old/genekitr.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘genekitr/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘genekitr’ version ‘1.2.8’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# ggpicrust2

<details>

* Version: 2.5.2
* GitHub: https://github.com/cafferychen777/ggpicrust2
* Source code: https://github.com/cran/ggpicrust2
* Date/Publication: 2025-08-25 23:00:02 UTC
* Number of recursive dependencies: 284

Run `revdepcheck::cloud_details(, "ggpicrust2")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/ggpicrust2/new/ggpicrust2.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ggpicrust2/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘ggpicrust2’ version ‘2.5.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Packages suggested but not available for checking:
  'lefser', 'clusterProfiler', 'enrichplot'
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘ggpicrust2’ can be installed ... OK
* checking installed package size ... NOTE
  installed size is  5.7Mb
  sub-directories of 1Mb or more:
    R         2.3Mb
    data      2.0Mb
    extdata   1.1Mb
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking whether startup messages can be suppressed ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking R/sysdata.rda ... OK
* checking examples ... OK
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/ggpicrust2/old/ggpicrust2.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ggpicrust2/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘ggpicrust2’ version ‘2.5.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Packages suggested but not available for checking:
  'lefser', 'clusterProfiler', 'enrichplot'
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘ggpicrust2’ can be installed ... OK
* checking installed package size ... NOTE
  installed size is  5.7Mb
  sub-directories of 1Mb or more:
    R         2.3Mb
    data      2.0Mb
    extdata   1.1Mb
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking whether startup messages can be suppressed ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking R/sysdata.rda ... OK
* checking examples ... OK
* DONE
Status: 2 NOTEs





```
# ggsem

<details>

* Version: 0.2.4
* GitHub: https://github.com/smin95/ggsem
* Source code: https://github.com/cran/ggsem
* Date/Publication: 2025-02-02 22:50:02 UTC
* Number of recursive dependencies: 166

Run `revdepcheck::cloud_details(, "ggsem")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/ggsem/new/ggsem.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ggsem/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘ggsem’ version ‘0.2.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘semPlot’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘ggsem’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking whether startup messages can be suppressed ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking examples ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/ggsem/old/ggsem.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ggsem/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘ggsem’ version ‘0.2.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘semPlot’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘ggsem’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking whether startup messages can be suppressed ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking examples ... OK
* DONE
Status: 1 NOTE





```
# immcp

<details>

* Version: 1.0.3
* GitHub: https://github.com/YuanlongHu/immcp
* Source code: https://github.com/cran/immcp
* Date/Publication: 2022-05-12 05:50:02 UTC
* Number of recursive dependencies: 193

Run `revdepcheck::cloud_details(, "immcp")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/immcp/new/immcp.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘immcp/DESCRIPTION’ ... OK
* this is package ‘immcp’ version ‘1.0.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'clusterProfiler', 'arules'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/immcp/old/immcp.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘immcp/DESCRIPTION’ ... OK
* this is package ‘immcp’ version ‘1.0.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'clusterProfiler', 'arules'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# jmv

<details>

* Version: 2.7.7
* GitHub: https://github.com/jamovi/jmv
* Source code: https://github.com/cran/jmv
* Date/Publication: 2025-09-18 00:40:02 UTC
* Number of recursive dependencies: 188

Run `revdepcheck::cloud_details(, "jmv")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/jmv/new/jmv.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘jmv/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘jmv’ version ‘2.7.7’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘semPlot’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘jmv’ can be installed ... OK
* checking installed package size ... NOTE
  installed size is 11.9Mb
  sub-directories of 1Mb or more:
    R      7.5Mb
    i18n   4.1Mb
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking dependencies in R code ... NOTE
Namespaces in Imports field not imported from:
  ‘BayesFactor’ ‘GGally’ ‘GPArotation’ ‘MASS’ ‘PMCMR’ ‘R6’ ‘ROCR’
  ‘afex’ ‘car’ ‘dplyr’ ‘emmeans’ ‘ggrepel’ ‘ggridges’ ‘lavaan’
  ‘matrixStats’ ‘multcomp’ ‘mvnormtest’ ‘nnet’ ‘psych’ ‘vcd’ ‘vcdExtra’
  All declared Imports should be used.
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 3 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/jmv/old/jmv.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘jmv/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘jmv’ version ‘2.7.7’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘semPlot’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘jmv’ can be installed ... OK
* checking installed package size ... NOTE
  installed size is 11.9Mb
  sub-directories of 1Mb or more:
    R      7.5Mb
    i18n   4.1Mb
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking dependencies in R code ... NOTE
Namespaces in Imports field not imported from:
  ‘BayesFactor’ ‘GGally’ ‘GPArotation’ ‘MASS’ ‘PMCMR’ ‘R6’ ‘ROCR’
  ‘afex’ ‘car’ ‘dplyr’ ‘emmeans’ ‘ggrepel’ ‘ggridges’ ‘lavaan’
  ‘matrixStats’ ‘multcomp’ ‘mvnormtest’ ‘nnet’ ‘psych’ ‘vcd’ ‘vcdExtra’
  All declared Imports should be used.
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 3 NOTEs





```
# kerastuneR

<details>

* Version: 0.1.0.7
* GitHub: https://github.com/EagerAI/kerastuneR
* Source code: https://github.com/cran/kerastuneR
* Date/Publication: 2024-04-13 13:20:02 UTC
* Number of recursive dependencies: 108

Run `revdepcheck::cloud_details(, "kerastuneR")` for more info

</details>

## In both

*   checking whether package ‘kerastuneR’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/kerastuneR/new/kerastuneR.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘kerastuneR’ ...
** package ‘kerastuneR’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘at_depth’ is not exported by 'namespace:purrr'
Execution halted
ERROR: lazy loading failed for package ‘kerastuneR’
* removing ‘/tmp/workdir/kerastuneR/new/kerastuneR.Rcheck/kerastuneR’


```
### CRAN

```
* installing *source* package ‘kerastuneR’ ...
** package ‘kerastuneR’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘at_depth’ is not exported by 'namespace:purrr'
Execution halted
ERROR: lazy loading failed for package ‘kerastuneR’
* removing ‘/tmp/workdir/kerastuneR/old/kerastuneR.Rcheck/kerastuneR’


```
# latentFactoR

<details>

* Version: 0.0.7
* GitHub: NA
* Source code: https://github.com/cran/latentFactoR
* Date/Publication: 2025-11-03 11:20:02 UTC
* Number of recursive dependencies: 197

Run `revdepcheck::cloud_details(, "latentFactoR")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/latentFactoR/new/latentFactoR.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘latentFactoR/DESCRIPTION’ ... OK
* this is package ‘latentFactoR’ version ‘0.0.7’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘latentFactoR’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking whether startup messages can be suppressed ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking examples ... OK
* DONE
Status: OK





```
### CRAN

```
* using log directory ‘/tmp/workdir/latentFactoR/old/latentFactoR.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘latentFactoR/DESCRIPTION’ ... OK
* this is package ‘latentFactoR’ version ‘0.0.7’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘latentFactoR’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking whether startup messages can be suppressed ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking examples ... OK
* DONE
Status: OK





```
# lavaan.shiny

<details>

* Version: 1.2
* GitHub: https://github.com/kylehamilton/lavaan.shiny
* Source code: https://github.com/cran/lavaan.shiny
* Date/Publication: 2017-04-07 06:05:09 UTC
* Number of recursive dependencies: 116

Run `revdepcheck::cloud_details(, "lavaan.shiny")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/lavaan.shiny/new/lavaan.shiny.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘lavaan.shiny/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘lavaan.shiny’ version ‘1.2’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/lavaan.shiny/old/lavaan.shiny.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘lavaan.shiny/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘lavaan.shiny’ version ‘1.2’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# lcsm

<details>

* Version: 0.3.2
* GitHub: https://github.com/milanwiedemann/lcsm
* Source code: https://github.com/cran/lcsm
* Date/Publication: 2023-02-25 23:40:02 UTC
* Number of recursive dependencies: 137

Run `revdepcheck::cloud_details(, "lcsm")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/lcsm/new/lcsm.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘lcsm/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘lcsm’ version ‘0.3.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/lcsm/old/lcsm.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘lcsm/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘lcsm’ version ‘0.3.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# linkspotter

<details>

* Version: 1.3.0
* GitHub: https://github.com/sambaala/linkspotter
* Source code: https://github.com/cran/linkspotter
* Date/Publication: 2020-07-23 10:40:02 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::cloud_details(, "linkspotter")` for more info

</details>

## In both

*   checking whether package ‘linkspotter’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/linkspotter/new/linkspotter.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘linkspotter’ ...
** package ‘linkspotter’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘gsl’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘linkspotter’
* removing ‘/tmp/workdir/linkspotter/new/linkspotter.Rcheck/linkspotter’


```
### CRAN

```
* installing *source* package ‘linkspotter’ ...
** package ‘linkspotter’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘gsl’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘linkspotter’
* removing ‘/tmp/workdir/linkspotter/old/linkspotter.Rcheck/linkspotter’


```
# lvnet

<details>

* Version: 0.3.5
* GitHub: NA
* Source code: https://github.com/cran/lvnet
* Date/Publication: 2019-06-21 07:50:03 UTC
* Number of recursive dependencies: 114

Run `revdepcheck::cloud_details(, "lvnet")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/lvnet/new/lvnet.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘lvnet/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘lvnet’ version ‘0.3.5’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'OpenMx', 'semPlot'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/lvnet/old/lvnet.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘lvnet/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘lvnet’ version ‘0.3.5’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'OpenMx', 'semPlot'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# manymome

<details>

* Version: 0.3.1
* GitHub: https://github.com/sfcheung/manymome
* Source code: https://github.com/cran/manymome
* Date/Publication: 2025-08-22 05:40:02 UTC
* Number of recursive dependencies: 158

Run `revdepcheck::cloud_details(, "manymome")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/manymome/new/manymome.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘manymome/DESCRIPTION’ ... OK
* this is package ‘manymome’ version ‘0.3.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘semPlot’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘manymome’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘semPlot’
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/manymome/old/manymome.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘manymome/DESCRIPTION’ ... OK
* this is package ‘manymome’ version ‘0.3.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘semPlot’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘manymome’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘semPlot’
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
# MLCOPULA

<details>

* Version: 1.1.0
* GitHub: NA
* Source code: https://github.com/cran/MLCOPULA
* Date/Publication: 2025-09-19 23:40:21 UTC
* Number of recursive dependencies: 64

Run `revdepcheck::cloud_details(, "MLCOPULA")` for more info

</details>

## In both

*   checking whether package ‘MLCOPULA’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/MLCOPULA/new/MLCOPULA.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘MLCOPULA’ ...
** package ‘MLCOPULA’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘gsl’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘MLCOPULA’
* removing ‘/tmp/workdir/MLCOPULA/new/MLCOPULA.Rcheck/MLCOPULA’


```
### CRAN

```
* installing *source* package ‘MLCOPULA’ ...
** package ‘MLCOPULA’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘gsl’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘MLCOPULA’
* removing ‘/tmp/workdir/MLCOPULA/old/MLCOPULA.Rcheck/MLCOPULA’


```
# numbat

<details>

* Version: 1.5.1
* GitHub: https://github.com/kharchenkolab/numbat
* Source code: https://github.com/cran/numbat
* Date/Publication: 2025-10-21 17:00:02 UTC
* Number of recursive dependencies: 134

Run `revdepcheck::cloud_details(, "numbat")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/numbat/new/numbat.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘numbat/DESCRIPTION’ ... OK
* this is package ‘numbat’ version ‘1.5.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'ggtree', 'scistreer'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/numbat/old/numbat.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘numbat/DESCRIPTION’ ... OK
* this is package ‘numbat’ version ‘1.5.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'ggtree', 'scistreer'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# pctax

<details>

* Version: 0.1.3
* GitHub: https://github.com/Asa12138/pctax
* Source code: https://github.com/cran/pctax
* Date/Publication: 2024-12-02 10:00:02 UTC
* Number of recursive dependencies: 247

Run `revdepcheck::cloud_details(, "pctax")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/pctax/new/pctax.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘pctax/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘pctax’ version ‘0.1.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Packages suggested but not available for checking:
  'ggtree', 'ggtreeExtra', 'zetadiv'
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘pctax’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘ggtree’
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... NOTE
  Note: found 30689 marked UTF-8 strings
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 3 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/pctax/old/pctax.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘pctax/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘pctax’ version ‘0.1.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Packages suggested but not available for checking:
  'ggtree', 'ggtreeExtra', 'zetadiv'
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘pctax’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘ggtree’
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... NOTE
  Note: found 30689 marked UTF-8 strings
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 3 NOTEs





```
# phylosem

<details>

* Version: 1.1.4
* GitHub: https://github.com/James-Thorson-NOAA/phylosem
* Source code: https://github.com/cran/phylosem
* Date/Publication: 2024-04-02 21:15:03 UTC
* Number of recursive dependencies: 216

Run `revdepcheck::cloud_details(, "phylosem")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/phylosem/new/phylosem.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘phylosem/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘phylosem’ version ‘1.1.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘semPlot’

Package which this enhances but not available for checking: ‘DiagrammeR’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘phylosem’ can be installed ... OK
* used C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
* checking installed package size ... NOTE
  installed size is 72.9Mb
  sub-directories of 1Mb or more:
    libs  72.1Mb
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking whether startup messages can be suppressed ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking line endings in Makefiles ... OK
* checking compilation flags in Makevars ... OK
* checking for GNU extensions in Makefiles ... OK
* checking for portable use of $(BLAS_LIBS) and $(LAPACK_LIBS) ... OK
* checking use of PKG_*FLAGS in Makefiles ... OK
* checking compiled code ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/phylosem/old/phylosem.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘phylosem/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘phylosem’ version ‘1.1.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘semPlot’

Package which this enhances but not available for checking: ‘DiagrammeR’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘phylosem’ can be installed ... OK
* used C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
* checking installed package size ... NOTE
  installed size is 72.9Mb
  sub-directories of 1Mb or more:
    libs  72.1Mb
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking whether startup messages can be suppressed ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking line endings in Makefiles ... OK
* checking compilation flags in Makevars ... OK
* checking for GNU extensions in Makefiles ... OK
* checking for portable use of $(BLAS_LIBS) and $(LAPACK_LIBS) ... OK
* checking use of PKG_*FLAGS in Makefiles ... OK
* checking compiled code ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
# psychonetrics

<details>

* Version: 0.13.2
* GitHub: https://github.com/SachaEpskamp/psychonetrics
* Source code: https://github.com/cran/psychonetrics
* Date/Publication: 2025-10-22 05:10:02 UTC
* Number of recursive dependencies: 140

Run `revdepcheck::cloud_details(, "psychonetrics")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/psychonetrics/new/psychonetrics.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘psychonetrics/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘psychonetrics’ version ‘0.13.2’
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘semPlot’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘psychonetrics’ can be installed ... OK
* used C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
* checking installed package size ... NOTE
  installed size is 62.7Mb
  sub-directories of 1Mb or more:
    R      1.0Mb
    libs  61.3Mb
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking whether startup messages can be suppressed ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking line endings in Makefiles ... OK
* checking compilation flags in Makevars ... OK
* checking for GNU extensions in Makefiles ... OK
* checking for portable use of $(BLAS_LIBS) and $(LAPACK_LIBS) ... OK
* checking use of PKG_*FLAGS in Makefiles ... OK
* checking compiled code ... OK
* checking examples ... OK
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/psychonetrics/old/psychonetrics.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘psychonetrics/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘psychonetrics’ version ‘0.13.2’
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘semPlot’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘psychonetrics’ can be installed ... OK
* used C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
* checking installed package size ... NOTE
  installed size is 63.2Mb
  sub-directories of 1Mb or more:
    R      1.5Mb
    libs  61.3Mb
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking whether startup messages can be suppressed ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking line endings in Makefiles ... OK
* checking compilation flags in Makevars ... OK
* checking for GNU extensions in Makefiles ... OK
* checking for portable use of $(BLAS_LIBS) and $(LAPACK_LIBS) ... OK
* checking use of PKG_*FLAGS in Makefiles ... OK
* checking compiled code ... OK
* checking examples ... OK
* DONE
Status: 2 NOTEs





```
# pwSEM

<details>

* Version: 1.0.0
* GitHub: NA
* Source code: https://github.com/cran/pwSEM
* Date/Publication: 2025-07-02 15:20:05 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::cloud_details(, "pwSEM")` for more info

</details>

## In both

*   checking whether package ‘pwSEM’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/pwSEM/new/pwSEM.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘pwSEM’ ...
** package ‘pwSEM’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘gsl’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘pwSEM’
* removing ‘/tmp/workdir/pwSEM/new/pwSEM.Rcheck/pwSEM’


```
### CRAN

```
* installing *source* package ‘pwSEM’ ...
** package ‘pwSEM’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘gsl’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘pwSEM’
* removing ‘/tmp/workdir/pwSEM/old/pwSEM.Rcheck/pwSEM’


```
# randomForestSRC

<details>

* Version: 3.4.4
* GitHub: https://github.com/kogalur/randomForestSRC
* Source code: https://github.com/cran/randomForestSRC
* Date/Publication: 2025-11-05 17:40:02 UTC
* Number of recursive dependencies: 155

Run `revdepcheck::cloud_details(, "randomForestSRC")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/randomForestSRC/new/randomForestSRC.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘randomForestSRC/DESCRIPTION’ ... OK
* this is package ‘randomForestSRC’ version ‘3.4.4’
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘imbalance’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘randomForestSRC’ can be installed ... OK
* used C compiler: ‘gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
* checking installed package size ... OK
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking whether startup messages can be suppressed ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking line endings in shell scripts ... OK
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking line endings in Makefiles ... OK
* checking compilation flags in Makevars ... OK
* checking for GNU extensions in Makefiles ... OK
* checking for portable use of $(BLAS_LIBS) and $(LAPACK_LIBS) ... OK
* checking use of PKG_*FLAGS in Makefiles ... OK
* checking compiled code ... OK
* checking examples ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/randomForestSRC/old/randomForestSRC.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘randomForestSRC/DESCRIPTION’ ... OK
* this is package ‘randomForestSRC’ version ‘3.4.4’
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘imbalance’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘randomForestSRC’ can be installed ... OK
* used C compiler: ‘gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
* checking installed package size ... OK
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking whether startup messages can be suppressed ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking line endings in shell scripts ... OK
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking line endings in Makefiles ... OK
* checking compilation flags in Makevars ... OK
* checking for GNU extensions in Makefiles ... OK
* checking for portable use of $(BLAS_LIBS) and $(LAPACK_LIBS) ... OK
* checking use of PKG_*FLAGS in Makefiles ... OK
* checking compiled code ... OK
* checking examples ... OK
* DONE
Status: 1 NOTE





```
# ReporterScore

<details>

* Version: 0.1.9
* GitHub: https://github.com/Asa12138/ReporterScore
* Source code: https://github.com/cran/ReporterScore
* Date/Publication: 2024-11-28 14:10:06 UTC
* Number of recursive dependencies: 247

Run `revdepcheck::cloud_details(, "ReporterScore")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/ReporterScore/new/ReporterScore.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ReporterScore/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘ReporterScore’ version ‘0.1.9’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Packages suggested but not available for checking:
  'clusterProfiler', 'enrichplot'
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘ReporterScore’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking whether startup messages can be suppressed ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/ReporterScore/old/ReporterScore.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ReporterScore/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘ReporterScore’ version ‘0.1.9’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Packages suggested but not available for checking:
  'clusterProfiler', 'enrichplot'
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘ReporterScore’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking whether startup messages can be suppressed ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# Revticulate

<details>

* Version: 1.0.0
* GitHub: NA
* Source code: https://github.com/cran/Revticulate
* Date/Publication: 2022-03-15 23:30:07 UTC
* Number of recursive dependencies: 176

Run `revdepcheck::cloud_details(, "Revticulate")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/Revticulate/new/Revticulate.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Revticulate/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘Revticulate’ version ‘1.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘RevGadgets’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘Revticulate’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking whether startup messages can be suppressed ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... NOTE
checkRd: (-1) saveRev.Rd:12: Lost braces; missing escapes or markup?
    12 | \item{use_wd}{logical - If TRUE, the history will be prepended by setwd({'users current working directory'}). This function will set the script's working directory to
       |                                                                         ^
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking examples ... OK
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/Revticulate/old/Revticulate.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Revticulate/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘Revticulate’ version ‘1.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘RevGadgets’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘Revticulate’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking whether startup messages can be suppressed ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... NOTE
checkRd: (-1) saveRev.Rd:12: Lost braces; missing escapes or markup?
    12 | \item{use_wd}{logical - If TRUE, the history will be prepended by setwd({'users current working directory'}). This function will set the script's working directory to
       |                                                                         ^
* checking Rd metadata ... OK
* checking Rd cross-references ... OK
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking examples ... OK
* DONE
Status: 2 NOTEs





```
# scperturbR

<details>

* Version: 0.1.0
* GitHub: https://github.com/sanderlab/scPerturb
* Source code: https://github.com/cran/scperturbR
* Date/Publication: 2023-03-01 20:10:02 UTC
* Number of recursive dependencies: 159

Run `revdepcheck::cloud_details(, "scperturbR")` for more info

</details>

## In both

*   checking whether package ‘scperturbR’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/scperturbR/new/scperturbR.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘scperturbR’ ...
** package ‘scperturbR’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘gsl’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘scperturbR’
* removing ‘/tmp/workdir/scperturbR/new/scperturbR.Rcheck/scperturbR’


```
### CRAN

```
* installing *source* package ‘scperturbR’ ...
** package ‘scperturbR’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘gsl’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘scperturbR’
* removing ‘/tmp/workdir/scperturbR/old/scperturbR.Rcheck/scperturbR’


```
# semdrw

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/semdrw
* Date/Publication: 2018-11-14 11:00:02 UTC
* Number of recursive dependencies: 123

Run `revdepcheck::cloud_details(, "semdrw")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/semdrw/new/semdrw.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘semdrw/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘semdrw’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/semdrw/old/semdrw.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘semdrw/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘semdrw’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# semptools

<details>

* Version: 0.3.2
* GitHub: https://github.com/sfcheung/semptools
* Source code: https://github.com/cran/semptools
* Date/Publication: 2025-07-12 08:20:02 UTC
* Number of recursive dependencies: 121

Run `revdepcheck::cloud_details(, "semptools")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/semptools/new/semptools.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘semptools/DESCRIPTION’ ... OK
* this is package ‘semptools’ version ‘0.3.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/semptools/old/semptools.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘semptools/DESCRIPTION’ ... OK
* this is package ‘semptools’ version ‘0.3.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# sphereML

<details>

* Version: 0.1.1
* GitHub: https://github.com/santosoph/sphereML
* Source code: https://github.com/cran/sphereML
* Date/Publication: 2025-05-09 17:10:06 UTC
* Number of recursive dependencies: 198

Run `revdepcheck::cloud_details(, "sphereML")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/sphereML/new/sphereML.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘sphereML/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘sphereML’ version ‘0.1.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/sphereML/old/sphereML.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘sphereML/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘sphereML’ version ‘0.1.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# stoRy

<details>

* Version: 0.2.2
* GitHub: https://github.com/theme-ontology/stoRy
* Source code: https://github.com/cran/stoRy
* Date/Publication: 2023-06-13 23:10:02 UTC
* Number of recursive dependencies: 76

Run `revdepcheck::cloud_details(, "stoRy")` for more info

</details>

## In both

*   checking whether package ‘stoRy’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/stoRy/new/stoRy.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘stoRy’ ...
** package ‘stoRy’ successfully unpacked and MD5 sums checked
** using staged installation
** R
Warning: namespace ‘stoRy’ is not available and has been replaced
by .GlobalEnv when processing object ‘background_collection’
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘at_depth’ is not exported by 'namespace:purrr'
Execution halted
ERROR: lazy loading failed for package ‘stoRy’
* removing ‘/tmp/workdir/stoRy/new/stoRy.Rcheck/stoRy’


```
### CRAN

```
* installing *source* package ‘stoRy’ ...
** package ‘stoRy’ successfully unpacked and MD5 sums checked
** using staged installation
** R
Warning: namespace ‘stoRy’ is not available and has been replaced
by .GlobalEnv when processing object ‘background_collection’
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘at_depth’ is not exported by 'namespace:purrr'
Execution halted
ERROR: lazy loading failed for package ‘stoRy’
* removing ‘/tmp/workdir/stoRy/old/stoRy.Rcheck/stoRy’


```
# streamDAG

<details>

* Version: 1.6
* GitHub: NA
* Source code: https://github.com/cran/streamDAG
* Date/Publication: 2025-10-16 15:30:02 UTC
* Number of recursive dependencies: 142

Run `revdepcheck::cloud_details(, "streamDAG")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/streamDAG/new/streamDAG.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘streamDAG/DESCRIPTION’ ... OK
* this is package ‘streamDAG’ version ‘1.6’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘asbio’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/streamDAG/old/streamDAG.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘streamDAG/DESCRIPTION’ ... OK
* this is package ‘streamDAG’ version ‘1.6’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘asbio’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# Surrogate

<details>

* Version: 3.4.1
* GitHub: https://github.com/florianstijven/Surrogate-development
* Source code: https://github.com/cran/Surrogate
* Date/Publication: 2025-04-29 04:40:02 UTC
* Number of recursive dependencies: 192

Run `revdepcheck::cloud_details(, "Surrogate")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/Surrogate/new/Surrogate.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Surrogate/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘Surrogate’ version ‘3.4.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘MBESS’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/Surrogate/old/Surrogate.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Surrogate/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘Surrogate’ version ‘3.4.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘MBESS’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# TDAkit

<details>

* Version: 0.1.3
* GitHub: NA
* Source code: https://github.com/cran/TDAkit
* Date/Publication: 2025-09-21 22:10:13 UTC
* Number of recursive dependencies: 108

Run `revdepcheck::cloud_details(, "TDAkit")` for more info

</details>

## In both

*   checking whether package ‘TDAkit’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/TDAkit/new/TDAkit.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘TDAkit’ ...
** package ‘TDAkit’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fopenmp  -fpic  -g -O2   -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fopenmp  -fpic  -g -O2   -c cpp_integral.cpp -o cpp_integral.o
g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fopenmp  -fpic  -g -O2   -c cpp_routines.cpp -o cpp_routines.o
g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fopenmp  -fpic  -g -O2   -c cpp_wsum.cpp -o cpp_wsum.o
g++ -std=gnu++17 -shared -L/opt/R/4.4.0/lib/R/lib -L/usr/local/lib -o TDAkit.so RcppExports.o cpp_integral.o cpp_routines.o cpp_wsum.o -fopenmp -llapack -lblas -lgfortran -lm -lquadmath -L/opt/R/4.4.0/lib/R/lib -lR
installing to /tmp/workdir/TDAkit/new/TDAkit.Rcheck/00LOCK-TDAkit/00new/TDAkit/libs
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘gsl’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘TDAkit’
* removing ‘/tmp/workdir/TDAkit/new/TDAkit.Rcheck/TDAkit’


```
### CRAN

```
* installing *source* package ‘TDAkit’ ...
** package ‘TDAkit’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fopenmp  -fpic  -g -O2   -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fopenmp  -fpic  -g -O2   -c cpp_integral.cpp -o cpp_integral.o
g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fopenmp  -fpic  -g -O2   -c cpp_routines.cpp -o cpp_routines.o
g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fopenmp  -fpic  -g -O2   -c cpp_wsum.cpp -o cpp_wsum.o
g++ -std=gnu++17 -shared -L/opt/R/4.4.0/lib/R/lib -L/usr/local/lib -o TDAkit.so RcppExports.o cpp_integral.o cpp_routines.o cpp_wsum.o -fopenmp -llapack -lblas -lgfortran -lm -lquadmath -L/opt/R/4.4.0/lib/R/lib -lR
installing to /tmp/workdir/TDAkit/old/TDAkit.Rcheck/00LOCK-TDAkit/00new/TDAkit/libs
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘gsl’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘TDAkit’
* removing ‘/tmp/workdir/TDAkit/old/TDAkit.Rcheck/TDAkit’


```
# TELP

<details>

* Version: 1.0.3
* GitHub: NA
* Source code: https://github.com/cran/TELP
* Date/Publication: 2025-05-09 15:00:05 UTC
* Number of recursive dependencies: 109

Run `revdepcheck::cloud_details(, "TELP")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/TELP/new/TELP.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘TELP/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘TELP’ version ‘1.0.3’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'arules', 'arulesViz'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/TELP/old/TELP.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘TELP/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘TELP’ version ‘1.0.3’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'arules', 'arulesViz'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# TestAnaAPP

<details>

* Version: 1.1.2
* GitHub: https://github.com/jiangyouxiang/TestAnaAPP
* Source code: https://github.com/cran/TestAnaAPP
* Date/Publication: 2024-11-09 04:00:02 UTC
* Number of recursive dependencies: 264

Run `revdepcheck::cloud_details(, "TestAnaAPP")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/TestAnaAPP/new/TestAnaAPP.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘TestAnaAPP/DESCRIPTION’ ... OK
* this is package ‘TestAnaAPP’ version ‘1.1.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/TestAnaAPP/old/TestAnaAPP.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘TestAnaAPP/DESCRIPTION’ ... OK
* this is package ‘TestAnaAPP’ version ‘1.1.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# tidybins

<details>

* Version: 0.1.1
* GitHub: https://github.com/Harrison4192/tidybins
* Source code: https://github.com/cran/tidybins
* Date/Publication: 2024-06-12 04:50:02 UTC
* Number of recursive dependencies: 222

Run `revdepcheck::cloud_details(, "tidybins")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/tidybins/new/tidybins.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidybins/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘tidybins’ version ‘0.1.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘arulesCBA’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘tidybins’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking dependencies in R code ... NOTE
Namespaces in Imports field not imported from:
  ‘badger’ ‘ggplot2’ ‘lubridate’ ‘scales’ ‘xgboost’
  All declared Imports should be used.
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘arulesCBA’
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... ERROR
Running examples in ‘tidybins-Ex.R’ failed
The error most likely occurred in:

> ### Name: bin_cols
> ### Title: Bin Cols
> ### Aliases: bin_cols
> 
> ### ** Examples
> 
> 
> iris %>%
+ bin_cols(Sepal.Width, n_bins = 5, pretty_labels = TRUE) %>%
+ bin_cols(Petal.Width, n_bins = 3, bin_type = c("width", "kmeans")) %>%
+ bin_cols(Sepal.Width, bin_type = "xgboost", target = Species, seed = 1) -> iris1
Error in `purrr::map_chr()`:
ℹ In index: 1.
ℹ With name: Sepal.Width.
Caused by error:
! Can't coerce from an integer to a string.
Backtrace:
     ▆
  1. ├─... %>% ...
  2. ├─tidybins::bin_cols(...)
  3. │ └─.data %>% ...
  4. ├─framecleaner::select_otherwise(...)
  5. │ └─tidyselect::eval_select(.dots, data = .data)
  6. │   └─tidyselect::tidyselect_data_has_predicates(data)
  7. ├─tidybins::bin_cols(...)
  8. │ └─.data %>% ...
  9. ├─framecleaner::select_otherwise(...)
 10. │ └─tidyselect::eval_select(.dots, data = .data)
 11. │   └─tidyselect::tidyselect_data_has_predicates(data)
 12. ├─tidybins::bin_cols(., Sepal.Width, n_bins = 5, pretty_labels = TRUE)
 13. │ └─tidybins:::oner_wrapper(...)
 14. │   └─bin_df %>% rename_bin_lens(abbv = abbv, cols = tidyselect::everything())
 15. ├─tidybins:::rename_bin_lens(., abbv = abbv, cols = tidyselect::everything())
 16. │ └─... %>% stringr::str_c("_", abbv, .)
 17. ├─stringr::str_c("_", abbv, .)
 18. ├─purrr::map_chr(., 1)
 19. │ └─purrr:::map_("character", .x, .f, ..., .progress = .progress)
 20. │   ├─purrr:::with_indexed_errors(...)
 21. │   │ └─base::withCallingHandlers(...)
 22. │   └─purrr:::call_with_cleanup(...)
 23. └─base::.handleSimpleError(...)
 24.   └─purrr (local) h(simpleError(msg, call))
 25.     └─cli::cli_abort(...)
 26.       └─rlang::abort(...)
Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 ERROR, 3 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/tidybins/old/tidybins.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidybins/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘tidybins’ version ‘0.1.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘arulesCBA’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘tidybins’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking dependencies in R code ... NOTE
Namespaces in Imports field not imported from:
  ‘badger’ ‘ggplot2’ ‘lubridate’ ‘scales’ ‘xgboost’
  All declared Imports should be used.
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘arulesCBA’
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... ERROR
Running examples in ‘tidybins-Ex.R’ failed
The error most likely occurred in:

> ### Name: bin_cols
> ### Title: Bin Cols
> ### Aliases: bin_cols
> 
> ### ** Examples
> 
> 
> iris %>%
+ bin_cols(Sepal.Width, n_bins = 5, pretty_labels = TRUE) %>%
+ bin_cols(Petal.Width, n_bins = 3, bin_type = c("width", "kmeans")) %>%
+ bin_cols(Sepal.Width, bin_type = "xgboost", target = Species, seed = 1) -> iris1
Error in `purrr::map_chr()`:
ℹ In index: 1.
ℹ With name: Sepal.Width.
Caused by error:
! Can't coerce from an integer to a string.
Backtrace:
     ▆
  1. ├─... %>% ...
  2. ├─tidybins::bin_cols(...)
  3. │ └─.data %>% ...
  4. ├─framecleaner::select_otherwise(...)
  5. │ └─tidyselect::eval_select(.dots, data = .data)
  6. │   └─tidyselect::tidyselect_data_has_predicates(data)
  7. ├─tidybins::bin_cols(...)
  8. │ └─.data %>% ...
  9. ├─framecleaner::select_otherwise(...)
 10. │ └─tidyselect::eval_select(.dots, data = .data)
 11. │   └─tidyselect::tidyselect_data_has_predicates(data)
 12. ├─tidybins::bin_cols(., Sepal.Width, n_bins = 5, pretty_labels = TRUE)
 13. │ └─tidybins:::oner_wrapper(...)
 14. │   └─bin_df %>% rename_bin_lens(abbv = abbv, cols = tidyselect::everything())
 15. ├─tidybins:::rename_bin_lens(., abbv = abbv, cols = tidyselect::everything())
 16. │ └─... %>% stringr::str_c("_", abbv, .)
 17. ├─stringr::str_c("_", abbv, .)
 18. ├─purrr::map_chr(., 1)
 19. │ └─purrr:::map_("character", .x, .f, ..., .progress = .progress)
 20. │   ├─purrr:::with_indexed_errors(...)
 21. │   │ └─base::withCallingHandlers(...)
 22. │   └─purrr:::call_with_cleanup(...)
 23. └─base::.handleSimpleError(...)
 24.   └─purrr (local) h(simpleError(msg, call))
 25.     └─cli::cli_abort(...)
 26.       └─rlang::abort(...)
Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 ERROR, 3 NOTEs





```
# tidycomm

<details>

* Version: 0.4.2
* GitHub: https://github.com/tidycomm/tidycomm
* Source code: https://github.com/cran/tidycomm
* Date/Publication: 2025-08-27 12:00:02 UTC
* Number of recursive dependencies: 141

Run `revdepcheck::cloud_details(, "tidycomm")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/tidycomm/new/tidycomm.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidycomm/DESCRIPTION’ ... OK
* this is package ‘tidycomm’ version ‘0.4.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘MBESS’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/tidycomm/old/tidycomm.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidycomm/DESCRIPTION’ ... OK
* this is package ‘tidycomm’ version ‘0.4.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘MBESS’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# tidyjson

<details>

* Version: 0.3.2
* GitHub: https://github.com/colearendt/tidyjson
* Source code: https://github.com/cran/tidyjson
* Date/Publication: 2023-01-07 00:20:02 UTC
* Number of recursive dependencies: 92

Run `revdepcheck::cloud_details(, "tidyjson")` for more info

</details>

## In both

*   checking whether package ‘tidyjson’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/tidyjson/new/tidyjson.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘tidyjson’ ...
** package ‘tidyjson’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘at_depth’ is not exported by 'namespace:purrr'
Execution halted
ERROR: lazy loading failed for package ‘tidyjson’
* removing ‘/tmp/workdir/tidyjson/new/tidyjson.Rcheck/tidyjson’


```
### CRAN

```
* installing *source* package ‘tidyjson’ ...
** package ‘tidyjson’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘at_depth’ is not exported by 'namespace:purrr'
Execution halted
ERROR: lazy loading failed for package ‘tidyjson’
* removing ‘/tmp/workdir/tidyjson/old/tidyjson.Rcheck/tidyjson’


```
# tidySEM

<details>

* Version: 0.2.9
* GitHub: https://github.com/cjvanlissa/tidySEM
* Source code: https://github.com/cran/tidySEM
* Date/Publication: 2025-07-30 18:20:02 UTC
* Number of recursive dependencies: 222

Run `revdepcheck::cloud_details(, "tidySEM")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/tidySEM/new/tidySEM.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidySEM/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘tidySEM’ version ‘0.2.9’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Packages suggested but not available for checking: 'umx', 'OpenMx'
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘tidySEM’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘OpenMx’
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/tidySEM/old/tidySEM.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidySEM/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘tidySEM’ version ‘0.2.9’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Packages suggested but not available for checking: 'umx', 'OpenMx'
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘tidySEM’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking code files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking dependencies in R code ... OK
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘OpenMx’
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
# TransProR

<details>

* Version: 1.0.7
* GitHub: https://github.com/SSSYDYSSS/TransProR
* Source code: https://github.com/cran/TransProR
* Date/Publication: 2025-09-12 12:10:02 UTC
* Number of recursive dependencies: 195

Run `revdepcheck::cloud_details(, "TransProR")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/TransProR/new/TransProR.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘TransProR/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘TransProR’ version ‘1.0.7’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘ggtree’

Package suggested but not available for checking: ‘ggtreeExtra’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/TransProR/old/TransProR.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘TransProR/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘TransProR’ version ‘1.0.7’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘ggtree’

Package suggested but not available for checking: ‘ggtreeExtra’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# tsissm

<details>

* Version: 1.0.2
* GitHub: https://github.com/tsmodels/tsissm
* Source code: https://github.com/cran/tsissm
* Date/Publication: 2025-07-12 20:20:02 UTC
* Number of recursive dependencies: 167

Run `revdepcheck::cloud_details(, "tsissm")` for more info

</details>

## In both

*   checking whether package ‘tsissm’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/tsissm/new/tsissm.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘tsissm’ ...
** package ‘tsissm’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/TMB/include' -I'/usr/local/lib/R/site-library/RcppEigen/include' -I/usr/local/include    -fpic  -g -O2   -c RcppExports.cpp -o RcppExports.o
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:205,
                 from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Dense:1,
                 from /usr/local/lib/R/site-library/RcppEigen/include/RcppEigenForward.h:28,
                 from /usr/local/lib/R/site-library/RcppEigen/include/RcppEigen.h:25,
                 from RcppExports.cpp:4:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:46:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   46 | typedef eigen_packet_wrapper<__m128i, 0> Packet4i;
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:47:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   47 | typedef eigen_packet_wrapper<__m128i, 1> Packet16b;
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:49:39: warning: ignoring attributes on template argument ‘__m128’ [-Wignored-attributes]
   49 | template<> struct is_arithmetic<__m128>  { enum { value = true }; };
      |                                       ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:50:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   50 | template<> struct is_arithmetic<__m128i> { enum { value = true }; };
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:51:40: warning: ignoring attributes on template argument ‘__m128d’ [-Wignored-attributes]
   51 | template<> struct is_arithmetic<__m128d> { enum { value = true }; };
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:222:43: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
  222 | template<> struct unpacket_traits<Packet4f> {
      |                                           ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:228:43: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
  228 | template<> struct unpacket_traits<Packet2d> {
      |                                           ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:1124:34: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
 1124 | ptranspose(PacketBlock<Packet4f,4>& kernel) {
      |                                  ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:1129:34: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
 1129 | ptranspose(PacketBlock<Packet2d,2>& kernel) {
      |                                  ^
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:174:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:16:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
   16 |   struct conj_helper<PACKET_REAL, PACKET_CPLX, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:173:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  173 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet2cf,Packet4f)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:29:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
   29 |   struct conj_helper<PACKET_CPLX, PACKET_REAL, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:173:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  173 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet2cf,Packet4f)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:16:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
   16 |   struct conj_helper<PACKET_REAL, PACKET_CPLX, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:298:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  298 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet1cd,Packet2d)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:29:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
   29 |   struct conj_helper<PACKET_CPLX, PACKET_REAL, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:298:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  298 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet1cd,Packet2d)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:165:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h: In instantiation of ‘struct Eigen::internal::find_best_packet<float, 4>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:22:57:   required from ‘struct Eigen::internal::traits<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:266:49:   required from ‘struct Eigen::internal::traits<Eigen::Quaternion<float> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:24:46:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:44: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::unpacket_traits<__vector(4) float>::half’ {aka ‘__m128’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:208:88: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  208 |   typedef typename find_best_packet_helper<Size,typename packet_traits<T>::type>::type type;
      |                                                                                        ^~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:271:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<float, 4, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:46:50:   required from ‘class Eigen::QuaternionBase<Eigen::Quaternion<float> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:273:7:   required from ‘class Eigen::Quaternion<float>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:27:3:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h: In instantiation of ‘struct Eigen::internal::find_best_packet<double, 4>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:22:57:   required from ‘struct Eigen::internal::traits<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:266:49:   required from ‘struct Eigen::internal::traits<Eigen::Quaternion<double> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:98:47:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:44: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::unpacket_traits<__vector(2) double>::half’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:208:88: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  208 |   typedef typename find_best_packet_helper<Size,typename packet_traits<T>::type>::type type;
      |                                                                                        ^~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, 4, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:46:50:   required from ‘class Eigen::QuaternionBase<Eigen::Quaternion<double> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:273:7:   required from ‘class Eigen::Quaternion<double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:102:3:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/SparseCore:37,
                 from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Sparse:26,
                 from /usr/local/lib/R/site-library/RcppEigen/include/RcppEigenForward.h:29:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h: In instantiation of ‘class Eigen::SparseMatrixBase<Eigen::SparseMatrix<double, 0, int> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseCompressedBase.h:36:7:   required from ‘class Eigen::SparseCompressedBase<Eigen::SparseMatrix<double, 0, int> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrix.h:96:7:   required from ‘class Eigen::SparseMatrix<double, 0, int>’
/usr/local/lib/R/site-library/RcppEigen/include/unsupported/Eigen/src/IterativeSolvers/ConstrainedConjGrad.h:61:25:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h:47:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   47 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h: In instantiation of ‘struct Eigen::internal::find_best_packet<double, -1>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:22:57:   required from ‘struct Eigen::internal::traits<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Map.h:18:8:   required from ‘struct Eigen::internal::traits<Eigen::Map<Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/ForwardDeclarations.h:32:48:   required from ‘struct Eigen::internal::accessors_level<Eigen::Map<Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/ForwardDeclarations.h:111:75:   required from ‘class Eigen::Map<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/Rcpp/include/Rcpp/InputParameter.h:77:11:   required from ‘class Rcpp::ConstReferenceInputParameter<Eigen::Map<Eigen::Matrix<double, -1, 1> > >’
RcppExports.cpp:20:86:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:44: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::unpacket_traits<__vector(2) double>::half’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:208:88: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  208 |   typedef typename find_best_packet_helper<Size,typename packet_traits<T>::type>::type type;
      |                                                                                        ^~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, -1, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Map.h:24:49:   required from ‘struct Eigen::internal::traits<Eigen::Map<Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/ForwardDeclarations.h:32:48:   required from ‘struct Eigen::internal::accessors_level<Eigen::Map<Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/ForwardDeclarations.h:111:75:   required from ‘class Eigen::Map<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/Rcpp/include/Rcpp/InputParameter.h:77:11:   required from ‘class Rcpp::ConstReferenceInputParameter<Eigen::Map<Eigen::Matrix<double, -1, 1> > >’
RcppExports.cpp:20:86:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, 1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, 1> >, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, 1> >, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Map<Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Map<Eigen::Matrix<double, -1, 1> >, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:223:34:   required from ‘class Eigen::MapBase<Eigen::Map<Eigen::Matrix<double, -1, 1> >, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Map.h:94:79:   required from ‘class Eigen::Map<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/Rcpp/include/Rcpp/InputParameter.h:77:11:   required from ‘class Rcpp::ConstReferenceInputParameter<Eigen::Map<Eigen::Matrix<double, -1, 1> > >’
RcppExports.cpp:20:86:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, -1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, -1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, -1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, -1, -1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Map.h:24:49:   required from ‘struct Eigen::internal::traits<Eigen::Map<Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/ForwardDeclarations.h:32:48:   required from ‘struct Eigen::internal::accessors_level<Eigen::Map<Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/ForwardDeclarations.h:111:75:   required from ‘class Eigen::Map<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/Rcpp/include/Rcpp/InputParameter.h:77:11:   required from ‘class Rcpp::ConstReferenceInputParameter<Eigen::Map<Eigen::Matrix<double, -1, -1> > >’
RcppExports.cpp:23:86:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, -1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, -1> >, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, -1> >, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Map<Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Map<Eigen::Matrix<double, -1, -1> >, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:223:34:   required from ‘class Eigen::MapBase<Eigen::Map<Eigen::Matrix<double, -1, -1> >, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Map.h:94:79:   required from ‘class Eigen::Map<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/Rcpp/include/Rcpp/InputParameter.h:77:11:   required from ‘class Rcpp::ConstReferenceInputParameter<Eigen::Map<Eigen::Matrix<double, -1, -1> > >’
RcppExports.cpp:23:86:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/TMB/include' -I'/usr/local/lib/R/site-library/RcppEigen/include' -I/usr/local/include    -fpic  -g -O2   -c filters.cpp -o filters.o
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:205,
                 from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Dense:1,
                 from /usr/local/lib/R/site-library/RcppEigen/include/RcppEigenForward.h:28,
                 from /usr/local/lib/R/site-library/RcppEigen/include/RcppEigen.h:25,
                 from filters.cpp:1:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:46:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   46 | typedef eigen_packet_wrapper<__m128i, 0> Packet4i;
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:47:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   47 | typedef eigen_packet_wrapper<__m128i, 1> Packet16b;
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:49:39: warning: ignoring attributes on template argument ‘__m128’ [-Wignored-attributes]
   49 | template<> struct is_arithmetic<__m128>  { enum { value = true }; };
      |                                       ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:50:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   50 | template<> struct is_arithmetic<__m128i> { enum { value = true }; };
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:51:40: warning: ignoring attributes on template argument ‘__m128d’ [-Wignored-attributes]
   51 | template<> struct is_arithmetic<__m128d> { enum { value = true }; };
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:222:43: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
  222 | template<> struct unpacket_traits<Packet4f> {
      |                                           ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:228:43: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
  228 | template<> struct unpacket_traits<Packet2d> {
      |                                           ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:1124:34: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
 1124 | ptranspose(PacketBlock<Packet4f,4>& kernel) {
      |                                  ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:1129:34: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
 1129 | ptranspose(PacketBlock<Packet2d,2>& kernel) {
      |                                  ^
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:174:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:16:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
   16 |   struct conj_helper<PACKET_REAL, PACKET_CPLX, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:173:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  173 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet2cf,Packet4f)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:29:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
   29 |   struct conj_helper<PACKET_CPLX, PACKET_REAL, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:173:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  173 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet2cf,Packet4f)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:16:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
   16 |   struct conj_helper<PACKET_REAL, PACKET_CPLX, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:298:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  298 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet1cd,Packet2d)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:29:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
   29 |   struct conj_helper<PACKET_CPLX, PACKET_REAL, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:298:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  298 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet1cd,Packet2d)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:165:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h: In instantiation of ‘struct Eigen::internal::find_best_packet<float, 4>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:22:57:   required from ‘struct Eigen::internal::traits<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:266:49:   required from ‘struct Eigen::internal::traits<Eigen::Quaternion<float> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:24:46:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:44: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::unpacket_traits<__vector(4) float>::half’ {aka ‘__m128’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:208:88: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  208 |   typedef typename find_best_packet_helper<Size,typename packet_traits<T>::type>::type type;
      |                                                                                        ^~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:271:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<float, 4, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:46:50:   required from ‘class Eigen::QuaternionBase<Eigen::Quaternion<float> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:273:7:   required from ‘class Eigen::Quaternion<float>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:27:3:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h: In instantiation of ‘struct Eigen::internal::find_best_packet<double, 4>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:22:57:   required from ‘struct Eigen::internal::traits<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:266:49:   required from ‘struct Eigen::internal::traits<Eigen::Quaternion<double> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:98:47:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:44: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::unpacket_traits<__vector(2) double>::half’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:208:88: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  208 |   typedef typename find_best_packet_helper<Size,typename packet_traits<T>::type>::type type;
      |                                                                                        ^~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, 4, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:46:50:   required from ‘class Eigen::QuaternionBase<Eigen::Quaternion<double> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:273:7:   required from ‘class Eigen::Quaternion<double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:102:3:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/SparseCore:37,
                 from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Sparse:26,
                 from /usr/local/lib/R/site-library/RcppEigen/include/RcppEigenForward.h:29:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h: In instantiation of ‘class Eigen::SparseMatrixBase<Eigen::SparseMatrix<double, 0, int> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseCompressedBase.h:36:7:   required from ‘class Eigen::SparseCompressedBase<Eigen::SparseMatrix<double, 0, int> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrix.h:96:7:   required from ‘class Eigen::SparseMatrix<double, 0, int>’
/usr/local/lib/R/site-library/RcppEigen/include/unsupported/Eigen/src/IterativeSolvers/ConstrainedConjGrad.h:61:25:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h:47:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   47 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h: In instantiation of ‘struct Eigen::internal::find_best_packet<double, -1>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:22:57:   required from ‘struct Eigen::internal::traits<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, -1, 1>’
filters.cpp:6:76:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:44: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::unpacket_traits<__vector(2) double>::half’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:208:88: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  208 |   typedef typename find_best_packet_helper<Size,typename packet_traits<T>::type>::type type;
      |                                                                                        ^~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, -1, 1>’
filters.cpp:6:76:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayWrapper.h:42:7:   required from ‘class Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >’
filters.cpp:9:20:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseUnaryOp.h:94:7:   required from ‘class Eigen::CwiseUnaryOpImpl<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseUnaryOp.h:55:7:   required from ‘class Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >’
filters.cpp:9:26:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseNullaryOp.h:60:7:   required from ‘class Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:38:28:   required from ‘struct Eigen::internal::traits<Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >’
filters.cpp:11:17:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >’
filters.cpp:11:17:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Array<double, -1, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Array<double, -1, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Array<double, -1, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Array<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::Array<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Array<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Array.h:45:7:   required from ‘class Eigen::Array<double, -1, 1>’
filters.cpp:11:39:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >’
filters.cpp:11:39:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_quotient_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_quotient_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_quotient_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_quotient_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_quotient_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >’
filters.cpp:11:46:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, -1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, -1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, -1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, -1, -1>’
filters.cpp:16:78:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Map<const Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Map<const Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Map<const Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Map<const Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Map<const Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Map.h:94:79:   required from ‘class Eigen::Map<const Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >’
filters.cpp:18:68:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:223:34:   required from ‘class Eigen::MapBase<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Map.h:94:79:   required from ‘class Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >’
filters.cpp:35:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Block<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Block<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Block<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false>, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:223:34:   required from ‘class Eigen::MapBase<Eigen::Block<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:329:7:   required from ‘class Eigen::internal::BlockImpl_dense<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false, true>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:154:7:   required from ‘class Eigen::BlockImpl<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:103:81:   required from ‘class Eigen::Block<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/VectorBlock.h:56:47:   required from ‘class Eigen::VectorBlock<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1>’
filters.cpp:51:38:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayWrapper.h:42:7:   required from ‘class Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >’
filters.cpp:59:34:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >’
filters.cpp:59:48:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >’
filters.cpp:59:61:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::MatrixWrapper<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::MatrixWrapper<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::MatrixWrapper<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayWrapper.h:140:7:   required from ‘class Eigen::MatrixWrapper<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > > >’
filters.cpp:59:70:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Transpose<Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Transpose<Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:118:37:   required from ‘class Eigen::TransposeImpl<Eigen::Matrix<double, -1, -1>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<Eigen::Matrix<double, -1, -1> >’
filters.cpp:65:46:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:120:7:   required from ‘class Eigen::internal::dense_product_base<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0, 8>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:152:7:   required from ‘class Eigen::ProductImpl<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:71:7:   required from ‘class Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0>’
filters.cpp:65:47:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::Matrix<double, -1, -1>, const Eigen::Matrix<double, -1, -1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::Matrix<double, -1, -1>, const Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::Matrix<double, -1, -1>, const Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_difference_op<double, double>, const Eigen::Matrix<double, -1, -1>, const Eigen::Matrix<double, -1, -1>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::Matrix<double, -1, -1>, const Eigen::Matrix<double, -1, -1> >’
filters.cpp:66:29:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 3>’
...
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:429:10:   required from ‘const Eigen::HouseholderQR<typename Eigen::DenseBase<Derived>::PlainObject> Eigen::MatrixBase<Derived>::householderQr() const [with Derived = Eigen::Matrix<double, -1, -1>; typename Eigen::DenseBase<Derived>::PlainObject = Eigen::Matrix<double, -1, -1>]’
filters.cpp:105:44:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixMatrix.h:462:59:   required from ‘static void Eigen::internal::triangular_product_impl<Mode, LhsIsTriangular, Lhs, false, Rhs, false>::run(Dest&, const Lhs&, const Rhs&, const typename Dest::Scalar&) [with Dest = Eigen::Matrix<double, -1, -1>; int Mode = 1; bool LhsIsTriangular = true; Lhs = const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >; Rhs = Eigen::Matrix<double, -1, -1>; typename Dest::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:770:14:   [ skipping 13 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:350:44:   required from ‘static void Eigen::internal::householder_qr_inplace_blocked<MatrixQR, HCoeffs, MatrixQRScalar, InnerStrideIsOne>::run(MatrixQR&, HCoeffs&, Eigen::Index, typename MatrixQR::Scalar*) [with MatrixQR = Eigen::Matrix<double, -1, -1>; HCoeffs = Eigen::Matrix<double, -1, 1>; MatrixQRScalar = double; bool InnerStrideIsOne = true; Eigen::Index = long int; typename MatrixQR::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:416:73:   required from ‘void Eigen::HouseholderQR<MatrixType>::computeInPlace() [with _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:181:7:   required from ‘Eigen::HouseholderQR<MatrixType>& Eigen::HouseholderQR<MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:114:14:   required from ‘Eigen::HouseholderQR<MatrixType>::HouseholderQR(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:429:10:   required from ‘const Eigen::HouseholderQR<typename Eigen::DenseBase<Derived>::PlainObject> Eigen::MatrixBase<Derived>::householderQr() const [with Derived = Eigen::Matrix<double, -1, -1>; typename Eigen::DenseBase<Derived>::PlainObject = Eigen::Matrix<double, -1, -1>]’
filters.cpp:105:44:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:223:34:   [ skipping 18 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixMatrix.h:457:59:   required from ‘static void Eigen::internal::triangular_product_impl<Mode, LhsIsTriangular, Lhs, false, Rhs, false>::run(Dest&, const Lhs&, const Rhs&, const typename Dest::Scalar&) [with Dest = Eigen::Matrix<double, -1, -1, 0, -1, 1>; int Mode = 6; bool LhsIsTriangular = true; Lhs = const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >; Rhs = Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>; typename Dest::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:770:14:   [ skipping 13 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:172:103:   required from ‘class Eigen::internal::BlockImpl_dense<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false, false>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:154:7:   required from ‘class Eigen::BlockImpl<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:103:81:   required from ‘class Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixMatrix.h:457:74:   [ skipping 14 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true>, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:223:34:   [ skipping 18 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >, -1, 1, true> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, 1, -1, false> >, const Eigen::Block<const Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >, -1, 1, true> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   required from ‘struct Eigen::internal::evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, 1, -1, false> >, const Eigen::Block<const Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:357:7:   required from ‘class Eigen::internal::redux_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, 1, -1, false> >, const Eigen::Block<const Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:414:17:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::redux(const Func&) const [with BinaryOp = Eigen::internal::scalar_sum_op<double, double>; Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, 1, -1, false> >, const Eigen::Block<const Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >, -1, 1, true> >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:463:25:   [ skipping 13 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_sum_op<double, double>, const Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >, 0>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Ref<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> > > >; Functor = Eigen::internal::assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false>; Src = Eigen::CwiseBinaryOp<scalar_sum_op<double, double>, const Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >, 0>, const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::Ref<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> > > >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:858:27:   required from ‘void Eigen::internal::call_assignment(Dst&, const Src&, const Func&, typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false>; Src = Eigen::CwiseBinaryOp<scalar_sum_op<double, double>, const Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >, 0>, const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::Ref<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> > > >; Func = assign_op<double, double>; typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type = void*; typename evaluator_traits<SrcXprType>::Shape = Eigen::DenseShape]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:836:18:   required from ‘void Eigen::internal::call_assignment(Dst&, const Src&) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false>; Src = Eigen::CwiseBinaryOp<scalar_sum_op<double, double>, const Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >, 0>, const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::Ref<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> > > >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Assign.h:66:28:   required from ‘Derived& Eigen::MatrixBase<Derived>::operator=(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_sum_op<double, double>, const Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >, 0>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Ref<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> > > >; Derived = Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false>]’
filters.cpp:163:62:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
 1071 |     PacketAlignment = unpacket_traits<PacketScalar>::alignment,
      |                                                      ^~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘Eigen::Index Eigen::internal::first_default_aligned(const Eigen::DenseBase<Derived>&) [with Derived = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::Block<const Eigen::Block<const Eigen::Map<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, 0, Eigen::OuterStride<> >, 1, -1, true>, 1, -1, false>, const Eigen::Transpose<const Eigen::Block<const Eigen::Map<const Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false> > >; Eigen::Index = long int]’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:243:63:   required from ‘static Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::Scalar Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::run(const Evaluator&, const Func&, const XprType&) [with XprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Block<const Eigen::Block<const Eigen::Map<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, 0, Eigen::OuterStride<> >, 1, -1, true>, 1, -1, false>, const Eigen::Transpose<const Eigen::Block<const Eigen::Map<const Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false> > >; Func = Eigen::internal::scalar_sum_op<double, double>; Evaluator = Eigen::internal::redux_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Block<const Eigen::Block<const Eigen::Map<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, 0, Eigen::OuterStride<> >, 1, -1, true>, 1, -1, false>, const Eigen::Transpose<const Eigen::Block<const Eigen::Map<const Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false> > > >; Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:418:56:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::redux(const Func&) const [with BinaryOp = Eigen::internal::scalar_sum_op<double, double>; Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Block<const Eigen::Block<const Eigen::Map<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, 0, Eigen::OuterStride<> >, 1, -1, true>, 1, -1, false>, const Eigen::Transpose<const Eigen::Block<const Eigen::Map<const Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false> > >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:463:25:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::sum() const [with Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Block<const Eigen::Block<const Eigen::Map<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, 0, Eigen::OuterStride<> >, 1, -1, true>, 1, -1, false>, const Eigen::Transpose<const Eigen::Block<const Eigen::Map<const Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false> > >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixVector.h:137:114:   required from ‘static void Eigen::internal::triangular_matrix_vector_product<Index, Mode, LhsScalar, ConjLhs, RhsScalar, ConjRhs, 1, Version>::run(Index, Index, const LhsScalar*, Index, const RhsScalar*, Index, ResScalar*, Index, const ResScalar&) [with Index = long int; int Mode = 6; LhsScalar = double; bool ConjLhs = false; RhsScalar = double; bool ConjRhs = false; int Version = 0; ResScalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixVector.h:332:12:   required from ‘static void Eigen::internal::trmv_selector<Mode, 1>::run(const Lhs&, const Rhs&, Dest&, const typename Dest::Scalar&) [with Lhs = Eigen::Transpose<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, -1, false> >; Rhs = Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >; Dest = Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >; int Mode = 6; typename Dest::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixVector.h:194:18:   [ skipping 9 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:350:44:   required from ‘static void Eigen::internal::householder_qr_inplace_blocked<MatrixQR, HCoeffs, MatrixQRScalar, InnerStrideIsOne>::run(MatrixQR&, HCoeffs&, Eigen::Index, typename MatrixQR::Scalar*) [with MatrixQR = Eigen::Matrix<double, -1, -1>; HCoeffs = Eigen::Matrix<double, -1, 1>; MatrixQRScalar = double; bool InnerStrideIsOne = true; Eigen::Index = long int; typename MatrixQR::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:416:73:   required from ‘void Eigen::HouseholderQR<MatrixType>::computeInPlace() [with _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:181:7:   required from ‘Eigen::HouseholderQR<MatrixType>& Eigen::HouseholderQR<MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:114:14:   required from ‘Eigen::HouseholderQR<MatrixType>::HouseholderQR(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:429:10:   required from ‘const Eigen::HouseholderQR<typename Eigen::DenseBase<Derived>::PlainObject> Eigen::MatrixBase<Derived>::householderQr() const [with Derived = Eigen::Matrix<double, -1, -1>; typename Eigen::DenseBase<Derived>::PlainObject = Eigen::Matrix<double, -1, -1>]’
filters.cpp:105:44:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:654:74: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  654 |   return internal::first_aligned<int(unpacket_traits<DefaultPacketType>::alignment),Derived>(m);
      |                                                                          ^~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1043:41:   required from ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:311:41:   required from ‘struct Eigen::internal::unary_evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> >, Eigen::internal::IndexBased, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:90:8:   required from ‘struct Eigen::internal::evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   [ skipping 28 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:350:44:   required from ‘static void Eigen::internal::householder_qr_inplace_blocked<MatrixQR, HCoeffs, MatrixQRScalar, InnerStrideIsOne>::run(MatrixQR&, HCoeffs&, Eigen::Index, typename MatrixQR::Scalar*) [with MatrixQR = Eigen::Matrix<double, -1, -1>; HCoeffs = Eigen::Matrix<double, -1, 1>; MatrixQRScalar = double; bool InnerStrideIsOne = true; Eigen::Index = long int; typename MatrixQR::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:416:73:   required from ‘void Eigen::HouseholderQR<MatrixType>::computeInPlace() [with _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:181:7:   required from ‘Eigen::HouseholderQR<MatrixType>& Eigen::HouseholderQR<MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:114:14:   required from ‘Eigen::HouseholderQR<MatrixType>::HouseholderQR(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:429:10:   required from ‘const Eigen::HouseholderQR<typename Eigen::DenseBase<Derived>::PlainObject> Eigen::MatrixBase<Derived>::householderQr() const [with Derived = Eigen::Matrix<double, -1, -1>; typename Eigen::DenseBase<Derived>::PlainObject = Eigen::Matrix<double, -1, -1>]’
filters.cpp:105:44:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
 1071 |     PacketAlignment = unpacket_traits<PacketScalar>::alignment,
      |                                                      ^~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:311:41:   required from ‘struct Eigen::internal::unary_evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> >, Eigen::internal::IndexBased, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:90:8:   required from ‘struct Eigen::internal::evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   [ skipping 26 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:350:44:   required from ‘static void Eigen::internal::householder_qr_inplace_blocked<MatrixQR, HCoeffs, MatrixQRScalar, InnerStrideIsOne>::run(MatrixQR&, HCoeffs&, Eigen::Index, typename MatrixQR::Scalar*) [with MatrixQR = Eigen::Matrix<double, -1, -1>; HCoeffs = Eigen::Matrix<double, -1, 1>; MatrixQRScalar = double; bool InnerStrideIsOne = true; Eigen::Index = long int; typename MatrixQR::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:416:73:   required from ‘void Eigen::HouseholderQR<MatrixType>::computeInPlace() [with _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:181:7:   required from ‘Eigen::HouseholderQR<MatrixType>& Eigen::HouseholderQR<MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:114:14:   required from ‘Eigen::HouseholderQR<MatrixType>::HouseholderQR(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:429:10:   required from ‘const Eigen::HouseholderQR<typename Eigen::DenseBase<Derived>::PlainObject> Eigen::MatrixBase<Derived>::householderQr() const [with Derived = Eigen::Matrix<double, -1, -1>; typename Eigen::DenseBase<Derived>::PlainObject = Eigen::Matrix<double, -1, -1>]’
filters.cpp:105:44:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   required from ‘struct Eigen::internal::evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   [ skipping 13 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:350:44:   required from ‘static void Eigen::internal::householder_qr_inplace_blocked<MatrixQR, HCoeffs, MatrixQRScalar, InnerStrideIsOne>::run(MatrixQR&, HCoeffs&, Eigen::Index, typename MatrixQR::Scalar*) [with MatrixQR = Eigen::Matrix<double, -1, -1>; HCoeffs = Eigen::Matrix<double, -1, 1>; MatrixQRScalar = double; bool InnerStrideIsOne = true; Eigen::Index = long int; typename MatrixQR::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:416:73:   required from ‘void Eigen::HouseholderQR<MatrixType>::computeInPlace() [with _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:181:7:   required from ‘Eigen::HouseholderQR<MatrixType>& Eigen::HouseholderQR<MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:114:14:   required from ‘Eigen::HouseholderQR<MatrixType>::HouseholderQR(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:429:10:   required from ‘const Eigen::HouseholderQR<typename Eigen::DenseBase<Derived>::PlainObject> Eigen::MatrixBase<Derived>::householderQr() const [with Derived = Eigen::Matrix<double, -1, -1>; typename Eigen::DenseBase<Derived>::PlainObject = Eigen::Matrix<double, -1, -1>]’
filters.cpp:105:44:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:780:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; Src = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Func = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:858:27:   required from ‘void Eigen::internal::call_assignment(Dst&, const Src&, const Func&, typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type) [with Dst = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; Src = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Func = sub_assign_op<double, double>; typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type = void*; typename evaluator_traits<SrcXprType>::Shape = Eigen::DenseShape]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:164:18:   required from ‘Derived& Eigen::MatrixBase<Derived>::operator-=(const Eigen::MatrixBase<OtherDerived>&) [with OtherDerived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Derived = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixVector.h:341:27:   [ skipping 10 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:350:44:   required from ‘static void Eigen::internal::householder_qr_inplace_blocked<MatrixQR, HCoeffs, MatrixQRScalar, InnerStrideIsOne>::run(MatrixQR&, HCoeffs&, Eigen::Index, typename MatrixQR::Scalar*) [with MatrixQR = Eigen::Matrix<double, -1, -1>; HCoeffs = Eigen::Matrix<double, -1, 1>; MatrixQRScalar = double; bool InnerStrideIsOne = true; Eigen::Index = long int; typename MatrixQR::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:416:73:   required from ‘void Eigen::HouseholderQR<MatrixType>::computeInPlace() [with _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:181:7:   required from ‘Eigen::HouseholderQR<MatrixType>& Eigen::HouseholderQR<MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:114:14:   required from ‘Eigen::HouseholderQR<MatrixType>::HouseholderQR(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:429:10:   required from ‘const Eigen::HouseholderQR<typename Eigen::DenseBase<Derived>::PlainObject> Eigen::MatrixBase<Derived>::householderQr() const [with Derived = Eigen::Matrix<double, -1, -1>; typename Eigen::DenseBase<Derived>::PlainObject = Eigen::Matrix<double, -1, -1>]’
filters.cpp:105:44:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>; SrcXprType = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false>; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>; SrcXprType = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false>; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>; Src = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false>; Func = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:858:27:   required from ‘void Eigen::internal::call_assignment(Dst&, const Src&, const Func&, typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>; Src = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false>; Func = sub_assign_op<double, double>; typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type = void*; typename evaluator_traits<SrcXprType>::Shape = Eigen::DenseShape]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:164:18:   required from ‘Derived& Eigen::MatrixBase<Derived>::operator-=(const Eigen::MatrixBase<OtherDerived>&) [with OtherDerived = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false>; Derived = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixMatrix.h:457:31:   [ skipping 10 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:350:44:   required from ‘static void Eigen::internal::householder_qr_inplace_blocked<MatrixQR, HCoeffs, MatrixQRScalar, InnerStrideIsOne>::run(MatrixQR&, HCoeffs&, Eigen::Index, typename MatrixQR::Scalar*) [with MatrixQR = Eigen::Matrix<double, -1, -1>; HCoeffs = Eigen::Matrix<double, -1, 1>; MatrixQRScalar = double; bool InnerStrideIsOne = true; Eigen::Index = long int; typename MatrixQR::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:416:73:   required from ‘void Eigen::HouseholderQR<MatrixType>::computeInPlace() [with _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:181:7:   required from ‘Eigen::HouseholderQR<MatrixType>& Eigen::HouseholderQR<MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:114:14:   required from ‘Eigen::HouseholderQR<MatrixType>::HouseholderQR(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:429:10:   required from ‘const Eigen::HouseholderQR<typename Eigen::DenseBase<Derived>::PlainObject> Eigen::MatrixBase<Derived>::householderQr() const [with Derived = Eigen::Matrix<double, -1, -1>; typename Eigen::DenseBase<Derived>::PlainObject = Eigen::Matrix<double, -1, -1>]’
filters.cpp:105:44:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   required from ‘struct Eigen::internal::evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   [ skipping 13 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:350:44:   required from ‘static void Eigen::internal::householder_qr_inplace_blocked<MatrixQR, HCoeffs, MatrixQRScalar, InnerStrideIsOne>::run(MatrixQR&, HCoeffs&, Eigen::Index, typename MatrixQR::Scalar*) [with MatrixQR = Eigen::Matrix<double, -1, -1>; HCoeffs = Eigen::Matrix<double, -1, 1>; MatrixQRScalar = double; bool InnerStrideIsOne = true; Eigen::Index = long int; typename MatrixQR::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:416:73:   required from ‘void Eigen::HouseholderQR<MatrixType>::computeInPlace() [with _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:181:7:   required from ‘Eigen::HouseholderQR<MatrixType>& Eigen::HouseholderQR<MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:114:14:   required from ‘Eigen::HouseholderQR<MatrixType>::HouseholderQR(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:429:10:   required from ‘const Eigen::HouseholderQR<typename Eigen::DenseBase<Derived>::PlainObject> Eigen::MatrixBase<Derived>::householderQr() const [with Derived = Eigen::Matrix<double, -1, -1>; typename Eigen::DenseBase<Derived>::PlainObject = Eigen::Matrix<double, -1, -1>]’
filters.cpp:105:44:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true>, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true>, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:329:7:   required from ‘class Eigen::internal::BlockImpl_dense<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true, true>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:154:7:   [ skipping 18 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:118:37:   required from ‘class Eigen::TransposeImpl<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:606:37:   [ skipping 16 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true>, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true>, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:329:7:   required from ‘class Eigen::internal::BlockImpl_dense<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true, true>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:154:7:   [ skipping 18 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:606:52:   required from ‘const Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, 1>, ProductTag, Eigen::DenseShape, Eigen::DenseShape>::CoeffReturnType Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, 1>, ProductTag, Eigen::DenseShape, Eigen::DenseShape>::coeff(Eigen::Index, Eigen::Index) const [with Lhs = Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >; Rhs = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>; int ProductTag = 3; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, 1>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, 1>::Lhs = Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, 1>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, 1>::Rhs = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>; CoeffReturnType = double; Eigen::Index = long int]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:654:63:   [ skipping 15 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false>, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false>, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:329:7:   required from ‘class Eigen::internal::BlockImpl_dense<const Eigen::Matrix<double, -1, 1>, 1, 1, false, true>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:154:7:   [ skipping 18 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:118:37:   required from ‘class Eigen::TransposeImpl<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:606:37:   [ skipping 16 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false>, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false>, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:329:7:   required from ‘class Eigen::internal::BlockImpl_dense<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false, true>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:154:7:   [ skipping 18 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:606:52:   required from ‘const Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, 1>, ProductTag, Eigen::DenseShape, Eigen::DenseShape>::CoeffReturnType Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, 1>, ProductTag, Eigen::DenseShape, Eigen::DenseShape>::coeff(Eigen::Index, Eigen::Index) const [with Lhs = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >; Rhs = Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >; int ProductTag = 4; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, 1>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, 1>::Lhs = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, 1>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, 1>::Rhs = Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >; CoeffReturnType = double; Eigen::Index = long int]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:654:63:   [ skipping 15 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, -1, -1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>; SrcXprType = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, -1, -1, false>; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>; SrcXprType = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, -1, -1, false>; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>; Src = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, -1, -1, false>; Func = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:858:27:   required from ‘void Eigen::internal::call_assignment(Dst&, const Src&, const Func&, typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type) [with Dst = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>; Src = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, -1, -1, false>; Func = sub_assign_op<double, double>; typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type = void*; typename evaluator_traits<SrcXprType>::Shape = Eigen::DenseShape]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:164:18:   required from ‘Derived& Eigen::MatrixBase<Derived>::operator-=(const Eigen::MatrixBase<OtherDerived>&) [with OtherDerived = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, -1, -1, false>; Derived = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixMatrix.h:457:31:   [ skipping 12 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
 1071 |     PacketAlignment = unpacket_traits<PacketScalar>::alignment,
      |                                                      ^~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, true> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:780:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, -1, true> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, -1, true> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, true>; Src = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, -1, true> >; Func = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:858:27:   required from ‘void Eigen::internal::call_assignment(Dst&, const Src&, const Func&, typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type) [with Dst = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, true>; Src = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, -1, true> >; Func = sub_assign_op<double, double>; typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type = void*; typename evaluator_traits<SrcXprType>::Shape = Eigen::DenseShape]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:164:18:   required from ‘Derived& Eigen::MatrixBase<Derived>::operator-=(const Eigen::MatrixBase<OtherDerived>&) [with OtherDerived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, -1, true> >; Derived = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, true>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixMatrix.h:462:32:   [ skipping 12 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:311:41:   required from ‘struct Eigen::internal::unary_evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, Eigen::internal::IndexBased, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:90:8:   required from ‘struct Eigen::internal::evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:41:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   [ skipping 20 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   required from ‘struct Eigen::internal::evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:357:7:   required from ‘class Eigen::internal::redux_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:414:17:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::redux(const Func&) const [with BinaryOp = Eigen::internal::scalar_sum_op<double, double>; Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:463:25:   [ skipping 17 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:311:41:   required from ‘struct Eigen::internal::unary_evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, Eigen::internal::IndexBased, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:90:8:   required from ‘struct Eigen::internal::evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:41:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   [ skipping 20 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   required from ‘struct Eigen::internal::evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:357:7:   required from ‘class Eigen::internal::redux_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:414:17:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::redux(const Func&) const [with BinaryOp = Eigen::internal::scalar_sum_op<double, double>; Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:463:25:   [ skipping 17 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   required from ‘struct Eigen::internal::evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   [ skipping 17 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:350:44:   required from ‘static void Eigen::internal::householder_qr_inplace_blocked<MatrixQR, HCoeffs, MatrixQRScalar, InnerStrideIsOne>::run(MatrixQR&, HCoeffs&, Eigen::Index, typename MatrixQR::Scalar*) [with MatrixQR = Eigen::Matrix<double, -1, -1>; HCoeffs = Eigen::Matrix<double, -1, 1>; MatrixQRScalar = double; bool InnerStrideIsOne = true; Eigen::Index = long int; typename MatrixQR::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:416:73:   required from ‘void Eigen::HouseholderQR<MatrixType>::computeInPlace() [with _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:181:7:   required from ‘Eigen::HouseholderQR<MatrixType>& Eigen::HouseholderQR<MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:114:14:   required from ‘Eigen::HouseholderQR<MatrixType>::HouseholderQR(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:429:10:   required from ‘const Eigen::HouseholderQR<typename Eigen::DenseBase<Derived>::PlainObject> Eigen::MatrixBase<Derived>::householderQr() const [with Derived = Eigen::Matrix<double, -1, -1>; typename Eigen::DenseBase<Derived>::PlainObject = Eigen::Matrix<double, -1, -1>]’
filters.cpp:105:44:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   required from ‘struct Eigen::internal::evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   [ skipping 17 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:350:44:   required from ‘static void Eigen::internal::householder_qr_inplace_blocked<MatrixQR, HCoeffs, MatrixQRScalar, InnerStrideIsOne>::run(MatrixQR&, HCoeffs&, Eigen::Index, typename MatrixQR::Scalar*) [with MatrixQR = Eigen::Matrix<double, -1, -1>; HCoeffs = Eigen::Matrix<double, -1, 1>; MatrixQRScalar = double; bool InnerStrideIsOne = true; Eigen::Index = long int; typename MatrixQR::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:416:73:   required from ‘void Eigen::HouseholderQR<MatrixType>::computeInPlace() [with _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:181:7:   required from ‘Eigen::HouseholderQR<MatrixType>& Eigen::HouseholderQR<MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:114:14:   required from ‘Eigen::HouseholderQR<MatrixType>::HouseholderQR(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:429:10:   required from ‘const Eigen::HouseholderQR<typename Eigen::DenseBase<Derived>::PlainObject> Eigen::MatrixBase<Derived>::householderQr() const [with Derived = Eigen::Matrix<double, -1, -1>; typename Eigen::DenseBase<Derived>::PlainObject = Eigen::Matrix<double, -1, -1>]’
filters.cpp:105:44:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>; SrcXprType = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>; SrcXprType = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>; Src = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>; Func = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:858:27:   required from ‘void Eigen::internal::call_assignment(Dst&, const Src&, const Func&, typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>; Src = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>; Func = sub_assign_op<double, double>; typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type = void*; typename evaluator_traits<SrcXprType>::Shape = Eigen::DenseShape]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:164:18:   required from ‘Derived& Eigen::MatrixBase<Derived>::operator-=(const Eigen::MatrixBase<OtherDerived>&) [with OtherDerived = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>; Derived = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixMatrix.h:457:31:   [ skipping 14 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:780:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>; SrcXprType = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>; SrcXprType = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>; Src = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>; Func = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:858:27:   required from ‘void Eigen::internal::call_assignment(Dst&, const Src&, const Func&, typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>; Src = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>; Func = sub_assign_op<double, double>; typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type = void*; typename evaluator_traits<SrcXprType>::Shape = Eigen::DenseShape]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:164:18:   required from ‘Derived& Eigen::MatrixBase<Derived>::operator-=(const Eigen::MatrixBase<OtherDerived>&) [with OtherDerived = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>; Derived = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixMatrix.h:457:31:   [ skipping 14 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:780:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true>; Src = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >; Func = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:858:27:   required from ‘void Eigen::internal::call_assignment(Dst&, const Src&, const Func&, typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true>; Src = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >; Func = sub_assign_op<double, double>; typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type = void*; typename evaluator_traits<SrcXprType>::Shape = Eigen::DenseShape]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:164:18:   required from ‘Derived& Eigen::MatrixBase<Derived>::operator-=(const Eigen::MatrixBase<OtherDerived>&) [with OtherDerived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >; Derived = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixMatrix.h:462:32:   [ skipping 14 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘Eigen::Index Eigen::internal::first_default_aligned(const Eigen::DenseBase<Derived>&) [with Derived = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >; Eigen::Index = long int]’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:243:63:   required from ‘static Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::Scalar Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::run(const Evaluator&, const Func&, const XprType&) [with XprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >; Func = Eigen::internal::scalar_sum_op<double, double>; Evaluator = Eigen::internal::redux_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> > >; Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:418:56:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::redux(const Func&) const [with BinaryOp = Eigen::internal::scalar_sum_op<double, double>; Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:463:25:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::sum() const [with Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:606:75:   required from ‘const Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, 1>, ProductTag, Eigen::DenseShape, Eigen::DenseShape>::CoeffReturnType Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, 1>, ProductTag, Eigen::DenseShape, Eigen::DenseShape>::coeff(Eigen::Index, Eigen::Index) const [with Lhs = Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >; Rhs = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>; int ProductTag = 3; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, 1>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, 1>::Lhs = Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, 1>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, 1>::Rhs = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>; CoeffReturnType = double; Eigen::Index = long int]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:654:63:   required from ‘void Eigen::internal::generic_dense_assignment_kernel<DstEvaluatorTypeT, SrcEvaluatorTypeT, Functor, Version>::assignCoeff(Eigen::Index, Eigen::Index) [with DstEvaluatorTypeT = Eigen::internal::evaluator<Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> > >; SrcEvaluatorTypeT = Eigen::internal::evaluator<Eigen::Product<Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, 1> >; Functor = Eigen::internal::assign_op<double, double>; int Version = 0; Eigen::Index = long int]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:668:16:   [ skipping 14 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:654:74: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  654 |   return internal::first_aligned<int(unpacket_traits<DefaultPacketType>::alignment),Derived>(m);
      |                                                                          ^~~~~~~~~
(cd TMB; /opt/R/4.4.0/lib/R/bin/Rscript \
--no-save --no-restore compile.R '')
using C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
make[1]: Entering directory '/tmp/workdir/tsissm/new/tsissm.Rcheck/00_pkg_src/tsissm/src/TMB'
g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG -I"/usr/local/lib/R/site-library/TMB/include" -I"/usr/local/lib/R/site-library/RcppEigen/include"   -DTMB_EIGEN_DISABLE_WARNINGS   -DTMB_LIB_INIT=R_init_tsissm_TMBExports  -DCPPAD_FRAMEWORK -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/TMB/include' -I'/usr/local/lib/R/site-library/RcppEigen/include' -I/usr/local/include    -fpic  -g -O2   -c tsissm_TMBExports.cpp -o tsissm_TMBExports.o
g++ -std=gnu++17 -shared -L/opt/R/4.4.0/lib/R/lib -L/usr/local/lib -o tsissm_TMBExports.so tsissm_TMBExports.o -L/opt/R/4.4.0/lib/R/lib -lR
make[1]: Leaving directory '/tmp/workdir/tsissm/new/tsissm.Rcheck/00_pkg_src/tsissm/src/TMB'
make[1]: Entering directory '/tmp/workdir/tsissm/new/tsissm.Rcheck/00_pkg_src/tsissm/src/TMB'
make[1]: Leaving directory '/tmp/workdir/tsissm/new/tsissm.Rcheck/00_pkg_src/tsissm/src/TMB'
[1] TRUE
g++ -std=gnu++17 -shared -L/opt/R/4.4.0/lib/R/lib -L/usr/local/lib -o tsissm.so RcppExports.o filters.o -L/opt/R/4.4.0/lib/R/lib -lR
installing to /tmp/workdir/tsissm/new/tsissm.Rcheck/00LOCK-tsissm/00new/tsissm/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘gsl’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘tsissm’
* removing ‘/tmp/workdir/tsissm/new/tsissm.Rcheck/tsissm’


```
### CRAN

```
* installing *source* package ‘tsissm’ ...
** package ‘tsissm’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/TMB/include' -I'/usr/local/lib/R/site-library/RcppEigen/include' -I/usr/local/include    -fpic  -g -O2   -c RcppExports.cpp -o RcppExports.o
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:205,
                 from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Dense:1,
                 from /usr/local/lib/R/site-library/RcppEigen/include/RcppEigenForward.h:28,
                 from /usr/local/lib/R/site-library/RcppEigen/include/RcppEigen.h:25,
                 from RcppExports.cpp:4:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:46:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   46 | typedef eigen_packet_wrapper<__m128i, 0> Packet4i;
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:47:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   47 | typedef eigen_packet_wrapper<__m128i, 1> Packet16b;
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:49:39: warning: ignoring attributes on template argument ‘__m128’ [-Wignored-attributes]
   49 | template<> struct is_arithmetic<__m128>  { enum { value = true }; };
      |                                       ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:50:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   50 | template<> struct is_arithmetic<__m128i> { enum { value = true }; };
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:51:40: warning: ignoring attributes on template argument ‘__m128d’ [-Wignored-attributes]
   51 | template<> struct is_arithmetic<__m128d> { enum { value = true }; };
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:222:43: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
  222 | template<> struct unpacket_traits<Packet4f> {
      |                                           ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:228:43: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
  228 | template<> struct unpacket_traits<Packet2d> {
      |                                           ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:1124:34: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
 1124 | ptranspose(PacketBlock<Packet4f,4>& kernel) {
      |                                  ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:1129:34: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
 1129 | ptranspose(PacketBlock<Packet2d,2>& kernel) {
      |                                  ^
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:174:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:16:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
   16 |   struct conj_helper<PACKET_REAL, PACKET_CPLX, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:173:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  173 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet2cf,Packet4f)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:29:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
   29 |   struct conj_helper<PACKET_CPLX, PACKET_REAL, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:173:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  173 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet2cf,Packet4f)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:16:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
   16 |   struct conj_helper<PACKET_REAL, PACKET_CPLX, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:298:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  298 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet1cd,Packet2d)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:29:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
   29 |   struct conj_helper<PACKET_CPLX, PACKET_REAL, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:298:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  298 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet1cd,Packet2d)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:165:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h: In instantiation of ‘struct Eigen::internal::find_best_packet<float, 4>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:22:57:   required from ‘struct Eigen::internal::traits<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:266:49:   required from ‘struct Eigen::internal::traits<Eigen::Quaternion<float> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:24:46:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:44: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::unpacket_traits<__vector(4) float>::half’ {aka ‘__m128’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:208:88: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  208 |   typedef typename find_best_packet_helper<Size,typename packet_traits<T>::type>::type type;
      |                                                                                        ^~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:271:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<float, 4, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:46:50:   required from ‘class Eigen::QuaternionBase<Eigen::Quaternion<float> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:273:7:   required from ‘class Eigen::Quaternion<float>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:27:3:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h: In instantiation of ‘struct Eigen::internal::find_best_packet<double, 4>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:22:57:   required from ‘struct Eigen::internal::traits<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:266:49:   required from ‘struct Eigen::internal::traits<Eigen::Quaternion<double> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:98:47:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:44: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::unpacket_traits<__vector(2) double>::half’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:208:88: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  208 |   typedef typename find_best_packet_helper<Size,typename packet_traits<T>::type>::type type;
      |                                                                                        ^~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, 4, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:46:50:   required from ‘class Eigen::QuaternionBase<Eigen::Quaternion<double> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:273:7:   required from ‘class Eigen::Quaternion<double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:102:3:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/SparseCore:37,
                 from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Sparse:26,
                 from /usr/local/lib/R/site-library/RcppEigen/include/RcppEigenForward.h:29:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h: In instantiation of ‘class Eigen::SparseMatrixBase<Eigen::SparseMatrix<double, 0, int> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseCompressedBase.h:36:7:   required from ‘class Eigen::SparseCompressedBase<Eigen::SparseMatrix<double, 0, int> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrix.h:96:7:   required from ‘class Eigen::SparseMatrix<double, 0, int>’
/usr/local/lib/R/site-library/RcppEigen/include/unsupported/Eigen/src/IterativeSolvers/ConstrainedConjGrad.h:61:25:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h:47:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   47 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h: In instantiation of ‘struct Eigen::internal::find_best_packet<double, -1>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:22:57:   required from ‘struct Eigen::internal::traits<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Map.h:18:8:   required from ‘struct Eigen::internal::traits<Eigen::Map<Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/ForwardDeclarations.h:32:48:   required from ‘struct Eigen::internal::accessors_level<Eigen::Map<Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/ForwardDeclarations.h:111:75:   required from ‘class Eigen::Map<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/Rcpp/include/Rcpp/InputParameter.h:77:11:   required from ‘class Rcpp::ConstReferenceInputParameter<Eigen::Map<Eigen::Matrix<double, -1, 1> > >’
RcppExports.cpp:20:86:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:44: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::unpacket_traits<__vector(2) double>::half’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:208:88: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  208 |   typedef typename find_best_packet_helper<Size,typename packet_traits<T>::type>::type type;
      |                                                                                        ^~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, -1, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Map.h:24:49:   required from ‘struct Eigen::internal::traits<Eigen::Map<Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/ForwardDeclarations.h:32:48:   required from ‘struct Eigen::internal::accessors_level<Eigen::Map<Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/ForwardDeclarations.h:111:75:   required from ‘class Eigen::Map<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/Rcpp/include/Rcpp/InputParameter.h:77:11:   required from ‘class Rcpp::ConstReferenceInputParameter<Eigen::Map<Eigen::Matrix<double, -1, 1> > >’
RcppExports.cpp:20:86:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, 1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, 1> >, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, 1> >, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Map<Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Map<Eigen::Matrix<double, -1, 1> >, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:223:34:   required from ‘class Eigen::MapBase<Eigen::Map<Eigen::Matrix<double, -1, 1> >, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Map.h:94:79:   required from ‘class Eigen::Map<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/Rcpp/include/Rcpp/InputParameter.h:77:11:   required from ‘class Rcpp::ConstReferenceInputParameter<Eigen::Map<Eigen::Matrix<double, -1, 1> > >’
RcppExports.cpp:20:86:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, -1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, -1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, -1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, -1, -1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Map.h:24:49:   required from ‘struct Eigen::internal::traits<Eigen::Map<Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/ForwardDeclarations.h:32:48:   required from ‘struct Eigen::internal::accessors_level<Eigen::Map<Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/ForwardDeclarations.h:111:75:   required from ‘class Eigen::Map<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/Rcpp/include/Rcpp/InputParameter.h:77:11:   required from ‘class Rcpp::ConstReferenceInputParameter<Eigen::Map<Eigen::Matrix<double, -1, -1> > >’
RcppExports.cpp:23:86:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, -1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, -1> >, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, -1> >, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Map<Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Map<Eigen::Matrix<double, -1, -1> >, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:223:34:   required from ‘class Eigen::MapBase<Eigen::Map<Eigen::Matrix<double, -1, -1> >, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Map.h:94:79:   required from ‘class Eigen::Map<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/Rcpp/include/Rcpp/InputParameter.h:77:11:   required from ‘class Rcpp::ConstReferenceInputParameter<Eigen::Map<Eigen::Matrix<double, -1, -1> > >’
RcppExports.cpp:23:86:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG  -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/TMB/include' -I'/usr/local/lib/R/site-library/RcppEigen/include' -I/usr/local/include    -fpic  -g -O2   -c filters.cpp -o filters.o
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:205,
                 from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Dense:1,
                 from /usr/local/lib/R/site-library/RcppEigen/include/RcppEigenForward.h:28,
                 from /usr/local/lib/R/site-library/RcppEigen/include/RcppEigen.h:25,
                 from filters.cpp:1:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:46:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   46 | typedef eigen_packet_wrapper<__m128i, 0> Packet4i;
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:47:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   47 | typedef eigen_packet_wrapper<__m128i, 1> Packet16b;
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:49:39: warning: ignoring attributes on template argument ‘__m128’ [-Wignored-attributes]
   49 | template<> struct is_arithmetic<__m128>  { enum { value = true }; };
      |                                       ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:50:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   50 | template<> struct is_arithmetic<__m128i> { enum { value = true }; };
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:51:40: warning: ignoring attributes on template argument ‘__m128d’ [-Wignored-attributes]
   51 | template<> struct is_arithmetic<__m128d> { enum { value = true }; };
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:222:43: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
  222 | template<> struct unpacket_traits<Packet4f> {
      |                                           ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:228:43: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
  228 | template<> struct unpacket_traits<Packet2d> {
      |                                           ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:1124:34: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
 1124 | ptranspose(PacketBlock<Packet4f,4>& kernel) {
      |                                  ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:1129:34: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
 1129 | ptranspose(PacketBlock<Packet2d,2>& kernel) {
      |                                  ^
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:174:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:16:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
   16 |   struct conj_helper<PACKET_REAL, PACKET_CPLX, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:173:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  173 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet2cf,Packet4f)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:29:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
   29 |   struct conj_helper<PACKET_CPLX, PACKET_REAL, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:173:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  173 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet2cf,Packet4f)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:16:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
   16 |   struct conj_helper<PACKET_REAL, PACKET_CPLX, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:298:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  298 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet1cd,Packet2d)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:29:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
   29 |   struct conj_helper<PACKET_CPLX, PACKET_REAL, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:298:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  298 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet1cd,Packet2d)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:165:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h: In instantiation of ‘struct Eigen::internal::find_best_packet<float, 4>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:22:57:   required from ‘struct Eigen::internal::traits<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:266:49:   required from ‘struct Eigen::internal::traits<Eigen::Quaternion<float> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:24:46:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:44: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::unpacket_traits<__vector(4) float>::half’ {aka ‘__m128’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:208:88: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  208 |   typedef typename find_best_packet_helper<Size,typename packet_traits<T>::type>::type type;
      |                                                                                        ^~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:271:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<float, 4, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:46:50:   required from ‘class Eigen::QuaternionBase<Eigen::Quaternion<float> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:273:7:   required from ‘class Eigen::Quaternion<float>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:27:3:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h: In instantiation of ‘struct Eigen::internal::find_best_packet<double, 4>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:22:57:   required from ‘struct Eigen::internal::traits<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:266:49:   required from ‘struct Eigen::internal::traits<Eigen::Quaternion<double> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:98:47:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:44: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::unpacket_traits<__vector(2) double>::half’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:208:88: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  208 |   typedef typename find_best_packet_helper<Size,typename packet_traits<T>::type>::type type;
      |                                                                                        ^~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, 4, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:46:50:   required from ‘class Eigen::QuaternionBase<Eigen::Quaternion<double> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:273:7:   required from ‘class Eigen::Quaternion<double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:102:3:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/SparseCore:37,
                 from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Sparse:26,
                 from /usr/local/lib/R/site-library/RcppEigen/include/RcppEigenForward.h:29:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h: In instantiation of ‘class Eigen::SparseMatrixBase<Eigen::SparseMatrix<double, 0, int> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseCompressedBase.h:36:7:   required from ‘class Eigen::SparseCompressedBase<Eigen::SparseMatrix<double, 0, int> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrix.h:96:7:   required from ‘class Eigen::SparseMatrix<double, 0, int>’
/usr/local/lib/R/site-library/RcppEigen/include/unsupported/Eigen/src/IterativeSolvers/ConstrainedConjGrad.h:61:25:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h:47:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   47 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h: In instantiation of ‘struct Eigen::internal::find_best_packet<double, -1>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:22:57:   required from ‘struct Eigen::internal::traits<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, -1, 1>’
filters.cpp:6:76:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:44: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::unpacket_traits<__vector(2) double>::half’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:208:88: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  208 |   typedef typename find_best_packet_helper<Size,typename packet_traits<T>::type>::type type;
      |                                                                                        ^~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, -1, 1>’
filters.cpp:6:76:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayWrapper.h:42:7:   required from ‘class Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >’
filters.cpp:9:20:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseUnaryOp.h:94:7:   required from ‘class Eigen::CwiseUnaryOpImpl<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseUnaryOp.h:55:7:   required from ‘class Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >’
filters.cpp:9:26:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseNullaryOp.h:60:7:   required from ‘class Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:38:28:   required from ‘struct Eigen::internal::traits<Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >’
filters.cpp:11:17:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >’
filters.cpp:11:17:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Array<double, -1, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Array<double, -1, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Array<double, -1, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Array<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::Array<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Array<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Array.h:45:7:   required from ‘class Eigen::Array<double, -1, 1>’
filters.cpp:11:39:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >’
filters.cpp:11:39:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_quotient_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_quotient_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_quotient_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_quotient_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_quotient_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_pow_op<double, double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >’
filters.cpp:11:46:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, -1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, -1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, -1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, -1, -1>’
filters.cpp:16:78:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Map<const Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Map<const Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Map<const Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Map<const Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Map<const Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Map.h:94:79:   required from ‘class Eigen::Map<const Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >’
filters.cpp:18:68:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:223:34:   required from ‘class Eigen::MapBase<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Map.h:94:79:   required from ‘class Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >’
filters.cpp:35:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Block<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Block<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Block<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false>, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:223:34:   required from ‘class Eigen::MapBase<Eigen::Block<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:329:7:   required from ‘class Eigen::internal::BlockImpl_dense<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false, true>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:154:7:   required from ‘class Eigen::BlockImpl<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:103:81:   required from ‘class Eigen::Block<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/VectorBlock.h:56:47:   required from ‘class Eigen::VectorBlock<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1>’
filters.cpp:51:38:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayWrapper.h:42:7:   required from ‘class Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >’
filters.cpp:59:34:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >’
filters.cpp:59:48:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >’
filters.cpp:59:61:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::MatrixWrapper<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::MatrixWrapper<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::MatrixWrapper<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayWrapper.h:140:7:   required from ‘class Eigen::MatrixWrapper<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > >, const Eigen::ArrayWrapper<Eigen::Matrix<double, -1, -1> > > >’
filters.cpp:59:70:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Transpose<Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Transpose<Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:118:37:   required from ‘class Eigen::TransposeImpl<Eigen::Matrix<double, -1, -1>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<Eigen::Matrix<double, -1, -1> >’
filters.cpp:65:46:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:120:7:   required from ‘class Eigen::internal::dense_product_base<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0, 8>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:152:7:   required from ‘class Eigen::ProductImpl<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:71:7:   required from ‘class Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0>’
filters.cpp:65:47:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::Matrix<double, -1, -1>, const Eigen::Matrix<double, -1, -1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::Matrix<double, -1, -1>, const Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::Matrix<double, -1, -1>, const Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_difference_op<double, double>, const Eigen::Matrix<double, -1, -1>, const Eigen::Matrix<double, -1, -1>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::Matrix<double, -1, -1>, const Eigen::Matrix<double, -1, -1> >’
filters.cpp:66:29:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 3>’
...
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:429:10:   required from ‘const Eigen::HouseholderQR<typename Eigen::DenseBase<Derived>::PlainObject> Eigen::MatrixBase<Derived>::householderQr() const [with Derived = Eigen::Matrix<double, -1, -1>; typename Eigen::DenseBase<Derived>::PlainObject = Eigen::Matrix<double, -1, -1>]’
filters.cpp:105:44:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixMatrix.h:462:59:   required from ‘static void Eigen::internal::triangular_product_impl<Mode, LhsIsTriangular, Lhs, false, Rhs, false>::run(Dest&, const Lhs&, const Rhs&, const typename Dest::Scalar&) [with Dest = Eigen::Matrix<double, -1, -1>; int Mode = 1; bool LhsIsTriangular = true; Lhs = const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >; Rhs = Eigen::Matrix<double, -1, -1>; typename Dest::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:770:14:   [ skipping 13 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:350:44:   required from ‘static void Eigen::internal::householder_qr_inplace_blocked<MatrixQR, HCoeffs, MatrixQRScalar, InnerStrideIsOne>::run(MatrixQR&, HCoeffs&, Eigen::Index, typename MatrixQR::Scalar*) [with MatrixQR = Eigen::Matrix<double, -1, -1>; HCoeffs = Eigen::Matrix<double, -1, 1>; MatrixQRScalar = double; bool InnerStrideIsOne = true; Eigen::Index = long int; typename MatrixQR::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:416:73:   required from ‘void Eigen::HouseholderQR<MatrixType>::computeInPlace() [with _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:181:7:   required from ‘Eigen::HouseholderQR<MatrixType>& Eigen::HouseholderQR<MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:114:14:   required from ‘Eigen::HouseholderQR<MatrixType>::HouseholderQR(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:429:10:   required from ‘const Eigen::HouseholderQR<typename Eigen::DenseBase<Derived>::PlainObject> Eigen::MatrixBase<Derived>::householderQr() const [with Derived = Eigen::Matrix<double, -1, -1>; typename Eigen::DenseBase<Derived>::PlainObject = Eigen::Matrix<double, -1, -1>]’
filters.cpp:105:44:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:223:34:   [ skipping 18 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixMatrix.h:457:59:   required from ‘static void Eigen::internal::triangular_product_impl<Mode, LhsIsTriangular, Lhs, false, Rhs, false>::run(Dest&, const Lhs&, const Rhs&, const typename Dest::Scalar&) [with Dest = Eigen::Matrix<double, -1, -1, 0, -1, 1>; int Mode = 6; bool LhsIsTriangular = true; Lhs = const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >; Rhs = Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>; typename Dest::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:770:14:   [ skipping 13 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:172:103:   required from ‘class Eigen::internal::BlockImpl_dense<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false, false>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:154:7:   required from ‘class Eigen::BlockImpl<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:103:81:   required from ‘class Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixMatrix.h:457:74:   [ skipping 14 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true>, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:223:34:   [ skipping 18 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >, -1, 1, true> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, 1, -1, false> >, const Eigen::Block<const Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >, -1, 1, true> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   required from ‘struct Eigen::internal::evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, 1, -1, false> >, const Eigen::Block<const Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:357:7:   required from ‘class Eigen::internal::redux_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, 1, -1, false> >, const Eigen::Block<const Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:414:17:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::redux(const Func&) const [with BinaryOp = Eigen::internal::scalar_sum_op<double, double>; Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, 1, -1, false> >, const Eigen::Block<const Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >, -1, 1, true> >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:463:25:   [ skipping 13 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_sum_op<double, double>, const Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >, 0>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Ref<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> > > >; Functor = Eigen::internal::assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false>; Src = Eigen::CwiseBinaryOp<scalar_sum_op<double, double>, const Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >, 0>, const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::Ref<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> > > >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:858:27:   required from ‘void Eigen::internal::call_assignment(Dst&, const Src&, const Func&, typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false>; Src = Eigen::CwiseBinaryOp<scalar_sum_op<double, double>, const Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >, 0>, const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::Ref<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> > > >; Func = assign_op<double, double>; typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type = void*; typename evaluator_traits<SrcXprType>::Shape = Eigen::DenseShape]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:836:18:   required from ‘void Eigen::internal::call_assignment(Dst&, const Src&) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false>; Src = Eigen::CwiseBinaryOp<scalar_sum_op<double, double>, const Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >, 0>, const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::Ref<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> > > >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Assign.h:66:28:   required from ‘Derived& Eigen::MatrixBase<Derived>::operator=(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_sum_op<double, double>, const Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false> >, 0>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Ref<const Eigen::Matrix<double, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> > > >; Derived = Eigen::Block<Eigen::Matrix<double, -1, -1>, 1, -1, false>]’
filters.cpp:163:62:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
 1071 |     PacketAlignment = unpacket_traits<PacketScalar>::alignment,
      |                                                      ^~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘Eigen::Index Eigen::internal::first_default_aligned(const Eigen::DenseBase<Derived>&) [with Derived = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::Block<const Eigen::Block<const Eigen::Map<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, 0, Eigen::OuterStride<> >, 1, -1, true>, 1, -1, false>, const Eigen::Transpose<const Eigen::Block<const Eigen::Map<const Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false> > >; Eigen::Index = long int]’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:243:63:   required from ‘static Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::Scalar Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::run(const Evaluator&, const Func&, const XprType&) [with XprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Block<const Eigen::Block<const Eigen::Map<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, 0, Eigen::OuterStride<> >, 1, -1, true>, 1, -1, false>, const Eigen::Transpose<const Eigen::Block<const Eigen::Map<const Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false> > >; Func = Eigen::internal::scalar_sum_op<double, double>; Evaluator = Eigen::internal::redux_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Block<const Eigen::Block<const Eigen::Map<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, 0, Eigen::OuterStride<> >, 1, -1, true>, 1, -1, false>, const Eigen::Transpose<const Eigen::Block<const Eigen::Map<const Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false> > > >; Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:418:56:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::redux(const Func&) const [with BinaryOp = Eigen::internal::scalar_sum_op<double, double>; Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Block<const Eigen::Block<const Eigen::Map<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, 0, Eigen::OuterStride<> >, 1, -1, true>, 1, -1, false>, const Eigen::Transpose<const Eigen::Block<const Eigen::Map<const Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false> > >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:463:25:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::sum() const [with Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Block<const Eigen::Block<const Eigen::Map<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, 0, Eigen::OuterStride<> >, 1, -1, true>, 1, -1, false>, const Eigen::Transpose<const Eigen::Block<const Eigen::Map<const Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> >, -1, 1, false> > >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixVector.h:137:114:   required from ‘static void Eigen::internal::triangular_matrix_vector_product<Index, Mode, LhsScalar, ConjLhs, RhsScalar, ConjRhs, 1, Version>::run(Index, Index, const LhsScalar*, Index, const RhsScalar*, Index, ResScalar*, Index, const ResScalar&) [with Index = long int; int Mode = 6; LhsScalar = double; bool ConjLhs = false; RhsScalar = double; bool ConjRhs = false; int Version = 0; ResScalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixVector.h:332:12:   required from ‘static void Eigen::internal::trmv_selector<Mode, 1>::run(const Lhs&, const Rhs&, Dest&, const typename Dest::Scalar&) [with Lhs = Eigen::Transpose<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, -1, false> >; Rhs = Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >; Dest = Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >; int Mode = 6; typename Dest::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixVector.h:194:18:   [ skipping 9 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:350:44:   required from ‘static void Eigen::internal::householder_qr_inplace_blocked<MatrixQR, HCoeffs, MatrixQRScalar, InnerStrideIsOne>::run(MatrixQR&, HCoeffs&, Eigen::Index, typename MatrixQR::Scalar*) [with MatrixQR = Eigen::Matrix<double, -1, -1>; HCoeffs = Eigen::Matrix<double, -1, 1>; MatrixQRScalar = double; bool InnerStrideIsOne = true; Eigen::Index = long int; typename MatrixQR::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:416:73:   required from ‘void Eigen::HouseholderQR<MatrixType>::computeInPlace() [with _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:181:7:   required from ‘Eigen::HouseholderQR<MatrixType>& Eigen::HouseholderQR<MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:114:14:   required from ‘Eigen::HouseholderQR<MatrixType>::HouseholderQR(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:429:10:   required from ‘const Eigen::HouseholderQR<typename Eigen::DenseBase<Derived>::PlainObject> Eigen::MatrixBase<Derived>::householderQr() const [with Derived = Eigen::Matrix<double, -1, -1>; typename Eigen::DenseBase<Derived>::PlainObject = Eigen::Matrix<double, -1, -1>]’
filters.cpp:105:44:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:654:74: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  654 |   return internal::first_aligned<int(unpacket_traits<DefaultPacketType>::alignment),Derived>(m);
      |                                                                          ^~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1043:41:   required from ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:311:41:   required from ‘struct Eigen::internal::unary_evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> >, Eigen::internal::IndexBased, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:90:8:   required from ‘struct Eigen::internal::evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   [ skipping 28 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:350:44:   required from ‘static void Eigen::internal::householder_qr_inplace_blocked<MatrixQR, HCoeffs, MatrixQRScalar, InnerStrideIsOne>::run(MatrixQR&, HCoeffs&, Eigen::Index, typename MatrixQR::Scalar*) [with MatrixQR = Eigen::Matrix<double, -1, -1>; HCoeffs = Eigen::Matrix<double, -1, 1>; MatrixQRScalar = double; bool InnerStrideIsOne = true; Eigen::Index = long int; typename MatrixQR::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:416:73:   required from ‘void Eigen::HouseholderQR<MatrixType>::computeInPlace() [with _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:181:7:   required from ‘Eigen::HouseholderQR<MatrixType>& Eigen::HouseholderQR<MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:114:14:   required from ‘Eigen::HouseholderQR<MatrixType>::HouseholderQR(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:429:10:   required from ‘const Eigen::HouseholderQR<typename Eigen::DenseBase<Derived>::PlainObject> Eigen::MatrixBase<Derived>::householderQr() const [with Derived = Eigen::Matrix<double, -1, -1>; typename Eigen::DenseBase<Derived>::PlainObject = Eigen::Matrix<double, -1, -1>]’
filters.cpp:105:44:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
 1071 |     PacketAlignment = unpacket_traits<PacketScalar>::alignment,
      |                                                      ^~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:311:41:   required from ‘struct Eigen::internal::unary_evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> >, Eigen::internal::IndexBased, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:90:8:   required from ‘struct Eigen::internal::evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   [ skipping 26 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:350:44:   required from ‘static void Eigen::internal::householder_qr_inplace_blocked<MatrixQR, HCoeffs, MatrixQRScalar, InnerStrideIsOne>::run(MatrixQR&, HCoeffs&, Eigen::Index, typename MatrixQR::Scalar*) [with MatrixQR = Eigen::Matrix<double, -1, -1>; HCoeffs = Eigen::Matrix<double, -1, 1>; MatrixQRScalar = double; bool InnerStrideIsOne = true; Eigen::Index = long int; typename MatrixQR::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:416:73:   required from ‘void Eigen::HouseholderQR<MatrixType>::computeInPlace() [with _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:181:7:   required from ‘Eigen::HouseholderQR<MatrixType>& Eigen::HouseholderQR<MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:114:14:   required from ‘Eigen::HouseholderQR<MatrixType>::HouseholderQR(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:429:10:   required from ‘const Eigen::HouseholderQR<typename Eigen::DenseBase<Derived>::PlainObject> Eigen::MatrixBase<Derived>::householderQr() const [with Derived = Eigen::Matrix<double, -1, -1>; typename Eigen::DenseBase<Derived>::PlainObject = Eigen::Matrix<double, -1, -1>]’
filters.cpp:105:44:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   required from ‘struct Eigen::internal::evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   [ skipping 13 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:350:44:   required from ‘static void Eigen::internal::householder_qr_inplace_blocked<MatrixQR, HCoeffs, MatrixQRScalar, InnerStrideIsOne>::run(MatrixQR&, HCoeffs&, Eigen::Index, typename MatrixQR::Scalar*) [with MatrixQR = Eigen::Matrix<double, -1, -1>; HCoeffs = Eigen::Matrix<double, -1, 1>; MatrixQRScalar = double; bool InnerStrideIsOne = true; Eigen::Index = long int; typename MatrixQR::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:416:73:   required from ‘void Eigen::HouseholderQR<MatrixType>::computeInPlace() [with _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:181:7:   required from ‘Eigen::HouseholderQR<MatrixType>& Eigen::HouseholderQR<MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:114:14:   required from ‘Eigen::HouseholderQR<MatrixType>::HouseholderQR(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:429:10:   required from ‘const Eigen::HouseholderQR<typename Eigen::DenseBase<Derived>::PlainObject> Eigen::MatrixBase<Derived>::householderQr() const [with Derived = Eigen::Matrix<double, -1, -1>; typename Eigen::DenseBase<Derived>::PlainObject = Eigen::Matrix<double, -1, -1>]’
filters.cpp:105:44:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:780:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; Src = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Func = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:858:27:   required from ‘void Eigen::internal::call_assignment(Dst&, const Src&, const Func&, typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type) [with Dst = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; Src = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Func = sub_assign_op<double, double>; typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type = void*; typename evaluator_traits<SrcXprType>::Shape = Eigen::DenseShape]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:164:18:   required from ‘Derived& Eigen::MatrixBase<Derived>::operator-=(const Eigen::MatrixBase<OtherDerived>&) [with OtherDerived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Derived = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixVector.h:341:27:   [ skipping 10 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:350:44:   required from ‘static void Eigen::internal::householder_qr_inplace_blocked<MatrixQR, HCoeffs, MatrixQRScalar, InnerStrideIsOne>::run(MatrixQR&, HCoeffs&, Eigen::Index, typename MatrixQR::Scalar*) [with MatrixQR = Eigen::Matrix<double, -1, -1>; HCoeffs = Eigen::Matrix<double, -1, 1>; MatrixQRScalar = double; bool InnerStrideIsOne = true; Eigen::Index = long int; typename MatrixQR::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:416:73:   required from ‘void Eigen::HouseholderQR<MatrixType>::computeInPlace() [with _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:181:7:   required from ‘Eigen::HouseholderQR<MatrixType>& Eigen::HouseholderQR<MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:114:14:   required from ‘Eigen::HouseholderQR<MatrixType>::HouseholderQR(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:429:10:   required from ‘const Eigen::HouseholderQR<typename Eigen::DenseBase<Derived>::PlainObject> Eigen::MatrixBase<Derived>::householderQr() const [with Derived = Eigen::Matrix<double, -1, -1>; typename Eigen::DenseBase<Derived>::PlainObject = Eigen::Matrix<double, -1, -1>]’
filters.cpp:105:44:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>; SrcXprType = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false>; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>; SrcXprType = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false>; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>; Src = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false>; Func = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:858:27:   required from ‘void Eigen::internal::call_assignment(Dst&, const Src&, const Func&, typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>; Src = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false>; Func = sub_assign_op<double, double>; typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type = void*; typename evaluator_traits<SrcXprType>::Shape = Eigen::DenseShape]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:164:18:   required from ‘Derived& Eigen::MatrixBase<Derived>::operator-=(const Eigen::MatrixBase<OtherDerived>&) [with OtherDerived = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false>; Derived = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixMatrix.h:457:31:   [ skipping 10 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:350:44:   required from ‘static void Eigen::internal::householder_qr_inplace_blocked<MatrixQR, HCoeffs, MatrixQRScalar, InnerStrideIsOne>::run(MatrixQR&, HCoeffs&, Eigen::Index, typename MatrixQR::Scalar*) [with MatrixQR = Eigen::Matrix<double, -1, -1>; HCoeffs = Eigen::Matrix<double, -1, 1>; MatrixQRScalar = double; bool InnerStrideIsOne = true; Eigen::Index = long int; typename MatrixQR::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:416:73:   required from ‘void Eigen::HouseholderQR<MatrixType>::computeInPlace() [with _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:181:7:   required from ‘Eigen::HouseholderQR<MatrixType>& Eigen::HouseholderQR<MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:114:14:   required from ‘Eigen::HouseholderQR<MatrixType>::HouseholderQR(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:429:10:   required from ‘const Eigen::HouseholderQR<typename Eigen::DenseBase<Derived>::PlainObject> Eigen::MatrixBase<Derived>::householderQr() const [with Derived = Eigen::Matrix<double, -1, -1>; typename Eigen::DenseBase<Derived>::PlainObject = Eigen::Matrix<double, -1, -1>]’
filters.cpp:105:44:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   required from ‘struct Eigen::internal::evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   [ skipping 13 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:350:44:   required from ‘static void Eigen::internal::householder_qr_inplace_blocked<MatrixQR, HCoeffs, MatrixQRScalar, InnerStrideIsOne>::run(MatrixQR&, HCoeffs&, Eigen::Index, typename MatrixQR::Scalar*) [with MatrixQR = Eigen::Matrix<double, -1, -1>; HCoeffs = Eigen::Matrix<double, -1, 1>; MatrixQRScalar = double; bool InnerStrideIsOne = true; Eigen::Index = long int; typename MatrixQR::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:416:73:   required from ‘void Eigen::HouseholderQR<MatrixType>::computeInPlace() [with _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:181:7:   required from ‘Eigen::HouseholderQR<MatrixType>& Eigen::HouseholderQR<MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:114:14:   required from ‘Eigen::HouseholderQR<MatrixType>::HouseholderQR(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:429:10:   required from ‘const Eigen::HouseholderQR<typename Eigen::DenseBase<Derived>::PlainObject> Eigen::MatrixBase<Derived>::householderQr() const [with Derived = Eigen::Matrix<double, -1, -1>; typename Eigen::DenseBase<Derived>::PlainObject = Eigen::Matrix<double, -1, -1>]’
filters.cpp:105:44:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true>, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true>, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:329:7:   required from ‘class Eigen::internal::BlockImpl_dense<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true, true>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:154:7:   [ skipping 18 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:118:37:   required from ‘class Eigen::TransposeImpl<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:606:37:   [ skipping 16 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true>, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true>, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:329:7:   required from ‘class Eigen::internal::BlockImpl_dense<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true, true>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:154:7:   [ skipping 18 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:606:52:   required from ‘const Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, 1>, ProductTag, Eigen::DenseShape, Eigen::DenseShape>::CoeffReturnType Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, 1>, ProductTag, Eigen::DenseShape, Eigen::DenseShape>::coeff(Eigen::Index, Eigen::Index) const [with Lhs = Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >; Rhs = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>; int ProductTag = 3; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, 1>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, 1>::Lhs = Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, 1>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, 1>::Rhs = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>; CoeffReturnType = double; Eigen::Index = long int]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:654:63:   [ skipping 15 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false>, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false>, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:329:7:   required from ‘class Eigen::internal::BlockImpl_dense<const Eigen::Matrix<double, -1, 1>, 1, 1, false, true>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:154:7:   [ skipping 18 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:118:37:   required from ‘class Eigen::TransposeImpl<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:606:37:   [ skipping 16 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false>, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false>, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:329:7:   required from ‘class Eigen::internal::BlockImpl_dense<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false, true>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:154:7:   [ skipping 18 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:606:52:   required from ‘const Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, 1>, ProductTag, Eigen::DenseShape, Eigen::DenseShape>::CoeffReturnType Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, 1>, ProductTag, Eigen::DenseShape, Eigen::DenseShape>::coeff(Eigen::Index, Eigen::Index) const [with Lhs = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >; Rhs = Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >; int ProductTag = 4; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, 1>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, 1>::Lhs = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, 1>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, 1>::Rhs = Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >; CoeffReturnType = double; Eigen::Index = long int]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:654:63:   [ skipping 15 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, -1, -1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>; SrcXprType = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, -1, -1, false>; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>; SrcXprType = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, -1, -1, false>; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>; Src = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, -1, -1, false>; Func = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:858:27:   required from ‘void Eigen::internal::call_assignment(Dst&, const Src&, const Func&, typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type) [with Dst = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>; Src = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, -1, -1, false>; Func = sub_assign_op<double, double>; typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type = void*; typename evaluator_traits<SrcXprType>::Shape = Eigen::DenseShape]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:164:18:   required from ‘Derived& Eigen::MatrixBase<Derived>::operator-=(const Eigen::MatrixBase<OtherDerived>&) [with OtherDerived = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, -1, -1, false>; Derived = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixMatrix.h:457:31:   [ skipping 12 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
 1071 |     PacketAlignment = unpacket_traits<PacketScalar>::alignment,
      |                                                      ^~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, true> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:780:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, -1, true> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, -1, true> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, true>; Src = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, -1, true> >; Func = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:858:27:   required from ‘void Eigen::internal::call_assignment(Dst&, const Src&, const Func&, typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type) [with Dst = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, true>; Src = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, -1, true> >; Func = sub_assign_op<double, double>; typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type = void*; typename evaluator_traits<SrcXprType>::Shape = Eigen::DenseShape]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:164:18:   required from ‘Derived& Eigen::MatrixBase<Derived>::operator-=(const Eigen::MatrixBase<OtherDerived>&) [with OtherDerived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, -1, true> >; Derived = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, true>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixMatrix.h:462:32:   [ skipping 12 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:311:41:   required from ‘struct Eigen::internal::unary_evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, Eigen::internal::IndexBased, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:90:8:   required from ‘struct Eigen::internal::evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:41:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   [ skipping 20 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   required from ‘struct Eigen::internal::evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:357:7:   required from ‘class Eigen::internal::redux_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:414:17:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::redux(const Func&) const [with BinaryOp = Eigen::internal::scalar_sum_op<double, double>; Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:463:25:   [ skipping 17 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:311:41:   required from ‘struct Eigen::internal::unary_evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, Eigen::internal::IndexBased, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:90:8:   required from ‘struct Eigen::internal::evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:41:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   [ skipping 20 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   required from ‘struct Eigen::internal::evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:357:7:   required from ‘class Eigen::internal::redux_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:414:17:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::redux(const Func&) const [with BinaryOp = Eigen::internal::scalar_sum_op<double, double>; Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, 1>, 1, 1, false> >, const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> >, 1, 1, false> >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:463:25:   [ skipping 17 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   required from ‘struct Eigen::internal::evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   [ skipping 17 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:350:44:   required from ‘static void Eigen::internal::householder_qr_inplace_blocked<MatrixQR, HCoeffs, MatrixQRScalar, InnerStrideIsOne>::run(MatrixQR&, HCoeffs&, Eigen::Index, typename MatrixQR::Scalar*) [with MatrixQR = Eigen::Matrix<double, -1, -1>; HCoeffs = Eigen::Matrix<double, -1, 1>; MatrixQRScalar = double; bool InnerStrideIsOne = true; Eigen::Index = long int; typename MatrixQR::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:416:73:   required from ‘void Eigen::HouseholderQR<MatrixType>::computeInPlace() [with _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:181:7:   required from ‘Eigen::HouseholderQR<MatrixType>& Eigen::HouseholderQR<MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:114:14:   required from ‘Eigen::HouseholderQR<MatrixType>::HouseholderQR(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:429:10:   required from ‘const Eigen::HouseholderQR<typename Eigen::DenseBase<Derived>::PlainObject> Eigen::MatrixBase<Derived>::householderQr() const [with Derived = Eigen::Matrix<double, -1, -1>; typename Eigen::DenseBase<Derived>::PlainObject = Eigen::Matrix<double, -1, -1>]’
filters.cpp:105:44:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   required from ‘struct Eigen::internal::evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   [ skipping 17 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:350:44:   required from ‘static void Eigen::internal::householder_qr_inplace_blocked<MatrixQR, HCoeffs, MatrixQRScalar, InnerStrideIsOne>::run(MatrixQR&, HCoeffs&, Eigen::Index, typename MatrixQR::Scalar*) [with MatrixQR = Eigen::Matrix<double, -1, -1>; HCoeffs = Eigen::Matrix<double, -1, 1>; MatrixQRScalar = double; bool InnerStrideIsOne = true; Eigen::Index = long int; typename MatrixQR::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:416:73:   required from ‘void Eigen::HouseholderQR<MatrixType>::computeInPlace() [with _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:181:7:   required from ‘Eigen::HouseholderQR<MatrixType>& Eigen::HouseholderQR<MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:114:14:   required from ‘Eigen::HouseholderQR<MatrixType>::HouseholderQR(const Eigen::EigenBase<OtherDerived>&) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/QR/HouseholderQR.h:429:10:   required from ‘const Eigen::HouseholderQR<typename Eigen::DenseBase<Derived>::PlainObject> Eigen::MatrixBase<Derived>::householderQr() const [with Derived = Eigen::Matrix<double, -1, -1>; typename Eigen::DenseBase<Derived>::PlainObject = Eigen::Matrix<double, -1, -1>]’
filters.cpp:105:44:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>; SrcXprType = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>; SrcXprType = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>; Src = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>; Func = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:858:27:   required from ‘void Eigen::internal::call_assignment(Dst&, const Src&, const Func&, typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>; Src = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>; Func = sub_assign_op<double, double>; typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type = void*; typename evaluator_traits<SrcXprType>::Shape = Eigen::DenseShape]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:164:18:   required from ‘Derived& Eigen::MatrixBase<Derived>::operator-=(const Eigen::MatrixBase<OtherDerived>&) [with OtherDerived = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>; Derived = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixMatrix.h:457:31:   [ skipping 14 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:780:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>; SrcXprType = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>; SrcXprType = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>; Src = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>; Func = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:858:27:   required from ‘void Eigen::internal::call_assignment(Dst&, const Src&, const Func&, typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>; Src = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>; Func = sub_assign_op<double, double>; typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type = void*; typename evaluator_traits<SrcXprType>::Shape = Eigen::DenseShape]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:164:18:   required from ‘Derived& Eigen::MatrixBase<Derived>::operator-=(const Eigen::MatrixBase<OtherDerived>&) [with OtherDerived = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 0, -1, 1> >, const Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false> >, -1, -1, false>; Derived = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, false>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixMatrix.h:457:31:   [ skipping 14 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:780:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true>; Src = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >; Func = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:858:27:   required from ‘void Eigen::internal::call_assignment(Dst&, const Src&, const Func&, typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true>; Src = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >; Func = sub_assign_op<double, double>; typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type = void*; typename evaluator_traits<SrcXprType>::Shape = Eigen::DenseShape]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:164:18:   required from ‘Derived& Eigen::MatrixBase<Derived>::operator-=(const Eigen::MatrixBase<OtherDerived>&) [with OtherDerived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >; Derived = Eigen::Block<Eigen::Matrix<double, -1, -1, 0, -1, 1>, -1, -1, true>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixMatrix.h:462:32:   [ skipping 14 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘Eigen::Index Eigen::internal::first_default_aligned(const Eigen::DenseBase<Derived>&) [with Derived = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >; Eigen::Index = long int]’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:243:63:   required from ‘static Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::Scalar Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::run(const Evaluator&, const Func&, const XprType&) [with XprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >; Func = Eigen::internal::scalar_sum_op<double, double>; Evaluator = Eigen::internal::redux_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> > >; Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:418:56:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::redux(const Func&) const [with BinaryOp = Eigen::internal::scalar_sum_op<double, double>; Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:463:25:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::sum() const [with Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, 1, -1, true> >, const Eigen::Block<const Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, -1, 1, true> >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:606:75:   required from ‘const Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, 1>, ProductTag, Eigen::DenseShape, Eigen::DenseShape>::CoeffReturnType Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, 1>, ProductTag, Eigen::DenseShape, Eigen::DenseShape>::coeff(Eigen::Index, Eigen::Index) const [with Lhs = Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >; Rhs = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>; int ProductTag = 3; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, 1>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, 1>::Lhs = Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, 1>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, 1>::Rhs = Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>; CoeffReturnType = double; Eigen::Index = long int]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:654:63:   required from ‘void Eigen::internal::generic_dense_assignment_kernel<DstEvaluatorTypeT, SrcEvaluatorTypeT, Functor, Version>::assignCoeff(Eigen::Index, Eigen::Index) [with DstEvaluatorTypeT = Eigen::internal::evaluator<Eigen::Map<Eigen::Matrix<double, 1, -1, 1, 1, 1>, 0, Eigen::Stride<0, 0> > >; SrcEvaluatorTypeT = Eigen::internal::evaluator<Eigen::Product<Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, false> >, Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, 1>, -1, -1, false>, -1, -1, false>, 1> >; Functor = Eigen::internal::assign_op<double, double>; int Version = 0; Eigen::Index = long int]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:668:16:   [ skipping 14 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Solve.h:147:26:   required from ‘static void Eigen::internal::Assignment<DstXprType, Eigen::Solve<DecType, RhsType>, Eigen::internal::assign_op<Scalar, Scalar>, Eigen::internal::Dense2Dense>::run(DstXprType&, const SrcXprType&, const Eigen::internal::assign_op<Scalar, Scalar>&) [with DstXprType = Eigen::Matrix<double, -1, 1>; DecType = Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >; RhsType = Eigen::Matrix<double, -1, 1>; Scalar = double; SrcXprType = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Matrix<double, -1, 1>; Src = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Func = assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:797:41:   required from ‘Derived& Eigen::PlainObjectBase<Derived>::_set_noalias(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:594:19:   required from ‘Eigen::PlainObjectBase<Derived>::PlainObjectBase(const Eigen::DenseBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:423:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::Matrix(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::Solve<Eigen::HouseholderQR<Eigen::Matrix<double, -1, -1> >, Eigen::Matrix<double, -1, 1> >; _Scalar = double; int _Rows = -1; int _Cols = 1; int _Options = 0; int _MaxRows = -1; int _MaxCols = 1]’
filters.cpp:105:54:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:654:74: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  654 |   return internal::first_aligned<int(unpacket_traits<DefaultPacketType>::alignment),Derived>(m);
      |                                                                          ^~~~~~~~~
(cd TMB; /opt/R/4.4.0/lib/R/bin/Rscript \
--no-save --no-restore compile.R '')
using C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
make[1]: Entering directory '/tmp/workdir/tsissm/old/tsissm.Rcheck/00_pkg_src/tsissm/src/TMB'
g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG -I"/usr/local/lib/R/site-library/TMB/include" -I"/usr/local/lib/R/site-library/RcppEigen/include"   -DTMB_EIGEN_DISABLE_WARNINGS   -DTMB_LIB_INIT=R_init_tsissm_TMBExports  -DCPPAD_FRAMEWORK -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/TMB/include' -I'/usr/local/lib/R/site-library/RcppEigen/include' -I/usr/local/include    -fpic  -g -O2   -c tsissm_TMBExports.cpp -o tsissm_TMBExports.o
g++ -std=gnu++17 -shared -L/opt/R/4.4.0/lib/R/lib -L/usr/local/lib -o tsissm_TMBExports.so tsissm_TMBExports.o -L/opt/R/4.4.0/lib/R/lib -lR
make[1]: Leaving directory '/tmp/workdir/tsissm/old/tsissm.Rcheck/00_pkg_src/tsissm/src/TMB'
make[1]: Entering directory '/tmp/workdir/tsissm/old/tsissm.Rcheck/00_pkg_src/tsissm/src/TMB'
make[1]: Leaving directory '/tmp/workdir/tsissm/old/tsissm.Rcheck/00_pkg_src/tsissm/src/TMB'
[1] TRUE
g++ -std=gnu++17 -shared -L/opt/R/4.4.0/lib/R/lib -L/usr/local/lib -o tsissm.so RcppExports.o filters.o -L/opt/R/4.4.0/lib/R/lib -lR
installing to /tmp/workdir/tsissm/old/tsissm.Rcheck/00LOCK-tsissm/00new/tsissm/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘gsl’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘tsissm’
* removing ‘/tmp/workdir/tsissm/old/tsissm.Rcheck/tsissm’


```
