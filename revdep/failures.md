# Canek

<details>

* Version: 0.2.5
* GitHub: https://github.com/MartinLoza/Canek
* Source code: https://github.com/cran/Canek
* Date/Publication: 2023-12-08 05:30:02 UTC
* Number of recursive dependencies: 225

Run `revdepcheck::cloud_details(, "Canek")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/Canek/new/Canek.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Canek/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘Canek’ version ‘0.2.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘Seurat’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘Canek’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
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
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Complete output:
  > library(testthat)
  > library(Canek)
  > 
  > test_check("Canek")
  [ FAIL 1 | WARN 0 | SKIP 0 | PASS 74 ]
  
  ══ Failed tests ════════════════════════════════════════════════════════════════
  ── Error ('test_RunCanek.R:19:1'): (code run outside of `test_that()`) ─────────
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'Seurat'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test_RunCanek.R:19:1
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  
  [ FAIL 1 | WARN 0 | SKIP 0 | PASS 74 ]
  Error: Test failures
  Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... OK
  ‘toy_example.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 ERROR, 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/Canek/old/Canek.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Canek/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘Canek’ version ‘0.2.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘Seurat’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘Canek’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
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
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Complete output:
  > library(testthat)
  > library(Canek)
  > 
  > test_check("Canek")
  [ FAIL 1 | WARN 0 | SKIP 0 | PASS 74 ]
  
  ══ Failed tests ════════════════════════════════════════════════════════════════
  ── Error ('test_RunCanek.R:19:1'): (code run outside of `test_that()`) ─────────
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'Seurat'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test_RunCanek.R:19:1
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  
  [ FAIL 1 | WARN 0 | SKIP 0 | PASS 74 ]
  Error: Test failures
  Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... OK
  ‘toy_example.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 ERROR, 1 NOTE





```
# CARBayes

<details>

* Version: 6.1.1
* GitHub: https://github.com/duncanplee/CARBayes
* Source code: https://github.com/cran/CARBayes
* Date/Publication: 2024-03-08 13:20:02 UTC
* Number of recursive dependencies: 136

Run `revdepcheck::cloud_details(, "CARBayes")` for more info

</details>

## In both

*   checking whether package ‘CARBayes’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/CARBayes/new/CARBayes.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘CARBayes’ ...
** package ‘CARBayes’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0’
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I/usr/local/include    -fpic  -g -O2  -c CARBayes.cpp -o CARBayes.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I/usr/local/include    -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++17 -shared -L/opt/R/4.3.1/lib/R/lib -L/usr/local/lib -o CARBayes.so CARBayes.o RcppExports.o -L/opt/R/4.3.1/lib/R/lib -lR
installing to /tmp/workdir/CARBayes/new/CARBayes.Rcheck/00LOCK-CARBayes/00new/CARBayes/libs
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘quantreg’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘CARBayes’
* removing ‘/tmp/workdir/CARBayes/new/CARBayes.Rcheck/CARBayes’


```
### CRAN

```
* installing *source* package ‘CARBayes’ ...
** package ‘CARBayes’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0’
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I/usr/local/include    -fpic  -g -O2  -c CARBayes.cpp -o CARBayes.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I/usr/local/include    -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++17 -shared -L/opt/R/4.3.1/lib/R/lib -L/usr/local/lib -o CARBayes.so CARBayes.o RcppExports.o -L/opt/R/4.3.1/lib/R/lib -lR
installing to /tmp/workdir/CARBayes/old/CARBayes.Rcheck/00LOCK-CARBayes/00new/CARBayes/libs
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘quantreg’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘CARBayes’
* removing ‘/tmp/workdir/CARBayes/old/CARBayes.Rcheck/CARBayes’


