# R6causal (0.8.3)

* Email: <mailto:juha.karvanen@iki.fi>
* GitHub mirror: <https://github.com/cran/R6causal>

Run `revdepcheck::revdep_details(, "R6causal")` for more info

## Newly broken

*   checking whether package ‘R6causal’ can be installed ... WARNING
     ```
     Found the following significant warnings:
       Warning: `set.edge.attribute()` was deprecated in igraph 2.0.0.
       Warning: `induced.subgraph()` was deprecated in igraph 2.0.0.
       Warning: `get.vertex.attribute()` was deprecated in igraph 2.0.0.
     See ‘<lib>/R6causal.Rcheck/00install.out’ for details.
     ```

## In both

*   checking re-building of vignette outputs ... WARNING
     ```
     Error(s) in re-building vignettes:
       ...
     --- re-building ‘using_R6causal.Rmd’ using rmarkdown
     ! LaTeX Error: File `lmodern.sty' not found.
     
     ! Emergency stop.
     <read *> 
     
     Error: processing vignette 'using_R6causal.Rmd' failed with diagnostics:
     LaTeX failed to compile <lib>/R6causal.Rcheck/vign_test/R6causal/vignettes/using_R6causal.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See using_R6causal.log for more info.
     --- failed re-building ‘using_R6causal.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘using_R6causal.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

