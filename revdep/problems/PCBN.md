# PCBN (0.1.1)

* GitHub: <https://github.com/AlexisDerumigny/PCBN>
* Email: <mailto:a.f.f.derumigny@tudelft.nl>
* GitHub mirror: <https://github.com/cran/PCBN>

Run `revdepcheck::revdep_details(, "PCBN")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > 
     > my_PCBN = new_PCBN(
     +   DAG, order_hash,
     +   copula_mat = list(tau = tau, fam = fam))
     > 
     > mydata = PCBN_sim(my_PCBN, N = 5)
     Error:
     ! The `edges` argument of `add_edges()` is not allowed to be a 2 times 2
       matrix as of igraph 2.1.5.
     Backtrace:
          ▆
       1. └─PCBN::PCBN_sim(my_PCBN, N = 5)
       2.   └─PCBN:::.checkPCBNobject_for_simulation(object, verbose = verbose)
       3.     └─PCBN::is_restrictedDAG(PCBN$DAG, verbose = verbose, check_both = FALSE)
       4.       └─PCBN::active_cycles(DAG = DAG, early.stopping = TRUE)
       5.         ├─igraph::as_undirected(bnlearn::as.igraph(DAG))
       6.         │ └─igraph:::ensure_igraph(graph)
       7.         ├─bnlearn::as.igraph(DAG)
       8.         └─bnlearn:::as.igraph.bn(DAG)
       9.           └─igraph::add_edges(res, t(arcs))
      10.             └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      11.               └─lifecycle::deprecate_stop("2.1.5", paste0(fn, "(", arg, " = 'is not allowed to be a 2 times 2 matrix')"))
      12.                 └─lifecycle:::deprecate_stop0(msg)
      13.                   └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
        13.                   └─rlang::cnd_signal(...)
       ── Error ('test-PCBN-simulation.R:184:3'): PCBN_sim applies proper recursion of h-functions on an example with 5 nodes ──
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: The `edges` argument of `add_edges()` supplied as a matrix should be a n times 2 matrix, not 2 times n as of igraph 2.1.5.
       i either transpose the matrix with t() or convert it to a data.frame with two columns.
       Backtrace:
            ▆
         1. └─PCBN::PCBN_sim(object = my_PCBN, N = N, verbose = 0) at test-PCBN-simulation.R:184:3
         2.   └─PCBN:::.checkPCBNobject_for_simulation(object, verbose = verbose)
         3.     └─PCBN::is_restrictedDAG(PCBN$DAG, verbose = verbose, check_both = FALSE)
         4.       └─PCBN::active_cycles(DAG = DAG, early.stopping = TRUE)
         5.         ├─igraph::as_undirected(bnlearn::as.igraph(DAG))
         6.         │ └─igraph:::ensure_igraph(graph)
         7.         ├─bnlearn::as.igraph(DAG)
         8.         └─bnlearn:::as.igraph.bn(DAG)
         9.           └─igraph::add_edges(res, t(arcs))
        10.             └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
        11.               └─lifecycle::deprecate_stop(...)
        12.                 └─lifecycle:::deprecate_stop0(msg)
        13.                   └─rlang::cnd_signal(...)
       
       [ FAIL 10 | WARN 1 | SKIP 0 | PASS 98 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
       columns.
     ---
     Backtrace:
         ▆
      1. ├─igraph::plot.igraph(bnlearn::as.igraph(DAG), size = 20, label.cex = 2)
      2. ├─bnlearn::as.igraph(DAG)
      3. └─bnlearn:::as.igraph.bn(DAG)
      4.   └─igraph::add_edges(res, t(arcs))
      5.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      6.       └─lifecycle::deprecate_stop(...)
      7.         └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'internals-estimation.Rmd' failed with diagnostics:
     The `edges` argument of `add_edges()` supplied as a matrix should be a n
     times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     --- failed re-building ‘internals-estimation.Rmd’
     
     SUMMARY: processing the following files failed:
       ‘Bsets-v-structs.Rmd’ ‘internals-estimation.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

