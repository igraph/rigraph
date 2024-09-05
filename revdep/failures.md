# bnlearn

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/bnlearn
* Number of recursive dependencies: 36

Run `revdepcheck::cloud_details(, "bnlearn")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# bsub

<details>

* Version: 1.1.0
* GitHub: https://github.com/jokergoo/bsub
* Source code: https://github.com/cran/bsub
* Date/Publication: 2021-07-01 15:50:10 UTC
* Number of recursive dependencies: 79

Run `revdepcheck::cloud_details(, "bsub")` for more info

</details>

## In both

*   checking whether package ‘bsub’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/bsub/new/bsub.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘bsub’ ...
** package ‘bsub’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘rjson’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘bsub’
* removing ‘/tmp/workdir/bsub/new/bsub.Rcheck/bsub’


```
### CRAN

```
* installing *source* package ‘bsub’ ...
** package ‘bsub’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘rjson’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘bsub’
* removing ‘/tmp/workdir/bsub/old/bsub.Rcheck/bsub’


```
# CARBayes

<details>

* Version: 6.1.1
* GitHub: https://github.com/duncanplee/CARBayes
* Source code: https://github.com/cran/CARBayes
* Date/Publication: 2024-03-08 13:20:02 UTC
* Number of recursive dependencies: 137

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
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
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
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘CARBayes’
* removing ‘/tmp/workdir/CARBayes/old/CARBayes.Rcheck/CARBayes’


```
# chemodiv

<details>

* Version: 0.3.0
* GitHub: https://github.com/hpetren/chemodiv
* Source code: https://github.com/cran/chemodiv
* Date/Publication: 2023-08-17 17:52:33 UTC
* Number of recursive dependencies: 170

Run `revdepcheck::cloud_details(, "chemodiv")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/chemodiv/new/chemodiv.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘chemodiv/DESCRIPTION’ ... OK
...
* this is package ‘chemodiv’ version ‘0.3.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'fmcsR', 'ChemmineR'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/chemodiv/old/chemodiv.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘chemodiv/DESCRIPTION’ ... OK
...
* this is package ‘chemodiv’ version ‘0.3.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'fmcsR', 'ChemmineR'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# CNVScope

<details>

* Version: 3.7.2
* GitHub: https://github.com/jamesdalg/CNVScope
* Source code: https://github.com/cran/CNVScope
* Date/Publication: 2022-03-30 23:40:08 UTC
* Number of recursive dependencies: 206

Run `revdepcheck::cloud_details(, "CNVScope")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/CNVScope/new/CNVScope.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘CNVScope/DESCRIPTION’ ... OK
...
Packages required but not available: 'GenomicInteractions', 'rtracklayer'

Packages suggested but not available for checking:
  'ComplexHeatmap', 'HiCseg', 'GenomicFeatures',
  'BSgenome.Hsapiens.UCSC.hg19'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/CNVScope/old/CNVScope.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘CNVScope/DESCRIPTION’ ... OK
...
Packages required but not available: 'GenomicInteractions', 'rtracklayer'

Packages suggested but not available for checking:
  'ComplexHeatmap', 'HiCseg', 'GenomicFeatures',
  'BSgenome.Hsapiens.UCSC.hg19'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# ConnectednessApproach

<details>

* Version: 1.0.3
* GitHub: NA
* Source code: https://github.com/cran/ConnectednessApproach
* Date/Publication: 2024-06-16 16:20:02 UTC
* Number of recursive dependencies: 131

Run `revdepcheck::cloud_details(, "ConnectednessApproach")` for more info

</details>

## In both

*   checking whether package ‘ConnectednessApproach’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/ConnectednessApproach/new/ConnectednessApproach.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘ConnectednessApproach’ ...
** package ‘ConnectednessApproach’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘ConnectednessApproach’
* removing ‘/tmp/workdir/ConnectednessApproach/new/ConnectednessApproach.Rcheck/ConnectednessApproach’


```
### CRAN

```
* installing *source* package ‘ConnectednessApproach’ ...
** package ‘ConnectednessApproach’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘ConnectednessApproach’
* removing ‘/tmp/workdir/ConnectednessApproach/old/ConnectednessApproach.Rcheck/ConnectednessApproach’


```
# conos

