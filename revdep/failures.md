# mazeGen

<details>

* Version: 0.1.3
* GitHub: NA
* Source code: https://github.com/cran/mazeGen
* Date/Publication: 2017-12-04 17:34:53 UTC
* Number of recursive dependencies: 10

Run `revdepcheck::cloud_details(, "mazeGen")` for more info

</details>

## Newly broken

*   checking whether package ‘mazeGen’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/mazeGen/new/mazeGen.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘mazeGen’ ...
** package ‘mazeGen’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
  'simplify' should only be used for graph literals
Error: unable to load R code in package ‘mazeGen’
Execution halted
ERROR: lazy loading failed for package ‘mazeGen’
* removing ‘/tmp/workdir/mazeGen/new/mazeGen.Rcheck/mazeGen’


```
### CRAN

```
* installing *source* package ‘mazeGen’ ...
** package ‘mazeGen’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (mazeGen)


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
    gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
    GNU Fortran (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
* running under: Ubuntu 20.04.6 LTS
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
    gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
    GNU Fortran (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
* running under: Ubuntu 20.04.6 LTS
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
