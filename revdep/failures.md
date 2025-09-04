# bnlearn

<details>

* Version: 5.1
* GitHub: NA
* Source code: https://github.com/cran/bnlearn
* Date/Publication: 2025-08-20 12:50:13 UTC
* Number of recursive dependencies: 35

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
using C compiler: ‘gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/arcs2amat.c -o arcs/arcs2amat.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/arcs2elist.c -o arcs/arcs2elist.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/bind.c -o arcs/bind.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/filter.arcs.c -o arcs/filter.arcs.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/hash.c -o arcs/hash.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/is.row.equal.c -o arcs/is.row.equal.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/bayesian.network.c -o bnlearn/bayesian.network.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/bn.recovery.c -o bnlearn/bn.recovery.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/cache.structure.c -o bnlearn/cache.structure.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/cextend.c -o bnlearn/cextend.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/colliders.c -o bnlearn/colliders.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/cpdag.c -o bnlearn/cpdag.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/fitted.c -o bnlearn/fitted.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/nparams.c -o bnlearn/nparams.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/shd.c -o bnlearn/shd.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/allocations.c -o core/allocations.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/contingency.tables.c -o core/contingency.tables.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/correlation.c -o core/correlation.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/covariance.matrix.c -o core/covariance.matrix.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/data.table.c -o core/data.table.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/math.functions.c -o core/math.functions.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/moments.c -o core/moments.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/sampling.c -o core/sampling.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/sets.c -o core/sets.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/sort.c -o core/sort.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/uppertriangular.c -o core/uppertriangular.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c fitted/enums.c -o fitted/enums.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c fitted/fitted.c -o fitted/fitted.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c fitted/nparams.c -o fitted/nparams.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c fitted/rinterface/nparams.c -o fitted/rinterface/nparams.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c foreign/parse.c -o foreign/parse.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c globals.c -o globals.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/acyclic.c -o graphs/acyclic.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/completely.directed.c -o graphs/completely.directed.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/connected.components.c -o graphs/connected.components.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/path.c -o graphs/path.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/path.matrix.c -o graphs/path.matrix.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/pdag2dag.c -o graphs/pdag2dag.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/random/graph.generation.c -o graphs/random/graph.generation.o
In file included from graphs/random/../../include/rcore.h:3,
                 from graphs/random/graph.generation.c:1:
