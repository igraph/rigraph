# bibliometrix

<details>

* Version: 4.1.3
* GitHub: https://github.com/massimoaria/bibliometrix
* Source code: https://github.com/cran/bibliometrix
* Date/Publication: 2023-06-15 20:10:02 UTC
* Number of recursive dependencies: 151

Run `revdepcheck::cloud_details(, "bibliometrix")` for more info

</details>

## Newly broken

*   checking whether package ‘bibliometrix’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Note: possible error in 'betweenness(net, v = V(net), ': unused argument (nobigint = TRUE) 
    See ‘/tmp/workdir/bibliometrix/new/bibliometrix.Rcheck/00install.out’ for details.
    Information on the location(s) of code generating the ‘Note’s can be
    obtained by re-running with environment variable R_KEEP_PKG_SOURCE set
    to ‘yes’.
    ```

*   checking R code for possible problems ... NOTE
    ```
    networkStat: possible error in betweenness(net, v = V(net), directed =
      FALSE, weights = NULL, nobigint = TRUE, normalized = TRUE): unused
      argument (nobigint = TRUE)
    ```

# Canek

<details>

* Version: 0.2.4
* GitHub: https://github.com/MartinLoza/Canek
* Source code: https://github.com/cran/Canek
* Date/Publication: 2023-11-06 00:10:02 UTC
* Number of recursive dependencies: 222

Run `revdepcheck::cloud_details(, "Canek")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(Canek)
      > 
      > test_check("Canek")
      [ FAIL 2 | WARN 3 | SKIP 0 | PASS 90 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
      as.integer(table(dataLouvain$cluster)) not equal to c(96, 125, 140, 171, 99).
      Lengths differ: 4 is not 5
      ── Failure ('test-Clustering.R:20:3'): Clustering with louvain works ───────────
      dim(dataLouvain$centers) not equal to c(5, 10).
      1/2 mismatches
      [1] 4 - 5 == -1
      
      [ FAIL 2 | WARN 3 | SKIP 0 | PASS 90 ]
      Error: Test failures
      Execution halted
    ```

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
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 61 ]
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
      [ FAIL 2 | WARN 12 | SKIP 0 | PASS 2128 ]
      
    ...
      1/1 mismatches
      [1] 107 - 98 == 9
      ── Failure ('test-count_entities.R:142:3'): counting the number of strongly connected components is possible ──
      graph %>% count_s_connected_cmpts() not equal to 4.
      1/1 mismatches
      [1] 2 - 4 == -2
      
      [ FAIL 2 | WARN 12 | SKIP 0 | PASS 2128 ]
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
* Number of recursive dependencies: 75

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
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 38 ]
      
    ...
          ▆
       1. ├─testthat::expect_s3_class(...) at test-ggnetwork.R:35:3
       2. │ └─testthat::quasi_label(enquo(object), arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─ggnetwork::ggnetwork(n, layout = matrix(runif(28), ncol = 2)) at test-ggnetwork.R:36:5
       5.   └─ggnetwork:::fortify.igraph(x, ...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 38 ]
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

* Version: 0.99.7
* GitHub: https://github.com/mengxu98/inferCSN
* Source code: https://github.com/cran/inferCSN
* Date/Publication: 2023-10-30 10:30:02 UTC
* Number of recursive dependencies: 101

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
      installed size is 28.4Mb
      sub-directories of 1Mb or more:
        libs  27.4Mb
    ```

# influential

<details>

* Version: 2.2.7
* GitHub: https://github.com/asalavaty/influential
* Source code: https://github.com/cran/influential
* Date/Publication: 2023-05-16 05:10:02 UTC
* Number of recursive dependencies: 196

Run `revdepcheck::cloud_details(, "influential")` for more info

</details>

## Newly broken

*   checking dependencies in R code ... WARNING
    ```
    '::' or ':::' import not declared from: ‘lifecycle’
    ```

*   checking for code/documentation mismatches ... WARNING
    ```
    Codoc mismatches from documentation object 'graph_from_incidence_matrix':
    graph_from_incidence_matrix
      Code: function(...)
      Docs: function(incidence, directed = FALSE, mode = c("all", "out",
                     "in", "total"), multiple = FALSE, weighted = NULL,
                     add.names = NULL)
      Argument names in code not in docs:
        ...
      Argument names in docs not in code:
        incidence directed mode multiple weighted add.names
      Mismatches in argument names:
        Position: 1 Code: ... Docs: incidence
    ```

# malan

<details>

* Version: 1.0.2
* GitHub: https://github.com/mikldk/malan
* Source code: https://github.com/cran/malan
* Date/Publication: 2020-06-25 12:00:06 UTC
* Number of recursive dependencies: 91

Run `revdepcheck::cloud_details(, "malan")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘malan-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: from_igraph
    > ### Title: Convert igraph to population
    > ### Aliases: from_igraph
    > 
    > ### ** Examples
    > 
    > g <- igraph::graph_from_literal( 2 +- 1 -+ 3, 4 -+ 5 )
    > plot(g)
    > pop <- from_igraph(g)
    Error in from_igraph(g) : x must be a tree (or a forest)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(malan)
      Loading required package: dplyr
      
      Attaching package: 'dplyr'
      
      The following object is masked from 'package:testthat':
    ...
       1. └─malan::from_igraph(g1) at test-igraph.R:5:3
      ── Error ('test-igraph.R:22:3'): igraph import works for forest ────────────────
      Error in `from_igraph(g2)`: x must be a tree (or a forest)
      Backtrace:
          ▆
       1. └─malan::from_igraph(g2) at test-igraph.R:22:3
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 439 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 22.8Mb
      sub-directories of 1Mb or more:
        libs  21.8Mb
    ```

# manynet

<details>

* Version: 0.2.8
* GitHub: https://github.com/snlab-ch/manynet
* Source code: https://github.com/cran/manynet
* Date/Publication: 2023-11-02 10:10:08 UTC
* Number of recursive dependencies: 138

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
      
      [ FAIL 1 | WARN 0 | SKIP 10 | PASS 303 ]
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

* Version: 1.1.5
* GitHub: https://github.com/snlab-ch/migraph
* Source code: https://github.com/cran/migraph
* Date/Publication: 2023-11-02 10:10:02 UTC
* Number of recursive dependencies: 117

Run `revdepcheck::cloud_details(, "migraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘migraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: eigenv_centrality
    > ### Title: Measures of eigenvector-like centrality and centralisation
    > ### Aliases: eigenv_centrality node_eigenvector node_power node_alpha
    > ###   node_pagerank network_eigenvector tie_eigenvector
    > 
    > ### ** Examples
    > 
    > node_eigenvector(mpn_elite_mex)
    Warning in is(eval_try, "function") && as.character(options_value) == "arpack_defaults" :
      'length(x) = 3 > 1' in coercion to 'logical(1)'
    Error in utils::modifyList(x, y) : is.list(val) is not TRUE
    Calls: node_eigenvector ... eigenvector_centrality_impl -> modify_list -> <Anonymous> -> stopifnot
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(manynet)
      > library(migraph)
      
      Attaching package: 'migraph'
      
      The following objects are masked from 'package:manynet':
    ...
        5.   └─migraph::node_eigenvector(edge_adj, normalized = normalized)
        6.     └─igraph::eigen_centrality(...)
        7.       └─igraph:::eigenvector_centrality_impl(...)
        8.         └─igraph:::modify_list(arpack_defaults(), options)
        9.           └─utils::modifyList(x, y)
       10.             └─base::stopifnot(is.list(x), is.list(val))
      
      [ FAIL 4 | WARN 4 | SKIP 0 | PASS 270 ]
      Error: Test failures
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
* Number of recursive dependencies: 87

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
      `expected`: 20 55
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 1219 ]
      Error: Test failures
      In addition: Warning messages:
      1: In for (i in seq_len(n)) { :
        closing unused connection 5 (/tmp/RtmpJoxdQ9/c.rds)
      2: In for (i in seq_len(n)) { :
        closing unused connection 4 (/tmp/RtmpJoxdQ9/b.rds)
      Execution halted
    ```

# nat

<details>

* Version: 1.8.23
* GitHub: https://github.com/natverse/nat
* Source code: https://github.com/cran/nat
* Date/Publication: 2023-08-25 15:40:02 UTC
* Number of recursive dependencies: 92

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
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. ├─base::subset(n, n_graph_dfs$order, invert = T)
       5. └─nat:::subset.neuron(n, n_graph_dfs$order, invert = T)
       6.   └─nat::prune_vertices(x, r, invert = !invert, ...)
       7.     └─igraph::delete.vertices(g, verticestoprune)
      
      [ FAIL 1 | WARN 0 | SKIP 5 | PASS 787 ]
      Error: Test failures
      Execution halted
    ```

# netcom

<details>

* Version: 2.1.6
* GitHub: https://github.com/langendorfr/netcom
* Source code: https://github.com/cran/netcom
* Date/Publication: 2022-07-21 17:40:06 UTC
* Number of recursive dependencies: 105

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

*   checking examples ... ERROR
    ```
    Running examples in ‘pcalg-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: pc
    > ### Title: Estimate the Equivalence Class of a DAG using the PC Algorithm
    > ### Aliases: pc
    > ### Keywords: multivariate models graphs
    > 
    > ### ** Examples
    > 
    ...
    Order=3; remaining edges:16
    
    Rule 1': 1 -> 6  and  6 - 7  where  1  and  7  not connected and  1 6 7  faithful triple:  6 -> 7 
    > 
    > ## due to sampling error, some edges were overwritten:
    > isValidGraph(as(pc.fit, "amat"), type = "cpdag")
    Error in UseMethod("isSymmetric") : 
      no applicable method for 'isSymmetric' applied to an object of class "amat"
    Calls: isValidGraph ... ensure_igraph -> graph.adjacency -> is_symmetric -> isSymmetric
    Execution halted
    ```

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
      > set.seed(37)
      > rD.10.4 <- withCallingHandlers(
      +     rDAGall(10, 4) # "low-level warning" -- get it here and test it below
      +     , warning = function(w) {
      +         rDAG.warn <<- conditionMessage(w); invokeRestart("muffleWarning") })
      > ## with a low-level warning:
      > ## IGNORE_RDIFF_BEGIN
      > rDAG.warn
      Error: object 'rDAG.warn' not found
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 17.3Mb
      sub-directories of 1Mb or more:
        data   2.1Mb
        libs  11.9Mb
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

# rgraph6

<details>

* Version: 2.0-2
* GitHub: https://github.com/mbojan/rgraph6
* Source code: https://github.com/cran/rgraph6
* Date/Publication: 2022-08-25 12:10:02 UTC
* Number of recursive dependencies: 60

Run `revdepcheck::cloud_details(, "rgraph6")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘rgraph6.Rmd’ using rmarkdown
    
    Quitting from lines 162-171 [unnamed-chunk-9] (rgraph6.Rmd)
    Error: processing vignette 'rgraph6.Rmd' failed with diagnostics:
    values must be type 'integer',
     but FUN(X[[1]]) result is type 'double'
    --- failed re-building ‘rgraph6.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘rgraph6.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
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

# statGraph

<details>

* Version: 0.5.0
* GitHub: NA
* Source code: https://github.com/cran/statGraph
* Date/Publication: 2021-05-19 07:00:06 UTC
* Number of recursive dependencies: 20

Run `revdepcheck::cloud_details(, "statGraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘statGraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: tang.test
    > ### Title: Tang hypothesis testing for random graphs.
    > ### Aliases: tang.test
    > 
    > ### ** Examples
    > 
    > set.seed(42)
    ...
    > ## test under H0
    > lpvs <- matrix(rnorm(200), 20, 10)
    > lpvs <- apply(lpvs, 2, function(x) { return (abs(x)/sqrt(sum(x^2))) })
    > G1 <- igraph::sample_dot_product(lpvs)
    > G2 <- igraph::sample_dot_product(lpvs)
    > D1 <- tang.test(G1, G2, 5)
    Error in defaults$maxiter <- .Machine$integer.max : 
      object of type 'closure' is not subsettable
    Calls: tang.test -> t.embed.graph
    Execution halted
    ```

# tidygraph

<details>

* Version: 1.2.3
* GitHub: https://github.com/thomasp85/tidygraph
* Source code: https://github.com/cran/tidygraph
* Date/Publication: 2023-02-01 21:10:02 UTC
* Number of recursive dependencies: 82

Run `revdepcheck::cloud_details(, "tidygraph")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(tidygraph)
      
      Attaching package: 'tidygraph'
      
      The following object is masked from 'package:testthat':
      
    ...
       22. │   └─igraph:::modify_list(arpack_defaults(), options)
       23. │     └─utils::modifyList(x, y)
       24. │       └─base::stopifnot(is.list(x), is.list(val))
       25. │         └─base::stop(simpleError(msg, call = if (p <- sys.parent(1L)) sys.call(p)))
       26. └─dplyr (local) `<fn>`(`<smplErrr>`)
       27.   └─rlang::abort(message, class = error_class, parent = parent, call = error_call)
      
      [ FAIL 5 | WARN 2 | SKIP 0 | PASS 270 ]
      Error: Test failures
      Execution halted
    ```

