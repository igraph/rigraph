# corpustools

<details>

* Version: 0.5.1
* GitHub: https://github.com/kasperwelbers/corpustools
* Source code: https://github.com/cran/corpustools
* Date/Publication: 2023-05-08 09:50:15 UTC
* Number of recursive dependencies: 79

Run `revdepcheck::cloud_details(, "corpustools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘corpustools-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ego_semnet
    > ### Title: Create an ego network
    > ### Aliases: ego_semnet
    > 
    > ### ** Examples
    > 
    > tc = create_tcorpus(c('a b c', 'd e f', 'a d'))
    > g = semnet(tc, 'token')
    > 
    > igraph::get.data.frame(g)
       from to weight
    1     b  a    1.0
    2     c  a    1.0
    3     d  a    0.5
    4     a  b    0.5
    5     c  b    1.0
    6     a  c    0.5
    7     b  c    1.0
    8     a  d    0.5
    9     e  d    1.0
    10    f  d    1.0
    11    d  e    0.5
    12    f  e    1.0
    13    d  f    0.5
    14    e  f    1.0
    > ## only keep nodes directly connected to given node
    > g_ego = ego_semnet(g, 'e')
    > igraph::get.data.frame(g_ego)
      from to weight
    1    e  d    1.0
    2    f  d    1.0
    3    d  e    0.5
    4    f  e    1.0
    5    d  f    0.5
    6    e  f    1.0
    > 
    > ## only keep edges directly connected to given node
    > g_ego = ego_semnet(g, 'e', only_filter_vertices = FALSE)
    Error:
    ! The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
    Backtrace:
        ▆
     1. └─corpustools::ego_semnet(g, "e", only_filter_vertices = FALSE)
     2.   └─igraph::get.edge.ids(g, vp = rbind(ego$x, ego$y))
     3.     └─igraph::get_edge_ids(...)
     4.       └─igraph:::el_to_vec(vp, call = rlang::caller_env())
     5.         └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
     6.           └─lifecycle:::deprecate_stop0(msg)
     7.             └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.0Mb
      sub-directories of 1Mb or more:
        libs   5.5Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 438 marked UTF-8 strings
    ```

# dosearch

<details>

* Version: 1.0.11
* GitHub: https://github.com/santikka/dosearch
* Source code: https://github.com/cran/dosearch
* Date/Publication: 2024-07-16 09:50:02 UTC
* Number of recursive dependencies: 93

