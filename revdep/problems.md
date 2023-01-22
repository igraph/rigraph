# backbone

<details>

* Version: 2.1.1
* GitHub: https://github.com/zpneal/backbone
* Source code: https://github.com/cran/backbone
* Date/Publication: 2022-10-18 17:35:06 UTC
* Number of recursive dependencies: 36

Run `revdepcheck::cloud_details(, "backbone")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘tinytest.R’
    Running the tests in ‘tests/tinytest.R’ failed.
    Last 13 lines of output:
      test_backbone.R...............   29 tests [0;32mOK[0m 
      test_backbone.R...............   30 tests [0;32mOK[0m 
      test_backbone.R...............   30 tests [0;32mOK[0m 
      test_backbone.R...............   30 tests [0;32mOK[0m 
      test_backbone.R...............   30 tests [0;32mOK[0m 
      test_backbone.R...............   31 tests [0;32mOK[0m 
      test_backbone.R...............   32 tests [0;32mOK[0m 
      test_backbone.R...............   33 tests [0;32mOK[0m 
      test_backbone.R...............   34 tests [0;32mOK[0m 
      test_backbone.R...............   35 tests [0;32mOK[0m 
      test_backbone.R...............   36 tests [0;32mOK[0m 
      test_backbone.R...............   36 tests [0;32mOK[0m Error in i_set_vertex_attr(x, attr(value, "name"), index = value, value = attr(value,  : 
        strict recycling (1)
      Calls: <Anonymous> ... FUN -> eval -> eval -> <Anonymous> -> i_set_vertex_attr
      Execution halted
    ```

# clustAnalytics

<details>

* Version: 0.5.2
* GitHub: NA
* Source code: https://github.com/cran/clustAnalytics
* Date/Publication: 2022-11-09 11:50:09 UTC
* Number of recursive dependencies: 69

Run `revdepcheck::cloud_details(, "clustAnalytics")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘cluster_stability.Rmd’ using rmarkdown
    --- finished re-building ‘cluster_stability.Rmd’
    
    --- re-building ‘graph_rewiring_functions.Rmd’ using rmarkdown
    --- finished re-building ‘graph_rewiring_functions.Rmd’
    
    --- re-building ‘other_functions.Rmd’ using rmarkdown
    --- finished re-building ‘other_functions.Rmd’
    ...
    Quitting from lines 109-111 (stability_significance_examples.Rmd) 
    Error: processing vignette 'stability_significance_examples.Rmd' failed with diagnostics:
    strict recycling (1)
    --- failed re-building ‘stability_significance_examples.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘stability_significance_examples.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.6Mb
      sub-directories of 1Mb or more:
        libs   6.1Mb
    ```

# deepdep

<details>

* Version: 0.4.1
* GitHub: https://github.com/DominikRafacz/deepdep
* Source code: https://github.com/cran/deepdep
* Date/Publication: 2021-12-20 16:20:02 UTC
* Number of recursive dependencies: 144

Run `revdepcheck::cloud_details(, "deepdep")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        6.     └─ggraph:::create_layout.default(graph, layout, ...)
        7.       ├─ggraph::create_layout(graph, layout, ...)
        8.       └─ggraph:::create_layout.tbl_graph(graph, layout, ...)
        9.         ├─dplyr::mutate(ungroup(activate(graph, "nodes")), .ggraph.orig_index = seq_len(graph_order()))
       10.         └─tidygraph:::mutate.tbl_graph(...)
       11.           └─tidygraph::mutate_as_tbl(.data, !!!dot)
       12.             ├─tidygraph:::set_graph_data(.data, d_tmp)
       13.             └─tidygraph:::set_graph_data.tbl_graph(.data, d_tmp)
       14.               └─tidygraph:::set_node_attributes(x, value)
       15.                 └─igraph::`vertex_attr<-`(`*tmp*`, value = as.list(value))
       16.                   └─igraph::`vertex.attributes<-`(graph, index = index, value = value)
      
      [ FAIL 9 | WARN 0 | SKIP 2 | PASS 25 ]
      Error: Test failures
      Execution halted
    ```

# Diderot

<details>

