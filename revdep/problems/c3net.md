# c3net (1.1.1.1)

* Email: <mailto:altayscience@gmail.com>
* GitHub mirror: <https://github.com/cran/c3net>

Run `revdepcheck::revdep_details(, "c3net")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > 
     > net <- c3net(expdata, network=TRUE)
     Warning: `graph.adjacency()` was deprecated in igraph 2.0.0.
     ℹ Please use `graph_from_adjacency_matrix()` instead.
     ℹ The deprecated feature was likely used in the c3net package.
       Please report the issue to the authors.
     Warning: `get.edgelist()` was deprecated in igraph 2.0.0.
     ℹ Please use `as_edgelist()` instead.
     ℹ The deprecated feature was likely used in the c3net package.
       Please report the issue to the authors.
     Warning: `graph.edgelist()` was deprecated in igraph 2.0.0.
     ℹ Please use `graph_from_edgelist()` instead.
     ℹ The deprecated feature was likely used in the c3net package.
       Please report the issue to the authors.
     Error:
     ! `tkplot()` was deprecated in igraph 3.0.0 and is now defunct.
     Backtrace:
         ▆
      1. └─c3net::c3net(expdata, network = TRUE)
      2.   └─c3net::netplot(net)
      3.     └─igraph::tkplot(z)
      4.       └─lifecycle::deprecate_stop("3.0.0", "tkplot()")
      5.         └─lifecycle:::deprecate_stop0(msg)
      6.           └─rlang::cnd_signal(...)
     Execution halted
     ```