graphs/random/graph.generation.c: In function ‘print_modelstring’:
graphs/random/graph.generation.c:719:19: warning: implicit declaration of function ‘allocLang’; did you mean ‘alloca’? [-Wimplicit-function-declaration]
  719 |   PROTECT(t = s = allocLang(2));
      |                   ^~~~~~~~~
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
graphs/random/graph.generation.c:719:17: warning: assignment to ‘SEXP’ {aka ‘struct SEXPREC *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
  719 |   PROTECT(t = s = allocLang(2));
      |                 ^
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/topological.ordering.c -o graphs/topological.ordering.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/rinterface/connected.components.c -o graphs/rinterface/connected.components.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/rinterface/path.matrix.c -o graphs/rinterface/path.matrix.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/rinterface/sid.c -o graphs/rinterface/sid.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/sid.c -o graphs/sid.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/likelihood.weighting.c -o inference/likelihood.weighting.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/common.c -o inference/loglikelihood/common.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/discrete.c -o inference/loglikelihood/discrete.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/gaussian.c -o inference/loglikelihood/gaussian.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/conditional.gaussian.c -o inference/loglikelihood/conditional.gaussian.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/rbn.c -o inference/rbn.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/rinterface/loglikelihood.c -o inference/rinterface/loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/rinterface/cpdist.c -o inference/rinterface/cpdist.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/rinterface/rbn.c -o inference/rinterface/rbn.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/rinterface/likelihood.weighting.c -o inference/rinterface/likelihood.weighting.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/averaging/averaging.c -o learning/averaging/averaging.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/averaging/bootstrap.c -o learning/averaging/bootstrap.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/local/mi.matrix.c -o learning/local/mi.matrix.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/score/hc.cache.lookup.c -o learning/score/hc.cache.lookup.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/score/score.delta.c -o learning/score/score.delta.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/score/tabu.c -o learning/score/tabu.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c math/conditional.least.squares.c -o math/conditional.least.squares.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c math/least.squares.c -o math/least.squares.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c math/linear.algebra.c -o math/linear.algebra.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/common.c -o minimal/common.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/data.frame.c -o minimal/data.frame.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/strings.c -o minimal/strings.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/table.c -o minimal/table.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/tiers.c -o minimal/tiers.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/unique.c -o minimal/unique.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/discrete/classic.discrete.c -o parameters/discrete/classic.discrete.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/discrete/hierarchical.dirichlet.c -o parameters/discrete/hierarchical.dirichlet.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/classic.discrete.c -o parameters/rinterface/classic.discrete.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/hierarchical.dirichlet.c -o parameters/rinterface/hierarchical.dirichlet.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/mixture.ordinary.least.squares.c -o parameters/rinterface/mixture.ordinary.least.squares.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/ordinary.least.squares.c -o parameters/rinterface/ordinary.least.squares.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c predict/map.lw.c -o predict/map.lw.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c predict/predict.c -o predict/predict.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c preprocessing/dedup.c -o preprocessing/dedup.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c preprocessing/discretize.c -o preprocessing/discretize.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c preprocessing/enums.c -o preprocessing/enums.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c preprocessing/rinterface/discretize.c -o preprocessing/rinterface/discretize.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c sanitization/cg.assumptions.c -o sanitization/cg.assumptions.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c sanitization/covariance.c -o sanitization/covariance.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c sanitization/data.c -o sanitization/data.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/alpha.star.c -o scores/alpha.star.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/cg.loglikelihood.c -o scores/cg.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/cg.predictive.loglikelihood.c -o scores/cg.predictive.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/cg.nal.c -o scores/cg.nal.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/custom.score.c -o scores/custom.score.o
In file included from scores/../include/rcore.h:3,
                 from scores/custom.score.c:1:
scores/custom.score.c: In function ‘custom_score_function’:
scores/custom.score.c:12:34: warning: implicit declaration of function ‘allocLang’; did you mean ‘alloca’? [-Wimplicit-function-declaration]
   12 |   PROTECT(args_iterator = call = allocLang(5));
      |                                  ^~~~~~~~~
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
scores/custom.score.c:12:32: warning: assignment to ‘SEXP’ {aka ‘struct SEXPREC *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
   12 |   PROTECT(args_iterator = call = allocLang(5));
      |                                ^
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/dirichlet.averaged.posterior.c -o scores/dirichlet.averaged.posterior.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/dirichlet.posterior.c -o scores/dirichlet.posterior.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/discrete.loglikelihood.c -o scores/discrete.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/discrete.nal.c -o scores/discrete.nal.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/discrete.predictive.loglikelihood.c -o scores/discrete.predictive.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/enum.c -o scores/enum.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/gaussian.loglikelihood.c -o scores/gaussian.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/gaussian.nal.c -o scores/gaussian.nal.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/gaussian.predictive.loglikelihood.c -o scores/gaussian.predictive.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/graph.priors.c -o scores/graph.priors.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/nml.regret.c -o scores/nml.regret.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/nml.regret.table.c -o scores/nml.regret.table.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/normalized.maximum.likelihood.c -o scores/normalized.maximum.likelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/per.node.score.c -o scores/per.node.score.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/wishart.posterior.c -o scores/wishart.posterior.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c test.counter.c -o test.counter.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/conditional.gaussian/cg.mutual.information.c -o tests/conditional.gaussian/cg.mutual.information.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/discrete/df.adjust.c -o tests/discrete/df.adjust.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/discrete/discrete.tests.c -o tests/discrete/discrete.tests.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/discrete/jonckheere.c -o tests/discrete/jonckheere.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/discrete/shrinkage.c -o tests/discrete/shrinkage.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/enums.c -o tests/enums.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/gaussian/df.adjust.c -o tests/gaussian/df.adjust.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/gaussian/gaussian.tests.c -o tests/gaussian/gaussian.tests.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/gaussian/shrinkage.c -o tests/gaussian/shrinkage.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/omnibus/custom.test.c -o tests/omnibus/custom.test.o
In file included from tests/omnibus/../../include/rcore.h:3,
                 from tests/omnibus/custom.test.c:1:
tests/omnibus/custom.test.c: In function ‘custom_test_function’:
tests/omnibus/custom.test.c:11:34: warning: implicit declaration of function ‘allocLang’; did you mean ‘alloca’? [-Wimplicit-function-declaration]
   11 |   PROTECT(args_iterator = call = allocLang(6));
      |                                  ^~~~~~~~~
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
tests/omnibus/custom.test.c:11:32: warning: assignment to ‘SEXP’ {aka ‘struct SEXPREC *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
   11 |   PROTECT(args_iterator = call = allocLang(6));
      |                                ^
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/patterns/allsubs.test.c -o tests/patterns/allsubs.test.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/patterns/ctest.c -o tests/patterns/ctest.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/patterns/roundrobin.test.c -o tests/patterns/roundrobin.test.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/patterns/utest.c -o tests/patterns/utest.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/permutation/discrete.monte.carlo.c -o tests/permutation/discrete.monte.carlo.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/permutation/gaussian.monte.carlo.c -o tests/permutation/gaussian.monte.carlo.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/allsubs.test.c -o tests/rinterface/allsubs.test.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/ctest.c -o tests/rinterface/ctest.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/htest.c -o tests/rinterface/htest.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/indep.test.c -o tests/rinterface/indep.test.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/roundrobin.test.c -o tests/rinterface/roundrobin.test.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/utest.c -o tests/rinterface/utest.o
gcc -std=gnu17 -shared -L/opt/R/4.4.0/lib/R/lib -L/usr/local/lib -o bnlearn.so arcs/arcs2amat.o arcs/arcs2elist.o arcs/bind.o arcs/filter.arcs.o arcs/hash.o arcs/is.row.equal.o bnlearn/bayesian.network.o bnlearn/bn.recovery.o bnlearn/cache.structure.o bnlearn/cextend.o bnlearn/colliders.o bnlearn/cpdag.o bnlearn/fitted.o bnlearn/nparams.o bnlearn/shd.o core/allocations.o core/contingency.tables.o core/correlation.o core/covariance.matrix.o core/data.table.o core/math.functions.o core/moments.o core/sampling.o core/sets.o core/sort.o core/uppertriangular.o fitted/enums.o fitted/fitted.o fitted/nparams.o fitted/rinterface/nparams.o foreign/parse.o globals.o graphs/acyclic.o graphs/completely.directed.o graphs/connected.components.o graphs/path.o graphs/path.matrix.o graphs/pdag2dag.o graphs/random/graph.generation.o graphs/topological.ordering.o graphs/rinterface/connected.components.o graphs/rinterface/path.matrix.o graphs/rinterface/sid.o graphs/sid.o inference/likelihood.weighting.o inference/loglikelihood/common.o inference/loglikelihood/discrete.o inference/loglikelihood/gaussian.o inference/loglikelihood/conditional.gaussian.o inference/rbn.o inference/rinterface/loglikelihood.o inference/rinterface/cpdist.o inference/rinterface/rbn.o inference/rinterface/likelihood.weighting.o learning/averaging/averaging.o learning/averaging/bootstrap.o learning/local/mi.matrix.o learning/score/hc.cache.lookup.o learning/score/score.delta.o learning/score/tabu.o math/conditional.least.squares.o math/least.squares.o math/linear.algebra.o minimal/common.o minimal/data.frame.o minimal/strings.o minimal/table.o minimal/tiers.o minimal/unique.o parameters/discrete/classic.discrete.o parameters/discrete/hierarchical.dirichlet.o parameters/rinterface/classic.discrete.o parameters/rinterface/hierarchical.dirichlet.o parameters/rinterface/mixture.ordinary.least.squares.o parameters/rinterface/ordinary.least.squares.o predict/map.lw.o predict/predict.o preprocessing/dedup.o preprocessing/discretize.o preprocessing/enums.o preprocessing/rinterface/discretize.o sanitization/cg.assumptions.o sanitization/covariance.o sanitization/data.o scores/alpha.star.o scores/cg.loglikelihood.o scores/cg.predictive.loglikelihood.o scores/cg.nal.o scores/custom.score.o scores/dirichlet.averaged.posterior.o scores/dirichlet.posterior.o scores/discrete.loglikelihood.o scores/discrete.nal.o scores/discrete.predictive.loglikelihood.o scores/enum.o scores/gaussian.loglikelihood.o scores/gaussian.nal.o scores/gaussian.predictive.loglikelihood.o scores/graph.priors.o scores/nml.regret.o scores/nml.regret.table.o scores/normalized.maximum.likelihood.o scores/per.node.score.o scores/wishart.posterior.o test.counter.o tests/conditional.gaussian/cg.mutual.information.o tests/discrete/df.adjust.o tests/discrete/discrete.tests.o tests/discrete/jonckheere.o tests/discrete/shrinkage.o tests/enums.o tests/gaussian/df.adjust.o tests/gaussian/gaussian.tests.o tests/gaussian/shrinkage.o tests/omnibus/custom.test.o tests/patterns/allsubs.test.o tests/patterns/ctest.o tests/patterns/roundrobin.test.o tests/patterns/utest.o tests/permutation/discrete.monte.carlo.o tests/permutation/gaussian.monte.carlo.o tests/rinterface/allsubs.test.o tests/rinterface/ctest.o tests/rinterface/htest.o tests/rinterface/indep.test.o tests/rinterface/roundrobin.test.o tests/rinterface/utest.o -llapack -lblas -lgfortran -lm -lquadmath -L/opt/R/4.4.0/lib/R/lib -lR
installing to /tmp/workdir/bnlearn/new/bnlearn.Rcheck/00LOCK-bnlearn/00new/bnlearn/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
** help
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
using C compiler: ‘gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/arcs2amat.c -o arcs/arcs2amat.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/arcs2elist.c -o arcs/arcs2elist.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/bind.c -o arcs/bind.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/filter.arcs.c -o arcs/filter.arcs.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/hash.c -o arcs/hash.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c arcs/is.row.equal.c -o arcs/is.row.equal.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/bayesian.network.c -o bnlearn/bayesian.network.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/bn.recovery.c -o bnlearn/bn.recovery.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/cache.structure.c -o bnlearn/cache.structure.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/cextend.c -o bnlearn/cextend.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/colliders.c -o bnlearn/colliders.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/cpdag.c -o bnlearn/cpdag.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/fitted.c -o bnlearn/fitted.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/nparams.c -o bnlearn/nparams.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c bnlearn/shd.c -o bnlearn/shd.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/allocations.c -o core/allocations.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/contingency.tables.c -o core/contingency.tables.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/correlation.c -o core/correlation.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/covariance.matrix.c -o core/covariance.matrix.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/data.table.c -o core/data.table.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/math.functions.c -o core/math.functions.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/moments.c -o core/moments.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/sampling.c -o core/sampling.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/sets.c -o core/sets.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/sort.c -o core/sort.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c core/uppertriangular.c -o core/uppertriangular.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c fitted/enums.c -o fitted/enums.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c fitted/fitted.c -o fitted/fitted.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c fitted/nparams.c -o fitted/nparams.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c fitted/rinterface/nparams.c -o fitted/rinterface/nparams.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c foreign/parse.c -o foreign/parse.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c globals.c -o globals.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/acyclic.c -o graphs/acyclic.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/completely.directed.c -o graphs/completely.directed.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/connected.components.c -o graphs/connected.components.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/path.c -o graphs/path.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/path.matrix.c -o graphs/path.matrix.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/pdag2dag.c -o graphs/pdag2dag.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/random/graph.generation.c -o graphs/random/graph.generation.o
In file included from graphs/random/../../include/rcore.h:3,
                 from graphs/random/graph.generation.c:1:
graphs/random/graph.generation.c: In function ‘print_modelstring’:
graphs/random/graph.generation.c:719:19: warning: implicit declaration of function ‘allocLang’; did you mean ‘alloca’? [-Wimplicit-function-declaration]
  719 |   PROTECT(t = s = allocLang(2));
      |                   ^~~~~~~~~
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
graphs/random/graph.generation.c:719:17: warning: assignment to ‘SEXP’ {aka ‘struct SEXPREC *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
  719 |   PROTECT(t = s = allocLang(2));
      |                 ^
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/topological.ordering.c -o graphs/topological.ordering.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/rinterface/connected.components.c -o graphs/rinterface/connected.components.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/rinterface/path.matrix.c -o graphs/rinterface/path.matrix.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/rinterface/sid.c -o graphs/rinterface/sid.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/sid.c -o graphs/sid.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/likelihood.weighting.c -o inference/likelihood.weighting.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/common.c -o inference/loglikelihood/common.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/discrete.c -o inference/loglikelihood/discrete.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/gaussian.c -o inference/loglikelihood/gaussian.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/conditional.gaussian.c -o inference/loglikelihood/conditional.gaussian.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/rbn.c -o inference/rbn.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/rinterface/loglikelihood.c -o inference/rinterface/loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/rinterface/cpdist.c -o inference/rinterface/cpdist.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/rinterface/rbn.c -o inference/rinterface/rbn.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/rinterface/likelihood.weighting.c -o inference/rinterface/likelihood.weighting.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/averaging/averaging.c -o learning/averaging/averaging.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/averaging/bootstrap.c -o learning/averaging/bootstrap.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/local/mi.matrix.c -o learning/local/mi.matrix.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/score/hc.cache.lookup.c -o learning/score/hc.cache.lookup.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/score/score.delta.c -o learning/score/score.delta.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c learning/score/tabu.c -o learning/score/tabu.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c math/conditional.least.squares.c -o math/conditional.least.squares.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c math/least.squares.c -o math/least.squares.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c math/linear.algebra.c -o math/linear.algebra.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/common.c -o minimal/common.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/data.frame.c -o minimal/data.frame.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/strings.c -o minimal/strings.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/table.c -o minimal/table.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/tiers.c -o minimal/tiers.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c minimal/unique.c -o minimal/unique.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/discrete/classic.discrete.c -o parameters/discrete/classic.discrete.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/discrete/hierarchical.dirichlet.c -o parameters/discrete/hierarchical.dirichlet.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/classic.discrete.c -o parameters/rinterface/classic.discrete.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/hierarchical.dirichlet.c -o parameters/rinterface/hierarchical.dirichlet.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/mixture.ordinary.least.squares.c -o parameters/rinterface/mixture.ordinary.least.squares.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/ordinary.least.squares.c -o parameters/rinterface/ordinary.least.squares.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c predict/map.lw.c -o predict/map.lw.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c predict/predict.c -o predict/predict.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c preprocessing/dedup.c -o preprocessing/dedup.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c preprocessing/discretize.c -o preprocessing/discretize.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c preprocessing/enums.c -o preprocessing/enums.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c preprocessing/rinterface/discretize.c -o preprocessing/rinterface/discretize.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c sanitization/cg.assumptions.c -o sanitization/cg.assumptions.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c sanitization/covariance.c -o sanitization/covariance.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c sanitization/data.c -o sanitization/data.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/alpha.star.c -o scores/alpha.star.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/cg.loglikelihood.c -o scores/cg.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/cg.predictive.loglikelihood.c -o scores/cg.predictive.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/cg.nal.c -o scores/cg.nal.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/custom.score.c -o scores/custom.score.o
In file included from scores/../include/rcore.h:3,
                 from scores/custom.score.c:1:
scores/custom.score.c: In function ‘custom_score_function’:
scores/custom.score.c:12:34: warning: implicit declaration of function ‘allocLang’; did you mean ‘alloca’? [-Wimplicit-function-declaration]
   12 |   PROTECT(args_iterator = call = allocLang(5));
      |                                  ^~~~~~~~~
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
scores/custom.score.c:12:32: warning: assignment to ‘SEXP’ {aka ‘struct SEXPREC *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
   12 |   PROTECT(args_iterator = call = allocLang(5));
      |                                ^
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/dirichlet.averaged.posterior.c -o scores/dirichlet.averaged.posterior.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/dirichlet.posterior.c -o scores/dirichlet.posterior.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/discrete.loglikelihood.c -o scores/discrete.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/discrete.nal.c -o scores/discrete.nal.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/discrete.predictive.loglikelihood.c -o scores/discrete.predictive.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/enum.c -o scores/enum.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/gaussian.loglikelihood.c -o scores/gaussian.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/gaussian.nal.c -o scores/gaussian.nal.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/gaussian.predictive.loglikelihood.c -o scores/gaussian.predictive.loglikelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/graph.priors.c -o scores/graph.priors.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/nml.regret.c -o scores/nml.regret.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/nml.regret.table.c -o scores/nml.regret.table.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/normalized.maximum.likelihood.c -o scores/normalized.maximum.likelihood.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/per.node.score.c -o scores/per.node.score.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/wishart.posterior.c -o scores/wishart.posterior.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c test.counter.c -o test.counter.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/conditional.gaussian/cg.mutual.information.c -o tests/conditional.gaussian/cg.mutual.information.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/discrete/df.adjust.c -o tests/discrete/df.adjust.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/discrete/discrete.tests.c -o tests/discrete/discrete.tests.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/discrete/jonckheere.c -o tests/discrete/jonckheere.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/discrete/shrinkage.c -o tests/discrete/shrinkage.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/enums.c -o tests/enums.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/gaussian/df.adjust.c -o tests/gaussian/df.adjust.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/gaussian/gaussian.tests.c -o tests/gaussian/gaussian.tests.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/gaussian/shrinkage.c -o tests/gaussian/shrinkage.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/omnibus/custom.test.c -o tests/omnibus/custom.test.o
In file included from tests/omnibus/../../include/rcore.h:3,
                 from tests/omnibus/custom.test.c:1:
tests/omnibus/custom.test.c: In function ‘custom_test_function’:
tests/omnibus/custom.test.c:11:34: warning: implicit declaration of function ‘allocLang’; did you mean ‘alloca’? [-Wimplicit-function-declaration]
   11 |   PROTECT(args_iterator = call = allocLang(6));
      |                                  ^~~~~~~~~
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
tests/omnibus/custom.test.c:11:32: warning: assignment to ‘SEXP’ {aka ‘struct SEXPREC *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
   11 |   PROTECT(args_iterator = call = allocLang(6));
      |                                ^
/opt/R/4.4.0/lib/R/include/Rinternals.h:371:36: note: in definition of macro ‘PROTECT’
  371 | #define PROTECT(s)      Rf_protect(s)
      |                                    ^
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/patterns/allsubs.test.c -o tests/patterns/allsubs.test.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/patterns/ctest.c -o tests/patterns/ctest.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/patterns/roundrobin.test.c -o tests/patterns/roundrobin.test.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/patterns/utest.c -o tests/patterns/utest.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/permutation/discrete.monte.carlo.c -o tests/permutation/discrete.monte.carlo.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/permutation/gaussian.monte.carlo.c -o tests/permutation/gaussian.monte.carlo.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/allsubs.test.c -o tests/rinterface/allsubs.test.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/ctest.c -o tests/rinterface/ctest.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/htest.c -o tests/rinterface/htest.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/indep.test.c -o tests/rinterface/indep.test.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/roundrobin.test.c -o tests/rinterface/roundrobin.test.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c tests/rinterface/utest.c -o tests/rinterface/utest.o
gcc -std=gnu17 -shared -L/opt/R/4.4.0/lib/R/lib -L/usr/local/lib -o bnlearn.so arcs/arcs2amat.o arcs/arcs2elist.o arcs/bind.o arcs/filter.arcs.o arcs/hash.o arcs/is.row.equal.o bnlearn/bayesian.network.o bnlearn/bn.recovery.o bnlearn/cache.structure.o bnlearn/cextend.o bnlearn/colliders.o bnlearn/cpdag.o bnlearn/fitted.o bnlearn/nparams.o bnlearn/shd.o core/allocations.o core/contingency.tables.o core/correlation.o core/covariance.matrix.o core/data.table.o core/math.functions.o core/moments.o core/sampling.o core/sets.o core/sort.o core/uppertriangular.o fitted/enums.o fitted/fitted.o fitted/nparams.o fitted/rinterface/nparams.o foreign/parse.o globals.o graphs/acyclic.o graphs/completely.directed.o graphs/connected.components.o graphs/path.o graphs/path.matrix.o graphs/pdag2dag.o graphs/random/graph.generation.o graphs/topological.ordering.o graphs/rinterface/connected.components.o graphs/rinterface/path.matrix.o graphs/rinterface/sid.o graphs/sid.o inference/likelihood.weighting.o inference/loglikelihood/common.o inference/loglikelihood/discrete.o inference/loglikelihood/gaussian.o inference/loglikelihood/conditional.gaussian.o inference/rbn.o inference/rinterface/loglikelihood.o inference/rinterface/cpdist.o inference/rinterface/rbn.o inference/rinterface/likelihood.weighting.o learning/averaging/averaging.o learning/averaging/bootstrap.o learning/local/mi.matrix.o learning/score/hc.cache.lookup.o learning/score/score.delta.o learning/score/tabu.o math/conditional.least.squares.o math/least.squares.o math/linear.algebra.o minimal/common.o minimal/data.frame.o minimal/strings.o minimal/table.o minimal/tiers.o minimal/unique.o parameters/discrete/classic.discrete.o parameters/discrete/hierarchical.dirichlet.o parameters/rinterface/classic.discrete.o parameters/rinterface/hierarchical.dirichlet.o parameters/rinterface/mixture.ordinary.least.squares.o parameters/rinterface/ordinary.least.squares.o predict/map.lw.o predict/predict.o preprocessing/dedup.o preprocessing/discretize.o preprocessing/enums.o preprocessing/rinterface/discretize.o sanitization/cg.assumptions.o sanitization/covariance.o sanitization/data.o scores/alpha.star.o scores/cg.loglikelihood.o scores/cg.predictive.loglikelihood.o scores/cg.nal.o scores/custom.score.o scores/dirichlet.averaged.posterior.o scores/dirichlet.posterior.o scores/discrete.loglikelihood.o scores/discrete.nal.o scores/discrete.predictive.loglikelihood.o scores/enum.o scores/gaussian.loglikelihood.o scores/gaussian.nal.o scores/gaussian.predictive.loglikelihood.o scores/graph.priors.o scores/nml.regret.o scores/nml.regret.table.o scores/normalized.maximum.likelihood.o scores/per.node.score.o scores/wishart.posterior.o test.counter.o tests/conditional.gaussian/cg.mutual.information.o tests/discrete/df.adjust.o tests/discrete/discrete.tests.o tests/discrete/jonckheere.o tests/discrete/shrinkage.o tests/enums.o tests/gaussian/df.adjust.o tests/gaussian/gaussian.tests.o tests/gaussian/shrinkage.o tests/omnibus/custom.test.o tests/patterns/allsubs.test.o tests/patterns/ctest.o tests/patterns/roundrobin.test.o tests/patterns/utest.o tests/permutation/discrete.monte.carlo.o tests/permutation/gaussian.monte.carlo.o tests/rinterface/allsubs.test.o tests/rinterface/ctest.o tests/rinterface/htest.o tests/rinterface/indep.test.o tests/rinterface/roundrobin.test.o tests/rinterface/utest.o -llapack -lblas -lgfortran -lm -lquadmath -L/opt/R/4.4.0/lib/R/lib -lR
installing to /tmp/workdir/bnlearn/old/bnlearn.Rcheck/00LOCK-bnlearn/00new/bnlearn/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
** help
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
# bnpa

<details>

* Version: 0.3.0
* GitHub: NA
* Source code: https://github.com/cran/bnpa
* Date/Publication: 2019-08-01 23:20:02 UTC
* Number of recursive dependencies: 115

Run `revdepcheck::cloud_details(, "bnpa")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/bnpa/new/bnpa.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘bnpa/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘bnpa’ version ‘0.3.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'bnlearn', 'semPlot'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/bnpa/old/bnpa.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘bnpa/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘bnpa’ version ‘0.3.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'bnlearn', 'semPlot'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# BoomSpikeSlab

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/BoomSpikeSlab
* Number of recursive dependencies: 33

Run `revdepcheck::cloud_details(, "BoomSpikeSlab")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# bsts

<details>

* Version: 0.9.10
* GitHub: NA
* Source code: https://github.com/cran/bsts
* Date/Publication: 2024-01-17 13:02:07 UTC
* Number of recursive dependencies: 29

Run `revdepcheck::cloud_details(, "bsts")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/bsts/new/bsts.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘bsts/DESCRIPTION’ ... OK
* this is package ‘bsts’ version ‘0.9.10’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'BoomSpikeSlab', 'Boom'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/bsts/old/bsts.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘bsts/DESCRIPTION’ ... OK
* this is package ‘bsts’ version ‘0.9.10’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'BoomSpikeSlab', 'Boom'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# cdmTools

<details>

* Version: 1.0.6
* GitHub: https://github.com/pablo-najera/cdmTools
* Source code: https://github.com/cran/cdmTools
* Date/Publication: 2025-05-19 08:10:02 UTC
* Number of recursive dependencies: 120

Run `revdepcheck::cloud_details(, "cdmTools")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/cdmTools/new/cdmTools.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘cdmTools/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘cdmTools’ version ‘1.0.6’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘cdmTools’ can be installed ... OK
* checking installed package size ... OK
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
* checking whether startup messages can be suppressed ... OK
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
* checking examples ... OK
* DONE
Status: OK





```
### CRAN

```
* using log directory ‘/tmp/workdir/cdmTools/old/cdmTools.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘cdmTools/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘cdmTools’ version ‘1.0.6’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘cdmTools’ can be installed ... OK
* checking installed package size ... OK
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
* checking whether startup messages can be suppressed ... OK
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
* checking examples ... OK
* DONE
Status: OK





```
# dataone

<details>

* Version: 2.2.2
* GitHub: https://github.com/DataONEorg/rdataone
* Source code: https://github.com/cran/dataone
* Date/Publication: 2022-06-10 19:30:02 UTC
* Number of recursive dependencies: 63

Run `revdepcheck::cloud_details(, "dataone")` for more info

</details>

## In both

*   checking whether package ‘dataone’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/dataone/new/dataone.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘dataone’ ...
** package ‘dataone’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/usr/local/lib/R/site-library/redland/libs/redland.so':
  librdf.so.0: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘dataone’
* removing ‘/tmp/workdir/dataone/new/dataone.Rcheck/dataone’


```
### CRAN

```
* installing *source* package ‘dataone’ ...
** package ‘dataone’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/usr/local/lib/R/site-library/redland/libs/redland.so':
  librdf.so.0: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘dataone’
* removing ‘/tmp/workdir/dataone/old/dataone.Rcheck/dataone’


```
# datapack

<details>

* Version: 1.4.1
* GitHub: https://github.com/ropensci/datapack
* Source code: https://github.com/cran/datapack
* Date/Publication: 2022-06-10 19:40:01 UTC
* Number of recursive dependencies: 63

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
  unable to load shared object '/usr/local/lib/R/site-library/redland/libs/redland.so':
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
  unable to load shared object '/usr/local/lib/R/site-library/redland/libs/redland.so':
  librdf.so.0: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... namespaceImport -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘datapack’
* removing ‘/tmp/workdir/datapack/old/datapack.Rcheck/datapack’


```
# dySEM

<details>

* Version: 1.1.1
* GitHub: https://github.com/jsakaluk/dySEM
* Source code: https://github.com/cran/dySEM
* Date/Publication: 2025-01-07 22:20:02 UTC
* Number of recursive dependencies: 135

Run `revdepcheck::cloud_details(, "dySEM")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/dySEM/new/dySEM.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘dySEM/DESCRIPTION’ ... OK
* this is package ‘dySEM’ version ‘1.1.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/dySEM/old/dySEM.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘dySEM/DESCRIPTION’ ... OK
* this is package ‘dySEM’ version ‘1.1.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# EGAnet

<details>

* Version: 2.3.0
* GitHub: https://github.com/hfgolino/EGAnet
* Source code: https://github.com/cran/EGAnet
* Date/Publication: 2025-04-09 23:10:15 UTC
* Number of recursive dependencies: 181

Run `revdepcheck::cloud_details(, "EGAnet")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/EGAnet/new/EGAnet.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘EGAnet/DESCRIPTION’ ... OK
* this is package ‘EGAnet’ version ‘2.3.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/EGAnet/old/EGAnet.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘EGAnet/DESCRIPTION’ ... OK
* this is package ‘EGAnet’ version ‘2.3.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# FAfA

<details>

* Version: 0.3
* GitHub: NA
* Source code: https://github.com/cran/FAfA
* Date/Publication: 2025-05-23 19:42:09 UTC
* Number of recursive dependencies: 249

Run `revdepcheck::cloud_details(, "FAfA")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/FAfA/new/FAfA.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘FAfA/DESCRIPTION’ ... OK
* this is package ‘FAfA’ version ‘0.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'MBESS', 'semPlot'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/FAfA/old/FAfA.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘FAfA/DESCRIPTION’ ... OK
* this is package ‘FAfA’ version ‘0.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'MBESS', 'semPlot'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# FAIRmaterials

<details>

* Version: 0.4.2.1
* GitHub: NA
* Source code: https://github.com/cran/FAIRmaterials
* Date/Publication: 2024-06-27 15:40:02 UTC
* Number of recursive dependencies: 90

Run `revdepcheck::cloud_details(, "FAIRmaterials")` for more info

</details>

## In both

*   checking whether package ‘FAIRmaterials’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/FAIRmaterials/new/FAIRmaterials.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘FAIRmaterials’ ...
** package ‘FAIRmaterials’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/usr/local/lib/R/site-library/redland/libs/redland.so':
  librdf.so.0: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... asNamespace -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘FAIRmaterials’
* removing ‘/tmp/workdir/FAIRmaterials/new/FAIRmaterials.Rcheck/FAIRmaterials’


```
### CRAN

```
* installing *source* package ‘FAIRmaterials’ ...
** package ‘FAIRmaterials’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in dyn.load(file, DLLpath = DLLpath, ...) : 
  unable to load shared object '/usr/local/lib/R/site-library/redland/libs/redland.so':
  librdf.so.0: cannot open shared object file: No such file or directory
Calls: <Anonymous> ... asNamespace -> loadNamespace -> library.dynam -> dyn.load
Execution halted
ERROR: lazy loading failed for package ‘FAIRmaterials’
* removing ‘/tmp/workdir/FAIRmaterials/old/FAIRmaterials.Rcheck/FAIRmaterials’


```
# fdm2id

<details>

* Version: 0.9.9
* GitHub: NA
* Source code: https://github.com/cran/fdm2id
* Date/Publication: 2023-06-12 13:10:02 UTC
* Number of recursive dependencies: 241

Run `revdepcheck::cloud_details(, "fdm2id")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/fdm2id/new/fdm2id.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘fdm2id/DESCRIPTION’ ... OK
* this is package ‘fdm2id’ version ‘0.9.9’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'arules', 'arulesViz'

Package which this enhances but not available for checking: ‘NMF’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/fdm2id/old/fdm2id.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘fdm2id/DESCRIPTION’ ... OK
* this is package ‘fdm2id’ version ‘0.9.9’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'arules', 'arulesViz'

Package which this enhances but not available for checking: ‘NMF’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# ggsem

<details>

* Version: 0.2.4
* GitHub: https://github.com/smin95/ggsem
* Source code: https://github.com/cran/ggsem
* Date/Publication: 2025-02-02 22:50:02 UTC
* Number of recursive dependencies: 160

Run `revdepcheck::cloud_details(, "ggsem")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/ggsem/new/ggsem.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ggsem/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘ggsem’ version ‘0.2.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘semPlot’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘ggsem’ can be installed ... OK
* checking installed package size ... OK
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
* checking whether startup messages can be suppressed ... OK
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
* checking examples ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/ggsem/old/ggsem.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ggsem/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘ggsem’ version ‘0.2.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘semPlot’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘ggsem’ can be installed ... OK
* checking installed package size ... OK
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
* checking whether startup messages can be suppressed ... OK
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
* checking examples ... OK
* DONE
Status: 1 NOTE





```
# jmv

<details>

* Version: 2.7.0
* GitHub: https://github.com/jamovi/jmv
* Source code: https://github.com/cran/jmv
* Date/Publication: 2025-06-11 10:50:02 UTC
* Number of recursive dependencies: 185

Run `revdepcheck::cloud_details(, "jmv")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/jmv/new/jmv.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘jmv/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘jmv’ version ‘2.7.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘semPlot’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘jmv’ can be installed ... OK
* checking installed package size ... NOTE
  installed size is 11.9Mb
  sub-directories of 1Mb or more:
    R      7.5Mb
    i18n   4.1Mb
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
* checking dependencies in R code ... NOTE
Namespaces in Imports field not imported from:
  ‘BayesFactor’ ‘GGally’ ‘GPArotation’ ‘MASS’ ‘PMCMR’ ‘R6’ ‘ROCR’
  ‘afex’ ‘car’ ‘dplyr’ ‘emmeans’ ‘ggrepel’ ‘ggridges’ ‘lavaan’
  ‘matrixStats’ ‘multcomp’ ‘mvnormtest’ ‘nnet’ ‘psych’ ‘vcd’ ‘vcdExtra’
  All declared Imports should be used.
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
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 3 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/jmv/old/jmv.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘jmv/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘jmv’ version ‘2.7.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘semPlot’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘jmv’ can be installed ... OK
* checking installed package size ... NOTE
  installed size is 11.9Mb
  sub-directories of 1Mb or more:
    R      7.5Mb
    i18n   4.1Mb
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
* checking dependencies in R code ... NOTE
Namespaces in Imports field not imported from:
  ‘BayesFactor’ ‘GGally’ ‘GPArotation’ ‘MASS’ ‘PMCMR’ ‘R6’ ‘ROCR’
  ‘afex’ ‘car’ ‘dplyr’ ‘emmeans’ ‘ggrepel’ ‘ggridges’ ‘lavaan’
  ‘matrixStats’ ‘multcomp’ ‘mvnormtest’ ‘nnet’ ‘psych’ ‘vcd’ ‘vcdExtra’
  All declared Imports should be used.
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
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 3 NOTEs





```
# latentFactoR

<details>

* Version: 0.0.6
* GitHub: NA
* Source code: https://github.com/cran/latentFactoR
* Date/Publication: 2024-04-18 21:23:04 UTC
* Number of recursive dependencies: 193

Run `revdepcheck::cloud_details(, "latentFactoR")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/latentFactoR/new/latentFactoR.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘latentFactoR/DESCRIPTION’ ... OK
* this is package ‘latentFactoR’ version ‘0.0.6’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘latentFactoR’ can be installed ... OK
* checking installed package size ... OK
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
* checking whether startup messages can be suppressed ... OK
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
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking examples ... OK
* DONE
Status: OK





```
### CRAN

```
* using log directory ‘/tmp/workdir/latentFactoR/old/latentFactoR.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘latentFactoR/DESCRIPTION’ ... OK
* this is package ‘latentFactoR’ version ‘0.0.6’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘latentFactoR’ can be installed ... OK
* checking installed package size ... OK
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
* checking whether startup messages can be suppressed ... OK
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
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking examples ... OK
* DONE
Status: OK





```
# lavaan.shiny

<details>

* Version: 1.2
* GitHub: https://github.com/kylehamilton/lavaan.shiny
* Source code: https://github.com/cran/lavaan.shiny
* Date/Publication: 2017-04-07 06:05:09 UTC
* Number of recursive dependencies: 114

Run `revdepcheck::cloud_details(, "lavaan.shiny")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/lavaan.shiny/new/lavaan.shiny.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘lavaan.shiny/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘lavaan.shiny’ version ‘1.2’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/lavaan.shiny/old/lavaan.shiny.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘lavaan.shiny/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘lavaan.shiny’ version ‘1.2’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# lcsm

<details>

* Version: 0.3.2
* GitHub: https://github.com/milanwiedemann/lcsm
* Source code: https://github.com/cran/lcsm
* Date/Publication: 2023-02-25 23:40:02 UTC
* Number of recursive dependencies: 132

Run `revdepcheck::cloud_details(, "lcsm")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/lcsm/new/lcsm.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘lcsm/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘lcsm’ version ‘0.3.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/lcsm/old/lcsm.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘lcsm/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘lcsm’ version ‘0.3.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# lvnet

<details>

* Version: 0.3.5
* GitHub: NA
* Source code: https://github.com/cran/lvnet
* Date/Publication: 2019-06-21 07:50:03 UTC
* Number of recursive dependencies: 111

Run `revdepcheck::cloud_details(, "lvnet")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/lvnet/new/lvnet.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘lvnet/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘lvnet’ version ‘0.3.5’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'OpenMx', 'semPlot'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/lvnet/old/lvnet.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘lvnet/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘lvnet’ version ‘0.3.5’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'OpenMx', 'semPlot'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# manymome

<details>

* Version: 0.3.1
* GitHub: https://github.com/sfcheung/manymome
* Source code: https://github.com/cran/manymome
* Date/Publication: 2025-08-22 05:40:02 UTC
* Number of recursive dependencies: 154

Run `revdepcheck::cloud_details(, "manymome")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/manymome/new/manymome.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘manymome/DESCRIPTION’ ... OK
* this is package ‘manymome’ version ‘0.3.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘semPlot’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘manymome’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
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
* checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘semPlot’
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/manymome/old/manymome.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘manymome/DESCRIPTION’ ... OK
* this is package ‘manymome’ version ‘0.3.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘semPlot’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘manymome’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
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
* checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘semPlot’
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
# multinma

<details>

* Version: 0.8.1
* GitHub: https://github.com/dmphillippo/multinma
* Source code: https://github.com/cran/multinma
* Date/Publication: 2025-05-31 00:00:02 UTC
* Number of recursive dependencies: 149

Run `revdepcheck::cloud_details(, "multinma")` for more info

</details>

## In both

*   checking whether package ‘multinma’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/multinma/new/multinma.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘multinma’ ...
** package ‘multinma’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
using C++17


g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG -I"../inst/include" -I"/usr/local/lib/R/site-library/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -DUSE_STANC3 -D_HAS_AUTO_PTR_ETC=0 -I'/usr/local/lib/R/site-library/BH/include' -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppEigen/include' -I'/usr/local/lib/R/site-library/RcppParallel/include' -I'/usr/local/lib/R/site-library/rstan/include' -I'/usr/local/lib/R/site-library/StanHeaders/include' -I/usr/local/include    -I'/usr/local/lib/R/site-library/RcppParallel/include' -D_REENTRANT -DSTAN_THREADS   -fpic  -g -O2   -c RcppExports.cpp -o RcppExports.o
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:205,
                 from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Dense:1,
                 from /usr/local/lib/R/site-library/RcppEigen/include/RcppEigenForward.h:28,
                 from /usr/local/lib/R/site-library/RcppEigen/include/RcppEigen.h:25,
                 from RcppExports.cpp:4:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:46:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   46 | typedef eigen_packet_wrapper<__m128i, 0> Packet4i;
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:47:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   47 | typedef eigen_packet_wrapper<__m128i, 1> Packet16b;
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:49:39: warning: ignoring attributes on template argument ‘__m128’ [-Wignored-attributes]
   49 | template<> struct is_arithmetic<__m128>  { enum { value = true }; };
      |                                       ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:50:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   50 | template<> struct is_arithmetic<__m128i> { enum { value = true }; };
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:51:40: warning: ignoring attributes on template argument ‘__m128d’ [-Wignored-attributes]
   51 | template<> struct is_arithmetic<__m128d> { enum { value = true }; };
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:222:43: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
  222 | template<> struct unpacket_traits<Packet4f> {
      |                                           ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:228:43: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
  228 | template<> struct unpacket_traits<Packet2d> {
      |                                           ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:1124:34: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
 1124 | ptranspose(PacketBlock<Packet4f,4>& kernel) {
      |                                  ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:1129:34: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
 1129 | ptranspose(PacketBlock<Packet2d,2>& kernel) {
      |                                  ^
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:174:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:16:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
   16 |   struct conj_helper<PACKET_REAL, PACKET_CPLX, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:173:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  173 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet2cf,Packet4f)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:29:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
   29 |   struct conj_helper<PACKET_CPLX, PACKET_REAL, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:173:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  173 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet2cf,Packet4f)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:16:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
   16 |   struct conj_helper<PACKET_REAL, PACKET_CPLX, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:298:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  298 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet1cd,Packet2d)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:29:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
   29 |   struct conj_helper<PACKET_CPLX, PACKET_REAL, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:298:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  298 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet1cd,Packet2d)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:165:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h: In instantiation of ‘struct Eigen::internal::find_best_packet<float, 4>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:22:57:   required from ‘struct Eigen::internal::traits<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:266:49:   required from ‘struct Eigen::internal::traits<Eigen::Quaternion<float> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:24:46:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:44: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::unpacket_traits<__vector(4) float>::half’ {aka ‘__m128’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:208:88: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  208 |   typedef typename find_best_packet_helper<Size,typename packet_traits<T>::type>::type type;
      |                                                                                        ^~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:271:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<float, 4, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:46:50:   required from ‘class Eigen::QuaternionBase<Eigen::Quaternion<float> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:273:7:   required from ‘class Eigen::Quaternion<float>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:27:3:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h: In instantiation of ‘struct Eigen::internal::find_best_packet<double, 4>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:22:57:   required from ‘struct Eigen::internal::traits<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:266:49:   required from ‘struct Eigen::internal::traits<Eigen::Quaternion<double> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:98:47:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:44: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::unpacket_traits<__vector(2) double>::half’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:208:88: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  208 |   typedef typename find_best_packet_helper<Size,typename packet_traits<T>::type>::type type;
      |                                                                                        ^~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, 4, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:46:50:   required from ‘class Eigen::QuaternionBase<Eigen::Quaternion<double> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:273:7:   required from ‘class Eigen::Quaternion<double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:102:3:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/SparseCore:37,
                 from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Sparse:26,
                 from /usr/local/lib/R/site-library/RcppEigen/include/RcppEigenForward.h:29:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h: In instantiation of ‘class Eigen::SparseMatrixBase<Eigen::SparseMatrix<double, 0, int> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseCompressedBase.h:36:7:   required from ‘class Eigen::SparseCompressedBase<Eigen::SparseMatrix<double, 0, int> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrix.h:96:7:   required from ‘class Eigen::SparseMatrix<double, 0, int>’
/usr/local/lib/R/site-library/RcppEigen/include/unsupported/Eigen/src/IterativeSolvers/ConstrainedConjGrad.h:61:25:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h:47:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   47 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~


g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG -I"../inst/include" -I"/usr/local/lib/R/site-library/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -DUSE_STANC3 -D_HAS_AUTO_PTR_ETC=0 -I'/usr/local/lib/R/site-library/BH/include' -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppEigen/include' -I'/usr/local/lib/R/site-library/RcppParallel/include' -I'/usr/local/lib/R/site-library/rstan/include' -I'/usr/local/lib/R/site-library/StanHeaders/include' -I/usr/local/include    -I'/usr/local/lib/R/site-library/RcppParallel/include' -D_REENTRANT -DSTAN_THREADS   -fpic  -g -O2   -c stanExports_binomial_1par.cc -o stanExports_binomial_1par.o
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:205,
                 from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Dense:1,
                 from /usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/Eigen.hpp:22,
                 from /usr/local/lib/R/site-library/rstan/include/rstan/rstaninc.hpp:3,
                 from stanExports_binomial_1par.h:23,
                 from stanExports_binomial_1par.cc:5:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:46:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   46 | typedef eigen_packet_wrapper<__m128i, 0> Packet4i;
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:47:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   47 | typedef eigen_packet_wrapper<__m128i, 1> Packet16b;
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:49:39: warning: ignoring attributes on template argument ‘__m128’ [-Wignored-attributes]
   49 | template<> struct is_arithmetic<__m128>  { enum { value = true }; };
      |                                       ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:50:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   50 | template<> struct is_arithmetic<__m128i> { enum { value = true }; };
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:51:40: warning: ignoring attributes on template argument ‘__m128d’ [-Wignored-attributes]
   51 | template<> struct is_arithmetic<__m128d> { enum { value = true }; };
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:222:43: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
  222 | template<> struct unpacket_traits<Packet4f> {
      |                                           ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:228:43: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
  228 | template<> struct unpacket_traits<Packet2d> {
      |                                           ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:1124:34: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
 1124 | ptranspose(PacketBlock<Packet4f,4>& kernel) {
      |                                  ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:1129:34: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
 1129 | ptranspose(PacketBlock<Packet2d,2>& kernel) {
      |                                  ^
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:174:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:16:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
   16 |   struct conj_helper<PACKET_REAL, PACKET_CPLX, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:173:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  173 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet2cf,Packet4f)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:29:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
   29 |   struct conj_helper<PACKET_CPLX, PACKET_REAL, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:173:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  173 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet2cf,Packet4f)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:16:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
   16 |   struct conj_helper<PACKET_REAL, PACKET_CPLX, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:298:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  298 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet1cd,Packet2d)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:29:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
   29 |   struct conj_helper<PACKET_CPLX, PACKET_REAL, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:298:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  298 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet1cd,Packet2d)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:165:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h: In instantiation of ‘struct Eigen::internal::find_best_packet<float, 4>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:22:57:   required from ‘struct Eigen::internal::traits<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:266:49:   required from ‘struct Eigen::internal::traits<Eigen::Quaternion<float> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:24:46:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:44: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::unpacket_traits<__vector(4) float>::half’ {aka ‘__m128’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:208:88: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  208 |   typedef typename find_best_packet_helper<Size,typename packet_traits<T>::type>::type type;
      |                                                                                        ^~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:271:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<float, 4, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:46:50:   required from ‘class Eigen::QuaternionBase<Eigen::Quaternion<float> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:273:7:   required from ‘class Eigen::Quaternion<float>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:27:3:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h: In instantiation of ‘struct Eigen::internal::find_best_packet<double, 4>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:22:57:   required from ‘struct Eigen::internal::traits<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:266:49:   required from ‘struct Eigen::internal::traits<Eigen::Quaternion<double> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:98:47:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:44: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::unpacket_traits<__vector(2) double>::half’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:208:88: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  208 |   typedef typename find_best_packet_helper<Size,typename packet_traits<T>::type>::type type;
      |                                                                                        ^~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, 4, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:46:50:   required from ‘class Eigen::QuaternionBase<Eigen::Quaternion<double> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:273:7:   required from ‘class Eigen::Quaternion<double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:102:3:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
In file included from /usr/local/lib/R/site-library/BH/include/boost/smart_ptr/shared_ptr.hpp:17,
                 from /usr/local/lib/R/site-library/BH/include/boost/shared_ptr.hpp:17,
                 from /usr/local/lib/R/site-library/BH/include/boost/date_time/time_clock.hpp:17,
                 from /usr/local/lib/R/site-library/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /usr/local/lib/R/site-library/rstan/include/rstan/stan_fit.hpp:15,
                 from /usr/local/lib/R/site-library/rstan/include/rstan/rstaninc.hpp:4:
/usr/local/lib/R/site-library/BH/include/boost/smart_ptr/detail/shared_count.hpp:326:33: warning: ‘template<class> class std::auto_ptr’ is deprecated: use 'std::unique_ptr' instead [-Wdeprecated-declarations]
  326 |     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
      |                                 ^~~~~~~~
In file included from /usr/include/c++/13/memory:78,
                 from /usr/local/lib/R/site-library/rstan/include/rstan/stan_fit.hpp:7:
/usr/include/c++/13/bits/unique_ptr.h:65:28: note: declared here
   65 |   template<typename> class auto_ptr;
      |                            ^~~~~~~~
/usr/local/lib/R/site-library/BH/include/boost/smart_ptr/shared_ptr.hpp:354:31: warning: ‘template<class> class std::auto_ptr’ is deprecated: use 'std::unique_ptr' instead [-Wdeprecated-declarations]
  354 |     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
      |                               ^~~~~~~~
/usr/include/c++/13/bits/unique_ptr.h:65:28: note: declared here
   65 |   template<typename> class auto_ptr;
      |                            ^~~~~~~~
/usr/local/lib/R/site-library/BH/include/boost/smart_ptr/shared_ptr.hpp:365:22: warning: ‘template<class> class std::auto_ptr’ is deprecated: use 'std::unique_ptr' instead [-Wdeprecated-declarations]
  365 |     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
      |                      ^~~~~~~~
/usr/include/c++/13/bits/unique_ptr.h:65:28: note: declared here
   65 |   template<typename> class auto_ptr;
      |                            ^~~~~~~~
/usr/local/lib/R/site-library/BH/include/boost/smart_ptr/shared_ptr.hpp:423:34: warning: ‘template<class> class std::auto_ptr’ is deprecated: use 'std::unique_ptr' instead [-Wdeprecated-declarations]
  423 |     shared_ptr & operator=( std::auto_ptr<Y> & r )
      |                                  ^~~~~~~~
/usr/include/c++/13/bits/unique_ptr.h:65:28: note: declared here
   65 |   template<typename> class auto_ptr;
      |                            ^~~~~~~~
/usr/local/lib/R/site-library/BH/include/boost/smart_ptr/shared_ptr.hpp:430:34: warning: ‘template<class> class std::auto_ptr’ is deprecated: use 'std::unique_ptr' instead [-Wdeprecated-declarations]
  430 |     shared_ptr & operator=( std::auto_ptr<Y> && r )
      |                                  ^~~~~~~~
/usr/include/c++/13/bits/unique_ptr.h:65:28: note: declared here
   65 |   template<typename> class auto_ptr;
      |                            ^~~~~~~~
/usr/local/lib/R/site-library/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/usr/local/lib/R/site-library/BH/include/boost/smart_ptr/shared_ptr.hpp:432:38: warning: ‘template<class> class std::auto_ptr’ is deprecated: use 'std::unique_ptr' instead [-Wdeprecated-declarations]
  432 |         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
      |                                      ^~~~~~~~
/usr/include/c++/13/bits/unique_ptr.h:65:28: note: declared here
   65 |   template<typename> class auto_ptr;
      |                            ^~~~~~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/SparseCore:37,
                 from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Sparse:26,
                 from /usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/Eigen.hpp:23:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h: In instantiation of ‘class Eigen::SparseMatrixBase<Eigen::SparseMatrix<double, 0, int> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseCompressedBase.h:36:7:   required from ‘class Eigen::SparseCompressedBase<Eigen::SparseMatrix<double, 0, int> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrix.h:96:7:   required from ‘class Eigen::SparseMatrix<double, 0, int>’
/usr/local/lib/R/site-library/RcppEigen/include/unsupported/Eigen/src/IterativeSolvers/ConstrainedConjGrad.h:61:25:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h:47:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   47 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h: In instantiation of ‘struct Eigen::internal::find_best_packet<double, -1>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:22:57:   required from ‘struct Eigen::internal::traits<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Cholesky/LDLT.h:19:52:   required from ‘struct Eigen::internal::traits<Eigen::LDLT<Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/EigenBase.h:42:59:   required from ‘struct Eigen::EigenBase<Eigen::LDLT<Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/SolverBase.h:68:7:   required from ‘class Eigen::SolverBase<Eigen::LDLT<Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Cholesky/LDLT.h:59:49:   required from ‘class Eigen::LDLT<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/err/check_pos_definite.hpp:46:15:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:44: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::unpacket_traits<__vector(2) double>::half’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:208:88: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  208 |   typedef typename find_best_packet_helper<Size,typename packet_traits<T>::type>::type type;
      |                                                                                        ^~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, -1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, -1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, -1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, -1, -1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Cholesky/LDLT.h:69:42:   required from ‘class Eigen::LDLT<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/err/check_pos_definite.hpp:46:15:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, -1, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Cholesky/LDLT.h:287:19:   required from ‘class Eigen::LDLT<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/err/check_pos_definite.hpp:46:15:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0>, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Diagonal.h:63:53:   required from ‘class Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/err/check_pos_definite.hpp:47:29:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0> >, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::ArrayWrapper<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::ArrayWrapper<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayWrapper.h:42:7:   required from ‘class Eigen::ArrayWrapper<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0> >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/err/check_pos_definite.hpp:47:41:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, Eigen::Array<double, -1, 1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, Eigen::Array<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, Eigen::Array<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseNullaryOp.h:60:7:   required from ‘class Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, Eigen::Array<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:38:28:   required from ‘struct Eigen::internal::traits<Eigen::CwiseBinaryOp<Eigen::internal::scalar_cmp_op<double, double, Eigen::internal::cmp_LE>, const Eigen::ArrayWrapper<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_cmp_op<double, double, Eigen::internal::cmp_LE>, const Eigen::ArrayWrapper<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, Eigen::Array<double, -1, 1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_cmp_op<double, double, Eigen::internal::cmp_LE>, const Eigen::ArrayWrapper<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, Eigen::Array<double, -1, 1> > >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/err/check_pos_definite.hpp:47:45:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:223:34:   required from ‘class Eigen::MapBase<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:329:7:   required from ‘class Eigen::internal::BlockImpl_dense<Eigen::Matrix<double, -1, -1>, -1, 1, true, true>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:154:7:   required from ‘class Eigen::BlockImpl<Eigen::Matrix<double, -1, -1>, -1, 1, true, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:103:81:   required from ‘class Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/multiply_lower_tri_self_transpose.hpp:35:26:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, false>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, false>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, false>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, false>, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:223:34:   required from ‘class Eigen::MapBase<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, false>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:329:7:   required from ‘class Eigen::internal::BlockImpl_dense<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, false, true>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:154:7:   required from ‘class Eigen::BlockImpl<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, false, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:103:81:   required from ‘class Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, false>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/VectorBlock.h:56:47:   required from ‘class Eigen::VectorBlock<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/multiply_lower_tri_self_transpose.hpp:35:34:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Matrix<double, -1, 1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseNullaryOp.h:60:7:   required from ‘class Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/linspaced_array.hpp:37:49:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 1, -1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 1, -1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 1, -1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<double, 1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<double, 1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, 1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, 1, -1>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/linspaced_row_vector.hpp:32:28:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Matrix<double, 1, -1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Matrix<double, 1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Matrix<double, 1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseNullaryOp.h:60:7:   required from ‘class Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Matrix<double, 1, -1> >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/linspaced_row_vector.hpp:32:39:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Array<double, -1, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Array<double, -1, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Array<double, -1, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Array<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::Array<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Array<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Array.h:45:7:   required from ‘class Eigen::Array<double, -1, 1>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/lmgamma.hpp:58:53:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Array<double, -1, 1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Array<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Array<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseNullaryOp.h:60:7:   required from ‘class Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Array<double, -1, 1> >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/lmgamma.hpp:58:72:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<int, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<int>, const Eigen::Array<int, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Array<double, -1, 1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<int, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<int>, const Eigen::Array<int, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<int, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<int>, const Eigen::Array<int, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_difference_op<int, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<int>, const Eigen::Array<int, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Array<double, -1, 1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<int, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<int>, const Eigen::Array<int, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Array<double, -1, 1> > >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/lmgamma.hpp:58:77:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Diagonal.h:63:53:   required from ‘class Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/matrix_exp_action_handler.hpp:71:17:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0> >, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0> >, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::ArrayWrapper<Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::ArrayWrapper<Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayWrapper.h:42:7:   required from ‘class Eigen::ArrayWrapper<Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0> >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/matrix_exp_action_handler.hpp:71:29:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, -1>, 0>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, -1>, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, -1>, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:120:7:   required from ‘class Eigen::internal::dense_product_base<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, -1>, 0, 8>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:152:7:   required from ‘class Eigen::ProductImpl<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, -1>, 0, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:71:7:   required from ‘class Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, -1>, 0>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/matrix_exp_action_handler.hpp:86:43:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseUnaryOp<Eigen::internal::scalar_abs_op<double>, const Eigen::Matrix<double, -1, -1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseUnaryOp<Eigen::internal::scalar_abs_op<double>, const Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseUnaryOp<Eigen::internal::scalar_abs_op<double>, const Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseUnaryOp.h:94:7:   required from ‘class Eigen::CwiseUnaryOpImpl<Eigen::internal::scalar_abs_op<double>, const Eigen::Matrix<double, -1, -1>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseUnaryOp.h:55:7:   required from ‘class Eigen::CwiseUnaryOp<Eigen::internal::scalar_abs_op<double>, const Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/matrix_exp_action_handler.hpp:106:22:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::PartialReduxExpr<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_abs_op<double>, const Eigen::Matrix<double, -1, -1> >, Eigen::internal::member_sum<double, double>, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::PartialReduxExpr<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_abs_op<double>, const Eigen::Matrix<double, -1, -1> >, Eigen::internal::member_sum<double, double>, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::PartialReduxExpr<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_abs_op<double>, const Eigen::Matrix<double, -1, -1> >, Eigen::internal::member_sum<double, double>, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/VectorwiseOp.h:56:7:   required from ‘class Eigen::PartialReduxExpr<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_abs_op<double>, const Eigen::Matrix<double, -1, -1> >, Eigen::internal::member_sum<double, double>, 1>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/matrix_exp_action_handler.hpp:106:38:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> >, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayWrapper.h:42:7:   required from ‘class Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/ceil.hpp:57:52:   required from ‘stan::math::ceil<Eigen::Matrix<double, -1, -1> >(const Eigen::Matrix<double, -1, -1>&)::<lambda(const auto:244&)> [with auto:244 = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/functor/apply_vector_unary.hpp:47:25:   required from ‘static auto stan::math::apply_vector_unary<T, typename std::enable_if<stan::is_eigen<typename std::decay<_Tp>::type>::value, void>::type>::apply(const T&, const F&) [with F = stan::math::ceil<Eigen::Matrix<double, -1, -1> >(const Eigen::Matrix<double, -1, -1>&)::<lambda(const auto:244&)>; T2 = Eigen::Matrix<double, -1, -1>; stan::require_t<stan::is_eigen_matrix_base<typename stan::plain_type<T2, void>::type> >* <anonymous> = 0; T = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/ceil.hpp:56:46:   required from ‘auto stan::math::ceil(const Container&) [with Container = Eigen::Matrix<double, -1, -1>; stan::require_container_st<std::is_arithmetic, Container>* <anonymous> = 0; stan::require_not_var_matrix_t<Container>* <anonymous> = 0]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/matrix_exp_action_handler.hpp:197:41:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseUnaryOp<Eigen::internal::scalar_ceil_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseUnaryOp<Eigen::internal::scalar_ceil_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseUnaryOp<Eigen::internal::scalar_ceil_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseUnaryOp.h:94:7:   required from ‘class Eigen::CwiseUnaryOpImpl<Eigen::internal::scalar_ceil_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseUnaryOp.h:55:7:   required from ‘class Eigen::CwiseUnaryOp<Eigen::internal::scalar_ceil_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/ceil.hpp:57:52:   required from ‘stan::math::ceil<Eigen::Matrix<double, -1, -1> >(const Eigen::Matrix<double, -1, -1>&)::<lambda(const auto:244&)> [with auto:244 = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/functor/apply_vector_unary.hpp:47:25:   required from ‘static auto stan::math::apply_vector_unary<T, typename std::enable_if<stan::is_eigen<typename std::decay<_Tp>::type>::value, void>::type>::apply(const T&, const F&) [with F = stan::math::ceil<Eigen::Matrix<double, -1, -1> >(const Eigen::Matrix<double, -1, -1>&)::<lambda(const auto:244&)>; T2 = Eigen::Matrix<double, -1, -1>; stan::require_t<stan::is_eigen_matrix_base<typename stan::plain_type<T2, void>::type> >* <anonymous> = 0; T = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/ceil.hpp:56:46:   required from ‘auto stan::math::ceil(const Container&) [with Container = Eigen::Matrix<double, -1, -1>; stan::require_container_st<std::is_arithmetic, Container>* <anonymous> = 0; stan::require_not_var_matrix_t<Container>* <anonymous> = 0]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/matrix_exp_action_handler.hpp:197:41:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_ceil_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> > > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_ceil_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> > > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_ceil_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> > > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayWrapper.h:140:7:   required from ‘class Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_ceil_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> > > >’
...
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:458:39:   required from ‘Eigen::SelfAdjointEigenSolver<MatrixType>& Eigen::SelfAdjointEigenSolver<_MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:181:14:   required from ‘Eigen::SelfAdjointEigenSolver<_MatrixType>::SelfAdjointEigenSolver(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/optimization/newton.hpp:19:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   required from ‘struct Eigen::internal::evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   [ skipping 22 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:238:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>& Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::operator=(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::HouseholderSequence<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, 1>, 1>; _Scalar = double; int _Rows = -1; int _Cols = -1; int _Options = 0; int _MaxRows = -1; int _MaxCols = -1]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:453:11:   required from ‘static void Eigen::internal::tridiagonalization_inplace_selector<MatrixType, Size, IsComplex>::run(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; MatrixType = Eigen::Matrix<double, -1, -1>; int Size = -1; bool IsComplex = false; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:434:55:   required from ‘void Eigen::internal::tridiagonalization_inplace(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with MatrixType = Eigen::Matrix<double, -1, -1>; DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:458:39:   required from ‘Eigen::SelfAdjointEigenSolver<MatrixType>& Eigen::SelfAdjointEigenSolver<_MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:181:14:   required from ‘Eigen::SelfAdjointEigenSolver<_MatrixType>::SelfAdjointEigenSolver(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/optimization/newton.hpp:19:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:780:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; Src = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Func = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:858:27:   required from ‘void Eigen::internal::call_assignment(Dst&, const Src&, const Func&, typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type) [with Dst = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; Src = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Func = sub_assign_op<double, double>; typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type = void*; typename evaluator_traits<SrcXprType>::Shape = Eigen::DenseShape]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:164:18:   required from ‘Derived& Eigen::MatrixBase<Derived>::operator-=(const Eigen::MatrixBase<OtherDerived>&) [with OtherDerived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Derived = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixVector.h:341:27:   [ skipping 19 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:238:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>& Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::operator=(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::HouseholderSequence<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, 1>, 1>; _Scalar = double; int _Rows = -1; int _Cols = -1; int _Options = 0; int _MaxRows = -1; int _MaxCols = -1]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:453:11:   required from ‘static void Eigen::internal::tridiagonalization_inplace_selector<MatrixType, Size, IsComplex>::run(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; MatrixType = Eigen::Matrix<double, -1, -1>; int Size = -1; bool IsComplex = false; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:434:55:   required from ‘void Eigen::internal::tridiagonalization_inplace(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with MatrixType = Eigen::Matrix<double, -1, -1>; DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:458:39:   required from ‘Eigen::SelfAdjointEigenSolver<MatrixType>& Eigen::SelfAdjointEigenSolver<_MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:181:14:   required from ‘Eigen::SelfAdjointEigenSolver<_MatrixType>::SelfAdjointEigenSolver(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/optimization/newton.hpp:19:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>; SrcXprType = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false>; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>; SrcXprType = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false>; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>; Src = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false>; Func = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:858:27:   required from ‘void Eigen::internal::call_assignment(Dst&, const Src&, const Func&, typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>; Src = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false>; Func = sub_assign_op<double, double>; typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type = void*; typename evaluator_traits<SrcXprType>::Shape = Eigen::DenseShape]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:164:18:   required from ‘Derived& Eigen::MatrixBase<Derived>::operator-=(const Eigen::MatrixBase<OtherDerived>&) [with OtherDerived = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false>; Derived = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixMatrix.h:457:31:   [ skipping 19 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:238:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>& Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::operator=(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::HouseholderSequence<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, 1>, 1>; _Scalar = double; int _Rows = -1; int _Cols = -1; int _Options = 0; int _MaxRows = -1; int _MaxCols = -1]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:453:11:   required from ‘static void Eigen::internal::tridiagonalization_inplace_selector<MatrixType, Size, IsComplex>::run(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; MatrixType = Eigen::Matrix<double, -1, -1>; int Size = -1; bool IsComplex = false; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:434:55:   required from ‘void Eigen::internal::tridiagonalization_inplace(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with MatrixType = Eigen::Matrix<double, -1, -1>; DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:458:39:   required from ‘Eigen::SelfAdjointEigenSolver<MatrixType>& Eigen::SelfAdjointEigenSolver<_MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:181:14:   required from ‘Eigen::SelfAdjointEigenSolver<_MatrixType>::SelfAdjointEigenSolver(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/optimization/newton.hpp:19:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   required from ‘struct Eigen::internal::evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   [ skipping 22 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:238:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>& Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::operator=(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::HouseholderSequence<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, 1>, 1>; _Scalar = double; int _Rows = -1; int _Cols = -1; int _Options = 0; int _MaxRows = -1; int _MaxCols = -1]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:453:11:   required from ‘static void Eigen::internal::tridiagonalization_inplace_selector<MatrixType, Size, IsComplex>::run(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; MatrixType = Eigen::Matrix<double, -1, -1>; int Size = -1; bool IsComplex = false; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:434:55:   required from ‘void Eigen::internal::tridiagonalization_inplace(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with MatrixType = Eigen::Matrix<double, -1, -1>; DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:458:39:   required from ‘Eigen::SelfAdjointEigenSolver<MatrixType>& Eigen::SelfAdjointEigenSolver<_MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:181:14:   required from ‘Eigen::SelfAdjointEigenSolver<_MatrixType>::SelfAdjointEigenSolver(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/optimization/newton.hpp:19:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, 1, -1, false> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, 1, -1, false> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, 1, -1, false> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, 1, -1, false> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, 1, -1, false> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:606:52:   required from ‘const Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, 1>, ProductTag, Eigen::DenseShape, Eigen::DenseShape>::CoeffReturnType Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, 1>, ProductTag, Eigen::DenseShape, Eigen::DenseShape>::coeff(Eigen::Index, Eigen::Index) const [with Lhs = Eigen::Matrix<double, -1, -1>; Rhs = Eigen::Matrix<double, -1, -1>; int ProductTag = 8; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, 1>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, 1>::Lhs = Eigen::Matrix<double, -1, -1>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, 1>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, 1>::Rhs = Eigen::Matrix<double, -1, -1>; CoeffReturnType = double; Eigen::Index = long int]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:654:63:   [ skipping 23 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/optimization/bfgs_update.hpp:40:0:   required from ‘Scalar stan::optimization::BFGSUpdate_HInv<Scalar, DimAtCompile>::update(const VectorT&, const VectorT&, bool) [with Scalar = double; int DimAtCompile = -1; VectorT = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/optimization/bfgs.hpp:246:0:   required from ‘int stan::optimization::BFGSMinimizer<FunctorType, QNUpdateType, Scalar, DimAtCompile>::step() [with FunctorType = stan::optimization::ModelAdaptor<model_survival_param_namespace::model_survival_param, false>; QNUpdateType = stan::optimization::BFGSUpdate_HInv<>; Scalar = double; int DimAtCompile = -1]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/services/optimize/bfgs.hpp:117:0:   required from ‘int stan::services::optimize::bfgs(Model&, const stan::io::var_context&, unsigned int, unsigned int, double, double, double, double, double, double, double, int, bool, int, stan::callbacks::interrupt&, stan::callbacks::logger&, stan::callbacks::writer&, stan::callbacks::writer&) [with Model = model_survival_param_namespace::model_survival_param; bool jacobian = false]’
/usr/local/lib/R/site-library/rstan/include/rstan/stan_fit.hpp:517:0:   required from ‘int rstan::{anonymous}::command(rstan::stan_args&, Model&, Rcpp::List&, const std::vector<long unsigned int>&, const std::vector<std::__cxx11::basic_string<char> >&, RNG_t&) [with Model = model_survival_param_namespace::model_survival_param; RNG_t = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; Rcpp::List = Rcpp::Vector<19>]’
/usr/local/lib/R/site-library/rstan/include/rstan/stan_fit.hpp:1215:0:   required from ‘SEXPREC* rstan::stan_fit<Model, RNG_t>::call_sampler(SEXP) [with Model = model_survival_param_namespace::model_survival_param; RNG_t = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; SEXP = SEXPREC*]’
stanExports_survival_param.cc:15:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false> >, const Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false> >, const Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false> >, const Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false> >, const Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false> >, const Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:50:56:   required from ‘static Eigen::internal::dot_nocheck<T, U, true>::ResScalar Eigen::internal::dot_nocheck<T, U, true>::run(const Eigen::MatrixBase<Derived>&, const Eigen::MatrixBase<U>&) [with T = Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false>; U = Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true>; ResScalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:84:58:   [ skipping 23 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/access_helpers.hpp:92:0:   required from ‘void stan::model::internal::assign_impl(T1&&, T2&&, const char*) [with T1 = Eigen::Matrix<double, -1, -1>&; T2 = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_all_eigen_t<T_desired, T_actual>* <anonymous> = 0]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/assign.hpp:60:0:   required from ‘void stan::model::assign(T&&, U&&, const char*) [with T = Eigen::Matrix<double, -1, -1>&; U = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_t<std::is_assignable<typename std::decay<_Tp>::type&, typename std::decay<_Tp2>::type> >* <anonymous> = 0; stan::require_all_not_t<internal::is_tuple<Tuple1>, internal::is_tuple<Tuple2> >* <anonymous> = 0]’
stanExports_survival_param.h:8119:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array_impl(RNG&, VecR&, VecI&, VecVar&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; VecR = std::vector<double>; VecI = std::vector<int>; VecVar = std::vector<double>; stan::require_vector_like_vt<std::is_floating_point, VecR>* <anonymous> = 0; stan::require_vector_like_vt<std::is_integral, VecI>* <anonymous> = 0; stan::require_vector_vt<std::is_floating_point, VecVar>* <anonymous> = 0; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:9724:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array(RNG&, std::vector<double>&, std::vector<int>&, std::vector<double>&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/rstan/include/rstan/stan_fit.hpp:1105:0:   required from ‘SEXPREC* rstan::stan_fit<Model, RNG_t>::constrain_pars(SEXP) [with Model = model_survival_param_namespace::model_survival_param; RNG_t = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; SEXP = SEXPREC*]’
stanExports_survival_param.cc:26:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false>, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false>, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false>, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false>, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false>, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:50:56:   required from ‘static Eigen::internal::dot_nocheck<T, U, true>::ResScalar Eigen::internal::dot_nocheck<T, U, true>::run(const Eigen::MatrixBase<Derived>&, const Eigen::MatrixBase<U>&) [with T = Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false>, 1, -1, true>; U = Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>; ResScalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:84:58:   [ skipping 23 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/access_helpers.hpp:92:0:   required from ‘void stan::model::internal::assign_impl(T1&&, T2&&, const char*) [with T1 = Eigen::Matrix<double, -1, -1>&; T2 = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_all_eigen_t<T_desired, T_actual>* <anonymous> = 0]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/assign.hpp:60:0:   required from ‘void stan::model::assign(T&&, U&&, const char*) [with T = Eigen::Matrix<double, -1, -1>&; U = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_t<std::is_assignable<typename std::decay<_Tp>::type&, typename std::decay<_Tp2>::type> >* <anonymous> = 0; stan::require_all_not_t<internal::is_tuple<Tuple1>, internal::is_tuple<Tuple2> >* <anonymous> = 0]’
stanExports_survival_param.h:8119:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array_impl(RNG&, VecR&, VecI&, VecVar&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; VecR = std::vector<double>; VecI = std::vector<int>; VecVar = std::vector<double>; stan::require_vector_like_vt<std::is_floating_point, VecR>* <anonymous> = 0; stan::require_vector_like_vt<std::is_integral, VecI>* <anonymous> = 0; stan::require_vector_vt<std::is_floating_point, VecVar>* <anonymous> = 0; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:9724:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array(RNG&, std::vector<double>&, std::vector<int>&, std::vector<double>&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/rstan/include/rstan/stan_fit.hpp:1105:0:   required from ‘SEXPREC* rstan::stan_fit<Model, RNG_t>::constrain_pars(SEXP) [with Model = model_survival_param_namespace::model_survival_param; RNG_t = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; SEXP = SEXPREC*]’
stanExports_survival_param.cc:26:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false> >, const Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false> >, const Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false> >, const Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false> >, const Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false> >, const Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:50:56:   required from ‘static Eigen::internal::dot_nocheck<T, U, true>::ResScalar Eigen::internal::dot_nocheck<T, U, true>::run(const Eigen::MatrixBase<Derived>&, const Eigen::MatrixBase<U>&) [with T = Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>; U = Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true>; ResScalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:84:58:   [ skipping 23 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/access_helpers.hpp:92:0:   required from ‘void stan::model::internal::assign_impl(T1&&, T2&&, const char*) [with T1 = Eigen::Matrix<double, -1, -1>&; T2 = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_all_eigen_t<T_desired, T_actual>* <anonymous> = 0]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/assign.hpp:60:0:   required from ‘void stan::model::assign(T&&, U&&, const char*) [with T = Eigen::Matrix<double, -1, -1>&; U = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_t<std::is_assignable<typename std::decay<_Tp>::type&, typename std::decay<_Tp2>::type> >* <anonymous> = 0; stan::require_all_not_t<internal::is_tuple<Tuple1>, internal::is_tuple<Tuple2> >* <anonymous> = 0]’
stanExports_survival_param.h:8342:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array_impl(RNG&, VecR&, VecI&, VecVar&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; VecR = std::vector<double>; VecI = std::vector<int>; VecVar = std::vector<double>; stan::require_vector_like_vt<std::is_floating_point, VecR>* <anonymous> = 0; stan::require_vector_like_vt<std::is_integral, VecI>* <anonymous> = 0; stan::require_vector_vt<std::is_floating_point, VecVar>* <anonymous> = 0; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:9724:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array(RNG&, std::vector<double>&, std::vector<int>&, std::vector<double>&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/rstan/include/rstan/stan_fit.hpp:1105:0:   required from ‘SEXPREC* rstan::stan_fit<Model, RNG_t>::constrain_pars(SEXP) [with Model = model_survival_param_namespace::model_survival_param; RNG_t = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; SEXP = SEXPREC*]’
stanExports_survival_param.cc:26:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:118:37:   required from ‘class Eigen::TransposeImpl<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:50:23:   [ skipping 24 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/access_helpers.hpp:92:0:   required from ‘void stan::model::internal::assign_impl(T1&&, T2&&, const char*) [with T1 = Eigen::Matrix<double, -1, -1>&; T2 = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_all_eigen_t<T_desired, T_actual>* <anonymous> = 0]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/assign.hpp:60:0:   required from ‘void stan::model::assign(T&&, U&&, const char*) [with T = Eigen::Matrix<double, -1, -1>&; U = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_t<std::is_assignable<typename std::decay<_Tp>::type&, typename std::decay<_Tp2>::type> >* <anonymous> = 0; stan::require_all_not_t<internal::is_tuple<Tuple1>, internal::is_tuple<Tuple2> >* <anonymous> = 0]’
stanExports_survival_param.h:8342:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array_impl(RNG&, VecR&, VecI&, VecVar&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; VecR = std::vector<double>; VecI = std::vector<int>; VecVar = std::vector<double>; stan::require_vector_like_vt<std::is_floating_point, VecR>* <anonymous> = 0; stan::require_vector_like_vt<std::is_integral, VecI>* <anonymous> = 0; stan::require_vector_vt<std::is_floating_point, VecVar>* <anonymous> = 0; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:9724:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array(RNG&, std::vector<double>&, std::vector<int>&, std::vector<double>&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/rstan/include/rstan/stan_fit.hpp:1105:0:   required from ‘SEXPREC* rstan::stan_fit<Model, RNG_t>::constrain_pars(SEXP) [with Model = model_survival_param_namespace::model_survival_param; RNG_t = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; SEXP = SEXPREC*]’
stanExports_survival_param.cc:26:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:50:56:   required from ‘static Eigen::internal::dot_nocheck<T, U, true>::ResScalar Eigen::internal::dot_nocheck<T, U, true>::run(const Eigen::MatrixBase<Derived>&, const Eigen::MatrixBase<U>&) [with T = Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true>; U = Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>; ResScalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:84:58:   [ skipping 23 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/access_helpers.hpp:92:0:   required from ‘void stan::model::internal::assign_impl(T1&&, T2&&, const char*) [with T1 = Eigen::Matrix<double, -1, -1>&; T2 = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_all_eigen_t<T_desired, T_actual>* <anonymous> = 0]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/assign.hpp:60:0:   required from ‘void stan::model::assign(T&&, U&&, const char*) [with T = Eigen::Matrix<double, -1, -1>&; U = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_t<std::is_assignable<typename std::decay<_Tp>::type&, typename std::decay<_Tp2>::type> >* <anonymous> = 0; stan::require_all_not_t<internal::is_tuple<Tuple1>, internal::is_tuple<Tuple2> >* <anonymous> = 0]’
stanExports_survival_param.h:8342:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array_impl(RNG&, VecR&, VecI&, VecVar&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; VecR = std::vector<double>; VecI = std::vector<int>; VecVar = std::vector<double>; stan::require_vector_like_vt<std::is_floating_point, VecR>* <anonymous> = 0; stan::require_vector_like_vt<std::is_integral, VecI>* <anonymous> = 0; stan::require_vector_vt<std::is_floating_point, VecVar>* <anonymous> = 0; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:9724:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array(RNG&, std::vector<double>&, std::vector<int>&, std::vector<double>&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/rstan/include/rstan/stan_fit.hpp:1105:0:   required from ‘SEXPREC* rstan::stan_fit<Model, RNG_t>::constrain_pars(SEXP) [with Model = model_survival_param_namespace::model_survival_param; RNG_t = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; SEXP = SEXPREC*]’
stanExports_survival_param.cc:26:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:311:41:   required from ‘struct Eigen::internal::unary_evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >, Eigen::internal::IndexBased, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:90:8:   required from ‘struct Eigen::internal::evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:41:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   [ skipping 28 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/access_helpers.hpp:92:0:   required from ‘void stan::model::internal::assign_impl(T1&&, T2&&, const char*) [with T1 = Eigen::Matrix<double, -1, -1>&; T2 = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_all_eigen_t<T_desired, T_actual>* <anonymous> = 0]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/assign.hpp:60:0:   required from ‘void stan::model::assign(T&&, U&&, const char*) [with T = Eigen::Matrix<double, -1, -1>&; U = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_t<std::is_assignable<typename std::decay<_Tp>::type&, typename std::decay<_Tp2>::type> >* <anonymous> = 0; stan::require_all_not_t<internal::is_tuple<Tuple1>, internal::is_tuple<Tuple2> >* <anonymous> = 0]’
stanExports_survival_param.h:8342:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array_impl(RNG&, VecR&, VecI&, VecVar&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; VecR = std::vector<double>; VecI = std::vector<int>; VecVar = std::vector<double>; stan::require_vector_like_vt<std::is_floating_point, VecR>* <anonymous> = 0; stan::require_vector_like_vt<std::is_integral, VecI>* <anonymous> = 0; stan::require_vector_vt<std::is_floating_point, VecVar>* <anonymous> = 0; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:9724:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array(RNG&, std::vector<double>&, std::vector<int>&, std::vector<double>&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/rstan/include/rstan/stan_fit.hpp:1105:0:   required from ‘SEXPREC* rstan::stan_fit<Model, RNG_t>::constrain_pars(SEXP) [with Model = model_survival_param_namespace::model_survival_param; RNG_t = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; SEXP = SEXPREC*]’
stanExports_survival_param.cc:26:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
 1071 |     PacketAlignment = unpacket_traits<PacketScalar>::alignment,
      |                                                      ^~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:606:52:   required from ‘const Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, 1>, ProductTag, Eigen::DenseShape, Eigen::DenseShape>::CoeffReturnType Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, 1>, ProductTag, Eigen::DenseShape, Eigen::DenseShape>::coeff(Eigen::Index, Eigen::Index) const [with Lhs = Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>; Rhs = Eigen::Matrix<double, -1, -1>; int ProductTag = 8; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, 1>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, 1>::Lhs = Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, 1>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, 1>::Rhs = Eigen::Matrix<double, -1, -1>; CoeffReturnType = double; Eigen::Index = long int]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:654:63:   [ skipping 26 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/access_helpers.hpp:92:0:   required from ‘void stan::model::internal::assign_impl(T1&&, T2&&, const char*) [with T1 = Eigen::Matrix<double, -1, -1>&; T2 = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_all_eigen_t<T_desired, T_actual>* <anonymous> = 0]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/assign.hpp:60:0:   required from ‘void stan::model::assign(T&&, U&&, const char*) [with T = Eigen::Matrix<double, -1, -1>&; U = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_t<std::is_assignable<typename std::decay<_Tp>::type&, typename std::decay<_Tp2>::type> >* <anonymous> = 0; stan::require_all_not_t<internal::is_tuple<Tuple1>, internal::is_tuple<Tuple2> >* <anonymous> = 0]’
stanExports_survival_param.h:8342:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array_impl(RNG&, VecR&, VecI&, VecVar&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; VecR = std::vector<double>; VecI = std::vector<int>; VecVar = std::vector<double>; stan::require_vector_like_vt<std::is_floating_point, VecR>* <anonymous> = 0; stan::require_vector_like_vt<std::is_integral, VecI>* <anonymous> = 0; stan::require_vector_vt<std::is_floating_point, VecVar>* <anonymous> = 0; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:9724:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array(RNG&, std::vector<double>&, std::vector<int>&, std::vector<double>&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/rstan/include/rstan/stan_fit.hpp:1105:0:   required from ‘SEXPREC* rstan::stan_fit<Model, RNG_t>::constrain_pars(SEXP) [with Model = model_survival_param_namespace::model_survival_param; RNG_t = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; SEXP = SEXPREC*]’
stanExports_survival_param.cc:26:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   required from ‘struct Eigen::internal::evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   [ skipping 26 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:238:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>& Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::operator=(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::HouseholderSequence<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, 1>, 1>; _Scalar = double; int _Rows = -1; int _Cols = -1; int _Options = 0; int _MaxRows = -1; int _MaxCols = -1]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:453:11:   required from ‘static void Eigen::internal::tridiagonalization_inplace_selector<MatrixType, Size, IsComplex>::run(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; MatrixType = Eigen::Matrix<double, -1, -1>; int Size = -1; bool IsComplex = false; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:434:55:   required from ‘void Eigen::internal::tridiagonalization_inplace(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with MatrixType = Eigen::Matrix<double, -1, -1>; DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:458:39:   required from ‘Eigen::SelfAdjointEigenSolver<MatrixType>& Eigen::SelfAdjointEigenSolver<_MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:181:14:   required from ‘Eigen::SelfAdjointEigenSolver<_MatrixType>::SelfAdjointEigenSolver(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/optimization/newton.hpp:19:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
 1071 |     PacketAlignment = unpacket_traits<PacketScalar>::alignment,
      |                                                      ^~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   required from ‘struct Eigen::internal::evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   [ skipping 26 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:238:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>& Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::operator=(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::HouseholderSequence<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, 1>, 1>; _Scalar = double; int _Rows = -1; int _Cols = -1; int _Options = 0; int _MaxRows = -1; int _MaxCols = -1]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:453:11:   required from ‘static void Eigen::internal::tridiagonalization_inplace_selector<MatrixType, Size, IsComplex>::run(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; MatrixType = Eigen::Matrix<double, -1, -1>; int Size = -1; bool IsComplex = false; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:434:55:   required from ‘void Eigen::internal::tridiagonalization_inplace(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with MatrixType = Eigen::Matrix<double, -1, -1>; DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:458:39:   required from ‘Eigen::SelfAdjointEigenSolver<MatrixType>& Eigen::SelfAdjointEigenSolver<_MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:181:14:   required from ‘Eigen::SelfAdjointEigenSolver<_MatrixType>::SelfAdjointEigenSolver(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/optimization/newton.hpp:19:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Product<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Product<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Product<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:120:7:   required from ‘class Eigen::internal::dense_product_base<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0, 5>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:152:7:   required from ‘class Eigen::ProductImpl<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:71:7:   required from ‘class Eigen::Product<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:40:30:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain_internal(Result&&, WMat&&, B&&) [with Result = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B = stan::math::arena_matrix<Eigen::Matrix<double, -1, 1> >&; stan::require_rev_matrix_t<WMat>* <anonymous> = 0; stan::require_not_rev_matrix_t<B>* <anonymous> = 0; Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<double, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:32:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain() [with Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<double, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:8:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h: In instantiation of ‘class Eigen::SparseMatrixBase<Eigen::Transpose<Eigen::Map<const Eigen::SparseMatrix<double, 1> > > >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseCompressedBase.h:36:7:   required from ‘class Eigen::SparseCompressedBase<Eigen::Transpose<Eigen::Map<const Eigen::SparseMatrix<double, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseTranspose.h:22:9:   required from ‘class Eigen::internal::SparseTransposeImpl<Eigen::Map<const Eigen::SparseMatrix<double, 1> >, 1024>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseTranspose.h:45:37:   required from ‘class Eigen::TransposeImpl<Eigen::Map<const Eigen::SparseMatrix<double, 1> >, Eigen::Sparse>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<Eigen::Map<const Eigen::SparseMatrix<double, 1> > >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:47:31:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain_internal(Result&&, WMat&&, B&&) [with Result = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat = Eigen::Map<const Eigen::SparseMatrix<double, 1> >&; B = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; stan::require_not_rev_matrix_t<WMat>* <anonymous> = 0; stan::require_rev_matrix_t<B>* <anonymous> = 0; Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = Eigen::Map<const Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:32:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain() [with Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = Eigen::Map<const Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:8:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h:47:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   47 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Product<Eigen::Transpose<Eigen::Map<const Eigen::SparseMatrix<double, 1> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Product<Eigen::Transpose<Eigen::Map<const Eigen::SparseMatrix<double, 1> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Product<Eigen::Transpose<Eigen::Map<const Eigen::SparseMatrix<double, 1> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:120:7:   required from ‘class Eigen::internal::dense_product_base<Eigen::Transpose<Eigen::Map<const Eigen::SparseMatrix<double, 1> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0, 7>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:152:7:   required from ‘class Eigen::ProductImpl<Eigen::Transpose<Eigen::Map<const Eigen::SparseMatrix<double, 1> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:71:7:   required from ‘class Eigen::Product<Eigen::Transpose<Eigen::Map<const Eigen::SparseMatrix<double, 1> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:47:34:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain_internal(Result&&, WMat&&, B&&) [with Result = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat = Eigen::Map<const Eigen::SparseMatrix<double, 1> >&; B = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; stan::require_not_rev_matrix_t<WMat>* <anonymous> = 0; stan::require_rev_matrix_t<B>* <anonymous> = 0; Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = Eigen::Map<const Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:32:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain() [with Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = Eigen::Map<const Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:8:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > >, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > >, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:118:37:   required from ‘class Eigen::TransposeImpl<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:32:49:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain_internal(Result&&, WMat&&, B&&) [with Result = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; stan::require_rev_matrix_t<WMat>* <anonymous> = 0; stan::require_rev_matrix_t<B>* <anonymous> = 0; Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:32:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain() [with Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:8:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Product<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > >, 0>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Product<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > >, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Product<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > >, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:120:7:   required from ‘class Eigen::internal::dense_product_base<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > >, 0, 5>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:152:7:   required from ‘class Eigen::ProductImpl<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > >, 0, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:71:7:   required from ‘class Eigen::Product<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > >, 0>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:32:30:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain_internal(Result&&, WMat&&, B&&) [with Result = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; stan::require_rev_matrix_t<WMat>* <anonymous> = 0; stan::require_rev_matrix_t<B>* <anonymous> = 0; Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:32:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain() [with Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:8:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h: In instantiation of ‘class Eigen::SparseMatrixBase<Eigen::Transpose<const Eigen::Map<Eigen::SparseMatrix<double, 1>, 0, Eigen::Stride<0, 0> > > >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseCompressedBase.h:36:7:   required from ‘class Eigen::SparseCompressedBase<Eigen::Transpose<const Eigen::Map<Eigen::SparseMatrix<double, 1>, 0, Eigen::Stride<0, 0> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseTranspose.h:22:9:   required from ‘class Eigen::internal::SparseTransposeImpl<const Eigen::Map<Eigen::SparseMatrix<double, 1>, 0, Eigen::Stride<0, 0> >, 1024>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseTranspose.h:45:37:   required from ‘class Eigen::TransposeImpl<const Eigen::Map<Eigen::SparseMatrix<double, 1>, 0, Eigen::Stride<0, 0> >, Eigen::Sparse>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<const Eigen::Map<Eigen::SparseMatrix<double, 1>, 0, Eigen::Stride<0, 0> > >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:33:37:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain_internal(Result&&, WMat&&, B&&) [with Result = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; stan::require_rev_matrix_t<WMat>* <anonymous> = 0; stan::require_rev_matrix_t<B>* <anonymous> = 0; Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:32:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain() [with Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:8:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h:47:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   47 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Product<Eigen::Transpose<const Eigen::Map<Eigen::SparseMatrix<double, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Product<Eigen::Transpose<const Eigen::Map<Eigen::SparseMatrix<double, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Product<Eigen::Transpose<const Eigen::Map<Eigen::SparseMatrix<double, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:120:7:   required from ‘class Eigen::internal::dense_product_base<Eigen::Transpose<const Eigen::Map<Eigen::SparseMatrix<double, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0, 7>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:152:7:   required from ‘class Eigen::ProductImpl<Eigen::Transpose<const Eigen::Map<Eigen::SparseMatrix<double, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:71:7:   required from ‘class Eigen::Product<Eigen::Transpose<const Eigen::Map<Eigen::SparseMatrix<double, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:33:40:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain_internal(Result&&, WMat&&, B&&) [with Result = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; stan::require_rev_matrix_t<WMat>* <anonymous> = 0; stan::require_rev_matrix_t<B>* <anonymous> = 0; Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:32:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain() [with Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:8:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:37:44:   required from ‘static Eigen::internal::dot_nocheck<T, U, NeedToTranspose>::ResScalar Eigen::internal::dot_nocheck<T, U, NeedToTranspose>::run(const Eigen::MatrixBase<Derived>&, const Eigen::MatrixBase<U>&) [with T = Eigen::Matrix<double, -1, 1>; U = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> >; bool NeedToTranspose = false; ResScalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:84:58:   required from ‘typename Eigen::ScalarBinaryOpTraits<typename Eigen::internal::traits<T>::Scalar, typename Eigen::internal::traits<OtherDerived>::Scalar>::ReturnType Eigen::MatrixBase<Derived>::dot(const Eigen::MatrixBase<OtherDerived>&) const [with OtherDerived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>; typename Eigen::ScalarBinaryOpTraits<typename Eigen::internal::traits<T>::Scalar, typename Eigen::internal::traits<OtherDerived>::Scalar>::ReturnType = double; typename Eigen::internal::traits<T>::Scalar = double; typename Eigen::internal::traits<OtherDerived>::Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/diag_e_metric.hpp:21:0:   required from ‘double stan::mcmc::diag_e_metric<Model, BaseRNG>::T(stan::mcmc::diag_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/diag_e_metric.hpp:20:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:118:37:   required from ‘class Eigen::TransposeImpl<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:251:39:   required from ‘static void Eigen::internal::generic_product_impl<Lhs, Rhs, Eigen::DenseShape, Eigen::DenseShape, 6>::evalTo(Dst&, const Lhs&, const Rhs&) [with Dst = Eigen::Matrix<double, 1, 1, 0, 1, 1>; Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:124:75:   required from ‘Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::product_evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; int ProductTag = 6; LhsShape = Eigen::DenseShape; RhsShape = Eigen::DenseShape; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Rhs = Eigen::Matrix<double, -1, 1>; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:137:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::Matrix<double, -1, 1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::Matrix<double, -1, 1>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:251:54:   required from ‘static void Eigen::internal::generic_product_impl<Lhs, Rhs, Eigen::DenseShape, Eigen::DenseShape, 6>::evalTo(Dst&, const Lhs&, const Rhs&) [with Dst = Eigen::Matrix<double, 1, 1, 0, 1, 1>; Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:124:75:   required from ‘Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::product_evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; int ProductTag = 6; LhsShape = Eigen::DenseShape; RhsShape = Eigen::DenseShape; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Rhs = Eigen::Matrix<double, -1, 1>; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:137:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/prob/lognormal_lpdf.hpp:70:40:   required from ‘stan::return_type_t<T, L, U> stan::math::lognormal_lpdf(const T_y&, const T_loc&, const T_scale&) [with bool propto = true; T_y = Eigen::Matrix<double, -1, 1>; T_loc = double; T_scale = double; stan::require_all_not_nonscalar_prim_or_rev_kernel_expression_t<T_y, T_scale_succ, T_scale_fail>* <anonymous> = 0; stan::return_type_t<T, L, U> = double]’
stanExports_survival_param.h:1551:0:   required from ‘void model_survival_param_namespace::prior_select_lp(const T0__&, const int&, const T2__&, const T3__&, const T4__&, T_lp__&, T_lp_accum__&, std::ostream*) [with bool propto__ = true; T0__ = Eigen::Matrix<double, -1, 1>; T2__ = double; T3__ = double; T4__ = double; T_lp__ = double; T_lp_accum__ = stan::math::accumulator<double>; stan::require_all_t<stan::is_col_vector<Col>, stan::is_vt_not_complex<T0__>, stan::is_stan_scalar<T2__>, stan::is_stan_scalar<T3__>, stan::is_stan_scalar<T4__> >* <anonymous> = 0; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:7364:0:   required from ‘stan::scalar_type_t<T2> model_survival_param_namespace::model_survival_param::log_prob_impl(VecR&, VecI&, std::ostream*) const [with bool propto__ = true; bool jacobian__ = false; VecR = Eigen::Matrix<double, -1, 1>; VecI = Eigen::Matrix<int, -1, 1>; stan::require_vector_like_t<VecR>* <anonymous> = 0; stan::require_vector_like_vt<std::is_integral, VecI>* <anonymous> = 0; stan::scalar_type_t<T2> = double; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:9730:0:   required from ‘T_ model_survival_param_namespace::model_survival_param::log_prob(Eigen::Matrix<T_job_param, -1, 1>&, std::ostream*) const [with bool propto__ = true; bool jacobian__ = false; T_ = double; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/model_base_crtp.hpp:115:0:   required from ‘double stan::model::model_base_crtp<M>::log_prob_propto(Eigen::VectorXd&, std::ostream*) const [with M = model_survival_param_namespace::model_survival_param; Eigen::VectorXd = Eigen::Matrix<double, -1, 1>; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/model_base_crtp.hpp:113:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/prob/lognormal_lpdf.hpp:70:40:   required from ‘stan::return_type_t<T, L, U> stan::math::lognormal_lpdf(const T_y&, const T_loc&, const T_scale&) [with bool propto = true; T_y = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>; T_loc = double; T_scale = double; stan::require_all_not_nonscalar_prim_or_rev_kernel_expression_t<T_y, T_scale_succ, T_scale_fail>* <anonymous> = 0; stan::return_type_t<T, L, U> = double]’
stanExports_survival_param.h:1551:0:   required from ‘void model_survival_param_namespace::prior_select_lp(const T0__&, const int&, const T2__&, const T3__&, const T4__&, T_lp__&, T_lp_accum__&, std::ostream*) [with bool propto__ = true; T0__ = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>; T2__ = double; T3__ = double; T4__ = double; T_lp__ = double; T_lp_accum__ = stan::math::accumulator<double>; stan::require_all_t<stan::is_col_vector<Col>, stan::is_vt_not_complex<T0__>, stan::is_stan_scalar<T2__>, stan::is_stan_scalar<T3__>, stan::is_stan_scalar<T4__> >* <anonymous> = 0; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:7480:0:   required from ‘stan::scalar_type_t<T2> model_survival_param_namespace::model_survival_param::log_prob_impl(VecR&, VecI&, std::ostream*) const [with bool propto__ = true; bool jacobian__ = false; VecR = Eigen::Matrix<double, -1, 1>; VecI = Eigen::Matrix<int, -1, 1>; stan::require_vector_like_t<VecR>* <anonymous> = 0; stan::require_vector_like_vt<std::is_integral, VecI>* <anonymous> = 0; stan::scalar_type_t<T2> = double; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:9730:0:   required from ‘T_ model_survival_param_namespace::model_survival_param::log_prob(Eigen::Matrix<T_job_param, -1, 1>&, std::ostream*) const [with bool propto__ = true; bool jacobian__ = false; T_ = double; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/model_base_crtp.hpp:115:0:   required from ‘double stan::model::model_base_crtp<M>::log_prob_propto(Eigen::VectorXd&, std::ostream*) const [with M = model_survival_param_namespace::model_survival_param; Eigen::VectorXd = Eigen::Matrix<double, -1, 1>; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/model_base_crtp.hpp:113:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘Eigen::Index Eigen::internal::first_default_aligned(const Eigen::DenseBase<Derived>&) [with Derived = Eigen::CwiseBinaryOp<scalar_conj_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> > >; Eigen::Index = long int]’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:243:63:   required from ‘static Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::Scalar Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::run(const Evaluator&, const Func&, const XprType&) [with XprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> > >; Func = Eigen::internal::scalar_sum_op<double, double>; Evaluator = Eigen::internal::redux_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> > > >; Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:418:56:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::redux(const Func&) const [with BinaryOp = Eigen::internal::scalar_sum_op<double, double>; Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> > >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:463:25:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::sum() const [with Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> > >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:37:51:   required from ‘static Eigen::internal::dot_nocheck<T, U, NeedToTranspose>::ResScalar Eigen::internal::dot_nocheck<T, U, NeedToTranspose>::run(const Eigen::MatrixBase<Derived>&, const Eigen::MatrixBase<U>&) [with T = Eigen::Matrix<double, -1, 1>; U = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> >; bool NeedToTranspose = false; ResScalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:84:58:   required from ‘typename Eigen::ScalarBinaryOpTraits<typename Eigen::internal::traits<T>::Scalar, typename Eigen::internal::traits<OtherDerived>::Scalar>::ReturnType Eigen::MatrixBase<Derived>::dot(const Eigen::MatrixBase<OtherDerived>&) const [with OtherDerived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>; typename Eigen::ScalarBinaryOpTraits<typename Eigen::internal::traits<T>::Scalar, typename Eigen::internal::traits<OtherDerived>::Scalar>::ReturnType = double; typename Eigen::internal::traits<T>::Scalar = double; typename Eigen::internal::traits<OtherDerived>::Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/diag_e_metric.hpp:21:0:   required from ‘double stan::mcmc::diag_e_metric<Model, BaseRNG>::T(stan::mcmc::diag_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/diag_e_metric.hpp:20:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:654:74: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  654 |   return internal::first_aligned<int(unpacket_traits<DefaultPacketType>::alignment),Derived>(m);
      |                                                                          ^~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘Eigen::Index Eigen::internal::first_default_aligned(const Eigen::DenseBase<Derived>&) [with Derived = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::Matrix<double, -1, 1> >; Eigen::Index = long int]’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:243:63:   required from ‘static Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::Scalar Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::run(const Evaluator&, const Func&, const XprType&) [with XprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::Matrix<double, -1, 1> >; Func = Eigen::internal::scalar_sum_op<double, double>; Evaluator = Eigen::internal::redux_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::Matrix<double, -1, 1> > >; Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:418:56:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::redux(const Func&) const [with BinaryOp = Eigen::internal::scalar_sum_op<double, double>; Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::Matrix<double, -1, 1> >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:463:25:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::sum() const [with Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::Matrix<double, -1, 1> >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:251:64:   required from ‘static void Eigen::internal::generic_product_impl<Lhs, Rhs, Eigen::DenseShape, Eigen::DenseShape, 6>::evalTo(Dst&, const Lhs&, const Rhs&) [with Dst = Eigen::Matrix<double, 1, 1, 0, 1, 1>; Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:124:75:   required from ‘Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::product_evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; int ProductTag = 6; LhsShape = Eigen::DenseShape; RhsShape = Eigen::DenseShape; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Rhs = Eigen::Matrix<double, -1, 1>; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:137:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:654:74: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘Eigen::Index Eigen::internal::first_default_aligned(const Eigen::DenseBase<Derived>&) [with Derived = Eigen::CwiseUnaryOp<scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >; Eigen::Index = long int]’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:243:63:   required from ‘static Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::Scalar Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::run(const Evaluator&, const Func&, const XprType&) [with XprType = Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >; Func = Eigen::internal::scalar_sum_op<double, double>; Evaluator = Eigen::internal::redux_evaluator<Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > > >; Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:418:56:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::redux(const Func&) const [with BinaryOp = Eigen::internal::scalar_sum_op<double, double>; Derived = Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:463:25:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::sum() const [with Derived = Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/sum.hpp:47:15:   required from ‘stan::value_type_t<T> stan::math::sum(const T&) [with T = Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >; stan::require_eigen_vt<std::is_arithmetic, T>* <anonymous> = 0; stan::value_type_t<T> = double]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/prob/lognormal_lpdf.hpp:79:16:   required from ‘stan::return_type_t<T, L, U> stan::math::lognormal_lpdf(const T_y&, const T_loc&, const T_scale&) [with bool propto = true; T_y = Eigen::Matrix<double, -1, 1>; T_loc = double; T_scale = double; stan::require_all_not_nonscalar_prim_or_rev_kernel_expression_t<T_y, T_scale_succ, T_scale_fail>* <anonymous> = 0; stan::return_type_t<T, L, U> = double]’
stanExports_survival_param.h:1551:0:   required from ‘void model_survival_param_namespace::prior_select_lp(const T0__&, const int&, const T2__&, const T3__&, const T4__&, T_lp__&, T_lp_accum__&, std::ostream*) [with bool propto__ = true; T0__ = Eigen::Matrix<double, -1, 1>; T2__ = double; T3__ = double; T4__ = double; T_lp__ = double; T_lp_accum__ = stan::math::accumulator<double>; stan::require_all_t<stan::is_col_vector<Col>, stan::is_vt_not_complex<T0__>, stan::is_stan_scalar<T2__>, stan::is_stan_scalar<T3__>, stan::is_stan_scalar<T4__> >* <anonymous> = 0; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:7364:0:   required from ‘stan::scalar_type_t<T2> model_survival_param_namespace::model_survival_param::log_prob_impl(VecR&, VecI&, std::ostream*) const [with bool propto__ = true; bool jacobian__ = false; VecR = Eigen::Matrix<double, -1, 1>; VecI = Eigen::Matrix<int, -1, 1>; stan::require_vector_like_t<VecR>* <anonymous> = 0; stan::require_vector_like_vt<std::is_integral, VecI>* <anonymous> = 0; stan::scalar_type_t<T2> = double; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:9730:0:   required from ‘T_ model_survival_param_namespace::model_survival_param::log_prob(Eigen::Matrix<T_job_param, -1, 1>&, std::ostream*) const [with bool propto__ = true; bool jacobian__ = false; T_ = double; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/model_base_crtp.hpp:115:0:   required from ‘double stan::model::model_base_crtp<M>::log_prob_propto(Eigen::VectorXd&, std::ostream*) const [with M = model_survival_param_namespace::model_survival_param; Eigen::VectorXd = Eigen::Matrix<double, -1, 1>; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/model_base_crtp.hpp:113:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:654:74: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘Eigen::Index Eigen::internal::first_default_aligned(const Eigen::DenseBase<Derived>&) [with Derived = Eigen::CwiseUnaryOp<scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> > >; Eigen::Index = long int]’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:243:63:   required from ‘static Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::Scalar Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::run(const Evaluator&, const Func&, const XprType&) [with XprType = Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> > >; Func = Eigen::internal::scalar_sum_op<double, double>; Evaluator = Eigen::internal::redux_evaluator<Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> > > >; Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:418:56:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::redux(const Func&) const [with BinaryOp = Eigen::internal::scalar_sum_op<double, double>; Derived = Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> > >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:463:25:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::sum() const [with Derived = Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> > >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/sum.hpp:47:15:   required from ‘stan::value_type_t<T> stan::math::sum(const T&) [with T = Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> > >; stan::require_eigen_vt<std::is_arithmetic, T>* <anonymous> = 0; stan::value_type_t<T> = double]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/prob/lognormal_lpdf.hpp:79:16:   required from ‘stan::return_type_t<T, L, U> stan::math::lognormal_lpdf(const T_y&, const T_loc&, const T_scale&) [with bool propto = true; T_y = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>; T_loc = double; T_scale = double; stan::require_all_not_nonscalar_prim_or_rev_kernel_expression_t<T_y, T_scale_succ, T_scale_fail>* <anonymous> = 0; stan::return_type_t<T, L, U> = double]’
stanExports_survival_param.h:1551:0:   required from ‘void model_survival_param_namespace::prior_select_lp(const T0__&, const int&, const T2__&, const T3__&, const T4__&, T_lp__&, T_lp_accum__&, std::ostream*) [with bool propto__ = true; T0__ = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>; T2__ = double; T3__ = double; T4__ = double; T_lp__ = double; T_lp_accum__ = stan::math::accumulator<double>; stan::require_all_t<stan::is_col_vector<Col>, stan::is_vt_not_complex<T0__>, stan::is_stan_scalar<T2__>, stan::is_stan_scalar<T3__>, stan::is_stan_scalar<T4__> >* <anonymous> = 0; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:7480:0:   required from ‘stan::scalar_type_t<T2> model_survival_param_namespace::model_survival_param::log_prob_impl(VecR&, VecI&, std::ostream*) const [with bool propto__ = true; bool jacobian__ = false; VecR = Eigen::Matrix<double, -1, 1>; VecI = Eigen::Matrix<int, -1, 1>; stan::require_vector_like_t<VecR>* <anonymous> = 0; stan::require_vector_like_vt<std::is_integral, VecI>* <anonymous> = 0; stan::scalar_type_t<T2> = double; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:9730:0:   required from ‘T_ model_survival_param_namespace::model_survival_param::log_prob(Eigen::Matrix<T_job_param, -1, 1>&, std::ostream*) const [with bool propto__ = true; bool jacobian__ = false; T_ = double; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/model_base_crtp.hpp:115:0:   required from ‘double stan::model::model_base_crtp<M>::log_prob_propto(Eigen::VectorXd&, std::ostream*) const [with M = model_survival_param_namespace::model_survival_param; Eigen::VectorXd = Eigen::Matrix<double, -1, 1>; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/model_base_crtp.hpp:113:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:654:74: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:172:103:   required from ‘class Eigen::internal::BlockImpl_dense<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true, false>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:154:7:   required from ‘class Eigen::BlockImpl<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:103:81:   required from ‘class Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:380:43:   [ skipping 15 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:251:64:   required from ‘static void Eigen::internal::generic_product_impl<Lhs, Rhs, Eigen::DenseShape, Eigen::DenseShape, 6>::evalTo(Dst&, const Lhs&, const Rhs&) [with Dst = Eigen::Matrix<double, 1, 1, 0, 1, 1>; Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:124:75:   required from ‘Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::product_evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; int ProductTag = 6; LhsShape = Eigen::DenseShape; RhsShape = Eigen::DenseShape; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Rhs = Eigen::Matrix<double, -1, 1>; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:137:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:118:37:   required from ‘class Eigen::TransposeImpl<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/GeneralProduct.h:207:43:   required from ‘static void Eigen::internal::gemv_dense_selector<1, StorageOrder, BlasCompatible>::run(const Lhs&, const Rhs&, Dest&, const typename Dest::Scalar&) [with Lhs = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >; Rhs = Eigen::Matrix<double, -1, -1>; Dest = Eigen::Matrix<double, 1, -1>; int StorageOrder = 0; bool BlasCompatible = true; typename Dest::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:388:34:   [ skipping 15 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:251:64:   required from ‘static void Eigen::internal::generic_product_impl<Lhs, Rhs, Eigen::DenseShape, Eigen::DenseShape, 6>::evalTo(Dst&, const Lhs&, const Rhs&) [with Dst = Eigen::Matrix<double, 1, 1, 0, 1, 1>; Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:124:75:   required from ‘Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::product_evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; int ProductTag = 6; LhsShape = Eigen::DenseShape; RhsShape = Eigen::DenseShape; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Rhs = Eigen::Matrix<double, -1, 1>; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:137:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:118:37:   required from ‘class Eigen::TransposeImpl<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:50:23:   required from ‘static Eigen::internal::dot_nocheck<T, U, true>::ResScalar Eigen::internal::dot_nocheck<T, U, true>::run(const Eigen::MatrixBase<Derived>&, const Eigen::MatrixBase<U>&) [with T = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true>; U = Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>; ResScalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:84:58:   [ skipping 16 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:251:64:   required from ‘static void Eigen::internal::generic_product_impl<Lhs, Rhs, Eigen::DenseShape, Eigen::DenseShape, 6>::evalTo(Dst&, const Lhs&, const Rhs&) [with Dst = Eigen::Matrix<double, 1, 1, 0, 1, 1>; Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:124:75:   required from ‘Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::product_evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; int ProductTag = 6; LhsShape = Eigen::DenseShape; RhsShape = Eigen::DenseShape; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Rhs = Eigen::Matrix<double, -1, 1>; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:137:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:50:56:   required from ‘static Eigen::internal::dot_nocheck<T, U, true>::ResScalar Eigen::internal::dot_nocheck<T, U, true>::run(const Eigen::MatrixBase<Derived>&, const Eigen::MatrixBase<U>&) [with T = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true>; U = Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>; ResScalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:84:58:   [ skipping 16 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:251:64:   required from ‘static void Eigen::internal::generic_product_impl<Lhs, Rhs, Eigen::DenseShape, Eigen::DenseShape, 6>::evalTo(Dst&, const Lhs&, const Rhs&) [with Dst = Eigen::Matrix<double, 1, 1, 0, 1, 1>; Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:124:75:   required from ‘Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::product_evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; int ProductTag = 6; LhsShape = Eigen::DenseShape; RhsShape = Eigen::DenseShape; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Rhs = Eigen::Matrix<double, -1, 1>; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:137:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<const Eigen::Transpose<const Eigen::Matrix<double, -1, 1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<const Eigen::Transpose<const Eigen::Matrix<double, -1, 1> > >, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Transpose<const Eigen::Transpose<const Eigen::Matrix<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Transpose<const Eigen::Transpose<const Eigen::Matrix<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:118:37:   required from ‘class Eigen::TransposeImpl<const Eigen::Transpose<const Eigen::Matrix<double, -1, 1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<const Eigen::Transpose<const Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/BlasUtil.h:506:13:   [ skipping 18 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:251:64:   required from ‘static void Eigen::internal::generic_product_impl<Lhs, Rhs, Eigen::DenseShape, Eigen::DenseShape, 6>::evalTo(Dst&, const Lhs&, const Rhs&) [with Dst = Eigen::Matrix<double, 1, 1, 0, 1, 1>; Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:124:75:   required from ‘Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::product_evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; int ProductTag = 6; LhsShape = Eigen::DenseShape; RhsShape = Eigen::DenseShape; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Rhs = Eigen::Matrix<double, -1, 1>; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:137:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:311:41:   required from ‘struct Eigen::internal::unary_evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, Eigen::internal::IndexBased, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:90:8:   required from ‘struct Eigen::internal::evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:41:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   [ skipping 21 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:251:64:   required from ‘static void Eigen::internal::generic_product_impl<Lhs, Rhs, Eigen::DenseShape, Eigen::DenseShape, 6>::evalTo(Dst&, const Lhs&, const Rhs&) [with Dst = Eigen::Matrix<double, 1, 1, 0, 1, 1>; Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:124:75:   required from ‘Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::product_evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; int ProductTag = 6; LhsShape = Eigen::DenseShape; RhsShape = Eigen::DenseShape; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Rhs = Eigen::Matrix<double, -1, 1>; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:137:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
 1071 |     PacketAlignment = unpacket_traits<PacketScalar>::alignment,
      |                                                      ^~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘Eigen::Index Eigen::internal::first_default_aligned(const Eigen::DenseBase<Derived>&) [with Derived = Eigen::CwiseBinaryOp<scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >; Eigen::Index = long int]’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:243:63:   required from ‘static Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::Scalar Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::run(const Evaluator&, const Func&, const XprType&) [with XprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >; Func = Eigen::internal::scalar_sum_op<double, double>; Evaluator = Eigen::internal::redux_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> > >; Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:418:56:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::redux(const Func&) const [with BinaryOp = Eigen::internal::scalar_sum_op<double, double>; Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:463:25:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::sum() const [with Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:50:63:   required from ‘static Eigen::internal::dot_nocheck<T, U, true>::ResScalar Eigen::internal::dot_nocheck<T, U, true>::run(const Eigen::MatrixBase<Derived>&, const Eigen::MatrixBase<U>&) [with T = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true>; U = Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>; ResScalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:84:58:   required from ‘typename Eigen::ScalarBinaryOpTraits<typename Eigen::internal::traits<T>::Scalar, typename Eigen::internal::traits<OtherDerived>::Scalar>::ReturnType Eigen::MatrixBase<Derived>::dot(const Eigen::MatrixBase<OtherDerived>&) const [with OtherDerived = Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>; Derived = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true>; typename Eigen::ScalarBinaryOpTraits<typename Eigen::internal::traits<T>::Scalar, typename Eigen::internal::traits<OtherDerived>::Scalar>::ReturnType = double; typename Eigen::internal::traits<T>::Scalar = double; typename Eigen::internal::traits<OtherDerived>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:380:62:   [ skipping 15 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:251:64:   required from ‘static void Eigen::internal::generic_product_impl<Lhs, Rhs, Eigen::DenseShape, Eigen::DenseShape, 6>::evalTo(Dst&, const Lhs&, const Rhs&) [with Dst = Eigen::Matrix<double, 1, 1, 0, 1, 1>; Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:124:75:   required from ‘Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::product_evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; int ProductTag = 6; LhsShape = Eigen::DenseShape; RhsShape = Eigen::DenseShape; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Rhs = Eigen::Matrix<double, -1, 1>; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:137:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:654:74: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  654 |   return internal::first_aligned<int(unpacket_traits<DefaultPacketType>::alignment),Derived>(m);
      |                                                                          ^~~~~~~~~
g++: fatal error: Killed signal terminated program cc1plus
compilation terminated.
make: *** [/opt/R/4.4.0/lib/R/etc/Makeconf:202: stanExports_survival_param.o] Error 1
ERROR: compilation failed for package ‘multinma’
* removing ‘/tmp/workdir/multinma/new/multinma.Rcheck/multinma’


```
### CRAN

```
* installing *source* package ‘multinma’ ...
** package ‘multinma’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
using C++17


g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG -I"../inst/include" -I"/usr/local/lib/R/site-library/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -DUSE_STANC3 -D_HAS_AUTO_PTR_ETC=0 -I'/usr/local/lib/R/site-library/BH/include' -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppEigen/include' -I'/usr/local/lib/R/site-library/RcppParallel/include' -I'/usr/local/lib/R/site-library/rstan/include' -I'/usr/local/lib/R/site-library/StanHeaders/include' -I/usr/local/include    -I'/usr/local/lib/R/site-library/RcppParallel/include' -D_REENTRANT -DSTAN_THREADS   -fpic  -g -O2   -c RcppExports.cpp -o RcppExports.o
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:205,
                 from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Dense:1,
                 from /usr/local/lib/R/site-library/RcppEigen/include/RcppEigenForward.h:28,
                 from /usr/local/lib/R/site-library/RcppEigen/include/RcppEigen.h:25,
                 from RcppExports.cpp:4:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:46:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   46 | typedef eigen_packet_wrapper<__m128i, 0> Packet4i;
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:47:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   47 | typedef eigen_packet_wrapper<__m128i, 1> Packet16b;
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:49:39: warning: ignoring attributes on template argument ‘__m128’ [-Wignored-attributes]
   49 | template<> struct is_arithmetic<__m128>  { enum { value = true }; };
      |                                       ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:50:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   50 | template<> struct is_arithmetic<__m128i> { enum { value = true }; };
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:51:40: warning: ignoring attributes on template argument ‘__m128d’ [-Wignored-attributes]
   51 | template<> struct is_arithmetic<__m128d> { enum { value = true }; };
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:222:43: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
  222 | template<> struct unpacket_traits<Packet4f> {
      |                                           ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:228:43: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
  228 | template<> struct unpacket_traits<Packet2d> {
      |                                           ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:1124:34: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
 1124 | ptranspose(PacketBlock<Packet4f,4>& kernel) {
      |                                  ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:1129:34: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
 1129 | ptranspose(PacketBlock<Packet2d,2>& kernel) {
      |                                  ^
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:174:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:16:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
   16 |   struct conj_helper<PACKET_REAL, PACKET_CPLX, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:173:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  173 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet2cf,Packet4f)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:29:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
   29 |   struct conj_helper<PACKET_CPLX, PACKET_REAL, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:173:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  173 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet2cf,Packet4f)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:16:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
   16 |   struct conj_helper<PACKET_REAL, PACKET_CPLX, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:298:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  298 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet1cd,Packet2d)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:29:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
   29 |   struct conj_helper<PACKET_CPLX, PACKET_REAL, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:298:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  298 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet1cd,Packet2d)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:165:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h: In instantiation of ‘struct Eigen::internal::find_best_packet<float, 4>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:22:57:   required from ‘struct Eigen::internal::traits<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:266:49:   required from ‘struct Eigen::internal::traits<Eigen::Quaternion<float> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:24:46:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:44: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::unpacket_traits<__vector(4) float>::half’ {aka ‘__m128’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:208:88: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  208 |   typedef typename find_best_packet_helper<Size,typename packet_traits<T>::type>::type type;
      |                                                                                        ^~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:271:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<float, 4, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:46:50:   required from ‘class Eigen::QuaternionBase<Eigen::Quaternion<float> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:273:7:   required from ‘class Eigen::Quaternion<float>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:27:3:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h: In instantiation of ‘struct Eigen::internal::find_best_packet<double, 4>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:22:57:   required from ‘struct Eigen::internal::traits<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:266:49:   required from ‘struct Eigen::internal::traits<Eigen::Quaternion<double> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:98:47:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:44: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::unpacket_traits<__vector(2) double>::half’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:208:88: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  208 |   typedef typename find_best_packet_helper<Size,typename packet_traits<T>::type>::type type;
      |                                                                                        ^~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, 4, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:46:50:   required from ‘class Eigen::QuaternionBase<Eigen::Quaternion<double> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:273:7:   required from ‘class Eigen::Quaternion<double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:102:3:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/SparseCore:37,
                 from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Sparse:26,
                 from /usr/local/lib/R/site-library/RcppEigen/include/RcppEigenForward.h:29:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h: In instantiation of ‘class Eigen::SparseMatrixBase<Eigen::SparseMatrix<double, 0, int> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseCompressedBase.h:36:7:   required from ‘class Eigen::SparseCompressedBase<Eigen::SparseMatrix<double, 0, int> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrix.h:96:7:   required from ‘class Eigen::SparseMatrix<double, 0, int>’
/usr/local/lib/R/site-library/RcppEigen/include/unsupported/Eigen/src/IterativeSolvers/ConstrainedConjGrad.h:61:25:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h:47:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   47 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~


g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG -I"../inst/include" -I"/usr/local/lib/R/site-library/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -DUSE_STANC3 -D_HAS_AUTO_PTR_ETC=0 -I'/usr/local/lib/R/site-library/BH/include' -I'/usr/local/lib/R/site-library/Rcpp/include' -I'/usr/local/lib/R/site-library/RcppEigen/include' -I'/usr/local/lib/R/site-library/RcppParallel/include' -I'/usr/local/lib/R/site-library/rstan/include' -I'/usr/local/lib/R/site-library/StanHeaders/include' -I/usr/local/include    -I'/usr/local/lib/R/site-library/RcppParallel/include' -D_REENTRANT -DSTAN_THREADS   -fpic  -g -O2   -c stanExports_binomial_1par.cc -o stanExports_binomial_1par.o
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:205,
                 from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Dense:1,
                 from /usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/Eigen.hpp:22,
                 from /usr/local/lib/R/site-library/rstan/include/rstan/rstaninc.hpp:3,
                 from stanExports_binomial_1par.h:23,
                 from stanExports_binomial_1par.cc:5:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:46:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   46 | typedef eigen_packet_wrapper<__m128i, 0> Packet4i;
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:47:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   47 | typedef eigen_packet_wrapper<__m128i, 1> Packet16b;
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:49:39: warning: ignoring attributes on template argument ‘__m128’ [-Wignored-attributes]
   49 | template<> struct is_arithmetic<__m128>  { enum { value = true }; };
      |                                       ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:50:40: warning: ignoring attributes on template argument ‘__m128i’ [-Wignored-attributes]
   50 | template<> struct is_arithmetic<__m128i> { enum { value = true }; };
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:51:40: warning: ignoring attributes on template argument ‘__m128d’ [-Wignored-attributes]
   51 | template<> struct is_arithmetic<__m128d> { enum { value = true }; };
      |                                        ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:222:43: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
  222 | template<> struct unpacket_traits<Packet4f> {
      |                                           ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:228:43: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
  228 | template<> struct unpacket_traits<Packet2d> {
      |                                           ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:1124:34: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
 1124 | ptranspose(PacketBlock<Packet4f,4>& kernel) {
      |                                  ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/PacketMath.h:1129:34: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
 1129 | ptranspose(PacketBlock<Packet2d,2>& kernel) {
      |                                  ^
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:174:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:16:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
   16 |   struct conj_helper<PACKET_REAL, PACKET_CPLX, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:173:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  173 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet2cf,Packet4f)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:29:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet4f’ {aka ‘__m128’} [-Wignored-attributes]
   29 |   struct conj_helper<PACKET_CPLX, PACKET_REAL, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:173:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  173 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet2cf,Packet4f)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:16:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
   16 |   struct conj_helper<PACKET_REAL, PACKET_CPLX, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:298:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  298 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet1cd,Packet2d)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/Default/ConjHelper.h:29:60: warning: ignoring attributes on template argument ‘Eigen::internal::Packet2d’ {aka ‘__m128d’} [-Wignored-attributes]
   29 |   struct conj_helper<PACKET_CPLX, PACKET_REAL, false, false> {          \
      |                                                            ^
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/arch/SSE/Complex.h:298:1: note: in expansion of macro ‘EIGEN_MAKE_CONJ_HELPER_CPLX_REAL’
  298 | EIGEN_MAKE_CONJ_HELPER_CPLX_REAL(Packet1cd,Packet2d)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:165:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h: In instantiation of ‘struct Eigen::internal::find_best_packet<float, 4>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:22:57:   required from ‘struct Eigen::internal::traits<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:266:49:   required from ‘struct Eigen::internal::traits<Eigen::Quaternion<float> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:24:46:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:44: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::unpacket_traits<__vector(4) float>::half’ {aka ‘__m128’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:208:88: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
  208 |   typedef typename find_best_packet_helper<Size,typename packet_traits<T>::type>::type type;
      |                                                                                        ^~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Core:271:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<float, 4, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<float, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<float, 4, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:46:50:   required from ‘class Eigen::QuaternionBase<Eigen::Quaternion<float> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:273:7:   required from ‘class Eigen::Quaternion<float>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:27:3:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<float>::type’ {aka ‘__m128’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h: In instantiation of ‘struct Eigen::internal::find_best_packet<double, 4>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:22:57:   required from ‘struct Eigen::internal::traits<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:266:49:   required from ‘struct Eigen::internal::traits<Eigen::Quaternion<double> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:98:47:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:44: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::unpacket_traits<__vector(2) double>::half’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:208:88: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  208 |   typedef typename find_best_packet_helper<Size,typename packet_traits<T>::type>::type type;
      |                                                                                        ^~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 4, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, 4, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, 4, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:46:50:   required from ‘class Eigen::QuaternionBase<Eigen::Quaternion<double> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/Quaternion.h:273:7:   required from ‘class Eigen::Quaternion<double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Geometry/arch/Geometry_SIMD.h:102:3:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
In file included from /usr/local/lib/R/site-library/BH/include/boost/smart_ptr/shared_ptr.hpp:17,
                 from /usr/local/lib/R/site-library/BH/include/boost/shared_ptr.hpp:17,
                 from /usr/local/lib/R/site-library/BH/include/boost/date_time/time_clock.hpp:17,
                 from /usr/local/lib/R/site-library/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /usr/local/lib/R/site-library/rstan/include/rstan/stan_fit.hpp:15,
                 from /usr/local/lib/R/site-library/rstan/include/rstan/rstaninc.hpp:4:
/usr/local/lib/R/site-library/BH/include/boost/smart_ptr/detail/shared_count.hpp:326:33: warning: ‘template<class> class std::auto_ptr’ is deprecated: use 'std::unique_ptr' instead [-Wdeprecated-declarations]
  326 |     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
      |                                 ^~~~~~~~
In file included from /usr/include/c++/13/memory:78,
                 from /usr/local/lib/R/site-library/rstan/include/rstan/stan_fit.hpp:7:
/usr/include/c++/13/bits/unique_ptr.h:65:28: note: declared here
   65 |   template<typename> class auto_ptr;
      |                            ^~~~~~~~
/usr/local/lib/R/site-library/BH/include/boost/smart_ptr/shared_ptr.hpp:354:31: warning: ‘template<class> class std::auto_ptr’ is deprecated: use 'std::unique_ptr' instead [-Wdeprecated-declarations]
  354 |     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
      |                               ^~~~~~~~
/usr/include/c++/13/bits/unique_ptr.h:65:28: note: declared here
   65 |   template<typename> class auto_ptr;
      |                            ^~~~~~~~
/usr/local/lib/R/site-library/BH/include/boost/smart_ptr/shared_ptr.hpp:365:22: warning: ‘template<class> class std::auto_ptr’ is deprecated: use 'std::unique_ptr' instead [-Wdeprecated-declarations]
  365 |     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
      |                      ^~~~~~~~
/usr/include/c++/13/bits/unique_ptr.h:65:28: note: declared here
   65 |   template<typename> class auto_ptr;
      |                            ^~~~~~~~
/usr/local/lib/R/site-library/BH/include/boost/smart_ptr/shared_ptr.hpp:423:34: warning: ‘template<class> class std::auto_ptr’ is deprecated: use 'std::unique_ptr' instead [-Wdeprecated-declarations]
  423 |     shared_ptr & operator=( std::auto_ptr<Y> & r )
      |                                  ^~~~~~~~
/usr/include/c++/13/bits/unique_ptr.h:65:28: note: declared here
   65 |   template<typename> class auto_ptr;
      |                            ^~~~~~~~
/usr/local/lib/R/site-library/BH/include/boost/smart_ptr/shared_ptr.hpp:430:34: warning: ‘template<class> class std::auto_ptr’ is deprecated: use 'std::unique_ptr' instead [-Wdeprecated-declarations]
  430 |     shared_ptr & operator=( std::auto_ptr<Y> && r )
      |                                  ^~~~~~~~
/usr/include/c++/13/bits/unique_ptr.h:65:28: note: declared here
   65 |   template<typename> class auto_ptr;
      |                            ^~~~~~~~
/usr/local/lib/R/site-library/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/usr/local/lib/R/site-library/BH/include/boost/smart_ptr/shared_ptr.hpp:432:38: warning: ‘template<class> class std::auto_ptr’ is deprecated: use 'std::unique_ptr' instead [-Wdeprecated-declarations]
  432 |         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
      |                                      ^~~~~~~~
/usr/include/c++/13/bits/unique_ptr.h:65:28: note: declared here
   65 |   template<typename> class auto_ptr;
      |                            ^~~~~~~~
In file included from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/SparseCore:37,
                 from /usr/local/lib/R/site-library/RcppEigen/include/Eigen/Sparse:26,
                 from /usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/Eigen.hpp:23:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h: In instantiation of ‘class Eigen::SparseMatrixBase<Eigen::SparseMatrix<double, 0, int> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseCompressedBase.h:36:7:   required from ‘class Eigen::SparseCompressedBase<Eigen::SparseMatrix<double, 0, int> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrix.h:96:7:   required from ‘class Eigen::SparseMatrix<double, 0, int>’
/usr/local/lib/R/site-library/RcppEigen/include/unsupported/Eigen/src/IterativeSolvers/ConstrainedConjGrad.h:61:25:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h:47:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   47 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h: In instantiation of ‘struct Eigen::internal::find_best_packet<double, -1>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:22:57:   required from ‘struct Eigen::internal::traits<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Cholesky/LDLT.h:19:52:   required from ‘struct Eigen::internal::traits<Eigen::LDLT<Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/EigenBase.h:42:59:   required from ‘struct Eigen::EigenBase<Eigen::LDLT<Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/SolverBase.h:68:7:   required from ‘class Eigen::SolverBase<Eigen::LDLT<Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Cholesky/LDLT.h:59:49:   required from ‘class Eigen::LDLT<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/err/check_pos_definite.hpp:46:15:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:44: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                                       ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  190 |          bool Stop = Size==Dynamic || (Size%unpacket_traits<PacketType>::size)==0 || is_same<PacketType,typename unpacket_traits<PacketType>::half>::value>
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:190:83: warning: ignoring attributes on template argument ‘Eigen::internal::unpacket_traits<__vector(2) double>::half’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/XprHelper.h:208:88: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  208 |   typedef typename find_best_packet_helper<Size,typename packet_traits<T>::type>::type type;
      |                                                                                        ^~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, -1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, -1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, -1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, -1, -1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Cholesky/LDLT.h:69:42:   required from ‘class Eigen::LDLT<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/err/check_pos_definite.hpp:46:15:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, -1, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, -1, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Cholesky/LDLT.h:287:19:   required from ‘class Eigen::LDLT<Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/err/check_pos_definite.hpp:46:15:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0>, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Diagonal.h:63:53:   required from ‘class Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/err/check_pos_definite.hpp:47:29:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0> >, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::ArrayWrapper<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::ArrayWrapper<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayWrapper.h:42:7:   required from ‘class Eigen::ArrayWrapper<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0> >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/err/check_pos_definite.hpp:47:41:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, Eigen::Array<double, -1, 1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, Eigen::Array<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, Eigen::Array<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseNullaryOp.h:60:7:   required from ‘class Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, Eigen::Array<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:38:28:   required from ‘struct Eigen::internal::traits<Eigen::CwiseBinaryOp<Eigen::internal::scalar_cmp_op<double, double, Eigen::internal::cmp_LE>, const Eigen::ArrayWrapper<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_cmp_op<double, double, Eigen::internal::cmp_LE>, const Eigen::ArrayWrapper<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, Eigen::Array<double, -1, 1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_cmp_op<double, double, Eigen::internal::cmp_LE>, const Eigen::ArrayWrapper<Eigen::Diagonal<const Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, Eigen::Array<double, -1, 1> > >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/err/check_pos_definite.hpp:47:45:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:223:34:   required from ‘class Eigen::MapBase<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:329:7:   required from ‘class Eigen::internal::BlockImpl_dense<Eigen::Matrix<double, -1, -1>, -1, 1, true, true>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:154:7:   required from ‘class Eigen::BlockImpl<Eigen::Matrix<double, -1, -1>, -1, 1, true, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:103:81:   required from ‘class Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/multiply_lower_tri_self_transpose.hpp:35:26:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, false>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, false>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, false>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:37:34:   required from ‘class Eigen::MapBase<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, false>, 0>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MapBase.h:223:34:   required from ‘class Eigen::MapBase<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, false>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:329:7:   required from ‘class Eigen::internal::BlockImpl_dense<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, false, true>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:154:7:   required from ‘class Eigen::BlockImpl<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, false, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:103:81:   required from ‘class Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, false>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/VectorBlock.h:56:47:   required from ‘class Eigen::VectorBlock<Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/multiply_lower_tri_self_transpose.hpp:35:34:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Matrix<double, -1, 1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseNullaryOp.h:60:7:   required from ‘class Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/linspaced_array.hpp:37:49:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 1, -1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 1, -1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Matrix<double, 1, -1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Matrix<double, 1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Matrix<double, 1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Matrix<double, 1, -1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:178:7:   required from ‘class Eigen::Matrix<double, 1, -1>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/linspaced_row_vector.hpp:32:28:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Matrix<double, 1, -1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Matrix<double, 1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Matrix<double, 1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseNullaryOp.h:60:7:   required from ‘class Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Matrix<double, 1, -1> >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/linspaced_row_vector.hpp:32:39:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Array<double, -1, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Array<double, -1, 1>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Array<double, -1, 1>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Array<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::Array<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/PlainObjectBase.h:98:7:   required from ‘class Eigen::PlainObjectBase<Eigen::Array<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Array.h:45:7:   required from ‘class Eigen::Array<double, -1, 1>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/lmgamma.hpp:58:53:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Array<double, -1, 1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Array<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Array<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseNullaryOp.h:60:7:   required from ‘class Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Array<double, -1, 1> >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/lmgamma.hpp:58:72:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<int, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<int>, const Eigen::Array<int, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Array<double, -1, 1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<int, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<int>, const Eigen::Array<int, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<int, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<int>, const Eigen::Array<int, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_difference_op<int, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<int>, const Eigen::Array<int, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Array<double, -1, 1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<int, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<int>, const Eigen::Array<int, -1, 1> >, const Eigen::CwiseNullaryOp<Eigen::internal::linspaced_op<double>, Eigen::Array<double, -1, 1> > >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/lmgamma.hpp:58:77:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0>, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0>, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Diagonal.h:63:53:   required from ‘class Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/matrix_exp_action_handler.hpp:71:17:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0> >, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0> >, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::ArrayWrapper<Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::ArrayWrapper<Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayWrapper.h:42:7:   required from ‘class Eigen::ArrayWrapper<Eigen::Diagonal<Eigen::Matrix<double, -1, -1>, 0> >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/matrix_exp_action_handler.hpp:71:29:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, -1>, 0>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, -1>, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, -1>, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:120:7:   required from ‘class Eigen::internal::dense_product_base<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, -1>, 0, 8>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:152:7:   required from ‘class Eigen::ProductImpl<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, -1>, 0, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:71:7:   required from ‘class Eigen::Product<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, -1>, 0>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/matrix_exp_action_handler.hpp:86:43:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseUnaryOp<Eigen::internal::scalar_abs_op<double>, const Eigen::Matrix<double, -1, -1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseUnaryOp<Eigen::internal::scalar_abs_op<double>, const Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseUnaryOp<Eigen::internal::scalar_abs_op<double>, const Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseUnaryOp.h:94:7:   required from ‘class Eigen::CwiseUnaryOpImpl<Eigen::internal::scalar_abs_op<double>, const Eigen::Matrix<double, -1, -1>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseUnaryOp.h:55:7:   required from ‘class Eigen::CwiseUnaryOp<Eigen::internal::scalar_abs_op<double>, const Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/matrix_exp_action_handler.hpp:106:22:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::PartialReduxExpr<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_abs_op<double>, const Eigen::Matrix<double, -1, -1> >, Eigen::internal::member_sum<double, double>, 1>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::PartialReduxExpr<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_abs_op<double>, const Eigen::Matrix<double, -1, -1> >, Eigen::internal::member_sum<double, double>, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::PartialReduxExpr<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_abs_op<double>, const Eigen::Matrix<double, -1, -1> >, Eigen::internal::member_sum<double, double>, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/VectorwiseOp.h:56:7:   required from ‘class Eigen::PartialReduxExpr<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_abs_op<double>, const Eigen::Matrix<double, -1, -1> >, Eigen::internal::member_sum<double, double>, 1>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/matrix_exp_action_handler.hpp:106:38:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> >, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayWrapper.h:42:7:   required from ‘class Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/ceil.hpp:57:52:   required from ‘stan::math::ceil<Eigen::Matrix<double, -1, -1> >(const Eigen::Matrix<double, -1, -1>&)::<lambda(const auto:244&)> [with auto:244 = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/functor/apply_vector_unary.hpp:47:25:   required from ‘static auto stan::math::apply_vector_unary<T, typename std::enable_if<stan::is_eigen<typename std::decay<_Tp>::type>::value, void>::type>::apply(const T&, const F&) [with F = stan::math::ceil<Eigen::Matrix<double, -1, -1> >(const Eigen::Matrix<double, -1, -1>&)::<lambda(const auto:244&)>; T2 = Eigen::Matrix<double, -1, -1>; stan::require_t<stan::is_eigen_matrix_base<typename stan::plain_type<T2, void>::type> >* <anonymous> = 0; T = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/ceil.hpp:56:46:   required from ‘auto stan::math::ceil(const Container&) [with Container = Eigen::Matrix<double, -1, -1>; stan::require_container_st<std::is_arithmetic, Container>* <anonymous> = 0; stan::require_not_var_matrix_t<Container>* <anonymous> = 0]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/matrix_exp_action_handler.hpp:197:41:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseUnaryOp<Eigen::internal::scalar_ceil_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseUnaryOp<Eigen::internal::scalar_ceil_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseUnaryOp<Eigen::internal::scalar_ceil_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseUnaryOp.h:94:7:   required from ‘class Eigen::CwiseUnaryOpImpl<Eigen::internal::scalar_ceil_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseUnaryOp.h:55:7:   required from ‘class Eigen::CwiseUnaryOp<Eigen::internal::scalar_ceil_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> > >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/ceil.hpp:57:52:   required from ‘stan::math::ceil<Eigen::Matrix<double, -1, -1> >(const Eigen::Matrix<double, -1, -1>&)::<lambda(const auto:244&)> [with auto:244 = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/functor/apply_vector_unary.hpp:47:25:   required from ‘static auto stan::math::apply_vector_unary<T, typename std::enable_if<stan::is_eigen<typename std::decay<_Tp>::type>::value, void>::type>::apply(const T&, const F&) [with F = stan::math::ceil<Eigen::Matrix<double, -1, -1> >(const Eigen::Matrix<double, -1, -1>&)::<lambda(const auto:244&)>; T2 = Eigen::Matrix<double, -1, -1>; stan::require_t<stan::is_eigen_matrix_base<typename stan::plain_type<T2, void>::type> >* <anonymous> = 0; T = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/ceil.hpp:56:46:   required from ‘auto stan::math::ceil(const Container&) [with Container = Eigen::Matrix<double, -1, -1>; stan::require_container_st<std::is_arithmetic, Container>* <anonymous> = 0; stan::require_not_var_matrix_t<Container>* <anonymous> = 0]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/matrix_exp_action_handler.hpp:197:41:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_ceil_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> > > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_ceil_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> > > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_ceil_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> > > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayWrapper.h:140:7:   required from ‘class Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_ceil_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, -1> > > >’
...
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:458:39:   required from ‘Eigen::SelfAdjointEigenSolver<MatrixType>& Eigen::SelfAdjointEigenSolver<_MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:181:14:   required from ‘Eigen::SelfAdjointEigenSolver<_MatrixType>::SelfAdjointEigenSolver(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/optimization/newton.hpp:19:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   required from ‘struct Eigen::internal::evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   [ skipping 22 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:238:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>& Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::operator=(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::HouseholderSequence<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, 1>, 1>; _Scalar = double; int _Rows = -1; int _Cols = -1; int _Options = 0; int _MaxRows = -1; int _MaxCols = -1]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:453:11:   required from ‘static void Eigen::internal::tridiagonalization_inplace_selector<MatrixType, Size, IsComplex>::run(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; MatrixType = Eigen::Matrix<double, -1, -1>; int Size = -1; bool IsComplex = false; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:434:55:   required from ‘void Eigen::internal::tridiagonalization_inplace(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with MatrixType = Eigen::Matrix<double, -1, -1>; DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:458:39:   required from ‘Eigen::SelfAdjointEigenSolver<MatrixType>& Eigen::SelfAdjointEigenSolver<_MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:181:14:   required from ‘Eigen::SelfAdjointEigenSolver<_MatrixType>::SelfAdjointEigenSolver(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/optimization/newton.hpp:19:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:780:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; Src = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Func = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:858:27:   required from ‘void Eigen::internal::call_assignment(Dst&, const Src&, const Func&, typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type) [with Dst = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>; Src = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Func = sub_assign_op<double, double>; typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type = void*; typename evaluator_traits<SrcXprType>::Shape = Eigen::DenseShape]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:164:18:   required from ‘Derived& Eigen::MatrixBase<Derived>::operator-=(const Eigen::MatrixBase<OtherDerived>&) [with OtherDerived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, 1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>, -1, 1, true>, -1, 1, false> > > >, -1, 1, false> >; Derived = Eigen::Block<Eigen::Transpose<Eigen::Block<Eigen::Block<Eigen::Matrix<double, -1, -1, 1, -1, -1>, 1, -1, true>, 1, -1, false> >, -1, 1, false>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixVector.h:341:27:   [ skipping 19 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:238:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>& Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::operator=(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::HouseholderSequence<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, 1>, 1>; _Scalar = double; int _Rows = -1; int _Cols = -1; int _Options = 0; int _MaxRows = -1; int _MaxCols = -1]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:453:11:   required from ‘static void Eigen::internal::tridiagonalization_inplace_selector<MatrixType, Size, IsComplex>::run(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; MatrixType = Eigen::Matrix<double, -1, -1>; int Size = -1; bool IsComplex = false; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:434:55:   required from ‘void Eigen::internal::tridiagonalization_inplace(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with MatrixType = Eigen::Matrix<double, -1, -1>; DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:458:39:   required from ‘Eigen::SelfAdjointEigenSolver<MatrixType>& Eigen::SelfAdjointEigenSolver<_MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:181:14:   required from ‘Eigen::SelfAdjointEigenSolver<_MatrixType>::SelfAdjointEigenSolver(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/optimization/newton.hpp:19:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>; SrcXprType = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false>; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>; SrcXprType = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false>; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   required from ‘void Eigen::internal::call_assignment_no_alias(Dst&, const Src&, const Func&) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>; Src = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false>; Func = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:858:27:   required from ‘void Eigen::internal::call_assignment(Dst&, const Src&, const Func&, typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type) [with Dst = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>; Src = Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false>; Func = sub_assign_op<double, double>; typename enable_if<(! evaluator_assume_aliasing<Src>::value), void*>::type = void*; typename evaluator_traits<SrcXprType>::Shape = Eigen::DenseShape]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:164:18:   required from ‘Derived& Eigen::MatrixBase<Derived>::operator-=(const Eigen::MatrixBase<OtherDerived>&) [with OtherDerived = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false>; Derived = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/products/TriangularMatrixMatrix.h:457:31:   [ skipping 19 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:238:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>& Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::operator=(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::HouseholderSequence<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, 1>, 1>; _Scalar = double; int _Rows = -1; int _Cols = -1; int _Options = 0; int _MaxRows = -1; int _MaxCols = -1]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:453:11:   required from ‘static void Eigen::internal::tridiagonalization_inplace_selector<MatrixType, Size, IsComplex>::run(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; MatrixType = Eigen::Matrix<double, -1, -1>; int Size = -1; bool IsComplex = false; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:434:55:   required from ‘void Eigen::internal::tridiagonalization_inplace(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with MatrixType = Eigen::Matrix<double, -1, -1>; DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:458:39:   required from ‘Eigen::SelfAdjointEigenSolver<MatrixType>& Eigen::SelfAdjointEigenSolver<_MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:181:14:   required from ‘Eigen::SelfAdjointEigenSolver<_MatrixType>::SelfAdjointEigenSolver(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/optimization/newton.hpp:19:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   required from ‘struct Eigen::internal::evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, false> >, -1, -1, false> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   [ skipping 22 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:238:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>& Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::operator=(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::HouseholderSequence<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, 1>, 1>; _Scalar = double; int _Rows = -1; int _Cols = -1; int _Options = 0; int _MaxRows = -1; int _MaxCols = -1]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:453:11:   required from ‘static void Eigen::internal::tridiagonalization_inplace_selector<MatrixType, Size, IsComplex>::run(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; MatrixType = Eigen::Matrix<double, -1, -1>; int Size = -1; bool IsComplex = false; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:434:55:   required from ‘void Eigen::internal::tridiagonalization_inplace(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with MatrixType = Eigen::Matrix<double, -1, -1>; DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:458:39:   required from ‘Eigen::SelfAdjointEigenSolver<MatrixType>& Eigen::SelfAdjointEigenSolver<_MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:181:14:   required from ‘Eigen::SelfAdjointEigenSolver<_MatrixType>::SelfAdjointEigenSolver(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/optimization/newton.hpp:19:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, 1, -1, false> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, 1, -1, false> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, 1, -1, false> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, 1, -1, false> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, 1, -1, false> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:606:52:   required from ‘const Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, 1>, ProductTag, Eigen::DenseShape, Eigen::DenseShape>::CoeffReturnType Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, 1>, ProductTag, Eigen::DenseShape, Eigen::DenseShape>::coeff(Eigen::Index, Eigen::Index) const [with Lhs = Eigen::Matrix<double, -1, -1>; Rhs = Eigen::Matrix<double, -1, -1>; int ProductTag = 8; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, 1>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, 1>::Lhs = Eigen::Matrix<double, -1, -1>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, 1>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, 1>::Rhs = Eigen::Matrix<double, -1, -1>; CoeffReturnType = double; Eigen::Index = long int]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:654:63:   [ skipping 23 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/optimization/bfgs_update.hpp:40:0:   required from ‘Scalar stan::optimization::BFGSUpdate_HInv<Scalar, DimAtCompile>::update(const VectorT&, const VectorT&, bool) [with Scalar = double; int DimAtCompile = -1; VectorT = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/optimization/bfgs.hpp:246:0:   required from ‘int stan::optimization::BFGSMinimizer<FunctorType, QNUpdateType, Scalar, DimAtCompile>::step() [with FunctorType = stan::optimization::ModelAdaptor<model_survival_param_namespace::model_survival_param, false>; QNUpdateType = stan::optimization::BFGSUpdate_HInv<>; Scalar = double; int DimAtCompile = -1]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/services/optimize/bfgs.hpp:117:0:   required from ‘int stan::services::optimize::bfgs(Model&, const stan::io::var_context&, unsigned int, unsigned int, double, double, double, double, double, double, double, int, bool, int, stan::callbacks::interrupt&, stan::callbacks::logger&, stan::callbacks::writer&, stan::callbacks::writer&) [with Model = model_survival_param_namespace::model_survival_param; bool jacobian = false]’
/usr/local/lib/R/site-library/rstan/include/rstan/stan_fit.hpp:517:0:   required from ‘int rstan::{anonymous}::command(rstan::stan_args&, Model&, Rcpp::List&, const std::vector<long unsigned int>&, const std::vector<std::__cxx11::basic_string<char> >&, RNG_t&) [with Model = model_survival_param_namespace::model_survival_param; RNG_t = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; Rcpp::List = Rcpp::Vector<19>]’
/usr/local/lib/R/site-library/rstan/include/rstan/stan_fit.hpp:1215:0:   required from ‘SEXPREC* rstan::stan_fit<Model, RNG_t>::call_sampler(SEXP) [with Model = model_survival_param_namespace::model_survival_param; RNG_t = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; SEXP = SEXPREC*]’
stanExports_survival_param.cc:15:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false> >, const Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false> >, const Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false> >, const Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false> >, const Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false> >, const Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:50:56:   required from ‘static Eigen::internal::dot_nocheck<T, U, true>::ResScalar Eigen::internal::dot_nocheck<T, U, true>::run(const Eigen::MatrixBase<Derived>&, const Eigen::MatrixBase<U>&) [with T = Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false>; U = Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true>; ResScalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:84:58:   [ skipping 23 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/access_helpers.hpp:92:0:   required from ‘void stan::model::internal::assign_impl(T1&&, T2&&, const char*) [with T1 = Eigen::Matrix<double, -1, -1>&; T2 = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_all_eigen_t<T_desired, T_actual>* <anonymous> = 0]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/assign.hpp:60:0:   required from ‘void stan::model::assign(T&&, U&&, const char*) [with T = Eigen::Matrix<double, -1, -1>&; U = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_t<std::is_assignable<typename std::decay<_Tp>::type&, typename std::decay<_Tp2>::type> >* <anonymous> = 0; stan::require_all_not_t<internal::is_tuple<Tuple1>, internal::is_tuple<Tuple2> >* <anonymous> = 0]’
stanExports_survival_param.h:8119:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array_impl(RNG&, VecR&, VecI&, VecVar&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; VecR = std::vector<double>; VecI = std::vector<int>; VecVar = std::vector<double>; stan::require_vector_like_vt<std::is_floating_point, VecR>* <anonymous> = 0; stan::require_vector_like_vt<std::is_integral, VecI>* <anonymous> = 0; stan::require_vector_vt<std::is_floating_point, VecVar>* <anonymous> = 0; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:9724:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array(RNG&, std::vector<double>&, std::vector<int>&, std::vector<double>&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/rstan/include/rstan/stan_fit.hpp:1105:0:   required from ‘SEXPREC* rstan::stan_fit<Model, RNG_t>::constrain_pars(SEXP) [with Model = model_survival_param_namespace::model_survival_param; RNG_t = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; SEXP = SEXPREC*]’
stanExports_survival_param.cc:26:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false>, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false>, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false>, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false>, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false>, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:50:56:   required from ‘static Eigen::internal::dot_nocheck<T, U, true>::ResScalar Eigen::internal::dot_nocheck<T, U, true>::run(const Eigen::MatrixBase<Derived>&, const Eigen::MatrixBase<U>&) [with T = Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, 1, -1, false>, 1, -1, true>; U = Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>; ResScalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:84:58:   [ skipping 23 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/access_helpers.hpp:92:0:   required from ‘void stan::model::internal::assign_impl(T1&&, T2&&, const char*) [with T1 = Eigen::Matrix<double, -1, -1>&; T2 = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_all_eigen_t<T_desired, T_actual>* <anonymous> = 0]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/assign.hpp:60:0:   required from ‘void stan::model::assign(T&&, U&&, const char*) [with T = Eigen::Matrix<double, -1, -1>&; U = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_t<std::is_assignable<typename std::decay<_Tp>::type&, typename std::decay<_Tp2>::type> >* <anonymous> = 0; stan::require_all_not_t<internal::is_tuple<Tuple1>, internal::is_tuple<Tuple2> >* <anonymous> = 0]’
stanExports_survival_param.h:8119:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array_impl(RNG&, VecR&, VecI&, VecVar&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; VecR = std::vector<double>; VecI = std::vector<int>; VecVar = std::vector<double>; stan::require_vector_like_vt<std::is_floating_point, VecR>* <anonymous> = 0; stan::require_vector_like_vt<std::is_integral, VecI>* <anonymous> = 0; stan::require_vector_vt<std::is_floating_point, VecVar>* <anonymous> = 0; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:9724:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array(RNG&, std::vector<double>&, std::vector<int>&, std::vector<double>&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/rstan/include/rstan/stan_fit.hpp:1105:0:   required from ‘SEXPREC* rstan::stan_fit<Model, RNG_t>::constrain_pars(SEXP) [with Model = model_survival_param_namespace::model_survival_param; RNG_t = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; SEXP = SEXPREC*]’
stanExports_survival_param.cc:26:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false> >, const Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false> >, const Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false> >, const Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false> >, const Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false> >, const Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:50:56:   required from ‘static Eigen::internal::dot_nocheck<T, U, true>::ResScalar Eigen::internal::dot_nocheck<T, U, true>::run(const Eigen::MatrixBase<Derived>&, const Eigen::MatrixBase<U>&) [with T = Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>; U = Eigen::Block<const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, -1, 1, true>; ResScalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:84:58:   [ skipping 23 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/access_helpers.hpp:92:0:   required from ‘void stan::model::internal::assign_impl(T1&&, T2&&, const char*) [with T1 = Eigen::Matrix<double, -1, -1>&; T2 = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_all_eigen_t<T_desired, T_actual>* <anonymous> = 0]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/assign.hpp:60:0:   required from ‘void stan::model::assign(T&&, U&&, const char*) [with T = Eigen::Matrix<double, -1, -1>&; U = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_t<std::is_assignable<typename std::decay<_Tp>::type&, typename std::decay<_Tp2>::type> >* <anonymous> = 0; stan::require_all_not_t<internal::is_tuple<Tuple1>, internal::is_tuple<Tuple2> >* <anonymous> = 0]’
stanExports_survival_param.h:8342:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array_impl(RNG&, VecR&, VecI&, VecVar&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; VecR = std::vector<double>; VecI = std::vector<int>; VecVar = std::vector<double>; stan::require_vector_like_vt<std::is_floating_point, VecR>* <anonymous> = 0; stan::require_vector_like_vt<std::is_integral, VecI>* <anonymous> = 0; stan::require_vector_vt<std::is_floating_point, VecVar>* <anonymous> = 0; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:9724:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array(RNG&, std::vector<double>&, std::vector<int>&, std::vector<double>&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/rstan/include/rstan/stan_fit.hpp:1105:0:   required from ‘SEXPREC* rstan::stan_fit<Model, RNG_t>::constrain_pars(SEXP) [with Model = model_survival_param_namespace::model_survival_param; RNG_t = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; SEXP = SEXPREC*]’
stanExports_survival_param.cc:26:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:118:37:   required from ‘class Eigen::TransposeImpl<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:50:23:   [ skipping 24 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/access_helpers.hpp:92:0:   required from ‘void stan::model::internal::assign_impl(T1&&, T2&&, const char*) [with T1 = Eigen::Matrix<double, -1, -1>&; T2 = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_all_eigen_t<T_desired, T_actual>* <anonymous> = 0]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/assign.hpp:60:0:   required from ‘void stan::model::assign(T&&, U&&, const char*) [with T = Eigen::Matrix<double, -1, -1>&; U = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_t<std::is_assignable<typename std::decay<_Tp>::type&, typename std::decay<_Tp2>::type> >* <anonymous> = 0; stan::require_all_not_t<internal::is_tuple<Tuple1>, internal::is_tuple<Tuple2> >* <anonymous> = 0]’
stanExports_survival_param.h:8342:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array_impl(RNG&, VecR&, VecI&, VecVar&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; VecR = std::vector<double>; VecI = std::vector<int>; VecVar = std::vector<double>; stan::require_vector_like_vt<std::is_floating_point, VecR>* <anonymous> = 0; stan::require_vector_like_vt<std::is_integral, VecI>* <anonymous> = 0; stan::require_vector_vt<std::is_floating_point, VecVar>* <anonymous> = 0; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:9724:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array(RNG&, std::vector<double>&, std::vector<int>&, std::vector<double>&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/rstan/include/rstan/stan_fit.hpp:1105:0:   required from ‘SEXPREC* rstan::stan_fit<Model, RNG_t>::constrain_pars(SEXP) [with Model = model_survival_param_namespace::model_survival_param; RNG_t = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; SEXP = SEXPREC*]’
stanExports_survival_param.cc:26:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:50:56:   required from ‘static Eigen::internal::dot_nocheck<T, U, true>::ResScalar Eigen::internal::dot_nocheck<T, U, true>::run(const Eigen::MatrixBase<Derived>&, const Eigen::MatrixBase<U>&) [with T = Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true>; U = Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>; ResScalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:84:58:   [ skipping 23 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/access_helpers.hpp:92:0:   required from ‘void stan::model::internal::assign_impl(T1&&, T2&&, const char*) [with T1 = Eigen::Matrix<double, -1, -1>&; T2 = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_all_eigen_t<T_desired, T_actual>* <anonymous> = 0]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/assign.hpp:60:0:   required from ‘void stan::model::assign(T&&, U&&, const char*) [with T = Eigen::Matrix<double, -1, -1>&; U = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_t<std::is_assignable<typename std::decay<_Tp>::type&, typename std::decay<_Tp2>::type> >* <anonymous> = 0; stan::require_all_not_t<internal::is_tuple<Tuple1>, internal::is_tuple<Tuple2> >* <anonymous> = 0]’
stanExports_survival_param.h:8342:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array_impl(RNG&, VecR&, VecI&, VecVar&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; VecR = std::vector<double>; VecI = std::vector<int>; VecVar = std::vector<double>; stan::require_vector_like_vt<std::is_floating_point, VecR>* <anonymous> = 0; stan::require_vector_like_vt<std::is_integral, VecI>* <anonymous> = 0; stan::require_vector_vt<std::is_floating_point, VecVar>* <anonymous> = 0; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:9724:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array(RNG&, std::vector<double>&, std::vector<int>&, std::vector<double>&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/rstan/include/rstan/stan_fit.hpp:1105:0:   required from ‘SEXPREC* rstan::stan_fit<Model, RNG_t>::constrain_pars(SEXP) [with Model = model_survival_param_namespace::model_survival_param; RNG_t = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; SEXP = SEXPREC*]’
stanExports_survival_param.cc:26:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:311:41:   required from ‘struct Eigen::internal::unary_evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >, Eigen::internal::IndexBased, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:90:8:   required from ‘struct Eigen::internal::evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:41:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false>, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   [ skipping 28 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/access_helpers.hpp:92:0:   required from ‘void stan::model::internal::assign_impl(T1&&, T2&&, const char*) [with T1 = Eigen::Matrix<double, -1, -1>&; T2 = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_all_eigen_t<T_desired, T_actual>* <anonymous> = 0]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/assign.hpp:60:0:   required from ‘void stan::model::assign(T&&, U&&, const char*) [with T = Eigen::Matrix<double, -1, -1>&; U = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_t<std::is_assignable<typename std::decay<_Tp>::type&, typename std::decay<_Tp2>::type> >* <anonymous> = 0; stan::require_all_not_t<internal::is_tuple<Tuple1>, internal::is_tuple<Tuple2> >* <anonymous> = 0]’
stanExports_survival_param.h:8342:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array_impl(RNG&, VecR&, VecI&, VecVar&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; VecR = std::vector<double>; VecI = std::vector<int>; VecVar = std::vector<double>; stan::require_vector_like_vt<std::is_floating_point, VecR>* <anonymous> = 0; stan::require_vector_like_vt<std::is_integral, VecI>* <anonymous> = 0; stan::require_vector_vt<std::is_floating_point, VecVar>* <anonymous> = 0; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:9724:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array(RNG&, std::vector<double>&, std::vector<int>&, std::vector<double>&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/rstan/include/rstan/stan_fit.hpp:1105:0:   required from ‘SEXPREC* rstan::stan_fit<Model, RNG_t>::constrain_pars(SEXP) [with Model = model_survival_param_namespace::model_survival_param; RNG_t = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; SEXP = SEXPREC*]’
stanExports_survival_param.cc:26:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
 1071 |     PacketAlignment = unpacket_traits<PacketScalar>::alignment,
      |                                                      ^~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, 1, -1, false> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:606:52:   required from ‘const Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, 1>, ProductTag, Eigen::DenseShape, Eigen::DenseShape>::CoeffReturnType Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, 1>, ProductTag, Eigen::DenseShape, Eigen::DenseShape>::coeff(Eigen::Index, Eigen::Index) const [with Lhs = Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>; Rhs = Eigen::Matrix<double, -1, -1>; int ProductTag = 8; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, 1>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, 1>::Lhs = Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, 1>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, 1>::Rhs = Eigen::Matrix<double, -1, -1>; CoeffReturnType = double; Eigen::Index = long int]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:654:63:   [ skipping 26 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/access_helpers.hpp:92:0:   required from ‘void stan::model::internal::assign_impl(T1&&, T2&&, const char*) [with T1 = Eigen::Matrix<double, -1, -1>&; T2 = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_all_eigen_t<T_desired, T_actual>* <anonymous> = 0]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/indexing/assign.hpp:60:0:   required from ‘void stan::model::assign(T&&, U&&, const char*) [with T = Eigen::Matrix<double, -1, -1>&; U = Eigen::MatrixWrapper<const Eigen::CwiseUnaryOp<Eigen::internal::scalar_exp_op<double>, const Eigen::ArrayWrapper<const Eigen::Product<Eigen::Block<const Eigen::Map<Eigen::Matrix<double, -1, -1>, 0, Eigen::Stride<0, 0> >, -1, -1, false>, Eigen::Matrix<double, -1, -1>, 0> > > >; stan::require_t<std::is_assignable<typename std::decay<_Tp>::type&, typename std::decay<_Tp2>::type> >* <anonymous> = 0; stan::require_all_not_t<internal::is_tuple<Tuple1>, internal::is_tuple<Tuple2> >* <anonymous> = 0]’
stanExports_survival_param.h:8342:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array_impl(RNG&, VecR&, VecI&, VecVar&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; VecR = std::vector<double>; VecI = std::vector<int>; VecVar = std::vector<double>; stan::require_vector_like_vt<std::is_floating_point, VecR>* <anonymous> = 0; stan::require_vector_like_vt<std::is_integral, VecI>* <anonymous> = 0; stan::require_vector_vt<std::is_floating_point, VecVar>* <anonymous> = 0; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:9724:0:   required from ‘void model_survival_param_namespace::model_survival_param::write_array(RNG&, std::vector<double>&, std::vector<int>&, std::vector<double>&, bool, bool, std::ostream*) const [with RNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/rstan/include/rstan/stan_fit.hpp:1105:0:   required from ‘SEXPREC* rstan::stan_fit<Model, RNG_t>::constrain_pars(SEXP) [with Model = model_survival_param_namespace::model_survival_param; RNG_t = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >; SEXP = SEXPREC*]’
stanExports_survival_param.cc:26:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   required from ‘struct Eigen::internal::evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1, 1, -1, -1>, -1, -1, false> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   [ skipping 26 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:238:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>& Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::operator=(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::HouseholderSequence<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, 1>, 1>; _Scalar = double; int _Rows = -1; int _Cols = -1; int _Options = 0; int _MaxRows = -1; int _MaxCols = -1]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:453:11:   required from ‘static void Eigen::internal::tridiagonalization_inplace_selector<MatrixType, Size, IsComplex>::run(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; MatrixType = Eigen::Matrix<double, -1, -1>; int Size = -1; bool IsComplex = false; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:434:55:   required from ‘void Eigen::internal::tridiagonalization_inplace(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with MatrixType = Eigen::Matrix<double, -1, -1>; DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:458:39:   required from ‘Eigen::SelfAdjointEigenSolver<MatrixType>& Eigen::SelfAdjointEigenSolver<_MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:181:14:   required from ‘Eigen::SelfAdjointEigenSolver<_MatrixType>::SelfAdjointEigenSolver(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/optimization/newton.hpp:19:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
 1071 |     PacketAlignment = unpacket_traits<PacketScalar>::alignment,
      |                                                      ^~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:78:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   required from ‘struct Eigen::internal::evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:774:20:   required from ‘void Eigen::internal::call_dense_assignment_loop(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >; Functor = sub_assign_op<double, double>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:954:31:   required from ‘static void Eigen::internal::Assignment<DstXprType, SrcXprType, Functor, Eigen::internal::Dense2Dense, Weak>::run(DstXprType&, const SrcXprType&, const Functor&) [with DstXprType = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, -1, true>; SrcXprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, -1, -1> >, const Eigen::Block<const Eigen::Transpose<const Eigen::Matrix<double, -1, -1, 1, -1, -1> >, -1, -1, true> >; Functor = Eigen::internal::sub_assign_op<double, double>; Weak = void]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/AssignEvaluator.h:890:49:   [ skipping 26 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Matrix.h:238:29:   required from ‘Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>& Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols>::operator=(const Eigen::EigenBase<OtherDerived>&) [with OtherDerived = Eigen::HouseholderSequence<Eigen::Matrix<double, -1, -1>, Eigen::Matrix<double, -1, 1>, 1>; _Scalar = double; int _Rows = -1; int _Cols = -1; int _Options = 0; int _MaxRows = -1; int _MaxCols = -1]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:453:11:   required from ‘static void Eigen::internal::tridiagonalization_inplace_selector<MatrixType, Size, IsComplex>::run(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; MatrixType = Eigen::Matrix<double, -1, -1>; int Size = -1; bool IsComplex = false; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/Tridiagonalization.h:434:55:   required from ‘void Eigen::internal::tridiagonalization_inplace(MatrixType&, DiagonalType&, SubDiagonalType&, CoeffVectorType&, bool) [with MatrixType = Eigen::Matrix<double, -1, -1>; DiagonalType = Eigen::Matrix<double, -1, 1>; SubDiagonalType = Eigen::Matrix<double, -1, 1>; CoeffVectorType = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:458:39:   required from ‘Eigen::SelfAdjointEigenSolver<MatrixType>& Eigen::SelfAdjointEigenSolver<_MatrixType>::compute(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h:181:14:   required from ‘Eigen::SelfAdjointEigenSolver<_MatrixType>::SelfAdjointEigenSolver(const Eigen::EigenBase<OtherDerived>&, int) [with InputType = Eigen::Matrix<double, -1, -1>; _MatrixType = Eigen::Matrix<double, -1, -1>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/optimization/newton.hpp:19:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Product<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Product<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Product<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:120:7:   required from ‘class Eigen::internal::dense_product_base<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0, 5>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:152:7:   required from ‘class Eigen::ProductImpl<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:71:7:   required from ‘class Eigen::Product<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::Map<Eigen::Matrix<double, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:40:30:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain_internal(Result&&, WMat&&, B&&) [with Result = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B = stan::math::arena_matrix<Eigen::Matrix<double, -1, 1> >&; stan::require_rev_matrix_t<WMat>* <anonymous> = 0; stan::require_not_rev_matrix_t<B>* <anonymous> = 0; Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<double, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:32:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain() [with Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<double, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:8:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h: In instantiation of ‘class Eigen::SparseMatrixBase<Eigen::Transpose<Eigen::Map<const Eigen::SparseMatrix<double, 1> > > >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseCompressedBase.h:36:7:   required from ‘class Eigen::SparseCompressedBase<Eigen::Transpose<Eigen::Map<const Eigen::SparseMatrix<double, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseTranspose.h:22:9:   required from ‘class Eigen::internal::SparseTransposeImpl<Eigen::Map<const Eigen::SparseMatrix<double, 1> >, 1024>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseTranspose.h:45:37:   required from ‘class Eigen::TransposeImpl<Eigen::Map<const Eigen::SparseMatrix<double, 1> >, Eigen::Sparse>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<Eigen::Map<const Eigen::SparseMatrix<double, 1> > >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:47:31:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain_internal(Result&&, WMat&&, B&&) [with Result = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat = Eigen::Map<const Eigen::SparseMatrix<double, 1> >&; B = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; stan::require_not_rev_matrix_t<WMat>* <anonymous> = 0; stan::require_rev_matrix_t<B>* <anonymous> = 0; Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = Eigen::Map<const Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:32:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain() [with Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = Eigen::Map<const Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:8:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h:47:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   47 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Product<Eigen::Transpose<Eigen::Map<const Eigen::SparseMatrix<double, 1> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Product<Eigen::Transpose<Eigen::Map<const Eigen::SparseMatrix<double, 1> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Product<Eigen::Transpose<Eigen::Map<const Eigen::SparseMatrix<double, 1> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:120:7:   required from ‘class Eigen::internal::dense_product_base<Eigen::Transpose<Eigen::Map<const Eigen::SparseMatrix<double, 1> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0, 7>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:152:7:   required from ‘class Eigen::ProductImpl<Eigen::Transpose<Eigen::Map<const Eigen::SparseMatrix<double, 1> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:71:7:   required from ‘class Eigen::Product<Eigen::Transpose<Eigen::Map<const Eigen::SparseMatrix<double, 1> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:47:34:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain_internal(Result&&, WMat&&, B&&) [with Result = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat = Eigen::Map<const Eigen::SparseMatrix<double, 1> >&; B = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; stan::require_not_rev_matrix_t<WMat>* <anonymous> = 0; stan::require_rev_matrix_t<B>* <anonymous> = 0; Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = Eigen::Map<const Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:32:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain() [with Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = Eigen::Map<const Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:8:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:302:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > >, 1>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:555:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > >, 3>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:118:37:   required from ‘class Eigen::TransposeImpl<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:32:49:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain_internal(Result&&, WMat&&, B&&) [with Result = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; stan::require_rev_matrix_t<WMat>* <anonymous> = 0; stan::require_rev_matrix_t<B>* <anonymous> = 0; Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:32:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain() [with Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:8:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Product<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > >, 0>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Product<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > >, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Product<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > >, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:120:7:   required from ‘class Eigen::internal::dense_product_base<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > >, 0, 5>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:152:7:   required from ‘class Eigen::ProductImpl<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > >, 0, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:71:7:   required from ‘class Eigen::Product<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::Transpose<Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::val_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > > >, 0>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:32:30:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain_internal(Result&&, WMat&&, B&&) [with Result = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; stan::require_rev_matrix_t<WMat>* <anonymous> = 0; stan::require_rev_matrix_t<B>* <anonymous> = 0; Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:32:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain() [with Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:8:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h: In instantiation of ‘class Eigen::SparseMatrixBase<Eigen::Transpose<const Eigen::Map<Eigen::SparseMatrix<double, 1>, 0, Eigen::Stride<0, 0> > > >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseCompressedBase.h:36:7:   required from ‘class Eigen::SparseCompressedBase<Eigen::Transpose<const Eigen::Map<Eigen::SparseMatrix<double, 1>, 0, Eigen::Stride<0, 0> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseTranspose.h:22:9:   required from ‘class Eigen::internal::SparseTransposeImpl<const Eigen::Map<Eigen::SparseMatrix<double, 1>, 0, Eigen::Stride<0, 0> >, 1024>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseTranspose.h:45:37:   required from ‘class Eigen::TransposeImpl<const Eigen::Map<Eigen::SparseMatrix<double, 1>, 0, Eigen::Stride<0, 0> >, Eigen::Sparse>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<const Eigen::Map<Eigen::SparseMatrix<double, 1>, 0, Eigen::Stride<0, 0> > >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:33:37:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain_internal(Result&&, WMat&&, B&&) [with Result = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; stan::require_rev_matrix_t<WMat>* <anonymous> = 0; stan::require_rev_matrix_t<B>* <anonymous> = 0; Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:32:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain() [with Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:8:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/SparseCore/SparseMatrixBase.h:47:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   47 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Product<Eigen::Transpose<const Eigen::Map<Eigen::SparseMatrix<double, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Product<Eigen::Transpose<const Eigen::Map<Eigen::SparseMatrix<double, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Product<Eigen::Transpose<const Eigen::Map<Eigen::SparseMatrix<double, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:120:7:   required from ‘class Eigen::internal::dense_product_base<Eigen::Transpose<const Eigen::Map<Eigen::SparseMatrix<double, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0, 7>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:152:7:   required from ‘class Eigen::ProductImpl<Eigen::Transpose<const Eigen::Map<Eigen::SparseMatrix<double, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:71:7:   required from ‘class Eigen::Product<Eigen::Transpose<const Eigen::Map<Eigen::SparseMatrix<double, 1>, 0, Eigen::Stride<0, 0> > >, Eigen::CwiseUnaryView<Eigen::MatrixBase<Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >::adj_Op, Eigen::Map<Eigen::Matrix<stan::math::var_value<double>, -1, 1>, 0, Eigen::Stride<0, 0> > >, 0>’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:33:40:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain_internal(Result&&, WMat&&, B&&) [with Result = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; stan::require_rev_matrix_t<WMat>* <anonymous> = 0; stan::require_rev_matrix_t<B>* <anonymous> = 0; Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:32:   required from ‘void stan::math::internal::csr_adjoint<Result_, WMat_, B_>::chain() [with Result_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&; WMat_ = stan::math::var_value<Eigen::SparseMatrix<double, 1> >&; B_ = stan::math::arena_matrix<Eigen::Matrix<stan::math::var_value<double>, -1, 1> >&]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/rev/fun/csr_matrix_times_vector.hpp:27:8:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:37:44:   required from ‘static Eigen::internal::dot_nocheck<T, U, NeedToTranspose>::ResScalar Eigen::internal::dot_nocheck<T, U, NeedToTranspose>::run(const Eigen::MatrixBase<Derived>&, const Eigen::MatrixBase<U>&) [with T = Eigen::Matrix<double, -1, 1>; U = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> >; bool NeedToTranspose = false; ResScalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:84:58:   required from ‘typename Eigen::ScalarBinaryOpTraits<typename Eigen::internal::traits<T>::Scalar, typename Eigen::internal::traits<OtherDerived>::Scalar>::ReturnType Eigen::MatrixBase<Derived>::dot(const Eigen::MatrixBase<OtherDerived>&) const [with OtherDerived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>; typename Eigen::ScalarBinaryOpTraits<typename Eigen::internal::traits<T>::Scalar, typename Eigen::internal::traits<OtherDerived>::Scalar>::ReturnType = double; typename Eigen::internal::traits<T>::Scalar = double; typename Eigen::internal::traits<OtherDerived>::Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/diag_e_metric.hpp:21:0:   required from ‘double stan::mcmc::diag_e_metric<Model, BaseRNG>::T(stan::mcmc::diag_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/diag_e_metric.hpp:20:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:118:37:   required from ‘class Eigen::TransposeImpl<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:251:39:   required from ‘static void Eigen::internal::generic_product_impl<Lhs, Rhs, Eigen::DenseShape, Eigen::DenseShape, 6>::evalTo(Dst&, const Lhs&, const Rhs&) [with Dst = Eigen::Matrix<double, 1, 1, 0, 1, 1>; Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:124:75:   required from ‘Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::product_evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; int ProductTag = 6; LhsShape = Eigen::DenseShape; RhsShape = Eigen::DenseShape; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Rhs = Eigen::Matrix<double, -1, 1>; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:137:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::Matrix<double, -1, 1> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::Matrix<double, -1, 1>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::Matrix<double, -1, 1> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:251:54:   required from ‘static void Eigen::internal::generic_product_impl<Lhs, Rhs, Eigen::DenseShape, Eigen::DenseShape, 6>::evalTo(Dst&, const Lhs&, const Rhs&) [with Dst = Eigen::Matrix<double, 1, 1, 0, 1, 1>; Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:124:75:   required from ‘Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::product_evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; int ProductTag = 6; LhsShape = Eigen::DenseShape; RhsShape = Eigen::DenseShape; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Rhs = Eigen::Matrix<double, -1, 1>; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:137:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/prob/lognormal_lpdf.hpp:70:40:   required from ‘stan::return_type_t<T, L, U> stan::math::lognormal_lpdf(const T_y&, const T_loc&, const T_scale&) [with bool propto = true; T_y = Eigen::Matrix<double, -1, 1>; T_loc = double; T_scale = double; stan::require_all_not_nonscalar_prim_or_rev_kernel_expression_t<T_y, T_scale_succ, T_scale_fail>* <anonymous> = 0; stan::return_type_t<T, L, U> = double]’
stanExports_survival_param.h:1551:0:   required from ‘void model_survival_param_namespace::prior_select_lp(const T0__&, const int&, const T2__&, const T3__&, const T4__&, T_lp__&, T_lp_accum__&, std::ostream*) [with bool propto__ = true; T0__ = Eigen::Matrix<double, -1, 1>; T2__ = double; T3__ = double; T4__ = double; T_lp__ = double; T_lp_accum__ = stan::math::accumulator<double>; stan::require_all_t<stan::is_col_vector<Col>, stan::is_vt_not_complex<T0__>, stan::is_stan_scalar<T2__>, stan::is_stan_scalar<T3__>, stan::is_stan_scalar<T4__> >* <anonymous> = 0; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:7364:0:   required from ‘stan::scalar_type_t<T2> model_survival_param_namespace::model_survival_param::log_prob_impl(VecR&, VecI&, std::ostream*) const [with bool propto__ = true; bool jacobian__ = false; VecR = Eigen::Matrix<double, -1, 1>; VecI = Eigen::Matrix<int, -1, 1>; stan::require_vector_like_t<VecR>* <anonymous> = 0; stan::require_vector_like_vt<std::is_integral, VecI>* <anonymous> = 0; stan::scalar_type_t<T2> = double; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:9730:0:   required from ‘T_ model_survival_param_namespace::model_survival_param::log_prob(Eigen::Matrix<T_job_param, -1, 1>&, std::ostream*) const [with bool propto__ = true; bool jacobian__ = false; T_ = double; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/model_base_crtp.hpp:115:0:   required from ‘double stan::model::model_base_crtp<M>::log_prob_propto(Eigen::VectorXd&, std::ostream*) const [with M = model_survival_param_namespace::model_survival_param; Eigen::VectorXd = Eigen::Matrix<double, -1, 1>; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/model_base_crtp.hpp:113:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ArrayBase.h:39:34:   required from ‘class Eigen::ArrayBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_difference_op<double, double>, const Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> > >, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Array<double, -1, 1> > >’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/prob/lognormal_lpdf.hpp:70:40:   required from ‘stan::return_type_t<T, L, U> stan::math::lognormal_lpdf(const T_y&, const T_loc&, const T_scale&) [with bool propto = true; T_y = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>; T_loc = double; T_scale = double; stan::require_all_not_nonscalar_prim_or_rev_kernel_expression_t<T_y, T_scale_succ, T_scale_fail>* <anonymous> = 0; stan::return_type_t<T, L, U> = double]’
stanExports_survival_param.h:1551:0:   required from ‘void model_survival_param_namespace::prior_select_lp(const T0__&, const int&, const T2__&, const T3__&, const T4__&, T_lp__&, T_lp_accum__&, std::ostream*) [with bool propto__ = true; T0__ = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>; T2__ = double; T3__ = double; T4__ = double; T_lp__ = double; T_lp_accum__ = stan::math::accumulator<double>; stan::require_all_t<stan::is_col_vector<Col>, stan::is_vt_not_complex<T0__>, stan::is_stan_scalar<T2__>, stan::is_stan_scalar<T3__>, stan::is_stan_scalar<T4__> >* <anonymous> = 0; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:7480:0:   required from ‘stan::scalar_type_t<T2> model_survival_param_namespace::model_survival_param::log_prob_impl(VecR&, VecI&, std::ostream*) const [with bool propto__ = true; bool jacobian__ = false; VecR = Eigen::Matrix<double, -1, 1>; VecI = Eigen::Matrix<int, -1, 1>; stan::require_vector_like_t<VecR>* <anonymous> = 0; stan::require_vector_like_vt<std::is_integral, VecI>* <anonymous> = 0; stan::scalar_type_t<T2> = double; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:9730:0:   required from ‘T_ model_survival_param_namespace::model_survival_param::log_prob(Eigen::Matrix<T_job_param, -1, 1>&, std::ostream*) const [with bool propto__ = true; bool jacobian__ = false; T_ = double; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/model_base_crtp.hpp:115:0:   required from ‘double stan::model::model_base_crtp<M>::log_prob_propto(Eigen::VectorXd&, std::ostream*) const [with M = model_survival_param_namespace::model_survival_param; Eigen::VectorXd = Eigen::Matrix<double, -1, 1>; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/model_base_crtp.hpp:113:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘Eigen::Index Eigen::internal::first_default_aligned(const Eigen::DenseBase<Derived>&) [with Derived = Eigen::CwiseBinaryOp<scalar_conj_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> > >; Eigen::Index = long int]’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:243:63:   required from ‘static Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::Scalar Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::run(const Evaluator&, const Func&, const XprType&) [with XprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> > >; Func = Eigen::internal::scalar_sum_op<double, double>; Evaluator = Eigen::internal::redux_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> > > >; Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:418:56:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::redux(const Func&) const [with BinaryOp = Eigen::internal::scalar_sum_op<double, double>; Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> > >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:463:25:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::sum() const [with Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> > >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:37:51:   required from ‘static Eigen::internal::dot_nocheck<T, U, NeedToTranspose>::ResScalar Eigen::internal::dot_nocheck<T, U, NeedToTranspose>::run(const Eigen::MatrixBase<Derived>&, const Eigen::MatrixBase<U>&) [with T = Eigen::Matrix<double, -1, 1>; U = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> >; bool NeedToTranspose = false; ResScalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:84:58:   required from ‘typename Eigen::ScalarBinaryOpTraits<typename Eigen::internal::traits<T>::Scalar, typename Eigen::internal::traits<OtherDerived>::Scalar>::ReturnType Eigen::MatrixBase<Derived>::dot(const Eigen::MatrixBase<OtherDerived>&) const [with OtherDerived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Matrix<double, -1, 1>, const Eigen::Matrix<double, -1, 1> >; Derived = Eigen::Matrix<double, -1, 1>; typename Eigen::ScalarBinaryOpTraits<typename Eigen::internal::traits<T>::Scalar, typename Eigen::internal::traits<OtherDerived>::Scalar>::ReturnType = double; typename Eigen::internal::traits<T>::Scalar = double; typename Eigen::internal::traits<OtherDerived>::Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/diag_e_metric.hpp:21:0:   required from ‘double stan::mcmc::diag_e_metric<Model, BaseRNG>::T(stan::mcmc::diag_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/diag_e_metric.hpp:20:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:654:74: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  654 |   return internal::first_aligned<int(unpacket_traits<DefaultPacketType>::alignment),Derived>(m);
      |                                                                          ^~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘Eigen::Index Eigen::internal::first_default_aligned(const Eigen::DenseBase<Derived>&) [with Derived = Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::Matrix<double, -1, 1> >; Eigen::Index = long int]’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:243:63:   required from ‘static Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::Scalar Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::run(const Evaluator&, const Func&, const XprType&) [with XprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::Matrix<double, -1, 1> >; Func = Eigen::internal::scalar_sum_op<double, double>; Evaluator = Eigen::internal::redux_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::Matrix<double, -1, 1> > >; Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:418:56:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::redux(const Func&) const [with BinaryOp = Eigen::internal::scalar_sum_op<double, double>; Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::Matrix<double, -1, 1> >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:463:25:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::sum() const [with Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::Transpose<const Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0> >, const Eigen::Matrix<double, -1, 1> >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:251:64:   required from ‘static void Eigen::internal::generic_product_impl<Lhs, Rhs, Eigen::DenseShape, Eigen::DenseShape, 6>::evalTo(Dst&, const Lhs&, const Rhs&) [with Dst = Eigen::Matrix<double, 1, 1, 0, 1, 1>; Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:124:75:   required from ‘Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::product_evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; int ProductTag = 6; LhsShape = Eigen::DenseShape; RhsShape = Eigen::DenseShape; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Rhs = Eigen::Matrix<double, -1, 1>; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:137:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:654:74: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘Eigen::Index Eigen::internal::first_default_aligned(const Eigen::DenseBase<Derived>&) [with Derived = Eigen::CwiseUnaryOp<scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >; Eigen::Index = long int]’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:243:63:   required from ‘static Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::Scalar Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::run(const Evaluator&, const Func&, const XprType&) [with XprType = Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >; Func = Eigen::internal::scalar_sum_op<double, double>; Evaluator = Eigen::internal::redux_evaluator<Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > > >; Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:418:56:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::redux(const Func&) const [with BinaryOp = Eigen::internal::scalar_sum_op<double, double>; Derived = Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:463:25:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::sum() const [with Derived = Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/sum.hpp:47:15:   required from ‘stan::value_type_t<T> stan::math::sum(const T&) [with T = Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Matrix<double, -1, 1> > >; stan::require_eigen_vt<std::is_arithmetic, T>* <anonymous> = 0; stan::value_type_t<T> = double]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/prob/lognormal_lpdf.hpp:79:16:   required from ‘stan::return_type_t<T, L, U> stan::math::lognormal_lpdf(const T_y&, const T_loc&, const T_scale&) [with bool propto = true; T_y = Eigen::Matrix<double, -1, 1>; T_loc = double; T_scale = double; stan::require_all_not_nonscalar_prim_or_rev_kernel_expression_t<T_y, T_scale_succ, T_scale_fail>* <anonymous> = 0; stan::return_type_t<T, L, U> = double]’
stanExports_survival_param.h:1551:0:   required from ‘void model_survival_param_namespace::prior_select_lp(const T0__&, const int&, const T2__&, const T3__&, const T4__&, T_lp__&, T_lp_accum__&, std::ostream*) [with bool propto__ = true; T0__ = Eigen::Matrix<double, -1, 1>; T2__ = double; T3__ = double; T4__ = double; T_lp__ = double; T_lp_accum__ = stan::math::accumulator<double>; stan::require_all_t<stan::is_col_vector<Col>, stan::is_vt_not_complex<T0__>, stan::is_stan_scalar<T2__>, stan::is_stan_scalar<T3__>, stan::is_stan_scalar<T4__> >* <anonymous> = 0; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:7364:0:   required from ‘stan::scalar_type_t<T2> model_survival_param_namespace::model_survival_param::log_prob_impl(VecR&, VecI&, std::ostream*) const [with bool propto__ = true; bool jacobian__ = false; VecR = Eigen::Matrix<double, -1, 1>; VecI = Eigen::Matrix<int, -1, 1>; stan::require_vector_like_t<VecR>* <anonymous> = 0; stan::require_vector_like_vt<std::is_integral, VecI>* <anonymous> = 0; stan::scalar_type_t<T2> = double; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:9730:0:   required from ‘T_ model_survival_param_namespace::model_survival_param::log_prob(Eigen::Matrix<T_job_param, -1, 1>&, std::ostream*) const [with bool propto__ = true; bool jacobian__ = false; T_ = double; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/model_base_crtp.hpp:115:0:   required from ‘double stan::model::model_base_crtp<M>::log_prob_propto(Eigen::VectorXd&, std::ostream*) const [with M = model_survival_param_namespace::model_survival_param; Eigen::VectorXd = Eigen::Matrix<double, -1, 1>; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/model_base_crtp.hpp:113:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:654:74: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘Eigen::Index Eigen::internal::first_default_aligned(const Eigen::DenseBase<Derived>&) [with Derived = Eigen::CwiseUnaryOp<scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> > >; Eigen::Index = long int]’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:243:63:   required from ‘static Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::Scalar Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::run(const Evaluator&, const Func&, const XprType&) [with XprType = Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> > >; Func = Eigen::internal::scalar_sum_op<double, double>; Evaluator = Eigen::internal::redux_evaluator<Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> > > >; Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:418:56:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::redux(const Func&) const [with BinaryOp = Eigen::internal::scalar_sum_op<double, double>; Derived = Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> > >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:463:25:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::sum() const [with Derived = Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> > >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/fun/sum.hpp:47:15:   required from ‘stan::value_type_t<T> stan::math::sum(const T&) [with T = Eigen::CwiseUnaryOp<Eigen::internal::scalar_log_op<double>, const Eigen::ArrayWrapper<const Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true> > >; stan::require_eigen_vt<std::is_arithmetic, T>* <anonymous> = 0; stan::value_type_t<T> = double]’
/usr/local/lib/R/site-library/StanHeaders/include/stan/math/prim/prob/lognormal_lpdf.hpp:79:16:   required from ‘stan::return_type_t<T, L, U> stan::math::lognormal_lpdf(const T_y&, const T_loc&, const T_scale&) [with bool propto = true; T_y = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>; T_loc = double; T_scale = double; stan::require_all_not_nonscalar_prim_or_rev_kernel_expression_t<T_y, T_scale_succ, T_scale_fail>* <anonymous> = 0; stan::return_type_t<T, L, U> = double]’
stanExports_survival_param.h:1551:0:   required from ‘void model_survival_param_namespace::prior_select_lp(const T0__&, const int&, const T2__&, const T3__&, const T4__&, T_lp__&, T_lp_accum__&, std::ostream*) [with bool propto__ = true; T0__ = Eigen::Block<Eigen::Matrix<double, -1, -1>, -1, 1, true>; T2__ = double; T3__ = double; T4__ = double; T_lp__ = double; T_lp_accum__ = stan::math::accumulator<double>; stan::require_all_t<stan::is_col_vector<Col>, stan::is_vt_not_complex<T0__>, stan::is_stan_scalar<T2__>, stan::is_stan_scalar<T3__>, stan::is_stan_scalar<T4__> >* <anonymous> = 0; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:7480:0:   required from ‘stan::scalar_type_t<T2> model_survival_param_namespace::model_survival_param::log_prob_impl(VecR&, VecI&, std::ostream*) const [with bool propto__ = true; bool jacobian__ = false; VecR = Eigen::Matrix<double, -1, 1>; VecI = Eigen::Matrix<int, -1, 1>; stan::require_vector_like_t<VecR>* <anonymous> = 0; stan::require_vector_like_vt<std::is_integral, VecI>* <anonymous> = 0; stan::scalar_type_t<T2> = double; std::ostream = std::basic_ostream<char>]’
stanExports_survival_param.h:9730:0:   required from ‘T_ model_survival_param_namespace::model_survival_param::log_prob(Eigen::Matrix<T_job_param, -1, 1>&, std::ostream*) const [with bool propto__ = true; bool jacobian__ = false; T_ = double; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/model_base_crtp.hpp:115:0:   required from ‘double stan::model::model_base_crtp<M>::log_prob_propto(Eigen::VectorXd&, std::ostream*) const [with M = model_survival_param_namespace::model_survival_param; Eigen::VectorXd = Eigen::Matrix<double, -1, 1>; std::ostream = std::basic_ostream<char>]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/model/model_base_crtp.hpp:113:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:654:74: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true>, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:172:103:   required from ‘class Eigen::internal::BlockImpl_dense<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true, false>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:154:7:   required from ‘class Eigen::BlockImpl<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Block.h:103:81:   required from ‘class Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:380:43:   [ skipping 15 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:251:64:   required from ‘static void Eigen::internal::generic_product_impl<Lhs, Rhs, Eigen::DenseShape, Eigen::DenseShape, 6>::evalTo(Dst&, const Lhs&, const Rhs&) [with Dst = Eigen::Matrix<double, 1, 1, 0, 1, 1>; Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:124:75:   required from ‘Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::product_evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; int ProductTag = 6; LhsShape = Eigen::DenseShape; RhsShape = Eigen::DenseShape; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Rhs = Eigen::Matrix<double, -1, 1>; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:137:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
   56 |                      >::type PacketReturnType;
      |                              ^~~~~~~~~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:118:37:   required from ‘class Eigen::TransposeImpl<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/GeneralProduct.h:207:43:   required from ‘static void Eigen::internal::gemv_dense_selector<1, StorageOrder, BlasCompatible>::run(const Lhs&, const Rhs&, Dest&, const typename Dest::Scalar&) [with Lhs = Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >; Rhs = Eigen::Matrix<double, -1, -1>; Dest = Eigen::Matrix<double, 1, -1>; int StorageOrder = 0; bool BlasCompatible = true; typename Dest::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:388:34:   [ skipping 15 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:251:64:   required from ‘static void Eigen::internal::generic_product_impl<Lhs, Rhs, Eigen::DenseShape, Eigen::DenseShape, 6>::evalTo(Dst&, const Lhs&, const Rhs&) [with Dst = Eigen::Matrix<double, 1, 1, 0, 1, 1>; Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:124:75:   required from ‘Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::product_evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; int ProductTag = 6; LhsShape = Eigen::DenseShape; RhsShape = Eigen::DenseShape; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Rhs = Eigen::Matrix<double, -1, 1>; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:137:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:118:37:   required from ‘class Eigen::TransposeImpl<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:50:23:   required from ‘static Eigen::internal::dot_nocheck<T, U, true>::ResScalar Eigen::internal::dot_nocheck<T, U, true>::run(const Eigen::MatrixBase<Derived>&, const Eigen::MatrixBase<U>&) [with T = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true>; U = Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>; ResScalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:84:58:   [ skipping 16 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:251:64:   required from ‘static void Eigen::internal::generic_product_impl<Lhs, Rhs, Eigen::DenseShape, Eigen::DenseShape, 6>::evalTo(Dst&, const Lhs&, const Rhs&) [with Dst = Eigen::Matrix<double, 1, 1, 0, 1, 1>; Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:124:75:   required from ‘Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::product_evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; int ProductTag = 6; LhsShape = Eigen::DenseShape; RhsShape = Eigen::DenseShape; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Rhs = Eigen::Matrix<double, -1, 1>; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:137:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:148:7:   required from ‘class Eigen::CwiseBinaryOpImpl<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CwiseBinaryOp.h:77:7:   required from ‘class Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:50:56:   required from ‘static Eigen::internal::dot_nocheck<T, U, true>::ResScalar Eigen::internal::dot_nocheck<T, U, true>::run(const Eigen::MatrixBase<Derived>&, const Eigen::MatrixBase<U>&) [with T = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true>; U = Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>; ResScalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:84:58:   [ skipping 16 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:251:64:   required from ‘static void Eigen::internal::generic_product_impl<Lhs, Rhs, Eigen::DenseShape, Eigen::DenseShape, 6>::evalTo(Dst&, const Lhs&, const Rhs&) [with Dst = Eigen::Matrix<double, 1, 1, 0, 1, 1>; Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:124:75:   required from ‘Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::product_evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; int ProductTag = 6; LhsShape = Eigen::DenseShape; RhsShape = Eigen::DenseShape; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Rhs = Eigen::Matrix<double, -1, 1>; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:137:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<const Eigen::Transpose<const Eigen::Matrix<double, -1, 1> > >, 0>’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:481:7:   required from ‘class Eigen::DenseCoeffsBase<Eigen::Transpose<const Eigen::Transpose<const Eigen::Matrix<double, -1, 1> > >, 2>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseBase.h:41:34:   required from ‘class Eigen::DenseBase<Eigen::Transpose<const Eigen::Transpose<const Eigen::Matrix<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/MatrixBase.h:48:34:   required from ‘class Eigen::MatrixBase<Eigen::Transpose<const Eigen::Transpose<const Eigen::Matrix<double, -1, 1> > > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:118:37:   required from ‘class Eigen::TransposeImpl<const Eigen::Transpose<const Eigen::Matrix<double, -1, 1> >, Eigen::Dense>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Transpose.h:52:37:   required from ‘class Eigen::Transpose<const Eigen::Transpose<const Eigen::Matrix<double, -1, 1> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/util/BlasUtil.h:506:13:   [ skipping 18 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:251:64:   required from ‘static void Eigen::internal::generic_product_impl<Lhs, Rhs, Eigen::DenseShape, Eigen::DenseShape, 6>::evalTo(Dst&, const Lhs&, const Rhs&) [with Dst = Eigen::Matrix<double, 1, 1, 0, 1, 1>; Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:124:75:   required from ‘Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::product_evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; int ProductTag = 6; LhsShape = Eigen::DenseShape; RhsShape = Eigen::DenseShape; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Rhs = Eigen::Matrix<double, -1, 1>; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:137:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:56:30: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h: In instantiation of ‘struct Eigen::internal::evaluator<Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:311:41:   required from ‘struct Eigen::internal::unary_evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, Eigen::internal::IndexBased, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:90:8:   required from ‘struct Eigen::internal::evaluator<Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:100:8:   required from ‘struct Eigen::internal::evaluator<const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> > >’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:739:41:   required from ‘struct Eigen::internal::binary_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >, Eigen::internal::IndexBased, Eigen::internal::IndexBased, double, double>’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:722:8:   [ skipping 21 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:251:64:   required from ‘static void Eigen::internal::generic_product_impl<Lhs, Rhs, Eigen::DenseShape, Eigen::DenseShape, 6>::evalTo(Dst&, const Lhs&, const Rhs&) [with Dst = Eigen::Matrix<double, 1, 1, 0, 1, 1>; Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:124:75:   required from ‘Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::product_evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; int ProductTag = 6; LhsShape = Eigen::DenseShape; RhsShape = Eigen::DenseShape; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Rhs = Eigen::Matrix<double, -1, 1>; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:137:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/CoreEvaluators.h:1071:54: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
 1071 |     PacketAlignment = unpacket_traits<PacketScalar>::alignment,
      |                                                      ^~~~~~~~~
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h: In instantiation of ‘Eigen::Index Eigen::internal::first_default_aligned(const Eigen::DenseBase<Derived>&) [with Derived = Eigen::CwiseBinaryOp<scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >; Eigen::Index = long int]’:
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:243:63:   required from ‘static Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::Scalar Eigen::internal::redux_impl<Func, Evaluator, 3, 0>::run(const Evaluator&, const Func&, const XprType&) [with XprType = Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >; Func = Eigen::internal::scalar_sum_op<double, double>; Evaluator = Eigen::internal::redux_evaluator<Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> > >; Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:418:56:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::redux(const Func&) const [with BinaryOp = Eigen::internal::scalar_sum_op<double, double>; Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Redux.h:463:25:   required from ‘typename Eigen::internal::traits<T>::Scalar Eigen::DenseBase<Derived>::sum() const [with Derived = Eigen::CwiseBinaryOp<Eigen::internal::scalar_conj_product_op<double, double>, const Eigen::Transpose<const Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true> >, const Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true> >; typename Eigen::internal::traits<T>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:50:63:   required from ‘static Eigen::internal::dot_nocheck<T, U, true>::ResScalar Eigen::internal::dot_nocheck<T, U, true>::run(const Eigen::MatrixBase<Derived>&, const Eigen::MatrixBase<U>&) [with T = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true>; U = Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>; ResScalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Dot.h:84:58:   required from ‘typename Eigen::ScalarBinaryOpTraits<typename Eigen::internal::traits<T>::Scalar, typename Eigen::internal::traits<OtherDerived>::Scalar>::ReturnType Eigen::MatrixBase<Derived>::dot(const Eigen::MatrixBase<OtherDerived>&) const [with OtherDerived = Eigen::Block<const Eigen::Matrix<double, -1, -1>, -1, 1, true>; Derived = Eigen::Block<const Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, 1, -1, true>; typename Eigen::ScalarBinaryOpTraits<typename Eigen::internal::traits<T>::Scalar, typename Eigen::internal::traits<OtherDerived>::Scalar>::ReturnType = double; typename Eigen::internal::traits<T>::Scalar = double; typename Eigen::internal::traits<OtherDerived>::Scalar = double]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:380:62:   [ skipping 15 instantiation contexts, use -ftemplate-backtrace-limit=0 to disable ]
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:251:64:   required from ‘static void Eigen::internal::generic_product_impl<Lhs, Rhs, Eigen::DenseShape, Eigen::DenseShape, 6>::evalTo(Dst&, const Lhs&, const Rhs&) [with Dst = Eigen::Matrix<double, 1, 1, 0, 1, 1>; Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:124:75:   required from ‘Eigen::internal::product_evaluator<Eigen::Product<Lhs, Rhs, Option>, ProductTag, LhsShape, RhsShape>::product_evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; int ProductTag = 6; LhsShape = Eigen::DenseShape; RhsShape = Eigen::DenseShape; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Lhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; typename Eigen::internal::traits<typename Eigen::Product<Lhs, Rhs, Option>::Rhs>::Scalar = double; typename Eigen::Product<Lhs, Rhs, Option>::Rhs = Eigen::Matrix<double, -1, 1>; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/ProductEvaluators.h:35:90:   required from ‘Eigen::internal::evaluator<Eigen::Product<Lhs, Rhs, Option> >::evaluator(const XprType&) [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Options = 0; XprType = Eigen::Product<Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>, Eigen::Matrix<double, -1, 1>, 0>]’
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/Product.h:137:22:   required from ‘Eigen::internal::dense_product_base<Lhs, Rhs, Option, 6>::operator const Scalar() const [with Lhs = Eigen::Product<Eigen::CwiseBinaryOp<Eigen::internal::scalar_product_op<double, double>, const Eigen::CwiseNullaryOp<Eigen::internal::scalar_constant_op<double>, const Eigen::Matrix<double, 1, -1> >, const Eigen::Transpose<Eigen::Matrix<double, -1, 1> > >, Eigen::Matrix<double, -1, -1>, 0>; Rhs = Eigen::Matrix<double, -1, 1>; int Option = 0; Scalar = double]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:0:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/usr/local/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:0:   required from here
/usr/local/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:654:74: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  654 |   return internal::first_aligned<int(unpacket_traits<DefaultPacketType>::alignment),Derived>(m);
      |                                                                          ^~~~~~~~~
g++: fatal error: Killed signal terminated program cc1plus
compilation terminated.
make: *** [/opt/R/4.4.0/lib/R/etc/Makeconf:202: stanExports_survival_param.o] Error 1
ERROR: compilation failed for package ‘multinma’
* removing ‘/tmp/workdir/multinma/old/multinma.Rcheck/multinma’


```
# phylosem

<details>

* Version: 1.1.4
* GitHub: https://github.com/James-Thorson-NOAA/phylosem
* Source code: https://github.com/cran/phylosem
* Date/Publication: 2024-04-02 21:15:03 UTC
* Number of recursive dependencies: 214

Run `revdepcheck::cloud_details(, "phylosem")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/phylosem/new/phylosem.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘phylosem/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘phylosem’ version ‘1.1.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘semPlot’

Package which this enhances but not available for checking: ‘DiagrammeR’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘phylosem’ can be installed ... OK
* used C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
* checking installed package size ... NOTE
  installed size is 71.6Mb
  sub-directories of 1Mb or more:
    libs  70.8Mb
* checking package directory ... OK
* checking ‘build’ directory ... OK
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
* checking whether startup messages can be suppressed ... OK
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
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking line endings in Makefiles ... OK
* checking compilation flags in Makevars ... OK
* checking for GNU extensions in Makefiles ... OK
* checking for portable use of $(BLAS_LIBS) and $(LAPACK_LIBS) ... OK
* checking use of PKG_*FLAGS in Makefiles ... OK
* checking compiled code ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/phylosem/old/phylosem.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘phylosem/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘phylosem’ version ‘1.1.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘semPlot’

Package which this enhances but not available for checking: ‘DiagrammeR’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘phylosem’ can be installed ... OK
* used C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
* checking installed package size ... NOTE
  installed size is 71.6Mb
  sub-directories of 1Mb or more:
    libs  70.8Mb
* checking package directory ... OK
* checking ‘build’ directory ... OK
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
* checking whether startup messages can be suppressed ... OK
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
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking line endings in Makefiles ... OK
* checking compilation flags in Makevars ... OK
* checking for GNU extensions in Makefiles ... OK
* checking for portable use of $(BLAS_LIBS) and $(LAPACK_LIBS) ... OK
* checking use of PKG_*FLAGS in Makefiles ... OK
* checking compiled code ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
# psychonetrics

<details>

* Version: 0.13.1
* GitHub: https://github.com/SachaEpskamp/psychonetrics
* Source code: https://github.com/cran/psychonetrics
* Date/Publication: 2025-06-02 13:30:02 UTC
* Number of recursive dependencies: 136

Run `revdepcheck::cloud_details(, "psychonetrics")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/psychonetrics/new/psychonetrics.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘psychonetrics/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘psychonetrics’ version ‘0.13.1’
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘semPlot’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘psychonetrics’ can be installed ... OK
* used C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
* checking installed package size ... NOTE
  installed size is 62.6Mb
  sub-directories of 1Mb or more:
    R      1.5Mb
    libs  60.8Mb
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
* checking whether startup messages can be suppressed ... OK
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
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking line endings in Makefiles ... OK
* checking compilation flags in Makevars ... OK
* checking for GNU extensions in Makefiles ... OK
* checking for portable use of $(BLAS_LIBS) and $(LAPACK_LIBS) ... OK
* checking use of PKG_*FLAGS in Makefiles ... OK
* checking compiled code ... OK
* checking examples ... OK
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/psychonetrics/old/psychonetrics.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘psychonetrics/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘psychonetrics’ version ‘0.13.1’
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘semPlot’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘psychonetrics’ can be installed ... OK
* used C++ compiler: ‘g++ (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
* checking installed package size ... NOTE
  installed size is 62.6Mb
  sub-directories of 1Mb or more:
    R      1.5Mb
    libs  60.8Mb
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
* checking whether startup messages can be suppressed ... OK
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
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking line endings in Makefiles ... OK
* checking compilation flags in Makevars ... OK
* checking for GNU extensions in Makefiles ... OK
* checking for portable use of $(BLAS_LIBS) and $(LAPACK_LIBS) ... OK
* checking use of PKG_*FLAGS in Makefiles ... OK
* checking compiled code ... OK
* checking examples ... OK
* DONE
Status: 2 NOTEs





```
# randomForestSRC

<details>

* Version: 3.4.1
* GitHub: https://github.com/kogalur/randomForestSRC
* Source code: https://github.com/cran/randomForestSRC
* Date/Publication: 2025-06-08 00:00:02 UTC
* Number of recursive dependencies: 156

Run `revdepcheck::cloud_details(, "randomForestSRC")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/randomForestSRC/new/randomForestSRC.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘randomForestSRC/DESCRIPTION’ ... OK
* this is package ‘randomForestSRC’ version ‘3.4.1’
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘imbalance’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘randomForestSRC’ can be installed ... OK
* used C compiler: ‘gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
* checking installed package size ... OK
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
* checking whether startup messages can be suppressed ... OK
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
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking line endings in shell scripts ... OK
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking line endings in Makefiles ... OK
* checking compilation flags in Makevars ... OK
* checking for GNU extensions in Makefiles ... OK
* checking for portable use of $(BLAS_LIBS) and $(LAPACK_LIBS) ... OK
* checking use of PKG_*FLAGS in Makefiles ... OK
* checking compiled code ... OK
* checking examples ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/randomForestSRC/old/randomForestSRC.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘randomForestSRC/DESCRIPTION’ ... OK
* this is package ‘randomForestSRC’ version ‘3.4.1’
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘imbalance’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘randomForestSRC’ can be installed ... OK
* used C compiler: ‘gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0’
* checking installed package size ... OK
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
* checking whether startup messages can be suppressed ... OK
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
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking line endings in shell scripts ... OK
* checking line endings in C/C++/Fortran sources/headers ... OK
* checking line endings in Makefiles ... OK
* checking compilation flags in Makevars ... OK
* checking for GNU extensions in Makefiles ... OK
* checking for portable use of $(BLAS_LIBS) and $(LAPACK_LIBS) ... OK
* checking use of PKG_*FLAGS in Makefiles ... OK
* checking compiled code ... OK
* checking examples ... OK
* DONE
Status: 1 NOTE





```
# semdrw

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/semdrw
* Date/Publication: 2018-11-14 11:00:02 UTC
* Number of recursive dependencies: 118

Run `revdepcheck::cloud_details(, "semdrw")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/semdrw/new/semdrw.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘semdrw/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘semdrw’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/semdrw/old/semdrw.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘semdrw/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘semdrw’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# semptools

<details>

* Version: 0.3.2
* GitHub: https://github.com/sfcheung/semptools
* Source code: https://github.com/cran/semptools
* Date/Publication: 2025-07-12 08:20:02 UTC
* Number of recursive dependencies: 120

Run `revdepcheck::cloud_details(, "semptools")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/semptools/new/semptools.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘semptools/DESCRIPTION’ ... OK
* this is package ‘semptools’ version ‘0.3.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/semptools/old/semptools.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘semptools/DESCRIPTION’ ... OK
* this is package ‘semptools’ version ‘0.3.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# sphereML

<details>

* Version: 0.1.1
* GitHub: https://github.com/santosoph/sphereML
* Source code: https://github.com/cran/sphereML
* Date/Publication: 2025-05-09 17:10:06 UTC
* Number of recursive dependencies: 192

Run `revdepcheck::cloud_details(, "sphereML")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/sphereML/new/sphereML.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘sphereML/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘sphereML’ version ‘0.1.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/sphereML/old/sphereML.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘sphereML/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘sphereML’ version ‘0.1.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# SSVS

<details>

* Version: 2.1.0
* GitHub: https://github.com/sabainter/SSVS
* Source code: https://github.com/cran/SSVS
* Date/Publication: 2025-03-19 16:40:02 UTC
* Number of recursive dependencies: 147

Run `revdepcheck::cloud_details(, "SSVS")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/SSVS/new/SSVS.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘SSVS/DESCRIPTION’ ... OK
* this is package ‘SSVS’ version ‘2.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘BoomSpikeSlab’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/SSVS/old/SSVS.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘SSVS/DESCRIPTION’ ... OK
* this is package ‘SSVS’ version ‘2.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘BoomSpikeSlab’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# streamDAG

<details>

* Version: 1.5-9
* GitHub: NA
* Source code: https://github.com/cran/streamDAG
* Date/Publication: 2025-01-14 21:50:02 UTC
* Number of recursive dependencies: 137

Run `revdepcheck::cloud_details(, "streamDAG")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/streamDAG/new/streamDAG.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘streamDAG/DESCRIPTION’ ... OK
* this is package ‘streamDAG’ version ‘1.5-9’
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
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘streamDAG/DESCRIPTION’ ... OK
* this is package ‘streamDAG’ version ‘1.5-9’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘asbio’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# Surrogate

<details>

* Version: 3.4.1
* GitHub: https://github.com/florianstijven/Surrogate-development
* Source code: https://github.com/cran/Surrogate
* Date/Publication: 2025-04-29 04:40:02 UTC
* Number of recursive dependencies: 189

Run `revdepcheck::cloud_details(, "Surrogate")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/Surrogate/new/Surrogate.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Surrogate/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘Surrogate’ version ‘3.4.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘MBESS’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/Surrogate/old/Surrogate.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Surrogate/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘Surrogate’ version ‘3.4.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘MBESS’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# TELP

<details>

* Version: 1.0.3
* GitHub: NA
* Source code: https://github.com/cran/TELP
* Date/Publication: 2025-05-09 15:00:05 UTC
* Number of recursive dependencies: 107

Run `revdepcheck::cloud_details(, "TELP")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/TELP/new/TELP.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘TELP/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘TELP’ version ‘1.0.3’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'arules', 'arulesViz'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/TELP/old/TELP.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘TELP/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘TELP’ version ‘1.0.3’
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'arules', 'arulesViz'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# TestAnaAPP

<details>

* Version: 1.1.2
* GitHub: https://github.com/jiangyouxiang/TestAnaAPP
* Source code: https://github.com/cran/TestAnaAPP
* Date/Publication: 2024-11-09 04:00:02 UTC
* Number of recursive dependencies: 259

Run `revdepcheck::cloud_details(, "TestAnaAPP")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/TestAnaAPP/new/TestAnaAPP.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘TestAnaAPP/DESCRIPTION’ ... OK
* this is package ‘TestAnaAPP’ version ‘1.1.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/TestAnaAPP/old/TestAnaAPP.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘TestAnaAPP/DESCRIPTION’ ... OK
* this is package ‘TestAnaAPP’ version ‘1.1.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘semPlot’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# tidybins

<details>

* Version: 0.1.1
* GitHub: https://github.com/Harrison4192/tidybins
* Source code: https://github.com/cran/tidybins
* Date/Publication: 2024-06-12 04:50:02 UTC
* Number of recursive dependencies: 222

Run `revdepcheck::cloud_details(, "tidybins")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/tidybins/new/tidybins.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidybins/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘tidybins’ version ‘0.1.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘arulesCBA’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘tidybins’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
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
* checking dependencies in R code ... NOTE
Namespaces in Imports field not imported from:
  ‘badger’ ‘ggplot2’ ‘lubridate’ ‘scales’ ‘xgboost’
  All declared Imports should be used.
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘arulesCBA’
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 3 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/tidybins/old/tidybins.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidybins/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘tidybins’ version ‘0.1.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
Package suggested but not available for checking: ‘arulesCBA’
* checking if this is a source package ... OK
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘tidybins’ can be installed ... OK
* checking installed package size ... OK
* checking package directory ... OK
* checking ‘build’ directory ... OK
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
* checking dependencies in R code ... NOTE
Namespaces in Imports field not imported from:
  ‘badger’ ‘ggplot2’ ‘lubridate’ ‘scales’ ‘xgboost’
  All declared Imports should be used.
* checking S3 generic/method consistency ... OK
* checking replacement functions ... OK
* checking foreign function calls ... OK
* checking R code for possible problems ... OK
* checking Rd files ... OK
* checking Rd metadata ... OK
* checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘arulesCBA’
* checking for missing documentation entries ... OK
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking installed files from ‘inst/doc’ ... OK
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 3 NOTEs





```
# tidycomm

<details>

* Version: 0.4.2
* GitHub: https://github.com/tidycomm/tidycomm
* Source code: https://github.com/cran/tidycomm
* Date/Publication: 2025-08-27 12:00:02 UTC
* Number of recursive dependencies: 136

Run `revdepcheck::cloud_details(, "tidycomm")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/tidycomm/new/tidycomm.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidycomm/DESCRIPTION’ ... OK
* this is package ‘tidycomm’ version ‘0.4.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘MBESS’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/tidycomm/old/tidycomm.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.2 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidycomm/DESCRIPTION’ ... OK
* this is package ‘tidycomm’ version ‘0.4.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘MBESS’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
