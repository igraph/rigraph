# MRReg (0.1.6)

* GitHub: <https://github.com/DarkEyes/MRReg>
* Email: <mailto:grandca@gmail.com>
* GitHub mirror: <https://github.com/cran/MRReg>

Run `revdepcheck::revdep_details(, "MRReg")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
       essentially perfect fit: summary may be unreliable
     Warning in summary.lm(submodels[[inx2]]) :
       essentially perfect fit: summary may be unreliable
     Warning in summary.lm(submodels[[inx2]]) :
       essentially perfect fit: summary may be unreliable
     Warning in summary.lm(submodels[[inx2]]) :
       essentially perfect fit: summary may be unreliable
     Warning in summary.lm(submodels[[inx2]]) :
       essentially perfect fit: summary may be unreliable
     Warning in summary.lm(submodels[[inx2]]) :
       essentially perfect fit: summary may be unreliable
     Warning in summary.lm(submodels[[inx2]]) :
       essentially perfect fit: summary may be unreliable
     Warning in summary.lm(submodels[[inx2]]) :
       essentially perfect fit: summary may be unreliable
     Warning in summary.lm(submodels[[inx2]]) :
       essentially perfect fit: summary may be unreliable
     Warning in summary.lm(submodels[[inx2]]) :
       essentially perfect fit: summary may be unreliable
     > # Plotting the result
     > plotOptimalClustersTree(obj)
     Error in graph_from_adjacency_matrix(adjMat) %>% set_vertex_attr("label",  : 
       could not find function "%>%"
     Calls: plotOptimalClustersTree
     Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     Error(s) in re-building vignettes:
       ...
     --- re-building ‘MDLResFramework_Demo.Rmd’ using knitr
     
     Quitting from MDLResFramework_Demo.Rmd:50-52 [unnamed-chunk-2]
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     <error/rlang_error>
     Error in `graph_from_adjacency_matrix(adjMat) %>% set_vertex_attr("label", value = nameList)`:
     ! could not find function "%>%"
     ---
     Backtrace:
         ▆
      1. └─MRReg::plotOptimalClustersTree(out)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'MDLResFramework_Demo.Rmd' failed with diagnostics:
     could not find function "%>%"
     --- failed re-building ‘MDLResFramework_Demo.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘MDLResFramework_Demo.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

*   checking R code for possible problems ... NOTE
     ```
     plotOptimalClustersTree: no visible global function definition for
       ‘%>%’
     Undefined global functions or variables:
       %>%
     ```