* Version: 0.13
* GitHub: NA
* Source code: https://github.com/cran/Diderot
* Date/Publication: 2020-04-19 11:20:02 UTC
* Number of recursive dependencies: 15

Run `revdepcheck::cloud_details(, "Diderot")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘Diderot-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: build_graph
    > ### Title: Builds a citation graph.
    > ### Aliases: build_graph 'Citation Graph Building'
    > 
    > ### ** Examples
    > 
    > ## Don't show: 
    ...
    > unlink(c(tempfi1, tempfi2))
    > ## End(Don't show)
    > 
    > # Build graph
    > gr<-build_graph(db=db,small.year.mismatch=TRUE, attrs=c("Corpus","Year","Authors"), nb.cores=1)
    starting worker pid=11556 on localhost:11592 at 20:54:39.535
    Error in i_set_vertex_attr(graph = graph, name = name, value = value,  : 
      strict recycling (1)
    Calls: build_graph -> set.vertex.attribute -> i_set_vertex_attr
    Execution halted
    ```

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

# gemtc

<details>

* Version: 1.0-1
* GitHub: https://github.com/gertvv/gemtc
* Source code: https://github.com/cran/gemtc
* Date/Publication: 2021-05-14 23:20:02 UTC
* Number of recursive dependencies: 56

Run `revdepcheck::cloud_details(, "gemtc")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘gemtc-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: atrialFibrillation
    > ### Title: Prevention of stroke in atrial fibrillation patients
    > ### Aliases: atrialFibrillation
    > 
    > ### ** Examples
    > 
    > # Build a model similar to Model 4(b) from Cooper et al. (2009):
    ...
    +                   classes=classes)
    > 
    > model <- mtc.model(atrialFibrillation,
    +                    type="regression",
    +                    regressor=regressor,
    +                    om.scale=10)
    Error in i_set_edge_attr(graph = graph, name = name, index = index, value = value) : 
      strict recycling (2)
    Calls: mtc.model ... add_edges -> edge_attr<- -> set_edge_attr -> i_set_edge_attr
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘test.R’
    Running the tests in ‘tests/test.R’ failed.
    Last 13 lines of output:
           ▆
        1. └─gemtc::relative.effect.table(smoking_result) at test-unit-relative.effect.table.R:5:2
        2.   ├─base::as.matrix(...)
        3.   └─gemtc::relative.effect(...)
        4.     └─gemtc:::spanning.tree.mtc.result(result)
        5.       └─gemtc:::graph.create(...)
        6.         └─igraph:::`+.igraph`(g, edges.create(e, ...))
        7.           └─igraph::add_edges(e1, as.igraph.vs(e1, toadd), attr = attr)
        8.             └─igraph::`edge_attr<-`(`*tmp*`, nam[[i]], idx, value = attrs[[nam[i]]])
        9.               └─igraph::set_edge_attr(graph, name = name, index = index, value = value)
       10.                 └─igraph:::i_set_edge_attr(...)
      
      [ FAIL 35 | WARN 0 | SKIP 0 | PASS 269 ]
      Error: Test failures
      Execution halted
    ```

# GREMLINS

<details>

* Version: 0.2.0
* GitHub: https://github.com/demiperimetre/GREMLINS
* Source code: https://github.com/cran/GREMLINS
* Date/Publication: 2020-11-25 13:50:04 UTC
* Number of recursive dependencies: 62

