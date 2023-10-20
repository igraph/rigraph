# backShift

<details>

* Version: 0.1.4.3
* GitHub: https://github.com/christinaheinze/backShift
* Source code: https://github.com/cran/backShift
* Date/Publication: 2020-05-06 11:30:03 UTC
* Number of recursive dependencies: 97

Run `revdepcheck::cloud_details(, "backShift")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(backShift)
      > 
      > test_check("backShift")
      [ FAIL 32 | WARN 9 | SKIP 0 | PASS 0 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─backShift::backShift(...)
       5.   └─backShift:::permuteAndScale(estimatedB, verbose)
       6.     └─backShift:::hasCPsmallerOne(Dhat, returnCycleNodes = FALSE)
       7.       └─igraph::graph.adjacency(Ahat.larger.1, mode = "directed", weighted = "a")
       8.         └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 32 | WARN 9 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘exampleBackShift.Rmd’ using rmarkdown
    
    Quitting from lines 180-184 [unnamed-chunk-7] (exampleBackShift.Rmd)
    Error: processing vignette 'exampleBackShift.Rmd' failed with diagnostics:
    invalid value supplied for `weighted' argument, please see docs.
    --- failed re-building ‘exampleBackShift.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘exampleBackShift.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘InvariantCausalPrediction’, ‘CompareCausalNetworks’
    ```

# BDgraph

<details>

* Version: 2.72
* GitHub: NA
* Source code: https://github.com/cran/BDgraph
* Date/Publication: 2022-12-25 07:20:14 UTC
* Number of recursive dependencies: 72

Run `revdepcheck::cloud_details(, "BDgraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘BDgraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: bdgraph.mpl
    > ### Title: Search algorithm in graphical models using marginal
    > ###   pseudo-likehlihood
    > ### Aliases: bdgraph.mpl
    > ### Keywords: sampling algorithms structure learning iteration
    > 
    > ### ** Examples
    ...
    > data.sim <- bdgraph.sim( n = 70, p = 5, size = 7, vis = TRUE )
    >    
    > bdgraph.obj <- bdgraph.mpl( data = data.sim, iter = 500 )
    500 MCMC sampling ... in progress: 
    10%->20%->30%->40%->50%->60%->70%->80%->90%-> done>   
    > summary( bdgraph.obj )
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:142 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: summary ... <Anonymous> -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘BDgraph-Examples.Rmd’ using rmarkdown
    
    Quitting from lines 67-68 [unnamed-chunk-5] (BDgraph-Examples.Rmd)
    Error: processing vignette 'BDgraph-Examples.Rmd' failed with diagnostics:
    At vendor/cigraph/src/constructors/adjacency.c:142 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    --- failed re-building ‘BDgraph-Examples.Rmd’
    
    --- re-building ‘Introduction-BDgraph.Rmd’ using rmarkdown
    ...
    Quitting from lines 200-201 [unnamed-chunk-13] (Introduction-BDgraph.Rmd)
    Error: processing vignette 'Introduction-BDgraph.Rmd' failed with diagnostics:
    At vendor/cigraph/src/constructors/adjacency.c:142 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    --- failed re-building ‘Introduction-BDgraph.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘BDgraph-Examples.Rmd’ ‘Introduction-BDgraph.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 11.0Mb
      sub-directories of 1Mb or more:
        libs   9.5Mb
    ```

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

*   checking examples ... ERROR
    ```
    Running examples in ‘Canek-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: CorrectBatch
    > ### Title: CorrectBatch
    > ### Aliases: CorrectBatch
    > 
    > ### ** Examples
    > 
    > x <- SimBatches$batches[[1]]
    > y <- SimBatches$batches[[2]]
    > z <- CorrectBatch(x, y)
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      invalid value supplied for `weighted' argument, please see docs.
    Calls: CorrectBatch ... CalculateMST -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(Canek)
      > 
      > test_check("Canek")
      [ FAIL 7 | WARN 0 | SKIP 0 | PASS 33 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
       2. └─Canek:::RunCanek.Seurat(x, "batch")
       3.   └─Canek::CorrectBatches(counts, debug = debug, ...)
       4.     └─Canek::CorrectBatch(...)
       5.       └─Canek:::CalculateMST(cluMem$centers[, 1:fuzzyPCA])
       6.         └─igraph::graph_from_adjacency_matrix(x, mode = "undirected", weighted = "weight")
       7.           └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 7 | WARN 0 | SKIP 0 | PASS 33 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘toy_example.Rmd’ using rmarkdown
    
    Quitting from lines 79-80 [unnamed-chunk-5] (toy_example.Rmd)
    Error: processing vignette 'toy_example.Rmd' failed with diagnostics:
    invalid value supplied for `weighted' argument, please see docs.
    --- failed re-building ‘toy_example.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘toy_example.Rmd’
    
    Error: Vignette re-building failed.
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

# concorR

<details>

* Version: 0.2.1
* GitHub: https://github.com/ATraxLab/concorR
* Source code: https://github.com/cran/concorR
* Date/Publication: 2020-11-25 20:30:07 UTC
* Number of recursive dependencies: 19

Run `revdepcheck::cloud_details(, "concorR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘concorR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: concor_igraph_apply
    > ### Title: Find CONCOR partition and add to a list of 'igraph' objects
    > ### Aliases: concor_igraph_apply
    > 
    > ### ** Examples
    > 
    > a <- matrix(c(0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0), ncol = 4)
    ...
    
    > 
    > b <- matrix(c(0, 0, 0, 4, 1, 0, 3, 0, 2, 1, 0, 1, 1, 0, 2, 0), ncol = 4)
    > rownames(b) <- c("a", "b", "c", "d")
    > colnames(b) <- c("a", "b", "c", "d")
    > b.igraph <- igraph::graph_from_adjacency_matrix(b, weighted = "weight")
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      invalid value supplied for `weighted' argument, please see docs.
    Calls: <Anonymous> -> graph.adjacency.dense
    Execution halted
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

*   checking examples ... ERROR
    ```
    Running examples in ‘DiagrammeR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: from_adj_matrix
    > ### Title: Create a graph using an adjacency matrix
    > ### Aliases: from_adj_matrix
    > 
    > ### ** Examples
    > 
    > # Create an adjacency matrix
    ...
    +     prob = c(0.9,0.1)
    +   ) %>%
    +   matrix(ncol = 10)
    > 
    > # Create a graph from the adjacency matrix
    > graph <- from_adj_matrix(adj_matrix)
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:142 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: from_adj_matrix -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

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
      Warning: stack imbalance in '<-', 77 then 78
      Warning: stack imbalance in '{', 73 then 74
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

# DrDimont

<details>

* Version: 0.1.4
* GitHub: NA
* Source code: https://github.com/cran/DrDimont
* Date/Publication: 2022-09-23 15:40:02 UTC
* Number of recursive dependencies: 127

Run `revdepcheck::cloud_details(, "DrDimont")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘DrDimont-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: generate_individual_graphs
    > ### Title: Builds graphs from specified network layers
    > ### Aliases: generate_individual_graphs
    > 
    > ### ** Examples
    > 
    > ## Don't show: 
    ...
    +                                  layers=layers_example, 
    +                                  settings=example_settings)
    [23-10-19 05:26:15] Generating graph of layer mrna for groupA...
    [23-10-19 05:26:15] Reducing network by WGCNA::pickHardThreshold...
    [23-10-19 05:26:15] R2 cutoff: 0.65
    [23-10-19 05:26:15] Cut Threshold: 0.26
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: generate_individual_graphs ... generate_reduced_graph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘DrDimont_Vignette.Rmd’ using rmarkdown
    
    Quitting from lines 328-333 [Individual graphs] (DrDimont_Vignette.Rmd)
    Error: processing vignette 'DrDimont_Vignette.Rmd' failed with diagnostics:
    At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    --- failed re-building ‘DrDimont_Vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘DrDimont_Vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# ecoCopula

