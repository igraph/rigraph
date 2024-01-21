# geostan

<details>

* Version: 0.5.3
* GitHub: https://github.com/ConnorDonegan/geostan
* Source code: https://github.com/cran/geostan
* Date/Publication: 2023-11-24 22:30:02 UTC
* Number of recursive dependencies: 109

Run `revdepcheck::cloud_details(, "geostan")` for more info

</details>

## In both

*   checking whether package ‘geostan’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/geostan/new/geostan.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘geostan’ ...
** package ‘geostan’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0’
using C++17


g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG -I"../inst/include" -I"/opt/R/4.3.1/lib/R/site-library/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -DUSE_STANC3 -D_HAS_AUTO_PTR_ETC=0 -I'/opt/R/4.3.1/lib/R/site-library/BH/include' -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppEigen/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppParallel/include' -I'/opt/R/4.3.1/lib/R/site-library/rstan/include' -I'/opt/R/4.3.1/lib/R/site-library/StanHeaders/include' -I/usr/local/include    -I'/opt/R/4.3.1/lib/R/site-library/RcppParallel/include' -D_REENTRANT -DSTAN_THREADS   -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
In file included from /opt/R/4.3.1/lib/R/site-library/RcppEigen/include/Eigen/Core:397,
...
/opt/R/4.3.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/opt/R/4.3.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:132:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::Scalar = double]’
/opt/R/4.3.1/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:56:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_foundation_namespace::model_foundation; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/opt/R/4.3.1/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:10:   required from here
/opt/R/4.3.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:55:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__vector(2) double’} [-Wignored-attributes]
g++: fatal error: Killed signal terminated program cc1plus
compilation terminated.
make: *** [/opt/R/4.3.1/lib/R/etc/Makeconf:198: stanExports_foundation.o] Error 1
ERROR: compilation failed for package ‘geostan’
* removing ‘/tmp/workdir/geostan/new/geostan.Rcheck/geostan’


```
### CRAN

```
* installing *source* package ‘geostan’ ...
** package ‘geostan’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0’
using C++17


g++ -std=gnu++17 -I"/opt/R/4.3.1/lib/R/include" -DNDEBUG -I"../inst/include" -I"/opt/R/4.3.1/lib/R/site-library/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -DUSE_STANC3 -D_HAS_AUTO_PTR_ETC=0 -I'/opt/R/4.3.1/lib/R/site-library/BH/include' -I'/opt/R/4.3.1/lib/R/site-library/Rcpp/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppEigen/include' -I'/opt/R/4.3.1/lib/R/site-library/RcppParallel/include' -I'/opt/R/4.3.1/lib/R/site-library/rstan/include' -I'/opt/R/4.3.1/lib/R/site-library/StanHeaders/include' -I/usr/local/include    -I'/opt/R/4.3.1/lib/R/site-library/RcppParallel/include' -D_REENTRANT -DSTAN_THREADS   -fpic  -g -O2  -c RcppExports.cpp -o RcppExports.o
In file included from /opt/R/4.3.1/lib/R/site-library/RcppEigen/include/Eigen/Core:397,
...
/opt/R/4.3.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/opt/R/4.3.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:132:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::Scalar = double]’
/opt/R/4.3.1/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:56:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_foundation_namespace::model_foundation; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/opt/R/4.3.1/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:10:   required from here
/opt/R/4.3.1/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:55:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__vector(2) double’} [-Wignored-attributes]
g++: fatal error: Killed signal terminated program cc1plus
compilation terminated.
make: *** [/opt/R/4.3.1/lib/R/etc/Makeconf:198: stanExports_foundation.o] Error 1
ERROR: compilation failed for package ‘geostan’
* removing ‘/tmp/workdir/geostan/old/geostan.Rcheck/geostan’


```
# HLSM

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/HLSM
* Number of recursive dependencies: 13

Run `revdepcheck::cloud_details(, "HLSM")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






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
# TDA

<details>

* Version: 1.9
* GitHub: NA
* Source code: https://github.com/cran/TDA
* Date/Publication: 2023-02-04 18:42:30 UTC
* Number of recursive dependencies: 59

Run `revdepcheck::cloud_details(, "TDA")` for more info

</details>

## In both

