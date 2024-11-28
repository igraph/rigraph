# bnlearn

<details>

* Version: 5.0.1
* GitHub: NA
* Source code: https://github.com/cran/bnlearn
* Date/Publication: 2024-08-19 17:40:11 UTC
* Number of recursive dependencies: 36

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
using C compiler: ‘gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0’
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/arcs2amat.c -o arcs/arcs2amat.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/arcs2elist.c -o arcs/arcs2elist.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/bind.c -o arcs/bind.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/filter.arcs.c -o arcs/filter.arcs.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/hash.c -o arcs/hash.o
...
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
using C compiler: ‘gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0’
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/arcs2amat.c -o arcs/arcs2amat.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/arcs2elist.c -o arcs/arcs2elist.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/bind.c -o arcs/bind.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/filter.arcs.c -o arcs/filter.arcs.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/hash.c -o arcs/hash.o
...
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
  unable to load shared object '/opt/R/4.4.0/lib/R/site-library/redland/libs/redland.so':
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
  unable to load shared object '/opt/R/4.4.0/lib/R/site-library/redland/libs/redland.so':
  librdf.so.0: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘datapack’
* removing ‘/tmp/workdir/datapack/old/datapack.Rcheck/datapack’


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
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
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
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
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
