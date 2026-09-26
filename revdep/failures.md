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
# ctmm (1.3.0)

* GitHub mirror: <https://github.com/cran/ctmm>

Run `revdepcheck::revdep_details(, "ctmm")` for more info

## Error before installation

### Devel

```
new check timed out after 1800s, at: * checking re-building of vignette outputs ...





```
### CRAN

```
new check timed out after 1800s, at: * checking re-building of vignette outputs ...





```
# E2E (0.1.3)

* GitHub mirror: <https://github.com/cran/E2E>

Run `revdepcheck::revdep_details(, "E2E")` for more info

## Error before installation

### Devel

```
new check timed out after 1802s, at: * checking re-building of vignette outputs ...





```
### CRAN

```
new check timed out after 1802s, at: * checking re-building of vignette outputs ...





```
# gllvm (2.0.13)

* GitHub mirror: <https://github.com/cran/gllvm>

Run `revdepcheck::revdep_details(, "gllvm")` for more info

## In both

*   checking whether package ‘gllvm’ can be installed ... ERROR
     ```
     Installation failed.
     See ‘<lib>/gllvm.Rcheck/00install.out’ for details.
     ```

## Installation

### Devel

```
[... 17181 earlier lines omitted; the full 00install.out is in the check artifact ...]
/opt/revdepx/lib/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Transpose<const Eigen::Block<const Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0>, 1, -1, false> > >’
/opt/revdepx/lib/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Transpose<const Eigen::Block<const Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0>, 1, -1, false> > >’
/opt/revdepx/lib/RcppEigen/include/Eigen/src/Core/Transpose.h:118:37:   required from ‘class Eigen::TransposeImpl<const Eigen::Block<const Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0>, 1, -1, false>, Eigen::Dense>’
/opt/revdepx/lib/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<const Eigen::Block<const Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0>, 1, -1, false> >’
/opt/revdepx/lib/RcppEigen/include/Eigen/src/Core/Dot.h:50:23:   required from ‘static Eigen::internal::dot_nocheck<T, U, true>::ResScalar Eigen::internal::dot_nocheck<T, U, true>::run(const Eigen::MatrixBase<Derived>&, const Eigen::MatrixBase<U>&) [with T = Eigen::Block<const Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0>, 1, -1, false>; U = Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true>; ResScalar = double]’
/opt/revdepx/lib/RcppEigen/include/Eigen/src/Core/Dot.h:84:58:   [ skipping 31 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/opt/revdepx/lib/TMB/include/tmbutils/newton.hpp:698:27:   required from ‘newton::matrix<double> newton::jacobian_sparse_plus_lowrank_t<Fac>::llt_solve(const sparse_plus_lowrank<double>&, const newton::matrix<double>&) [with Fac = Eigen::SimplicialLDLT<Eigen::SparseMatrix<double> >]’
/opt/revdepx/lib/TMB/include/tmbutils/newton.hpp:1081:33:   required from ‘const char* newton::NewtonOperator<Functor, Hessian_Type>::newton_iterate(newton::vector<double>&) [with Functor = newton::slice<>; Hessian_Type = newton::jacobian_sparse_plus_lowrank_t<Eigen::SimplicialLDLT<Eigen::SparseMatrix<double> > >]’
/opt/revdepx/lib/TMB/include/tmbutils/newton.hpp:1155:5:   required from ‘void newton::NewtonOperator<Functor, Hessian_Type>::forward(TMBad::ForwardArgs<double>&) [with Functor = newton::slice<>; Hessian_Type = newton::jacobian_sparse_plus_lowrank_t<Eigen::SimplicialLDLT<Eigen::SparseMatrix<double> > >]’
...
/opt/revdepx/lib/TMB/include/tiny_ad/atomic.hpp:30:1:   required from ‘void atomic::bessel_kOp<order, ninput, noutput, mask>::reverse(TMBad::ReverseArgs<Type>&) [with Type = double; int order = 3; int ninput = 2; int noutput = 8; long int mask = 9]’
/opt/revdepx/lib/TMB/include/TMBad/global.hpp:1762:28:   required from ‘void TMBad::global::AddForwardMarkReverseMark<OperatorBase>::reverse(TMBad::ReverseArgs<Type>&) [with Type = double; OperatorBase = TMBad::global::AddIncrementDecrement<TMBad::global::AddDependencies<TMBad::global::AddInputSizeOutputSize<atomic::bessel_kOp<3, 2, 8, 9> > > >]’
/opt/revdepx/lib/TMB/include/TMBad/global.hpp:2155:57:   required from ‘void TMBad::global::Complete<OperatorBase>::reverse(TMBad::ReverseArgs<double>&) [with OperatorBase = atomic::bessel_kOp<3, 2, 8, 9>]’
/opt/revdepx/lib/TMB/include/TMBad/global.hpp:2155:10:   required from here
/opt/revdepx/lib/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
g++: fatal error: Killed signal terminated program cc1plus
compilation terminated.
make: *** [/usr/local/lib/R/etc/Makeconf:199: gllvm.o] Error 1
ERROR: compilation failed for package ‘gllvm’
* removing ‘/revdepx/out/gllvm.Rcheck/gllvm’


```
### CRAN