```
# ClustAssess

<details>

* Version: 0.3.0
* GitHub: https://github.com/Core-Bioinformatics/ClustAssess
* Source code: https://github.com/cran/ClustAssess
* Date/Publication: 2022-01-26 16:52:46 UTC
* Number of recursive dependencies: 164

Run `revdepcheck::cloud_details(, "ClustAssess")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/ClustAssess/new/ClustAssess.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ClustAssess/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘ClustAssess’ version ‘0.3.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘Seurat’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘ClustAssess’ can be installed ... OK
* used C++ compiler: ‘g++ (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0’
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
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
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking compiled code ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... ERROR
Running examples in ‘ClustAssess-Ex.R’ failed
The error most likely occurred in:

> ### Name: get_clustering_difference
> ### Title: Graph Clustering Method Stability
> ### Aliases: get_clustering_difference
> 
> ### ** Examples
> 
> set.seed(2021)
> # create an artificial expression matrix
> expr_matrix = matrix(runif(100*10), nrow = 100)
> rownames(expr_matrix) = as.character(1:100)
> 
> adj_matrix = Seurat::FindNeighbors(expr_matrix,
+     k.param = 10,
+     nn.method = "rann",
+     verbose = FALSE,
+     compute.SNN = FALSE)$nn
Error in loadNamespace(x) : there is no package called ‘Seurat’
Calls: loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... WARNING
Errors in running code in vignettes:
when running code in ‘ClustAssess.Rmd’
  ...

> knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

> set.seed(1001)

> library(Seurat)

  When sourcing ‘ClustAssess.R’:
Error: there is no package called ‘Seurat’
Execution halted

  ‘ClustAssess.Rmd’ using ‘UTF-8’... failed
  ‘comparing-soft-and-hierarchical.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... NOTE
Error(s) in re-building vignettes:
--- re-building ‘ClustAssess.Rmd’ using rmarkdown

Quitting from lines 22-27 [setup] (ClustAssess.Rmd)
Error: processing vignette 'ClustAssess.Rmd' failed with diagnostics:
there is no package called 'Seurat'
--- failed re-building ‘ClustAssess.Rmd’

--- re-building ‘comparing-soft-and-hierarchical.Rmd’ using rmarkdown
** Processing: /tmp/workdir/ClustAssess/new/ClustAssess.Rcheck/vign_test/ClustAssess/vignettes/comparing-soft-and-hierarchical_files/figure-html/setup-1.png
672x432 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 31275 bytes
Input file size = 31389 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 24565
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 24565

Output IDAT size = 24565 bytes (6710 bytes decrease)
Output file size = 24643 bytes (6746 bytes = 21.49% decrease)

** Processing: /tmp/workdir/ClustAssess/new/ClustAssess.Rcheck/vign_test/ClustAssess/vignettes/comparing-soft-and-hierarchical_files/figure-html/clustering-1.png
672x432 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 29856 bytes
Input file size = 29970 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 23783
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 23783

Output IDAT size = 23783 bytes (6073 bytes decrease)
Output file size = 23861 bytes (6109 bytes = 20.38% decrease)

** Processing: /tmp/workdir/ClustAssess/new/ClustAssess.Rcheck/vign_test/ClustAssess/vignettes/comparing-soft-and-hierarchical_files/figure-html/clustering-2.png
672x432 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 31058 bytes
Input file size = 31172 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 24614
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 24614

Output IDAT size = 24614 bytes (6444 bytes decrease)
Output file size = 24692 bytes (6480 bytes = 20.79% decrease)

** Processing: /tmp/workdir/ClustAssess/new/ClustAssess.Rcheck/vign_test/ClustAssess/vignettes/comparing-soft-and-hierarchical_files/figure-html/clustering-3.png
672x432 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 21221 bytes
Input file size = 21323 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 17324
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 17324

Output IDAT size = 17324 bytes (3897 bytes decrease)
Output file size = 17402 bytes (3921 bytes = 18.39% decrease)

** Processing: /tmp/workdir/ClustAssess/new/ClustAssess.Rcheck/vign_test/ClustAssess/vignettes/comparing-soft-and-hierarchical_files/figure-html/ecs-1.png
672x432 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 33803 bytes
Input file size = 33929 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 27092
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 27092

Output IDAT size = 27092 bytes (6711 bytes decrease)
Output file size = 27170 bytes (6759 bytes = 19.92% decrease)

** Processing: /tmp/workdir/ClustAssess/new/ClustAssess.Rcheck/vign_test/ClustAssess/vignettes/comparing-soft-and-hierarchical_files/figure-html/ecs-2.png
672x432 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 33849 bytes
Input file size = 33975 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 27923
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 27923

Output IDAT size = 27923 bytes (5926 bytes decrease)
Output file size = 28001 bytes (5974 bytes = 17.58% decrease)

** Processing: /tmp/workdir/ClustAssess/new/ClustAssess.Rcheck/vign_test/ClustAssess/vignettes/comparing-soft-and-hierarchical_files/figure-html/ecs-3.png
672x432 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 33198 bytes
Input file size = 33324 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 27196
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 27196

Output IDAT size = 27196 bytes (6002 bytes decrease)
Output file size = 27274 bytes (6050 bytes = 18.16% decrease)

--- finished re-building ‘comparing-soft-and-hierarchical.Rmd’

SUMMARY: processing the following file failed:
  ‘ClustAssess.Rmd’

Error: Vignette re-building failed.
Execution halted

* DONE
Status: 1 ERROR, 1 WARNING, 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/ClustAssess/old/ClustAssess.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ClustAssess/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘ClustAssess’ version ‘0.3.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘Seurat’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘ClustAssess’ can be installed ... OK
* used C++ compiler: ‘g++ (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0’
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
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
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking compiled code ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... ERROR
Running examples in ‘ClustAssess-Ex.R’ failed
The error most likely occurred in:

> ### Name: get_clustering_difference
> ### Title: Graph Clustering Method Stability
> ### Aliases: get_clustering_difference
> 
> ### ** Examples
> 
> set.seed(2021)
> # create an artificial expression matrix
> expr_matrix = matrix(runif(100*10), nrow = 100)
> rownames(expr_matrix) = as.character(1:100)
> 
> adj_matrix = Seurat::FindNeighbors(expr_matrix,
+     k.param = 10,
+     nn.method = "rann",
+     verbose = FALSE,
+     compute.SNN = FALSE)$nn
Error in loadNamespace(x) : there is no package called ‘Seurat’
Calls: loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... WARNING
Errors in running code in vignettes:
when running code in ‘ClustAssess.Rmd’
  ...

> knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

> set.seed(1001)

> library(Seurat)

  When sourcing ‘ClustAssess.R’:
Error: there is no package called ‘Seurat’
Execution halted

  ‘ClustAssess.Rmd’ using ‘UTF-8’... failed
  ‘comparing-soft-and-hierarchical.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... NOTE
Error(s) in re-building vignettes:
--- re-building ‘ClustAssess.Rmd’ using rmarkdown

Quitting from lines 22-27 [setup] (ClustAssess.Rmd)
Error: processing vignette 'ClustAssess.Rmd' failed with diagnostics:
there is no package called 'Seurat'
--- failed re-building ‘ClustAssess.Rmd’

--- re-building ‘comparing-soft-and-hierarchical.Rmd’ using rmarkdown
** Processing: /tmp/workdir/ClustAssess/old/ClustAssess.Rcheck/vign_test/ClustAssess/vignettes/comparing-soft-and-hierarchical_files/figure-html/setup-1.png
672x432 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 31275 bytes
Input file size = 31389 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 24565
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 24565

Output IDAT size = 24565 bytes (6710 bytes decrease)
Output file size = 24643 bytes (6746 bytes = 21.49% decrease)

** Processing: /tmp/workdir/ClustAssess/old/ClustAssess.Rcheck/vign_test/ClustAssess/vignettes/comparing-soft-and-hierarchical_files/figure-html/clustering-1.png
672x432 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 29856 bytes
Input file size = 29970 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 23783
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 23783

Output IDAT size = 23783 bytes (6073 bytes decrease)
Output file size = 23861 bytes (6109 bytes = 20.38% decrease)

** Processing: /tmp/workdir/ClustAssess/old/ClustAssess.Rcheck/vign_test/ClustAssess/vignettes/comparing-soft-and-hierarchical_files/figure-html/clustering-2.png
672x432 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 31058 bytes
Input file size = 31172 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 24614
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 24614

Output IDAT size = 24614 bytes (6444 bytes decrease)
Output file size = 24692 bytes (6480 bytes = 20.79% decrease)

** Processing: /tmp/workdir/ClustAssess/old/ClustAssess.Rcheck/vign_test/ClustAssess/vignettes/comparing-soft-and-hierarchical_files/figure-html/clustering-3.png
672x432 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 21221 bytes
Input file size = 21323 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 17324
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 17324

Output IDAT size = 17324 bytes (3897 bytes decrease)
Output file size = 17402 bytes (3921 bytes = 18.39% decrease)

** Processing: /tmp/workdir/ClustAssess/old/ClustAssess.Rcheck/vign_test/ClustAssess/vignettes/comparing-soft-and-hierarchical_files/figure-html/ecs-1.png
672x432 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 33803 bytes
Input file size = 33929 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 27092
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 27092

Output IDAT size = 27092 bytes (6711 bytes decrease)
Output file size = 27170 bytes (6759 bytes = 19.92% decrease)

** Processing: /tmp/workdir/ClustAssess/old/ClustAssess.Rcheck/vign_test/ClustAssess/vignettes/comparing-soft-and-hierarchical_files/figure-html/ecs-2.png
672x432 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 33849 bytes
Input file size = 33975 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 27923
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 27923

Output IDAT size = 27923 bytes (5926 bytes decrease)
Output file size = 28001 bytes (5974 bytes = 17.58% decrease)

** Processing: /tmp/workdir/ClustAssess/old/ClustAssess.Rcheck/vign_test/ClustAssess/vignettes/comparing-soft-and-hierarchical_files/figure-html/ecs-3.png
672x432 pixels, 3x8 bits/pixel, RGB
Input IDAT size = 33198 bytes
Input file size = 33324 bytes

Trying:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 27196
  zc = 9  zm = 8  zs = 1  f = 0
  zc = 1  zm = 8  zs = 2  f = 0
  zc = 9  zm = 8  zs = 3  f = 0
  zc = 9  zm = 8  zs = 0  f = 5
  zc = 9  zm = 8  zs = 1  f = 5
  zc = 1  zm = 8  zs = 2  f = 5
  zc = 9  zm = 8  zs = 3  f = 5
                               
Selecting parameters:
  zc = 9  zm = 8  zs = 0  f = 0		IDAT size = 27196

Output IDAT size = 27196 bytes (6002 bytes decrease)
Output file size = 27274 bytes (6050 bytes = 18.16% decrease)

--- finished re-building ‘comparing-soft-and-hierarchical.Rmd’

SUMMARY: processing the following file failed:
  ‘ClustAssess.Rmd’

Error: Vignette re-building failed.
Execution halted

* DONE
Status: 1 ERROR, 1 WARNING, 2 NOTEs





```
# clustree

<details>

* Version: 0.5.1
* GitHub: https://github.com/lazappi/clustree
* Source code: https://github.com/cran/clustree
* Date/Publication: 2023-11-05 19:10:02 UTC
* Number of recursive dependencies: 191

Run `revdepcheck::cloud_details(, "clustree")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/clustree/new/clustree.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘clustree/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘clustree’ version ‘0.5.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘Seurat’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘clustree’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
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
* checking tests ... OK
  Running ‘spelling.R’
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... OK
  ‘clustree.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/clustree/old/clustree.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘clustree/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘clustree’ version ‘0.5.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘Seurat’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘clustree’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
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
* checking tests ... OK
  Running ‘spelling.R’
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... OK
  ‘clustree.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# conos

<details>

* Version: 1.5.2
* GitHub: https://github.com/kharchenkolab/conos
* Source code: https://github.com/cran/conos
* Date/Publication: 2024-02-26 19:30:05 UTC
* Number of recursive dependencies: 238

Run `revdepcheck::cloud_details(, "conos")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/conos/new/conos.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘conos/DESCRIPTION’ ... OK
* this is package ‘conos’ version ‘1.5.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘Seurat’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘conos’ can be installed ... OK
* used C++ compiler: ‘g++ (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0’
* checking installed package size ... NOTE
  installed size is 15.0Mb
  sub-directories of 1Mb or more:
    libs  13.1Mb
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
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
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking line endings in Makefiles ... OK
* checking compilation flags in Makevars ... OK
* checking for GNU extensions in Makefiles ... OK
* checking for portable use of $(BLAS_LIBS) and $(LAPACK_LIBS) ... OK
* checking use of PKG_*FLAGS in Makefiles ... OK
* checking compiled code ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/conos/old/conos.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘conos/DESCRIPTION’ ... OK
* this is package ‘conos’ version ‘1.5.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘Seurat’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘conos’ can be installed ... OK
* used C++ compiler: ‘g++ (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0’
* checking installed package size ... NOTE
  installed size is 15.0Mb
  sub-directories of 1Mb or more:
    libs  13.1Mb
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
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
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking line endings in Makefiles ... OK
* checking compilation flags in Makevars ... OK
* checking for GNU extensions in Makefiles ... OK
* checking for portable use of $(BLAS_LIBS) and $(LAPACK_LIBS) ... OK
* checking use of PKG_*FLAGS in Makefiles ... OK
* checking compiled code ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 2 NOTEs





```
# countland

<details>

* Version: 0.1.2
* GitHub: https://github.com/shchurch/countland
* Source code: https://github.com/cran/countland
* Date/Publication: 2024-02-01 18:00:02 UTC
* Number of recursive dependencies: 198

Run `revdepcheck::cloud_details(, "countland")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/countland/new/countland.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘countland/DESCRIPTION’ ... OK
* this is package ‘countland’ version ‘0.1.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘Seurat’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘countland’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
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
* checking examples ... ERROR
Running examples in ‘countland-Ex.R’ failed
The error most likely occurred in:

> ### Name: Cluster
> ### Title: Perform spectral clustering on dot products.
> ### Aliases: Cluster
> 
> ### ** Examples
> 
> gold_path <- system.file("testdata", package = "countland", mustWork = TRUE)
> gold.data <- Seurat::Read10X(data.dir = gold_path)
Error in loadNamespace(x) : there is no package called ‘Seurat’
Calls: loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... ERROR
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Complete output:
  > library(testthat)
  > library(countland)
  > 
  > test_check("countland")
  Performing spectral clustering on dot products...
      done.
  Performing spectral embedding on dot products...
      done.
  [ FAIL 7 | WARN 2 | SKIP 0 | PASS 13 ]
  
  ══ Failed tests ════════════════════════════════════════════════════════════════
  ── Error ('test-countland.R:2:1'): (code run outside of `test_that()`) ─────────
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'Seurat'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test-countland.R:2:1
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  ── Error ('test-countland_IMA.R:2:1'): (code run outside of `test_that()`) ─────
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'Seurat'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test-countland_IMA.R:2:1
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  ── Error ('test-countland_dot.R:2:1'): (code run outside of `test_that()`) ─────
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'Seurat'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test-countland_dot.R:2:1
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  ── Error ('test-countland_score.R:2:1'): (code run outside of `test_that()`) ───
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'Seurat'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test-countland_score.R:2:1
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  ── Error ('test-countland_shared_counts.R:2:1'): (code run outside of `test_that()`) ──
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'Seurat'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test-countland_shared_counts.R:2:1
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  ── Error ('test-countland_subsample.R:2:1'): (code run outside of `test_that()`) ──
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'Seurat'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test-countland_subsample.R:2:1
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  ── Error ('test-countland_subset.R:2:1'): (code run outside of `test_that()`) ──
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'Seurat'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test-countland_subset.R:2:1
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  
  [ FAIL 7 | WARN 2 | SKIP 0 | PASS 13 ]
  Error: Test failures
  Execution halted
* DONE
Status: 2 ERRORs, 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/countland/old/countland.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘countland/DESCRIPTION’ ... OK
* this is package ‘countland’ version ‘0.1.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘Seurat’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘countland’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
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
* checking examples ... ERROR
Running examples in ‘countland-Ex.R’ failed
The error most likely occurred in:

> ### Name: Cluster
> ### Title: Perform spectral clustering on dot products.
> ### Aliases: Cluster
> 
> ### ** Examples
> 
> gold_path <- system.file("testdata", package = "countland", mustWork = TRUE)
> gold.data <- Seurat::Read10X(data.dir = gold_path)
Error in loadNamespace(x) : there is no package called ‘Seurat’
Calls: loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... ERROR
  Running ‘testthat.R’
Running the tests in ‘tests/testthat.R’ failed.
Complete output:
  > library(testthat)
  > library(countland)
  > 
  > test_check("countland")
  Performing spectral clustering on dot products...
      done.
  Performing spectral embedding on dot products...
      done.
  [ FAIL 7 | WARN 0 | SKIP 0 | PASS 13 ]
  
  ══ Failed tests ════════════════════════════════════════════════════════════════
  ── Error ('test-countland.R:2:1'): (code run outside of `test_that()`) ─────────
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'Seurat'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test-countland.R:2:1
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  ── Error ('test-countland_IMA.R:2:1'): (code run outside of `test_that()`) ─────
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'Seurat'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test-countland_IMA.R:2:1
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  ── Error ('test-countland_dot.R:2:1'): (code run outside of `test_that()`) ─────
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'Seurat'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test-countland_dot.R:2:1
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  ── Error ('test-countland_score.R:2:1'): (code run outside of `test_that()`) ───
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'Seurat'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test-countland_score.R:2:1
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  ── Error ('test-countland_shared_counts.R:2:1'): (code run outside of `test_that()`) ──
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'Seurat'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test-countland_shared_counts.R:2:1
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  ── Error ('test-countland_subsample.R:2:1'): (code run outside of `test_that()`) ──
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'Seurat'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test-countland_subsample.R:2:1
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  ── Error ('test-countland_subset.R:2:1'): (code run outside of `test_that()`) ──
  <packageNotFoundError/error/condition>
  Error in `loadNamespace(x)`: there is no package called 'Seurat'
  Backtrace:
      ▆
   1. └─base::loadNamespace(x) at test-countland_subset.R:2:1
   2.   └─base::withRestarts(stop(cond), retry_loadNamespace = function() NULL)
   3.     └─base (local) withOneRestart(expr, restarts[[1L]])
   4.       └─base (local) doWithOneRestart(return(expr), restart)
  
  [ FAIL 7 | WARN 0 | SKIP 0 | PASS 13 ]
  Error: Test failures
  Execution halted
* DONE
Status: 2 ERRORs, 1 NOTE





```
# datapack

<details>

* Version: 1.4.1
* GitHub: https://github.com/ropensci/datapack
* Source code: https://github.com/cran/datapack
* Date/Publication: 2022-06-10 19:40:01 UTC
* Number of recursive dependencies: 67

Run `revdepcheck::cloud_details(, "datapack")` for more info

</details>

## In both

*   checking whether package ‘datapack’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/datapack/new/datapack.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘datapack’ ...
** package ‘datapack’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/4.3.1/lib/R/site-library/redland/libs/redland.so':
  librdf.so.0: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘datapack’
* removing ‘/tmp/workdir/datapack/new/datapack.Rcheck/datapack’


```
### CRAN

```
* installing *source* package ‘datapack’ ...
** package ‘datapack’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/opt/R/4.3.1/lib/R/site-library/redland/libs/redland.so':
  librdf.so.0: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘datapack’
* removing ‘/tmp/workdir/datapack/old/datapack.Rcheck/datapack’


```
# DIscBIO

<details>

* Version: 1.2.2
* GitHub: https://github.com/ocbe-uio/DIscBIO
* Source code: https://github.com/cran/DIscBIO
* Date/Publication: 2023-11-06 10:50:02 UTC
* Number of recursive dependencies: 208

Run `revdepcheck::cloud_details(, "DIscBIO")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/DIscBIO/new/DIscBIO.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘DIscBIO/DESCRIPTION’ ... OK
* this is package ‘DIscBIO’ version ‘1.2.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘Seurat’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘DIscBIO’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
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
* checking examples ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/DIscBIO/old/DIscBIO.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘DIscBIO/DESCRIPTION’ ... OK
* this is package ‘DIscBIO’ version ‘1.2.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘Seurat’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘DIscBIO’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
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
* checking examples ... OK
* DONE
Status: 1 NOTE





```
# dyngen

<details>

* Version: 1.0.5
* GitHub: https://github.com/dynverse/dyngen
* Source code: https://github.com/cran/dyngen
* Date/Publication: 2022-10-12 15:22:39 UTC
* Number of recursive dependencies: 208

Run `revdepcheck::cloud_details(, "dyngen")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/dyngen/new/dyngen.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘dyngen/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘dyngen’ version ‘1.0.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘Seurat’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘dyngen’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
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
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘getting_started.html.asis’ using ‘UTF-8’... OK
  ‘installation.html.asis’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/dyngen/old/dyngen.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘dyngen/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘dyngen’ version ‘1.0.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘Seurat’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘dyngen’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
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
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘getting_started.html.asis’ using ‘UTF-8’... OK
  ‘installation.html.asis’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# evolqg

<details>

* Version: 0.3-4
* GitHub: https://github.com/lem-usp/evolqg
* Source code: https://github.com/cran/evolqg
* Date/Publication: 2023-12-05 15:20:12 UTC
* Number of recursive dependencies: 111

Run `revdepcheck::cloud_details(, "evolqg")` for more info

</details>

## In both

*   checking whether package ‘evolqg’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/evolqg/new/evolqg.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘evolqg’ ...
** package ‘evolqg’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0’
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include    -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include    -fpic  -g -O2  -c fast_RS.cpp -o fast_RS.o
g++ -std=gnu++17 -shared -L/opt/R/4.3.1/lib/R/lib -L/usr/local/lib -o evolqg.so RcppExports.o fast_RS.o -llapack -lblas -lgfortran -lm -lquadmath -L/opt/R/4.3.1/lib/R/lib -lR
installing to /tmp/workdir/evolqg/new/evolqg.Rcheck/00LOCK-evolqg/00new/evolqg/libs
** R
** data
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘quantreg’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘evolqg’
* removing ‘/tmp/workdir/evolqg/new/evolqg.Rcheck/evolqg’


```
### CRAN

```
* installing *source* package ‘evolqg’ ...
** package ‘evolqg’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0’
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include    -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include    -fpic  -g -O2  -c fast_RS.cpp -o fast_RS.o
g++ -std=gnu++17 -shared -L/opt/R/4.3.1/lib/R/lib -L/usr/local/lib -o evolqg.so RcppExports.o fast_RS.o -llapack -lblas -lgfortran -lm -lquadmath -L/opt/R/4.3.1/lib/R/lib -lR
installing to /tmp/workdir/evolqg/old/evolqg.Rcheck/00LOCK-evolqg/00new/evolqg/libs
** R
** data
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘quantreg’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘evolqg’
* removing ‘/tmp/workdir/evolqg/old/evolqg.Rcheck/evolqg’


```
# frechet

<details>

* Version: 0.3.0
* GitHub: https://github.com/functionaldata/tFrechet
* Source code: https://github.com/cran/frechet
* Date/Publication: 2023-12-09 15:50:08 UTC
* Number of recursive dependencies: 111

Run `revdepcheck::cloud_details(, "frechet")` for more info

</details>

## In both

*   checking whether package ‘frechet’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/frechet/new/frechet.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘frechet’ ...
** package ‘frechet’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.1 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘frechet’
* removing ‘/tmp/workdir/frechet/new/frechet.Rcheck/frechet’


```
### CRAN

```
* installing *source* package ‘frechet’ ...
** package ‘frechet’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.1 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘frechet’
* removing ‘/tmp/workdir/frechet/old/frechet.Rcheck/frechet’


```
# manet

<details>

* Version: 2.0
* GitHub: NA
* Source code: https://github.com/cran/manet
* Date/Publication: 2018-08-23 15:02:15 UTC
* Number of recursive dependencies: 21

Run `revdepcheck::cloud_details(, "manet")` for more info

</details>

## In both

*   checking whether package ‘manet’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/manet/new/manet.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘manet’ ...
** package ‘manet’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘MCMCpack’ in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]):
 there is no package called ‘quantreg’
