# phangorn (2.12.1)

* GitHub: <https://github.com/KlausVigo/phangorn>
* Email: <mailto:klaus.schliep@gmail.com>
* GitHub mirror: <https://github.com/cran/phangorn>

Run `revdepcheck::revdep_details(, "phangorn")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > woodmouse <- phyDat(woodmouse)
     > tmpfile <- normalizePath(system.file(
     +              "extdata/trees/RAxML_bootstrap.woodmouse", package="phangorn"))
     > boot_trees <- read.tree(tmpfile)
     > 
     > dm <- dist.ml(woodmouse)
     > tree <- upgma(dm)
     > nnet <- neighborNet(dm)
     Error:
     ! The `edges` argument of `make_graph()` supplied as a matrix should be
       a n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─phangorn::neighborNet(dm)
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

*   checking tests ... ERROR
     ```
     ...
       ══ Skipped tests (4) ═══════════════════════════════════════════════════════════
       • On CRAN (4): 'test_plot_ancestral.R:13:1', 'test_plot_ancestral.R:19:1',
         'test_plot_pml.R:11:1', 'test_plot_pml.R:19:1'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test_plot_networx.R:1:1'): (code run outside of `test_that()`) ──────
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: The `edges` argument of `make_graph()` supplied as a matrix should be a n times 2 matrix, not 2 times n as of igraph 2.1.5.
       i either transpose the matrix with t() or convert it to a data.frame with two columns.
       Backtrace:
           ▆
        1. ├─phangorn::as.networx(allCircularSplits(5)) at test_plot_networx.R:1:1
        2. └─phangorn:::as.networx.splits(allCircularSplits(5))
        3.   └─phangorn:::circNetwork(x, c.ord)
        4.     └─igraph::make_graph(t(res$edge), directed = FALSE)
        5.       └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
        6.         └─lifecycle::deprecate_stop(...)
        7.           └─lifecycle:::deprecate_stop0(msg)
        8.             └─rlang::cnd_signal(...)
       
       [ FAIL 1 | WARN 1 | SKIP 4 | PASS 0 ]
       Deleting unused snapshots: 'plot_networx/plot-networx.svg'
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     Backtrace:
         ▆
      1. └─phangorn::consensusNet(bs, p = 0.2)
      2.   ├─phangorn::as.networx(spl)
      3.   └─phangorn:::as.networx.splits(spl)
      4.     └─phangorn:::circNetwork(x, c.ord)
      5.       └─igraph::make_graph(t(res$edge), directed = FALSE)
      6.         └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      7.           └─lifecycle::deprecate_stop(...)
      8.             └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'Trees.Rmd' failed with diagnostics:
     The `edges` argument of `make_graph()` supplied as a matrix should be a
     n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     --- failed re-building ‘Trees.Rmd’
     
     SUMMARY: processing the following files failed:
       ‘IntertwiningTreesAndNetworks.Rmd’ ‘MLbyHand.Rmd’ ‘Networx.Rmd’
       ‘Trees.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