```
[... 17181 earlier lines omitted; the full 00install.out is in the check artifact ...]
/opt/revdepx/lib/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Transpose<const Eigen::Block<const Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0>, 1, -1, false> > >’
/opt/revdepx/lib/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Transpose<const Eigen::Block<const Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0>, 1, -1, false> > >’
/opt/revdepx/lib/RcppEigen/include/Eigen/src/Core/Transpose.h:118:37:   required from ‘class Eigen::TransposeImpl<const Eigen::Block<const Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0>, 1, -1, false>, Eigen::Dense>’
/opt/revdepx/lib/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<const Eigen::Block<const Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0>, 1, -1, false> >’
/opt/revdepx/lib/RcppEigen/include/Eigen/src/Core/Dot.h:50:23:   required from ‘static Eigen::internal::dot_nocheck<T, U, true>::ResScalar Eigen::internal::dot_nocheck<T, U, true>::run(const Eigen::MatrixBase<Derived>&, const Eigen::MatrixBase<U>&) [with T = Eigen::Block<const Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Transpose<Eigen::Matrix<double, -1, -1> >, 0>, 1, -1, false>; U = Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true>; ResScalar = double]’
/opt/revdepx/lib/RcppEigen/include/Eigen/src/Core/Dot.h:84:58:   [ skipping 31 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/opt/revdepx/lib/TMB/include/tmbutils/newton.hpp:698:27:   required from ‘newton::matrix<double> newton::jacobian_sparse_plus_lowrank_t<Fac>::llt_solve(const sparse_plus_lowrank<double>&, const newton::matrix<double>&) [with Fac = Eigen::SimplicialLDLT<Eigen::SparseMatrix<double> >]’
/opt/revdepx/lib/TMB/include/tmbutils/newton.hpp:1081:33:   required from ‘const char* newton::NewtonOperator<Functor, Hessian_Type>::newton_iterate(newton::vector<double>&) [with Functor = newton::slice<>; Hessian_Type = newton::jacobian_sparse_plus_lowrank_t<Eigen::SimplicialLDLT<Eigen::SparseMatrix<double> > >]’
/opt/revdepx/lib/TMB/include/tmbutils/newton.hpp:1155:5:   required from ‘void newton::NewtonOperator<Functor, Hessian_Type>::forward(TMBad::ForwardArgs<double>&) [with Functor = newton::slice<>; Hessian_Type = newton::jacobian_sparse_plus_lowrank_t<Eigen::SimplicialLDLT<Eigen::SparseMatrix<double> > >]’
...
/opt/revdepx/lib/TMB/include/tiny_ad/atomic.hpp:30:1:   required from ‘void atomic::bessel_kOp<order, ninput, noutput, mask>::reverse(TMBad::ReverseArgs<Type>&) [with Type = double; int order = 3; int ninput = 2; int noutput = 8; long int mask = 9]’
/opt/revdepx/lib/TMB/include/TMBad/global.hpp:1762:28:   required from ‘void TMBad::global::AddForwardMarkReverseMark<OperatorBase>::reverse(TMBad::ReverseArgs<Type>&) [with Type = double; OperatorBase = TMBad::global::AddIncrementDecrement<TMBad::global::AddDependencies<TMBad::global::AddInputSizeOutputSize<atomic::bessel_kOp<3, 2, 8, 9> > > >]’
/opt/revdepx/lib/TMB/include/TMBad/global.hpp:2155:57:   required from ‘void TMBad::global::Complete<OperatorBase>::reverse(TMBad::ReverseArgs<double>&) [with OperatorBase = atomic::bessel_kOp<3, 2, 8, 9>]’
/opt/revdepx/lib/TMB/include/TMBad/global.hpp:2155:10:   required from here
/opt/revdepx/lib/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
g++: fatal error: Killed signal terminated program cc1plus
compilation terminated.
make: *** [/usr/local/lib/R/etc/Makeconf:199: gllvm.o] Error 1
ERROR: compilation failed for package ‘gllvm’
* removing ‘/revdepx/out/gllvm.Rcheck/gllvm’


```
# graph4lg (1.8.0)