<details>

* Version: 1.5.2
* GitHub: https://github.com/kharchenkolab/conos
* Source code: https://github.com/cran/conos
* Date/Publication: 2024-02-26 19:30:05 UTC
* Number of recursive dependencies: 240

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
...
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘ComplexHeatmap’

Package suggested but not available for checking: ‘pagoda2’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





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
...
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘ComplexHeatmap’

Package suggested but not available for checking: ‘pagoda2’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# crosstalkr

<details>

* Version: 1.0.5
* GitHub: NA
* Source code: https://github.com/cran/crosstalkr
* Date/Publication: 2024-05-17 11:40:09 UTC
* Number of recursive dependencies: 164

Run `revdepcheck::cloud_details(, "crosstalkr")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/crosstalkr/new/crosstalkr.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘crosstalkr/DESCRIPTION’ ... OK
...
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘ensembldb’

Package suggested but not available for checking: ‘EnsDb.Hsapiens.v86’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/crosstalkr/old/crosstalkr.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘crosstalkr/DESCRIPTION’ ... OK
...
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘ensembldb’

Package suggested but not available for checking: ‘EnsDb.Hsapiens.v86’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# datapack

<details>

* Version: 1.4.1
* GitHub: https://github.com/ropensci/datapack
* Source code: https://github.com/cran/datapack
* Date/Publication: 2022-06-10 19:40:01 UTC
* Number of recursive dependencies: 68

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
# DrugSim2DR

<details>

* Version: 0.1.1
* GitHub: NA
* Source code: https://github.com/cran/DrugSim2DR
* Date/Publication: 2023-08-10 04:50:02 UTC
* Number of recursive dependencies: 89

Run `revdepcheck::cloud_details(, "DrugSim2DR")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/DrugSim2DR/new/DrugSim2DR.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘DrugSim2DR/DESCRIPTION’ ... OK
...
* this is package ‘DrugSim2DR’ version ‘0.1.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘ChemmineR’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/DrugSim2DR/old/DrugSim2DR.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘DrugSim2DR/DESCRIPTION’ ... OK
...
* this is package ‘DrugSim2DR’ version ‘0.1.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘ChemmineR’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# DRviaSPCN

<details>

* Version: 0.1.4
* GitHub: NA
* Source code: https://github.com/cran/DRviaSPCN
* Date/Publication: 2024-01-13 05:00:02 UTC
* Number of recursive dependencies: 180

Run `revdepcheck::cloud_details(, "DRviaSPCN")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/DRviaSPCN/new/DRviaSPCN.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘DRviaSPCN/DESCRIPTION’ ... OK
...
* this is package ‘DRviaSPCN’ version ‘0.1.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘ChemmineR’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/DRviaSPCN/old/DRviaSPCN.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘DRviaSPCN/DESCRIPTION’ ... OK
...
* this is package ‘DRviaSPCN’ version ‘0.1.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘ChemmineR’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# easybgm

<details>

* Version: 0.1.2
* GitHub: https://github.com/KarolineHuth/easybgm
* Source code: https://github.com/cran/easybgm
* Date/Publication: 2024-03-13 13:40:02 UTC
* Number of recursive dependencies: 175

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
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
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
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘easybgm’
* removing ‘/tmp/workdir/easybgm/old/easybgm.Rcheck/easybgm’


```
# erah

<details>

* Version: 2.0.1
* GitHub: https://github.com/xdomingoal/erah-devel
* Source code: https://github.com/cran/erah
* Date/Publication: 2023-12-20 10:10:02 UTC
* Number of recursive dependencies: 91

Run `revdepcheck::cloud_details(, "erah")` for more info

</details>

## In both

*   checking whether package ‘erah’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/erah/new/erah.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘erah’ ...
** package ‘erah’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C compiler: ‘gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0’
gcc -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c registerDynamicSymbol.c -o registerDynamicSymbol.o
gcc -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c runfunc.c -o runfunc.o
gcc -shared -L/opt/R/4.3.1/lib/R/lib -L/usr/local/lib -o erah.so registerDynamicSymbol.o runfunc.o -L/opt/R/4.3.1/lib/R/lib -lR
installing to /tmp/workdir/erah/new/erah.Rcheck/00LOCK-erah/00new/erah/libs
** R
...
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘erah’
* removing ‘/tmp/workdir/erah/new/erah.Rcheck/erah’


