# Libra (1.7)

* GitHub mirror: <https://github.com/cran/Libra>

Run `revdepcheck::revdep_details(, "Libra")` for more info

## In both

*   checking whether package ‘Libra’ can be installed ... ERROR
     ```
     Installation failed.
     See ‘<lib>/Libra.Rcheck/00install.out’ for details.
     ```

## Installation

### Devel

```
* installing *source* package ‘Libra’ ...
** this is package ‘Libra’ version ‘1.7’
** package ‘Libra’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C compiler: ‘gcc (Ubuntu 15.2.0-16ubuntu1) 15.2.0’
gcc -I"/opt/R/4.6.1/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c LBLasso.c -o LBLasso.o
LBLasso.c:8:10: fatal error: gsl/gsl_vector.h: No such file or directory
    8 | #include <gsl/gsl_vector.h>
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make: *** [/opt/R/4.6.1/lib/R/etc/Makeconf:190: LBLasso.o] Error 1
ERROR: compilation failed for package ‘Libra’
* removing ‘/home/runner/work/_temp/revdep2-work/check/Libra/new/Libra.Rcheck/Libra’


```
### CRAN

```
* installing *source* package ‘Libra’ ...
** this is package ‘Libra’ version ‘1.7’
** package ‘Libra’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C compiler: ‘gcc (Ubuntu 15.2.0-16ubuntu1) 15.2.0’
gcc -I"/opt/R/4.6.1/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c LBLasso.c -o LBLasso.o
LBLasso.c:8:10: fatal error: gsl/gsl_vector.h: No such file or directory
    8 | #include <gsl/gsl_vector.h>
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make: *** [/opt/R/4.6.1/lib/R/etc/Makeconf:190: LBLasso.o] Error 1
ERROR: compilation failed for package ‘Libra’
* removing ‘/home/runner/work/_temp/revdep2-work/check/Libra/old/Libra.Rcheck/Libra’


```