Run `revdepcheck::cloud_details(, "GREMLINS")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘GREMLINS-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plotMBM
    > ### Title: Plot the mesoscopic view of the estimated MBM
    > ### Aliases: plotMBM
    > 
    > ### ** Examples
    > 
    > namesFG <- c('A','B')
    ...
    [1] "gaussian"  "bernoulli"
    [1] "-------------------------------------------------------------------"
    [1] " ------ Searching the numbers of blocks starting from [ 2 2 ] blocks"
    [1] "ICL : -2028.78 . Nb of blocks: [ 2 2 ]"
    [1] "Best model------ ICL : -2028.78 . Nb of clusters: [ 2 2 ] for [ A , B ] respectively"
    > plotMBM(res_MBMsimu)
    Error in i_set_edge_attr(graph = graph, name = name, value = value, check = FALSE) : 
      strict recycling (2)
    Calls: plotMBM -> %>% -> set_edge_attr -> i_set_edge_attr
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘EcologicalNetwork.Rmd’ using rmarkdown
    Quitting from lines 130-131 (EcologicalNetwork.Rmd) 
    Error: processing vignette 'EcologicalNetwork.Rmd' failed with diagnostics:
    strict recycling (2)
    --- failed re-building ‘EcologicalNetwork.Rmd’
    
    --- re-building ‘Introduction.Rmd’ using rmarkdown
    --- finished re-building ‘Introduction.Rmd’
    
    --- re-building ‘SimulatedNetwork.Rmd’ using rmarkdown
    --- finished re-building ‘SimulatedNetwork.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘EcologicalNetwork.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘mclust’
      All declared Imports should be used.
    ```

# incidentally

<details>

* Version: 1.0.1
* GitHub: https://github.com/zpneal/incidentally
* Source code: https://github.com/cran/incidentally
* Date/Publication: 2022-08-05 22:40:09 UTC
* Number of recursive dependencies: 37