```
### CRAN

```
* installing *source* package ‘erah’ ...
** package ‘erah’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C compiler: ‘gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0’
gcc -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c registerDynamicSymbol.c -o registerDynamicSymbol.o
gcc -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c runfunc.c -o runfunc.o
gcc -shared -L/opt/R/4.3.1/lib/R/lib -L/usr/local/lib -o erah.so registerDynamicSymbol.o runfunc.o -L/opt/R/4.3.1/lib/R/lib -lR
installing to /tmp/workdir/erah/old/erah.Rcheck/00LOCK-erah/00new/erah/libs
** R
...
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘erah’
* removing ‘/tmp/workdir/erah/old/erah.Rcheck/erah’


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
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
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
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
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
# GALLO

<details>

* Version: 1.5
* GitHub: NA
* Source code: https://github.com/cran/GALLO
* Date/Publication: 2024-06-04 15:30:20 UTC
* Number of recursive dependencies: 142

Run `revdepcheck::cloud_details(, "GALLO")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/GALLO/new/GALLO.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘GALLO/DESCRIPTION’ ... OK
...
* this is package ‘GALLO’ version ‘1.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rtracklayer’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/GALLO/old/GALLO.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘GALLO/DESCRIPTION’ ... OK
...
* this is package ‘GALLO’ version ‘1.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rtracklayer’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# kstMatrix

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/kstMatrix
* Number of recursive dependencies: 35

Run `revdepcheck::cloud_details(, "kstMatrix")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






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
Error: package or namespace load failed for ‘MCMCpack’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
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
Error: package or namespace load failed for ‘MCMCpack’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Execution halted
ERROR: lazy loading failed for package ‘manet’
* removing ‘/tmp/workdir/manet/old/manet.Rcheck/manet’


```
# mlmts

<details>

* Version: 1.1.2
* GitHub: NA
* Source code: https://github.com/cran/mlmts
* Date/Publication: 2024-08-18 08:40:06 UTC
* Number of recursive dependencies: 242

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
 namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
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
 namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Error: unable to load R code in package ‘mlmts’
Execution halted
ERROR: lazy loading failed for package ‘mlmts’
* removing ‘/tmp/workdir/mlmts/old/mlmts.Rcheck/mlmts’


```
# multinma

<details>

* Version: 0.7.1
* GitHub: https://github.com/dmphillippo/multinma
* Source code: https://github.com/cran/multinma
* Date/Publication: 2024-06-11 12:20:06 UTC
* Number of recursive dependencies: 152

Run `revdepcheck::cloud_details(, "multinma")` for more info

</details>

## In both

*   checking whether package ‘multinma’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/multinma/new/multinma.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘multinma’ ...
** package ‘multinma’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0’
using C++17


g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG -I"../inst/include" -I"/opt/R/4.3.1/lib/R/site-library/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -DUSE_STANC3 -D_HAS_AUTO_PTR_ETC=0 -I'/opt/R/4.3.1/lib/R/site-library/BH/include' -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppEigen/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppParallel/include' -I'/opt/R/4.3.1/lib/R/site-library/rstan/include' -I'/opt/R/4.3.1/lib/R/site-library/StanHeaders/include' -I/usr/local/include    -I'/opt/R/4.3.1/lib/R/site-library/RcppParallel/include' -D_REENTRANT -DSTAN_THREADS   -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
In file included from /opt/R/4.3.1/lib/R/site-library/RcppEigen/include/Eigen/Core:205,
...
/opt/R/4.3.1/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:56:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/opt/R/4.3.1/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:10:   required from here
/opt/R/4.3.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:654:74: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  654 |   return internal::first_aligned<int(unpacket_traits<DefaultPacketType>::alignment),Derived>(m);
      |                                                                          ^~~~~~~~~
g++: fatal error: Killed signal terminated program cc1plus
compilation terminated.
make: *** [/opt/R/4.3.1/lib/R/etc/Makeconf:198: stanExports_survival_param.o] Error 1
ERROR: compilation failed for package ‘multinma’
* removing ‘/tmp/workdir/multinma/new/multinma.Rcheck/multinma’


