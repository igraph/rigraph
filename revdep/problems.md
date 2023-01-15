# egor

<details>

* Version: 1.22.12
* GitHub: https://github.com/tilltnet/egor
* Source code: https://github.com/cran/egor
* Date/Publication: 2022-12-20 06:20:02 UTC
* Number of recursive dependencies: 89

Run `revdepcheck::cloud_details(, "egor")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Sorting data by egoID: Transforming alters data to long format: Transforming wide dyad data to edgelist: Sorting data by egoID: Transforming alters data to long format: Transforming wide dyad data to edgelist: Filtering out empty alter entries using provided network size values: Sorting data by egoID: Transforming alters data to long format: Transforming wide dyad data to edgelist: [ FAIL 1 | WARN 4 | SKIP 15 | PASS 205 ]
      
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      • On CRAN (15)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-clustered_graphs.R:55'): Methods work (properly) with grouping variable being completly NA. ──
      igraph::V(clustered_graphs(mpf, "country")[[1]])$grp.size is not NULL
      
      `actual` is a double vector ()
      `expected` is NULL
      
      [ FAIL 1 | WARN 4 | SKIP 15 | PASS 205 ]
      Error: Test failures
      Execution halted
    ```

# riverconn

<details>

* Version: 0.3.22
* GitHub: NA
* Source code: https://github.com/cran/riverconn
* Date/Publication: 2022-08-06 14:00:07 UTC
* Number of recursive dependencies: 98

Run `revdepcheck::cloud_details(, "riverconn")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘riverconn-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: d_index_calculation
    > ### Title: Calculate Reach- and Catchment-scale index improvement for
    > ###   scenarios of barriers removal
    > ### Aliases: d_index_calculation
    > 
    > ### ** Examples
    > 
    ...
        union
    
    > library(igraph)
    > g <- igraph::graph_from_literal(1-+2, 2-+4, 3-+2, 4-+6, 6-+7, 5-+6, 7-+8, 9-+5, 10-+5 )
    > E(g)$id_dam <- c(NA, NA, "1", NA, NA, "2", NA, NA, NA)
    > E(g)$type <- ifelse(is.na(E(g)$id_barrier), "joint", "dam")
    Error in value_in[seq_along(value_in)] <- value : 
      replacement has length zero
    Calls: E<- -> i_set_edge_attr
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘markdown’
      All declared Imports should be used.
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
      > library(sfnetworks)
      > 
      > test_check("sfnetworks")
      [ FAIL 1 | WARN 1 | SKIP 0 | PASS 277 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test_paths.R:242'): ... is passed correcly onto igraph::distances ──
      isTRUE(all.equal(cost_dijkstra, cost_johnson)) is not FALSE
      
      `actual`:   TRUE 
      `expected`: FALSE
      
      [ FAIL 1 | WARN 1 | SKIP 0 | PASS 277 ]
      Error: Test failures
      Execution halted
    ```

