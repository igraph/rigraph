# movecost (3.0.0)

* Email: <mailto:gianmarcoalberti@gmail.com>
* GitHub mirror: <https://github.com/cran/movecost>

Run `revdepcheck::revdep_details(, "movecost")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: mc_accum
     > ### Title: Accumulated cost surface and isolines around one or more origins
     > ### Aliases: mc_accum
     > 
     > ### ** Examples
     > 
     > dtm <- mc_volc()
     > start <- mc_volc_loc()
     > 
     > surf <- mc_surface(dtm, funct = "t", move = 8)
     Error:
     ! The `edges` argument of `add_edges()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─movecost::mc_surface(dtm, funct = "t", move = 8)
      2.   └─igraph::add_edges(g, rbind(from[pos], to[pos]), weight = w)
      3.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      4.       └─lifecycle::deprecate_stop(...)
      5.         └─lifecycle:::deprecate_stop0(msg)
      6.           └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
       Backtrace:
           ▆
        1. └─movecost::mc_surface(dtm, funct = "t", move = 8) at test-interface.R:117:3
        2.   └─igraph::add_edges(g, rbind(from[pos], to[pos]), weight = w)
        3.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
        4.       └─lifecycle::deprecate_stop(...)
        5.         └─lifecycle:::deprecate_stop0(msg)
        6.           └─rlang::cnd_signal(...)
       ── Error ('test-interface.R:125:3'): boundary polygons carry exact area and perimeter ──
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: The `edges` argument of `add_edges()` supplied as a matrix should be a n times 2 matrix, not 2 times n as of igraph 2.1.5.
       i either transpose the matrix with t() or convert it to a data.frame with two columns.
       Backtrace:
           ▆
        1. └─movecost::mc_surface(dtm, funct = "t", move = 8) at test-interface.R:125:3
        2.   └─igraph::add_edges(g, rbind(from[pos], to[pos]), weight = w)
        3.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
        4.       └─lifecycle::deprecate_stop(...)
        5.         └─lifecycle:::deprecate_stop0(msg)
        6.           └─rlang::cnd_signal(...)
       
       [ FAIL 24 | WARN 0 | SKIP 0 | PASS 80 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     ---
     Backtrace:
         ▆
      1. └─movecost::mc_surface(dtm, funct = "t", move = 16)
      2.   └─igraph::add_edges(g, rbind(from[pos], to[pos]), weight = w)
      3.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      4.       └─lifecycle::deprecate_stop(...)
      5.         └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'movecost.Rmd' failed with diagnostics:
     The `edges` argument of `add_edges()` supplied as a matrix should be a n
     times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     --- failed re-building ‘movecost.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘movecost.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

