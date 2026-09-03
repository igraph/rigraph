# cia (1.0.0)

* GitHub: <https://github.com/SpaceOdyssey/cia>
* Email: <mailto:mathew.varidel@sydney.edu.au>
* GitHub mirror: <https://github.com/cran/cia>

Run `revdepcheck::revdep_details(, "cia")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > ### ** Examples
     > 
     > data <- bnlearn::learning.test
     > 
     > dag <- UniformlySampleDAG(colnames(data))
     Loading required namespace: igraph
     Error:
     ! The `edges` argument of `add_edges()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
          ▆
       1. └─cia::UniformlySampleDAG(colnames(data))
       2.   ├─cia::toMatrix(bnlearn::random.graph(nodes, method = "melancon"))
       3.   └─cia:::toMatrix.bn(bnlearn::random.graph(nodes, method = "melancon"))
       4.     ├─cia::toMatrix(bnlearn::as.igraph(network))
       5.     ├─bnlearn::as.igraph(network)
       6.     └─bnlearn:::as.igraph.bn(network)
       7.       └─igraph::add_edges(res, t(arcs))
       8.         └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
       9.           └─lifecycle::deprecate_stop(...)
      10.             └─lifecycle:::deprecate_stop0(msg)
      11.               └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
         9.           └─lifecycle::deprecate_stop(...)
        10.             └─lifecycle:::deprecate_stop0(msg)
        11.               └─rlang::cnd_signal(...)
       ── Error ('test_swap_adjacent_proposal.R:2:1'): (code run outside of `test_that()`) ──
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: The `edges` argument of `add_edges()` supplied as a matrix should be a n times 2 matrix, not 2 times n as of igraph 2.1.5.
       i either transpose the matrix with t() or convert it to a data.frame with two columns.
       Backtrace:
            ▆
         1. └─cia::UniformlySampleDAG(c("A", "B", "C", "D", "E", "F")) at test_swap_adjacent_proposal.R:2:1
         2.   ├─cia::toMatrix(bnlearn::random.graph(nodes, method = "melancon"))
         3.   └─cia:::toMatrix.bn(bnlearn::random.graph(nodes, method = "melancon"))
         4.     ├─cia::toMatrix(bnlearn::as.igraph(network))
         5.     ├─bnlearn::as.igraph(network)
         6.     └─bnlearn:::as.igraph.bn(network)
         7.       └─igraph::add_edges(res, t(arcs))
         8.         └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
         9.           └─lifecycle::deprecate_stop(...)
        10.             └─lifecycle:::deprecate_stop0(msg)
        11.               └─rlang::cnd_signal(...)
       
       [ FAIL 10 | WARN 0 | SKIP 0 | PASS 17 ]
       Error:
       ! Test failures.
       Execution halted
     ```