<details>

* Version: 1.0.2
* GitHub: NA
* Source code: https://github.com/cran/ecoCopula
* Date/Publication: 2022-03-02 00:20:02 UTC
* Number of recursive dependencies: 116

Run `revdepcheck::cloud_details(, "ecoCopula")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ecoCopula-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: cgr
    > ### Title: Fitting Gaussian copula graphical lasso to co-occurrence data
    > ### Aliases: cgr
    > 
    > ### ** Examples
    > 
    > abund <- spider$abund[,1:5]
    > spider_mod <- stackedsdm(abund,~1, data = spider$x, ncores=2) 
    > spid_graph=cgr(spider_mod)
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: cgr ... ensure_igraph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(ecoCopula)
      Loading required package: mvabund
      > 
      > test_check("ecoCopula")
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 77 ]
      
    ...
       4. └─ecoCopula::cgr(spider.mod)
       5.   └─ecoCopula:::graph_from_partial(part_cor)
       6.     ├─igraph::as_data_frame(...)
       7.     │ └─igraph:::ensure_igraph(x)
       8.     └─igraph::graph_from_adjacency_matrix(...)
       9.       └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 77 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘the_basics.Rmd’ using rmarkdown
    
    Quitting from lines 117-123 [unnamed-chunk-10] (the_basics.Rmd)
    Error: processing vignette 'the_basics.Rmd' failed with diagnostics:
    At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    --- failed re-building ‘the_basics.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘the_basics.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# ECoL

<details>

* Version: 0.3.0
* GitHub: https://github.com/lpfgarcia/ECoL
* Source code: https://github.com/cran/ECoL
* Date/Publication: 2019-11-05 05:10:02 UTC
* Number of recursive dependencies: 43

Run `revdepcheck::cloud_details(, "ECoL")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ECoL-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: complexity
    > ### Title: Extract the complexity measures from datasets
    > ### Aliases: complexity complexity.default complexity.formula
    > 
    > ### ** Examples
    > 
    > ## Extract all complexity measures for classification task
    > data(iris)
    > complexity(Species ~ ., iris)
    Warning: stack imbalance in 'lapply', 49 then 50
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: complexity ... network.default -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(ECoL)
      > 
      > test_check("ECoL")
      Warning: stack imbalance in 'lapply', 126 then 127
      Warning: stack imbalance in 'lapply', 126 then 127
      Warning: stack imbalance in 'lapply', 126 then 127
    ...
          ▆
       1. ├─ECoL::network(Species ~ ., iris, measures = "Density") at test_network.R:5:2
       2. └─ECoL:::network.formula(Species ~ ., iris, measures = "Density")
       3.   └─ECoL:::network.default(...)
       4.     └─igraph::graph.adjacency(dst, mode = "undirected", weighted = TRUE)
       5.       └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 94 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
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

