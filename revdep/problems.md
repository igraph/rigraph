# causaleffect

<details>

* Version: 1.3.15
* GitHub: https://github.com/santikka/causaleffect
* Source code: https://github.com/cran/causaleffect
* Date/Publication: 2022-07-14 09:10:05 UTC
* Number of recursive dependencies: 13

Run `revdepcheck::cloud_details(, "causaleffect")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘causaleffect-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: causal.effect
    > ### Title: Identify a causal effect
    > ### Aliases: causal.effect
    > 
    > ### ** Examples
    > 
    > library(igraph)
    ...
    > g <- graph.formula(x -+ y, z -+ x, z -+ y , x -+ z, z -+ x, simplify = FALSE)
    > 
    > # Here the bidirected edge between X and Z is set to be unobserved in graph g
    > # This is denoted by giving them a description attribute with the value "U"
    > # The edges in question are the fourth and the fifth edge
    > g <- set.edge.attribute(graph = g, name = "description", index = c(4,5), value = "U")
    > causal.effect("y", "x", G = g)
    Error in 0:(ind[i] - 1) : argument of length 0
    Calls: causal.effect -> id
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘causaleffect.ltx’ using tex
    Error: processing vignette 'causaleffect.ltx' failed with diagnostics:
    Running 'texi2dvi' on 'causaleffect.ltx' failed.
    LaTeX errors:
    ! LaTeX Error: File `ae.sty' not found.
    
    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: sty)
    
    ...
    l.16 \usepackage
                    {csquotes}^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘simplification.ltx’
    
    SUMMARY: processing the following files failed:
      ‘causaleffect.ltx’ ‘simplification.ltx’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# R6causal

<details>

* Version: 0.7.0
* GitHub: NA
* Source code: https://github.com/cran/R6causal
* Date/Publication: 2022-11-04 08:00:02 UTC
* Number of recursive dependencies: 100

Run `revdepcheck::cloud_details(, "R6causal")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘using_R6causal.Rmd’ using rmarkdown
    Quitting from lines 196-198 (using_R6causal.Rmd) 
    Error: processing vignette 'using_R6causal.Rmd' failed with diagnostics:
    Not identifiable.
    --- failed re-building ‘using_R6causal.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘using_R6causal.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# sfnetworks

<details>

* Version: 0.6.1
* GitHub: https://github.com/luukvdmeer/sfnetworks
* Source code: https://github.com/cran/sfnetworks
* Date/Publication: 2022-10-27 15:10:02 UTC
* Number of recursive dependencies: 146

Run `revdepcheck::cloud_details(, "sfnetworks")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        2. │ └─testthat:::quasi_capture(enquo(object), NULL, evaluate_promise)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ ├─withr::with_output_sink(...)
        5. │   │ │ └─base::force(code)
        6. │   │ ├─base::withCallingHandlers(...)
        7. │   │ └─base::withVisible(code)
        8. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        9. ├─sfnetworks::st_network_cost(...)
       10. └─sfnetworks:::st_network_cost.sfnetwork(...)
       11.   ├─base::do.call(igraph::distances, c(args, dots))
       12.   └─igraph (local) `<fn>`(`<sfnetwrk>`, 1, 10, weights = `<[m]>`, mode = "in", algorithm = "johnson")
      
      [ FAIL 1 | WARN 1 | SKIP 0 | PASS 276 ]
      Error: Test failures
      Execution halted
    ```

