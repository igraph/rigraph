# simcausal (0.5.7)

* GitHub: <https://github.com/osofr/simcausal>
* Email: <mailto:fgruber@gmail.com>
* GitHub mirror: <https://github.com/cran/simcausal>

Run `revdepcheck::revdep_details(, "simcausal")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     ℹ The deprecated feature was likely used in the simcausal package.
       Please report the issue at <https://github.com/osofr/simcausal/issues>.
     Warning: `add.vertices()` was deprecated in igraph 2.0.0.
     ℹ Please use `add_vertices()` instead.
     ℹ The deprecated feature was likely used in the simcausal package.
       Please report the issue at <https://github.com/osofr/simcausal/issues>.
     Warning: `add.edges()` was deprecated in igraph 2.0.0.
     ℹ Please use `add_edges()` instead.
     ℹ The deprecated feature was likely used in the simcausal package.
       Please report the issue at <https://github.com/osofr/simcausal/issues>.
     Error:
     ! The `edges` argument of `add_edges()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─simcausal::plotDAG(Dset)
      2.   └─igraph::add.edges(...)
      3.     └─igraph::add_edges(...)
      4.       └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      5.         └─lifecycle::deprecate_stop(...)
      6.           └─lifecycle:::deprecate_stop0(msg)
      7.             └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
        
       1 Test Suite : 
       simcausal unit testing - 28 test functions, 3 errors, 0 failures
       ERROR in test.latent: Error : The `edges` argument of `add_edges()` supplied as a matrix should be a n
       times 2 matrix, not 2 times n as of igraph 2.1.5.
       ℹ either transpose the matrix with t() or convert it to a data.frame with two
         columns.
       ERROR in test.set.DAG_DAG2b_newactions: Error : The `edges` argument of `add_edges()` supplied as a matrix should be a n
       times 2 matrix, not 2 times n as of igraph 2.1.5.
       ℹ either transpose the matrix with t() or convert it to a data.frame with two
         columns.
       ERROR in test.MV: Error : The `edges` argument of `add_edges()` supplied as a matrix should be a n
       times 2 matrix, not 2 times n as of igraph 2.1.5.
       ℹ either transpose the matrix with t() or convert it to a data.frame with two
         columns.
       Error: 
       
       unit testing failed (#test failures: 0, #R errors: 3)
       
       In addition: Warning messages:
       1: In RNGkind(kind = testSuite$rngKind, normal.kind = testSuite$rngNormalKind) :
         RNGkind: Marsaglia-Multicarry has poor statistical properties
       2: In RNGkind(kind = testSuite$rngKind, normal.kind = testSuite$rngNormalKind) :
         RNGkind: severe deviations from normality for Kinderman-Ramage + Marsaglia-Multicarry
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     ! The `edges` argument of `add_edges()` supplied as a matrix should be a n times 2
       matrix, not 2 times n as of igraph 2.1.5.
     i either transpose the matrix with t() or convert it to a data.frame with two columns.
     ---
     Backtrace:
         x
      1. \-simcausal::plotDAG(...)
      2.   \-igraph::add.edges(...)
      3.     \-igraph::add_edges(...)
      4.       \-igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      5.         \-lifecycle::deprecate_stop(...)
      6.           \-lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'simcausalVignette.Rnw' failed with diagnostics:
     The `edges` argument of `add_edges()` supplied as a matrix should be a n times 2
     matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two columns.
     --- failed re-building ‘simcausalVignette.Rnw’
     
     SUMMARY: processing the following file failed:
       ‘simcausalVignette.Rnw’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

