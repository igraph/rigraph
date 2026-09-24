# pomdp (1.2.7)

* GitHub mirror: <https://github.com/cran/pomdp>

Run `revdepcheck::revdep_details(, "pomdp")` for more info

## Newly broken

*   checking whether package ‘pomdp’ can be installed ... ERROR
     ```
     Installation failed.
     See ‘<lib>/pomdp.Rcheck/00install.out’ for details.
     ```

## Newly fixed

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

## Installation

### Devel

```
* installing *source* package ‘pomdp’ ...
** this is package ‘pomdp’ version ‘1.2.7’
** package ‘pomdp’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
specified C++17
using C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0’
using C++17
g++ -std=gnu++17 -I"/usr/local/lib/R/include" -DNDEBUG  -I'/opt/revdepx/lib/Rcpp/include' -I/usr/local/include    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -g0  -c POMDP.cpp -o POMDP.o
g++ -std=gnu++17 -I"/usr/local/lib/R/include" -DNDEBUG  -I'/opt/revdepx/lib/Rcpp/include' -I/usr/local/include    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -g0  -c RcppExports.cpp -o RcppExports.o
...
g++ -std=gnu++17 -shared -L/usr/local/lib/R/lib -L/usr/local/lib -o pomdp.so POMDP.o RcppExports.o math.o model.o sample_simplex.o simulate_MDP.o simulate_POMDP.o -L/usr/local/lib/R/lib -lR
installing to /revdepx/out/pomdp.Rcheck/00LOCK-pomdp/00new/pomdp/libs
** R
** data
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘%>%’ is not exported by 'namespace:igraph'
Execution halted
ERROR: lazy loading failed for package ‘pomdp’
* removing ‘/revdepx/out/pomdp.Rcheck/pomdp’


```
### CRAN

```
* installing *source* package ‘pomdp’ ...
** this is package ‘pomdp’ version ‘1.2.7’
** package ‘pomdp’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
specified C++17
using C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0’
using C++17
g++ -std=gnu++17 -I"/usr/local/lib/R/include" -DNDEBUG  -I'/opt/revdepx/lib/Rcpp/include' -I/usr/local/include    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -g0  -c POMDP.cpp -o POMDP.o
g++ -std=gnu++17 -I"/usr/local/lib/R/include" -DNDEBUG  -I'/opt/revdepx/lib/Rcpp/include' -I/usr/local/include    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -g0  -c RcppExports.cpp -o RcppExports.o
...
** help
*** installing help indices
*** copying figures
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** checking absolute paths in shared objects and dynamic libraries
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (pomdp)


```
