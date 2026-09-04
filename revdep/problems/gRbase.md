# gRbase (2.0.3)

* Email: <mailto:sorenh@math.aau.dk>
* GitHub mirror: <https://github.com/cran/gRbase>

Run `revdepcheck::revdep_details(, "gRbase")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: edge_matrix
     > ### Title: Coerce dag to edge matrix
     > ### Aliases: edge_matrix dag2edge_matrix edge_matrix2dag
     > 
     > ### ** Examples
     > 
     > g <- dag(~x2|x1 + x3|x1:x2 + x4|x3)
     Error:
     ! The `edges` argument of `make_graph()` supplied as a matrix should be
       a n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─gRbase::dag(~x2 | x1 + x3 | x1:x2 + x4 | x3)
      2.   └─gRbase::dagList(list(...), result = result, forceCheck = forceCheck)
      3.     └─gRbase::g_dagl2ig_(x, vn)
      4.       └─gRbase:::dag_list2igraph(zz)
      5.         └─igraph::make_graph(em, isolates = iso, directed = TRUE)
      6.           └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      7.             └─lifecycle::deprecate_stop(...)
      8.               └─lifecycle:::deprecate_stop0(msg)
      9.                 └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     ---
     Backtrace:
         ▆
      1. └─gRbase::ug(~a:b, ~b:c:d, ~e)
      2.   └─gRbase::ugList(list(...), result = result)
      3.     └─gRbase::g_ugl2ig_(x, vn)
      4.       └─gRbase:::ug_list2igraph(zz)
      5.         └─igraph::make_graph(em, isolates = iso, directed = FALSE)
      6.           └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      7.             └─lifecycle::deprecate_stop(...)
      8.               └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'graphs.rmd' failed with diagnostics:
     The `edges` argument of `make_graph()` supplied as a matrix should be a
     n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     --- failed re-building ‘graphs.rmd’
     
     SUMMARY: processing the following file failed:
       ‘graphs.rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

## In both

*   checking whether package ‘gRbase’ can be installed ... WARNING
     ```
     Found the following significant warnings:
       'Rcpp:::LdFlags' has not been needed since 2013 (!!) and may get removed in 2027. Please update your 'Makevars'.
       'RcppLdFlags' has not been needed since 2013 (!!) and may get removed in 2027. Please update your 'Makevars'.
     See ‘<lib>/gRbase.Rcheck/00install.out’ for details.
     ```

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

