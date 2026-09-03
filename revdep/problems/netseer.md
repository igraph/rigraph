# netseer (0.1.3)

* Email: <mailto:sevvandik@gmail.com>
* GitHub mirror: <https://github.com/cran/netseer>

Run `revdepcheck::revdep_details(, "netseer")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: generate_graph_linear
     > ### Title: Generates a bigger graph by linear growth.
     > ### Aliases: generate_graph_linear
     > 
     > ### ** Examples
     > 
     > set.seed(1)
     > gr <- generate_graph_linear()
     Error:
     ! The `edges` argument of `add_edges()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─netseer::generate_graph_linear()
      2.   └─igraph:::`+.igraph`(gr3, igraph::edge(rbind(e1, e2)))
      3.     └─igraph::add_edges(e1, unnamed[[1]], attr = attr)
      4.       └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      5.         └─lifecycle::deprecate_stop(...)
      6.           └─lifecycle:::deprecate_stop0(msg)
      7.             └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
       columns.
     ---
     Backtrace:
         ▆
      1. └─netseer::predict_graph(graphlist[1:15], h = 1)
      2.   └─netseer:::predict_graph_internal(...)
      3.     └─netseer:::construct_union_graph(...)
      4.       └─igraph::add_edges(biggr, non_edges, weight = new_weights)
      5.         └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      6.           └─lifecycle::deprecate_stop(...)
      7.             └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'netseer.Rmd' failed with diagnostics:
     The `edges` argument of `add_edges()` supplied as a matrix should be a n
     times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     --- failed re-building ‘netseer.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘netseer.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

