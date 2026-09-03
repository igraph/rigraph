# GRAB (0.2.5)

* Email: <mailto:miaolin@pku.edu.cn>
* GitHub mirror: <https://github.com/cran/GRAB>

Run `revdepcheck::revdep_details(, "GRAB")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
      1 f2_2     -28.8 TRUE   
      2 Subj-212 -28.5 TRUE   
      3 f49_7    -28.0 TRUE   
      4 Subj-312 -26.5 TRUE   
      5 f39_5    -26.3 TRUE   
      6 f34_2    -21.9 TRUE   
      7 Subj-131 -21.3 TRUE   
      8 f5_3     -20.1 TRUE   
      9 f25_1    -19.5 TRUE   
     10 f12_10   -18.8 TRUE   
     # ℹ 40 more rows
     Error:
     ! The `edges` argument of `make_graph()` supplied as a matrix should be
       a n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─GRAB::SAGELD.NullModel(...)
      2.   └─igraph::make_graph(edges, directed = FALSE)
      3.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      4.       └─lifecycle::deprecate_stop(...)
      5.         └─lifecycle:::deprecate_stop0(msg)
      6.           └─rlang::cnd_signal(...)
     Execution halted
     ```

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

