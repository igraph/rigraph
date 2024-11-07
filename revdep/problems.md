# ssifs

<details>

* Version: 1.0.2
* GitHub: https://github.com/georgiosseitidis/ssifs
* Source code: https://github.com/cran/ssifs
* Date/Publication: 2023-05-12 09:00:03 UTC
* Number of recursive dependencies: 94

Run `revdepcheck::cloud_details(, "ssifs")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ssifs-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: Alcohol
    > ### Title: Stochastic Search Inconsistency Factor Selection of brief
    > ###   alcohol interventions.
    > ### Aliases: Alcohol
    > 
    > ### ** Examples
    > 
    > data(Alcohol)
    > 
    > TE <- Alcohol$TE
    > seTE <- Alcohol$seTE
    > studlab <- Alcohol$studyid
    > treat1 <- Alcohol$treat2
    > treat2 <- Alcohol$treat1
    > 
    > # Stochastic Search Inconsistency Factor Selection using as reference treatment AO-CT and the
    > # design-by-treatment method for the specification of the Z matrix.
    > 
    > m <- ssifs(TE, seTE, treat1, treat2, studlab, ref = "AO-CT",
    + M = 1000, B = 100, M_pilot = 1000, B_pilot = 100)
    Error:
    ! The `neimode` argument of `dfs()` was deprecated in igraph 1.3.0 and
      is now defunct.
    ℹ Please use the `mode` argument instead.
    Backtrace:
         ▆
      1. └─ssifs::ssifs(...)
      2.   └─ssifs:::connet(data)
      3.     └─ssifs:::subnet(data)
      4.       ├─base::suppressWarnings(RevEcoR::KosarajuSCC(t))
      5.       │ └─base::withCallingHandlers(...)
      6.       └─RevEcoR::KosarajuSCC(t)
      7.         └─igraph::graph.dfs(g, root = Source.node, neimode = "out", unreachable = FALSE)
      8.           └─igraph::dfs(...)
      9.             └─lifecycle::deprecate_stop("1.3.0", "dfs(neimode)", "dfs(mode)")
     10.               └─lifecycle:::deprecate_stop0(msg)
     11.                 └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘An_introduction_to_ssifs.Rmd’ using rmarkdown
    
    Quitting from lines 133-135 [unnamed-chunk-4] (An_introduction_to_ssifs.Rmd)
    Error: processing vignette 'An_introduction_to_ssifs.Rmd' failed with diagnostics:
    The `neimode` argument of `dfs()` was deprecated in igraph 1.3.0 and is
    now defunct.
    ℹ Please use the `mode` argument instead.
    --- failed re-building ‘An_introduction_to_ssifs.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘An_introduction_to_ssifs.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# tilemaps

<details>

* Version: 0.2.0
* GitHub: https://github.com/kaerosen/tilemaps
* Source code: https://github.com/cran/tilemaps
* Date/Publication: 2020-07-10 04:20:02 UTC
* Number of recursive dependencies: 72

Run `revdepcheck::cloud_details(, "tilemaps")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tilemaps-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: create_island
    > ### Title: Create a Tile for an Island
    > ### Aliases: create_island
    > 
    > ### ** Examples
    > 
    > library(sf)
    Linking to GEOS 3.12.1, GDAL 3.8.4, PROJ 9.4.0; sf_use_s2() is TRUE
    > northeast <- governors[c(6,7,17,18,19,27,28,30,36,37,43),]
    > tile_map <- generate_map(northeast$geometry, square = FALSE)
    Error:
    ! The `neimode` argument of `bfs()` was deprecated in igraph 1.3.0 and
      is now defunct.
    ℹ Please use the `mode` argument instead.
    Backtrace:
        ▆
     1. └─tilemaps::generate_map(northeast$geometry, square = FALSE)
     2.   └─igraph::bfs(neighbor_graph, 1, neimode = "all", unreachable = FALSE)
     3.     └─lifecycle::deprecate_stop("1.3.0", "bfs(neimode)", "bfs(mode)")
     4.       └─lifecycle:::deprecate_stop0(msg)
     5.         └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘tilemaps.Rmd’ using rmarkdown
    
    Quitting from lines 33-41 [unnamed-chunk-2] (tilemaps.Rmd)
    Error: processing vignette 'tilemaps.Rmd' failed with diagnostics:
    ℹ In argument: `tile_map = generate_map(geometry, square = FALSE,
      flat_topped = TRUE)`.
    Caused by error:
    ! The `neimode` argument of `bfs()` was deprecated in igraph 1.3.0 and
      is now defunct.
    ℹ Please use the `mode` argument instead.
    --- failed re-building ‘tilemaps.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘tilemaps.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘lwgeom’
      All declared Imports should be used.
    ```