Execution halted
ERROR: lazy loading failed for package ‘manet’
* removing ‘/tmp/workdir/manet/new/manet.Rcheck/manet’


```
### CRAN

```
* installing *source* package ‘manet’ ...
** package ‘manet’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘MCMCpack’ in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]):
 there is no package called ‘quantreg’
Execution halted
ERROR: lazy loading failed for package ‘manet’
* removing ‘/tmp/workdir/manet/old/manet.Rcheck/manet’


```
# metadat

<details>

* Version: 1.2-0
* GitHub: https://github.com/wviechtb/metadat
* Source code: https://github.com/cran/metadat
* Date/Publication: 2022-04-06 11:52:37 UTC
* Number of recursive dependencies: 126

Run `revdepcheck::cloud_details(, "metadat")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/metadat/new/metadat.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘metadat/DESCRIPTION’ ... OK
* this is package ‘metadat’ version ‘1.2-0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘rms’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘metadat’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
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
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/metadat/old/metadat.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘metadat/DESCRIPTION’ ... OK
* this is package ‘metadat’ version ‘1.2-0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘rms’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘metadat’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
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
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 1 NOTE





```
# MetaNet

<details>

* Version: 0.1.2
* GitHub: https://github.com/Asa12138/MetaNet
* Source code: https://github.com/cran/MetaNet
* Date/Publication: 2024-03-25 20:40:07 UTC
* Number of recursive dependencies: 161

Run `revdepcheck::cloud_details(, "MetaNet")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/MetaNet/new/MetaNet.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘MetaNet/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘MetaNet’ version ‘0.1.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘ggpmisc’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘MetaNet’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
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
* checking examples ... ERROR
Running examples in ‘MetaNet-Ex.R’ failed
The error most likely occurred in:

