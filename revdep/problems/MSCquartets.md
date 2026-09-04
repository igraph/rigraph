# MSCquartets (3.3)

* Email: <mailto:j.rhodes@alaska.edu>
* GitHub mirror: <https://github.com/cran/MSCquartets>

Run `revdepcheck::revdep_details(, "MSCquartets")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > ### ** Examples
     > 
     > data(pTableYeastRokas)
     > out=NANUQ(pTableYeastRokas, alpha=.05, beta=.80, outfile = NULL)
     > # Specifying an outfile would write the distance table to it for opening in SplitsTree.
     > # Alternately, to use the phangorn implementation of NeighborNet
     > # within R, enter the following additional lines:
     > nn=neighborNet(out$dist)
     Error:
     ! The `edges` argument of `make_graph()` supplied as a matrix should be
       a n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─phangorn::neighborNet(out$dist)
      2.   ├─phangorn::as.networx(spl)
      3.   └─phangorn:::as.networx.splits(spl)
      4.     └─phangorn:::circNetwork(x, c.ord)
      5.       └─igraph::make_graph(t(res$edge), directed = FALSE)
      6.         └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      7.           └─lifecycle::deprecate_stop(...)
      8.             └─lifecycle:::deprecate_stop0(msg)
      9.               └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
      1. └─phangorn::neighborNet(D$dist)
      2.   ├─phangorn::as.networx(spl)
      3.   └─phangorn:::as.networx.splits(spl)
      4.     └─phangorn:::circNetwork(x, c.ord)
      5.       └─igraph::make_graph(t(res$edge), directed = FALSE)
      6.         └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      7.           └─lifecycle::deprecate_stop(...)
      8.             └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'NANUQplus.Rmd' failed with diagnostics:
     The `edges` argument of `make_graph()` supplied as a matrix should be a
     n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     --- failed re-building ‘NANUQplus.Rmd’
     
     --- re-building ‘TINNIK.Rmd’ using rmarkdown
     --- finished re-building ‘TINNIK.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘NANUQplus.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

