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

* Version: 0.2.3
* GitHub: https://github.com/MartinLoza/Canek
* Source code: https://github.com/cran/Canek
* Date/Publication: 2023-10-18 09:00:02 UTC
* Number of recursive dependencies: 223

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
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 90 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
      as.integer(table(dataLouvain$cluster)) not equal to c(96, 125, 140, 171, 99).
      Lengths differ: 4 is not 5
      ── Failure ('test-Clustering.R:20:3'): Clustering with louvain works ───────────
      dim(dataLouvain$centers) not equal to c(5, 10).
      1/2 mismatches
      [1] 4 - 5 == -1
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 90 ]
      Error: Test failures
      Execution halted
    ```

# CINNA

<details>

* Version: 1.2.2
* GitHub: NA
* Source code: https://github.com/cran/CINNA
* Date/Publication: 2023-08-08 16:40:02 UTC
* Number of recursive dependencies: 139

Run `revdepcheck::cloud_details(, "CINNA")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘CINNA.Rmd’ using rmarkdown
    
    Quitting from lines 247-250 [unnamed-chunk-13] (CINNA.Rmd)
    Error: processing vignette 'CINNA.Rmd' failed with diagnostics:
    missing values in object
    --- failed re-building ‘CINNA.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘CINNA.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘circlize’ ‘utils’
      All declared Imports should be used.
    ```

# countland

<details>

* Version: 0.1.1
* GitHub: NA
* Source code: https://github.com/cran/countland
* Date/Publication: 2022-08-17 06:40:06 UTC
* Number of recursive dependencies: 195

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

# dnet

<details>

* Version: 1.1.7
* GitHub: https://github.com/hfang-bristol/dnet
* Source code: https://github.com/cran/dnet
* Date/Publication: 2020-02-20 10:10:07 UTC
* Number of recursive dependencies: 51

Run `revdepcheck::cloud_details(, "dnet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dnet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dCommSignif
    > ### Title: Function to test the significance of communities within a graph
    > ### Aliases: dCommSignif
    > 
    > ### ** Examples
    > 
    > # 1) generate an vector consisting of random values from beta distribution
    ...
    > 
    > # 5) produce the induced subgraph only based on the nodes in query
    > subg <- dNetInduce(g, V(g), knn=0)
    > 
    > # 6) find the module with the maximum score
    > module <- dNetFind(subg, scores)
    Error in names(cid) <- 1:length(clust$csize) : 
      'names' attribute [2] must be the same length as the vector [0]
    Calls: dNetFind -> dNetInduce
    Execution halted
    ```

# economiccomplexity

<details>

* Version: 1.5.0
* GitHub: https://github.com/pachadotdev/economiccomplexity
* Source code: https://github.com/cran/economiccomplexity
* Date/Publication: 2023-08-07 20:50:02 UTC
* Number of recursive dependencies: 97

Run `revdepcheck::cloud_details(, "economiccomplexity")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘economiccomplexity.Rmd’ using rmarkdown
    
    Quitting from lines 599-631 [unnamed-chunk-26] (economiccomplexity.Rmd)
    Error: processing vignette 'economiccomplexity.Rmd' failed with diagnostics:
    missing value where TRUE/FALSE needed
    --- failed re-building ‘economiccomplexity.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘economiccomplexity.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.0Mb
      sub-directories of 1Mb or more:
        data   2.1Mb
        doc    2.6Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘Rdpack’
      All declared Imports should be used.
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
       1. └─malan::from_igraph(g1) at test-igraph.R:5:2
      ── Error ('test-igraph.R:22:3'): igraph import works for forest ────────────────
      Error in `from_igraph(g2)`: x must be a tree (or a forest)
      Backtrace:
          ▆
       1. └─malan::from_igraph(g2) at test-igraph.R:22:2
      
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

* Version: 0.2.3
* GitHub: https://github.com/snlab-ch/manynet
* Source code: https://github.com/cran/manynet
* Date/Publication: 2023-09-17 17:10:02 UTC
* Number of recursive dependencies: 116

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
      
      [ FAIL 1 | WARN 1 | SKIP 7 | PASS 303 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘Rgraphviz’
    ```

# molnet

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/molnet
* Date/Publication: 2021-08-06 08:30:02 UTC
* Number of recursive dependencies: 123

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
      At vendor/cigraph/src/constructors/adjacency.c:334 : Edge counts should be non-negative, found -2.2147. Invalid value
    Calls: <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

# mwcsr

<details>

* Version: 0.1.7
* GitHub: https://github.com/ctlab/mwcsr
* Source code: https://github.com/cran/mwcsr
* Date/Publication: 2023-05-16 11:10:05 UTC
* Number of recursive dependencies: 93

Run `revdepcheck::cloud_details(, "mwcsr")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘tutorial.Rmd’ using rmarkdown
    
    Quitting from lines 519-524 [unnamed-chunk-31] (tutorial.Rmd)
    Error: processing vignette 'tutorial.Rmd' failed with diagnostics:
    argument is of length zero
    --- failed re-building ‘tutorial.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘tutorial.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 17.9Mb
      sub-directories of 1Mb or more:
        java   2.5Mb
        libs  14.2Mb
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

# netrankr

<details>

* Version: 1.2.1
* GitHub: https://github.com/schochastics/netrankr
* Source code: https://github.com/cran/netrankr
* Date/Publication: 2023-08-20 12:42:33 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::cloud_details(, "netrankr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘netrankr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_rankings
    > ### Title: Rankings that extend a partial ranking
    > ### Aliases: get_rankings
    > 
    > ### ** Examples
    > 
    > P <- matrix(c(0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, rep(0, 10)), 5, 5, byrow = TRUE)
    ...
    > get_rankings(res)
    
     *** caught segfault ***
    address 0x8, cause 'memory not mapped'
    
    Traceback:
     1: rankings(paths, ideals, linext, n)
     2: get_rankings(res)
    An irrecoverable exception occurred. R is aborting now ...
    Segmentation fault (core dumped)
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(netrankr)
      > 
      > test_check("netrankr")
      
       *** caught segfault ***
      address 0x8, cause 'memory not mapped'
    ...
      30: tryCatchOne(expr, names, parentenv, handlers[[1L]])
      31: tryCatchList(expr, classes, parentenv, handlers)
      32: tryCatch(code, testthat_abort_reporter = function(cnd) {    cat(conditionMessage(cnd), "\n")    NULL})
      33: with_reporter(reporters$multi, lapply(test_paths, test_one_file,     env = env, desc = desc, error_call = error_call))
      34: test_files_serial(test_dir = test_dir, test_package = test_package,     test_paths = test_paths, load_helpers = load_helpers, reporter = reporter,     env = env, stop_on_failure = stop_on_failure, stop_on_warning = stop_on_warning,     desc = desc, load_package = load_package, error_call = error_call)
      35: test_files(test_dir = path, test_paths = test_paths, test_package = package,     reporter = reporter, load_helpers = load_helpers, env = env,     stop_on_failure = stop_on_failure, stop_on_warning = stop_on_warning,     load_package = load_package, parallel = parallel)
      36: test_dir("testthat", package = package, reporter = reporter,     ..., load_package = "installed")
      37: test_check("netrankr")
      An irrecoverable exception occurred. R is aborting now ...
      Segmentation fault (core dumped)
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘benchmarks.Rmd’ using rmarkdown
    --- finished re-building ‘benchmarks.Rmd’
    
    --- re-building ‘centrality_indices.Rmd’ using rmarkdown
    --- finished re-building ‘centrality_indices.Rmd’
    
    --- re-building ‘indirect_relations.Rmd’ using rmarkdown
    --- finished re-building ‘indirect_relations.Rmd’
    
    ...
    24: rmarkdown::render(file, encoding = encoding, quiet = quiet, envir = globalenv(),     output_dir = getwd(), ...)
    25: vweave_rmarkdown(...)
    26: engine$weave(file, quiet = quiet, encoding = enc)
    27: doTryCatch(return(expr), name, parentenv, handler)
    28: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    29: tryCatchList(expr, classes, parentenv, handlers)
    30: tryCatch({    engine$weave(file, quiet = quiet, encoding = enc)    setwd(startdir)    output <- find_vignette_product(name, by = "weave", engine = engine)    if (!have.makefile && vignette_is_tex(output)) {        texi2pdf(file = output, clean = FALSE, quiet = quiet)        output <- find_vignette_product(name, by = "texi2pdf",             engine = engine)    }    outputs <- c(outputs, output)}, error = function(e) {    thisOK <<- FALSE    fails <<- c(fails, file)    message(gettextf("Error: processing vignette '%s' failed with diagnostics:\n%s",         file, conditionMessage(e)))})
    31: tools:::buildVignettes(dir = "/tmp/workdir/netrankr/new/netrankr.Rcheck/vign_test/netrankr")
    An irrecoverable exception occurred. R is aborting now ...
    Segmentation fault (core dumped)
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 12.6Mb
      sub-directories of 1Mb or more:
        doc    1.6Mb
        libs  10.5Mb
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
      At vendor/cigraph/src/math/safe_intop.c:127 : Cannot convert nan to integer, outside of representable range. Integer or double overflow
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

# phangorn

<details>

* Version: 2.11.1
* GitHub: https://github.com/KlausVigo/phangorn
* Source code: https://github.com/cran/phangorn
* Date/Publication: 2023-01-23 10:10:02 UTC
* Number of recursive dependencies: 67

Run `revdepcheck::cloud_details(, "phangorn")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘phangorn-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as.networx
    > ### Title: Conversion among phylogenetic network objects
    > ### Aliases: as.networx networx as.networx.splits as.networx.phylo
    > ### Keywords: plot
    > 
    > ### ** Examples
    > 
    > 
    > set.seed(1)
    > tree1 <- rtree(20, rooted=FALSE)
    > sp <- as.splits(rNNI(tree1, n=10))
    > net <- as.networx(sp)
    Error in rbind(edge, cbind(oldNodes, newNodes), deparse.level = 0) : 
      number of columns of matrices must match (see arg 2)
    Calls: as.networx -> as.networx.splits -> addEdge -> rbind
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘AdvancedFeatures.Rmd’ using rmarkdown
    --- finished re-building ‘AdvancedFeatures.Rmd’
    
    --- re-building ‘Ancestral.Rmd’ using rmarkdown
    --- finished re-building ‘Ancestral.Rmd’
    
    --- re-building ‘IntertwiningTreesAndNetworks.Rmd’ using rmarkdown
    
    Quitting from lines 193-205 [unnamed-chunk-9] (IntertwiningTreesAndNetworks.Rmd)
    ...
    --- finished re-building ‘Networx.Rmd’
    
    --- re-building ‘Trees.Rmd’ using rmarkdown
    --- finished re-building ‘Trees.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘IntertwiningTreesAndNetworks.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.0Mb
      sub-directories of 1Mb or more:
        doc    1.5Mb
        libs   5.8Mb
    ```

# SteinerNet

<details>

* Version: 3.1.0
* GitHub: https://github.com/krashkov/SteinerNet
* Source code: https://github.com/cran/SteinerNet
* Date/Publication: 2020-09-07 09:50:08 UTC
* Number of recursive dependencies: 56

Run `revdepcheck::cloud_details(, "SteinerNet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SteinerNet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: steiner_comparison_plots
    > ### Title: Plot simulated data
    > ### Aliases: steiner_comparison_plots
    > 
    > ### ** Examples
    > 
    > g <- graph("Cubical")
    > 
    > data <- steiner_simulation(type = c("SP", "KB", "SPM"),
    +                            graph = g,
    +                            ter_list = generate_st_samples(graph = g,
    +                                                           ter_number = c(2, 3),
    +                                                           prob = c(0.1, 0.2)))
    Error in min(t[[r]]) : invalid 'type' (list) of argument
    Calls: steiner_simulation ... steinertree -> steinertree2 -> sapply -> lapply -> FUN
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘tutorial.Rmd’ using rmarkdown
    
    Quitting from lines 71-73 [unnamed-chunk-4] (tutorial.Rmd)
    Error: processing vignette 'tutorial.Rmd' failed with diagnostics:
    invalid 'type' (list) of argument
    --- failed re-building ‘tutorial.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘tutorial.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# wpa

<details>

* Version: 1.9.0
* GitHub: https://github.com/microsoft/wpa
* Source code: https://github.com/cran/wpa
* Date/Publication: 2023-08-21 15:00:02 UTC
* Number of recursive dependencies: 123

Run `revdepcheck::cloud_details(, "wpa")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘wpa-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: network_p2p
    > ### Title: Perform network analysis with the person-to-person query
    > ### Aliases: network_p2p
    > 
    > ### ** Examples
    > 
    > p2p_df <- p2p_data_sim(dim = 1, size = 100)
    ...
    > network_p2p(
    +   data = p2p_df,
    +   community = "fluid_communities",
    +   comm_args = list("no.of.communities" = 5)
    + )
    Warning in res$names <- V(graph)$name : Coercing LHS to a list
    Error in names(res) <- communities$names : 
      'names' attribute [100] must be the same length as the vector [0]
    Calls: network_p2p ... ensure_igraph -> <Anonymous> -> i_set_vertex_attr -> <Anonymous>
    Execution halted
    ```

