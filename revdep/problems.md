# adegenet

<details>

* Version: 2.1.10
* GitHub: https://github.com/thibautjombart/adegenet
* Source code: https://github.com/cran/adegenet
* Date/Publication: 2023-01-26 22:00:23 UTC
* Number of recursive dependencies: 113

Run `revdepcheck::cloud_details(, "adegenet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘adegenet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: gengraph
    > ### Title: Genetic transitive graphs
    > ### Aliases: gengraph gengraph.default gengraph.matrix gengraph.dist
    > ###   gengraph.genind gengraph.genpop gengraph.DNAbin
    > 
    > ### ** Examples
    > 
    ...
    +     data(woodmouse)
    +     g <- gengraph(woodmouse, cutoff=5)
    +     g
    +     plot(g$graph)
    + 
    + }
    Loading required package: ape
    Error in `E<-`(`*tmp*`, value = `*vtmp*`) : invalid indexing
    Calls: gengraph ... gengraph.DNAbin -> gengraph -> gengraph.matrix -> E<-
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘adespatial’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.7Mb
      sub-directories of 1Mb or more:
        R       1.9Mb
        data    1.3Mb
        files   1.7Mb
    ```

# backbone

<details>

* Version: 2.1.2
* GitHub: https://github.com/zpneal/backbone
* Source code: https://github.com/cran/backbone
* Date/Publication: 2023-02-13 21:20:02 UTC
* Number of recursive dependencies: 38

Run `revdepcheck::cloud_details(, "backbone")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘backbone-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: disparity
    > ### Title: Extract backbone using the Disparity Filter
    > ### Aliases: disparity
    > 
    > ### ** Examples
    > 
    > #A network with heterogeneous (i.e. multiscale) weights
    ...
    +                 0,0,0,0,0,100,10,0,10,10,
    +                 0,0,0,0,0,100,10,10,0,10,
    +                 0,0,0,0,0,100,10,10,10,0),10)
    > 
    > net <- igraph::graph_from_adjacency_matrix(net, mode = "undirected", weighted = TRUE)
    > plot(net, edge.width = sqrt(igraph::E(net)$weight)) #A stronger clique & a weaker clique
    Error in sqrt(igraph::E(net)$weight) : 
      non-numeric argument to mathematical function
    Calls: plot -> plot.igraph -> i.parse.plot.params
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘tinytest.R’
    Running the tests in ‘tests/tinytest.R’ failed.
    Complete output:
      > if ( requireNamespace("tinytest", quietly=TRUE) ){
      +            tinytest::test_package("backbone")
      + }
       ____   backbone v2.1.2
      |  _ \  Cite: Neal, Z. P., (2022). Backbone: An R package to extract network backbones.
      |#|_) |       PLOS ONE, 17, e0269137. https://doi.org/10.1371/journal.pone.0269137
      |# _ < 
    ...
      test_backbone.R...............   53 tests [0;32mOK[0m 
      test_backbone.R...............   54 tests [0;32mOK[0m 
      test_backbone.R...............   54 tests [0;32mOK[0m 
      test_backbone.R...............   54 tests [0;32mOK[0m 
      test_backbone.R...............   54 tests [0;32mOK[0m 
      test_backbone.R...............   55 tests [0;31m1 fails[0m 
      test_backbone.R...............   55 tests [0;31m1 fails[0m 
      test_backbone.R...............   55 tests [0;31m1 fails[0m Error in igraph::`E<-`(`*tmp*`, value = `*vtmp*`) : invalid indexing
      Calls: <Anonymous> ... lapply -> FUN -> eval -> eval -> <Anonymous> -> <Anonymous>
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘backbone.Rmd’ using rmarkdown
    
    Quitting from lines 132-134 [unnamed-chunk-5] (backbone.Rmd)
    Error: processing vignette 'backbone.Rmd' failed with diagnostics:
    non-numeric argument to mathematical function
    --- failed re-building ‘backbone.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘backbone.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

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

# BayesNetBP

<details>

* Version: 1.6.1
* GitHub: https://github.com/hyu-ub/BayesNetBP
* Source code: https://github.com/cran/BayesNetBP
* Date/Publication: 2022-05-08 17:40:02 UTC
* Number of recursive dependencies: 128

Run `revdepcheck::cloud_details(, "BayesNetBP")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘BayesNetBP-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: FactorQuery
    > ### Title: Queries of discrete variable distributions
    > ### Aliases: FactorQuery
    > 
    > ### ** Examples
    > 
    > 
    ...
    > names(node.class) <- dag@nodes
    > tree.init.p <- Initializer(dag=dag, data=chest$data,
    +                            node.class=node.class,
    +                            propagate=TRUE)
    > # joint distribution
    > FactorQuery(tree=tree.init.p, vars=c("tub", "xray", "dysp", "asia"), mode="joint")
    Error in get.all.simple.paths.pp(res) : 
      INTEGER() can only be applied to a 'integer', not a 'double'
    Calls: FactorQuery ... query.ooc -> all_simple_paths -> get.all.simple.paths.pp
    Execution halted
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

* Version: 0.2.2
* GitHub: https://github.com/MartinLoza/Canek
* Source code: https://github.com/cran/Canek
* Date/Publication: 2023-05-31 04:50:02 UTC
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
       2. └─Canek:::RunCanek.Seurat(x, "orig.ident")
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

# causaloptim

<details>

* Version: 0.9.7
* GitHub: https://github.com/sachsmc/causaloptim
* Source code: https://github.com/cran/causaloptim
* Date/Publication: 2023-03-24 12:00:15 UTC
* Number of recursive dependencies: 65