> ### Name: rand_net_par
> ### Title: Net_pars of many random network
> ### Aliases: rand_net_par compare_rand
> 
> ### ** Examples
> 
> data("c_net")
> rand_net_par(co_net_rmt, reps = 30) -> randp
> net_par(co_net_rmt, fast = FALSE) -> pars
Error in names(res$hub.vector) <- vertex_attr(graph, "name", V(graph)) : 
  attempt to set an attribute on NULL
Calls: net_par ... <Anonymous> -> hits_scores -> hub_and_authority_scores_impl
Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... OK
  ‘MetaNet.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 ERROR, 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/MetaNet/old/MetaNet.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘MetaNet/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘MetaNet’ version ‘0.1.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘ggpmisc’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘MetaNet’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
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
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... OK
  ‘MetaNet.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# mlmts

<details>

* Version: 1.1.1
* GitHub: NA
* Source code: https://github.com/cran/mlmts
* Date/Publication: 2023-01-22 21:30:02 UTC
* Number of recursive dependencies: 241

Run `revdepcheck::cloud_details(, "mlmts")` for more info

</details>

## In both

*   checking whether package ‘mlmts’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/mlmts/new/mlmts.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘mlmts’ ...
** package ‘mlmts’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error : package or namespace load failed for ‘quantspec’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘quantreg’
Error: unable to load R code in package ‘mlmts’
Execution halted
ERROR: lazy loading failed for package ‘mlmts’
* removing ‘/tmp/workdir/mlmts/new/mlmts.Rcheck/mlmts’


```
### CRAN

```
* installing *source* package ‘mlmts’ ...
** package ‘mlmts’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error : package or namespace load failed for ‘quantspec’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘quantreg’
Error: unable to load R code in package ‘mlmts’
Execution halted
ERROR: lazy loading failed for package ‘mlmts’
* removing ‘/tmp/workdir/mlmts/old/mlmts.Rcheck/mlmts’