# eicm

<details>

* Version: 1.0.3
* GitHub: https://github.com/miguel-porto/eicm
* Source code: https://github.com/cran/eicm
* Date/Publication: 2023-05-05 23:10:02 UTC
* Number of recursive dependencies: 48

Run `revdepcheck::cloud_details(, "eicm")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘eicm-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plotNetworkFromMatrix
    > ### Title: Plot graphs from adjacency matrices
    > ### Aliases: plotNetworkFromMatrix
    > 
    > ### ** Examples
    > 
    > # generate two adjacency matrices with 15 species and 10 interactions
    ...
    > 
    > # set the species names
    > rownames(A) <- rownames(B) <-
    +   colnames(A) <- colnames(B) <- paste0("S", 1:15)
    > 
    > plotNetworkFromMatrix(A, B)
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      invalid value supplied for `weighted' argument, please see docs.
    Calls: plotNetworkFromMatrix -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘eicm.Rmd’ using rmarkdown
    
    Quitting from lines 185-187 [unnamed-chunk-7] (eicm.Rmd)
    Error: processing vignette 'eicm.Rmd' failed with diagnostics:
    invalid value supplied for `weighted' argument, please see docs.
    --- failed re-building ‘eicm.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘eicm.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘snow’
      All declared Imports should be used.
    ```

# fnets

<details>

* Version: 0.1.5
* GitHub: NA
* Source code: https://github.com/cran/fnets
* Date/Publication: 2023-07-17 08:40:06 UTC
* Number of recursive dependencies: 49

Run `revdepcheck::cloud_details(, "fnets")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(fnets)
      > 
      > test_check("fnets")
      [ FAIL 1 | WARN 3 | SKIP 16 | PASS 2 ]
      
      ══ Skipped tests (16) ══════════════════════════════════════════════════════════
    ...
       3.   ├─base::suppressWarnings(...)
       4.   │ └─base::withCallingHandlers(...)
       5.   ├─fnets::network(...)
       6.   └─fnets:::network.fnets(...)
       7.     └─igraph::graph_from_adjacency_matrix(...)
       8.       └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 1 | WARN 3 | SKIP 16 | PASS 2 ]
      Error: Test failures
      Execution halted
    ```

# ghypernet

<details>