Run `revdepcheck::cloud_details(, "causaloptim")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(causaloptim)
      Loading required package: igraph
      
      Attaching package: 'igraph'
      
      The following object is masked from 'package:testthat':
    ...
       1. └─causaloptim::analyze_graph(b, constraints = NULL, effectt = "p{Y(X = 1) = 1} - p{Y(X = 0) = 1}") at test-processing.R:25:4
       2.   ├─base::unlist(...)
       3.   └─base::lapply(...)
       4.     └─causaloptim (local) FUN(X[[i]], ...)
       5.       └─igraph::all_simple_paths(graph, from = x, to = allnmes, mode = "out")
       6.         └─igraph:::get.all.simple.paths.pp(res)
      
      [ FAIL 6 | WARN 0 | SKIP 0 | PASS 5 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘example-code.Rmd’ using rmarkdown
    
    Quitting from lines 260-271 [unnamed-chunk-4] (example-code.Rmd)
    Error: processing vignette 'example-code.Rmd' failed with diagnostics:
    INTEGER() can only be applied to a 'integer', not a 'double'
    --- failed re-building ‘example-code.Rmd’
    
    --- re-building ‘shinyapp.Rmd’ using rmarkdown
    
    ...
    Quitting from lines 63-72 [Multiple_Instruments_Code] (vertexenum-speed.Rmd)
    Error: processing vignette 'vertexenum-speed.Rmd' failed with diagnostics:
    INTEGER() can only be applied to a 'integer', not a 'double'
    --- failed re-building ‘vertexenum-speed.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘example-code.Rmd’ ‘shinyapp.Rmd’ ‘vertexenum-speed.Rmd’
    
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

# clickstream

<details>

* Version: 1.3.1
* GitHub: NA
* Source code: https://github.com/cran/clickstream
* Date/Publication: 2020-01-30 16:10:02 UTC
* Number of recursive dependencies: 43

Run `revdepcheck::cloud_details(, "clickstream")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘clickstream-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: clickstream-package
    > ### Title: Analyzes Clickstreams Based on Markov Chains
    > ### Aliases: clickstream-package clickstream
    > ### Keywords: Markov chain click stream
    > 
    > ### ** Examples
    > 
    ...
    Absorbing Probabilities: 
      None
    1  NaN
    
    
    > plot(mc)
    Error in round(igraph::E(graph)$weight, digits) : 
      non-numeric argument to mathematical function
    Calls: plot -> plot -> .local
    Execution halted
    ```

# CliquePercolation

<details>

* Version: 0.4.0
* GitHub: NA
* Source code: https://github.com/cran/CliquePercolation
* Date/Publication: 2022-11-09 08:40:37 UTC
* Number of recursive dependencies: 115

Run `revdepcheck::cloud_details(, "CliquePercolation")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘CliquePercolation-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: cpCommunitySizeDistribution
    > ### Title: Plotting Clique Percolation Community Size Distribution
    > ### Aliases: cpCommunitySizeDistribution
    > 
    > ### ** Examples
    > 
    > ## Example with fictitious data
    ...
    > cp.size.dist <- cpCommunitySizeDistribution(cp.results$list.of.communities.numbers,
    +                                             color.line = "#0000ff")
    > # test for power-law distribution
    > cp.size.dist <- cpCommunitySizeDistribution(cp.results$list.of.communities.numbers,
    +                                             color.line = "#0000ff",
    +                                             test.power.law = TRUE)
    Error in power.law.fit.new(x, xmin = xmin, force.continuous = force.continuous) : 
      'names' attribute [6] must be the same length as the vector [5]
    Calls: cpCommunitySizeDistribution -> <Anonymous> -> power.law.fit.new
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘CliquePercolation.Rmd’ using rmarkdown
    
    Quitting from lines 331-332 [unnamed-chunk-20] (CliquePercolation.Rmd)
    Error: processing vignette 'CliquePercolation.Rmd' failed with diagnostics:
    'names' attribute [6] must be the same length as the vector [5]
    --- failed re-building ‘CliquePercolation.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘CliquePercolation.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
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
      The legacy packages maptools, rgdal, and rgeos, underpinning the sp package,
      which was just loaded, will retire in October 2023.
      Please refer to R-spatial evolution reports for details, especially
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
      [ FAIL 7 | WARN 12 | SKIP 0 | PASS 2101 ]
      
    ...
      1/1 mismatches
      [1] 0 - 3 == -3
      ── Failure ('test-transform_graph.R:337:3'): Removing loop edges via a selection is possible ──
      ... %>% nrow() not equal to 3.
      1/1 mismatches
      [1] 0 - 3 == -3
      
      [ FAIL 7 | WARN 12 | SKIP 0 | PASS 2101 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# Diderot

<details>

* Version: 0.13
* GitHub: NA
* Source code: https://github.com/cran/Diderot
* Date/Publication: 2020-04-19 11:20:02 UTC
* Number of recursive dependencies: 19

Run `revdepcheck::cloud_details(, "Diderot")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘Diderot-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: compute_custom_modularity
    > ### Title: Function to compute the custom modularity of a citation graph
    > ###   over a time window.
    > ### Aliases: compute_custom_modularity 'Custom Modularity'
    > 
    > ### ** Examples
    > 
    ...
    loaded Diderot and set parent environment
    [1] "Graph built! Execution time: 1.02 seconds."
    > 
    > # Compute Custom Modularity
    > compute_custom_modularity(gr, 1990, 2018)
    Error in induced.subgraph(gr, c(core, neighs)) : 
      At vendor/cigraph/src/core/vector.pmt:466 : Assertion failed: capacity >= 0. This is an unexpected igraph error; please report this as a bug, along with the steps to reproduce it.
    Please restart your R session to avoid crashes or other surprising behavior.
    Calls: compute_custom_modularity -> induced.subgraph
    Execution halted
    ```

# diffudist

<details>

* Version: 1.0.1
* GitHub: https://github.com/gbertagnolli/diffudist
* Source code: https://github.com/cran/diffudist
* Date/Publication: 2023-02-27 19:42:40 UTC
* Number of recursive dependencies: 74

Run `revdepcheck::cloud_details(, "diffudist")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘diffudist-package.Rmd’ using rmarkdown
    
    Quitting from lines 229-237 [PRRW-transition-matrix] (diffudist-package.Rmd)
    Error: processing vignette 'diffudist-package.Rmd' failed with diagnostics:
    no such edge attribute
    --- failed re-building ‘diffudist-package.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘diffudist-package.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.0Mb
      sub-directories of 1Mb or more:
        libs   4.1Mb
    ```

# dimRed

<details>

* Version: 0.2.6
* GitHub: https://github.com/gdkrmr/dimRed
* Source code: https://github.com/cran/dimRed
* Date/Publication: 2022-07-11 12:40:06 UTC
* Number of recursive dependencies: 136

Run `revdepcheck::cloud_details(, "dimRed")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dimRed-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: FruchtermanReingold-class
    > ### Title: Fruchterman Reingold Graph Layout
    > ### Aliases: FruchtermanReingold-class FruchtermanReingold
    > 
    > ### ** Examples
    > 
    > if(requireNamespace(c("igraph", "coRanking"), quietly = TRUE)) {
    ...
    + 
    + dat <- loadDataSet("Swiss Roll", n = 100)
    + emb <- embed(dat, "FruchtermanReingold")
    + plot(emb, type = "2vars")
    + 
    + }
    Error in class(x) <- unique.default(c("AsIs", oldClass(x))) : 
      attempt to set an attribute on NULL
    Calls: embed ... em_graph_layout -> embed_graph -> f -> weight.trans
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(dimRed)
      Loading required package: DRR
      Loading required package: kernlab
      Loading required package: CVST
      Loading required package: Matrix
      
    ...
        6.     ├─base::do.call(methodObject@fun, args)
        7.     └─dimRed (local) `<fn>`(data = `<dimRedDt>`, keep.org.data = TRUE, pars = `<named list>`)
        8.       └─dimRed:::em_graph_layout(...)
        9.         └─dimRed:::embed_graph(data.graph, graph_em_method, ndim = ndim)
       10.           ├─igraph (local) f(graph, weights = weight.trans(igraph::E(graph)$weight), dim = ndim)
       11.           └─base (local) weight.trans(igraph::E(graph)$weight)
      
      [ FAIL 1 | WARN 9 | SKIP 7 | PASS 168 ]
      Error: Test failures
      Execution halted
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
    [23-09-26 16:46:44] Generating graph of layer mrna for groupA...
    [23-09-26 16:46:44] Reducing network by WGCNA::pickHardThreshold...
    [23-09-26 16:46:44] R2 cutoff: 0.65
    [23-09-26 16:46:44] Cut Threshold: 0.26
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
      [ FAIL 5 | WARN 0 | SKIP 0 | PASS 92 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
       4.     └─igraph::graph.adjacency(dst, mode = "undirected", weighted = TRUE)
       5.       └─igraph:::graph.adjacency.dense(...)
      ── Failure ('test_smoothness.R:6:3'): regression.result ────────────────────────
      as.numeric(aux$S1) not equal to 0.18172983.
      1/1 mismatches
      [1] 0.554 - 0.182 == 0.372
      
      [ FAIL 5 | WARN 0 | SKIP 0 | PASS 92 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# EcoNetGen

<details>

* Version: 0.2.4
* GitHub: https://github.com/cboettig/EcoNetGen
* Source code: https://github.com/cran/EcoNetGen
* Date/Publication: 2023-08-27 05:10:02 UTC
* Number of recursive dependencies: 87

Run `revdepcheck::cloud_details(, "EcoNetGen")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(EcoNetGen)
      > 
      > ## Windows i386 builds always time out when ggraph
      > ## circle layout is present in README images.  CRAZY
      > skip <- (R.Version()$arch == "i386") &
    ...
          "value"), check = FALSE)`: Length of new attribute value must be 1 or 424, the number of target edges, not 0
      Backtrace:
          ▆
       1. └─EcoNetGen::netsampler(network_in) at test-netsample.R:55:6
       2.   └─igraph::`E<-`(`*tmp*`, value = `*vtmp*`)
       3.     └─igraph:::i_set_edge_attr(...)
      
      [ FAIL 3 | WARN 1 | SKIP 0 | PASS 21 ]
      Error: Test failures
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

# EGAnet

<details>

* Version: 2.0.1
* GitHub: https://github.com/hfgolino/EGAnet
* Source code: https://github.com/cran/EGAnet
* Date/Publication: 2023-08-23 07:20:05 UTC
* Number of recursive dependencies: 208

Run `revdepcheck::cloud_details(, "EGAnet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘EGAnet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: EGA.estimate
    > ### Title: Estimates 'EGA' for Multidimensional Structures
    > ### Aliases: EGA.estimate
    > 
    > ### ** Examples
    > 
    > # Obtain data
    ...
    Warning in (function (Y, formula = NULL, type = "continuous", mixed_type = NULL,  :
      imputation during model fitting is
    currently only implemented for 'continuous'
                       and 'mixed' data.
    Warning in (function (Y, formula = NULL, type = "continuous", mixed_type = NULL,  :
      analytic solution only available for 'type = continuous'
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: EGA.estimate ... convert2igraph -> silent_call -> capture.output -> withVisible
    Execution halted
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

# einet

<details>

* Version: 0.1.0
* GitHub: https://github.com/travisbyrum/einet
* Source code: https://github.com/cran/einet
* Date/Publication: 2020-04-23 17:20:03 UTC
* Number of recursive dependencies: 69

Run `revdepcheck::cloud_details(, "einet")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(einet)
      > 
      > test_check("einet")
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 11 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
      1/1 mismatches
      [1] 1 - 2 == -1
      ── Failure ('test_effective_information.R:69:3'): effective_information is correctly calculated ──
      effective_information(or_copy) not equal to 1.5.
      1/1 mismatches
      [1] 1 - 1.5 == -0.5
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 11 ]
      Error: Test failures
      Execution halted
    ```

# FCMapper

<details>

* Version: 1.1
* GitHub: NA
* Source code: https://github.com/cran/FCMapper
* Date/Publication: 2016-02-12 07:40:47
* Number of recursive dependencies: 10

Run `revdepcheck::cloud_details(, "FCMapper")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘FCMapper-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: graph.fcm
    > ### Title: Fuzzy cognitive map graph
    > ### Aliases: graph.fcm
    > 
    > ### ** Examples
    > 
    > 
    ...
    > matrix[7,] = c(0,0,0,-0.5,0,0,1)
    > concept.names = c("A","B","C","D","E","F","G")
    > 
    > results = nochanges.scenario(matrix,iter=25,concept.names)
    > 
    > graph.fcm(matrix,concept.sizes=results$Equilibrium_value,concept.names)
    Error in i_set_edge_attr(x, attr(value, "name"), index = value, value = attr(value,  : 
      Length of new attribute value must be 1 or 17, the number of target edges, not 0
    Calls: graph.fcm -> <Anonymous> -> i_set_edge_attr
    Execution halted
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

# fossilbrush

<details>

* Version: 1.0.3
* GitHub: NA
* Source code: https://github.com/cran/fossilbrush
* Date/Publication: 2022-07-21 15:50:02 UTC
* Number of recursive dependencies: 40

Run `revdepcheck::cloud_details(, "fossilbrush")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘fossilbrush-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: resolve_duplicates
    > ### Title: resolve_duplicates
    > ### Aliases: resolve_duplicates
    > 
    > ### ** Examples
    > 
    > # load dataset
    > data("brachios")
    > # define ranks
    > b_ranks <- c("phylum", "class", "order", "family", "genus")
    > # run function
    > res <- resolve_duplicates(brachios, ranks = b_ranks)
     + resolving duplicates at rank genus      Error in get.all.simple.paths.pp(res) : 
      INTEGER() can only be applied to a 'integer', not a 'double'
    Calls: resolve_duplicates ... assess_duplicates -> <Anonymous> -> get.all.simple.paths.pp
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘fossilbrush_vignette.Rmd’ using rmarkdown
    
    Quitting from lines 92-99 [unnamed-chunk-5] (fossilbrush_vignette.Rmd)
    Error: processing vignette 'fossilbrush_vignette.Rmd' failed with diagnostics:
    INTEGER() can only be applied to a 'integer', not a 'double'
    --- failed re-building ‘fossilbrush_vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘fossilbrush_vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 31 marked UTF-8 strings
    ```

# fssemR

<details>

* Version: 0.1.8
* GitHub: https://github.com/Ivis4ml/fssemR
* Source code: https://github.com/cran/fssemR
* Date/Publication: 2022-02-11 13:00:02 UTC
* Number of recursive dependencies: 88

Run `revdepcheck::cloud_details(, "fssemR")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘fssemR.Rmd’ using rmarkdown
    
    Quitting from lines 73-76 [unnamed-chunk-4] (fssemR.Rmd)
    Error: processing vignette 'fssemR.Rmd' failed with diagnostics:
    assignment of an object of class "numeric" is not valid for @'x' in an object of class "lgTMatrix"; is(value, "logical") is not TRUE
    --- failed re-building ‘fssemR.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘fssemR.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 18.2Mb
      sub-directories of 1Mb or more:
        libs  17.5Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘qpdf’
      All declared Imports should be used.
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
    --- re-building ‘Significantlinks.Rmd’ using rmarkdown
    
    Quitting from lines 66-79 [unnamed-chunk-4] (Significantlinks.Rmd)
    Error: processing vignette 'Significantlinks.Rmd' failed with diagnostics:
    invalid value supplied for `weighted' argument, please see docs.
    --- failed re-building ‘Significantlinks.Rmd’
    
    --- re-building ‘Tutorial_NRM.Rmd’ using rmarkdown
    
    ...
    --- failed re-building ‘Tutorial_NRM.Rmd’
    
    --- re-building ‘tutorial.Rmd’ using rmarkdown
    --- finished re-building ‘tutorial.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘Significantlinks.Rmd’ ‘Tutorial_NRM.Rmd’
    
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

# grand

<details>

* Version: 0.9.0
* GitHub: https://github.com/zpneal/grand
* Source code: https://github.com/cran/grand
* Date/Publication: 2023-02-10 10:30:02 UTC
* Number of recursive dependencies: 36

Run `revdepcheck::cloud_details(, "grand")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘grand-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: grand.table
    > ### Title: Generate a Guidelines for Reporting About Network Data (GRAND)
    > ###   summary table
    > ### Aliases: grand.table
    > 
    > ### ** Examples
    > 
    ...
    > #A weighted, directed network
    > data(airport)  #Load example data
    > grand.table(airport)  #Generate narrative
    This graph was created by an old(er) igraph version.
      Call upgrade_graph() on it to use with the current igraph version
      For now we convert it on the fly...
    Error in power.law.fit.new(x, xmin = xmin, force.continuous = force.continuous) : 
      'names' attribute [6] must be the same length as the vector [5]
    Calls: grand.table -> <Anonymous> -> power.law.fit.new
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘grand.Rmd’ using rmarkdown
    
    Quitting from lines 187-188 [unnamed-chunk-4] (grand.Rmd)
    Error: processing vignette 'grand.Rmd' failed with diagnostics:
    'names' attribute [6] must be the same length as the vector [5]
    --- failed re-building ‘grand.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘grand.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
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

*   checking examples ... ERROR
    ```
    Running examples in ‘graph4lg-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: compute_graph_modul
    > ### Title: Compute modules from a graph by maximising modularity
    > ### Aliases: compute_graph_modul
    > 
    > ### ** Examples
    > 
    > data("data_tuto")
    > mat_gen <- data_tuto[[1]]
    > graph <- gen_graph_thr(mat_w = mat_gen, mat_thr = mat_gen,
    +                             thr = 0.8)
    > res_mod <- compute_graph_modul(graph = graph,
    +                                 algo = "fast_greedy",
    +                                 node_inter = "distance")
    Error in compute_graph_modul(graph = graph, algo = "fast_greedy", node_inter = "distance") : 
      'graph' must have weighted links in order to compute the specified metric with 'node_inter = distance' option.
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘genetic_graph_2.Rmd’ using rmarkdown
    
    Quitting from lines 186-188 [unnamed-chunk-9] (genetic_graph_2.Rmd)
    Error: processing vignette 'genetic_graph_2.Rmd' failed with diagnostics:
    argument 1 is not a vector
    --- failed re-building ‘genetic_graph_2.Rmd’
    
    --- re-building ‘graph_comparisons_4.Rmd’ using rmarkdown
    
    ...
    --- finished re-building ‘input_data_processing_1.Rmd’
    
    --- re-building ‘landscape_graph_3.Rmd’ using rmarkdown
    --- finished re-building ‘landscape_graph_3.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘genetic_graph_2.Rmd’ ‘graph_comparisons_4.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘Rdpack’
      All declared Imports should be used.
    ```

# gRbase

<details>

* Version: 2.0.0
* GitHub: NA
* Source code: https://github.com/cran/gRbase
* Date/Publication: 2023-09-22 09:10:02 UTC
* Number of recursive dependencies: 45

Run `revdepcheck::cloud_details(, "gRbase")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘gRbase-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: graph_query
    > ### Title: Query a graph
    > ### Aliases: graph_query querygraph qgraph ancestors subGraph
    > ###   is.triangulated connComp ancestralSet ancestralGraph parents children
    > ###   separates closure adj is.simplicial simplicialNodes is.complete
    > ###   is.decomposition nodes edges edges_ addEdge removeEdge
    > 
    ...
    > ### ** Examples
    > 
    > 
    > ug0 <- ug(~a:b + b:c:d + e)
    > 
    > separates("a", "d", c("b", "c"), ug0)
    Error in get.all.simple.paths.pp(res) : 
      INTEGER() can only be applied to a 'integer', not a 'double'
    Calls: separates -> all_simple_paths -> get.all.simple.paths.pp
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘arrays.Rnw’ using knitr
    Error: processing vignette 'arrays.Rnw' failed with diagnostics:
    Running 'texi2dvi' on 'arrays.tex' failed.
    LaTeX errors:
    ! LaTeX Error: File `boxedminipage.sty' not found.
    
    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: sty)
    
    ...
    Quitting from lines 271-272 [unnamed-chunk-14] (graphs_chapter.Rnw)
    Error: processing vignette 'graphs_chapter.Rnw' failed with diagnostics:
    INTEGER() can only be applied to a 'integer', not a 'double'
    --- failed re-building ‘graphs_chapter.Rnw’
    
    SUMMARY: processing the following files failed:
      ‘arrays.Rnw’ ‘graphs_chapter.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 27.9Mb
      sub-directories of 1Mb or more:
        data   3.0Mb
        libs  23.6Mb
    ```

# HospitalNetwork

<details>

* Version: 0.9.3
* GitHub: https://github.com/PascalCrepey/HospitalNetwork
* Source code: https://github.com/cran/HospitalNetwork
* Date/Publication: 2023-02-27 08:22:43 UTC
* Number of recursive dependencies: 117

Run `revdepcheck::cloud_details(, "HospitalNetwork")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(HospitalNetwork)
      Loading required package: data.table
      > 
      > test_check("HospitalNetwork")
      [ FAIL 1 | WARN 0 | SKIP 2 | PASS 57 ]
      
    ...
      [ FAIL 1 | WARN 0 | SKIP 2 | PASS 57 ]
      Deleting unused snapshots:
      • HospiNet/clmat100.svg
      • HospiNet/clustdeg500.svg
      • HospiNet/clustmatclust500.svg
      • HospiNet/deg100.svg
      • HospiNet/mat100.svg
      • HospiNet/matclust500.svg
      Error: Test failures
      Execution halted
    ```

# immcp

<details>

* Version: 1.0.3
* GitHub: https://github.com/YuanlongHu/immcp
* Source code: https://github.com/cran/immcp
* Date/Publication: 2022-05-12 05:50:02 UTC
* Number of recursive dependencies: 198

Run `revdepcheck::cloud_details(, "immcp")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘immcp-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: CreateDisDrugNet
    > ### Title: CreateDisDrugNet
    > ### Aliases: CreateDisDrugNet
    > 
    > ### ** Examples
    > 
    > data(drugdemo)
    ...
    > drug_herb <- PrepareData(drugdemo$drug_herb, from = "drug", to="herb")
    > herb_compound <- PrepareData(drugdemo$herb_compound, from = "herb", to="compound")
    > compound_target <- PrepareData(drugdemo$compound_target, from = "compound", to="target")
    > disease <- PrepareData(drugdemo$disease, diseaseID = "disease",from = "target", to="target")
    > BasicData <- CreateBasicData(drug_herb, herb_compound, compound_target, diseasenet = disease)
    > DisDrugNet <- CreateDisDrugNet(BasicData, drug = "Drug1", disease = "disease")
    Error in get.all.simple.paths.pp(res) : 
      INTEGER() can only be applied to a 'integer', not a 'double'
    Calls: CreateDisDrugNet ... lapply -> FUN -> all_simple_paths -> get.all.simple.paths.pp
    Execution halted
    ```

# incidentally

<details>

* Version: 1.0.2
* GitHub: https://github.com/zpneal/incidentally
* Source code: https://github.com/cran/incidentally
* Date/Publication: 2023-02-15 21:00:02 UTC
* Number of recursive dependencies: 39

Run `revdepcheck::cloud_details(, "incidentally")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘congress.Rmd’ using rmarkdown
    trying URL 'https://www.govinfo.gov/bulkdata/BILLSTATUS/115/sres/BILLSTATUS-115-sres.zip'
    Content type 'application/zip' length 1940782 bytes (1.9 MB)
    ==================================================
    downloaded 1.9 MB
    
    trying URL 'https://www.govinfo.gov/bulkdata/BILLSTATUS/115/sres/BILLSTATUS-115-sres.zip'
    Content type 'application/zip' length 1940782 bytes (1.9 MB)
    ==================================================
    ...
    --- failed re-building ‘congress.Rmd’
    
    --- re-building ‘incidentally.Rmd’ using rmarkdown
    --- finished re-building ‘incidentally.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘congress.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# kangar00

<details>

* Version: 1.4.1
* GitHub: NA
* Source code: https://github.com/cran/kangar00
* Date/Publication: 2022-12-06 08:40:06 UTC
* Number of recursive dependencies: 96

Run `revdepcheck::cloud_details(, "kangar00")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘kangar00-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: pathway
    > ### Title: An S4 class to represent a gene-gene interaction network
    > ### Aliases: pathway pathway,ANY-method show,pathway-method
    > ###   show,pathway,ANY-method summary,pathway-method
    > ###   summary,pathway,ANY-method pathway2igraph,pathway-method
    > ###   pathway2igraph ANY-method analyze,pathway-method analyze
    > ###   get_genes,pathway-method get_genes plot,pathway,missing-method
    ...
      ..$ id  : chr "hsa04020"
      ..$ adj : int [1:180, 1:180] 0 0 0 0 0 0 0 0 0 0 ...
      .. ..- attr(*, "dimnames")=List of 2
      .. .. ..$ : chr [1:180] "ITPKA" "ITPKB" "ITPKC" "ADCY1" ...
      .. .. ..$ : chr [1:180] "ITPKA" "ITPKB" "ITPKC" "ADCY1" ...
      ..$ sign: int [1:594] 1 1 1 1 1 1 1 1 1 1 ...
    > g <- pathway2igraph(hsa04020)
    Error in igraph::`E<-`(`*tmp*`, value = 1:297) : invalid indexing
    Calls: pathway2igraph -> pathway2igraph -> .local -> <Anonymous>
    Execution halted
    ```

# Karen

<details>

* Version: 1.0
* GitHub: NA
* Source code: https://github.com/cran/Karen
* Date/Publication: 2022-09-15 07:40:02 UTC
* Number of recursive dependencies: 39

Run `revdepcheck::cloud_details(, "Karen")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘Karen-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get.cdn
    > ### Title: Get the cell differentiation network from a fitted Kalman
    > ###   Reaction Network.
    > ### Aliases: get.cdn
    > 
    > ### ** Examples
    > 
    ...
    	DONE
    	Smoothing step...	DONE
    	Exporting new initial conditions to the cluster...	DONE
    > parallel::stopCluster(cl)
    > 
    > get.cdn(res.fit)
    Error in order(E(net)$weight, decreasing = FALSE) : 
      argument 1 is not a vector
    Calls: get.cdn ... lazy_eval -> lapply -> FUN -> eval -> eval -> order
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Karen.ltx’ using tex
    Error: processing vignette 'Karen.ltx' failed with diagnostics:
    Running 'texi2dvi' on 'Karen.ltx' failed.
    LaTeX errors:
    ! LaTeX Error: File `realboxes.sty' not found.
    
    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: sty)
    ...
    l.12 \usepackage
                    {amssymb}^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘Karen.ltx’
    
    SUMMARY: processing the following file failed:
      ‘Karen.ltx’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# Libra

<details>

* Version: 1.7
* GitHub: NA
* Source code: https://github.com/cran/Libra
* Date/Publication: 2022-04-11 09:22:30 UTC
* Number of recursive dependencies: 13

Run `revdepcheck::cloud_details(, "Libra")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘Libra-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ising
    > ### Title: Linearized Bregman solver for composite conditionally likelihood
    > ###   of Ising model with lasso penalty.
    > ### Aliases: ising
    > ### Keywords: regression
    > 
    > ### ** Examples
    ...
    > obj = ising(X,10,0.1,nt=1000,trate=100)
    > g<-graph.adjacency(obj$path[,,770],mode="undirected",weighted=TRUE)
    > E(g)[E(g)$weight<0]$color<-"red"
    > E(g)[E(g)$weight>0]$color<-"green"
    > V(g)$name<-attributes(west10)$names
    > plot(g,vertex.shape="rectangle",vertex.size=35,vertex.label=V(g)$name,
    + edge.width=2*abs(E(g)$weight),main="Ising Model (LB): sparsity=0.51")
    Error in abs(E(g)$weight) : non-numeric argument to mathematical function
    Calls: plot -> plot.igraph -> i.parse.plot.params
    Execution halted
    ```

# LoopDetectR

<details>

* Version: 0.1.2
* GitHub: NA
* Source code: https://github.com/cran/LoopDetectR
* Date/Publication: 2020-07-20 09:20:12 UTC
* Number of recursive dependencies: 41

Run `revdepcheck::cloud_details(, "LoopDetectR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘LoopDetectR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: compare_loop_list
    > ### Title: Compare two loop lists
    > ### Aliases: compare_loop_list
    > 
    > ### ** Examples
    > 
    > #sample Jacobian matrix of a system with 4 variables
    > jac_matrix <- rbind(c(-1,0,0,-1),c(1,-1,0,1),c(0,1,-1,0),c(0,0,1,-1))
    > #find the feedback loops of the system
    > loop_list <- find_loops(jac_matrix,10)
    Error in get.all.simple.paths.pp(res) : 
      INTEGER() can only be applied to a 'integer', not a 'double'
    Calls: find_loops -> <Anonymous> -> get.all.simple.paths.pp
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘workflow_LoopDetectR.Rmd’ using knitr
    
    Quitting from lines 53-73 [quick_example] (workflow_LoopDetectR.Rmd)
    Error: processing vignette 'workflow_LoopDetectR.Rmd' failed with diagnostics:
    INTEGER() can only be applied to a 'integer', not a 'double'
    --- failed re-building ‘workflow_LoopDetectR.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘workflow_LoopDetectR.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
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

# manymome

<details>

* Version: 0.1.12
* GitHub: https://github.com/sfcheung/manymome
* Source code: https://github.com/cran/manymome
* Date/Publication: 2023-08-21 15:00:20 UTC
* Number of recursive dependencies: 158

Run `revdepcheck::cloud_details(, "manymome")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘manymome-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: all_indirect_paths
    > ### Title: Enumerate All Indirect Effects in a Model
    > ### Aliases: all_indirect_paths all_paths_to_df
    > 
    > ### ** Examples
    > 
    > library(lavaan)
    ...
    + y ~ m12 + m2 + m11 + x + c1 + c2
    + "
    > fit <- sem(mod, data_serial_parallel,
    +            fixed.x = FALSE)
    > # All indirect paths
    > out1 <- all_indirect_paths(fit)
    Error in get.all.simple.paths.pp(res) : 
      INTEGER() can only be applied to a 'integer', not a 'double'
    Calls: all_indirect_paths -> mapply -> <Anonymous> -> get.all.simple.paths.pp
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(manymome)
      > 
      > test_check("manymome")
      Starting 2 test processes
      [ FAIL 1 | WARN 0 | SKIP 24 | PASS 393 ]
      
    ...
      Backtrace:
          ▆
       1. └─manymome::all_indirect_paths(fit) at test_all_indirect_paths_lv.R:28:0
       2.   └─base::mapply(...)
       3.     └─igraph (local) `<fn>`(from = dots[[1L]][[1L]], to = dots[[2L]][[1L]], graph = `<igraph>`)
       4.       └─igraph:::get.all.simple.paths.pp(res)
      
      [ FAIL 1 | WARN 0 | SKIP 24 | PASS 393 ]
      Error: Test failures
      Execution halted
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
        5.   ├─base::unlist(...)
        6.   └─base::lapply(...)
        7.     └─manynet (local) FUN(X[[i]], ...)
        8.       ├─base::vapply(...)
        9.       └─igraph::all_simple_paths(g, v2, v1, mode = "out", cutoff = max_path_length)
       10.         └─igraph:::get.all.simple.paths.pp(res)
      
      [ FAIL 7 | WARN 0 | SKIP 7 | PASS 297 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘Rgraphviz’
    ```

# mazeGen

<details>

* Version: 0.1.3
* GitHub: NA
* Source code: https://github.com/cran/mazeGen
* Date/Publication: 2017-12-04 17:34:53 UTC
* Number of recursive dependencies: 10

Run `revdepcheck::cloud_details(, "mazeGen")` for more info

</details>

## Newly broken

*   checking whether package ‘mazeGen’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/mazeGen/new/mazeGen.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘mazeGen’ ...
** package ‘mazeGen’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error in get.all.simple.paths.pp(res) : 
  INTEGER() can only be applied to a 'integer', not a 'double'
Error: unable to load R code in package ‘mazeGen’
Execution halted
ERROR: lazy loading failed for package ‘mazeGen’
* removing ‘/tmp/workdir/mazeGen/new/mazeGen.Rcheck/mazeGen’


```
### CRAN

```
* installing *source* package ‘mazeGen’ ...
** package ‘mazeGen’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (mazeGen)


```
# missSBM

<details>

* Version: 1.0.3
* GitHub: https://github.com/grossSBM/missSBM
* Source code: https://github.com/cran/missSBM
* Date/Publication: 2022-08-23 12:10:06 UTC
* Number of recursive dependencies: 115

Run `revdepcheck::cloud_details(, "missSBM")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘missSBM-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: estimateMissSBM
    > ### Title: Estimation of simple SBMs with missing data
    > ### Aliases: estimateMissSBM
    > 
    > ### ** Examples
    > 
    > ## SBM parameters
    ...
    
    > 
    > myModel <- collection$bestModel
    > plot(myModel, "expected")
    > plot(myModel, "imputed")
    > plot(myModel, "meso")
    Error in i_set_edge_attr(x, attr(value, "name"), index = value, value = attr(value,  : 
      Length of new attribute value must be 1 or 6, the number of target edges, not 0
    Calls: plot ... <Anonymous> -> plotMeso -> <Anonymous> -> i_set_edge_attr
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 11.1Mb
      sub-directories of 1Mb or more:
        libs   8.5Mb
    ```

# mnda

<details>

* Version: 1.0.9
* GitHub: NA
* Source code: https://github.com/cran/mnda
* Date/Publication: 2023-01-25 08:30:02 UTC
* Number of recursive dependencies: 89

Run `revdepcheck::cloud_details(, "mnda")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mnda-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: subgraph_difference_plot
    > ### Title: Visualization of a difference subgroup using a circular graph
    > ### Aliases: subgraph_difference_plot
    > 
    > ### ** Examples
    > 
    > myNet = network_gen(N_nodes = 100, N_var_nodes = 5, N_var_nei = 90, noise_sd = .01)
    ...
     15. │       └─l$compute_aesthetics(d, plot)
     16. │         └─ggplot2 (local) compute_aesthetics(..., self = self)
     17. │           └─base::lapply(aesthetics, eval_tidy, data = data, env = env)
     18. │             └─rlang (local) FUN(X[[i]], ...)
     19. └─base::.handleSimpleError(...)
     20.   └─rlang (local) h(simpleError(msg, call))
     21.     └─handlers[[1L]](cnd)
     22.       └─cli::cli_abort(...)
     23.         └─rlang::abort(...)
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘MASS’ ‘Matrix’ ‘magrittr’ ‘reticulate’ ‘tensorflow’ ‘usethis’
      All declared Imports should be used.
    ```

# modMax

<details>

* Version: 1.1
* GitHub: NA
* Source code: https://github.com/cran/modMax
* Date/Publication: 2015-07-24 18:21:32
* Number of recursive dependencies: 11

Run `revdepcheck::cloud_details(, "modMax")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘modMax-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: greedy
    > ### Title: Greedy algorithms
    > ### Aliases: greedy rgplus msgvm cd louvain vertexSim mome
    > ### Keywords: Analysis of algorithms Network dynamics Social network
    > ###   Network theory Community discovery Graph clustering Modularity
    > ###   Multilevel Community structure rural-urban migration Community
    > ###   analysis Clustering Social networking service Community detection
    ...
    > vertices2 <- which(clusters(randomgraph2)$membership==1)  
    > graph2 <- induced.subgraph(randomgraph2,vertices2)
    > graph2 <- set.edge.attribute(graph2, "weight", value=runif(ecount(graph2),0,1))
    > 
    > adj2 <- get.adjacency(graph2, attr="weight")
    > result2 <- louvain(adj2)
    Error in get.adjacency.sparse(graph, type = type, attr = attr, edges = edges,  : 
      no such edge attribute
    Calls: louvain ... calculateQ -> get.adjacency -> get.adjacency.sparse
    Execution halted
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

# MRFcov

<details>

* Version: 1.0.39
* GitHub: https://github.com/nicholasjclark/MRFcov
* Source code: https://github.com/cran/MRFcov
* Date/Publication: 2023-04-06 10:13:19 UTC
* Number of recursive dependencies: 117

Run `revdepcheck::cloud_details(, "MRFcov")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘MRFcov-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plotMRF_hm
    > ### Title: Plot MRF interaction parameters as a heatmap
    > ### Aliases: plotMRF_hm
    > 
    > ### ** Examples
    > 
    > 
    ...
    > 
    > #To plot as an igraph network instead, we can simply extract the adjacency matrix
    > net <- igraph::graph.adjacency(CRFmod$graph, weighted = TRUE, mode = "undirected")
    > igraph::plot.igraph(net, layout = igraph::layout.circle,
    +                    edge.width = abs(igraph::E(net)$weight),
    +                    edge.color = ifelse(igraph::E(net)$weight < 0, 'blue', 'red'))
    Error in abs(igraph::E(net)$weight) : 
      non-numeric argument to mathematical function
    Calls: <Anonymous> -> i.parse.plot.params
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Bird_Parasite_CRF.Rmd’ using rmarkdown
    
    Quitting from lines 52-58 [unnamed-chunk-6] (Bird_Parasite_CRF.Rmd)
    Error: processing vignette 'Bird_Parasite_CRF.Rmd' failed with diagnostics:
    non-numeric argument to mathematical function
    --- failed re-building ‘Bird_Parasite_CRF.Rmd’
    
    --- re-building ‘CRF_data_prep.Rmd’ using rmarkdown
    ...
    --- finished re-building ‘CRF_data_prep.Rmd’
    
    --- re-building ‘Gaussian_Poisson_CRFs.Rmd’ using rmarkdown
    --- finished re-building ‘Gaussian_Poisson_CRFs.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Bird_Parasite_CRF.Rmd’
    
    Error: Vignette re-building failed.
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

# mstknnclust

<details>

* Version: 0.3.2
* GitHub: NA
* Source code: https://github.com/cran/mstknnclust
* Date/Publication: 2023-01-27 14:10:02 UTC
* Number of recursive dependencies: 36

Run `revdepcheck::cloud_details(, "mstknnclust")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mstknnclust-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: generate.complete.graph
    > ### Title: Generates a complete graph
    > ### Aliases: generate.complete.graph
    > ### Keywords: internal
    > 
    > ### ** Examples
    > 
    ...
    The following object is masked from ‘package:base’:
    
        union
    
    > cg.network=igraph::graph.adjacency(d, mode="undirected", weighted=TRUE)
    > plot(cg.network, edge.label=round(E(cg.network)$weight, 2), main="Complete Graph")
    Error in round(E(cg.network)$weight, 2) : 
      non-numeric argument to mathematical function
    Calls: plot -> plot.igraph -> i.parse.plot.params
    Execution halted
    ```

# MultIS

<details>

* Version: 0.6.2
* GitHub: NA
* Source code: https://github.com/cran/MultIS
* Date/Publication: 2021-08-06 11:10:02 UTC
* Number of recursive dependencies: 83

Run `revdepcheck::cloud_details(, "MultIS")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘QuickStart.Rmd’ using knitr
    
    Quitting from lines 189-203 [QS-clusteringC3] (QuickStart.Rmd)
    Error: processing vignette 'QuickStart.Rmd' failed with diagnostics:
    arguments imply differing number of rows: 1274, 0, 1
    --- failed re-building ‘QuickStart.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘QuickStart.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘poweRlaw’ ‘rmutil’
      All declared Imports should be used.
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

# nda

<details>

* Version: 0.1.12
* GitHub: https://github.com/kzst/nda
* Source code: https://github.com/cran/nda
* Date/Publication: 2023-08-19 14:42:36 UTC
* Number of recursive dependencies: 47

Run `revdepcheck::cloud_details(, "nda")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘nda-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: data_gen
    > ### Title: Generate random block matrix for GNDA
    > ### Aliases: data_gen
    > ### Keywords: array multivariate
    > 
    > ### ** Examples
    > 
    ...
    > # Specification 40 by 20 random block matrices with 3 blocks/factors
    > df<-data_gen(40,20,3)
    > library(psych)
    > scree(df)
    > biplot(ndr(df))
    > plot(ndr(df))
    Error in data.frame(from = edges$V1, to = edges$V2, smooth = c(FALSE),  : 
      arguments imply differing number of rows: 57, 1, 0
    Calls: plot -> plot.nda -> data.frame
    Execution halted
    ```

# Neighboot

<details>

* Version: 1.0.1
* GitHub: NA
* Source code: https://github.com/cran/Neighboot
* Date/Publication: 2022-05-31 23:20:08 UTC
* Number of recursive dependencies: 92

Run `revdepcheck::cloud_details(, "Neighboot")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘Neighboot-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: to.rds
    > ### Title: Tranform an 'sample.RDS' object to an 'rds.data.frame' object.
    > ### Aliases: to.rds
    > 
    > ### ** Examples
    > 
    > #Load the synthetic population network dataset.
    ...
    +  3, c(1/6,1/3,1/3,1/6), FALSE)
    > 
    > #Tranform RDS.samp to an rds.data.frame object
    > require(RDS)
    Loading required package: RDS
    > to.rds(RDS.data=RDS.samp)
    Error in get.all.simple.paths.pp(res) : 
      INTEGER() can only be applied to a 'integer', not a 'double'
    Calls: to.rds -> all_simple_paths -> get.all.simple.paths.pp
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

# NetCoupler

<details>

* Version: 0.1.0
* GitHub: https://github.com/NetCoupler/NetCoupler
* Source code: https://github.com/cran/NetCoupler
* Date/Publication: 2022-04-08 09:02:33 UTC
* Number of recursive dependencies: 103

Run `revdepcheck::cloud_details(, "NetCoupler")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘NetCoupler-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: nc_estimate_links
    > ### Title: Compute model estimates between an external (exposure or
    > ###   outcome) variable and a network.
    > ### Aliases: nc_estimate_links nc_estimate_exposure_links
    > ###   nc_estimate_outcome_links
    > 
    > ### ** Examples
    ...
     16. │               └─tidyselect:::walk_data_tree(new, data_mask, context_mask)
     17. │                 └─tidyselect:::as_indices_sel_impl(...)
     18. │                   └─tidyselect:::as_indices_impl(...)
     19. │                     └─tidyselect:::chr_as_locations(x, vars, call = call, arg = arg)
     20. │                       └─vctrs::vec_as_location(...)
     21. └─vctrs (local) `<fn>`()
     22.   └─vctrs:::stop_subscript_oob(...)
     23.     └─vctrs:::stop_subscript(...)
     24.       └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(NetCoupler)
      
      Attaching package: 'NetCoupler'
      
      The following object is masked from 'package:testthat':
    ...
       28. │                     └─tidyselect:::chr_as_locations(x, vars, call = call, arg = arg)
       29. │                       └─vctrs::vec_as_location(...)
       30. └─vctrs (local) `<fn>`()
       31.   └─vctrs:::stop_subscript_oob(...)
       32.     └─vctrs:::stop_subscript(...)
       33.       └─rlang::abort(...)
      
      [ FAIL 2 | WARN 1 | SKIP 0 | PASS 7 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘NetCoupler.Rmd’ using rmarkdown
    
    Quitting from lines 220-235 [example-use] (NetCoupler.Rmd)
    Error: processing vignette 'NetCoupler.Rmd' failed with diagnostics:
    Can't rename columns that don't exist.
    ✖ Column `weight` doesn't exist.
    --- failed re-building ‘NetCoupler.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘NetCoupler.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# netmeta

<details>

* Version: 2.8-2
* GitHub: https://github.com/guido-s/netmeta
* Source code: https://github.com/cran/netmeta
* Date/Publication: 2023-05-06 10:10:05 UTC
* Number of recursive dependencies: 100

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
    Fluticasone:Salmeterol         0.0472
    Placebo:SFC                    0.1011
    Placebo:Salmeterol             0.0404
    SFC:Salmeterol                 0.2830
    > 
    > netcontrib(net1, method = "r")
    Error in get.all.simple.paths.pp(res) : 
      INTEGER() can only be applied to a 'integer', not a 'double'
    Calls: netcontrib ... contribution.matrix.davies -> <Anonymous> -> get.all.simple.paths.pp
    Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘crossnma’
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 2 marked UTF-8 strings
    ```

# NetMix

<details>

* Version: 0.2.0.1
* GitHub: https://github.com/solivella/NetMix
* Source code: https://github.com/cran/NetMix
* Date/Publication: 2022-11-16 16:34:41 UTC
* Number of recursive dependencies: 59

Run `revdepcheck::cloud_details(, "NetMix")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘NetMix-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot.mmsbm
    > ### Title: Various visualization tools for 'mmsbm' objects
    > ### Aliases: plot.mmsbm
    > 
    > ### ** Examples
    > 
    > library(NetMix)
    ...
    Warning in max(igraph::E(block.G)$weight) :
      no non-missing arguments to max; returning -Inf
    Warning in min(x, na.rm = na.rm) :
      no non-missing arguments to min; returning Inf
    Warning in max(x, na.rm = na.rm) :
      no non-missing arguments to max; returning -Inf
    Error in seq.default(range[1], range[2], length.out = 10) : 
      'from' must be a finite number
    Calls: plot -> plot.mmsbm -> .bar.legend -> seq -> seq.default
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.2Mb
      sub-directories of 1Mb or more:
        libs   5.8Mb
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
    
    > ### Name: approx_rank_expected
    > ### Title: Approximation of expected ranks
    > ### Aliases: approx_rank_expected
    > 
    > ### ** Examples
    > 
    > P <- matrix(c(0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, rep(0, 10)), 5, 5, byrow = TRUE)
    > # Exact result
    > exact_rank_prob(P)$expected.rank
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:142 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: exact_rank_prob ... ensure_igraph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
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
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 71 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
          ▆
       1. └─netrankr::comparable_pairs(neighborhood_inclusion(tg)) at test_threshold_graph.R:18:2
       2.   ├─igraph::graph.density(...)
       3.   │ └─igraph:::ensure_igraph(graph)
       4.   └─igraph::graph_from_adjacency_matrix(P, "max")
       5.     └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 71 ]
      Error: Test failures
      Execution halted
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
    Error: processing vignette 'use_case.Rmd' failed with diagnostics:
    At vendor/cigraph/src/constructors/adjacency.c:142 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    --- failed re-building ‘use_case.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘positional_dominance.Rmd’ ‘probabilistic_cent.Rmd’
      ‘threshold_graph.Rmd’ ‘use_case.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
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

# netUtils

<details>

* Version: 0.8.2
* GitHub: https://github.com/schochastics/netUtils
* Source code: https://github.com/cran/netUtils
* Date/Publication: 2023-06-29 16:40:08 UTC
* Number of recursive dependencies: 53

Run `revdepcheck::cloud_details(, "netUtils")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(netUtils)
      > 
      > test_check("netUtils")
      
      Attaching package: 'igraph'
      
    ...
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─netUtils::as_adj_weighted(g, attr = "weight")
       5.   ├─base::as.matrix(...)
       6.   └─igraph::as_adj(g, attr = attr, type = "both", sparse = T)
       7.     └─igraph:::get.adjacency.sparse(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 33 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.2Mb
      sub-directories of 1Mb or more:
        libs   6.0Mb
    ```

# NetworkRiskMeasures

<details>

* Version: 0.1.4
* GitHub: https://github.com/carloscinelli/NetworkRiskMeasures
* Source code: https://github.com/cran/NetworkRiskMeasures
* Date/Publication: 2020-03-05 11:20:02 UTC
* Number of recursive dependencies: 64

Run `revdepcheck::cloud_details(, "NetworkRiskMeasures")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(NetworkRiskMeasures)
      Loading required package: Matrix
      > 
      > test_check("NetworkRiskMeasures")
      [ FAIL 1 | WARN 0 | SKIP 1 | PASS 31 ]
      
    ...
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test_1_risk_com.R:104:15'): vulnerability and communicability ─────
      as.matrix(vi) not equal to `res`.
      1/36 mismatches
      [29] 0 - 0.5 == -0.5
      
      [ FAIL 1 | WARN 0 | SKIP 1 | PASS 31 ]
      Error: Test failures
      Execution halted
    ```

# nevada

<details>

* Version: 0.2.0
* GitHub: https://github.com/astamm/nevada
* Source code: https://github.com/cran/nevada
* Date/Publication: 2023-09-03 21:00:02 UTC
* Number of recursive dependencies: 108

Run `revdepcheck::cloud_details(, "nevada")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘nevada-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: edge_count_global_variables
    > ### Title: Transform distance matrix in edge properties of minimal spanning
    > ###   tree
    > ### Aliases: edge_count_global_variables
    > 
    > ### ** Examples
    > 
    ...
    > gnp_params <- list(p = 1/3)
    > k_regular_params <- list(k = 8L)
    > x <- nvd(model = "gnp", n = n1, model_params = gnp_params)
    > y <- nvd(model = "k_regular", n = n2, model_params = k_regular_params)
    > d <- dist_nvd(x, y, representation = "laplacian", distance = "frobenius")
    > e <- edge_count_global_variables(d, n1, k = 5L)
    Error in igraph::mst(g, algorithm = "prim") : 
      edges weights must be supplied for Prim's algorithm
    Calls: edge_count_global_variables -> kmst -> <Anonymous>
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.3Mb
      sub-directories of 1Mb or more:
        libs   4.8Mb
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
    
    > ### Name: findCluster
    > ### Title: Find clusters in projected unipartite networks
    > ### Aliases: findCluster
    > 
    > ### ** Examples
    > 
    > # generate an incidence matrix
    ...
    +   part = 1,
    +   method = "all",
    +   normalization = FALSE,
    +   rm_weak_edges = TRUE,
    +   comparison = TRUE
    + )
    Error in i_set_edge_attr(x, attr(value, "name"), index = value, value = attr(value,  : 
      Length of new attribute value must be 1 or 4, the number of target edges, not 0
    Calls: findCluster -> <Anonymous> -> i_set_edge_attr
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(NIMAA)
      > 
      > test_check("NIMAA")
      binmatnest.temperature 
                    13.21348 
      Size of Square: 	 66 rows x  66 columns 
    ...
          "value"), check = FALSE)`: Length of new attribute value must be 1 or 4, the number of target edges, not 0
      Backtrace:
          ▆
       1. └─NIMAA::findCluster(...) at test-find-cluster.R:5:2
       2.   └─igraph::`E<-`(`*tmp*`, value = `*vtmp*`)
       3.     └─igraph:::i_set_edge_attr(...)
      
      [ FAIL 1 | WARN 6 | SKIP 0 | PASS 10 ]
      Error: Test failures
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

# numbat

<details>

* Version: 1.3.2-1
* GitHub: https://github.com/kharchenkolab/numbat
* Source code: https://github.com/cran/numbat
* Date/Publication: 2023-06-17 18:50:02 UTC
* Number of recursive dependencies: 136

Run `revdepcheck::cloud_details(, "numbat")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘numbat-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot_mut_history
    > ### Title: Plot mutational history
    > ### Aliases: plot_mut_history
    > 
    > ### ** Examples
    > 
    > p = plot_mut_history(mut_graph_example)
    This graph was created by an old(er) igraph version.
      Call upgrade_graph() on it to use with the current igraph version
      For now we convert it on the fly...
    Error in get.all.simple.paths.pp(res) : 
      INTEGER() can only be applied to a 'integer', not a 'double'
    Calls: plot_mut_history ... nth -> vec_size -> <Anonymous> -> get.all.simple.paths.pp
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 18.2Mb
      sub-directories of 1Mb or more:
        data  12.1Mb
        libs   5.3Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘R.utils’ ‘optparse’ ‘vcfR’
      All declared Imports should be used.
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
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

# parsec

<details>

* Version: 1.2.7
* GitHub: NA
* Source code: https://github.com/cran/parsec
* Date/Publication: 2023-08-19 13:40:02 UTC
* Number of recursive dependencies: 13

Run `revdepcheck::cloud_details(, "parsec")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘parsec-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: MRP
    > ### Title: Mutial ranking probability matrix
    > ### Aliases: MRP MRP.incidence
    > 
    > ### ** Examples
    > 
    > L <- getlambda(A < B, C < B, B < D)
    > MRP(L)
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:142 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: MRP ... ensure_igraph -> <Anonymous> -> graph.adjacency.dense
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

# phylopath

<details>

* Version: 1.1.3
* GitHub: https://github.com/Ax3man/phylopath
* Source code: https://github.com/cran/phylopath
* Date/Publication: 2021-10-04 19:00:02 UTC
* Number of recursive dependencies: 101

Run `revdepcheck::cloud_details(, "phylopath")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘phylopath-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: best
    > ### Title: Extract and estimate the best supported model from a
    > ###   phylogenetic path analysis.
    > ### Aliases: best
    > 
    > ### ** Examples
    > 
    ...
     14. │         └─ggplot2 (local) compute_aesthetics(..., self = self)
     15. │           └─ggplot2:::scales_add_defaults(...)
     16. │             └─base::lapply(aesthetics[new_aesthetics], eval_tidy, data = data)
     17. │               └─rlang (local) FUN(X[[i]], ...)
     18. └─base::.handleSimpleError(...)
     19.   └─rlang (local) h(simpleError(msg, call))
     20.     └─handlers[[1L]](cnd)
     21.       └─cli::cli_abort(...)
     22.         └─rlang::abort(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘binary_models.Rmd’ using rmarkdown
    
    Quitting from lines 116-117 [unnamed-chunk-4] (binary_models.Rmd)
    Error: processing vignette 'binary_models.Rmd' failed with diagnostics:
    Problem while computing aesthetics.
    ℹ Error occurred in the 1st layer.
    Caused by error in `FUN()`:
    ! object 'weight' not found
    --- failed re-building ‘binary_models.Rmd’
    ...
    ℹ Error occurred in the 1st layer.
    Caused by error in `FUN()`:
    ! object 'weight' not found
    --- failed re-building ‘intro_to_phylopath.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘binary_models.Rmd’ ‘intro_to_phylopath.Rmd’
    
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
    
    > ### Name: graph_perm_test
    > ### Title: Performs graph-based permutation tests
    > ### Aliases: graph_perm_test
    > 
    > ### ** Examples
    > 
    > library(phyloseq)
    > data(enterotype)
    > gt = graph_perm_test(enterotype, sampletype = "SeqTech", type = "mst")
    Error in minimum.spanning.tree(gr, algorithm = "prim") : 
      edges weights must be supplied for Prim's algorithm
    Calls: graph_perm_test -> minimum.spanning.tree
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

# PLEXI

<details>

* Version: 1.0.0
* GitHub: NA
* Source code: https://github.com/cran/PLEXI
* Date/Publication: 2023-08-09 15:50:03 UTC
* Number of recursive dependencies: 73

Run `revdepcheck::cloud_details(, "PLEXI")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘PLEXI-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: subgraph_difference_plot
    > ### Title: Visualization of a difference subgroup using a circular graph
    > ### Aliases: subgraph_difference_plot
    > 
    > ### ** Examples
    > 
    > myNet = network_gen(n.nodes = 100, n.var.nodes = 5, n.var.nei = 90, noise.sd = .01)
    ...
     15. │       └─l$compute_aesthetics(d, plot)
     16. │         └─ggplot2 (local) compute_aesthetics(..., self = self)
     17. │           └─base::lapply(aesthetics, eval_tidy, data = data, env = env)
     18. │             └─rlang (local) FUN(X[[i]], ...)
     19. └─base::.handleSimpleError(...)
     20.   └─rlang (local) h(simpleError(msg, call))
     21.     └─handlers[[1L]](cnd)
     22.       └─cli::cli_abort(...)
     23.         └─rlang::abort(...)
    Execution halted
    ```

# poppr

<details>

* Version: 2.9.4
* GitHub: https://github.com/grunwaldlab/poppr
* Source code: https://github.com/cran/poppr
* Date/Publication: 2023-03-23 03:20:02 UTC
* Number of recursive dependencies: 100

Run `revdepcheck::cloud_details(, "poppr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘poppr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: bruvo.msn
    > ### Title: Create minimum spanning network of selected populations using
    > ###   Bruvo's distance.
    > ### Aliases: bruvo.msn msn.bruvo
    > 
    > ### ** Examples
    > 
    ...
    > # Load the data set.
    > data(nancycats)
    > 
    > # View populations 8 and 9 with default colors. 
    > bruvo.msn(nancycats, replen = rep(2, 9), sublist=8:9, vertex.label="inds", 
    +           vertex.label.cex=0.7, vertex.label.dist=0.4)
    Error in minimum.spanning.tree(g, algorithm = "prim", weights = E(g)$weight) : 
      edges weights must be supplied for Prim's algorithm
    Calls: bruvo.msn -> msn_constructor -> minimum.spanning.tree
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Complete output:
      > library(testthat)
      > options(poppr.debug = TRUE)
      > test_check("poppr")
      Loading required package: poppr
      Loading required package: adegenet
      Loading required package: ade4
      
    ...
      Error in `minimum.spanning.tree(g, algorithm = "prim", weights = E(g)$weight)`: edges weights must be supplied for Prim's algorithm
      Backtrace:
          ▆
       1. └─poppr::bruvo.msn(gend, replen = c(1, 1), showplot = FALSE) at test-msn.R:118:0
       2.   └─poppr:::msn_constructor(...)
       3.     └─igraph::minimum.spanning.tree(g, algorithm = "prim", weights = E(g)$weight)
      
      [ FAIL 2 | WARN 0 | SKIP 166 | PASS 332 ]
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

# R.temis

<details>

* Version: 0.1.3
* GitHub: https://github.com/nalimilan/R.TeMiS
* Source code: https://github.com/cran/R.temis
* Date/Publication: 2021-05-12 19:02:12 UTC
* Number of recursive dependencies: 137

Run `revdepcheck::cloud_details(, "R.temis")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘R.temis-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: terms_graph
    > ### Title: terms_graph
    > ### Aliases: terms_graph
    > 
    > ### ** Examples
    > 
    > 
    > file <- system.file("texts", "reut21578-factiva.xml", package="tm.plugin.factiva")
    > corpus <- import_corpus(file, "factiva", language="en")
    > dtm <- build_dtm(corpus)
    > terms_graph(dtm, 100, 3)
    Error in i_set_edge_attr(x, attr(value, "name"), index = value, value = attr(value,  : 
      Length of new attribute value must be 1 or 4448, the number of target edges, not 0
    Calls: terms_graph -> <Anonymous> -> i_set_edge_attr
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘testthat’
      All declared Imports should be used.
    ```

# RaceID

<details>

* Version: 0.3.2
* GitHub: NA
* Source code: https://github.com/cran/RaceID
* Date/Publication: 2023-08-10 14:20:06 UTC
* Number of recursive dependencies: 143

Run `revdepcheck::cloud_details(, "RaceID")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘RaceID.Rmd’ using rmarkdown
    
    Quitting from lines 903-906 [unnamed-chunk-128] (RaceID.Rmd)
    Error: processing vignette 'RaceID.Rmd' failed with diagnostics:
    Length of new attribute value must be 1 or 2, the number of target edges, not 0
    --- failed re-building ‘RaceID.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘RaceID.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 16.3Mb
      sub-directories of 1Mb or more:
        data   6.1Mb
        doc    6.7Mb
        libs   2.6Mb
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

# ragt2ridges

<details>

* Version: 0.3.4
* GitHub: https://github.com/wvanwie/ragt2ridges
* Source code: https://github.com/cran/ragt2ridges
* Date/Publication: 2020-01-28 15:30:02 UTC
* Number of recursive dependencies: 91

Run `revdepcheck::cloud_details(, "ragt2ridges")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ragt2ridges-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: graphVAR1
    > ### Title: Graphs of the temporal (or contemporaneous) relations implied by
    > ###   the VAR(1) model
    > ### Aliases: graphVAR1
    > 
    > ### ** Examples
    > 
    ...
    +                0.5,  0.5,    0,    1,    0,    0, 
    +                  0,  0.5,    0,    0,    1,    0, 
    +                0.5,    0,  0.5,    0,    0,    1), byrow=TRUE, ncol=6)
    > 
    > # adjacency matrix of (global) conditional independencies.
    > graphVAR1(A, P, type="TSCG")
    Error in graph.adjacency.dense(adjmatrix, mode = mode, weighted = weighted,  : 
      At vendor/cigraph/src/constructors/adjacency.c:142 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    Calls: graphVAR1 -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 13.6Mb
      sub-directories of 1Mb or more:
        libs  12.8Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Biobase’ ‘CGHbase’
      All declared Imports should be used.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘longitudinal’
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

# ResIN

<details>

* Version: 1.1.0
* GitHub: https://github.com/pwarncke77/ResIN
* Source code: https://github.com/cran/ResIN
* Date/Publication: 2023-06-30 10:10:02 UTC
* Number of recursive dependencies: 94

Run `revdepcheck::cloud_details(, "ResIN")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ResIN-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ResIN
    > ### Title: ResIN
    > ### Aliases: ResIN
    > 
    > ### ** Examples
    > 
    > 
    ...
     14. │         └─ggplot2 (local) compute_aesthetics(..., self = self)
     15. │           └─ggplot2:::scales_add_defaults(...)
     16. │             └─base::lapply(aesthetics[new_aesthetics], eval_tidy, data = data)
     17. │               └─rlang (local) FUN(X[[i]], ...)
     18. └─base::.handleSimpleError(...)
     19.   └─rlang (local) h(simpleError(msg, call))
     20.     └─handlers[[1L]](cnd)
     21.       └─cli::cli_abort(...)
     22.         └─rlang::abort(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘ResIN-VIGNETTE.Rmd’ using rmarkdown
    
    Quitting from lines 70-91 [plotting edges] (ResIN-VIGNETTE.Rmd)
    Error: processing vignette 'ResIN-VIGNETTE.Rmd' failed with diagnostics:
    Problem while computing aesthetics.
    ℹ Error occurred in the 1st layer.
    Caused by error in `FUN()`:
    ! object 'weight' not found
    --- failed re-building ‘ResIN-VIGNETTE.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘ResIN-VIGNETTE.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# roads

<details>

* Version: 1.1.1
* GitHub: https://github.com/LandSciTech/roads
* Source code: https://github.com/cran/roads
* Date/Publication: 2023-06-24 04:10:03 UTC
* Number of recursive dependencies: 113

Run `revdepcheck::cloud_details(, "roads")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(roads)
      > 
      > test_check("roads")
      [ FAIL 1 | WARN 1 | SKIP 0 | PASS 24 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-projectRoads_CLUSexample.R:62:3'): Projected roads results match CLUS example results for the 'mst' method ──
      getRoadCells(costC, pR_mst$roads, "mst") not equal to `CLUS.mst.roads`.
      Lengths differ: 13 is not 14
      
      [ FAIL 1 | WARN 1 | SKIP 0 | PASS 24 ]
      Error: Test failures
      Execution halted
    ```

# RPANDA

<details>

* Version: 2.2
* GitHub: https://github.com/hmorlon/PANDA
* Source code: https://github.com/cran/RPANDA
* Date/Publication: 2022-10-24 15:28:00 UTC
* Number of recursive dependencies: 130

Run `revdepcheck::cloud_details(, "RPANDA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘RPANDA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: spectR_t
    > ### Title: Spectral density plot of phylogenetic trait data
    > ### Aliases: spectR_t
    > 
    > ### ** Examples
    > 
    > tr<-rtree(10)
    > dat<-runif(10,1,2)
    > spectR_t(tr,dat,draw=TRUE)
    Warning in regularize.values(x, y, ties, missing(ties), na.rm = na.rm) :
      collapsing to unique 'x' values
    Warning in min(x) : no non-missing arguments to min; returning Inf
    Warning in max(x) : no non-missing arguments to max; returning -Inf
    Error in plot.window(...) : need finite 'ylim' values
    Calls: spectR_t -> plot -> plot.default -> localWindow -> plot.window
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        R      3.0Mb
        data   1.6Mb
    ```

# rscc

<details>

* Version: 0.2.1
* GitHub: https://github.com/sigbertklinke/rscc
* Source code: https://github.com/cran/rscc
* Date/Publication: 2022-01-20 12:02:42 UTC
* Number of recursive dependencies: 45

Run `revdepcheck::cloud_details(, "rscc")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘rscc.Rmd’ using rmarkdown
    
    Quitting from lines 244-254 [unnamed-chunk-14] (rscc.Rmd)
    Error: processing vignette 'rscc.Rmd' failed with diagnostics:
    Length of new attribute value must be 1 or 91, the number of target edges, not 0
    --- failed re-building ‘rscc.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘rscc.Rmd’
    
    Error: Vignette re-building failed.
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

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Comparing ‘spelling.Rout’ to ‘spelling.Rout.save’ ...6c6
    < NULL
    ---
    > All Done!
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(sbm)
    ...
        9. ├─base::plot(myMBM, type = "meso")
       10. └─sbm:::plot.SBM(myMBM, type = "meso")
       11.   └─x$plot(type, ordered, plotOptions)
       12.     └─sbm:::plotMesoMultipartite(...)
       13.       └─igraph::`E<-`(`*tmp*`, value = `*vtmp*`)
       14.         └─igraph:::i_set_edge_attr(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 1045 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Multipartite_EcologicalNetwork.Rmd’ using rmarkdown
    
    Quitting from lines 152-158 [plot meso] (Multipartite_EcologicalNetwork.Rmd)
    Error: processing vignette 'Multipartite_EcologicalNetwork.Rmd' failed with diagnostics:
    Length of new attribute value must be 1 or 35, the number of target edges, not 0
    --- failed re-building ‘Multipartite_EcologicalNetwork.Rmd’
    
    --- re-building ‘MultiplexNetwork_principle.Rmd’ using rmarkdown
    --- finished re-building ‘MultiplexNetwork_principle.Rmd’
    ...
    Quitting from lines 114-115 [simpleSBMfit plotmeso] (SBM_fungus_tree_network.Rmd)
    Error: processing vignette 'SBM_fungus_tree_network.Rmd' failed with diagnostics:
    At vendor/cigraph/src/constructors/adjacency.c:540 : Adjacency matrix should be symmetric to produce an undirected graph. Invalid value
    --- failed re-building ‘SBM_fungus_tree_network.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘Multipartite_EcologicalNetwork.Rmd’ ‘SBM_fungus_tree_network.Rmd’
    
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

# SEMgraph

<details>

* Version: 1.2.0
* GitHub: https://github.com/fernandoPalluzzi/SEMgraph
* Source code: https://github.com/cran/SEMgraph
* Date/Publication: 2023-05-04 16:00:02 UTC
* Number of recursive dependencies: 54

Run `revdepcheck::cloud_details(, "SEMgraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SEMgraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: SEMace
    > ### Title: Compute the Average Causal Effect (ACE) for a given source-sink
    > ###   pair
    > ### Aliases: SEMace
    > 
    > ### ** Examples
    > 
    ...
     Applying graph -> DAG conversion.
    DAG conversion : TRUE
    
     Frequency distribution of path length from X to Y :< table of extent 0 >
    
    
     ACE= 1 of 36Error in data.frame(..., check.names = FALSE) : 
      arguments imply differing number of rows: 0, 1
    Calls: SEMace -> rbind -> cbind -> cbind -> data.frame
    Execution halted
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

# sfnetworks

<details>

* Version: 0.6.3
* GitHub: https://github.com/luukvdmeer/sfnetworks
* Source code: https://github.com/cran/sfnetworks
* Date/Publication: 2023-03-22 16:40:02 UTC
* Number of recursive dependencies: 108

Run `revdepcheck::cloud_details(, "sfnetworks")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sfnetworks-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: st_network_paths
    > ### Title: Paths between points in geographical space
    > ### Aliases: st_network_paths
    > 
    > ### ** Examples
    > 
    > library(sf, quietly = TRUE)
    ...
    > # Obtaining all simple paths between two nodes.
    > # Beware, this function can take long when:
    > # --> Providing a lot of 'to' nodes.
    > # --> The network is large and dense.
    > net = as_sfnetwork(roxel, directed = TRUE)
    > st_network_paths(net, from = 1, to = 12, type = "all_simple")
    Error in get.all.simple.paths.pp(res) : 
      INTEGER() can only be applied to a 'integer', not a 'double'
    Calls: st_network_paths ... get_all_simple_paths -> all_simple_paths -> get.all.simple.paths.pp
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(sfnetworks)
      > 
      > test_check("sfnetworks")
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 277 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
        5. ├─base::nrow(.)
        6. ├─sfnetworks::st_network_paths(., 1, 12, type = "all_simple")
        7. └─sfnetworks:::st_network_paths.sfnetwork(., 1, 12, type = "all_simple")
        8.   └─sfnetworks:::get_all_simple_paths(x, from, to, use_names, ...)
        9.     └─igraph::all_simple_paths(x, from, to, ...)
       10.       └─igraph:::get.all.simple.paths.pp(res)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 277 ]
      Error: Test failures
      Execution halted
    ```

# sharpshootR

<details>

* Version: 2.2
* GitHub: https://github.com/ncss-tech/sharpshootR
* Source code: https://github.com/cran/sharpshootR
* Date/Publication: 2023-08-24 16:50:02 UTC
* Number of recursive dependencies: 151

Run `revdepcheck::cloud_details(, "sharpshootR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sharpshootR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plotSoilRelationGraph
    > ### Title: Plot a component relation graph
    > ### Aliases: plotSoilRelationGraph
    > ### Keywords: hplot
    > 
    > ### ** Examples
    > 
    ...
    +   # investigate max spanning tree + edges with weights > 75-th pctile
    +   plotSoilRelationGraph(m, spanning.tree=0.75)
    + 
    +   par(op)
    + 
    + }
    Error in i_set_edge_attr(x, attr(value, "name"), index = value, value = attr(value,  : 
      Length of new attribute value must be 1 or 27, the number of target edges, not 0
    Calls: plotSoilRelationGraph ... .maximum.spanning.tree -> <Anonymous> -> i_set_edge_attr
    Execution halted
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
    
    > ### Name: graph_circular_signed
    > ### Title: circular signed graph
    > ### Aliases: graph_circular_signed
    > 
    > ### ** Examples
    > 
    > library(igraph)
    ...
    
    The following object is masked from ‘package:base’:
    
        union
    
    > graph_circular_signed(n = 50)
    Error in i_set_edge_attr(x, attr(value, "name"), index = value, value = attr(value,  : 
      Length of new attribute value must be 1 or 366, the number of target edges, not 0
    Calls: graph_circular_signed -> <Anonymous> -> i_set_edge_attr
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
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 87 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
          "value"), check = FALSE)`: Length of new attribute value must be 1 or 45, the number of target edges, not 0
      Backtrace:
          ▆
       1. └─signnet::graph_circular_signed(10, pos = 1, neg = 0) at test-random_graphs.R:23:2
       2.   └─igraph::`E<-`(`*tmp*`, value = `*vtmp*`)
       3.     └─igraph:::i_set_edge_attr(...)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 87 ]
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

# simer

<details>

* Version: 0.9.0.2
* GitHub: https://github.com/xiaolei-lab/SIMER
* Source code: https://github.com/cran/simer
* Date/Publication: 2022-08-08 13:30:02 UTC
* Number of recursive dependencies: 24

Run `revdepcheck::cloud_details(, "simer")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘simer-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: GxG.network
    > ### Title: Genetic interaction network
    > ### Aliases: GxG.network
    > 
    > ### ** Examples
    > 
    > pop.map <- generate.map(pop.marker = 1e4)
    > GxG.net <- GxG.network(pop.map)
    Error in get.all.simple.paths.pp(res) : 
      INTEGER() can only be applied to a 'integer', not a 'double'
    Calls: GxG.network -> all_simple_paths -> get.all.simple.paths.pp
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.7Mb
      sub-directories of 1Mb or more:
        libs   8.6Mb
    ```

# SmCCNet

<details>

* Version: 0.99.0
* GitHub: https://github.com/KechrisLab/SmCCNet
* Source code: https://github.com/cran/SmCCNet
* Date/Publication: 2019-03-04 16:50:03 UTC
* Number of recursive dependencies: 12

Run `revdepcheck::cloud_details(, "SmCCNet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SmCCNet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plotMultiOmicsNetwork
    > ### Title: Plot multi-omics module networks.
    > ### Aliases: plotMultiOmicsNetwork
    > 
    > ### ** Examples
    > 
    > set.seed(123)
    ...
    > abar <- getAbar(w, P1 = 2, FeatureLabel = NULL)
    > modules <- getMultiOmicsModules(abar, P1 = 2, CutHeight = 0.5)
    > x <- cbind(geneExpr[ ,seq_len(2)], mirnaExpr[ , seq_len(3)])
    > corr <- cor(x)
    > 
    > plotMultiOmicsNetwork(abar, corr, modules, ModuleIdx = 1, P1 = 2)
    Error in abs(igraph::edge.attributes(net)$weight) : 
      non-numeric argument to mathematical function
    Calls: plotMultiOmicsNetwork
    Execution halted
    ```

# spectralGraphTopology

<details>

* Version: 0.2.3
* GitHub: https://github.com/dppalomar/spectralGraphTopology
* Source code: https://github.com/cran/spectralGraphTopology
* Date/Publication: 2022-03-14 09:30:02 UTC
* Number of recursive dependencies: 116

Run `revdepcheck::cloud_details(, "spectralGraphTopology")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘spectralGraphTopology-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: learn_bipartite_graph
    > ### Title: Learn a bipartite graph Learns a bipartite graph on the basis of
    > ###   an observed data matrix
    > ### Aliases: learn_bipartite_graph
    > 
    > ### ** Examples
    > 
    ...
    > c_scale <- colorRamp(colors)
    > E(estimated_bipartite)$color = apply(
    +   c_scale(E(estimated_bipartite)$weight / max(E(estimated_bipartite)$weight)), 1,
    +                           function(x) rgb(x[1]/255, x[2]/255, x[3]/255))
    Warning in max(E(estimated_bipartite)$weight) :
      no non-missing arguments to max; returning -Inf
    Error in i_set_edge_attr(x, attr(value, "name"), index = value, value = attr(value,  : 
      Length of new attribute value must be 1 or 54, the number of target edges, not 0
    Calls: E<- -> i_set_edge_attr
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.1Mb
      sub-directories of 1Mb or more:
        doc    3.1Mb
        libs   5.5Mb
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

# stminsights

<details>

* Version: 0.4.2
* GitHub: https://github.com/cschwem2er/stminsights
* Source code: https://github.com/cran/stminsights
* Date/Publication: 2023-04-18 19:20:06 UTC
* Number of recursive dependencies: 112

Run `revdepcheck::cloud_details(, "stminsights")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘stminsights-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_network
    > ### Title: extract topic correlation network
    > ### Aliases: get_network
    > 
    > ### ** Examples
    > 
    > 
    ...
      7. │   └─dplyr:::mutate.data.frame(d_tmp, ...)
      8. │     └─dplyr:::mutate_cols(.data, dplyr_quosures(...), by)
      9. │       ├─base::withCallingHandlers(...)
     10. │       └─dplyr:::mutate_col(dots[[i]], data, mask, new_columns)
     11. │         └─mask$eval_all_mutate(quo)
     12. │           └─dplyr (local) eval()
     13. └─base::.handleSimpleError(...)
     14.   └─dplyr (local) h(simpleError(msg, call))
     15.     └─rlang::abort(message, class = error_class, parent = parent, call = error_call)
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

# treefit

<details>

* Version: 1.0.2
* GitHub: https://github.com/hayamizu-lab/treefit-r
* Source code: https://github.com/cran/treefit
* Date/Publication: 2022-01-18 07:50:02 UTC
* Number of recursive dependencies: 156

Run `revdepcheck::cloud_details(, "treefit")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > # Copyright (C) 2020  Momoko Hayamizu <hayamizu@ism.ac.jp>
      > #
      > # This program is free software: you can redistribute it and/or modify
      > # it under the terms of the GNU General Public License as published by
      > # the Free Software Foundation, either version 3 of the License, or
      > # (at your option) any later version.
      > #
    ...
       2.   └─treefit:::calculate_eigenvectors_list(...)
       3.     └─base::lapply(...)
       4.       └─treefit (local) FUN(X[[i]], ...)
       5.         └─treefit:::do_build_tree(original, target, build_tree)
       6.           └─treefit:::calculate_mst(target)
       7.             └─igraph::delete_edge_attr(weighted_mst, "weight")
      
      [ FAIL 5 | WARN 0 | SKIP 0 | PASS 7 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘treefit.Rmd’ using rmarkdown
    
    Quitting from lines 100-105 [estimate-tree-like-data] (treefit.Rmd)
    Error: processing vignette 'treefit.Rmd' failed with diagnostics:
    No such edge attribute: weight
    --- failed re-building ‘treefit.Rmd’
    
    --- re-building ‘working-with-seurat.Rmd’ using rmarkdown
    ...
    ==================================================
    downloaded 6.0 MB
    
    --- finished re-building ‘working-with-seurat.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘treefit.Rmd’
    
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

# vocaldia

<details>

* Version: 0.8.4
* GitHub: NA
* Source code: https://github.com/cran/vocaldia
* Date/Publication: 2022-08-14 20:40:02 UTC
* Number of recursive dependencies: 11

Run `revdepcheck::cloud_details(, "vocaldia")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘vocaldia-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: igraph.vocaldia
    > ### Title: igraph.vocaldia: Create an igraph vocalisation diagram
    > ### Aliases: igraph.vocaldia
    > 
    > ### ** Examples
    > 
    > data(vocdia)
    ...
        decompose, spectrum
    
    The following object is masked from ‘package:base’:
    
        union
    
    Error in round(igraph::E(g)$weight, digits = 3) : 
      non-numeric argument to mathematical function
    Calls: igraph.vocaldia
    Execution halted
    ```

# wdnet

<details>

* Version: 1.2.2
* GitHub: NA
* Source code: https://github.com/cran/wdnet
* Date/Publication: 2023-09-06 21:10:02 UTC
* Number of recursive dependencies: 52

Run `revdepcheck::cloud_details(, "wdnet")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(wdnet)
      > 
      > test_check("wdnet")
      [ FAIL 16 | WARN 0 | SKIP 0 | PASS 56 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
      Backtrace:
          ▆
       1. └─wdnet (local) my_expect_true(nstep = nstep, control = control, directed = FALSE) at test-rewire.R:76:2
       2.   └─wdnet::dprewire(...) at test-rewire.R:47:4
       3.     └─wdnet:::dprewire_undirected(...)
       4.       └─wdnet:::dprewire_undirected_cpp(...)
      
      [ FAIL 16 | WARN 0 | SKIP 0 | PASS 56 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.3Mb
      sub-directories of 1Mb or more:
        libs   8.9Mb
    ```

# wpa

<details>

* Version: 1.9.0
* GitHub: https://github.com/microsoft/wpa
* Source code: https://github.com/cran/wpa
* Date/Publication: 2023-08-21 15:00:02 UTC
* Number of recursive dependencies: 119

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