* GitHub mirror: <https://github.com/cran/graph4lg>

Run `revdepcheck::revdep_details(, "graph4lg")` for more info

## Error before installation

### Devel

```
Not checked (deferred)





```
### CRAN

```
Not checked (deferred)





```
# hespdiv (1.2.10)

* GitHub mirror: <https://github.com/cran/hespdiv>

Run `revdepcheck::revdep_details(, "hespdiv")` for more info

## Error before installation

### Devel

```
Source tarball could not be downloaded





```
### CRAN

```
Source tarball could not be downloaded





```
# mau (0.4.0)

* GitHub mirror: <https://github.com/cran/mau>

Run `revdepcheck::revdep_details(, "mau")` for more info

## Newly broken

*   checking whether package ‘mau’ can be installed ... ERROR
     ```
     Installation failed.
     See ‘<lib>/mau.Rcheck/00install.out’ for details.
     ```

## Installation

### Devel

```
* installing *source* package ‘mau’ ...
** this is package ‘mau’ version ‘0.4.0’
** package ‘mau’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘%>%’ is not exported by 'namespace:igraph'
Execution halted
ERROR: lazy loading failed for package ‘mau’
* removing ‘/revdepx/out/mau.Rcheck/mau’


```
### CRAN

```
* installing *source* package ‘mau’ ...
** this is package ‘mau’ version ‘0.4.0’
** package ‘mau’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (mau)


```
# orchaRd (2.2.1)

* GitHub mirror: <https://github.com/cran/orchaRd>

Run `revdepcheck::revdep_details(, "orchaRd")` for more info

## Error before installation

### Devel

```
old check timed out after 1800s, at: * checking tests ...





```
### CRAN

```
old check timed out after 1800s, at: * checking tests ...





```
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
# PortfolioTesteR (0.1.4)

* GitHub mirror: <https://github.com/cran/PortfolioTesteR>

Run `revdepcheck::revdep_details(, "PortfolioTesteR")` for more info

## Error before installation

### Devel

```
new check timed out after 1801s, at: * checking re-building of vignette outputs ...





```
### CRAN

```
new check timed out after 1801s, at: * checking re-building of vignette outputs ...





```
# scITD (1.0.4)

* GitHub mirror: <https://github.com/cran/scITD>

Run `revdepcheck::revdep_details(, "scITD")` for more info

## Error before installation

### Devel

```
Source tarball could not be downloaded





```
### CRAN

```
Source tarball could not be downloaded





```
# sphet (2.1-1)

* GitHub mirror: <https://github.com/cran/sphet>

Run `revdepcheck::revdep_details(, "sphet")` for more info

## Error before installation

### Devel

```
Not checked (deferred)





```
### CRAN

```
Not checked (deferred)





```
# xpect (1.2)

* GitHub mirror: <https://github.com/cran/xpect>

Run `revdepcheck::revdep_details(, "xpect")` for more info

## Error before installation

### Devel

```
new check timed out after 1801s, at: * checking tests ...





```
### CRAN

```
new check timed out after 1801s, at: * checking tests ...





```
