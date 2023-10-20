# EGAnet

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/EGAnet
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "EGAnet")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# ragt2ridges

<details>

* Version: 0.3.4
* GitHub: https://github.com/wvanwie/ragt2ridges
* Source code: https://github.com/cran/ragt2ridges
* Date/Publication: 2020-01-28 15:30:02 UTC
* Number of recursive dependencies: 91

Run `revdepcheck::cloud_details(, "ragt2ridges")` for more info

</details>

## In both

*   checking whether package ‘ragt2ridges’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/ragt2ridges/new/ragt2ridges.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘ragt2ridges’ ...
** package ‘ragt2ridges’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
g++ -std=gnu++14 -I"/opt/R/4.2.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.2.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.2.1/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++14 -I"/opt/R/4.2.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.2.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.2.1/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fpic  -g -O2  -c ragt2ridges.cpp -o ragt2ridges.o
gcc -I"/opt/R/4.2.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.2.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.2.1/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fpic  -g -O2  -c registerDynamicSymbol.c -o registerDynamicSymbol.o
g++ -std=gnu++14 -shared -L/opt/R/4.2.1/lib/R/lib -L/usr/local/lib -o ragt2ridges.so RcppExports.o ragt2ridges.o registerDynamicSymbol.o -llapack -lblas -lgfortran -lm -lquadmath -L/opt/R/4.2.1/lib/R/lib -lR
installing to /tmp/workdir/ragt2ridges/new/ragt2ridges.Rcheck/00LOCK-ragt2ridges/00new/ragt2ridges/libs
** R
** data
** inst
** byte-compile and prepare package for lazy loading
Error: objects ‘ridgePchordal’, ‘support4ridgeP’ are not exported by 'namespace:rags2ridges'
Execution halted
ERROR: lazy loading failed for package ‘ragt2ridges’
* removing ‘/tmp/workdir/ragt2ridges/new/ragt2ridges.Rcheck/ragt2ridges’


```
### CRAN

```
* installing *source* package ‘ragt2ridges’ ...
** package ‘ragt2ridges’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
g++ -std=gnu++14 -I"/opt/R/4.2.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.2.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.2.1/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
g++ -std=gnu++14 -I"/opt/R/4.2.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.2.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.2.1/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fpic  -g -O2  -c ragt2ridges.cpp -o ragt2ridges.o
gcc -I"/opt/R/4.2.1/lib/R/include" -DNDEBUG  -I'/opt/R/4.2.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.2.1/lib/R/site-library/RcppArmadillo/include' -I/usr/local/include   -fpic  -g -O2  -c registerDynamicSymbol.c -o registerDynamicSymbol.o
g++ -std=gnu++14 -shared -L/opt/R/4.2.1/lib/R/lib -L/usr/local/lib -o ragt2ridges.so RcppExports.o ragt2ridges.o registerDynamicSymbol.o -llapack -lblas -lgfortran -lm -lquadmath -L/opt/R/4.2.1/lib/R/lib -lR
installing to /tmp/workdir/ragt2ridges/old/ragt2ridges.Rcheck/00LOCK-ragt2ridges/00new/ragt2ridges/libs
** R
** data
** inst
** byte-compile and prepare package for lazy loading
Error: objects ‘ridgePchordal’, ‘support4ridgeP’ are not exported by 'namespace:rags2ridges'
Execution halted
ERROR: lazy loading failed for package ‘ragt2ridges’
* removing ‘/tmp/workdir/ragt2ridges/old/ragt2ridges.Rcheck/ragt2ridges’


```