*   checking whether package ‘TDA’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/TDA/new/TDA.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘TDA’ ...
** package ‘TDA’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
/bin/sh: 1: clang++: not found
expr: syntax error: unexpected argument ‘50000’
using C++ compiler: ‘g++ (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0’
using C++17
/bin/sh: 1: clang++: not found
expr: syntax error: unexpected argument ‘50000’
...
                 from ./gudhi/Simplex_tree/Simplex_tree_siblings.h:16,
                 from ./gudhi/Simplex_tree.h:15,
                 from ./tdautils/gudhiUtils.h:10,
                 from diag.cpp:19:
/opt/R/4.3.1/lib/R/site-library/BH/include/boost/move/detail/reverse_iterator.hpp:132:39: warning: inline function ‘bool boost::movelib::operator!=(const boost::movelib::reverse_iterator<boost::container::vec_iterator<const CGAL::Wrap::Point_d<CGAL::Epick_d<CGAL::Dynamic_dimension_tag> >**, true> >&, const boost::movelib::reverse_iterator<boost::container::vec_iterator<const CGAL::Wrap::Point_d<CGAL::Epick_d<CGAL::Dynamic_dimension_tag> >**, true> >&)’ used but never defined
  132 |    BOOST_MOVE_FORCEINLINE friend bool operator!=(const reverse_iterator& l, const reverse_iterator& r)
      |                                       ^~~~~~~~
make: *** [/opt/R/4.3.1/lib/R/etc/Makeconf:200: diag.o] Error 1
ERROR: compilation failed for package ‘TDA’
* removing ‘/tmp/workdir/TDA/new/TDA.Rcheck/TDA’


```
### CRAN

```
* installing *source* package ‘TDA’ ...
** package ‘TDA’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
/bin/sh: 1: clang++: not found
expr: syntax error: unexpected argument ‘50000’
using C++ compiler: ‘g++ (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0’
using C++17
/bin/sh: 1: clang++: not found
expr: syntax error: unexpected argument ‘50000’
...
                 from ./gudhi/Simplex_tree/Simplex_tree_siblings.h:16,
                 from ./gudhi/Simplex_tree.h:15,
                 from ./tdautils/gudhiUtils.h:10,
                 from diag.cpp:19:
/opt/R/4.3.1/lib/R/site-library/BH/include/boost/move/detail/reverse_iterator.hpp:132:39: warning: inline function ‘bool boost::movelib::operator!=(const boost::movelib::reverse_iterator<boost::container::vec_iterator<const CGAL::Wrap::Point_d<CGAL::Epick_d<CGAL::Dynamic_dimension_tag> >**, true> >&, const boost::movelib::reverse_iterator<boost::container::vec_iterator<const CGAL::Wrap::Point_d<CGAL::Epick_d<CGAL::Dynamic_dimension_tag> >**, true> >&)’ used but never defined
  132 |    BOOST_MOVE_FORCEINLINE friend bool operator!=(const reverse_iterator& l, const reverse_iterator& r)
      |                                       ^~~~~~~~
make: *** [/opt/R/4.3.1/lib/R/etc/Makeconf:200: diag.o] Error 1
ERROR: compilation failed for package ‘TDA’
* removing ‘/tmp/workdir/TDA/old/TDA.Rcheck/TDA’


```
# TestAnaAPP

<details>

* Version: 0.1.5
* GitHub: https://github.com/jiangyouxiang/TestAnaAPP
* Source code: https://github.com/cran/TestAnaAPP
* Date/Publication: 2024-01-09 05:30:02 UTC
* Number of recursive dependencies: 238

Run `revdepcheck::cloud_details(, "TestAnaAPP")` for more info

</details>

## In both

*   checking whether package ‘TestAnaAPP’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/TestAnaAPP/new/TestAnaAPP.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘TestAnaAPP’ ...
** package ‘TestAnaAPP’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘tidySEM’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘blavaan’
Execution halted
ERROR: lazy loading failed for package ‘TestAnaAPP’
* removing ‘/tmp/workdir/TestAnaAPP/new/TestAnaAPP.Rcheck/TestAnaAPP’


```
### CRAN

```
* installing *source* package ‘TestAnaAPP’ ...
** package ‘TestAnaAPP’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘tidySEM’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘blavaan’
Execution halted
ERROR: lazy loading failed for package ‘TestAnaAPP’
* removing ‘/tmp/workdir/TestAnaAPP/old/TestAnaAPP.Rcheck/TestAnaAPP’


```
# treestats

<details>

* Version: 1.0.3
* GitHub: https://github.com/thijsjanzen/treestats
* Source code: https://github.com/cran/treestats
* Date/Publication: 2024-01-12 16:30:02 UTC
* Number of recursive dependencies: 229

Run `revdepcheck::cloud_details(, "treestats")` for more info

</details>

## In both

*   checking whether package ‘treestats’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/treestats/new/treestats.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘treestats’ ...
** package ‘treestats’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
Error: C++20 standard requested but CXX20 is not defined
* removing ‘/tmp/workdir/treestats/new/treestats.Rcheck/treestats’


```
### CRAN

```
* installing *source* package ‘treestats’ ...
** package ‘treestats’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
Error: C++20 standard requested but CXX20 is not defined
* removing ‘/tmp/workdir/treestats/old/treestats.Rcheck/treestats’


```