* Version: 1.1.0
* GitHub: NA
* Source code: https://github.com/cran/ghypernet
* Date/Publication: 2021-10-15 13:30:05 UTC
* Number of recursive dependencies: 100

Run `revdepcheck::cloud_details(, "ghypernet")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Significantlinks.Rmd’ using rmarkdown
    Warning: stack imbalance in '<-', 59 then 60
    Warning: stack imbalance in 'withVisible', 52 then 53
    
    Quitting from lines 66-79 [unnamed-chunk-4] (Significantlinks.Rmd)
    Error: processing vignette 'Significantlinks.Rmd' failed with diagnostics:
    invalid value supplied for `weighted' argument, please see docs.
    --- failed re-building ‘Significantlinks.Rmd’
    ...
    --- finished re-building ‘Tutorial_NRM.Rmd’
    
    --- re-building ‘tutorial.Rmd’ using rmarkdown
    --- finished re-building ‘tutorial.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Significantlinks.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘methods’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 11 marked UTF-8 strings
    ```

# graph4lg

<details>

* Version: 1.8.0
* GitHub: NA
* Source code: https://github.com/cran/graph4lg
* Date/Publication: 2023-01-30 14:00:05 UTC
* Number of recursive dependencies: 119

Run `revdepcheck::cloud_details(, "graph4lg")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘genetic_graph_2.Rmd’ using rmarkdown
    Warning: stack imbalance in '<-', 59 then 61
    Warning: stack imbalance in 'withVisible', 52 then 54
    Warning: stack imbalance in '<-', 59 then 60
    Warning: stack imbalance in 'withVisible', 52 then 53
    Warning: stack imbalance in '<-', 60 then 61
    Warning: stack imbalance in 'withVisible', 53 then 54
    Warning: stack imbalance in '<-', 59 then 61
    Warning: stack imbalance in 'withVisible', 52 then 54
    ...
    --- finished re-building ‘input_data_processing_1.Rmd’
    
    --- re-building ‘landscape_graph_3.Rmd’ using rmarkdown
    --- finished re-building ‘landscape_graph_3.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘genetic_graph_2.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

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

*   checking examples ... ERROR
    ```
    Running examples in ‘manynet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: create
    > ### Title: Make networks with defined structures
    > ### Aliases: create create_empty create_filled create_ring create_star
    > ###   create_tree create_lattice create_components create_core
    > ###   create_explicit
    > 
    > ### ** Examples
    ...
    3     1     4
    4     1     5
    5     1     6
    6     1     7
    # ℹ 39 more rows
    > create_ring(8, width = 2)
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:142 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: create_ring -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

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
      
      [ FAIL 1 | WARN 0 | SKIP 7 | PASS 303 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘Rgraphviz’
    ```

# modnets

<details>

* Version: 0.9.0
* GitHub: https://github.com/tswanson222/modnets
* Source code: https://github.com/cran/modnets
* Date/Publication: 2021-10-01 08:20:02 UTC
* Number of recursive dependencies: 138

Run `revdepcheck::cloud_details(, "modnets")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘modnets-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: CentralityAndClustering
    > ### Title: Create table of centrality values or clustering coefficients
    > ### Aliases: CentralityAndClustering centTable clustTable
    > 
    > ### ** Examples
    > 
    > x <- fitNetwork(gvarDat, 'M', lags = TRUE)
    > 
    > clustTable(x)
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: clustTable ... lapply -> FUN -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.6Mb
      sub-directories of 1Mb or more:
        data   3.8Mb
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
    
    > ### Name: generate_individual_graphs
    > ### Title: Builds graphs from specified network layers
    > ### Aliases: generate_individual_graphs
    > 
    > ### ** Examples
    > 
    > ## Don't show: 
    ...
    p-values adjusted.
    
    full adjusted p-value matrix complete.
    
    thresholding done.
    
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: <Anonymous> ... generate_reduced_graph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Molnet_Vignette.Rmd’ using rmarkdown
    
    Quitting from lines 255-256 [Individual Graphs] (Molnet_Vignette.Rmd)
    Error: processing vignette 'Molnet_Vignette.Rmd' failed with diagnostics:
    At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    --- failed re-building ‘Molnet_Vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Molnet_Vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# motifcluster

<details>

* Version: 0.2.3
* GitHub: https://github.com/wgunderwood/motifcluster
* Source code: https://github.com/cran/motifcluster
* Date/Publication: 2022-11-18 08:10:02 UTC
* Number of recursive dependencies: 68

Run `revdepcheck::cloud_details(, "motifcluster")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘motifcluster-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_largest_component
    > ### Title: Get largest connected component
    > ### Aliases: get_largest_component
    > 
    > ### ** Examples
    > 
    > adj_mat <- matrix(c(0, 1, 0, 0, 0, 0, 0, 0, 0), nrow = 3)
    > get_largest_component(adj_mat)
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      invalid value supplied for `weighted' argument, please see docs.
    Calls: get_largest_component ... graph_from_adjacency_matrix -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(motifcluster)
      > 
      > test_check("motifcluster")
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 762 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
       1. ├─testthat::expect_equal(...) at test_utils.R:65:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─motifcluster::get_largest_component(adj_mat_dense)
       5.   └─igraph::graph_from_adjacency_matrix(...)
       6.     └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 762 ]
      Error: Test failures
      Execution halted
    ```

