# gRim (0.3.4)

* Email: <mailto:sorenh@math.aau.dk>
* GitHub mirror: <https://github.com/cran/gRim>

Run `revdepcheck::revdep_details(, "gRim")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > data(milkcomp1)
     > ciTest(milkcomp1, set=~tre + fat + pro)
     Error:
     ! The `edges` argument of `make_graph()` supplied as a matrix should be
       a n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
          ▆
       1. ├─gRim::ciTest(milkcomp1, set = ~tre + fat + pro)
       2. └─gRim:::ciTest.data.frame(milkcomp1, set = ~tre + fat + pro)
       3.   └─gRim::ciTest_df(x, set, ...)
       4.     └─gRim:::.ciTest_df_internal(wdata, set, ...)
       5.       └─gRim::mmod(list(set), data = x)
       6.         └─gRim:::.mModel_finalize(flist$glist, varNames, datainfo)
       7.           └─gRbase::ug(glist)
       8.             └─gRbase::ugList(list(...), result = result)
       9.               └─gRbase::g_ugl2ig_(x, vn)
      10.                 └─gRbase:::ug_list2igraph(zz)
      11.                   └─igraph::make_graph(em, isolates = iso, directed = FALSE)
      12.                     └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      13.                       └─lifecycle::deprecate_stop(...)
      14.                         └─lifecycle:::deprecate_stop0(msg)
      15.                           └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-misc.R:21:5'): dmod() ──────────────────────────────────────────
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: The `edges` argument of `make_graph()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
       ℹ either transpose the matrix with t() or convert it to a data.frame with two
         columns.
       Backtrace:
            ▆
         1. └─gRim::dmod(~.^., data = df) at test-misc.R:21:5
         2.   └─gRim:::.dModel_finalize(mod_form$glist, varNames)
         3.     └─gRbase::ug(glist)
         4.       └─gRbase::ugList(list(...), result = result)
         5.         └─gRbase::g_ugl2ig_(x, vn)
         6.           └─gRbase:::ug_list2igraph(zz)
         7.             └─igraph::make_graph(em, isolates = iso, directed = FALSE)
         8.               └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
         9.                 └─lifecycle::deprecate_stop(...)
        10.                   └─lifecycle:::deprecate_stop0(msg)
        11.                     └─rlang::cnd_signal(...)
       
       [ FAIL 1 | WARN 1 | SKIP 0 | PASS 0 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
          ▆
       1. └─gRim::dmod(...)
       2.   └─gRim:::.dModel_finalize(mod_form$glist, varNames)
       3.     └─gRbase::ug(glist)
       4.       └─gRbase::ugList(list(...), result = result)
       5.         └─gRbase::g_ugl2ig_(x, vn)
       6.           └─gRbase:::ug_list2igraph(zz)
       7.             └─igraph::make_graph(em, isolates = iso, directed = FALSE)
       8.               └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
       9.                 └─lifecycle::deprecate_stop(...)
      10.                   └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'grim.rmd' failed with diagnostics:
     The `edges` argument of `make_graph()` supplied as a matrix should be a n
     times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     --- failed re-building ‘grim.rmd’
     
     SUMMARY: processing the following file failed:
       ‘grim.rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

## In both

*   checking whether package ‘gRim’ can be installed ... WARNING
     ```
     Found the following significant warnings:
       'Rcpp:::LdFlags' has not been needed since 2013 (!!) and may get removed in 2027. Please update your 'Makevars'.
       'RcppLdFlags' has not been needed since 2013 (!!) and may get removed in 2027. Please update your 'Makevars'.
     See ‘<lib>/gRim.Rcheck/00install.out’ for details.
     ```

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

