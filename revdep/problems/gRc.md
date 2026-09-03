# gRc (0.5.1)

* Email: <mailto:sorenh@math.aau.dk>
* GitHub mirror: <https://github.com/cran/gRc>

Run `revdepcheck::revdep_details(, "gRc")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > gm  = ~al:an:st
     > vcc = list(~me+st, ~ve+an, ~al)
     > ecc = list(~me:ve+me:al, ~ve:al+al:st)
     > m1 <- rcox(gm=gm, vcc=vcc, ecc=ecc, data=math, method='matching')
     > plot(m1)
     Error:
     ! The `edges` argument of `make_graph()` supplied as a matrix should be
       a n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
          ▆
       1. ├─base::plot(m1)
       2. ├─base::plot(m1)
       3. └─gRc:::plot.rcox(m1)
       4.   └─gRbase::ug(gen)
       5.     └─gRbase::ugList(list(...), result = result)
       6.       └─gRbase::g_ugl2ig_(x, vn)
       7.         └─gRbase:::ug_list2igraph(zz)
       8.           └─igraph::make_graph(em, isolates = iso, directed = FALSE)
       9.             └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      10.               └─lifecycle::deprecate_stop(...)
      11.                 └─lifecycle:::deprecate_stop0(msg)
      12.                   └─rlang::cnd_signal(...)
     Execution halted
     ```

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