```
### CRAN

```
* installing *source* package ‘multinma’ ...
** package ‘multinma’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0’
using C++17


g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG -I"../inst/include" -I"/opt/R/4.3.1/lib/R/site-library/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -DUSE_STANC3 -D_HAS_AUTO_PTR_ETC=0 -I'/opt/R/4.3.1/lib/R/site-library/BH/include' -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppEigen/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppParallel/include' -I'/opt/R/4.3.1/lib/R/site-library/rstan/include' -I'/opt/R/4.3.1/lib/R/site-library/StanHeaders/include' -I/usr/local/include    -I'/opt/R/4.3.1/lib/R/site-library/RcppParallel/include' -D_REENTRANT -DSTAN_THREADS   -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
In file included from /opt/R/4.3.1/lib/R/site-library/RcppEigen/include/Eigen/Core:205,
...
/opt/R/4.3.1/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:56:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/opt/R/4.3.1/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:10:   required from here
/opt/R/4.3.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:654:74: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  654 |   return internal::first_aligned<int(unpacket_traits<DefaultPacketType>::alignment),Derived>(m);
      |                                                                          ^~~~~~~~~
g++: fatal error: Killed signal terminated program cc1plus
compilation terminated.
make: *** [/opt/R/4.3.1/lib/R/etc/Makeconf:198: stanExports_survival_param.o] Error 1
ERROR: compilation failed for package ‘multinma’
* removing ‘/tmp/workdir/multinma/old/multinma.Rcheck/multinma’


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
...
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c vectorVectorTransposeMultiplicationRcpp.cpp -o vectorVectorTransposeMultiplicationRcpp.o
g++ -std=gnu++11 -shared -L/opt/R/4.3.1/lib/R/lib -L/usr/local/lib -o netcmc.so RcppExports.o choleskyDecompositionRcppConversion.o doubleMatrixMultiplicationRcpp.o doubleVectorMultiplicationRcpp.o eigenValuesRcppConversion.o getDiagonalMatrix.o getExp.o getExpDividedByOnePlusExp.o getMeanCenteredRandomEffects.o getMultivariateBinomialNetworkLerouxDIC.o getMultivariateBinomialNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getMultivariateGaussianNetworkLerouxDIC.o getMultivariateGaussianNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getMultivariatePoissonNetworkLerouxDIC.o getMultivariatePoissonNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getNonZeroEntries.o getSubvector.o getSubvectorIndecies.o getSumExpNetwork.o getSumExpNetworkIndecies.o getSumExpNetworkLeroux.o getSumExpNetworkLerouxIndecies.o getSumLogExp.o getSumLogExpIndecies.o getSumVector.o getTripletForm.o getUnivariateBinomialNetworkLerouxDIC.o getUnivariateBinomialNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getUnivariateGaussianNetworkLerouxDIC.o getUnivariateGaussianNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getUnivariatePoissonNetworkDIC.o getUnivariatePoissonNetworkFittedValuesAndLikelihoodForDICEveryIteration.o getUnivariatePoissonNetworkLerouxDIC.o getUnivariatePoissonNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getVectorMean.o matrixInverseRcppConversion.o matrixMatrixAdditionRcpp.o matrixMatrixSubtractionRcpp.o matrixVectorMultiplicationRcpp.o multivariateBinomialNetworkLerouxAllUpdate.o multivariateBinomialNetworkLerouxBetaUpdate.o multivariateBinomialNetworkLerouxRhoUpdate.o multivariateBinomialNetworkLerouxSingleUpdate.o multivariateBinomialNetworkLerouxSpatialRandomEffectsUpdate.o multivariateBinomialNetworkLerouxTauSquaredUpdate.o multivariateBinomialNetworkLerouxURandomEffectsUpdate.o multivariateBinomialNetworkLerouxVRandomEffectsUpdate.o multivariateBinomialNetworkLerouxVarianceCovarianceUUpdate.o multivariateBinomialNetworkRandAllUpdate.o multivariateBinomialNetworkRandSingleUpdate.o multivariateGaussianNetworkLerouxAllMHUpdate.o multivariateGaussianNetworkLerouxBetaUpdate.o multivariateGaussianNetworkLerouxRhoUpdate.o multivariateGaussianNetworkLerouxSigmaSquaredEUpdate.o multivariateGaussianNetworkLerouxSingleMHUpdate.o multivariateGaussianNetworkLerouxSpatialRandomEffectsMHUpdate.o multivariateGaussianNetworkLerouxTauSquaredUpdate.o multivariateGaussianNetworkLerouxURandomEffectsUpdate.o multivariateGaussianNetworkLerouxVarianceCovarianceUUpdate.o multivariateGaussianNetworkRandAllUpdate.o multivariateGaussianNetworkRandSingleUpdate.o multivariateGaussianNetworkRandVRandomEffectsUpdate.o multivariatePoissonNetworkLerouxAllUpdate.o multivariatePoissonNetworkLerouxBetaUpdate.o multivariatePoissonNetworkLerouxRhoUpdate.o multivariatePoissonNetworkLerouxSingleUpdate.o multivariatePoissonNetworkLerouxSpatialRandomEffectsUpdate.o multivariatePoissonNetworkLerouxTauSquaredUpdate.o multivariatePoissonNetworkLerouxURandomEffectsUpdate.o multivariatePoissonNetworkLerouxVRandomEffectsUpdate.o multivariatePoissonNetworkLerouxVarianceCovarianceUUpdate.o multivariatePoissonNetworkRandAllUpdate.o multivariatePoissonNetworkRandSingleUpdate.o sumMatrix.o univariateBinomialNetworkLerouxAllUpdate.o univariateBinomialNetworkLerouxBetaUpdate.o univariateBinomialNetworkLerouxRhoUpdate.o univariateBinomialNetworkLerouxSigmaSquaredUpdate.o univariateBinomialNetworkLerouxSingleUpdate.o univariateBinomialNetworkLerouxSpatialRandomEffectsUpdate.o univariateBinomialNetworkLerouxTauSquaredUpdate.o univariateBinomialNetworkLerouxURandomEffectsUpdate.o univariateGaussianNetworkLerouxAllMHUpdate.o univariateGaussianNetworkLerouxBetaUpdate.o univariateGaussianNetworkLerouxRhoUpdate.o univariateGaussianNetworkLerouxSigmaSquaredEUpdate.o univariateGaussianNetworkLerouxSigmaSquaredUUpdate.o univariateGaussianNetworkLerouxSingleMHUpdate.o univariateGaussianNetworkLerouxSpatialRandomEffectsMHUpdate.o univariateGaussianNetworkLerouxTauSquaredUpdate.o univariateGaussianNetworkLerouxURandomEffectsUpdate.o univariatePoissonNetworkLerouxAllUpdate.o univariatePoissonNetworkLerouxBetaUpdate.o univariatePoissonNetworkLerouxRhoUpdate.o univariatePoissonNetworkLerouxSigmaSquaredUpdate.o univariatePoissonNetworkLerouxSingleUpdate.o univariatePoissonNetworkLerouxSpatialRandomEffectsUpdate.o univariatePoissonNetworkLerouxTauSquaredUpdate.o univariatePoissonNetworkLerouxURandomEffectsUpdate.o vectorTransposeVectorMultiplicationRcpp.o vectorVectorTransposeMultiplicationRcpp.o -llapack -lblas -lgfortran -lm -lquadmath -L/opt/R/4.3.1/lib/R/lib -lR
installing to /tmp/workdir/netcmc/new/netcmc.Rcheck/00LOCK-netcmc/00new/netcmc/libs
** R
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘MCMCpack’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
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
...
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppArmadillo/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppProgress/include' -I/usr/local/include    -fpic  -g -O2  -c vectorVectorTransposeMultiplicationRcpp.cpp -o vectorVectorTransposeMultiplicationRcpp.o
g++ -std=gnu++11 -shared -L/opt/R/4.3.1/lib/R/lib -L/usr/local/lib -o netcmc.so RcppExports.o choleskyDecompositionRcppConversion.o doubleMatrixMultiplicationRcpp.o doubleVectorMultiplicationRcpp.o eigenValuesRcppConversion.o getDiagonalMatrix.o getExp.o getExpDividedByOnePlusExp.o getMeanCenteredRandomEffects.o getMultivariateBinomialNetworkLerouxDIC.o getMultivariateBinomialNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getMultivariateGaussianNetworkLerouxDIC.o getMultivariateGaussianNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getMultivariatePoissonNetworkLerouxDIC.o getMultivariatePoissonNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getNonZeroEntries.o getSubvector.o getSubvectorIndecies.o getSumExpNetwork.o getSumExpNetworkIndecies.o getSumExpNetworkLeroux.o getSumExpNetworkLerouxIndecies.o getSumLogExp.o getSumLogExpIndecies.o getSumVector.o getTripletForm.o getUnivariateBinomialNetworkLerouxDIC.o getUnivariateBinomialNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getUnivariateGaussianNetworkLerouxDIC.o getUnivariateGaussianNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getUnivariatePoissonNetworkDIC.o getUnivariatePoissonNetworkFittedValuesAndLikelihoodForDICEveryIteration.o getUnivariatePoissonNetworkLerouxDIC.o getUnivariatePoissonNetworkLerouxFittedValuesAndLikelihoodForDICEveryIteration.o getVectorMean.o matrixInverseRcppConversion.o matrixMatrixAdditionRcpp.o matrixMatrixSubtractionRcpp.o matrixVectorMultiplicationRcpp.o multivariateBinomialNetworkLerouxAllUpdate.o multivariateBinomialNetworkLerouxBetaUpdate.o multivariateBinomialNetworkLerouxRhoUpdate.o multivariateBinomialNetworkLerouxSingleUpdate.o multivariateBinomialNetworkLerouxSpatialRandomEffectsUpdate.o multivariateBinomialNetworkLerouxTauSquaredUpdate.o multivariateBinomialNetworkLerouxURandomEffectsUpdate.o multivariateBinomialNetworkLerouxVRandomEffectsUpdate.o multivariateBinomialNetworkLerouxVarianceCovarianceUUpdate.o multivariateBinomialNetworkRandAllUpdate.o multivariateBinomialNetworkRandSingleUpdate.o multivariateGaussianNetworkLerouxAllMHUpdate.o multivariateGaussianNetworkLerouxBetaUpdate.o multivariateGaussianNetworkLerouxRhoUpdate.o multivariateGaussianNetworkLerouxSigmaSquaredEUpdate.o multivariateGaussianNetworkLerouxSingleMHUpdate.o multivariateGaussianNetworkLerouxSpatialRandomEffectsMHUpdate.o multivariateGaussianNetworkLerouxTauSquaredUpdate.o multivariateGaussianNetworkLerouxURandomEffectsUpdate.o multivariateGaussianNetworkLerouxVarianceCovarianceUUpdate.o multivariateGaussianNetworkRandAllUpdate.o multivariateGaussianNetworkRandSingleUpdate.o multivariateGaussianNetworkRandVRandomEffectsUpdate.o multivariatePoissonNetworkLerouxAllUpdate.o multivariatePoissonNetworkLerouxBetaUpdate.o multivariatePoissonNetworkLerouxRhoUpdate.o multivariatePoissonNetworkLerouxSingleUpdate.o multivariatePoissonNetworkLerouxSpatialRandomEffectsUpdate.o multivariatePoissonNetworkLerouxTauSquaredUpdate.o multivariatePoissonNetworkLerouxURandomEffectsUpdate.o multivariatePoissonNetworkLerouxVRandomEffectsUpdate.o multivariatePoissonNetworkLerouxVarianceCovarianceUUpdate.o multivariatePoissonNetworkRandAllUpdate.o multivariatePoissonNetworkRandSingleUpdate.o sumMatrix.o univariateBinomialNetworkLerouxAllUpdate.o univariateBinomialNetworkLerouxBetaUpdate.o univariateBinomialNetworkLerouxRhoUpdate.o univariateBinomialNetworkLerouxSigmaSquaredUpdate.o univariateBinomialNetworkLerouxSingleUpdate.o univariateBinomialNetworkLerouxSpatialRandomEffectsUpdate.o univariateBinomialNetworkLerouxTauSquaredUpdate.o univariateBinomialNetworkLerouxURandomEffectsUpdate.o univariateGaussianNetworkLerouxAllMHUpdate.o univariateGaussianNetworkLerouxBetaUpdate.o univariateGaussianNetworkLerouxRhoUpdate.o univariateGaussianNetworkLerouxSigmaSquaredEUpdate.o univariateGaussianNetworkLerouxSigmaSquaredUUpdate.o univariateGaussianNetworkLerouxSingleMHUpdate.o univariateGaussianNetworkLerouxSpatialRandomEffectsMHUpdate.o univariateGaussianNetworkLerouxTauSquaredUpdate.o univariateGaussianNetworkLerouxURandomEffectsUpdate.o univariatePoissonNetworkLerouxAllUpdate.o univariatePoissonNetworkLerouxBetaUpdate.o univariatePoissonNetworkLerouxRhoUpdate.o univariatePoissonNetworkLerouxSigmaSquaredUpdate.o univariatePoissonNetworkLerouxSingleUpdate.o univariatePoissonNetworkLerouxSpatialRandomEffectsUpdate.o univariatePoissonNetworkLerouxTauSquaredUpdate.o univariatePoissonNetworkLerouxURandomEffectsUpdate.o vectorTransposeVectorMultiplicationRcpp.o vectorVectorTransposeMultiplicationRcpp.o -llapack -lblas -lgfortran -lm -lquadmath -L/opt/R/4.3.1/lib/R/lib -lR
installing to /tmp/workdir/netcmc/old/netcmc.Rcheck/00LOCK-netcmc/00new/netcmc/libs
** R
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘MCMCpack’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
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
* Number of recursive dependencies: 133

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
Error: package or namespace load failed for ‘MCMCpack’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
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
Error: package or namespace load failed for ‘MCMCpack’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Execution halted
ERROR: lazy loading failed for package ‘NetworkChange’
* removing ‘/tmp/workdir/NetworkChange/old/NetworkChange.Rcheck/NetworkChange’


