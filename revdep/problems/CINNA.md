# CINNA (1.2.2)

* GitHub mirror: <https://github.com/cran/CINNA>

Run `revdepcheck::revdep_details(, "CINNA")` for more info

## Newly broken

*   checking whether package ‘CINNA’ can be installed ... ERROR
     ```
     Installation failed.
     See ‘<lib>/CINNA.Rcheck/00install.out’ for details.
     ```

## Newly fixed

*   checking dependencies in R code ... NOTE
     ```
     Namespace in Imports field not imported from: ‘circlize’
       All declared Imports should be used.
     ```

## Installation

### Devel

```
* installing *source* package ‘CINNA’ ...
** this is package ‘CINNA’ version ‘1.2.2’
** package ‘CINNA’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘%>%’ is not exported by 'namespace:igraph'
Execution halted
ERROR: lazy loading failed for package ‘CINNA’
* removing ‘/revdepx/out/CINNA.Rcheck/CINNA’


```
### CRAN

```
* installing *source* package ‘CINNA’ ...
** this is package ‘CINNA’ version ‘1.2.2’
** package ‘CINNA’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (CINNA)


```