```
# netcmc

<details>

* Version: 1.0.2
* GitHub: NA
* Source code: https://github.com/cran/netcmc
* Date/Publication: 2022-11-08 22:30:15 UTC
* Number of recursive dependencies: 61

Run `revdepcheck::cloud_details(, "netcmc")` for more info

</details>

## In both

*   checking whether package ‘netcmc’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/netcmc/new/netcmc.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘netcmc’ ...
** package ‘netcmc’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0’
using C++11
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c choleskyDecompositionRcppConversion.cpp -o choleskyDecompositionRcppConversion.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c doubleMatrixMultiplicationRcpp.cpp -o doubleMatrixMultiplicationRcpp.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c doubleVectorMultiplicationRcpp.cpp -o doubleVectorMultiplicationRcpp.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c eigenValuesRcppConversion.cpp -o eigenValuesRcppConversion.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getDiagonalMatrix.cpp -o getDiagonalMatrix.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getExp.cpp -o getExp.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getExpDividedByOnePlusExp.cpp -o getExpDividedByOnePlusExp.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getMeanCenteredRandomEffects.cpp -o getMeanCenteredRandomEffects.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getMultivariateBinomialNetworkLerouxDIC.cpp -o getMultivariateBinomialNetworkLerouxDIC.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getMultivariateBinomialNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.cpp -o getMultivariateBinomialNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getMultivariateGaussianNetworkLerouxDIC.cpp -o getMultivariateGaussianNetworkLerouxDIC.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getMultivariateGaussianNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.cpp -o getMultivariateGaussianNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getMultivariatePoissonNetworkLerouxDIC.cpp -o getMultivariatePoissonNetworkLerouxDIC.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getMultivariatePoissonNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.cpp -o getMultivariatePoissonNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getNonZeroEntries.cpp -o getNonZeroEntries.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getSubvector.cpp -o getSubvector.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getSubvectorIndecies.cpp -o getSubvectorIndecies.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getSumExpNetwork.cpp -o getSumExpNetwork.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getSumExpNetworkIndecies.cpp -o getSumExpNetworkIndecies.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getSumExpNetworkLeroux.cpp -o getSumExpNetworkLeroux.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getSumExpNetworkLerouxIndecies.cpp -o getSumExpNetworkLerouxIndecies.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getSumLogExp.cpp -o getSumLogExp.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getSumLogExpIndecies.cpp -o getSumLogExpIndecies.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getSumVector.cpp -o getSumVector.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getTripletForm.cpp -o getTripletForm.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getUnivariateBinomialNetworkLerouxDIC.cpp -o getUnivariateBinomialNetworkLerouxDIC.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getUnivariateBinomialNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.cpp -o getUnivariateBinomialNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getUnivariateGaussianNetworkLerouxDIC.cpp -o getUnivariateGaussianNetworkLerouxDIC.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getUnivariateGaussianNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.cpp -o getUnivariateGaussianNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getUnivariatePoissonNetworkDIC.cpp -o getUnivariatePoissonNetworkDIC.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getUnivariatePoissonNetworkFittedValuesAndLikelihoodForDICEveryIteration.cpp -o getUnivariatePoissonNetworkFittedValuesAndLikelihoodForDICEveryIteration.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getUnivariatePoissonNetworkLerouxDIC.cpp -o getUnivariatePoissonNetworkLerouxDIC.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getUnivariatePoissonNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.cpp -o getUnivariatePoissonNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getVectorMean.cpp -o getVectorMean.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c matrixInverseRcppConversion.cpp -o matrixInverseRcppConversion.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c matrixMatrixAdditionRcpp.cpp -o matrixMatrixAdditionRcpp.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c matrixMatrixSubtractionRcpp.cpp -o matrixMatrixSubtractionRcpp.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c matrixVectorMultiplicationRcpp.cpp -o matrixVectorMultiplicationRcpp.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateBinomialNetworkLerouxAllUpdate.cpp -o multivariateBinomialNetworkLerouxAllUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateBinomialNetworkLerouxBetaUpdate.cpp -o multivariateBinomialNetworkLerouxBetaUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateBinomialNetworkLerouxRhoUpdate.cpp -o multivariateBinomialNetworkLerouxRhoUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateBinomialNetworkLerouxSingleUpdate.cpp -o multivariateBinomialNetworkLerouxSingleUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateBinomialNetworkLerouxSpatialRandomEffectsUpdate.cpp -o multivariateBinomialNetworkLerouxSpatialRandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateBinomialNetworkLerouxTauSquaredUpdate.cpp -o multivariateBinomialNetworkLerouxTauSquaredUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateBinomialNetworkLerouxURandomEffectsUpdate.cpp -o multivariateBinomialNetworkLerouxURandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateBinomialNetworkLerouxVRandomEffectsUpdate.cpp -o multivariateBinomialNetworkLerouxVRandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateBinomialNetworkLerouxVarianceCovarianceUUpdate.cpp -o multivariateBinomialNetworkLerouxVarianceCovarianceUUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateBinomialNetworkRandAllUpdate.cpp -o multivariateBinomialNetworkRandAllUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateBinomialNetworkRandSingleUpdate.cpp -o multivariateBinomialNetworkRandSingleUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkLerouxAllMHUpdate.cpp -o multivariateGaussianNetworkLerouxAllMHUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkLerouxBetaUpdate.cpp -o multivariateGaussianNetworkLerouxBetaUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkLerouxRhoUpdate.cpp -o multivariateGaussianNetworkLerouxRhoUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkLerouxSigmaSquaredEUpdate.cpp -o multivariateGaussianNetworkLerouxSigmaSquaredEUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkLerouxSingleMHUpdate.cpp -o multivariateGaussianNetworkLerouxSingleMHUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkLerouxSpatialRandomEffectsMHUpdate.cpp -o multivariateGaussianNetworkLerouxSpatialRandomEffectsMHUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkLerouxTauSquaredUpdate.cpp -o multivariateGaussianNetworkLerouxTauSquaredUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkLerouxURandomEffectsUpdate.cpp -o multivariateGaussianNetworkLerouxURandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkLerouxVarianceCovarianceUUpdate.cpp -o multivariateGaussianNetworkLerouxVarianceCovarianceUUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkRandAllUpdate.cpp -o multivariateGaussianNetworkRandAllUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkRandSingleUpdate.cpp -o multivariateGaussianNetworkRandSingleUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkRandVRandomEffectsUpdate.cpp -o multivariateGaussianNetworkRandVRandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariatePoissonNetworkLerouxAllUpdate.cpp -o multivariatePoissonNetworkLerouxAllUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariatePoissonNetworkLerouxBetaUpdate.cpp -o multivariatePoissonNetworkLerouxBetaUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariatePoissonNetworkLerouxRhoUpdate.cpp -o multivariatePoissonNetworkLerouxRhoUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariatePoissonNetworkLerouxSingleUpdate.cpp -o multivariatePoissonNetworkLerouxSingleUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariatePoissonNetworkLerouxSpatialRandomEffectsUpdate.cpp -o multivariatePoissonNetworkLerouxSpatialRandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariatePoissonNetworkLerouxTauSquaredUpdate.cpp -o multivariatePoissonNetworkLerouxTauSquaredUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariatePoissonNetworkLerouxURandomEffectsUpdate.cpp -o multivariatePoissonNetworkLerouxURandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariatePoissonNetworkLerouxVRandomEffectsUpdate.cpp -o multivariatePoissonNetworkLerouxVRandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariatePoissonNetworkLerouxVarianceCovarianceUUpdate.cpp -o multivariatePoissonNetworkLerouxVarianceCovarianceUUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariatePoissonNetworkRandAllUpdate.cpp -o multivariatePoissonNetworkRandAllUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariatePoissonNetworkRandSingleUpdate.cpp -o multivariatePoissonNetworkRandSingleUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c sumMatrix.cpp -o sumMatrix.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateBinomialNetworkLerouxAllUpdate.cpp -o univariateBinomialNetworkLerouxAllUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateBinomialNetworkLerouxBetaUpdate.cpp -o univariateBinomialNetworkLerouxBetaUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateBinomialNetworkLerouxRhoUpdate.cpp -o univariateBinomialNetworkLerouxRhoUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateBinomialNetworkLerouxSigmaSquaredUpdate.cpp -o univariateBinomialNetworkLerouxSigmaSquaredUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateBinomialNetworkLerouxSingleUpdate.cpp -o univariateBinomialNetworkLerouxSingleUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateBinomialNetworkLerouxSpatialRandomEffectsUpdate.cpp -o univariateBinomialNetworkLerouxSpatialRandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateBinomialNetworkLerouxTauSquaredUpdate.cpp -o univariateBinomialNetworkLerouxTauSquaredUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateBinomialNetworkLerouxURandomEffectsUpdate.cpp -o univariateBinomialNetworkLerouxURandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateGaussianNetworkLerouxAllMHUpdate.cpp -o univariateGaussianNetworkLerouxAllMHUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateGaussianNetworkLerouxBetaUpdate.cpp -o univariateGaussianNetworkLerouxBetaUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateGaussianNetworkLerouxRhoUpdate.cpp -o univariateGaussianNetworkLerouxRhoUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateGaussianNetworkLerouxSigmaSquaredEUpdate.cpp -o univariateGaussianNetworkLerouxSigmaSquaredEUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateGaussianNetworkLerouxSigmaSquaredUUpdate.cpp -o univariateGaussianNetworkLerouxSigmaSquaredUUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateGaussianNetworkLerouxSingleMHUpdate.cpp -o univariateGaussianNetworkLerouxSingleMHUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateGaussianNetworkLerouxSpatialRandomEffectsMHUpdate.cpp -o univariateGaussianNetworkLerouxSpatialRandomEffectsMHUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateGaussianNetworkLerouxTauSquaredUpdate.cpp -o univariateGaussianNetworkLerouxTauSquaredUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateGaussianNetworkLerouxURandomEffectsUpdate.cpp -o univariateGaussianNetworkLerouxURandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariatePoissonNetworkLerouxAllUpdate.cpp -o univariatePoissonNetworkLerouxAllUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariatePoissonNetworkLerouxBetaUpdate.cpp -o univariatePoissonNetworkLerouxBetaUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariatePoissonNetworkLerouxRhoUpdate.cpp -o univariatePoissonNetworkLerouxRhoUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariatePoissonNetworkLerouxSigmaSquaredUpdate.cpp -o univariatePoissonNetworkLerouxSigmaSquaredUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariatePoissonNetworkLerouxSingleUpdate.cpp -o univariatePoissonNetworkLerouxSingleUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariatePoissonNetworkLerouxSpatialRandomEffectsUpdate.cpp -o univariatePoissonNetworkLerouxSpatialRandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariatePoissonNetworkLerouxTauSquaredUpdate.cpp -o univariatePoissonNetworkLerouxTauSquaredUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariatePoissonNetworkLerouxURandomEffectsUpdate.cpp -o univariatePoissonNetworkLerouxURandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c vectorTransposeVectorMultiplicationRcpp.cpp -o vectorTransposeVectorMultiplicationRcpp.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c vectorVectorTransposeMultiplicationRcpp.cpp -o vectorVectorTransposeMultiplicationRcpp.o
g++ -std=gnu++11 -shared -L/opt/R/4.3.1/lib/R/lib -L/usr/local/lib -o netcmc.so RcppExports.o choleskyDecompositionRcppConversion.o doubleMatrixMultiplicationRcpp.o doubleVectorMultiplicationRcpp.o eigenValuesRcppConversion.o getDiagonalMatrix.o getExp.o getExpDividedByOnePlusExp.o getMeanCenteredRandomEffects.o getMultivariateBinomialNetworkLerouxDIC.o getMultivariateBinomialNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getMultivariateGaussianNetworkLerouxDIC.o getMultivariateGaussianNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getMultivariatePoissonNetworkLerouxDIC.o getMultivariatePoissonNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getNonZeroEntries.o getSubvector.o getSubvectorIndecies.o getSumExpNetwork.o getSumExpNetworkIndecies.o getSumExpNetworkLeroux.o getSumExpNetworkLerouxIndecies.o getSumLogExp.o getSumLogExpIndecies.o getSumVector.o getTripletForm.o getUnivariateBinomialNetworkLerouxDIC.o getUnivariateBinomialNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getUnivariateGaussianNetworkLerouxDIC.o getUnivariateGaussianNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getUnivariatePoissonNetworkDIC.o getUnivariatePoissonNetworkFittedValuesAndLikelihoodForDICEveryIteration.o getUnivariatePoissonNetworkLerouxDIC.o getUnivariatePoissonNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getVectorMean.o matrixInverseRcppConversion.o matrixMatrixAdditionRcpp.o matrixMatrixSubtractionRcpp.o matrixVectorMultiplicationRcpp.o multivariateBinomialNetworkLerouxAllUpdate.o multivariateBinomialNetworkLerouxBetaUpdate.o multivariateBinomialNetworkLerouxRhoUpdate.o multivariateBinomialNetworkLerouxSingleUpdate.o multivariateBinomialNetworkLerouxSpatialRandomEffectsUpdate.o multivariateBinomialNetworkLerouxTauSquaredUpdate.o multivariateBinomialNetworkLerouxURandomEffectsUpdate.o multivariateBinomialNetworkLerouxVRandomEffectsUpdate.o multivariateBinomialNetworkLerouxVarianceCovarianceUUpdate.o multivariateBinomialNetworkRandAllUpdate.o multivariateBinomialNetworkRandSingleUpdate.o multivariateGaussianNetworkLerouxAllMHUpdate.o multivariateGaussianNetworkLerouxBetaUpdate.o multivariateGaussianNetworkLerouxRhoUpdate.o multivariateGaussianNetworkLerouxSigmaSquaredEUpdate.o multivariateGaussianNetworkLerouxSingleMHUpdate.o multivariateGaussianNetworkLerouxSpatialRandomEffectsMHUpdate.o multivariateGaussianNetworkLerouxTauSquaredUpdate.o multivariateGaussianNetworkLerouxURandomEffectsUpdate.o multivariateGaussianNetworkLerouxVarianceCovarianceUUpdate.o multivariateGaussianNetworkRandAllUpdate.o multivariateGaussianNetworkRandSingleUpdate.o multivariateGaussianNetworkRandVRandomEffectsUpdate.o multivariatePoissonNetworkLerouxAllUpdate.o multivariatePoissonNetworkLerouxBetaUpdate.o multivariatePoissonNetworkLerouxRhoUpdate.o multivariatePoissonNetworkLerouxSingleUpdate.o multivariatePoissonNetworkLerouxSpatialRandomEffectsUpdate.o multivariatePoissonNetworkLerouxTauSquaredUpdate.o multivariatePoissonNetworkLerouxURandomEffectsUpdate.o multivariatePoissonNetworkLerouxVRandomEffectsUpdate.o multivariatePoissonNetworkLerouxVarianceCovarianceUUpdate.o multivariatePoissonNetworkRandAllUpdate.o multivariatePoissonNetworkRandSingleUpdate.o sumMatrix.o univariateBinomialNetworkLerouxAllUpdate.o univariateBinomialNetworkLerouxBetaUpdate.o univariateBinomialNetworkLerouxRhoUpdate.o univariateBinomialNetworkLerouxSigmaSquaredUpdate.o univariateBinomialNetworkLerouxSingleUpdate.o univariateBinomialNetworkLerouxSpatialRandomEffectsUpdate.o univariateBinomialNetworkLerouxTauSquaredUpdate.o univariateBinomialNetworkLerouxURandomEffectsUpdate.o univariateGaussianNetworkLerouxAllMHUpdate.o univariateGaussianNetworkLerouxBetaUpdate.o univariateGaussianNetworkLerouxRhoUpdate.o univariateGaussianNetworkLerouxSigmaSquaredEUpdate.o univariateGaussianNetworkLerouxSigmaSquaredUUpdate.o univariateGaussianNetworkLerouxSingleMHUpdate.o univariateGaussianNetworkLerouxSpatialRandomEffectsMHUpdate.o univariateGaussianNetworkLerouxTauSquaredUpdate.o univariateGaussianNetworkLerouxURandomEffectsUpdate.o univariatePoissonNetworkLerouxAllUpdate.o univariatePoissonNetworkLerouxBetaUpdate.o univariatePoissonNetworkLerouxRhoUpdate.o univariatePoissonNetworkLerouxSigmaSquaredUpdate.o univariatePoissonNetworkLerouxSingleUpdate.o univariatePoissonNetworkLerouxSpatialRandomEffectsUpdate.o univariatePoissonNetworkLerouxTauSquaredUpdate.o univariatePoissonNetworkLerouxURandomEffectsUpdate.o vectorTransposeVectorMultiplicationRcpp.o vectorVectorTransposeMultiplicationRcpp.o -llapack -lblas -lgfortran -lm -lquadmath -L/opt/R/4.3.1/lib/R/lib -lR
installing to /tmp/workdir/netcmc/new/netcmc.Rcheck/00LOCK-netcmc/00new/netcmc/libs
** R
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘MCMCpack’ in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]):
 there is no package called ‘quantreg’
Execution halted
ERROR: lazy loading failed for package ‘netcmc’
* removing ‘/tmp/workdir/netcmc/new/netcmc.Rcheck/netcmc’


```
### CRAN

