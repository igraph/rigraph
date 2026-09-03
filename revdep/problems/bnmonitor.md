# bnmonitor (0.2.2)

* GitHub: <https://github.com/manueleleonelli/bnmonitor>
* Email: <mailto:manuele.leonelli@ie.edu>
* GitHub mirror: <https://github.com/cran/bnmonitor>

Run `revdepcheck::revdep_details(, "bnmonitor")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     ! The `edges` argument of `make_graph()` supplied as a matrix should be
       a n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
          ▆
       1. ├─bnmonitor::KL(synthetic_bn, "y2", "1", "2", "all", "all")
       2. └─bnmonitor:::KL.bn.fit(synthetic_bn, "y2", "1", "2", "all", "all")
       3.   ├─gRbase::compile(as.grain(bnfit))
       4.   ├─bnlearn::as.grain(bnfit)
       5.   └─bnlearn:::as.grain.bn.fit(bnfit)
       6.     └─bnlearn:::from.bn.fit.to.grain(x)
       7.       ├─base::suppressWarnings(gRain::compileCPT(cpt))
       8.       │ └─base::withCallingHandlers(...)
       9.       └─gRain::compileCPT(cpt)
      10.         └─gRain:::compile_cpt_worker(args, forceCheck = forceCheck)
      11.           └─gRbase::dagList(vp, forceCheck = forceCheck, result = "igraph")
      12.             └─gRbase::g_dagl2ig_(x, vn)
      13.               └─gRbase:::dag_list2igraph(zz)
      14.                 └─igraph::make_graph(em, isolates = iso, directed = TRUE)
      15.                   └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      16.                     └─lifecycle::deprecate_stop(...)
      17.                       └─lifecycle:::deprecate_stop0(msg)
      18.                         └─rlang::cnd_signal(...)
     Execution halted
     ```