```
# ohun

<details>

* Version: 1.0.2
* GitHub: https://github.com/ropensci/ohun
* Source code: https://github.com/cran/ohun
* Date/Publication: 2024-08-19 18:40:02 UTC
* Number of recursive dependencies: 100

Run `revdepcheck::cloud_details(, "ohun")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/ohun/new/ohun.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ohun/DESCRIPTION’ ... OK
...
* this is package ‘ohun’ version ‘1.0.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘warbleR’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/ohun/old/ohun.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ohun/DESCRIPTION’ ... OK
...
* this is package ‘ohun’ version ‘1.0.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘warbleR’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





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
...
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rjson’

Package suggested but not available for checking: ‘scde’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





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
...
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rjson’

Package suggested but not available for checking: ‘scde’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# PathwaySpace

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/PathwaySpace
* Number of recursive dependencies: 70

Run `revdepcheck::cloud_details(, "PathwaySpace")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# piecewiseSEM

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/piecewiseSEM
* Number of recursive dependencies: 108

Run `revdepcheck::cloud_details(, "piecewiseSEM")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# RGraphSpace

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/RGraphSpace
* Number of recursive dependencies: 65

Run `revdepcheck::cloud_details(, "RGraphSpace")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# rTwig

<details>

* Version: 1.1.0
* GitHub: https://github.com/aidanmorales/rTwig
* Source code: https://github.com/cran/rTwig
* Date/Publication: 2024-08-21 00:50:02 UTC
* Number of recursive dependencies: 147

Run `revdepcheck::cloud_details(, "rTwig")` for more info

</details>

## In both

*   checking whether package ‘rTwig’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/rTwig/new/rTwig.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘rTwig’ ...
** package ‘rTwig’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0’
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I/usr/local/include    -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I/usr/local/include    -fpic  -g -O2  -c box_counting.cpp -o box_counting.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I/usr/local/include    -fpic  -g -O2  -c colors.cpp -o colors.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I/usr/local/include    -fpic  -g -O2  -c convex_hull.cpp -o convex_hull.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I/usr/local/include    -fpic  -g -O2  -c cylinder_mesh.cpp -o cylinder_mesh.o
...
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘rTwig’
* removing ‘/tmp/workdir/rTwig/new/rTwig.Rcheck/rTwig’


```
### CRAN