Run `revdepcheck::cloud_details(, "dosearch")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > #' @srrstats {G5.2} Error and warning behavior is tested.
      > #' @srrstats {G5.2a} Messages are unique.
      > #' @srrstats {G5.2b} Conditions are demonstrated.
      > #' @srrstats {G5.4, G5.4a, G5.6} Output of dosearch is compared against known
      > #'   theoretical identifiability and non-identifiability results.
      > #'   In other words, correctness can be tested independently of the
      > #'   implementation.
      > #' @srrstats {G5.5} The algorithm is deterministic, so this could also be NA
      > #' @srrstats {G5.6a} Because the package output is symbolic, the recovery
      > #'   of e.g., a causal effect is exact.
      > #' @srrstats {G5.7} Performance and scalability have been demonstrated
      > #'   in the JSS paper, and the simulations are too large to run on a single
      > #'   PC and require a cluster. The replication materials for this simulation
      > #'   are included in the 'rep' directory. The algorithm has exponential
      > #'   time and memory complexity in the number of the vertices of the graph,
      > #'   and it has been hypothesized that the general identifiability problem
      > #'   itself is NP-hard.
      > #' @srrstats {G5.8, G5.8a G5.8b, G5.8c, G5.8d} Edge conditions are tested.
      > #' @srrstats {NW6.0} Inputs types are tested.
      > #' @noRd
      > library(testthat)
      > library(dosearch)
      > 
      > test_check("dosearch")
      [ FAIL 1 | WARN 3 | SKIP 0 | PASS 294 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-interface.R:32:3'): igraph graph without names gets named ──────
      Error in `FUN(X[[i]], ...)`: Error: Logical index length does not match the number of edges. Recycling is not allowed.
      Backtrace:
           ▆
        1. ├─testthat::expect_message(parse_graph(g_igraph), "Argument `graph` is not named, node names have been assigned") at test-interface.R:32:3
        2. │ └─testthat:::expect_condition_matching(...)
        3. │   └─testthat:::quasi_capture(...)
        4. │     ├─testthat (local) .capture(...)
        5. │     │ └─base::withCallingHandlers(...)
        6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        7. └─dosearch:::parse_graph(g_igraph)
        8.   ├─e[(is.na(description) | description != "U")]
        9.   └─igraph:::`[.igraph.es`(...)
       10.     └─base::lapply(...)
       11.       └─igraph (local) FUN(X[[i]], ...)
       12.         └─cli::cli_abort("Error: Logical index length does not match the number of edges. Recycling is not allowed.")
       13.           └─rlang::abort(...)
      
      [ FAIL 1 | WARN 3 | SKIP 0 | PASS 294 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.9Mb
      sub-directories of 1Mb or more:
        libs   5.0Mb
    ```

# incidentally

<details>

* Version: 1.0.2
* GitHub: https://github.com/zpneal/incidentally
* Source code: https://github.com/cran/incidentally
* Date/Publication: 2023-02-15 21:00:02 UTC
* Number of recursive dependencies: 36

Run `revdepcheck::cloud_details(, "incidentally")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘congress.Rmd’ using rmarkdown
    trying URL 'https://www.govinfo.gov/bulkdata/BILLSTATUS/115/sres/BILLSTATUS-115-sres.zip'
    Content type 'application/zip' length 1883678 bytes (1.8 MB)
    ==================================================
    downloaded 1.8 MB
    
    trying URL 'https://www.govinfo.gov/bulkdata/BILLSTATUS/115/sres/BILLSTATUS-115-sres.zip'
    Content type 'application/zip' length 1883678 bytes (1.8 MB)
    ==================================================
    downloaded 1.8 MB
    ```

# klassR

<details>

* Version: 1.0.2
* GitHub: https://github.com/statisticsnorway/ssb-klassr
* Source code: https://github.com/cran/klassR
* Date/Publication: 2025-02-07 10:40:02 UTC
* Number of recursive dependencies: 78

Run `revdepcheck::cloud_details(, "klassR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘klassR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: update_klass_node
    > ### Title: Given a node and a graph, find the node at the end of a sequence
    > ###   of changes.
    > ### Aliases: update_klass_node
    > 
    > ### ** Examples
    > 
    > 
    > # Build a graph directed towards the most recent codes.
    > library(klassR)
    > klass_131 <- klass_graph(131)
    Error in `FUN()`:
    ! Error: Logical index length does not match the number of edges.
      Recycling is not allowed.
    Backtrace:
        ▆
     1. └─klassR::klass_graph(131)
     2.   ├─igraph::reverse_edges(...)
     3.   │ └─igraph:::as_igraph_es(graph, eids)
     4.   ├─igraph::E(graph)[igraph::E(graph)$changeOccurred > date]
     5.   └─igraph:::`[.igraph.es`(...)
     6.     └─base::lapply(...)
     7.       └─igraph (local) FUN(X[[i]], ...)
     8.         └─cli::cli_abort("Error: Logical index length does not match the number of edges. Recycling is not allowed.")
     9.           └─rlang::abort(...)
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1764 marked UTF-8 strings
    ```

# multinet

<details>

* Version: 4.2.2
* GitHub: NA
* Source code: https://github.com/cran/multinet
* Date/Publication: 2025-04-08 07:20:06 UTC
* Number of recursive dependencies: 13

Run `revdepcheck::cloud_details(, "multinet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘multinet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: multinet.conversion
    > ### Title: Conversion to a simple or multi graph
    > ### Aliases: multinet.conversion as.igraph.multinet
    > ###   as.igraph.Rcpp_RMLNetwork
    > 
    > ### ** Examples
    > 
    > net <- ml_aucs()
    > # using the default merge.actors=TRUE we create a multigraph,
    > # where each actor corresponds to a vertex in the result
    > multigraph <- as.igraph(net)
    Error in `make_empty_graph()`:
    ! `directed` must be a logical, not a number.
    Backtrace:
        ▆
     1. ├─igraph::as.igraph(net)
     2. └─multinet:::as.igraph.Rcpp_RMLNetwork(net)
     3.   └─igraph::graph_from_data_frame(vertices = a_df, e_df, directed = dir)
     4.     └─igraph::make_empty_graph(n = 0, directed = directed)
     5.       └─cli::cli_abort("{.arg directed} must be a logical, not {.obj_type_friendly {directed}}.")
     6.         └─rlang::abort(...)
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 137.5Mb
      sub-directories of 1Mb or more:
        libs  137.2Mb
    ```

# mwcsr

<details>

* Version: 0.1.9
* GitHub: https://github.com/ctlab/mwcsr
* Source code: https://github.com/cran/mwcsr
* Date/Publication: 2024-09-09 11:30:10 UTC
* Number of recursive dependencies: 86

Run `revdepcheck::cloud_details(, "mwcsr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mwcsr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: virgo_solver
    > ### Title: Construct a virgo solver
    > ### Aliases: virgo_solver
    > 
    > ### ** Examples
    > 
    > data("sgmwcs_small_instance")
    > approx_vs <- virgo_solver(mst=TRUE, threads = 1)
    > approx_vs$run_main("-h")
    Option (* = required)                  Description                            
    ---------------------                  -----------                            
    --benchmark, --bm                      Benchmark output file (default: )      
    -c <Integer>                           Threshold for CPE solver (default: 25) 
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(mwcsr)
      > 
      > test_check("mwcsr")
      [ FAIL 2 | WARN 10 | SKIP 5 | PASS 41 ]
      
      ══ Skipped tests (5) ═══════════════════════════════════════════════════════════
      • No CPLEX available (3): 'test_virgo.R:5:9', 'test_virgo.R:15:9',
        'test_virgo.R:24:9'
      • SCIP is not available (2): 'test_scip.R:5:9', 'test_scip.R:16:9'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_virgo.R:48:5'): heuristic virgo_solver works on SGMWCS ─────────
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. ├─mwcsr::solve_mwcsp(solver, sgmwcs_small_instance) at test_virgo.R:48:5
        2. └─mwcsr:::solve_mwcsp.virgo_solver(solver, sgmwcs_small_instance)
        3.   └─mwcsr:::solve_sgmwcs(solver, instance, ...)
        4.     └─mwcsr:::run_solver(...)
        5.       └─igraph::get.edge.ids(instance, t(edges[, 1:2]))
        6.         └─igraph::get_edge_ids(...)
        7.           └─igraph:::el_to_vec(vp, call = rlang::caller_env())
        8.             └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
        9.               └─lifecycle:::deprecate_stop0(msg)
       10.                 └─rlang::cnd_signal(...)
      ── Error ('test_virgo.R:81:5'): heuristic virgo_solver works on SGMWCS ─────────
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. ├─mwcsr::solve_mwcsp(solver, si) at test_virgo.R:81:5
        2. └─mwcsr:::solve_mwcsp.virgo_solver(solver, si)
        3.   └─mwcsr:::solve_sgmwcs(solver, instance, ...)
        4.     └─mwcsr:::run_solver(...)
        5.       └─igraph::get.edge.ids(instance, t(edges[, 1:2]))
        6.         └─igraph::get_edge_ids(...)
        7.           └─igraph:::el_to_vec(vp, call = rlang::caller_env())
        8.             └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
        9.               └─lifecycle:::deprecate_stop0(msg)
       10.                 └─rlang::cnd_signal(...)
      
      [ FAIL 2 | WARN 10 | SKIP 5 | PASS 41 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 13.6Mb
      sub-directories of 1Mb or more:
        java   2.5Mb
        libs  10.5Mb
    ```

# netdiffuseR

<details>

* Version: 1.22.6
* GitHub: https://github.com/USCCANA/netdiffuseR
* Source code: https://github.com/cran/netdiffuseR
* Date/Publication: 2023-08-30 17:00:10 UTC
* Number of recursive dependencies: 83

Run `revdepcheck::cloud_details(, "netdiffuseR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘netdiffuseR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: exposure
    > ### Title: Ego exposure
    > ### Aliases: exposure
    > ### Keywords: univar
    > 
    > ### ** Examples
    > 
    > # Calculating lagged exposure -----------------------------------------------
    > 
    > set.seed(8)
    > graph <- rdiffnet(20, 4)
    Warning in (function (graph, p, algorithm = "endpoints", both.ends = FALSE,  :
      The option -copy.first- is set to TRUE. In this case, the first graph will be treated as a baseline, and thus, networks after T=1 will be replaced with T-1.
    > 
    > expo0 <- exposure(graph)
    > expo1 <- exposure(graph, lags = 1)
    > 
    > # These should be equivalent
    > stopifnot(all(expo0[, -4] == expo1[, -1])) # No stop!
    > 
    > 
    > # Calculating the exposure based on Structural Equivalence ------------------
    > set.seed(113132)
    > graph <- rdiffnet(100, 4)
    Warning in (function (graph, p, algorithm = "endpoints", both.ends = FALSE,  :
      The option -copy.first- is set to TRUE. In this case, the first graph will be treated as a baseline, and thus, networks after T=1 will be replaced with T-1.
    > 
    > SE <- lapply(struct_equiv(graph), "[[", "SE")
    > SE <- lapply(SE, function(x) {
    +    x <- 1/x
    +    x[!is.finite(x)] <- 0
    +    x
    + })
    > 
    > 
    > # These three lines are equivalent to:
    > expo_se2 <- exposure(graph, alt.graph="se", valued=TRUE)
    > # Notice that we are setting valued=TRUE, but this is not necesary since when
    > # alt.graph = "se" the function checks this to be setted equal to TRUE
    > 
    > # Weighted Exposure using degree --------------------------------------------
    > eDE <- exposure(graph, attrs=dgr(graph))
    > 
    > # Which is equivalent to
    > graph[["deg"]] <- dgr(graph)
    > eDE2 <- exposure(graph, attrs="deg")
    > 
    > # Comparing using incoming edges -------------------------------------------
    > eIN <- exposure(graph, outgoing=FALSE)
    > 
    > # Structral equivalence for different communities ---------------------------
    > data(medInnovationsDiffNet)
    > 
    > # Only using 4 time slides, this is for convenience
    > medInnovationsDiffNet <- medInnovationsDiffNet[, , 1:4]
    > 
    > # METHOD 1: Using the c.diffnet method:
    > 
    > # Creating subsets by city
    > cities <- unique(medInnovationsDiffNet[["city"]])
    > 
    > diffnet <- medInnovationsDiffNet[medInnovationsDiffNet[["city"]] == cities[1]]
    > diffnet[["expo_se"]] <- exposure(diffnet, alt.graph="se", valued=TRUE)
    
     *** caught segfault ***
    address (nil), cause 'unknown'
    
    Traceback:
     1: .TM.repl.i.mat(as(x, "TsparseMatrix"), i = i, value = value)
     2: .class1(object)
     3: as(.TM.repl.i.mat(as(x, "TsparseMatrix"), i = i, value = value),     "CsparseMatrix")
     4: `[<-`(`*tmp*`, cbind(1:nrow(z_ik), ids[, 2]), value = 0)
     5: `[<-`(`*tmp*`, cbind(1:nrow(z_ik), ids[, 2]), value = 0)
     6: euclidean_distance(gdist)
     7: struct_equiv_new(geod, v)
     8: struct_equiv.dgCMatrix(methods::as(graph[[i]], "dgCMatrix"),     v, inf.replace, groupvar, ...)
     9: struct_equiv.list(graph, v, inf.replace, groupvar, ...)
    10: struct_equiv(graph, groupvar = groupvar, ...)
    11: lapply(struct_equiv(graph, groupvar = groupvar, ...), "[[", "SE")
    12: exposure(diffnet, alt.graph = "se", valued = TRUE)
    An irrecoverable exception occurred. R is aborting now ...
    Segmentation fault (core dumped)
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 14.0Mb
      sub-directories of 1Mb or more:
        doc    2.5Mb
        libs   9.6Mb
    ```

# remify

<details>

* Version: 3.2.8
* GitHub: https://github.com/TilburgNetworkGroup/remify
* Source code: https://github.com/cran/remify
* Date/Publication: 2025-01-29 13:20:05 UTC
* Number of recursive dependencies: 36

Run `revdepcheck::cloud_details(, "remify")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘tinytest.R’
    Running the tests in ‘tests/tinytest.R’ failed.
    Complete output:
      > if ( requireNamespace("tinytest", quietly=TRUE) ){
      +   tinytest::test_package("remify")
      + }
      
      test-rehshape.R...............    0 tests    
      test-rehshape.R...............    1 tests [0;32mOK[0m 
      test-rehshape.R...............    1 tests [0;32mOK[0m 
      test-rehshape.R...............    2 tests [0;32mOK[0m 
      test-rehshape.R...............    3 tests [0;32mOK[0m 
      test-rehshape.R...............    4 tests [0;32mOK[0m 
      test-rehshape.R...............    5 tests [0;32mOK[0m 
      test-rehshape.R...............    6 tests [0;32mOK[0m 
      test-rehshape.R...............    7 tests [0;32mOK[0m 
      test-rehshape.R...............    8 tests [0;32mOK[0m 
      test-rehshape.R...............    9 tests [0;32mOK[0m 
      test-rehshape.R...............   10 tests [0;32mOK[0m 
      test-rehshape.R...............   10 tests [0;32mOK[0m 
      test-rehshape.R...............   11 tests [0;32mOK[0m 
      test-rehshape.R...............   12 tests [0;32mOK[0m 
      test-rehshape.R...............   13 tests [0;32mOK[0m 
      test-rehshape.R...............   14 tests [0;32mOK[0m 
      test-rehshape.R...............   15 tests [0;32mOK[0m 
      test-rehshape.R...............   16 tests [0;32mOK[0m 
      test-rehshape.R...............   17 tests [0;32mOK[0m 
      test-rehshape.R...............   18 tests [0;32mOK[0m 
      test-rehshape.R...............   19 tests [0;32mOK[0m 
      test-rehshape.R...............   19 tests [0;32mOK[0m 
      test-rehshape.R...............   20 tests [0;32mOK[0m 
      test-rehshape.R...............   20 tests [0;32mOK[0m 
      test-rehshape.R...............   21 tests [0;32mOK[0m 
      test-rehshape.R...............   22 tests [0;32mOK[0m 
      test-rehshape.R...............   22 tests [0;32mOK[0m 
      test-rehshape.R...............   22 tests [0;32mOK[0m 
      test-rehshape.R...............   23 tests [0;32mOK[0m 
      test-rehshape.R...............   24 tests [0;32mOK[0m 
      test-rehshape.R...............   24 tests [0;32mOK[0m 
      test-rehshape.R...............   24 tests [0;32mOK[0m 
      test-rehshape.R...............   25 tests [0;32mOK[0m 
      test-rehshape.R...............   26 tests [0;32mOK[0m [0;34m2.9s[0m
      
      test-remify-error-messages.R..    1 tests [0;32mOK[0m 
      test-remify-error-messages.R..    1 tests [0;32mOK[0m 
      test-remify-error-messages.R..    1 tests [0;32mOK[0m 
      test-remify-error-messages.R..    2 tests [0;32mOK[0m 
      test-remify-error-messages.R..    2 tests [0;32mOK[0m 
      test-remify-error-messages.R..    2 tests [0;32mOK[0m 
      test-remify-error-messages.R..    3 tests [0;32mOK[0m 
      test-remify-error-messages.R..    3 tests [0;32mOK[0m 
      test-remify-error-messages.R..    3 tests [0;32mOK[0m 
      test-remify-error-messages.R..    4 tests [0;32mOK[0m 
      test-remify-error-messages.R..    5 tests [0;32mOK[0m 
      test-remify-error-messages.R..    6 tests [0;32mOK[0m 
      test-remify-error-messages.R..    6 tests [0;32mOK[0m 
      test-remify-error-messages.R..    6 tests [0;32mOK[0m 
      test-remify-error-messages.R..    7 tests [0;32mOK[0m 
      test-remify-error-messages.R..    7 tests [0;32mOK[0m 
      test-remify-error-messages.R..    8 tests [0;32mOK[0m 
      test-remify-error-messages.R..    8 tests [0;32mOK[0m 
      test-remify-error-messages.R..    8 tests [0;32mOK[0m 
      test-remify-error-messages.R..    9 tests [0;32mOK[0m 
      test-remify-error-messages.R..    9 tests [0;32mOK[0m 
      test-remify-error-messages.R..    9 tests [0;32mOK[0m 
      test-remify-error-messages.R..   10 tests [0;32mOK[0m 
      test-remify-error-messages.R..   10 tests [0;32mOK[0m 
      test-remify-error-messages.R..   10 tests [0;32mOK[0m 
      test-remify-error-messages.R..   11 tests [0;32mOK[0m 
      test-remify-error-messages.R..   11 tests [0;32mOK[0m 
      test-remify-error-messages.R..   11 tests [0;32mOK[0m 
      test-remify-error-messages.R..   12 tests [0;32mOK[0m 
      test-remify-error-messages.R..   12 tests [0;32mOK[0m 
      test-remify-error-messages.R..   12 tests [0;32mOK[0m 
      test-remify-error-messages.R..   13 tests [0;32mOK[0m 
      test-remify-error-messages.R..   13 tests [0;32mOK[0m 
      test-remify-error-messages.R..   14 tests [0;32mOK[0m 
      test-remify-error-messages.R..   14 tests [0;32mOK[0m 
      test-remify-error-messages.R..   14 tests [0;32mOK[0m 
      test-remify-error-messages.R..   15 tests [0;32mOK[0m 
      test-remify-error-messages.R..   15 tests [0;32mOK[0m 
      test-remify-error-messages.R..   15 tests [0;32mOK[0m 
      test-remify-error-messages.R..   16 tests [0;32mOK[0m 
      test-remify-error-messages.R..   16 tests [0;32mOK[0m 
      test-remify-error-messages.R..   16 tests [0;32mOK[0m 
      test-remify-error-messages.R..   17 tests [0;32mOK[0m 
      test-remify-error-messages.R..   17 tests [0;32mOK[0m 
      test-remify-error-messages.R..   17 tests [0;32mOK[0m 
      test-remify-error-messages.R..   18 tests [0;32mOK[0m 
      test-remify-error-messages.R..   18 tests [0;32mOK[0m 
      test-remify-error-messages.R..   19 tests [0;32mOK[0m 
      test-remify-error-messages.R..   19 tests [0;32mOK[0m 
      test-remify-error-messages.R..   20 tests [0;32mOK[0m 
      test-remify-error-messages.R..   20 tests [0;32mOK[0m 
      test-remify-error-messages.R..   21 tests [0;32mOK[0m [0;34m0.2s[0m
      
      test-remify-methods.R.........    0 tests    
      test-remify-methods.R.........    0 tests    
      test-remify-methods.R.........    1 tests [0;32mOK[0m 
      test-remify-methods.R.........    2 tests [0;32mOK[0m 
      test-remify-methods.R.........    3 tests [0;32mOK[0m 
      test-remify-methods.R.........    4 tests [0;32mOK[0m 
      test-remify-methods.R.........    4 tests [0;32mOK[0m 
      test-remify-methods.R.........    4 tests [0;32mOK[0m 
      test-remify-methods.R.........    4 tests [0;32mOK[0m 
      test-remify-methods.R.........    5 tests [0;32mOK[0m 
      test-remify-methods.R.........    6 tests [0;32mOK[0m 
      test-remify-methods.R.........    7 tests [0;32mOK[0m 
      test-remify-methods.R.........    8 tests [0;32mOK[0m 
      test-remify-methods.R.........    8 tests [0;32mOK[0m 
      test-remify-methods.R.........    8 tests [0;32mOK[0m 
      test-remify-methods.R.........    8 tests [0;32mOK[0m 
      test-remify-methods.R.........    8 tests [0;32mOK[0m 
      test-remify-methods.R.........    9 tests [0;32mOK[0m 
      test-remify-methods.R.........   10 tests [0;32mOK[0m 
      test-remify-methods.R.........   11 tests [0;32mOK[0m 
      test-remify-methods.R.........   12 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   14 tests [0;32mOK[0m 
      test-remify-methods.R.........   15 tests [0;32mOK[0m 
      test-remify-methods.R.........   16 tests [0;32mOK[0m 
      test-remify-methods.R.........   17 tests [0;32mOK[0m 
      test-remify-methods.R.........   18 tests [0;32mOK[0m 
      test-remify-methods.R.........   18 tests [0;32mOK[0m 
      test-remify-methods.R.........   18 tests [0;32mOK[0m 
      test-remify-methods.R.........   18 tests [0;32mOK[0m 
      test-remify-methods.R.........   18 tests [0;32mOK[0m 
      test-remify-methods.R.........   19 tests [0;32mOK[0m 
      test-remify-methods.R.........   20 tests [0;32mOK[0m 
      test-remify-methods.R.........   21 tests [0;32mOK[0m 
      test-remify-methods.R.........   22 tests [0;32mOK[0m 
      test-remify-methods.R.........   23 tests [0;32mOK[0m 
      test-remify-methods.R.........   23 tests [0;32mOK[0m 
      test-remify-methods.R.........   23 tests [0;32mOK[0m 
      test-remify-methods.R.........   24 tests [0;32mOK[0m 
      test-remify-methods.R.........   25 tests [0;32mOK[0m 
      test-remify-methods.R.........   26 tests [0;32mOK[0m 
      test-remify-methods.R.........   27 tests [0;32mOK[0m 
      test-remify-methods.R.........   27 tests [0;32mOK[0m 
      test-remify-methods.R.........   27 tests [0;32mOK[0m 
      test-remify-methods.R.........   28 tests [0;32mOK[0m 
      test-remify-methods.R.........   29 tests [0;32mOK[0m 
      test-remify-methods.R.........   30 tests [0;32mOK[0m 
      test-remify-methods.R.........   31 tests [0;32mOK[0m 
      test-remify-methods.R.........   31 tests [0;32mOK[0m 
      test-remify-methods.R.........   31 tests [0;32mOK[0m 
      test-remify-methods.R.........   32 tests [0;32mOK[0m 
      test-remify-methods.R.........   33 tests [0;32mOK[0m 
      test-remify-methods.R.........   33 tests [0;32mOK[0m 
      test-remify-methods.R.........   33 tests [0;32mOK[0m 
      test-remify-methods.R.........   34 tests [0;32mOK[0m 
      test-remify-methods.R.........   35 tests [0;32mOK[0m 
      test-remify-methods.R.........   36 tests [0;32mOK[0m 
      test-remify-methods.R.........   37 tests [0;32mOK[0m 
      test-remify-methods.R.........   38 tests [0;32mOK[0m 
      test-remify-methods.R.........   39 tests [0;32mOK[0m 
      test-remify-methods.R.........   40 tests [0;32mOK[0m 
      test-remify-methods.R.........   41 tests [0;32mOK[0m 
      test-remify-methods.R.........   42 tests [0;32mOK[0m 
      test-remify-methods.R.........   43 tests [0;32mOK[0m 
      test-remify-methods.R.........   44 tests [0;32mOK[0m 
      test-remify-methods.R.........   45 tests [0;32mOK[0m 
      test-remify-methods.R.........   46 tests [0;32mOK[0m 
      test-remify-methods.R.........   47 tests [0;32mOK[0m 
      test-remify-methods.R.........   48 tests [0;32mOK[0m 
      test-remify-methods.R.........   49 tests [0;32mOK[0m 
      test-remify-methods.R.........   49 tests [0;32mOK[0m 
      test-remify-methods.R.........   50 tests [0;32mOK[0m 
      test-remify-methods.R.........   51 tests [0;32mOK[0m 
      test-remify-methods.R.........   52 tests [0;32mOK[0m 
      test-remify-methods.R.........   53 tests [0;32mOK[0m 
      test-remify-methods.R.........   54 tests [0;32mOK[0m 
      test-remify-methods.R.........   55 tests [0;32mOK[0m 
      test-remify-methods.R.........   56 tests [0;32mOK[0m 
      test-remify-methods.R.........   57 tests [0;32mOK[0m 
      test-remify-methods.R.........   58 tests [0;32mOK[0m 
      test-remify-methods.R.........   59 tests [0;32mOK[0m 
      test-remify-methods.R.........   60 tests [0;32mOK[0m 
      test-remify-methods.R.........   61 tests [0;32mOK[0m 
      test-remify-methods.R.........   62 tests [0;32mOK[0m 
      test-remify-methods.R.........   63 tests [0;32mOK[0m 
      test-remify-methods.R.........   64 tests [0;32mOK[0m 
      test-remify-methods.R.........   64 tests [0;32mOK[0m 
      test-remify-methods.R.........   65 tests [0;32mOK[0m 
      test-remify-methods.R.........   66 tests [0;32mOK[0m 
      test-remify-methods.R.........   67 tests [0;32mOK[0m 
      test-remify-methods.R.........   68 tests [0;32mOK[0m 
      test-remify-methods.R.........   69 tests [0;32mOK[0m 
      test-remify-methods.R.........   70 tests [0;32mOK[0m 
      test-remify-methods.R.........   71 tests [0;32mOK[0m 
      test-remify-methods.R.........   72 tests [0;32mOK[0m 
      test-remify-methods.R.........   73 tests [0;32mOK[0m 
      test-remify-methods.R.........   74 tests [0;32mOK[0m 
      test-remify-methods.R.........   75 tests [0;32mOK[0m 
      test-remify-methods.R.........   76 tests [0;32mOK[0m 
      test-remify-methods.R.........   76 tests [0;32mOK[0m 
      test-remify-methods.R.........   76 tests [0;32mOK[0m 
      test-remify-methods.R.........   77 tests [0;32mOK[0m 
      test-remify-methods.R.........   78 tests [0;32mOK[0m 
      test-remify-methods.R.........   79 tests [0;32mOK[0m 
      test-remify-methods.R.........   80 tests [0;32mOK[0m 
      test-remify-methods.R.........   81 tests [0;32mOK[0m 
      test-remify-methods.R.........   82 tests [0;32mOK[0m 
      test-remify-methods.R.........   82 tests [0;32mOK[0m 
      test-remify-methods.R.........   82 tests [0;32mOK[0m 
      test-remify-methods.R.........   83 tests [0;32mOK[0m 
      test-remify-methods.R.........   84 tests [0;32mOK[0m 
      test-remify-methods.R.........   85 tests [0;32mOK[0m 
      test-remify-methods.R.........   86 tests [0;32mOK[0m 
      test-remify-methods.R.........   87 tests [0;32mOK[0m 
      test-remify-methods.R.........   88 tests [0;32mOK[0m 
      test-remify-methods.R.........   89 tests [0;32mOK[0m 
      test-remify-methods.R.........   90 tests [0;32mOK[0m 
      test-remify-methods.R.........   90 tests [0;32mOK[0m 
      test-remify-methods.R.........   90 tests [0;32mOK[0m 
      test-remify-methods.R.........   90 tests [0;32mOK[0m 
      test-remify-methods.R.........   91 tests [0;32mOK[0m 
      test-remify-methods.R.........   91 tests [0;32mOK[0m 
      test-remify-methods.R.........   92 tests [0;31m1 fails[0m 
      test-remify-methods.R.........   93 tests [0;31m2 fails[0m 
      test-remify-methods.R.........   94 tests [0;31m3 fails[0m 
      test-remify-methods.R.........   95 tests [0;31m4 fails[0m 
      test-remify-methods.R.........   96 tests [0;31m5 fails[0m 
      test-remify-methods.R.........   97 tests [0;31m6 fails[0m 
      test-remify-methods.R.........   98 tests [0;31m7 fails[0m 
      test-remify-methods.R.........   98 tests [0;31m7 fails[0m 
      test-remify-methods.R.........   99 tests [0;31m8 fails[0m 
      test-remify-methods.R.........  100 tests [0;31m9 fails[0m 
      test-remify-methods.R.........  101 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  101 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  102 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  103 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  104 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  105 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  106 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  107 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  107 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  107 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  108 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  109 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  109 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  109 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  110 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  110 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  110 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  111 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  111 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  111 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  112 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  112 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  112 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  113 tests [0;31m10 fails[0m [0;34m12.0s[0m
      
      test-remify-warning-messages.R    0 tests    
      test-remify-warning-messages.R    0 tests    
      test-remify-warning-messages.R    1 tests [0;32mOK[0m 
      test-remify-warning-messages.R    1 tests [0;32mOK[0m 
      test-remify-warning-messages.R    2 tests [0;32mOK[0m 
      test-remify-warning-messages.R    2 tests [0;32mOK[0m 
      test-remify-warning-messages.R    2 tests [0;32mOK[0m 
      test-remify-warning-messages.R    3 tests [0;32mOK[0m 
      test-remify-warning-messages.R    3 tests [0;32mOK[0m 
      test-remify-warning-messages.R    3 tests [0;32mOK[0m 
      test-remify-warning-messages.R    4 tests [0;32mOK[0m 
      test-remify-warning-messages.R    4 tests [0;32mOK[0m 
      test-remify-warning-messages.R    4 tests [0;32mOK[0m 
      test-remify-warning-messages.R    5 tests [0;32mOK[0m 
      test-remify-warning-messages.R    5 tests [0;32mOK[0m 
      test-remify-warning-messages.R    5 tests [0;32mOK[0m 
      test-remify-warning-messages.R    6 tests [0;32mOK[0m 
      test-remify-warning-messages.R    6 tests [0;32mOK[0m 
      test-remify-warning-messages.R    6 tests [0;32mOK[0m 
      test-remify-warning-messages.R    7 tests [0;32mOK[0m 
      test-remify-warning-messages.R    7 tests [0;32mOK[0m 
      test-remify-warning-messages.R    7 tests [0;32mOK[0m 
      test-remify-warning-messages.R    7 tests [0;32mOK[0m 
      test-remify-warning-messages.R    8 tests [0;32mOK[0m 
      test-remify-warning-messages.R    9 tests [0;32mOK[0m 
      test-remify-warning-messages.R    9 tests [0;32mOK[0m 
      test-remify-warning-messages.R   10 tests [0;32mOK[0m 
      test-remify-warning-messages.R   11 tests [0;32mOK[0m 
      test-remify-warning-messages.R   11 tests [0;32mOK[0m 
      test-remify-warning-messages.R   11 tests [0;32mOK[0m 
      test-remify-warning-messages.R   12 tests [0;32mOK[0m 
      test-remify-warning-messages.R   13 tests [0;32mOK[0m 
      test-remify-warning-messages.R   13 tests [0;32mOK[0m 
      test-remify-warning-messages.R   14 tests [0;32mOK[0m 
      test-remify-warning-messages.R   15 tests [0;32mOK[0m 
      test-remify-warning-messages.R   15 tests [0;32mOK[0m 
      test-remify-warning-messages.R   15 tests [0;32mOK[0m 
      test-remify-warning-messages.R   15 tests [0;32mOK[0m 
      test-remify-warning-messages.R   15 tests [0;32mOK[0m 
      test-remify-warning-messages.R   16 tests [0;32mOK[0m 
      test-remify-warning-messages.R   17 tests [0;32mOK[0m 
      test-remify-warning-messages.R   17 tests [0;32mOK[0m 
      test-remify-warning-messages.R   18 tests [0;32mOK[0m 
      test-remify-warning-messages.R   19 tests [0;32mOK[0m 
      test-remify-warning-messages.R   19 tests [0;32mOK[0m 
      test-remify-warning-messages.R   19 tests [0;32mOK[0m 
      test-remify-warning-messages.R   19 tests [0;32mOK[0m 
      test-remify-warning-messages.R   20 tests [0;32mOK[0m 
      test-remify-warning-messages.R   21 tests [0;32mOK[0m 
      test-remify-warning-messages.R   21 tests [0;32mOK[0m 
      test-remify-warning-messages.R   22 tests [0;32mOK[0m 
      test-remify-warning-messages.R   23 tests [0;32mOK[0m 
      test-remify-warning-messages.R   23 tests [0;32mOK[0m 
      test-remify-warning-messages.R   23 tests [0;32mOK[0m 
      test-remify-warning-messages.R   23 tests [0;32mOK[0m 
      test-remify-warning-messages.R   23 tests [0;32mOK[0m 
      test-remify-warning-messages.R   24 tests [0;32mOK[0m 
      test-remify-warning-messages.R   25 tests [0;32mOK[0m 
      test-remify-warning-messages.R   25 tests [0;32mOK[0m 
      test-remify-warning-messages.R   26 tests [0;32mOK[0m 
      test-remify-warning-messages.R   27 tests [0;32mOK[0m 
      test-remify-warning-messages.R   27 tests [0;32mOK[0m 
      test-remify-warning-messages.R   27 tests [0;32mOK[0m 
      test-remify-warning-messages.R   27 tests [0;32mOK[0m 
      test-remify-warning-messages.R   28 tests [0;32mOK[0m 
      test-remify-warning-messages.R   29 tests [0;32mOK[0m 
      test-remify-warning-messages.R   29 tests [0;32mOK[0m 
      test-remify-warning-messages.R   30 tests [0;32mOK[0m 
      test-remify-warning-messages.R   31 tests [0;32mOK[0m [0;34m0.7s[0m
      
      test-remify.R.................    0 tests    
      test-remify.R.................    1 tests [0;32mOK[0m 
      test-remify.R.................    2 tests [0;32mOK[0m 
      test-remify.R.................    3 tests [0;32mOK[0m 
      test-remify.R.................    4 tests [0;32mOK[0m 
      test-remify.R.................    5 tests [0;32mOK[0m 
      test-remify.R.................    6 tests [0;32mOK[0m 
      test-remify.R.................    7 tests [0;32mOK[0m 
      test-remify.R.................    8 tests [0;32mOK[0m 
      test-remify.R.................    9 tests [0;32mOK[0m 
      test-remify.R.................   10 tests [0;32mOK[0m 
      test-remify.R.................   10 tests [0;32mOK[0m 
      test-remify.R.................   10 tests [0;32mOK[0m 
      test-remify.R.................   10 tests [0;32mOK[0m 
      test-remify.R.................   11 tests [0;32mOK[0m 
      test-remify.R.................   12 tests [0;32mOK[0m 
      test-remify.R.................   13 tests [0;32mOK[0m 
      test-remify.R.................   13 tests [0;32mOK[0m 
      test-remify.R.................   13 tests [0;32mOK[0m 
      test-remify.R.................   14 tests [0;32mOK[0m 
      test-remify.R.................   15 tests [0;32mOK[0m 
      test-remify.R.................   15 tests [0;32mOK[0m 
      test-remify.R.................   15 tests [0;32mOK[0m 
      test-remify.R.................   15 tests [0;32mOK[0m 
      test-remify.R.................   16 tests [0;32mOK[0m 
      test-remify.R.................   17 tests [0;32mOK[0m 
      test-remify.R.................   17 tests [0;32mOK[0m 
      test-remify.R.................   17 tests [0;32mOK[0m 
      test-remify.R.................   17 tests [0;32mOK[0m 
      test-remify.R.................   18 tests [0;32mOK[0m 
      test-remify.R.................   19 tests [0;32mOK[0m 
      test-remify.R.................   19 tests [0;32mOK[0m 
      test-remify.R.................   19 tests [0;32mOK[0m 
      test-remify.R.................   19 tests [0;32mOK[0m 
      test-remify.R.................   20 tests [0;32mOK[0m 
      test-remify.R.................   20 tests [0;32mOK[0m 
      test-remify.R.................   21 tests [0;32mOK[0m 
      test-remify.R.................   21 tests [0;32mOK[0m 
      test-remify.R.................   21 tests [0;32mOK[0m 
      test-remify.R.................   21 tests [0;32mOK[0m 
      test-remify.R.................   21 tests [0;32mOK[0m 
      test-remify.R.................   22 tests [0;32mOK[0m 
      test-remify.R.................   22 tests [0;32mOK[0m 
      test-remify.R.................   23 tests [0;32mOK[0m 
      test-remify.R.................   23 tests [0;32mOK[0m 
      test-remify.R.................   23 tests [0;32mOK[0m 
      test-remify.R.................   23 tests [0;32mOK[0m 
      test-remify.R.................   24 tests [0;32mOK[0m 
      test-remify.R.................   24 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   26 tests [0;32mOK[0m 
      test-remify.R.................   26 tests [0;32mOK[0m 
      test-remify.R.................   26 tests [0;32mOK[0m 
      test-remify.R.................   27 tests [0;32mOK[0m 
      test-remify.R.................   27 tests [0;32mOK[0m 
      test-remify.R.................   27 tests [0;32mOK[0m 
      test-remify.R.................   27 tests [0;32mOK[0m 
      test-remify.R.................   28 tests [0;32mOK[0m 
      test-remify.R.................   29 tests [0;32mOK[0m 
      test-remify.R.................   30 tests [0;32mOK[0m 
      test-remify.R.................   30 tests [0;32mOK[0m 
      test-remify.R.................   31 tests [0;32mOK[0m 
      test-remify.R.................   31 tests [0;32mOK[0m 
      test-remify.R.................   32 tests [0;32mOK[0m 
      test-remify.R.................   32 tests [0;32mOK[0m 
      test-remify.R.................   33 tests [0;32mOK[0m 
      test-remify.R.................   33 tests [0;32mOK[0m 
      test-remify.R.................   34 tests [0;32mOK[0m 
      test-remify.R.................   34 tests [0;32mOK[0m 
      test-remify.R.................   34 tests [0;32mOK[0m 
      test-remify.R.................   34 tests [0;32mOK[0m 
      test-remify.R.................   34 tests [0;32mOK[0m 
      test-remify.R.................   35 tests [0;32mOK[0m 
      test-remify.R.................   35 tests [0;32mOK[0m 
      test-remify.R.................   36 tests [0;32mOK[0m 
      test-remify.R.................   37 tests [0;32mOK[0m 
      test-remify.R.................   38 tests [0;32mOK[0m 
      test-remify.R.................   39 tests [0;32mOK[0m 
      test-remify.R.................   40 tests [0;32mOK[0m 
      test-remify.R.................   41 tests [0;32mOK[0m 
      test-remify.R.................   42 tests [0;32mOK[0m 
      test-remify.R.................   43 tests [0;32mOK[0m 
      test-remify.R.................   44 tests [0;32mOK[0m 
      test-remify.R.................   45 tests [0;32mOK[0m 
      test-remify.R.................   45 tests [0;32mOK[0m 
      test-remify.R.................   45 tests [0;32mOK[0m 
      test-remify.R.................   46 tests [0;32mOK[0m 
      test-remify.R.................   47 tests [0;32mOK[0m 
      test-remify.R.................   47 tests [0;32mOK[0m 
      test-remify.R.................   47 tests [0;32mOK[0m 
      test-remify.R.................   48 tests [0;32mOK[0m 
      test-remify.R.................   49 tests [0;32mOK[0m 
      test-remify.R.................   49 tests [0;32mOK[0m 
      test-remify.R.................   50 tests [0;32mOK[0m 
      test-remify.R.................   51 tests [0;32mOK[0m 
      test-remify.R.................   51 tests [0;32mOK[0m 
      test-remify.R.................   52 tests [0;32mOK[0m 
      test-remify.R.................   53 tests [0;32mOK[0m 
      test-remify.R.................   53 tests [0;32mOK[0m 
      test-remify.R.................   54 tests [0;32mOK[0m 
      test-remify.R.................   55 tests [0;32mOK[0m 
      test-remify.R.................   55 tests [0;32mOK[0m 
      test-remify.R.................   55 tests [0;32mOK[0m 
      test-remify.R.................   55 tests [0;32mOK[0m 
      test-remify.R.................   55 tests [0;32mOK[0m 
      test-remify.R.................   56 tests [0;32mOK[0m 
      test-remify.R.................   56 tests [0;32mOK[0m 
      test-remify.R.................   57 tests [0;32mOK[0m 
      test-remify.R.................   57 tests [0;32mOK[0m 
      test-remify.R.................   57 tests [0;32mOK[0m 
      test-remify.R.................   58 tests [0;32mOK[0m 
      test-remify.R.................   58 tests [0;32mOK[0m 
      test-remify.R.................   59 tests [0;32mOK[0m 
      test-remify.R.................   59 tests [0;32mOK[0m 
      test-remify.R.................   59 tests [0;32mOK[0m 
      test-remify.R.................   59 tests [0;32mOK[0m 
      test-remify.R.................   60 tests [0;32mOK[0m 
      test-remify.R.................   60 tests [0;32mOK[0m 
      test-remify.R.................   61 tests [0;32mOK[0m 
      test-remify.R.................   61 tests [0;32mOK[0m 
      test-remify.R.................   61 tests [0;32mOK[0m 
      test-remify.R.................   62 tests [0;32mOK[0m 
      test-remify.R.................   62 tests [0;32mOK[0m 
      test-remify.R.................   63 tests [0;32mOK[0m [0;34m0.8s[0m
      ----- FAILED[xcpt]: test-remify-methods.R<349--349>
       call| expect_silent(plot(x = out))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<350--350>
       call| expect_silent(plot(x = out, breaks = NULL, palette = NULL, n_intervals = NULL, 
       call| -->    rev = NULL, actors = NULL, pch.degree = NULL, igraph.edge.color = NULL, 
       call| -->    igraph.vertex.color = NULL))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<351--351>
       call| expect_silent(plot(x = out, pch.degree = -1))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<352--352>
       call| expect_silent(plot(x = out, igraph.edge.color = "#000000000", 
       call| -->    igraph.vertex.color = "#000000000"))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<353--353>
       call| expect_silent(plot(x = out, igraph.edge.color = "magenta", igraph.vertex.color = "cyan4"))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<354--354>
       call| expect_silent(plot(x = out, n_intervals = 5))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<355--355>
       call| expect_silent(plot(x = out, actors = attr(out, "dictionary")$actors$actorName[1:5]))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<362--362>
       call| expect_silent(plot(x = out))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<363--363>
       call| expect_silent(plot(x = out, n_intervals = 5))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<364--364>
       call| expect_silent(plot(x = out, actors = attr(out, "dictionary")$actors$actorName[1:5]))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      Error: 10 out of 254 tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.2Mb
      sub-directories of 1Mb or more:
        doc    3.5Mb
        libs   4.8Mb
    ```

# SEMID

<details>

* Version: 0.4.1
* GitHub: https://github.com/Lucaweihs/SEMID
* Source code: https://github.com/cran/SEMID
* Date/Publication: 2023-07-19 14:00:11 UTC
* Number of recursive dependencies: 33

Run `revdepcheck::cloud_details(, "SEMID")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SEMID-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: SEMID-package
    > ### Title: SEMID package documentation.
    > ### Aliases: SEMID-package SEMID
    > 
    > ### ** Examples
    > 
    > ###
    > # Checking the generic identifiability of parameters in a mixed graph.
    > ###
    > 
    > # Mixed graphs are specified by their directed adjacency matrix L and
    > # bidirected adjacency matrix O.
    > L = t(matrix(
    +  c(0, 1, 1, 0, 0,
    +    0, 0, 1, 1, 1,
    +    0, 0, 0, 1, 0,
    +    0, 0, 0, 0, 1,
    +    0, 0, 0, 0, 0), 5, 5))
    > 
    > O = t(matrix(
    +  c(0, 0, 0, 1, 0,
    +    0, 0, 1, 0, 1,
    +    0, 0, 0, 0, 0,
    +    0, 0, 0, 0, 0,
    +    0, 0, 0, 0, 0), 5, 5)); O=O+t(O)
    > 
    > # Create a mixed graph object
    > graph = MixedGraph(L, O)
    > 
    > # We can plot what this mixed graph looks like, blue edges are directed
    > # red edges are bidirected.
    > plot(graph)
    > 
    > # Without using decomposition techniques we can't identify all nodes
    > # just using the half-trek criterion
    > htcID(graph, tianDecompose = FALSE)
    Warning: The `vp` argument of `get_edge_ids()` supplied as a matrix should be a n times
    2 matrix, not 2 times n as of igraph 2.1.5.
    ℹ either transpose the matrix with t() or convert it to a data.frame with two
      columns.
    ℹ The deprecated feature was likely used in the igraph package.
      Please report the issue at <https://github.com/igraph/rigraph/issues>.
    Call: htcID(mixedGraph = graph, tianDecompose = FALSE)
    
    Mixed Graph Info.
    # nodes: 5 
    # dir. edges: 7 
    # bi. edges: 3 
    
    Generic Identifiability Summary
    # dir. edges shown gen. identifiable: 1 
    # bi. edges shown gen. identifiable: 0 
    
    Generically identifiable dir. edges:
    1->2 
    
    Generically identifiable bi. edges:
    None
    > 
    > # The edgewiseTSID function can show that all edges are generically
    > # identifiable without proprocessing with decomposition techniques
    > edgewiseTSID(graph, tianDecompose = FALSE)
    Error:
    ! The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
    Backtrace:
         ▆
      1. └─SEMID::edgewiseTSID(graph, tianDecompose = FALSE)
      2.   └─SEMID::generalGenericID(...)
      3.     └─SEMID (local) idStepFunction(mixedGraph, unsolvedParents, solvedParents, identifier)
      4.       └─SEMID::trekSeparationIdentifyStep(...)
      5.         └─mixedGraph$getTrekSystem(sources, c(targets, i), avoidRightEdges = toRemoveOnRight)
      6.           ├─SEMID::getTrekSystem(this, ...)
      7.           └─SEMID:::getTrekSystem.MixedGraph(this, ...)
      8.             └─this$.internalGraph$getTrekSystem(...)
      9.               ├─SEMID::getTrekSystem(this, ...)
     10.               └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
     11.                 └─this$.internalGraph$getTrekSystem(...)
     12.                   ├─SEMID::getTrekSystem(this, ...)
     13.                   └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
     14.                     └─this$.trekFlowGraph$updateEdgeCapacities(...)
     15.                       ├─SEMID::updateEdgeCapacities(this, ...)
     16.                       └─SEMID:::updateEdgeCapacities.FlowGraph(this, ...)
     17.                         └─igraph::get.edge.ids(...)
     18.                           └─igraph::get_edge_ids(...)
     19.                             └─igraph:::el_to_vec(vp, call = rlang::caller_env())
     20.                               └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
     21.                                 └─lifecycle:::deprecate_stop0(msg)
     22.                                   └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(SEMID)
      > 
      > test_check("SEMID")
      [ FAIL 7 | WARN 11 | SKIP 0 | PASS 965 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_LatentDigraph.R:67:3'): Single node graph works properly ───────
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. ├─testthat::expect_equal(...) at test_LatentDigraph.R:67:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─g$getTrekSystem(1, 1)
        5.   ├─SEMID::getTrekSystem(this, ...)
        6.   └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
        7.     └─this$.internalGraph$getTrekSystem(...)
        8.       ├─SEMID::getTrekSystem(this, ...)
        9.       └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
       10.         └─this$createTrekFlowGraph()
       11.           ├─SEMID::createTrekFlowGraph(this, ...)
       12.           └─SEMID:::createTrekFlowGraph.LatentDigraphFixedOrder(this, ...)
       13.             └─SEMID::FlowGraph(adjMat, 1, adjMat)
       14.               └─igraph::get.edge.ids(flowGraph, rbind(1:m, 1:m + m))
       15.                 └─igraph::get_edge_ids(...)
       16.                   └─igraph:::el_to_vec(vp, call = rlang::caller_env())
       17.                     └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
       18.                       └─lifecycle:::deprecate_stop0(msg)
       19.                         └─rlang::cnd_signal(...)
      ── Error ('test_ancestral.R:19:17'): Ancestral identification does not identify edges erroneously. ──
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. └─SEMID::ancestralID(g) at test_ancestral.R:19:17
        2.   └─SEMID::generalGenericID(...)
        3.     └─SEMID::generalGenericID(...)
        4.       └─SEMID (local) idStepFunction(mixedGraph, unsolvedParents, solvedParents, identifier)
        5.         └─tianAncGraph$getHalfTrekSystem(allowedNodes, nodeParents)
        6.           ├─SEMID::getHalfTrekSystem(this, ...)
        7.           └─SEMID:::getHalfTrekSystem.MixedGraph(this, ...)
        8.             └─this$getTrekSystem(...)
        9.               ├─SEMID::getTrekSystem(this, ...)
       10.               └─SEMID:::getTrekSystem.MixedGraph(this, ...)
       11.                 └─this$.internalGraph$getTrekSystem(...)
       12.                   ├─SEMID::getTrekSystem(this, ...)
       13.                   └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
       14.                     └─this$.internalGraph$getTrekSystem(...)
       15.                       ├─SEMID::getTrekSystem(this, ...)
       16.                       └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
       17.                         └─this$.trekFlowGraph$updateEdgeCapacities(...)
       18.                           ├─SEMID::updateEdgeCapacities(this, ...)
       19.                           └─SEMID:::updateEdgeCapacities.FlowGraph(this, ...)
       20.                             └─igraph::get.edge.ids(...)
       21.                               └─igraph::get_edge_ids(...)
       22.                                 └─igraph:::el_to_vec(vp, call = rlang::caller_env())
       23.                                   └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
       24.                                     └─lifecycle:::deprecate_stop0(msg)
       25.                                       └─rlang::cnd_signal(...)
      ── Error ('test_ancestral.R:44:17'): Old and new ancestralID implementations agree. ──
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. └─SEMID::ancestralID(MixedGraph(L, O)) at test_ancestral.R:44:17
        2.   └─SEMID::generalGenericID(...)
        3.     └─SEMID::generalGenericID(...)
        4.       └─SEMID (local) idStepFunction(mixedGraph, unsolvedParents, solvedParents, identifier)
        5.         └─tianAncGraph$getHalfTrekSystem(allowedNodes, nodeParents)
        6.           ├─SEMID::getHalfTrekSystem(this, ...)
        7.           └─SEMID:::getHalfTrekSystem.MixedGraph(this, ...)
        8.             └─this$getTrekSystem(...)
        9.               ├─SEMID::getTrekSystem(this, ...)
       10.               └─SEMID:::getTrekSystem.MixedGraph(this, ...)
       11.                 └─this$.internalGraph$getTrekSystem(...)
       12.                   ├─SEMID::getTrekSystem(this, ...)
       13.                   └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
       14.                     └─this$.internalGraph$getTrekSystem(...)
       15.                       ├─SEMID::getTrekSystem(this, ...)
       16.                       └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
       17.                         └─this$.trekFlowGraph$updateEdgeCapacities(...)
       18.                           ├─SEMID::updateEdgeCapacities(this, ...)
       19.                           └─SEMID:::updateEdgeCapacities.FlowGraph(this, ...)
       20.                             └─igraph::get.edge.ids(...)
       21.                               └─igraph::get_edge_ids(...)
       22.                                 └─igraph:::el_to_vec(vp, call = rlang::caller_env())
       23.                                   └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
       24.                                     └─lifecycle:::deprecate_stop0(msg)
       25.                                       └─rlang::cnd_signal(...)
      ── Error ('test_edgewiseID.R:18:17'): Edgewise identification does not identify edges erroneously. ──
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. └─SEMID::htcID(g) at test_edgewiseID.R:18:17
        2.   └─SEMID::generalGenericID(mixedGraph, list(htcIdentifyStep), tianDecompose = tianDecompose)
        3.     └─SEMID::generalGenericID(...)
        4.       └─SEMID (local) idStepFunction(mixedGraph, unsolvedParents, solvedParents, identifier)
        5.         └─mixedGraph$getHalfTrekSystem(allowedNodes, nodeParents)
        6.           ├─SEMID::getHalfTrekSystem(this, ...)
        7.           └─SEMID:::getHalfTrekSystem.MixedGraph(this, ...)
        8.             └─this$getTrekSystem(...)
        9.               ├─SEMID::getTrekSystem(this, ...)
       10.               └─SEMID:::getTrekSystem.MixedGraph(this, ...)
       11.                 └─this$.internalGraph$getTrekSystem(...)
       12.                   ├─SEMID::getTrekSystem(this, ...)
       13.                   └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
       14.                     └─this$.internalGraph$getTrekSystem(...)
       15.                       ├─SEMID::getTrekSystem(this, ...)
       16.                       └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
       17.                         └─this$.trekFlowGraph$updateEdgeCapacities(...)
       18.                           ├─SEMID::updateEdgeCapacities(this, ...)
       19.                           └─SEMID:::updateEdgeCapacities.FlowGraph(this, ...)
       20.                             └─igraph::get.edge.ids(...)
       21.                               └─igraph::get_edge_ids(...)
       22.                                 └─igraph:::el_to_vec(vp, call = rlang::caller_env())
       23.                                   └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
       24.                                     └─lifecycle:::deprecate_stop0(msg)
       25.                                       └─rlang::cnd_signal(...)
      ── Error ('test_edgewiseID.R:44:9'): TO DELETE ─────────────────────────────────
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. └─SEMID::htcID(g, tianDecompose = F) at test_edgewiseID.R:44:9
        2.   └─SEMID::generalGenericID(mixedGraph, list(htcIdentifyStep), tianDecompose = tianDecompose)
        3.     └─SEMID (local) idStepFunction(mixedGraph, unsolvedParents, solvedParents, identifier)
        4.       └─mixedGraph$getHalfTrekSystem(allowedNodes, nodeParents)
        5.         ├─SEMID::getHalfTrekSystem(this, ...)
        6.         └─SEMID:::getHalfTrekSystem.MixedGraph(this, ...)
        7.           └─this$getTrekSystem(...)
        8.             ├─SEMID::getTrekSystem(this, ...)
        9.             └─SEMID:::getTrekSystem.MixedGraph(this, ...)
       10.               └─this$.internalGraph$getTrekSystem(...)
       11.                 ├─SEMID::getTrekSystem(this, ...)
       12.                 └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
       13.                   └─this$.internalGraph$getTrekSystem(...)
       14.                     ├─SEMID::getTrekSystem(this, ...)
       15.                     └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
       16.                       └─this$.trekFlowGraph$updateEdgeCapacities(...)
       17.                         ├─SEMID::updateEdgeCapacities(this, ...)
       18.                         └─SEMID:::updateEdgeCapacities.FlowGraph(this, ...)
       19.                           └─igraph::get.edge.ids(...)
       20.                             └─igraph::get_edge_ids(...)
       21.                               └─igraph:::el_to_vec(vp, call = rlang::caller_env())
       22.                                 └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
       23.                                   └─lifecycle:::deprecate_stop0(msg)
       24.                                     └─rlang::cnd_signal(...)
      ── Error ('test_lfhtcID.R:8:5'): lfhtcID returns correct value for known examples. ──
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. └─SEMID::lfhtcID(digraphExamples[[i]]$graph) at test_lfhtcID.R:8:5
        2.   └─SEMID::lfhtcIdentifyStep(...)
        3.     └─graph$getTrekSystem(...)
        4.       ├─SEMID::getTrekSystem(this, ...)
        5.       └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
        6.         └─this$.internalGraph$getTrekSystem(...)
        7.           ├─SEMID::getTrekSystem(this, ...)
        8.           └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
        9.             └─this$.trekFlowGraph$updateEdgeCapacities(...)
       10.               ├─SEMID::updateEdgeCapacities(this, ...)
       11.               └─SEMID:::updateEdgeCapacities.FlowGraph(this, ...)
       12.                 └─igraph::get.edge.ids(...)
       13.                   └─igraph::get_edge_ids(...)
       14.                     └─igraph:::el_to_vec(vp, call = rlang::caller_env())
       15.                       └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
       16.                         └─lifecycle:::deprecate_stop0(msg)
       17.                           └─rlang::cnd_signal(...)
      ── Error ('test_trekSepID.R:25:17'): Edgewise identification does not identify edges erroneously. ──
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. └─SEMID (local) trekSepId(MixedGraph(L, O)) at test_trekSepID.R:25:17
        2.   └─SEMID::generalGenericID(mixedGraph, list(tsIdStep)) at test_trekSepID.R:11:5
        3.     └─SEMID::generalGenericID(...)
        4.       └─SEMID (local) idStepFunction(mixedGraph, unsolvedParents, solvedParents, identifier)
        5.         └─SEMID::trekSeparationIdentifyStep(...) at test_trekSepID.R:8:9
        6.           └─mixedGraph$getTrekSystem(sources, c(targets, i), avoidRightEdges = toRemoveOnRight)
        7.             ├─SEMID::getTrekSystem(this, ...)
        8.             └─SEMID:::getTrekSystem.MixedGraph(this, ...)
        9.               └─this$.internalGraph$getTrekSystem(...)
       10.                 ├─SEMID::getTrekSystem(this, ...)
       11.                 └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
       12.                   └─this$.internalGraph$getTrekSystem(...)
       13.                     ├─SEMID::getTrekSystem(this, ...)
       14.                     └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
       15.                       └─this$.trekFlowGraph$updateEdgeCapacities(...)
       16.                         ├─SEMID::updateEdgeCapacities(this, ...)
       17.                         └─SEMID:::updateEdgeCapacities.FlowGraph(this, ...)
       18.                           └─igraph::get.edge.ids(...)
       19.                             └─igraph::get_edge_ids(...)
       20.                               └─igraph:::el_to_vec(vp, call = rlang::caller_env())
       21.                                 └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
       22.                                   └─lifecycle:::deprecate_stop0(msg)
       23.                                     └─rlang::cnd_signal(...)
      
      [ FAIL 7 | WARN 11 | SKIP 0 | PASS 965 ]
      Error: Test failures
      Execution halted
    ```

# ssifs

<details>

* Version: 1.0.4
* GitHub: https://github.com/georgiosseitidis/ssifs
* Source code: https://github.com/cran/ssifs
* Date/Publication: 2025-02-04 10:50:03 UTC
* Number of recursive dependencies: 96

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
      9.             └─lifecycle::deprecate_stop("1.3.0", "dfs(neimode = )", "dfs(mode = )")
     10.               └─lifecycle:::deprecate_stop0(msg)
     11.                 └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘An_introduction_to_ssifs.Rmd’ using rmarkdown
    
    Quitting from An_introduction_to_ssifs.Rmd:132-135 [unnamed-chunk-4]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    NULL
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
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
     3.     └─lifecycle::deprecate_stop("1.3.0", "bfs(neimode = )", "bfs(mode = )")
     4.       └─lifecycle:::deprecate_stop0(msg)
     5.         └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘tilemaps.Rmd’ using rmarkdown
    
    Quitting from tilemaps.Rmd:32-41 [unnamed-chunk-2]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    NULL
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
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