Run `revdepcheck::cloud_details(, "incidentally")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘congress.Rmd’ using rmarkdown
    trying URL 'https://www.govinfo.gov/bulkdata/BILLSTATUS/115/sres/BILLSTATUS-115-sres.zip'
    Content type 'application/zip' length 2070239 bytes (2.0 MB)
    ==================================================
    downloaded 2.0 MB
    
    trying URL 'https://www.govinfo.gov/bulkdata/BILLSTATUS/115/sres/BILLSTATUS-115-sres.zip'
    Content type 'application/zip' length 2070239 bytes (2.0 MB)
    ...
    --- failed re-building ‘congress.Rmd’
    
    --- re-building ‘incidentally.Rmd’ using rmarkdown
    --- finished re-building ‘incidentally.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘congress.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# metanetwork

<details>

* Version: 0.7.0
* GitHub: https://github.com/MarcOhlmann/metanetwork
* Source code: https://github.com/cran/metanetwork
* Date/Publication: 2022-12-05 14:10:02 UTC
* Number of recursive dependencies: 105

Run `revdepcheck::cloud_details(, "metanetwork")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Epoch: Iteration #300 error is: 199.576452337934
      x_max = 1356.85756899361
      y_max = 351.624293301058
      [ FAIL 1 | WARN 22 | SKIP 0 | PASS 73 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-compute_TL.R:25'): Computation of trophic levels of norway dataset ──
      V(meta0$metaweb)$TL (`actual`) not equal to V(meta_angola$metaweb)$TL (`expected`).
      
      `names(actual)` is a character vector ('Trachurus', 'Sardinella', 'Sciaenidae', 'Ariidae', 'Merluccius', ...)
      `names(expected)` is absent
      
      [ FAIL 1 | WARN 22 | SKIP 0 | PASS 73 ]
      Error: Test failures
      Execution halted
    ```

# mstknnclust

<details>

* Version: 0.3.1
* GitHub: NA
* Source code: https://github.com/cran/mstknnclust
* Date/Publication: 2020-09-17 12:20:03 UTC
* Number of recursive dependencies: 34

Run `revdepcheck::cloud_details(, "mstknnclust")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘guide.Rmd’ using rmarkdown
    Quitting from lines 103-110 (guide.Rmd) 
    Error: processing vignette 'guide.Rmd' failed with diagnostics:
    strict recycling (1)
    --- failed re-building ‘guide.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘guide.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# nat

<details>

* Version: 1.8.19
* GitHub: https://github.com/natverse/nat
* Source code: https://github.com/cran/nat
* Date/Publication: 2022-04-06 11:50:02 UTC
* Number of recursive dependencies: 86

Run `revdepcheck::cloud_details(, "nat")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘nat-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: prune_strahler
    > ### Title: Prune a neuron by removing segments with a given Strahler order
    > ### Aliases: prune_strahler
    > 
    > ### ** Examples
    > 
    > x=Cell07PNs[[1]]
    > pruned12=prune_strahler(x)
    Error in value[[3L]](cond) : 
      No points left after pruning. Consider lowering orders to prune!
    Calls: prune_strahler ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(...) at test-ngraph.R:193:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─nat::strahler_order(n)
       5.   └─nat::segmentgraph(x, weights = F)
       6.     └─igraph::add.edges(g, elred, segid = segids)
       7.       └─igraph::`edge_attr<-`(`*tmp*`, nam[[i]], idx, value = attrs[[nam[i]]])
       8.         └─igraph::set_edge_attr(graph, name = name, index = index, value = value)
       9.           └─igraph:::i_set_edge_attr(...)
      
      [ FAIL 5 | WARN 414 | SKIP 5 | PASS 774 ]
      Error: Test failures
      Execution halted
    ```

# netmeta

<details>

* Version: 2.7-0
* GitHub: https://github.com/guido-s/netmeta
* Source code: https://github.com/cran/netmeta
* Date/Publication: 2022-12-22 09:30:02 UTC
* Number of recursive dependencies: 90

Run `revdepcheck::cloud_details(, "netmeta")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘netmeta-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: netcontrib
    > ### Title: Contribution matrix in network meta-analysis
    > ### Aliases: netcontrib print.netcontrib
    > ### Keywords: contribution
    > 
    > ### ** Examples
    > 
    ...
    > # Use the Woods dataset
    > #
    > data("Woods2010")
    > p1 <- pairwise(treatment, event = r, n = N,
    +   studlab = author, data = Woods2010, sm = "OR")
    > 
    > net1 <- netmeta(p1)
    > cm <- netcontrib(net1)
    Error: C stack usage  9962452 is too close to the limit
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 2 marked UTF-8 strings
    ```

# poppr

<details>

* Version: 2.9.3
* GitHub: https://github.com/grunwaldlab/poppr
* Source code: https://github.com/cran/poppr
* Date/Publication: 2021-09-07 07:00:02 UTC
* Number of recursive dependencies: 97

Run `revdepcheck::cloud_details(, "poppr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      Attributes: < Modes: list, NULL >
      Attributes: < Lengths: 3, 0 >
      Attributes: < names for target but not for current >
      Attributes: < current is not list-like >
      target is table, current is numeric
      Backtrace:
          ▆
       1. └─poppr (local) expect_vertex_size_scale(pmsn, as.integer(table(mll(pc)))) at test-msn.R:439:2
       2.   ├─base::eval(...) at test-msn.R:105:2
       3.   │ └─base::eval(...)
       4.   └─testthat::expect_equal(...)
      
      [ FAIL 2 | WARN 0 | SKIP 181 | PASS 378 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘algo.Rnw’ using knitr
    Error: processing vignette 'algo.Rnw' failed with diagnostics:
    Running 'texi2dvi' on 'algo.tex' failed.
    LaTeX errors:
    ! LaTeX Error: File `colortbl.sty' not found.
    
    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: sty)
    ...
    l.270 \long
               \def\@secondoffive#1#2#3#4#5{#2}^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘algo.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘algo.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘RClone’
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
    Error in i_set_edge_attr(x, attr(value, "name"), index = value, value = attr(value,  : 
      strict recycling (2)
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

# signnet

<details>

* Version: 1.0.0
* GitHub: https://github.com/schochastics/signnet
* Source code: https://github.com/cran/signnet
* Date/Publication: 2022-12-22 15:10:02 UTC
* Number of recursive dependencies: 101

Run `revdepcheck::cloud_details(, "signnet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘signnet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: triad_census_signed
    > ### Title: signed triad census
    > ### Aliases: triad_census_signed
    > 
    > ### ** Examples
    > 
    > library(igraph)
    ...
    The following object is masked from ‘package:base’:
    
        union
    
    > g <- graph.full(4, directed = TRUE)
    > E(g)$sign <- c(-1, 1, 1, -1, -1, 1)
    Error in i_set_edge_attr(x, attr(value, "name"), index = value, value = attr(value,  : 
      strict recycling (2)
    Calls: E<- -> i_set_edge_attr
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.8Mb
      sub-directories of 1Mb or more:
        libs   6.2Mb
    ```

