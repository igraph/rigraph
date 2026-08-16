# archeofrag (1.2.4)

* GitHub: <https://github.com/sebastien-plutniak/archeofrag>
* Email: <mailto:sebastien.plutniak@posteo.net>
* GitHub mirror: <https://github.com/cran/archeofrag>

Run `revdepcheck::revdep_details(, "archeofrag")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       The planarity of the graph value is indeterminated, simulations are executed with no planar constraint.
       The RBGL package is not installed, the `planarity` value cannot be determinated and returned as NA
       The planarity of the graph value is indeterminated, simulations are executed with no planar constraint.
       The RBGL package is not installed, the `planarity` value cannot be determinated and returned as NA
       The planarity of the graph value is indeterminated, simulations are executed with no planar constraint.
       The RBGL package is not installed, the `planarity` value cannot be determinated and returned as NA
       The planarity of the graph value is indeterminated, simulations are executed with no planar constraint.
       The RBGL package is not installed, the `planarity` value cannot be determinated and returned as NA
       The planarity of the graph value is indeterminated, simulations are executed with no planar constraint.
       The RBGL package is not installed, the `planarity` value cannot be determinated and returned as NA
       The planarity of the graph value is indeterminated, simulations are executed with no planar constraint.
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 84 ]
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('test-frag.edges.weighting.R:43:3'): weighting with morphometric and spatial parameters ──
       Expected `sum(igraph::E(g)$weight)` to equal 64.95129.
       Differences:
         `actual`: 65.014
       `expected`: 64.951
       
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 84 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## In both

*   checking re-building of vignette outputs ... ERROR
     ```
     Error(s) in re-building vignettes:
       ...
     --- re-building ‘archeofrag-vignette.Rmd’ using rmarkdown
     
     Quitting from archeofrag-vignette.Rmd:238-253 [simulator-test]
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     <error/rlang_error>
     Error in `if (planar == TRUE & (!requireNamespace("RBGL", quietly = TRUE))) ...`:
     ! missing value where TRUE/FALSE needed
     ---
     Backtrace:
         ▆
      1. └─archeofrag::frag.simul.process(...)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'archeofrag-vignette.Rmd' failed with diagnostics:
     missing value where TRUE/FALSE needed
     --- failed re-building ‘archeofrag-vignette.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘archeofrag-vignette.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

