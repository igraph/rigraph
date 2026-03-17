# caugi (1.0.0)

* GitHub: <https://github.com/frederikfabriciusbjerre/caugi>
* Email: <mailto:frederik@fabriciusbjerre.dk>
* GitHub mirror: <https://github.com/cran/caugi>

Run `revdepcheck::cloud_details(, "caugi")` for more info

## In both

*   checking whether package ‘caugi’ can be installed ... ERROR
     ```
     Installation failed.
     See ‘/tmp/workdir/caugi/new/caugi.Rcheck/00install.out’ for details.
     ```

## Installation

### Devel

```
* installing *source* package ‘caugi’ ...
** this is package ‘caugi’ version ‘1.0.0’
** package ‘caugi’ successfully unpacked and MD5 sums checked
** using staged installation
Error in eval(ei, envir) : 
------------------ [UNSUPPORTED RUST VERSION]------------------
- Minimum supported Rust version is 1.80.0.
- Installed Rust version is 1.75.0.
---------------------------------------------------------------
Calls: source -> withVisible -> eval -> eval
Execution halted
ERROR: configuration failed for package ‘caugi’
* removing ‘/tmp/workdir/caugi/new/caugi.Rcheck/caugi’


```
### CRAN

```
* installing *source* package ‘caugi’ ...
** this is package ‘caugi’ version ‘1.0.0’
** package ‘caugi’ successfully unpacked and MD5 sums checked
** using staged installation
Error in eval(ei, envir) : 
------------------ [UNSUPPORTED RUST VERSION]------------------
- Minimum supported Rust version is 1.80.0.
- Installed Rust version is 1.75.0.
---------------------------------------------------------------
Calls: source -> withVisible -> eval -> eval
Execution halted
ERROR: configuration failed for package ‘caugi’
* removing ‘/tmp/workdir/caugi/old/caugi.Rcheck/caugi’


```
# ClustAssess (1.1.0)

* GitHub: <https://github.com/Core-Bioinformatics/ClustAssess>
* Email: <mailto:am3019@cam.ac.uk>
* GitHub mirror: <https://github.com/cran/ClustAssess>

Run `revdepcheck::cloud_details(, "ClustAssess")` for more info

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/ClustAssess/new/ClustAssess.Rcheck’
* using R version 4.5.1 (2025-06-13)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ClustAssess/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘ClustAssess’ version ‘1.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... INFO
Package suggested but not available for checking: ‘monocle3’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘ClustAssess’ can be installed ... OK
* used C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
* checking installed package size ... INFO
  installed size is  5.4Mb
  sub-directories of 1Mb or more:
    R      1.5Mb
    libs   3.7Mb
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
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: OK





```
### CRAN

```
* using log directory ‘/tmp/workdir/ClustAssess/old/ClustAssess.Rcheck’
* using R version 4.5.1 (2025-06-13)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.3 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ClustAssess/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘ClustAssess’ version ‘1.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... INFO
Package suggested but not available for checking: ‘monocle3’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘ClustAssess’ can be installed ... OK
* used C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
* checking installed package size ... INFO
  installed size is  5.4Mb
  sub-directories of 1Mb or more:
    R      1.5Mb
    libs   3.7Mb
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
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: OK





```
# streamDAG (1.6)

* Email: <mailto:ahoken@isu.edu>
* GitHub mirror: <https://github.com/cran/streamDAG>

Run `revdepcheck::cloud_details(, "streamDAG")` for more info

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/streamDAG/new/streamDAG.Rcheck’
* using R version 4.5.1 (2025-06-13)
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
* using R version 4.5.1 (2025-06-13)
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
