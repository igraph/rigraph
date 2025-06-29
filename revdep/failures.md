# bnlearn

<details>

* Version: 5.0.2
* GitHub: NA
* Source code: https://github.com/cran/bnlearn
* Date/Publication: 2025-01-07 14:40:05 UTC
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
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/is.dag.c -o graphs/is.dag.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/path.c -o graphs/path.o
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
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/likelihood.weighting.c -o inference/likelihood.weighting.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/common.c -o inference/loglikelihood/common.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/discrete.c -o inference/loglikelihood/discrete.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/gaussian.c -o inference/loglikelihood/gaussian.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/conditional.gaussian.c -o inference/loglikelihood/conditional.gaussian.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loss.c -o inference/loss.o
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
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/discrete/classic_discrete.c -o parameters/discrete/classic_discrete.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/discrete/hierarchical_dirichlet.c -o parameters/discrete/hierarchical_dirichlet.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/classic_discrete.c -o parameters/rinterface/classic_discrete.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/hierarchical_dirichlet.c -o parameters/rinterface/hierarchical_dirichlet.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/mixture_ordinary_least_squares.c -o parameters/rinterface/mixture_ordinary_least_squares.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/ordinary_least_squares.c -o parameters/rinterface/ordinary_least_squares.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c predict/map.lw.c -o predict/map.lw.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c predict/predict.c -o predict/predict.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c preprocessing/dedup.c -o preprocessing/dedup.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c preprocessing/discretize.c -o preprocessing/discretize.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c preprocessing/enums.c -o preprocessing/enums.o
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
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/nml_regret.c -o scores/nml_regret.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/nml_regret_table.c -o scores/nml_regret_table.o
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
gcc -std=gnu17 -shared -L/opt/R/4.4.0/lib/R/lib -L/usr/local/lib -o bnlearn.so arcs/arcs2amat.o arcs/arcs2elist.o arcs/bind.o arcs/filter.arcs.o arcs/hash.o arcs/is.row.equal.o bnlearn/bayesian.network.o bnlearn/bn.recovery.o bnlearn/cache.structure.o bnlearn/cextend.o bnlearn/colliders.o bnlearn/cpdag.o bnlearn/fitted.o bnlearn/nparams.o bnlearn/shd.o core/allocations.o core/contingency.tables.o core/correlation.o core/covariance.matrix.o core/data.table.o core/math.functions.o core/moments.o core/sampling.o core/sets.o core/sort.o core/uppertriangular.o fitted/enums.o fitted/fitted.o fitted/nparams.o fitted/rinterface/nparams.o foreign/parse.o globals.o graphs/acyclic.o graphs/is.dag.o graphs/path.o graphs/pdag2dag.o graphs/random/graph.generation.o graphs/topological.ordering.o inference/likelihood.weighting.o inference/loglikelihood/common.o inference/loglikelihood/discrete.o inference/loglikelihood/gaussian.o inference/loglikelihood/conditional.gaussian.o inference/loss.o inference/rbn.o inference/rinterface/loglikelihood.o inference/rinterface/cpdist.o inference/rinterface/rbn.o inference/rinterface/likelihood.weighting.o learning/averaging/averaging.o learning/averaging/bootstrap.o learning/local/mi.matrix.o learning/score/hc.cache.lookup.o learning/score/score.delta.o learning/score/tabu.o math/conditional.least.squares.o math/least.squares.o math/linear.algebra.o minimal/common.o minimal/data.frame.o minimal/strings.o minimal/table.o minimal/tiers.o minimal/unique.o parameters/discrete/classic_discrete.o parameters/discrete/hierarchical_dirichlet.o parameters/rinterface/classic_discrete.o parameters/rinterface/hierarchical_dirichlet.o parameters/rinterface/mixture_ordinary_least_squares.o parameters/rinterface/ordinary_least_squares.o predict/map.lw.o predict/predict.o preprocessing/dedup.o preprocessing/discretize.o preprocessing/enums.o sanitization/cg.assumptions.o sanitization/covariance.o sanitization/data.o scores/alpha.star.o scores/cg.loglikelihood.o scores/cg.predictive.loglikelihood.o scores/cg.nal.o scores/custom.score.o scores/dirichlet.averaged.posterior.o scores/dirichlet.posterior.o scores/discrete.loglikelihood.o scores/discrete.nal.o scores/discrete.predictive.loglikelihood.o scores/enum.o scores/gaussian.loglikelihood.o scores/gaussian.nal.o scores/gaussian.predictive.loglikelihood.o scores/graph.priors.o scores/nml_regret.o scores/nml_regret_table.o scores/normalized.maximum.likelihood.o scores/per.node.score.o scores/wishart.posterior.o test.counter.o tests/conditional.gaussian/cg.mutual.information.o tests/discrete/df.adjust.o tests/discrete/discrete.tests.o tests/discrete/jonckheere.o tests/discrete/shrinkage.o tests/enums.o tests/gaussian/df.adjust.o tests/gaussian/gaussian.tests.o tests/gaussian/shrinkage.o tests/omnibus/custom.test.o tests/patterns/allsubs.test.o tests/patterns/ctest.o tests/patterns/roundrobin.test.o tests/patterns/utest.o tests/permutation/discrete.monte.carlo.o tests/permutation/gaussian.monte.carlo.o tests/rinterface/allsubs.test.o tests/rinterface/ctest.o tests/rinterface/htest.o tests/rinterface/indep.test.o tests/rinterface/roundrobin.test.o tests/rinterface/utest.o -llapack -lblas -lgfortran -lm -lquadmath -L/opt/R/4.4.0/lib/R/lib -lR
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
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/is.dag.c -o graphs/is.dag.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c graphs/path.c -o graphs/path.o
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
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/likelihood.weighting.c -o inference/likelihood.weighting.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/common.c -o inference/loglikelihood/common.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/discrete.c -o inference/loglikelihood/discrete.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/gaussian.c -o inference/loglikelihood/gaussian.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loglikelihood/conditional.gaussian.c -o inference/loglikelihood/conditional.gaussian.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c inference/loss.c -o inference/loss.o
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
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/discrete/classic_discrete.c -o parameters/discrete/classic_discrete.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/discrete/hierarchical_dirichlet.c -o parameters/discrete/hierarchical_dirichlet.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/classic_discrete.c -o parameters/rinterface/classic_discrete.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/hierarchical_dirichlet.c -o parameters/rinterface/hierarchical_dirichlet.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/mixture_ordinary_least_squares.c -o parameters/rinterface/mixture_ordinary_least_squares.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c parameters/rinterface/ordinary_least_squares.c -o parameters/rinterface/ordinary_least_squares.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c predict/map.lw.c -o predict/map.lw.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c predict/predict.c -o predict/predict.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c preprocessing/dedup.c -o preprocessing/dedup.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c preprocessing/discretize.c -o preprocessing/discretize.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c preprocessing/enums.c -o preprocessing/enums.o
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
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/nml_regret.c -o scores/nml_regret.o
gcc -std=gnu17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c scores/nml_regret_table.c -o scores/nml_regret_table.o
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
gcc -std=gnu17 -shared -L/opt/R/4.4.0/lib/R/lib -L/usr/local/lib -o bnlearn.so arcs/arcs2amat.o arcs/arcs2elist.o arcs/bind.o arcs/filter.arcs.o arcs/hash.o arcs/is.row.equal.o bnlearn/bayesian.network.o bnlearn/bn.recovery.o bnlearn/cache.structure.o bnlearn/cextend.o bnlearn/colliders.o bnlearn/cpdag.o bnlearn/fitted.o bnlearn/nparams.o bnlearn/shd.o core/allocations.o core/contingency.tables.o core/correlation.o core/covariance.matrix.o core/data.table.o core/math.functions.o core/moments.o core/sampling.o core/sets.o core/sort.o core/uppertriangular.o fitted/enums.o fitted/fitted.o fitted/nparams.o fitted/rinterface/nparams.o foreign/parse.o globals.o graphs/acyclic.o graphs/is.dag.o graphs/path.o graphs/pdag2dag.o graphs/random/graph.generation.o graphs/topological.ordering.o inference/likelihood.weighting.o inference/loglikelihood/common.o inference/loglikelihood/discrete.o inference/loglikelihood/gaussian.o inference/loglikelihood/conditional.gaussian.o inference/loss.o inference/rbn.o inference/rinterface/loglikelihood.o inference/rinterface/cpdist.o inference/rinterface/rbn.o inference/rinterface/likelihood.weighting.o learning/averaging/averaging.o learning/averaging/bootstrap.o learning/local/mi.matrix.o learning/score/hc.cache.lookup.o learning/score/score.delta.o learning/score/tabu.o math/conditional.least.squares.o math/least.squares.o math/linear.algebra.o minimal/common.o minimal/data.frame.o minimal/strings.o minimal/table.o minimal/tiers.o minimal/unique.o parameters/discrete/classic_discrete.o parameters/discrete/hierarchical_dirichlet.o parameters/rinterface/classic_discrete.o parameters/rinterface/hierarchical_dirichlet.o parameters/rinterface/mixture_ordinary_least_squares.o parameters/rinterface/ordinary_least_squares.o predict/map.lw.o predict/predict.o preprocessing/dedup.o preprocessing/discretize.o preprocessing/enums.o sanitization/cg.assumptions.o sanitization/covariance.o sanitization/data.o scores/alpha.star.o scores/cg.loglikelihood.o scores/cg.predictive.loglikelihood.o scores/cg.nal.o scores/custom.score.o scores/dirichlet.averaged.posterior.o scores/dirichlet.posterior.o scores/discrete.loglikelihood.o scores/discrete.nal.o scores/discrete.predictive.loglikelihood.o scores/enum.o scores/gaussian.loglikelihood.o scores/gaussian.nal.o scores/gaussian.predictive.loglikelihood.o scores/graph.priors.o scores/nml_regret.o scores/nml_regret_table.o scores/normalized.maximum.likelihood.o scores/per.node.score.o scores/wishart.posterior.o test.counter.o tests/conditional.gaussian/cg.mutual.information.o tests/discrete/df.adjust.o tests/discrete/discrete.tests.o tests/discrete/jonckheere.o tests/discrete/shrinkage.o tests/enums.o tests/gaussian/df.adjust.o tests/gaussian/gaussian.tests.o tests/gaussian/shrinkage.o tests/omnibus/custom.test.o tests/patterns/allsubs.test.o tests/patterns/ctest.o tests/patterns/roundrobin.test.o tests/patterns/utest.o tests/permutation/discrete.monte.carlo.o tests/permutation/gaussian.monte.carlo.o tests/rinterface/allsubs.test.o tests/rinterface/ctest.o tests/rinterface/htest.o tests/rinterface/indep.test.o tests/rinterface/roundrobin.test.o tests/rinterface/utest.o -llapack -lblas -lgfortran -lm -lquadmath -L/opt/R/4.4.0/lib/R/lib -lR
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
# RSP

<details>

* Version: 0.4
* GitHub: NA
* Source code: https://github.com/cran/RSP
* Date/Publication: 2023-09-24 21:00:02 UTC
* Number of recursive dependencies: 239

Run `revdepcheck::cloud_details(, "RSP")` for more info

</details>

## In both

*   checking whether package ‘RSP’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/RSP/new/RSP.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘RSP’ ...
** package ‘RSP’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘OpenMx’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘RSP’
* removing ‘/tmp/workdir/RSP/new/RSP.Rcheck/RSP’


```
### CRAN

```
* installing *source* package ‘RSP’ ...
** package ‘RSP’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘OpenMx’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘RSP’
* removing ‘/tmp/workdir/RSP/old/RSP.Rcheck/RSP’


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
