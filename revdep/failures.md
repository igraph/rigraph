# bsts

<details>

* Version: 0.9.9
* GitHub: NA
* Source code: https://github.com/cran/bsts
* Date/Publication: 2022-11-07 08:50:11 UTC
* Number of recursive dependencies: 37

Run `revdepcheck::cloud_details(, "bsts")` for more info

</details>

## In both

*   checking whether package ‘bsts’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/bsts/new/bsts.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘bsts’ ...
** package ‘bsts’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0’
using C++11
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG -I`/opt/R/4.3.1/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I'/opt/R/4.3.1/lib/R/site-library/Boom/include' -I/usr/local/include    -fpic  -g -O2  -c aggregate_time_series.cc -o aggregate_time_series.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG -I`/opt/R/4.3.1/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I'/opt/R/4.3.1/lib/R/site-library/Boom/include' -I/usr/local/include    -fpic  -g -O2  -c bsts.cc -o bsts.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG -I`/opt/R/4.3.1/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I'/opt/R/4.3.1/lib/R/site-library/Boom/include' -I/usr/local/include    -fpic  -g -O2  -c bsts_init.cc -o bsts_init.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG -I`/opt/R/4.3.1/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I'/opt/R/4.3.1/lib/R/site-library/Boom/include' -I/usr/local/include    -fpic  -g -O2  -c create_dynamic_intercept_state_model.cpp -o create_dynamic_intercept_state_model.o
...
/opt/R/4.3.1/lib/R/site-library/Boom/include/Models/StateSpace/Multivariate/PosteriorSamplers/SLLPS.hpp:125:5: note:   candidate expects 5 arguments, 3 provided
/opt/R/4.3.1/lib/R/site-library/Boom/include/Models/StateSpace/Multivariate/PosteriorSamplers/SLLPS.hpp:106:9: note: candidate: ‘BOOM::ConditionallyIndependentSharedLocalLevelPosteriorSampler::ConditionallyIndependentSharedLocalLevelPosteriorSampler(const BOOM::ConditionallyIndependentSharedLocalLevelPosteriorSampler&)’
  106 |   class ConditionallyIndependentSharedLocalLevelPosteriorSampler
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/opt/R/4.3.1/lib/R/site-library/Boom/include/Models/StateSpace/Multivariate/PosteriorSamplers/SLLPS.hpp:106:9: note:   candidate expects 1 argument, 3 provided
/opt/R/4.3.1/lib/R/site-library/Boom/include/Models/StateSpace/Multivariate/PosteriorSamplers/SLLPS.hpp:106:9: note: candidate: ‘BOOM::ConditionallyIndependentSharedLocalLevelPosteriorSampler::ConditionallyIndependentSharedLocalLevelPosteriorSampler(BOOM::ConditionallyIndependentSharedLocalLevelPosteriorSampler&&)’
/opt/R/4.3.1/lib/R/site-library/Boom/include/Models/StateSpace/Multivariate/PosteriorSamplers/SLLPS.hpp:106:9: note:   candidate expects 1 argument, 3 provided
make: *** [/opt/R/4.3.1/lib/R/etc/Makeconf:200: create_shared_state_model.o] Error 1
ERROR: compilation failed for package ‘bsts’
* removing ‘/tmp/workdir/bsts/new/bsts.Rcheck/bsts’


```
### CRAN

```
* installing *source* package ‘bsts’ ...
** package ‘bsts’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0’
using C++11
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG -I`/opt/R/4.3.1/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I'/opt/R/4.3.1/lib/R/site-library/Boom/include' -I/usr/local/include    -fpic  -g -O2  -c aggregate_time_series.cc -o aggregate_time_series.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG -I`/opt/R/4.3.1/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I'/opt/R/4.3.1/lib/R/site-library/Boom/include' -I/usr/local/include    -fpic  -g -O2  -c bsts.cc -o bsts.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG -I`/opt/R/4.3.1/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I'/opt/R/4.3.1/lib/R/site-library/Boom/include' -I/usr/local/include    -fpic  -g -O2  -c bsts_init.cc -o bsts_init.o
g++ -std=gnu++11 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG -I`/opt/R/4.3.1/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I'/opt/R/4.3.1/lib/R/site-library/Boom/include' -I/usr/local/include    -fpic  -g -O2  -c create_dynamic_intercept_state_model.cpp -o create_dynamic_intercept_state_model.o
...
/opt/R/4.3.1/lib/R/site-library/Boom/include/Models/StateSpace/Multivariate/PosteriorSamplers/SLLPS.hpp:125:5: note:   candidate expects 5 arguments, 3 provided
/opt/R/4.3.1/lib/R/site-library/Boom/include/Models/StateSpace/Multivariate/PosteriorSamplers/SLLPS.hpp:106:9: note: candidate: ‘BOOM::ConditionallyIndependentSharedLocalLevelPosteriorSampler::ConditionallyIndependentSharedLocalLevelPosteriorSampler(const BOOM::ConditionallyIndependentSharedLocalLevelPosteriorSampler&)’
  106 |   class ConditionallyIndependentSharedLocalLevelPosteriorSampler
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/opt/R/4.3.1/lib/R/site-library/Boom/include/Models/StateSpace/Multivariate/PosteriorSamplers/SLLPS.hpp:106:9: note:   candidate expects 1 argument, 3 provided
/opt/R/4.3.1/lib/R/site-library/Boom/include/Models/StateSpace/Multivariate/PosteriorSamplers/SLLPS.hpp:106:9: note: candidate: ‘BOOM::ConditionallyIndependentSharedLocalLevelPosteriorSampler::ConditionallyIndependentSharedLocalLevelPosteriorSampler(BOOM::ConditionallyIndependentSharedLocalLevelPosteriorSampler&&)’
/opt/R/4.3.1/lib/R/site-library/Boom/include/Models/StateSpace/Multivariate/PosteriorSamplers/SLLPS.hpp:106:9: note:   candidate expects 1 argument, 3 provided
make: *** [/opt/R/4.3.1/lib/R/etc/Makeconf:200: create_shared_state_model.o] Error 1
ERROR: compilation failed for package ‘bsts’
* removing ‘/tmp/workdir/bsts/old/bsts.Rcheck/bsts’


```
# Seurat

<details>

* Version: 5.0.1
* GitHub: https://github.com/satijalab/seurat
* Source code: https://github.com/cran/Seurat
* Date/Publication: 2023-11-17 23:10:06 UTC
* Number of recursive dependencies: 264

Run `revdepcheck::cloud_details(, "Seurat")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/Seurat/new/Seurat.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
    GNU Fortran (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
* running under: Ubuntu 20.04.6 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Seurat/DESCRIPTION’ ... OK
...
* checking for GNU extensions in Makefiles ... OK
* checking for portable use of $(BLAS_LIBS) and $(LAPACK_LIBS) ... OK
* checking use of PKG_*FLAGS in Makefiles ... OK
* checking compiled code ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 3 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/Seurat/old/Seurat.Rcheck’
* using R version 4.3.1 (2023-06-16)
* using platform: x86_64-pc-linux-gnu (64-bit)
* R was compiled by
    gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
    GNU Fortran (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
* running under: Ubuntu 20.04.6 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Seurat/DESCRIPTION’ ... OK
...
* checking for GNU extensions in Makefiles ... OK
* checking for portable use of $(BLAS_LIBS) and $(LAPACK_LIBS) ... OK
* checking use of PKG_*FLAGS in Makefiles ... OK
* checking compiled code ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 3 NOTEs





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
