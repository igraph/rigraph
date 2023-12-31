# countland

<details>

* Version: 0.1.1
* GitHub: NA
* Source code: https://github.com/cran/countland
* Date/Publication: 2022-08-17 06:40:06 UTC
* Number of recursive dependencies: 199

Run `revdepcheck::cloud_details(, "countland")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(countland)
      > 
      > test_check("countland")
      countland object
      the count matrix has 1000 genes (rows)
          and 100 cells (columns)
    ...
       2.   ├─methods::as(...)
       3.   │ └─methods:::.class1(object)
       4.   ├─base::do.call(...)
       5.   └─base::lapply(...)
       6.     └─countland (local) FUN(X[[i]], ...)
       7.       └─base::apply(combX[spectral_cluster$cluster == x, ], 2, sum)
      
      [ FAIL 4 | WARN 4 | SKIP 0 | PASS 61 ]
      Error: Test failures
      Execution halted
    ```

# DiagrammeR

<details>

* Version: 1.0.10
* GitHub: https://github.com/rich-iannone/DiagrammeR
* Source code: https://github.com/cran/DiagrammeR
* Date/Publication: 2023-05-18 14:30:07 UTC
* Number of recursive dependencies: 100

Run `revdepcheck::cloud_details(, "DiagrammeR")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(DiagrammeR)
      > 
      > suppressWarnings(RNGversion("3.5.0"))
      > test_check("DiagrammeR")
      [ FAIL 2 | WARN 13 | SKIP 0 | PASS 2128 ]
      
    ...
      1/1 mismatches
      [1] 107 - 98 == 9
      ── Failure ('test-count_entities.R:142:3'): counting the number of strongly connected components is possible ──
      graph %>% count_s_connected_cmpts() not equal to 4.
      1/1 mismatches
      [1] 2 - 4 == -2
      
      [ FAIL 2 | WARN 13 | SKIP 0 | PASS 2128 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# ggnetwork

<details>

* Version: 0.5.12
* GitHub: https://github.com/briatte/ggnetwork
* Source code: https://github.com/cran/ggnetwork
* Date/Publication: 2023-03-06 20:00:02 UTC
* Number of recursive dependencies: 74

Run `revdepcheck::cloud_details(, "ggnetwork")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(ggnetwork)
      Loading required package: ggplot2
      > 
      > test_check("ggnetwork")
      [ FAIL 1 | WARN 5 | SKIP 0 | PASS 38 ]
      
    ...
          ▆
       1. ├─testthat::expect_s3_class(...) at test-ggnetwork.R:35:3
       2. │ └─testthat::quasi_label(enquo(object), arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─ggnetwork::ggnetwork(n, layout = matrix(runif(28), ncol = 2)) at test-ggnetwork.R:36:5
       5.   └─ggnetwork:::fortify.igraph(x, ...)
      
      [ FAIL 1 | WARN 5 | SKIP 0 | PASS 38 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘sna’ ‘utils’
      All declared Imports should be used.
    ```

# inferCSN

<details>

* Version: 0.99.8
* GitHub: https://github.com/mengxu98/inferCSN
* Source code: https://github.com/cran/inferCSN
* Date/Publication: 2023-12-04 05:00:02 UTC
* Number of recursive dependencies: 100

Run `revdepcheck::cloud_details(, "inferCSN")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘inferCSN-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dynamic.networks
    > ### Title: Plot of dynamic networks
    > ### Aliases: dynamic.networks
    > 
    > ### ** Examples
    > 
    > library(inferCSN)
    > data("exampleMatrix")
    > weightDT <- inferCSN(exampleMatrix)
    > g <- dynamic.networks(weightDT, regulators = weightDT[1, 1])
    Error in fortify.igraph(x, ...) : 
      layout matrix dimensions do not match network size
    Calls: dynamic.networks -> ggnetwork -> fortify.igraph
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 35.6Mb
      sub-directories of 1Mb or more:
        libs  34.6Mb
    ```

# intergraph

<details>

* Version: 2.0-3
* GitHub: https://github.com/mbojan/intergraph
* Source code: https://github.com/cran/intergraph
* Date/Publication: 2023-08-20 23:22:33 UTC
* Number of recursive dependencies: 63

Run `revdepcheck::cloud_details(, "intergraph")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(intergraph)
      > 
      > test_check("intergraph")
      [ FAIL 2 | WARN 138 | SKIP 0 | PASS 54 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
      ── Error ('test-netcompare.R:5:3'): netcompare just works ──────────────────────
      Error in `eval(expr, envir, enclos)`: object 'r' not found
      Backtrace:
          ▆
       1. └─testthat::expect_snapshot(print(r)) at test-netcompare.R:5:3
       2.   └─rlang::cnd_signal(state$error)
      
      [ FAIL 2 | WARN 138 | SKIP 0 | PASS 54 ]
      Error: Test failures
      Execution halted
    ```

# manynet

<details>

* Version: 0.3.0
* GitHub: https://github.com/snlab-ch/manynet
* Source code: https://github.com/cran/manynet
* Date/Publication: 2023-12-15 19:10:02 UTC
* Number of recursive dependencies: 140

Run `revdepcheck::cloud_details(, "manynet")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(manynet)
      Registered S3 method overwritten by 'manynet':
        method          from     
        print.tbl_graph tidygraph
      > 
      > test_check("manynet")
    ...
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-make_create.R:40:3'): tree creation works ────────────────────
      unname(as_matrix(create_tree(c(2, 2)))) not equal to matrix(c(1, 1, 1, 0), 2, 2).
      1/4 mismatches
      [1] 0 - 1 == -1
      
      [ FAIL 1 | WARN 13 | SKIP 14 | PASS 329 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘Rgraphviz’
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 7 marked UTF-8 strings
    ```

# migraph

<details>

* Version: 1.2.1
* GitHub: https://github.com/snlab-ch/migraph
* Source code: https://github.com/cran/migraph
* Date/Publication: 2023-12-17 22:30:02 UTC
* Number of recursive dependencies: 115

Run `revdepcheck::cloud_details(, "migraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘migraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: features
    > ### Title: Measures of network topological features
    > ### Aliases: features network_core network_richclub network_factions
    > ###   network_modularity network_smallworld network_scalefree
    > ###   network_balance
    > 
    > ### ** Examples
    ...
    [1] -0.458
    > network_smallworld(ison_brandes)
    [1] NaN
    > network_smallworld(ison_southern_women)
    [1] -1.03
    > network_scalefree(ison_adolescents)
    Error in if (out$KS.p < 0.05) cat(paste("Note: Kolgomorov-Smirnov test that data",  : 
      argument is of length zero
    Calls: network_scalefree
    Execution halted
    ```

# molnet

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/molnet
* Date/Publication: 2021-08-06 08:30:02 UTC
* Number of recursive dependencies: 124

Run `revdepcheck::cloud_details(, "molnet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘molnet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: graph_metrics
    > ### Title: Analyses metrics of an iGraph object
    > ### Aliases: graph_metrics
    > 
    > ### ** Examples
    > 
    > adj_mat <- matrix(rnorm(36),nrow=6)
    > graph <- igraph::graph_from_adjacency_matrix(adj_mat)
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:329 : Edge counts should be non-negative, found -2.2147. Invalid value
    Calls: <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

# NAIR

<details>

* Version: 1.0.2
* GitHub: https://github.com/mlizhangx/Network-Analysis-for-Repertoire-Sequencing-
* Source code: https://github.com/cran/NAIR
* Date/Publication: 2023-09-27 10:20:08 UTC
* Number of recursive dependencies: 86

Run `revdepcheck::cloud_details(, "NAIR")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(NAIR)
      Welcome to NAIR: Network Analysis of Immune Repertoire.
      Get started using `vignette("NAIR")`, or by visiting
      https://mlizhangx.github.io/Network-Analysis-for-Repertoire-Sequencing-/
      > 
      > test_check("NAIR")
    ...
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test_functions.R:722:3'): addClusterMembership works ──────────────
      net$details$clusters_in_network (`actual`) not equal to c(fast_greedy = 20, leiden = 55) (`expected`).
      
        `actual`: 20 53
      `expected`: 20 55
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 1219 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.1Mb
      sub-directories of 1Mb or more:
        libs   6.6Mb
    ```

# nat

<details>

* Version: 1.8.23
* GitHub: https://github.com/natverse/nat
* Source code: https://github.com/cran/nat
* Date/Publication: 2023-08-25 15:40:02 UTC
* Number of recursive dependencies: 91

Run `revdepcheck::cloud_details(, "nat")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Complete output:
      > library(testthat)
      > library(nat)
      Loading required package: rgl
      Registered S3 method overwritten by 'nat':
        method             from
        as.mesh3d.ashape3d rgl 
      Some nat functions depend on a CMTK installation. See ?cmtk and README.md for details.
    ...
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. ├─base::subset(n, n_graph_dfs$order, invert = T)
       5. └─nat:::subset.neuron(n, n_graph_dfs$order, invert = T)
       6.   └─nat::prune_vertices(x, r, invert = !invert, ...)
       7.     └─igraph::delete.vertices(g, verticestoprune)
       8.       └─igraph::delete_vertices(graph = graph, v = v)
      
      [ FAIL 1 | WARN 20 | SKIP 5 | PASS 787 ]
      Error: Test failures
      Execution halted
    ```

# netcom

<details>

* Version: 2.1.6
* GitHub: https://github.com/langendorfr/netcom
* Source code: https://github.com/cran/netcom
* Date/Publication: 2022-07-21 17:40:06 UTC
* Number of recursive dependencies: 104

Run `revdepcheck::cloud_details(, "netcom")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘netcom-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: best_fit_optim
    > ### Title: Empirical parameterization
    > ### Aliases: best_fit_optim
    > 
    > ### ** Examples
    > 
    > # Import netcom
    ...
    +          "clustering_coefficient", "page_rank", "communities"
    +      ), 
    +      DD_weight = 1, 
    +      max_norm = FALSE,
    +      verbose = FALSE
    + )
    Error in igraph::transitivity(igraph_graph, type = "weighted") : 
      At vendor/cigraph/src/properties/triangles.c:885 : Barrat's weighted transitivity measure works only if the graph has no multi-edges. Invalid value
    Calls: best_fit_optim -> compare_Target -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘tutorial.Rmd’ using rmarkdown
    
    Quitting from lines 200-215 [Classify networks] (tutorial.Rmd)
    Error: processing vignette 'tutorial.Rmd' failed with diagnostics:
    At vendor/cigraph/src/properties/triangles.c:885 : Barrat's weighted transitivity measure works only if the graph has no multi-edges. Invalid value
    --- failed re-building ‘tutorial.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘tutorial.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘ggfortify’ ‘ggplot2’ ‘ggraph’ ‘reshape2’
      All declared Imports should be used.
    ```

# nosoi

<details>

* Version: 1.1.0
* GitHub: https://github.com/slequime/nosoi
* Source code: https://github.com/cran/nosoi
* Date/Publication: 2021-08-17 16:20:02 UTC
* Number of recursive dependencies: 147

Run `revdepcheck::cloud_details(, "nosoi")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘continuous.Rmd’ using rmarkdown
    --- finished re-building ‘continuous.Rmd’
    
    --- re-building ‘discrete.Rmd’ using rmarkdown
    
    Quitting from lines 49-83 [setupMatrix] (discrete.Rmd)
    Error: processing vignette 'discrete.Rmd' failed with diagnostics:
    layout matrix dimensions do not match network size
    --- failed re-building ‘discrete.Rmd’
    ...
    --- failed re-building ‘nosoi.Rmd’
    
    --- re-building ‘output.Rmd’ using rmarkdown
    --- finished re-building ‘output.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘discrete.Rmd’ ‘nosoi.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# oddnet

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/oddnet
* Date/Publication: 2022-12-22 20:10:01 UTC
* Number of recursive dependencies: 85

Run `revdepcheck::cloud_details(, "oddnet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘oddnet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: tensorsplat
    > ### Title: Implements Danai Koutra's TensorSplat algorithm
    > ### Aliases: tensorsplat
    > 
    > ### ** Examples
    > 
    > # We generate a series of networks and add an anomaly at 50th network.
    ...
    > networks <- list()
    > p.or.m.seq <- rep(0.05, 50)
    > p.or.m.seq[20] <- 0.2  # anomalous network at 20
    > for(i in 1:100){
    +   gr <- igraph::erdos.renyi.game(100, p.or.m = p.or.m.seq[i])
    +   networks[[i]] <- igraph::as_adjacency_matrix(gr)
    + }
    Error in igraph::erdos.renyi.game(100, p.or.m = p.or.m.seq[i]) : 
      At vendor/cigraph/src/math/safe_intop.c:128 : NaN cannot be converted to an integer. Invalid value
    Execution halted
    ```

# pcalg

<details>

* Version: 2.7-9
* GitHub: NA
* Source code: https://github.com/cran/pcalg
* Date/Publication: 2023-09-26 05:40:03 UTC
* Number of recursive dependencies: 58

Run `revdepcheck::cloud_details(, "pcalg")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘test_LINGAM.R’
      Running ‘test_addBgKnowledge.R’
      Running ‘test_adjustment.R’
      Running ‘test_ages.R’
      Running ‘test_amat2dag.R’
      Running ‘test_arges.R’
      Running ‘test_backdoor.R’
      Comparing ‘test_backdoor.Rout’ to ‘test_backdoor.Rout.save’ ... OK
      Running ‘test_bicscore.R’
      Running ‘test_causalEffect.R’
    ...
      +     , warning = function(w) {
      +         rDAG.warn <<- conditionMessage(w); invokeRestart("muffleWarning") })
      > ## with a low-level warning:
      > ## IGNORE_RDIFF_BEGIN
      > rDAG.warn
      [1] "The `edges` argument of `as_adjacency_matrix` is deprecated; it will be removed in igraph 1.4.0"
      > ## IGNORE_RDIFF_END
      > stopifnot(grepl("graph_molloy_.*Cannot shuffle graph", rDAG.warn))
      Error: grepl("graph_molloy_.*Cannot shuffle graph", rDAG.warn) is not TRUE
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 20.0Mb
      sub-directories of 1Mb or more:
        data   2.1Mb
        libs  14.6Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘combinat’, ‘unifDAG’
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘vignette2018.Rnw’ using Sweave
    Loading required package: Rgraphviz
    Loading required package: graph
    Loading required package: BiocGenerics
    
    Attaching package: 'BiocGenerics'
    
    The following objects are masked from 'package:stats':
    
    ...
    l.179   \RequirePackage{grfext}\relax
                                         ^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building 'vignette2018.Rnw'
    
    SUMMARY: processing the following file failed:
      'vignette2018.Rnw'
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# phyloseqGraphTest

<details>

* Version: 0.1.0
* GitHub: https://github.com/jfukuyama/phyloseqGraphTest
* Source code: https://github.com/cran/phyloseqGraphTest
* Date/Publication: 2020-02-07 16:30:02 UTC
* Number of recursive dependencies: 95

Run `revdepcheck::cloud_details(, "phyloseqGraphTest")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘phyloseqGraphTest-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot_test_network
    > ### Title: Plots the graph used for testing
    > ### Aliases: plot_test_network
    > 
    > ### ** Examples
    > 
    > library(phyloseq)
    > data(enterotype)
    > gt = graph_perm_test(enterotype, sampletype = "SeqTech")
    > plot_test_network(gt)
    Error in fortify.igraph(data, ...) : 
      layout matrix dimensions do not match network size
    Calls: plot_test_network ... ggplot -> ggplot.default -> fortify -> fortify.igraph
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘gt_vignette.Rmd’ using rmarkdown
    
    Quitting from lines 175-176 [unnamed-chunk-5] (gt_vignette.Rmd)
    Error: processing vignette 'gt_vignette.Rmd' failed with diagnostics:
    layout matrix dimensions do not match network size
    --- failed re-building ‘gt_vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘gt_vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘intergraph’
      All declared Imports should be used.
    ```

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# riverconn

<details>

* Version: 0.3.28
* GitHub: NA
* Source code: https://github.com/cran/riverconn
* Date/Publication: 2023-05-05 08:20:02 UTC
* Number of recursive dependencies: 96

Run `revdepcheck::cloud_details(, "riverconn")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Tutorial.Rmd’ using rmarkdown
    
    Quitting from lines 210-221 [plot igraph] (Tutorial.Rmd)
    Error: processing vignette 'Tutorial.Rmd' failed with diagnostics:
    layout matrix dimensions do not match network size
    --- failed re-building ‘Tutorial.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Tutorial.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# tidygraph

<details>

* Version: 1.3.0
* GitHub: https://github.com/thomasp85/tidygraph
* Source code: https://github.com/cran/tidygraph
* Date/Publication: 2023-12-18 10:30:02 UTC
* Number of recursive dependencies: 80

Run `revdepcheck::cloud_details(, "tidygraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidygraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: random_walk_rank
    > ### Title: Perform a random walk on the graph and return encounter rank
    > ### Aliases: random_walk_rank
    > 
    > ### ** Examples
    > 
    > graph <- create_notable("zachary")
    ...
      8. │       └─dplyr:::mutate_col(dots[[i]], data, mask, new_columns)
      9. │         └─mask$eval_all_mutate(quo)
     10. │           └─dplyr (local) eval()
     11. ├─tidygraph::random_walk_rank(200)
     12. │ └─igraph::random_walk(graph, root, n, mode)
     13. │   └─igraph:::random_walk_impl(...)
     14. └─base::.handleSimpleError(...)
     15.   └─dplyr (local) h(simpleError(msg, call))
     16.     └─rlang::abort(message, class = error_class, parent = parent, call = error_call)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > # This file is part of the standard setup for testthat.
      > # It is recommended that you do not modify it.
      > #
      > # Where should you do additional test configuration?
      > # Learn more about the roles of various files in:
      > # * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
      > # * https://testthat.r-lib.org/articles/special-files.html
    ...
       12. ├─tidygraph::random_walk_rank(30, 5)
       13. │ └─igraph::random_walk(graph, root, n, mode)
       14. │   └─igraph:::random_walk_impl(...)
       15. └─base::.handleSimpleError(...)
       16.   └─dplyr (local) h(simpleError(msg, call))
       17.     └─rlang::abort(message, class = error_class, parent = parent, call = error_call)
      
      [ FAIL 2 | WARN 21 | SKIP 0 | PASS 430 ]
      Error: Test failures
      Execution halted
    ```