# mRMRe

<details>

* Version: 2.1.2.1
* GitHub: NA
* Source code: https://github.com/cran/mRMRe
* Date/Publication: 2023-04-25 05:57:25 UTC
* Number of recursive dependencies: 11

Run `revdepcheck::cloud_details(, "mRMRe")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mRMRe-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: visualize
    > ### Title: mRMRe Network display
    > ### Aliases: visualize visualize,mRMRe.Network-method
    > ### Keywords: methods
    > 
    > ### ** Examples
    > 
    ...
    > feature_data <- mRMR.data(data =  data.frame(cgps.ge))
    > 
    > # Build an mRMR-based network and display it
    > network <- new("mRMRe.Network", data = feature_data, target_indices = c(1),
    + 				levels = c(3, 1), layers = 2)
    > visualize(network)
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:142 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: visualize ... visualize -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘mRMRe.Rnw’ using Sweave
    Loading required package: survival
    Loading required package: igraph
    
    Attaching package: ‘igraph’
    
    The following objects are masked from ‘package:stats’:
    
        decompose, spectrum
    ...
    l.11 ^^M
            
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘mRMRe.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘mRMRe.Rnw’
    
    Error: Vignette re-building failed.
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
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: best_fit_optim ... ensure_igraph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘tutorial.Rmd’ using rmarkdown
    
    Quitting from lines 200-215 [Classify networks] (tutorial.Rmd)
    Error: processing vignette 'tutorial.Rmd' failed with diagnostics:
    At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
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

# netropy

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/netropy
* Date/Publication: 2022-02-02 08:20:02 UTC
* Number of recursive dependencies: 87

Run `revdepcheck::cloud_details(, "netropy")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘netropy-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: assoc_graph
    > ### Title: Association Graphs
    > ### Aliases: assoc_graph
    > 
    > ### ** Examples
    > 
    > library(ggraph)
    ...
    +                 ifelse(df.att$age<=45,1,2)),
    +    practice = df.att$practice,
    +    lawschool= df.att$lawschool-1)
    > 
    > # association graph based on cutoff 0.15
    > assoc_graph(df.att.ed, 0.15)
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: assoc_graph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘joint_entropies.Rmd’ using rmarkdown
    
    Quitting from lines 96-98 [assoc_g] (joint_entropies.Rmd)
    Error: processing vignette 'joint_entropies.Rmd' failed with diagnostics:
    At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    --- failed re-building ‘joint_entropies.Rmd’
    
    --- re-building ‘prediction_power.Rmd’ using rmarkdown
    ...
    --- finished re-building ‘univariate_bivariate_trivariate.Rmd’
    
    --- re-building ‘variable_domains.Rmd’ using rmarkdown
    --- finished re-building ‘variable_domains.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘joint_entropies.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# NIMAA

<details>

* Version: 0.2.1
* GitHub: https://github.com/jafarilab/NIMAA
* Source code: https://github.com/cran/NIMAA
* Date/Publication: 2022-04-11 14:12:45 UTC
* Number of recursive dependencies: 173