```
* installing *source* package ‘rTwig’ ...
** package ‘rTwig’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0’
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I/usr/local/include    -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I/usr/local/include    -fpic  -g -O2  -c box_counting.cpp -o box_counting.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I/usr/local/include    -fpic  -g -O2  -c colors.cpp -o colors.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I/usr/local/include    -fpic  -g -O2  -c convex_hull.cpp -o convex_hull.o
g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I/usr/local/include    -fpic  -g -O2  -c cylinder_mesh.cpp -o cylinder_mesh.o
...
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  namespace ‘Matrix’ 1.5-4.1 is already loaded, but >= 1.6.0 is required
Calls: <Anonymous> ... namespaceImportFrom -> asNamespace -> loadNamespace
Execution halted
ERROR: lazy loading failed for package ‘rTwig’
* removing ‘/tmp/workdir/rTwig/old/rTwig.Rcheck/rTwig’


```
# Seurat

<details>

* Version: 5.1.0
* GitHub: https://github.com/satijalab/seurat
* Source code: https://github.com/cran/Seurat
* Date/Publication: 2024-05-10 17:23:17 UTC
* Number of recursive dependencies: 267

Run `revdepcheck::cloud_details(, "Seurat")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/Seurat/new/Seurat.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Seurat/DESCRIPTION’ ... OK
...
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘Seurat’ can be installed ... ERROR
Installation failed.
See ‘/tmp/workdir/Seurat/new/Seurat.Rcheck/00install.out’ for details.
* DONE
Status: 1 ERROR, 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/Seurat/old/Seurat.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Seurat/DESCRIPTION’ ... OK
...
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘Seurat’ can be installed ... ERROR
Installation failed.
See ‘/tmp/workdir/Seurat/old/Seurat.Rcheck/00install.out’ for details.
* DONE
Status: 1 ERROR, 1 NOTE





```
# speakeasyR

