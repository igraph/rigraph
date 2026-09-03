# gor (2.0)

* Email: <mailto:casencha@unizar.es>
* GitHub mirror: <https://github.com/cran/gor>

Run `revdepcheck::revdep_details(, "gor")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     The following object is masked from ‘package:base’:
     
         union
     
     > g <- make_graph("Dodecahedron")
     > eG <- as_edgelist(g)
     > set.seed(1)
     > v <- sample(0:1, gsize(g), replace = TRUE) # Random edge vector
     > apply_incidence_map(eG, v) # 1 1 0 1 2 0 1 1 3 2 0 1 1 1 1 1 0 0 1 2
      [1] 1 1 0 1 2 0 1 1 3 2 0 1 1 1 1 1 0 0 1 2
     > ## Plotting the associated subgraph
     > h <- make_graph(t(eG[v==1,]))
     Error:
     ! The `edges` argument of `make_graph()` supplied as a matrix should be
       a n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─igraph::make_graph(t(eG[v == 1, ]))
      2.   └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      3.     └─lifecycle::deprecate_stop(...)
      4.       └─lifecycle:::deprecate_stop0(msg)
      5.         └─rlang::cnd_signal(...)
     Execution halted
     ```