Run `revdepcheck::cloud_details(, "NIMAA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘NIMAA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: scoreCluster
    > ### Title: Score the cluster analysis in a projected network based on
    > ###   additional internal measures.
    > ### Aliases: scoreCluster
    > 
    > ### ** Examples
    > 
    ...
    > beatAML_incidence_matrix <- nominalAsBinet(beatAML_data)
    > 
    > # do clustering
    > cls <- findCluster(beatAML_incidence_matrix,
    +   part = 1, method = "infomap", normalization = FALSE,
    +   rm_weak_edges = TRUE, comparison = FALSE)
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: findCluster ... projectGraph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘NIMAA-vignette.Rmd’ using rmarkdown
    
    Quitting from lines 138-148 [unnamed-chunk-7] (NIMAA-vignette.Rmd)
    Error: processing vignette 'NIMAA-vignette.Rmd' failed with diagnostics:
    At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    --- failed re-building ‘NIMAA-vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘NIMAA-vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.5Mb
      sub-directories of 1Mb or more:
        data   1.0Mb
        doc    4.0Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 24 marked UTF-8 strings
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

# Radviz

<details>

* Version: 0.9.3
* GitHub: https://github.com/yannabraham/Radviz
* Source code: https://github.com/cran/Radviz
* Date/Publication: 2022-03-25 18:10:02 UTC
* Number of recursive dependencies: 65

Run `revdepcheck::cloud_details(, "Radviz")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘Radviz-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: do.optimGraphviz
    > ### Title: Optimize the Dimensional Anchors Position using the Graphviz
    > ###   algorithm
    > ### Aliases: do.optimGraphviz
    > 
    > ### ** Examples
    > 
    ...
    
    The following object is masked from ‘package:base’:
    
        union
    
    > g.iris <- graph.adjacency(w.iris,mode='undirected',weight=TRUE,diag=FALSE)
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘multivariate_analysis.Rmd’ using rmarkdown
    
    Quitting from lines 330-334 [unnamed-chunk-24] (multivariate_analysis.Rmd)
    Error: processing vignette 'multivariate_analysis.Rmd' failed with diagnostics:
    At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    --- failed re-building ‘multivariate_analysis.Rmd’
    
    --- re-building ‘single_cell_projections.Rmd’ using rmarkdown
    --- finished re-building ‘single_cell_projections.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘multivariate_analysis.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# repo

<details>

* Version: 2.1.5
* GitHub: NA
* Source code: https://github.com/cran/repo
* Date/Publication: 2020-02-08 16:20:02 UTC
* Number of recursive dependencies: 60

Run `revdepcheck::cloud_details(, "repo")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘repo-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: repo_dependencies
    > ### Title: Build and/or plots a dependency graph
    > ### Aliases: repo_dependencies
    > 
    > ### ** Examples
    > 
    > ## Repository creation
    ...
    item1        0     0     0        0
    item2        1     0     0        0
    item3        1     1     0        0
    temp.pdf     2     0     0        0
    > ## The matrix can be plotted as a graph (requires igraph package)
    > rp$dependencies()
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      invalid value supplied for `weighted' argument, please see docs.
    Calls: <Anonymous> -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

# rsetse

<details>

* Version: 0.5.0
* GitHub: https://github.com/JonnoB/rSETSe
* Source code: https://github.com/cran/rsetse
* Date/Publication: 2021-06-11 10:00:02 UTC
* Number of recursive dependencies: 86

