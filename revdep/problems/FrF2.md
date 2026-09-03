# FrF2 (2.3-5)

* Email: <mailto:ulrike.groemping@bht-berlin.de>
* GitHub mirror: <https://github.com/cran/FrF2>

Run `revdepcheck::revdep_details(, "FrF2")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > ### ** Examples
     > 
     > ## Not run: 
     > ##D ex.CIG <- CIG("9-4.2", vertex.color="white", vertex.label.color="darkred")
     > ##D ## play around with the dynamic graph until it looks right
     > ##D ## look up its id number in the title bar of the graph window and use it for id
     > ##D par(xpd=TRUE)
     > ##D CIGstatic(ex.CIG, id=1)
     > ## End(Not run)
     > 
     > graph1 <- CIG("9-4.2", plot=FALSE)   ### create graph object from design name
     Error:
     ! The `edges` argument of `add_edges()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─FrF2::CIG("9-4.2", plot = FALSE)
      2.   └─igraph::add_edges(go2, design$clear.2fis)
      3.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      4.       └─lifecycle::deprecate_stop(...)
      5.         └─lifecycle:::deprecate_stop0(msg)
      6.           └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
       [1,]    0    1    1    0    1    1
       [2,]    1    0    1    1    0    1
       
       $clear2fis
        [1] "AB" "AC" "AE" "AF" "BC" "BD" "BF" "CD" "CE" "DE" "DF" "EF"
       
       > ## character estimability requirement
       > colpick(6, 3, estimable=compromise(6, 4)$requirement)
       a clear design requires at least 16 runs
       checking up to 720 matrices
       Error:
       ! The `edges` argument of `add_edges()` supplied as a matrix should be a
         n times 2 matrix, not 2 times n as of igraph 2.1.5.
       ℹ either transpose the matrix with t() or convert it to a data.frame with two
         columns.
       Backtrace:
           ▆
        1. └─FrF2::colpick(6, 3, estimable = compromise(6, 4)$requirement)
        2.   └─FrF2:::mapcalc.block(...)
        3.     └─igraph::add_edges(go2, estimable)
        4.       └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
        5.         └─lifecycle::deprecate_stop(...)
        6.           └─lifecycle:::deprecate_stop0(msg)
        7.             └─rlang::cnd_signal(...)
       Execution halted
     ```