<details>

* Version: 0.1.3
* GitHub: https://github.com/SpeakEasy-2/speakeasyR
* Source code: https://github.com/cran/speakeasyR
* Date/Publication: 2024-08-20 09:40:06 UTC
* Number of recursive dependencies: 138

Run `revdepcheck::cloud_details(, "speakeasyR")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/speakeasyR/new/speakeasyR.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘speakeasyR/DESCRIPTION’ ... OK
...
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... OK
  ‘speakeasyR.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/speakeasyR/old/speakeasyR.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘speakeasyR/DESCRIPTION’ ... OK
...
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... OK
  ‘speakeasyR.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# streamDAG

<details>

* Version: 1.5
* GitHub: NA
* Source code: https://github.com/cran/streamDAG
* Date/Publication: 2023-10-06 18:50:02 UTC
* Number of recursive dependencies: 132

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
# SubtypeDrug

<details>

* Version: 0.1.9
* GitHub: https://github.com/hanjunwei-lab/SubtypeDrug
* Source code: https://github.com/cran/SubtypeDrug
* Date/Publication: 2024-04-17 06:40:02 UTC
* Number of recursive dependencies: 153

Run `revdepcheck::cloud_details(, "SubtypeDrug")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/SubtypeDrug/new/SubtypeDrug.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘SubtypeDrug/DESCRIPTION’ ... OK
...
* this is package ‘SubtypeDrug’ version ‘0.1.9’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘ChemmineR’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/SubtypeDrug/old/SubtypeDrug.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘SubtypeDrug/DESCRIPTION’ ... OK
...
* this is package ‘SubtypeDrug’ version ‘0.1.9’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘ChemmineR’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# topologyGSA

<details>

* Version: 1.5.0
* GitHub: NA
* Source code: https://github.com/cran/topologyGSA
* Date/Publication: 2023-09-25 18:20:02 UTC
* Number of recursive dependencies: 86

Run `revdepcheck::cloud_details(, "topologyGSA")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/topologyGSA/new/topologyGSA.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘topologyGSA/DESCRIPTION’ ... OK
* this is package ‘topologyGSA’ version ‘1.5.0’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘qpgraph’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/topologyGSA/old/topologyGSA.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
    GNU Fortran (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
* running under: Ubuntu 22.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘topologyGSA/DESCRIPTION’ ... OK
* this is package ‘topologyGSA’ version ‘1.5.0’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘qpgraph’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