Run `revdepcheck::cloud_details(, "rsetse")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rsetse-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: calc_spring_area
    > ### Title: Calculate the cross sectional area of the edge
    > ### Aliases: calc_spring_area
    > 
    > ### ** Examples
    > 
    >  
    ...
    
        union
    
    > set.seed(234)
    > g_prep <- generate_peels_network("A") %>%
    +  set.edge.attribute(., name = "edge_characteristic", value = rep(1:16, each = 10))
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:142 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: %>% ... generate_peels_network_internal -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Categorical-and-continuous-features.Rmd’ using rmarkdown
    --- finished re-building ‘Categorical-and-continuous-features.Rmd’
    
    --- re-building ‘separate-peels-quintet.Rmd’ using rmarkdown
    
    Quitting from lines 45-74 [unnamed-chunk-3] (separate-peels-quintet.Rmd)
    Error: processing vignette 'separate-peels-quintet.Rmd' failed with diagnostics:
    ℹ In index: 1.
    Caused by error in `graph.adjacency.dense()`:
    ! At vendor/cigraph/src/constructors/adjacency.c:142 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    --- failed re-building ‘separate-peels-quintet.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘separate-peels-quintet.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# sbm

<details>

* Version: 0.4.5
* GitHub: https://github.com/GrossSBM/sbm
* Source code: https://github.com/cran/sbm
* Date/Publication: 2023-01-09 10:30:02 UTC
* Number of recursive dependencies: 110

Run `revdepcheck::cloud_details(, "sbm")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sbm-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: estimateSimpleSBM
    > ### Title: Estimation of Simple SBMs
    > ### Aliases: estimateSimpleSBM
    > 
    > ### ** Examples
    > 
    > ### =======================================
    ...
            -> For 2 groups
    > plot(mySimpleSBM, 'data', ordered = FALSE)
    > plot(mySimpleSBM, 'data')
    > plot(mySimpleSBM, 'expected', ordered = FALSE)
    > plot(mySimpleSBM, 'expected')
    > plot(mySimpleSBM, 'meso')
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: plot ... <Anonymous> -> plotMeso -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Multipartite_EcologicalNetwork.Rmd’ using rmarkdown
    --- finished re-building ‘Multipartite_EcologicalNetwork.Rmd’
    
    --- re-building ‘MultiplexNetwork_principle.Rmd’ using rmarkdown
    --- finished re-building ‘MultiplexNetwork_principle.Rmd’
    
    --- re-building ‘Multiplex_allianceNwar_case_study.Rmd’ using rmarkdown
    --- finished re-building ‘Multiplex_allianceNwar_case_study.Rmd’
    ...
    Quitting from lines 114-115 [simpleSBMfit plotmeso] (SBM_fungus_tree_network.Rmd)
    Error: processing vignette 'SBM_fungus_tree_network.Rmd' failed with diagnostics:
    At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    --- failed re-building ‘SBM_fungus_tree_network.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘SBM_fungus_tree_network.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# scapGNN

<details>

* Version: 0.1.4
* GitHub: NA
* Source code: https://github.com/cran/scapGNN
* Date/Publication: 2023-08-08 08:10:02 UTC
* Number of recursive dependencies: 96

Run `revdepcheck::cloud_details(, "scapGNN")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘scapGNN-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plotGANetwork
    > ### Title: Visualize gene association network graph of a gene module or
    > ###   pathway at the specified cell phenotype
    > ### Aliases: plotGANetwork
    > 
    > ### ** Examples
    > 
    ...
    > data("Hv_exp")
    > index<-grep("0h",colnames(Hv_exp))
    > cellset<-colnames(Hv_exp)[index]
    > pathways<-load_path_data(system.file("extdata", "KEGG_human.gmt", package = "scapGNN"))
    > geneset<-pathways[[which(names(pathways)=="Tight junction [PATH:hsa04530]")]]
    > plotGANetwork(ConNetGNN_data,cellset,geneset,main = "Tight junction [PATH:hsa04530]")
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: plotGANetwork ... graph_from_adjacency_matrix -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘vignette.Rmd’ using rmarkdown
    
    Quitting from lines 170-185 [unnamed-chunk-8] (vignette.Rmd)
    Error: processing vignette 'vignette.Rmd' failed with diagnostics:
    At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    --- failed re-building ‘vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.7Mb
      sub-directories of 1Mb or more:
        data      3.3Mb
        extdata   2.3Mb
    ```

# SeqNet

<details>

* Version: 1.1.3
* GitHub: NA
* Source code: https://github.com/cran/SeqNet
* Date/Publication: 2021-07-09 08:20:08 UTC
* Number of recursive dependencies: 76

Run `revdepcheck::cloud_details(, "SeqNet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SeqNet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as_single_module
    > ### Title: Collapses all modules in network into a single module
    > ### Aliases: as_single_module
    > 
    > ### ** Examples
    > 
    > # This function can be used prior to generating weights for the network 
    ...
    > # is reduced to a single module prior to generating weights, then the
    > # weighted and unweighted networks will maintain the same structure.
    > nw <- random_network(20, n_modules = 3)
    > g <- plot(nw)
    > nw <- gen_partial_correlations(nw)
    > plot(nw, g) # Additional edges appear from conditional dependencies across modules.
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: plot ... plot_network -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.3Mb
      sub-directories of 1Mb or more:
        data   4.7Mb
        libs   1.8Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘Rdpack’
      All declared Imports should be used.
    ```

# signnet

<details>

* Version: 1.0.2
* GitHub: https://github.com/schochastics/signnet
* Source code: https://github.com/cran/signnet
* Date/Publication: 2023-09-08 21:00:02 UTC
* Number of recursive dependencies: 106