```
* installing *source* package ‘netcmc’ ...
** package ‘netcmc’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0’
using C++11
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c choleskyDecompositionRcppConversion.cpp -o choleskyDecompositionRcppConversion.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c doubleMatrixMultiplicationRcpp.cpp -o doubleMatrixMultiplicationRcpp.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c doubleVectorMultiplicationRcpp.cpp -o doubleVectorMultiplicationRcpp.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c eigenValuesRcppConversion.cpp -o eigenValuesRcppConversion.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getDiagonalMatrix.cpp -o getDiagonalMatrix.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getExp.cpp -o getExp.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getExpDividedByOnePlusExp.cpp -o getExpDividedByOnePlusExp.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getMeanCenteredRandomEffects.cpp -o getMeanCenteredRandomEffects.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getMultivariateBinomialNetworkLerouxDIC.cpp -o getMultivariateBinomialNetworkLerouxDIC.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getMultivariateBinomialNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.cpp -o getMultivariateBinomialNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getMultivariateGaussianNetworkLerouxDIC.cpp -o getMultivariateGaussianNetworkLerouxDIC.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getMultivariateGaussianNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.cpp -o getMultivariateGaussianNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getMultivariatePoissonNetworkLerouxDIC.cpp -o getMultivariatePoissonNetworkLerouxDIC.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getMultivariatePoissonNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.cpp -o getMultivariatePoissonNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getNonZeroEntries.cpp -o getNonZeroEntries.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getSubvector.cpp -o getSubvector.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getSubvectorIndecies.cpp -o getSubvectorIndecies.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getSumExpNetwork.cpp -o getSumExpNetwork.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getSumExpNetworkIndecies.cpp -o getSumExpNetworkIndecies.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getSumExpNetworkLeroux.cpp -o getSumExpNetworkLeroux.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getSumExpNetworkLerouxIndecies.cpp -o getSumExpNetworkLerouxIndecies.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getSumLogExp.cpp -o getSumLogExp.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getSumLogExpIndecies.cpp -o getSumLogExpIndecies.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getSumVector.cpp -o getSumVector.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getTripletForm.cpp -o getTripletForm.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getUnivariateBinomialNetworkLerouxDIC.cpp -o getUnivariateBinomialNetworkLerouxDIC.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getUnivariateBinomialNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.cpp -o getUnivariateBinomialNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getUnivariateGaussianNetworkLerouxDIC.cpp -o getUnivariateGaussianNetworkLerouxDIC.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getUnivariateGaussianNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.cpp -o getUnivariateGaussianNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getUnivariatePoissonNetworkDIC.cpp -o getUnivariatePoissonNetworkDIC.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getUnivariatePoissonNetworkFittedValuesAndLikelihoodForDICEveryIteration.cpp -o getUnivariatePoissonNetworkFittedValuesAndLikelihoodForDICEveryIteration.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getUnivariatePoissonNetworkLerouxDIC.cpp -o getUnivariatePoissonNetworkLerouxDIC.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getUnivariatePoissonNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.cpp -o getUnivariatePoissonNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c getVectorMean.cpp -o getVectorMean.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c matrixInverseRcppConversion.cpp -o matrixInverseRcppConversion.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c matrixMatrixAdditionRcpp.cpp -o matrixMatrixAdditionRcpp.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c matrixMatrixSubtractionRcpp.cpp -o matrixMatrixSubtractionRcpp.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c matrixVectorMultiplicationRcpp.cpp -o matrixVectorMultiplicationRcpp.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateBinomialNetworkLerouxAllUpdate.cpp -o multivariateBinomialNetworkLerouxAllUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateBinomialNetworkLerouxBetaUpdate.cpp -o multivariateBinomialNetworkLerouxBetaUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateBinomialNetworkLerouxRhoUpdate.cpp -o multivariateBinomialNetworkLerouxRhoUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateBinomialNetworkLerouxSingleUpdate.cpp -o multivariateBinomialNetworkLerouxSingleUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateBinomialNetworkLerouxSpatialRandomEffectsUpdate.cpp -o multivariateBinomialNetworkLerouxSpatialRandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateBinomialNetworkLerouxTauSquaredUpdate.cpp -o multivariateBinomialNetworkLerouxTauSquaredUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateBinomialNetworkLerouxURandomEffectsUpdate.cpp -o multivariateBinomialNetworkLerouxURandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateBinomialNetworkLerouxVRandomEffectsUpdate.cpp -o multivariateBinomialNetworkLerouxVRandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateBinomialNetworkLerouxVarianceCovarianceUUpdate.cpp -o multivariateBinomialNetworkLerouxVarianceCovarianceUUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateBinomialNetworkRandAllUpdate.cpp -o multivariateBinomialNetworkRandAllUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateBinomialNetworkRandSingleUpdate.cpp -o multivariateBinomialNetworkRandSingleUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkLerouxAllMHUpdate.cpp -o multivariateGaussianNetworkLerouxAllMHUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkLerouxBetaUpdate.cpp -o multivariateGaussianNetworkLerouxBetaUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkLerouxRhoUpdate.cpp -o multivariateGaussianNetworkLerouxRhoUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkLerouxSigmaSquaredEUpdate.cpp -o multivariateGaussianNetworkLerouxSigmaSquaredEUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkLerouxSingleMHUpdate.cpp -o multivariateGaussianNetworkLerouxSingleMHUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkLerouxSpatialRandomEffectsMHUpdate.cpp -o multivariateGaussianNetworkLerouxSpatialRandomEffectsMHUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkLerouxTauSquaredUpdate.cpp -o multivariateGaussianNetworkLerouxTauSquaredUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkLerouxURandomEffectsUpdate.cpp -o multivariateGaussianNetworkLerouxURandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkLerouxVarianceCovarianceUUpdate.cpp -o multivariateGaussianNetworkLerouxVarianceCovarianceUUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkRandAllUpdate.cpp -o multivariateGaussianNetworkRandAllUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkRandSingleUpdate.cpp -o multivariateGaussianNetworkRandSingleUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariateGaussianNetworkRandVRandomEffectsUpdate.cpp -o multivariateGaussianNetworkRandVRandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariatePoissonNetworkLerouxAllUpdate.cpp -o multivariatePoissonNetworkLerouxAllUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariatePoissonNetworkLerouxBetaUpdate.cpp -o multivariatePoissonNetworkLerouxBetaUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariatePoissonNetworkLerouxRhoUpdate.cpp -o multivariatePoissonNetworkLerouxRhoUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariatePoissonNetworkLerouxSingleUpdate.cpp -o multivariatePoissonNetworkLerouxSingleUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariatePoissonNetworkLerouxSpatialRandomEffectsUpdate.cpp -o multivariatePoissonNetworkLerouxSpatialRandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariatePoissonNetworkLerouxTauSquaredUpdate.cpp -o multivariatePoissonNetworkLerouxTauSquaredUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariatePoissonNetworkLerouxURandomEffectsUpdate.cpp -o multivariatePoissonNetworkLerouxURandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariatePoissonNetworkLerouxVRandomEffectsUpdate.cpp -o multivariatePoissonNetworkLerouxVRandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariatePoissonNetworkLerouxVarianceCovarianceUUpdate.cpp -o multivariatePoissonNetworkLerouxVarianceCovarianceUUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariatePoissonNetworkRandAllUpdate.cpp -o multivariatePoissonNetworkRandAllUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c multivariatePoissonNetworkRandSingleUpdate.cpp -o multivariatePoissonNetworkRandSingleUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c sumMatrix.cpp -o sumMatrix.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateBinomialNetworkLerouxAllUpdate.cpp -o univariateBinomialNetworkLerouxAllUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateBinomialNetworkLerouxBetaUpdate.cpp -o univariateBinomialNetworkLerouxBetaUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateBinomialNetworkLerouxRhoUpdate.cpp -o univariateBinomialNetworkLerouxRhoUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateBinomialNetworkLerouxSigmaSquaredUpdate.cpp -o univariateBinomialNetworkLerouxSigmaSquaredUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateBinomialNetworkLerouxSingleUpdate.cpp -o univariateBinomialNetworkLerouxSingleUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateBinomialNetworkLerouxSpatialRandomEffectsUpdate.cpp -o univariateBinomialNetworkLerouxSpatialRandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateBinomialNetworkLerouxTauSquaredUpdate.cpp -o univariateBinomialNetworkLerouxTauSquaredUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateBinomialNetworkLerouxURandomEffectsUpdate.cpp -o univariateBinomialNetworkLerouxURandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateGaussianNetworkLerouxAllMHUpdate.cpp -o univariateGaussianNetworkLerouxAllMHUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateGaussianNetworkLerouxBetaUpdate.cpp -o univariateGaussianNetworkLerouxBetaUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateGaussianNetworkLerouxRhoUpdate.cpp -o univariateGaussianNetworkLerouxRhoUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateGaussianNetworkLerouxSigmaSquaredEUpdate.cpp -o univariateGaussianNetworkLerouxSigmaSquaredEUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateGaussianNetworkLerouxSigmaSquaredUUpdate.cpp -o univariateGaussianNetworkLerouxSigmaSquaredUUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateGaussianNetworkLerouxSingleMHUpdate.cpp -o univariateGaussianNetworkLerouxSingleMHUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateGaussianNetworkLerouxSpatialRandomEffectsMHUpdate.cpp -o univariateGaussianNetworkLerouxSpatialRandomEffectsMHUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateGaussianNetworkLerouxTauSquaredUpdate.cpp -o univariateGaussianNetworkLerouxTauSquaredUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariateGaussianNetworkLerouxURandomEffectsUpdate.cpp -o univariateGaussianNetworkLerouxURandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariatePoissonNetworkLerouxAllUpdate.cpp -o univariatePoissonNetworkLerouxAllUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariatePoissonNetworkLerouxBetaUpdate.cpp -o univariatePoissonNetworkLerouxBetaUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariatePoissonNetworkLerouxRhoUpdate.cpp -o univariatePoissonNetworkLerouxRhoUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariatePoissonNetworkLerouxSigmaSquaredUpdate.cpp -o univariatePoissonNetworkLerouxSigmaSquaredUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariatePoissonNetworkLerouxSingleUpdate.cpp -o univariatePoissonNetworkLerouxSingleUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariatePoissonNetworkLerouxSpatialRandomEffectsUpdate.cpp -o univariatePoissonNetworkLerouxSpatialRandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariatePoissonNetworkLerouxTauSquaredUpdate.cpp -o univariatePoissonNetworkLerouxTauSquaredUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c univariatePoissonNetworkLerouxURandomEffectsUpdate.cpp -o univariatePoissonNetworkLerouxURandomEffectsUpdate.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c vectorTransposeVectorMultiplicationRcpp.cpp -o vectorTransposeVectorMultiplicationRcpp.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c vectorVectorTransposeMultiplicationRcpp.cpp -o vectorVectorTransposeMultiplicationRcpp.o
g++ -std=gnu++11 -shared -L/opt/R/4.3.1/lib/R/lib -L/usr/local/lib -o netcmc.so RcppExports.o choleskyDecompositionRcppConversion.o doubleMatrixMultiplicationRcpp.o doubleVectorMultiplicationRcpp.o eigenValuesRcppConversion.o getDiagonalMatrix.o getExp.o getExpDividedByOnePlusExp.o getMeanCenteredRandomEffects.o getMultivariateBinomialNetworkLerouxDIC.o getMultivariateBinomialNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getMultivariateGaussianNetworkLerouxDIC.o getMultivariateGaussianNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getMultivariatePoissonNetworkLerouxDIC.o getMultivariatePoissonNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getNonZeroEntries.o getSubvector.o getSubvectorIndecies.o getSumExpNetwork.o getSumExpNetworkIndecies.o getSumExpNetworkLeroux.o getSumExpNetworkLerouxIndecies.o getSumLogExp.o getSumLogExpIndecies.o getSumVector.o getTripletForm.o getUnivariateBinomialNetworkLerouxDIC.o getUnivariateBinomialNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getUnivariateGaussianNetworkLerouxDIC.o getUnivariateGaussianNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getUnivariatePoissonNetworkDIC.o getUnivariatePoissonNetworkFittedValuesAndLikelihoodForDICEveryIteration.o getUnivariatePoissonNetworkLerouxDIC.o getUnivariatePoissonNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getVectorMean.o matrixInverseRcppConversion.o matrixMatrixAdditionRcpp.o matrixMatrixSubtractionRcpp.o matrixVectorMultiplicationRcpp.o multivariateBinomialNetworkLerouxAllUpdate.o multivariateBinomialNetworkLerouxBetaUpdate.o multivariateBinomialNetworkLerouxRhoUpdate.o multivariateBinomialNetworkLerouxSingleUpdate.o multivariateBinomialNetworkLerouxSpatialRandomEffectsUpdate.o multivariateBinomialNetworkLerouxTauSquaredUpdate.o multivariateBinomialNetworkLerouxURandomEffectsUpdate.o multivariateBinomialNetworkLerouxVRandomEffectsUpdate.o multivariateBinomialNetworkLerouxVarianceCovarianceUUpdate.o multivariateBinomialNetworkRandAllUpdate.o multivariateBinomialNetworkRandSingleUpdate.o multivariateGaussianNetworkLerouxAllMHUpdate.o multivariateGaussianNetworkLerouxBetaUpdate.o multivariateGaussianNetworkLerouxRhoUpdate.o multivariateGaussianNetworkLerouxSigmaSquaredEUpdate.o multivariateGaussianNetworkLerouxSingleMHUpdate.o multivariateGaussianNetworkLerouxSpatialRandomEffectsMHUpdate.o multivariateGaussianNetworkLerouxTauSquaredUpdate.o multivariateGaussianNetworkLerouxURandomEffectsUpdate.o multivariateGaussianNetworkLerouxVarianceCovarianceUUpdate.o multivariateGaussianNetworkRandAllUpdate.o multivariateGaussianNetworkRandSingleUpdate.o multivariateGaussianNetworkRandVRandomEffectsUpdate.o multivariatePoissonNetworkLerouxAllUpdate.o multivariatePoissonNetworkLerouxBetaUpdate.o multivariatePoissonNetworkLerouxRhoUpdate.o multivariatePoissonNetworkLerouxSingleUpdate.o multivariatePoissonNetworkLerouxSpatialRandomEffectsUpdate.o multivariatePoissonNetworkLerouxTauSquaredUpdate.o multivariatePoissonNetworkLerouxURandomEffectsUpdate.o multivariatePoissonNetworkLerouxVRandomEffectsUpdate.o multivariatePoissonNetworkLerouxVarianceCovarianceUUpdate.o multivariatePoissonNetworkRandAllUpdate.o multivariatePoissonNetworkRandSingleUpdate.o sumMatrix.o univariateBinomialNetworkLerouxAllUpdate.o univariateBinomialNetworkLerouxBetaUpdate.o univariateBinomialNetworkLerouxRhoUpdate.o univariateBinomialNetworkLerouxSigmaSquaredUpdate.o univariateBinomialNetworkLerouxSingleUpdate.o univariateBinomialNetworkLerouxSpatialRandomEffectsUpdate.o univariateBinomialNetworkLerouxTauSquaredUpdate.o univariateBinomialNetworkLerouxURandomEffectsUpdate.o univariateGaussianNetworkLerouxAllMHUpdate.o univariateGaussianNetworkLerouxBetaUpdate.o univariateGaussianNetworkLerouxRhoUpdate.o univariateGaussianNetworkLerouxSigmaSquaredEUpdate.o univariateGaussianNetworkLerouxSigmaSquaredUUpdate.o univariateGaussianNetworkLerouxSingleMHUpdate.o univariateGaussianNetworkLerouxSpatialRandomEffectsMHUpdate.o univariateGaussianNetworkLerouxTauSquaredUpdate.o univariateGaussianNetworkLerouxURandomEffectsUpdate.o univariatePoissonNetworkLerouxAllUpdate.o univariatePoissonNetworkLerouxBetaUpdate.o univariatePoissonNetworkLerouxRhoUpdate.o univariatePoissonNetworkLerouxSigmaSquaredUpdate.o univariatePoissonNetworkLerouxSingleUpdate.o univariatePoissonNetworkLerouxSpatialRandomEffectsUpdate.o univariatePoissonNetworkLerouxTauSquaredUpdate.o univariatePoissonNetworkLerouxURandomEffectsUpdate.o vectorTransposeVectorMultiplicationRcpp.o vectorVectorTransposeMultiplicationRcpp.o -llapack -lblas -lgfortran -lm -lquadmath -L/opt/R/4.3.1/lib/R/lib -lR
installing to /tmp/workdir/netcmc/old/netcmc.Rcheck/00LOCK-netcmc/00new/netcmc/libs
** R
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘MCMCpack’ in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]):
 there is no package called ‘quantreg’
Execution halted
ERROR: lazy loading failed for package ‘netcmc’
* removing ‘/tmp/workdir/netcmc/old/netcmc.Rcheck/netcmc’


```
# NetworkChange

