# gRain (1.4.6)

* Email: <mailto:sorenh@math.aau.dk>
* GitHub mirror: <https://github.com/cran/gRain>

Run `revdepcheck::revdep_details(, "gRain")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > ### ** Examples
     > 
     > 
     > ## Extract cpts / clique potentials from data and graph
     > # specification and create network. There are different ways:
     > 
     > data(lizard, package="gRbase")
     > 
     > # DAG: height <- species -> diam
     > daG <- dag(~species + height:species + diam:species, result="igraph")
     Error:
     ! The `edges` argument of `make_graph()` is not allowed to be a 2 times
       2 matrix as of igraph 2.1.5.
     Backtrace:
         ▆
      1. └─gRbase::dag(~species + height:species + diam:species, result = "igraph")
      2.   └─gRbase::dagList(list(...), result = result, forceCheck = forceCheck)
      3.     └─gRbase::g_dagl2ig_(x, vn)
      4.       └─gRbase:::dag_list2igraph(zz)
      5.         └─igraph::make_graph(em, isolates = iso, directed = TRUE)
      6.           └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      7.             └─lifecycle::deprecate_stop("2.1.5", paste0(fn, "(", arg, " = 'is not allowed to be a 2 times 2 matrix')"))
      8.               └─lifecycle:::deprecate_stop0(msg)
      9.                 └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-misc.R:14:1'): (code run outside of `test_that()`) ─────────────
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: The `edges` argument of `make_graph()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
       ℹ either transpose the matrix with t() or convert it to a data.frame with two
         columns.
       Backtrace:
            ▆
         1. └─gRain::compile_cpt(cpt_list) at test-misc.R:14:1
         2.   └─gRain:::compile_cpt_worker(args, forceCheck = forceCheck)
         3.     └─gRbase::dagList(vp, forceCheck = forceCheck, result = "igraph")
         4.       └─gRbase::g_dagl2ig_(x, vn)
         5.         └─gRbase:::dag_list2igraph(zz)
         6.           └─igraph::make_graph(em, isolates = iso, directed = TRUE)
         7.             └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
         8.               └─lifecycle::deprecate_stop(...)
         9.                 └─lifecycle:::deprecate_stop0(msg)
        10.                   └─rlang::cnd_signal(...)
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 0 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     Backtrace:
         ▆
      1. └─gRain::compile_cpt(cpt_list)
      2.   └─gRain:::compile_cpt_worker(args, forceCheck = forceCheck)
      3.     └─gRbase::dagList(vp, forceCheck = forceCheck, result = "igraph")
      4.       └─gRbase::g_dagl2ig_(x, vn)
      5.         └─gRbase:::dag_list2igraph(zz)
      6.           └─igraph::make_graph(em, isolates = iso, directed = TRUE)
      7.             └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      8.               └─lifecycle::deprecate_stop(...)
      9.                 └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'grain.rmd' failed with diagnostics:
     The `edges` argument of `make_graph()` supplied as a matrix should be a n
     times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     --- failed re-building ‘grain.rmd’
     
     SUMMARY: processing the following file failed:
       ‘grain.rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