Run `revdepcheck::cloud_details(, "signnet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘signnet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: graph_from_adjacency_matrix_signed
    > ### Title: Create signed graphs from adjacency matrices
    > ### Aliases: graph_from_adjacency_matrix_signed
    > 
    > ### ** Examples
    > 
    > A <- matrix(c(0,1,-1,1,0,1,-1,1,0),3,3)
    > graph_from_adjacency_matrix_signed(A)
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      invalid value supplied for `weighted' argument, please see docs.
    Calls: graph_from_adjacency_matrix_signed -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(signnet)
      > 
      > test_check("signnet")
      Warning: stack imbalance in '<-', 77 then 78
      Warning: stack imbalance in '{', 73 then 74
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 88 ]
    ...
          diag = diag)`: invalid value supplied for `weighted' argument, please see docs.
      Backtrace:
          ▆
       1. └─signnet::graph_from_adjacency_matrix_signed(A, "undirected") at test-centrality_indices.R:86:2
       2.   └─igraph::graph_from_adjacency_matrix(...)
       3.     └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 88 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘blockmodeling.Rmd’ using rmarkdown
    --- finished re-building ‘blockmodeling.Rmd’
    
    --- re-building ‘centrality.Rmd’ using rmarkdown
    
    Quitting from lines 45-62 [deg_same] (centrality.Rmd)
    Error: processing vignette 'centrality.Rmd' failed with diagnostics:
    invalid value supplied for `weighted' argument, please see docs.
    --- failed re-building ‘centrality.Rmd’
    ...
    --- finished re-building ‘signed_networks.Rmd’
    
    --- re-building ‘structural_balance.Rmd’ using rmarkdown
    --- finished re-building ‘structural_balance.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘centrality.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.1Mb
      sub-directories of 1Mb or more:
        data   1.0Mb
        libs   6.0Mb
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

# TDA

<details>

* Version: 1.9
* GitHub: NA
* Source code: https://github.com/cran/TDA
* Date/Publication: 2023-02-04 18:42:30 UTC
* Number of recursive dependencies: 61

Run `revdepcheck::cloud_details(, "TDA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘TDA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: clusterTree
    > ### Title: Density clustering: the cluster tree
    > ### Aliases: clusterTree print.clusterTree
    > ### Keywords: nonparametric
    > 
    > ### ** Examples
    > 
    ...
    > X <- rbind(X1, X2, X3)
    > 
    > k <- 100     #parameter of knn
    > 
    > ## Density clustering using knn and kde
    > Tree <- clusterTree(X, k, density = "knn")
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:142 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: clusterTree -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking running R code from vignettes ... ERROR
    ```
    Errors in running code in vignettes:
    when running code in ‘article.Rnw’
      ...
    > X3 <- cbind(rnorm(300, 6, 1), rnorm(300, 1, 1))
    
    > XX <- rbind(X1, X2, X3)
    
    > Tree <- clusterTree(XX, k = 100, density = "knn", 
    +     printProgress = FALSE)
    
      When sourcing ‘article.R’:
    Error: At vendor/cigraph/src/constructors/adjacency.c:142 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Execution halted
    
      ‘article.Rnw’ using ‘UTF-8’... failed
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 51.5Mb
      sub-directories of 1Mb or more:
        libs  50.1Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘scales’
      All declared Imports should be used.
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘article.Rnw’ using Sweave
    
    Error: processing vignette 'article.Rnw' failed with diagnostics:
     chunk 48 (label = eq18b) 
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:142 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    
    --- failed re-building ‘article.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘article.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# VertexSimilarity

<details>

* Version: 0.1
* GitHub: NA
* Source code: https://github.com/cran/VertexSimilarity
* Date/Publication: 2016-01-24 21:37:10
* Number of recursive dependencies: 10

Run `revdepcheck::cloud_details(, "VertexSimilarity")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘VertexSimilarity-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: VertexSimilarity
    > ### Title: Vertex Similarity
    > ### Aliases: VertexSimilarity
    > 
    > ### ** Examples
    > 
    > m <- matrix(c(1,0,0,0,0,1,1,1,1),ncol=3,nrow=3,byrow=TRUE)
    > SimilarityMatrix <- VertexSimilarity(m,alpha=0.85)
    Loading required namespace: igraph
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:142 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: VertexSimilarity -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
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