<details>

* Version: 0.8
* GitHub: https://github.com/jongheepark/NetworkChange
* Source code: https://github.com/cran/NetworkChange
* Date/Publication: 2022-03-04 07:30:02 UTC
* Number of recursive dependencies: 131

Run `revdepcheck::cloud_details(, "NetworkChange")` for more info

</details>

## In both

*   checking whether package ‘NetworkChange’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/NetworkChange/new/NetworkChange.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘NetworkChange’ ...
** package ‘NetworkChange’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘MCMCpack’ in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]):
 there is no package called ‘quantreg’
Execution halted
ERROR: lazy loading failed for package ‘NetworkChange’
* removing ‘/tmp/workdir/NetworkChange/new/NetworkChange.Rcheck/NetworkChange’


```
### CRAN

```
* installing *source* package ‘NetworkChange’ ...
** package ‘NetworkChange’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘MCMCpack’ in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]):
 there is no package called ‘quantreg’
Execution halted
ERROR: lazy loading failed for package ‘NetworkChange’
* removing ‘/tmp/workdir/NetworkChange/old/NetworkChange.Rcheck/NetworkChange’


```
# pagoda2

<details>

* Version: 1.0.12
* GitHub: https://github.com/kharchenkolab/pagoda2
* Source code: https://github.com/cran/pagoda2
* Date/Publication: 2024-02-27 00:50:02 UTC
* Number of recursive dependencies: 162

Run `revdepcheck::cloud_details(, "pagoda2")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/pagoda2/new/pagoda2.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘pagoda2/DESCRIPTION’ ... OK
* this is package ‘pagoda2’ version ‘1.0.12’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘scde’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘pagoda2’ can be installed ... OK
* used C++ compiler: ‘g++ (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0’
* checking installed package size ... NOTE
  installed size is 10.3Mb
  sub-directories of 1Mb or more:
    R      1.5Mb
    libs   7.6Mb
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
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
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking line endings in Makefiles ... OK
* checking compilation flags in Makevars ... OK
* checking for GNU extensions in Makefiles ... OK
* checking for portable use of $(BLAS_LIBS) and $(LAPACK_LIBS) ... OK
* checking use of PKG_*FLAGS in Makefiles ... OK
* checking compiled code ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/pagoda2/old/pagoda2.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘pagoda2/DESCRIPTION’ ... OK
* this is package ‘pagoda2’ version ‘1.0.12’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘scde’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘pagoda2’ can be installed ... OK
* used C++ compiler: ‘g++ (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0’
* checking installed package size ... NOTE
  installed size is 10.3Mb
  sub-directories of 1Mb or more:
    R      1.5Mb
    libs   7.6Mb
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
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
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking line endings in Makefiles ... OK
* checking compilation flags in Makevars ... OK
* checking for GNU extensions in Makefiles ... OK
* checking for portable use of $(BLAS_LIBS) and $(LAPACK_LIBS) ... OK
* checking use of PKG_*FLAGS in Makefiles ... OK
* checking compiled code ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 2 NOTEs





```
# pcutils

<details>

* Version: 0.2.5
* GitHub: https://github.com/Asa12138/pcutils
* Source code: https://github.com/cran/pcutils
* Date/Publication: 2024-03-19 16:50:07 UTC
* Number of recursive dependencies: 277

Run `revdepcheck::cloud_details(, "pcutils")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/pcutils/new/pcutils.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘pcutils/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘pcutils’ version ‘0.2.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘ggpmisc’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘pcutils’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking startup messages can be suppressed ... OK
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
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/pcutils/old/pcutils.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘pcutils/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘pcutils’ version ‘0.2.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘ggpmisc’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘pcutils’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking startup messages can be suppressed ... OK
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
Status: 1 NOTE





```
# robber

<details>

* Version: 0.2.4
* GitHub: https://github.com/Chabert-Liddell/robber
* Source code: https://github.com/cran/robber
* Date/Publication: 2024-02-07 13:50:02 UTC
* Number of recursive dependencies: 144

Run `revdepcheck::cloud_details(, "robber")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/robber/new/robber.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘robber/DESCRIPTION’ ... OK
* this is package ‘robber’ version ‘0.2.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘robber’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking startup messages can be suppressed ... OK
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
* checking tests ... OK
  Running ‘spelling.R’
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... OK
  ‘topological-analysis.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK





```
### CRAN

```
* using log directory ‘/tmp/workdir/robber/old/robber.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘robber/DESCRIPTION’ ... OK
* this is package ‘robber’ version ‘0.2.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘robber’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
* checking R files for syntax errors ... OK
* checking whether the package can be loaded ... OK
* checking whether the package can be loaded with stated dependencies ... OK
* checking whether the package can be unloaded cleanly ... OK
* checking whether the namespace can be loaded with stated dependencies ... OK
* checking whether the namespace can be unloaded cleanly ... OK
* checking loading without being on the library search path ... OK
* checking startup messages can be suppressed ... OK
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
* checking tests ... OK
  Running ‘spelling.R’
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... OK
  ‘topological-analysis.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK





```
# rTwig

<details>

* Version: 1.0.2
* GitHub: https://github.com/aidanmorales/rTwig
* Source code: https://github.com/cran/rTwig
* Date/Publication: 2024-04-08 15:00:02 UTC
* Number of recursive dependencies: 188

Run `revdepcheck::cloud_details(, "rTwig")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/rTwig/new/rTwig.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘rTwig/DESCRIPTION’ ... OK
* this is package ‘rTwig’ version ‘1.0.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required and available but unsuitable version: ‘Matrix’

Package suggested but not available for checking: ‘ggpmisc’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/rTwig/old/rTwig.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘rTwig/DESCRIPTION’ ... OK
* this is package ‘rTwig’ version ‘1.0.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required and available but unsuitable version: ‘Matrix’

Package suggested but not available for checking: ‘ggpmisc’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# scDiffCom

<details>

* Version: 1.0.0
* GitHub: NA
* Source code: https://github.com/cran/scDiffCom
* Date/Publication: 2023-11-03 18:40:02 UTC
* Number of recursive dependencies: 257

Run `revdepcheck::cloud_details(, "scDiffCom")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/scDiffCom/new/scDiffCom.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘scDiffCom/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘scDiffCom’ version ‘1.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘Seurat’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/scDiffCom/old/scDiffCom.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘scDiffCom/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘scDiffCom’ version ‘1.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘Seurat’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# SignacX

<details>

* Version: 2.2.5
* GitHub: https://github.com/mathewchamberlain/SignacX
* Source code: https://github.com/cran/SignacX
* Date/Publication: 2021-11-18 16:20:03 UTC
* Number of recursive dependencies: 172

Run `revdepcheck::cloud_details(, "SignacX")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/SignacX/new/SignacX.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘SignacX/DESCRIPTION’ ... OK
* this is package ‘SignacX’ version ‘2.2.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘Seurat’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/SignacX/old/SignacX.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘SignacX/DESCRIPTION’ ... OK
* this is package ‘SignacX’ version ‘2.2.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘Seurat’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# streamDAG

<details>

* Version: 1.5
* GitHub: NA
* Source code: https://github.com/cran/streamDAG
* Date/Publication: 2023-10-06 18:50:02 UTC
* Number of recursive dependencies: 133

Run `revdepcheck::cloud_details(, "streamDAG")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/streamDAG/new/streamDAG.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘streamDAG/DESCRIPTION’ ... OK
* this is package ‘streamDAG’ version ‘1.5’
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
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘streamDAG/DESCRIPTION’ ... OK
* this is package ‘streamDAG’ version ‘1.5’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘asbio’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# treefit

<details>

* Version: 1.0.2
* GitHub: https://github.com/hayamizu-lab/treefit-r
* Source code: https://github.com/cran/treefit
* Date/Publication: 2022-01-18 07:50:02 UTC
* Number of recursive dependencies: 159

Run `revdepcheck::cloud_details(, "treefit")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/treefit/new/treefit.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘treefit/DESCRIPTION’ ... OK
* this is package ‘treefit’ version ‘1.0.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘Seurat’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘treefit’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
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
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... WARNING
Errors in running code in vignettes:
when running code in ‘working-with-seurat.Rmd’
  ...


> trapnell.dynverse <- readRDS(trapnell.path)

> trapnell <- Seurat::CreateSeuratObject(counts = t(trapnell.dynverse$count), 
+     min.cells = 3, min.features = 200)

  When sourcing ‘working-with-seurat.R’:
Error: there is no package called ‘Seurat’
Execution halted

  ‘treefit.Rmd’ using ‘UTF-8’... OK
  ‘working-with-seurat.Rmd’ using ‘UTF-8’... failed
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 WARNING, 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/treefit/old/treefit.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘treefit/DESCRIPTION’ ... OK
* this is package ‘treefit’ version ‘1.0.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘Seurat’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘treefit’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
* checking DESCRIPTION meta-information ... OK
* checking top-level files ... OK
* checking for left-over files ... OK
* checking index information ... OK
* checking package subdirectories ... OK
* checking R files for non-ASCII characters ... OK
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
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... WARNING
Errors in running code in vignettes:
when running code in ‘working-with-seurat.Rmd’
  ...


> trapnell.dynverse <- readRDS(trapnell.path)

> trapnell <- Seurat::CreateSeuratObject(counts = t(trapnell.dynverse$count), 
+     min.cells = 3, min.features = 200)

  When sourcing ‘working-with-seurat.R’:
Error: there is no package called ‘Seurat’
Execution halted

  ‘treefit.Rmd’ using ‘UTF-8’... OK
  ‘working-with-seurat.Rmd’ using ‘UTF-8’... failed
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 WARNING, 1 NOTE





```
