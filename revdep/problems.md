# BASiNET

<details>

* Version: 0.0.5
* GitHub: NA
* Source code: https://github.com/cran/BASiNET
* Date/Publication: 2022-08-19 08:50:25 UTC
* Number of recursive dependencies: 78

Run `revdepcheck::cloud_details(, "BASiNET")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘BASiNET.Rmd’ using rmarkdown
    
    Quitting from lines 69-73 [unnamed-chunk-1] (BASiNET.Rmd)
    Error: processing vignette 'BASiNET.Rmd' failed with diagnostics:
    'simplify' should only be used for graph literals
    --- failed re-building ‘BASiNET.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘BASiNET.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# BASiNETEntropy

<details>

* Version: 0.99.6
* GitHub: NA
* Source code: https://github.com/cran/BASiNETEntropy
* Date/Publication: 2023-08-16 18:24:35 UTC
* Number of recursive dependencies: 48

Run `revdepcheck::cloud_details(, "BASiNETEntropy")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘BASiNETEntropy-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: classify
    > ### Title: Performs the classification methodology using complex network
    > ###   and entropy theories
    > ### Aliases: classify
    > 
    > ### ** Examples
    > 
    ...
    6
    7
    8
    9
    10
    [INFO] Filtering the graphs
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: classify -> filtering -> graph -> make_graph
    Execution halted
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

# causaleffect

<details>

* Version: 1.3.15
* GitHub: https://github.com/santikka/causaleffect
* Source code: https://github.com/cran/causaleffect
* Date/Publication: 2022-07-14 09:10:05 UTC
* Number of recursive dependencies: 17

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
    > # Here the bidirected edge between X and Z is set to be unobserved in graph g
    > # This is denoted by giving them a description attribute with the value "U"
    > # The edges in question are the fourth and the fifth edge
    > g <- set.edge.attribute(graph = g, name = "description", index = c(4,5), value = "U")
    Warning: `set.edge.attribute()` was deprecated in igraph 1.6.0.
    ℹ Please use `set_edge_attr()` instead.
    > causal.effect("y", "x", G = g)
    Error in simple_es_index(x, ii) : Unknown edge selected
    Calls: causal.effect ... [ -> [.igraph.es -> lapply -> FUN -> simple_es_index
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
    ! LaTeX Error: File `thumbpdf.sty' not found.
    
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

# centiserve

<details>

* Version: 1.0.0
* GitHub: NA
* Source code: https://github.com/cran/centiserve
* Date/Publication: 2017-07-15 09:34:41 UTC
* Number of recursive dependencies: 14

Run `revdepcheck::cloud_details(, "centiserve")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘centiserve-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: averagedis
    > ### Title: Find the average distance of a node
    > ### Aliases: averagedis
    > 
    > ### ** Examples
    > 
    > g <- graph(c(1,2,2,3,3,4,4,2), directed=FALSE)
    Warning: `graph()` was deprecated in igraph 1.6.0.
    ℹ Please use `make_graph()` instead.
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: graph -> make_graph
    Execution halted
    ```

# cfid

<details>

* Version: 0.1.6
* GitHub: https://github.com/santikka/cfid
* Source code: https://github.com/cran/cfid
* Date/Publication: 2023-11-13 13:33:25 UTC
* Number of recursive dependencies: 53

Run `revdepcheck::cloud_details(, "cfid")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(cfid)
      > 
      > test_check("cfid")
      [ FAIL 1 | WARN 4 | SKIP 0 | PASS 201 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─cfid::import_graph(ig)
       5.   └─cfid::dag(paste0(c(g_obs, g_unobs), collapse = "; "))
       6.     └─cfid:::stopifnot_(nzchar(x), "Argument `x` contains only whitespace or special characters.")
       7.       └─cfid:::stop_(message)
      
      [ FAIL 1 | WARN 4 | SKIP 0 | PASS 201 ]
      Error: Test failures
      Execution halted
    ```

# CINNA

<details>

* Version: 1.2.2
* GitHub: NA
* Source code: https://github.com/cran/CINNA
* Date/Publication: 2023-08-08 16:40:02 UTC
* Number of recursive dependencies: 149

Run `revdepcheck::cloud_details(, "CINNA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘CINNA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dangalchev_closeness_centrality
    > ### Title: Dangalchev Closeness Centrality
    > ### Aliases: dangalchev_closeness_centrality
    > 
    > ### ** Examples
    > 
    > 
    ...
    > data(zachary)
    > 
    > dangalchev_closeness_centrality(zachary)
    This graph was created by an old(er) igraph version.
      Call upgrade_graph() on it to use with the current igraph version
      For now we convert it on the fly...
    Error in getIgraphOpt("add.vertex.names") && is_named(x) : 
      invalid 'x' type in 'x && y'
    Calls: dangalchev_closeness_centrality
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘CINNA.Rmd’ using rmarkdown
    
    Quitting from lines 247-250 [unnamed-chunk-13] (CINNA.Rmd)
    Error: processing vignette 'CINNA.Rmd' failed with diagnostics:
    perplexity is too large for the number of samples
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

# coreCT

<details>

* Version: 1.3.3
* GitHub: https://github.com/troyhill/coreCT
* Source code: https://github.com/cran/coreCT
* Date/Publication: 2021-02-05 15:00:03 UTC
* Number of recursive dependencies: 74

Run `revdepcheck::cloud_details(, "coreCT")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘coreCT-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: getRoots
    > ### Title: Convert a matrix of semi-processed DICOM images to root particle
    > ###   counts, volumes, and surface areas
    > ### Aliases: getRoots
    > 
    > ### ** Examples
    > 
    ...
    > rootChars <- getRoots(HU_426, pixelA = 0.0596,
    + diameter.classes = c(2.5, 10))
    
     Processing root data: 
    
      |                                                                            
      |                                                                      |   0%Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: getRoots ... components -> ensure_igraph -> <Anonymous> -> make_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(coreCT)
      Loading required package: raster
      Loading required package: sp
      Loading required package: igraph
      
      Attaching package: 'igraph'
    ...
       10.         └─raster:::.smallClump(x, directions)
       11.           ├─igraph::clusters(igraph::graph(adjv, directed = FALSE))
       12.           │ └─igraph::components(graph = graph, mode = mode)
       13.           │   └─igraph:::ensure_igraph(graph)
       14.           └─igraph::graph(adjv, directed = FALSE)
       15.             └─igraph::make_graph(...)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 14 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Using_coreCT.Rmd’ using rmarkdown
    
    Quitting from lines 90-93 [unnamed-chunk-4] (Using_coreCT.Rmd)
    Error: processing vignette 'Using_coreCT.Rmd' failed with diagnostics:
    'simplify' should only be used for graph literals
    --- failed re-building ‘Using_coreCT.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Using_coreCT.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# d3r

<details>

* Version: 1.1.0
* GitHub: https://github.com/timelyportfolio/d3r
* Source code: https://github.com/cran/d3r
* Date/Publication: 2023-10-02 14:00:02 UTC
* Number of recursive dependencies: 73

Run `revdepcheck::cloud_details(, "d3r")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(d3r)
      > 
      > test_check("d3r")
      [ FAIL 1 | WARN 1 | SKIP 6 | PASS 14 ]
      
      ══ Skipped tests (6) ═══════════════════════════════════════════════════════════
    ...
      Error in `make_graph(edges = edges, n = n, isolates = isolates, directed = directed, 
          dir = dir, simplify = simplify, ...)`: 'simplify' should only be used for graph literals
      Backtrace:
          ▆
       1. └─igraph::graph.famous("Bull") at test_igraph.R:8:3
       2.   └─igraph::make_graph(...)
      
      [ FAIL 1 | WARN 1 | SKIP 6 | PASS 14 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking:
      'partykit', 'treemap', 'V8'
    ```

# dosearch

<details>

* Version: 1.0.8
* GitHub: NA
* Source code: https://github.com/cran/dosearch
* Date/Publication: 2021-08-19 16:40:02 UTC
* Number of recursive dependencies: 18

Run `revdepcheck::cloud_details(, "dosearch")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dosearch-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dosearch
    > ### Title: Identify a causal effect from arbitrary experiments and
    > ###   observations
    > ### Aliases: dosearch
    > 
    > ### ** Examples
    > 
    ...
    +   g_igraph <- igraph::set.edge.attribute(g_igraph, "description", 3:4, "U")
    +   dosearch(data2, query2, g_igraph)
    + }
    Warning: `graph.formula()` was deprecated in igraph 1.6.0.
    ℹ Please use `graph_from_literal()` instead.
    Warning: `set.edge.attribute()` was deprecated in igraph 1.6.0.
    ℹ Please use `set_edge_attr()` instead.
    Error in graph_split[[x]] : subscript out of bounds
    Calls: dosearch -> get_derivation_dag -> lapply -> FUN
    Execution halted
    ```

## In both

*   checking C++ specification ... NOTE
    ```
      Specified C++11: please drop specification unless essential
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.5Mb
      sub-directories of 1Mb or more:
        libs   6.2Mb
    ```

# EpiILMCT

<details>

* Version: 1.1.7
* GitHub: https://github.com/waleedalmutiry/EpiILMCT
* Source code: https://github.com/cran/EpiILMCT
* Date/Publication: 2021-06-29 06:10:06 UTC
* Number of recursive dependencies: 11

Run `revdepcheck::cloud_details(, "EpiILMCT")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘EpiILMCT-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot.contactnet
    > ### Title: Plot the contact network of 'contactnet' object
    > ### Aliases: plot.contactnet
    > ### Keywords: plot
    > 
    > ### ** Examples
    > 
    ...
    > net1<- contactnet(type = "powerlaw", location = loc, beta = 1.5, nu = 0.5)
    > plot(net1)
    > net2<- contactnet(type = "Cauchy", location = loc, beta = 0.5)
    > plot(net2)
    > net3<- contactnet(type = "random", num.id = 50, beta = 0.08)
    > plot(net3)
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: plot -> plot.contactnet -> <Anonymous> -> make_graph
    Execution halted
    ```

# fanovaGraph

<details>

* Version: 1.5
* GitHub: NA
* Source code: https://github.com/cran/fanovaGraph
* Date/Publication: 2020-10-07 12:10:02 UTC
* Number of recursive dependencies: 99

Run `revdepcheck::cloud_details(, "fanovaGraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘fanovaGraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: estimateGraph
    > ### Title: FANOVA graph estimation.
    > ### Aliases: estimateGraph print.graphlist
    > 
    > ### ** Examples
    > 
    > # Ishigami function, true analytical values: D12 = D23 = 0, D13 =~ 3.374
    > q.arg = list(list(min=-pi, max=pi), list(min=-pi, max=pi), list(min=-pi, max=pi)) 
    > estimateGraph(f.mat=ishigami.fun, d=3, q.arg=q.arg, n.tot=10000, method="LiuOwen")
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: estimateGraph ... max_cliques -> ensure_igraph -> graph -> make_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘run-all.R’
    Running the tests in ‘tests/run-all.R’ failed.
    Complete output:
      > library(testthat)
      > library(fanovaGraph)
      Loading required package: sensitivity
      Loading required package: igraph
      
      Attaching package: 'igraph'
      
    ...
       2.   └─fanovaGraph::threshold(graphlist = g, delta = delta[i])
       3.     ├─igraph::maximal.cliques(graph(as.vector(t(E)), d, FALSE))
       4.     │ └─igraph::max_cliques(...)
       5.     │   └─igraph:::ensure_igraph(graph)
       6.     └─igraph::graph(as.vector(t(E)), d, FALSE)
       7.       └─igraph::make_graph(...)
      
      [ FAIL 6 | WARN 3 | SKIP 0 | PASS 6 ]
      Error: Test failures
      Execution halted
    ```

# ForestGapR

<details>

* Version: 0.1.7
* GitHub: NA
* Source code: https://github.com/cran/ForestGapR
* Date/Publication: 2023-03-31 20:50:18 UTC
* Number of recursive dependencies: 50

Run `revdepcheck::cloud_details(, "ForestGapR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ForestGapR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: GapSPDF
    > ### Title: Forest Canopy Gaps as Spatial Polygons
    > ### Aliases: GapSPDF
    > 
    > ### ** Examples
    > 
    > # Loading raster and viridis libraries
    ...
    > # set height thresholds (e.g. 10 meters)
    > threshold <- 10
    > size <- c(1, 10^4) # m2
    > 
    > # Detecting forest gaps
    > gaps_duc <- getForestGaps(chm_layer = ALS_CHM_DUC, threshold = threshold, size = size)
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: getForestGaps ... components -> ensure_igraph -> <Anonymous> -> make_graph
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

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘fossilbrush_vignette.Rmd’ using rmarkdown
    
    Quitting from lines 92-99 [unnamed-chunk-5] (fossilbrush_vignette.Rmd)
    Error: processing vignette 'fossilbrush_vignette.Rmd' failed with diagnostics:
    'simplify' should only be used for graph literals
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

# FrF2

<details>

* Version: 2.3-3
* GitHub: NA
* Source code: https://github.com/cran/FrF2
* Date/Publication: 2023-09-20 09:00:02 UTC
* Number of recursive dependencies: 37

Run `revdepcheck::cloud_details(, "FrF2")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘FrF2-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: CIG
    > ### Title: Clear interactions graph from catlg entry
    > ### Aliases: CIGstatic CIG gen2CIG
    > ### Keywords: design
    > 
    > ### ** Examples
    > 
    ...
    [[7]]
    + 3/9 vertices, from 30f323b:
    [1] 9 5 8
    
    > 
    > graph2 <- gen2CIG(32, c(7,11,14,29))   ### create graph object from generator columns
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: gen2CIG -> graph -> make_graph
    Execution halted
    ```

# gdistance

<details>

* Version: 1.6.4
* GitHub: https://github.com/AgrDataSci/gdistance
* Source code: https://github.com/cran/gdistance
* Date/Publication: 2023-06-19 21:20:02 UTC
* Number of recursive dependencies: 62

Run `revdepcheck::cloud_details(, "gdistance")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Overview.Rmd’ using knitr
    
    Quitting from lines 454-477 [gdistance-25] (Overview.Rmd)
    Error: processing vignette 'Overview.Rmd' failed with diagnostics:
    'simplify' should only be used for graph literals
    --- failed re-building ‘Overview.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Overview.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# genlasso

<details>

* Version: 1.6.1
* GitHub: https://github.com/glmgen/genlasso
* Source code: https://github.com/cran/genlasso
* Date/Publication: 2022-08-22 08:10:10 UTC
* Number of recursive dependencies: 10

Run `revdepcheck::cloud_details(, "genlasso")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘genlasso-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: fusedlasso
    > ### Title: Compute the fused lasso solution path for a general graph, or a
    > ###   1d or 2d grid
    > ### Aliases: fusedlasso fusedlasso1d fusedlasso2d
    > ### Keywords: models
    > 
    > ### ** Examples
    ...
    > # Fused lasso on a custom graph
    > set.seed(0)
    > edges = c(1,2,1,3,1,5,2,4,2,5,3,6,3,7,3,8,6,7,6,8)
    > gr = graph(edges=edges,directed=FALSE)
    Warning: `graph()` was deprecated in igraph 1.6.0.
    ℹ Please use `make_graph()` instead.
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: graph -> make_graph
    Execution halted
    ```

# ggm

<details>

* Version: 2.5
* GitHub: NA
* Source code: https://github.com/cran/ggm
* Date/Publication: 2020-02-16 14:00:02 UTC
* Number of recursive dependencies: 12

Run `revdepcheck::cloud_details(, "ggm")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggm-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: AG
    > ### Title: Ancestral graph
    > ### Aliases: AG
    > ### Keywords: graphs ancestral graph directed acyclic graph marginalization
    > ###   and conditioning
    > 
    > ### ** Examples
    ...
    +              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    +              1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,
    +              0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0),16,16,byrow=TRUE)
    > M <- c(3,5,6,15,16)
    > C <- c(4,7)
    > AG(ex, M, C, plot = TRUE)
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: AG -> plotfun -> graph -> make_graph
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘graph’
      All declared Imports should be used.
    ```

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) In.Rd:21: Escaped LaTeX specials: \&
    checkRd: (-1) InducedGraphs.Rd:49: Escaped LaTeX specials: \&
    checkRd: (-1) InducedGraphs.Rd:86: Escaped LaTeX specials: \&
    checkRd: (-1) InducedGraphs.Rd:87: Escaped LaTeX specials: \&
    checkRd: (-1) InducedGraphs.Rd:89: Escaped LaTeX specials: \&
    checkRd: (-1) bfsearch.Rd:20: Escaped LaTeX specials: \&
    checkRd: (-1) bfsearch.Rd:30: Escaped LaTeX specials: \&
    checkRd: (-1) bfsearch.Rd:33: Escaped LaTeX specials: \&
    checkRd: (-1) checkIdent.Rd:29: Escaped LaTeX specials: \&
    checkRd: (-1) checkIdent.Rd:34: Escaped LaTeX specials: \&
    ...
    checkRd: (-1) parcor.Rd:24: Escaped LaTeX specials: \&
    checkRd: (-1) parcor.Rd:25: Escaped LaTeX specials: \&
    checkRd: (-1) rcorr.Rd:24: Escaped LaTeX specials: \&
    checkRd: (-1) rnormDag.Rd:36: Escaped LaTeX specials: \&
    checkRd: (-1) rnormDag.Rd:37: Escaped LaTeX specials: \&
    checkRd: (-1) stress.Rd:24: Escaped LaTeX specials: \&
    checkRd: (-1) stress.Rd:25: Escaped LaTeX specials: \&
    checkRd: (-1) topSort.Rd:35: Escaped LaTeX specials: \&
    checkRd: (-1) triDec.Rd:34: Escaped LaTeX specials: \&
    checkRd: (-1) triDec.Rd:35: Escaped LaTeX specials: \&
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

# grainscape

<details>

* Version: 0.4.4
* GitHub: https://github.com/achubaty/grainscape
* Source code: https://github.com/cran/grainscape
* Date/Publication: 2023-04-20 08:40:02 UTC
* Number of recursive dependencies: 98

Run `revdepcheck::cloud_details(, "grainscape")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘grainscape-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: patchFilter
    > ### Title: Filter out patches smaller than a specified area
    > ### Aliases: patchFilter patchFilter,RasterLayer-method
    > 
    > ### ** Examples
    > 
    > ## Load raster landscape
    ...
    > 
    > ## Create a resistance surface from a raster using an is-becomes reclassification
    > tinyCost <- raster::reclassify(tiny, rcl = cbind(c(1, 2, 3, 4), c(1, 5, 10, 12)))
    > ## Produce a patch-based MPG where patches are resistance features = 10
    > ## and all patches are greater than or equal to 2 cells in size
    > filteredPatch <- patchFilter(tinyCost == 10, cells = 2)
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: patchFilter ... components -> ensure_igraph -> <Anonymous> -> make_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Complete output:
      > library(testthat)
      > test_check("grainscape")
      Loading required package: grainscape
      Writing layer `nodes' to data source 
        `/tmp/Rtmp1EUsfi/tiny_goc_thresh2' using driver `ESRI Shapefile'
      Writing 28 features with 5 fields and geometry type Point.
      Writing layer `linksCentroid' to data source 
    ...
        6.       └─raster:::.smallClump(x, directions)
        7.         ├─igraph::clusters(igraph::graph(adjv, directed = FALSE))
        8.         │ └─igraph::components(graph = graph, mode = mode)
        9.         │   └─igraph:::ensure_igraph(graph)
       10.         └─igraph::graph(adjv, directed = FALSE)
       11.           └─igraph::make_graph(...)
      
      [ FAIL 1 | WARN 10 | SKIP 0 | PASS 82 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.9Mb
      sub-directories of 1Mb or more:
        doc    1.5Mb
        libs   2.5Mb
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
      installed size is 35.6Mb
      sub-directories of 1Mb or more:
        libs  34.6Mb
    ```

# influential

<details>

* Version: 2.2.8
* GitHub: https://github.com/asalavaty/influential
* Source code: https://github.com/cran/influential
* Date/Publication: 2023-11-19 05:10:02 UTC
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

# intergraph

<details>

* Version: 2.0-3
* GitHub: https://github.com/mbojan/intergraph
* Source code: https://github.com/cran/intergraph
* Date/Publication: 2023-08-20 23:22:33 UTC
* Number of recursive dependencies: 64

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
      [ FAIL 5 | WARN 117 | SKIP 0 | PASS 49 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
      i Actually got a <lifecycle_stage> with text:
        is.directed() is deprecated
      ── Error ('test-netcompare.R:5:3'): netcompare just works ──────────────────────
      `print(r)` threw an unexpected error.
      Message: object 'r' not found
      Class:   simpleError/error/condition
      
      [ FAIL 5 | WARN 117 | SKIP 0 | PASS 49 ]
      Error: Test failures
      Execution halted
    ```

# isa2

<details>

* Version: 0.3.6
* GitHub: https://github.com/gaborcsardi/ISA
* Source code: https://github.com/cran/isa2
* Date/Publication: 2023-02-21 21:30:02 UTC
* Number of recursive dependencies: 42

Run `revdepcheck::cloud_details(, "isa2")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘isa2-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: isa.sweep
    > ### Title: Create a hierarchical structure of ISA biclusters
    > ### Aliases: isa.sweep isa.sweep,matrix-method sweep.graph
    > ###   sweep.graph,list-method
    > ### Keywords: cluster
    > 
    > ### ** Examples
    ...
    DONE 
    Calculating ISA robustness 
    DONE 
    DONE 
    > network <- sweep.graph(isa.tree)
    Loading required namespace: igraph
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: sweep.graph ... sweep.graph -> sweep.graph.default -> <Anonymous> -> make_graph
    Execution halted
    ```

# jrSiCKLSNMF

<details>

* Version: 1.2.1
* GitHub: NA
* Source code: https://github.com/cran/jrSiCKLSNMF
* Date/Publication: 2023-07-06 18:40:04 UTC
* Number of recursive dependencies: 188

Run `revdepcheck::cloud_details(, "jrSiCKLSNMF")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘jrSiCKLSNMF-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ClusterSickleJr
    > ### Title: Cluster the \mathbf{H} matrix
    > ### Aliases: ClusterSickleJr
    > 
    > ### ** Examples
    > 
    > SimSickleJrSmall<-ClusterSickleJr(SimSickleJrSmall,3)
    > SimSickleJrSmall<-ClusterSickleJr(SimSickleJrSmall,method="louvain",neighbors=5)
    > SimSickleJrSmall<-ClusterSickleJr(SimSickleJrSmall,method="spectral",neighbors=5,numclusts=3)
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: ClusterSickleJr -> specClust -> graph -> make_graph
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.8Mb
      sub-directories of 1Mb or more:
        libs   7.4Mb
    ```

# jti

<details>

* Version: 0.8.4
* GitHub: https://github.com/mlindsk/jti
* Source code: https://github.com/cran/jti
* Date/Publication: 2022-04-12 07:12:38 UTC
* Number of recursive dependencies: 41

Run `revdepcheck::cloud_details(, "jti")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘jti-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: sim_data_from_bn
    > ### Title: Simulate data from a Bayesian network
    > ### Aliases: sim_data_from_bn
    > 
    > ### ** Examples
    > 
    > net <- igraph::graph(as.character(c(1,2,1,3,3,4,3,5,5,4,2,6,6,7,5,7)), directed = TRUE)
    Warning: `graph()` was deprecated in igraph 1.6.0.
    ℹ Please use `make_graph()` instead.
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: <Anonymous> -> make_graph
    Execution halted
    ```

## In both

*   checking C++ specification ... NOTE
    ```
      Specified C++11: please drop specification unless essential
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.1Mb
      sub-directories of 1Mb or more:
        libs   5.3Mb
    ```

# kknn

<details>

* Version: 1.3.1
* GitHub: https://github.com/KlausVigo/kknn
* Source code: https://github.com/cran/kknn
* Date/Publication: 2016-03-26 22:02:21
* Number of recursive dependencies: 10

Run `revdepcheck::cloud_details(, "kknn")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘kknn-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: specClust
    > ### Title: Spectral Clustering
    > ### Aliases: specClust plot.specClust
    > ### Keywords: cluster
    > 
    > ### ** Examples
    > 
    > data(iris)
    > cl <- specClust(iris[,1:4], 3, nn=5)
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: specClust -> graph -> make_graph
    Execution halted
    ```

# kstMatrix

<details>

* Version: 0.2-0
* GitHub: NA
* Source code: https://github.com/cran/kstMatrix
* Date/Publication: 2023-10-12 15:30:02 UTC
* Number of recursive dependencies: 38

Run `revdepcheck::cloud_details(, "kstMatrix")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘kstMatrix.Rmd’ using rmarkdown
    
    Quitting from lines 185-189 [unnamed-chunk-19] (kstMatrix.Rmd)
    Error: processing vignette 'kstMatrix.Rmd' failed with diagnostics:
    'simplify' should only be used for graph literals
    --- failed re-building ‘kstMatrix.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘kstMatrix.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# linkprediction

<details>

* Version: 1.0-0
* GitHub: https://github.com/recon-icm/linkprediction
* Source code: https://github.com/cran/linkprediction
* Date/Publication: 2018-10-19 13:40:03 UTC
* Number of recursive dependencies: 45

Run `revdepcheck::cloud_details(, "linkprediction")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(linkprediction)
      > 
      > test_check("linkprediction")
      [ FAIL 2 | WARN 3 | SKIP 0 | PASS 2 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
      Error in `make_graph(edges = edges, n = n, isolates = isolates, directed = directed, 
          dir = dir, simplify = simplify, ...)`: 'simplify' should only be used for graph literals
      Backtrace:
          ▆
       1. └─igraph::graph(c(1, 2, 1, 3, 1, 4, 2, 4, 1, 5, 2, 5, 4, 5), directed = FALSE) at test_proxfun.R:3:1
       2.   └─igraph::make_graph(...)
      
      [ FAIL 2 | WARN 3 | SKIP 0 | PASS 2 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# loe

<details>

* Version: 1.1
* GitHub: NA
* Source code: https://github.com/cran/loe
* Date/Publication: 2016-02-09 14:36:35
* Number of recursive dependencies: 16

Run `revdepcheck::cloud_details(, "loe")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘loe-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: GARI
    > ### Title: Graph Adjusted Rand Index
    > ### Aliases: GARI
    > 
    > ### ** Examples
    > 
    > library(igraph)
    ...
    > 
    > ADM <- as.matrix( get.adjacency(graph.famous("Thomassen")) )
    Warning: `get.adjacency()` was deprecated in igraph 1.6.0.
    ℹ Please use `as_adjacency_matrix()` instead.
    Warning: `graph.famous()` was deprecated in igraph 1.6.0.
    ℹ Please use `make_graph()` instead.
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: as.matrix ... as_adjacency_matrix -> ensure_igraph -> graph.famous -> make_graph
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

*   checking C++ specification ... NOTE
    ```
      Specified C++11: please drop specification unless essential
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 22.8Mb
      sub-directories of 1Mb or more:
        libs  21.8Mb
    ```

# markovchain

<details>

* Version: 0.9.5
* GitHub: https://github.com/spedygiorgio/markovchain
* Source code: https://github.com/cran/markovchain
* Date/Publication: 2023-09-24 09:20:02 UTC
* Number of recursive dependencies: 105

Run `revdepcheck::cloud_details(, "markovchain")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘an_introduction_to_markovchain_package.Rmd’ using rmarkdown
    Error: processing vignette 'an_introduction_to_markovchain_package.Rmd' failed with diagnostics:
    pandoc version 2.7 or higher is required and was not found (see the help page ?rmarkdown::pandoc_available).
    --- failed re-building ‘an_introduction_to_markovchain_package.Rmd’
    
    --- re-building ‘gsoc_2017_additions.Rmd’ using rmarkdown
    tlmgr: package repository https://mirrors.rit.edu/CTAN/systems/texlive/tlnet (verified)
    [1/1, ??:??/??:??] install: grffile [4k]
    running mktexlsr ...
    ...
    Error: processing vignette 'higher_order_markov_chains.Rmd' failed with diagnostics:
    pandoc version 2.7 or higher is required and was not found (see the help page ?rmarkdown::pandoc_available).
    --- failed re-building ‘higher_order_markov_chains.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘an_introduction_to_markovchain_package.Rmd’
      ‘higher_order_markov_chains.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## Newly fixed

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘an_introduction_to_markovchain_package.Rmd’ using rmarkdown
    Error: processing vignette 'an_introduction_to_markovchain_package.Rmd' failed with diagnostics:
    pandoc version 2.7 or higher is required and was not found (see the help page ?rmarkdown::pandoc_available).
    --- failed re-building ‘an_introduction_to_markovchain_package.Rmd’
    
    --- re-building ‘gsoc_2017_additions.Rmd’ using rmarkdown
    
    tlmgr: Remote database (rev 68967) seems to be older than local (rev 68969 of texlive-scripts); please use different mirror or  wait a day or so.
    tlmgr update --self
    ...
    Error: processing vignette 'higher_order_markov_chains.Rmd' failed with diagnostics:
    pandoc version 2.7 or higher is required and was not found (see the help page ?rmarkdown::pandoc_available).
    --- failed re-building ‘higher_order_markov_chains.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘an_introduction_to_markovchain_package.Rmd’
      ‘gsoc_2017_additions.Rmd’ ‘higher_order_markov_chains.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘etm’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 24.0Mb
      sub-directories of 1Mb or more:
        libs  21.9Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# maxmatching

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/maxmatching
* Date/Publication: 2017-01-15 09:51:07
* Number of recursive dependencies: 10

Run `revdepcheck::cloud_details(, "maxmatching")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘maxmatching-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: maxmatching
    > ### Title: Maximum Matching
    > ### Aliases: maxmatching
    > 
    > ### ** Examples
    > 
    > # Unweighted general graph
    > G1 <- igraph::graph(c(1, 2, 1, 3, 1, 4, 3, 4, 3, 5,
    + 5, 6, 6, 7, 7, 8, 8, 9, 3, 8, 5, 8), directed = FALSE)
    Warning: `graph()` was deprecated in igraph 1.6.0.
    ℹ Please use `make_graph()` instead.
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: <Anonymous> -> make_graph
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
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
Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
  'simplify' should only be used for graph literals
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
# MetricGraph

<details>

* Version: 1.2.0
* GitHub: https://github.com/davidbolin/MetricGraph
* Source code: https://github.com/cran/MetricGraph
* Date/Publication: 2023-11-07 10:10:16 UTC
* Number of recursive dependencies: 129

Run `revdepcheck::cloud_details(, "MetricGraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘MetricGraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: graph_components
    > ### Title: Connected components of metric graph
    > ### Aliases: graph_components
    > 
    > ### ** Examples
    > 
    > library(sp)
    ...
    > edge1 <- rbind(c(0, 0), c(1, 0))
    > edge2 <- rbind(c(1, 0), c(2, 0))
    > edge3 <- rbind(c(1, 1), c(2, 1))
    > edges <- list(edge1, edge2, edge3)
    > 
    > graphs <- graph_components$new(edges)
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: <Anonymous> -> initialize -> graph -> make_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > test_check("MetricGraph")
      Loading required package: MetricGraph
      
      Attaching package: 'MetricGraph'
      
      The following object is masked from 'package:stats':
    ...
      Backtrace:
          ▆
       1. └─metric_graph$new(edges = edges) at test_split_line.R:9:1
       2.   └─MetricGraph (local) initialize(...)
       3.     └─igraph::graph(edges = c(t(self$E)), directed = FALSE)
       4.       └─igraph::make_graph(...)
      
      [ FAIL 12 | WARN 2 | SKIP 1 | PASS 8 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 20.8Mb
      sub-directories of 1Mb or more:
        R      1.0Mb
        libs  19.3Mb
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
      Error in `make_graph(edges = edges, n = n, isolates = isolates, directed = directed, 
          dir = dir, simplify = simplify, ...)`: 'simplify' should only be used for graph literals
      Backtrace:
          ▆
       1. └─igraph::graph(edges = c(1, 2, 2, 3), n = 4, directed = FALSE) at test-measure_holes.R:34:1
       2.   └─igraph::make_graph(...)
      
      [ FAIL 1 | WARN 6 | SKIP 0 | PASS 276 ]
      Error: Test failures
      Execution halted
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
    
    > ### Name: EDNN
    > ### Title: Encoder decoder neural network (EDNN) function
    > ### Aliases: EDNN
    > 
    > ### ** Examples
    > 
    > myNet = network_gen(N_nodes = 50)
    > graphData = myNet[["data_graph"]]
    > edge.list = graphData[,1:2]
    > edge.weight = graphData[,3:4]
    > XY = ednn_IOprepare(edge.list, edge.weight)
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: ednn_IOprepare -> <Anonymous> -> make_graph
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘MASS’ ‘Matrix’ ‘magrittr’ ‘reticulate’ ‘tensorflow’ ‘usethis’
      All declared Imports should be used.
    ```

# mppR

<details>

* Version: 1.4.0
* GitHub: https://github.com/vincentgarin/mppR
* Source code: https://github.com/cran/mppR
* Date/Publication: 2023-01-05 20:50:02 UTC
* Number of recursive dependencies: 73

Run `revdepcheck::cloud_details(, "mppR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mppR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: MQE_gen_effects
    > ### Title: QTL genetic effects multi-QTL effect model
    > ### Aliases: MQE_gen_effects
    > 
    > ### ** Examples
    > 
    > 
    ...
    > 
    > SIM <- mpp_SIM(mppData = mppData)
    > QTL <- QTL_select(SIM)
    > 
    > QTL.eff <- MQE_gen_effects(mppData = mppData, QTL = QTL[, 1],
    +                           Q.eff = c("anc", "par", "biall"))
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: MQE_gen_effects ... <Anonymous> -> design_connectivity -> graph -> make_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > test_check("mppR")
      Loading required package: mppR
      [ FAIL 3 | WARN 1 | SKIP 0 | PASS 24 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_MQE_proc.R:16:1'): (code run outside of `test_that()`) ─────────
    ...
       2.   └─mppR::QTL_gen_effects(...)
       3.     └─base::mapply(...)
       4.       └─mppR (local) `<fn>`(...)
       5.         └─mppR::design_connectivity(...)
       6.           └─igraph::graph(vertices)
       7.             └─igraph::make_graph(...)
      
      [ FAIL 3 | WARN 1 | SKIP 0 | PASS 24 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘MPP_ME_QTL_detect.Rmd’ using rmarkdown
    
    Quitting from lines 126-129 [setup] (MPP_ME_QTL_detect.Rmd)
    Error: processing vignette 'MPP_ME_QTL_detect.Rmd' failed with diagnostics:
    'simplify' should only be used for graph literals
    --- failed re-building ‘MPP_ME_QTL_detect.Rmd’
    
    --- re-building ‘mppR_gen_vignette.Rmd’ using rmarkdown
    ...
    Quitting from lines 355-360 [design_connectivity] (mppR_gen_vignette.Rmd)
    Error: processing vignette 'mppR_gen_vignette.Rmd' failed with diagnostics:
    'simplify' should only be used for graph literals
    --- failed re-building ‘mppR_gen_vignette.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘MPP_ME_QTL_detect.Rmd’ ‘mppR_gen_vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# MRS

<details>

* Version: 1.2.4
* GitHub: NA
* Source code: https://github.com/cran/MRS
* Date/Publication: 2018-01-23 09:10:10 UTC
* Number of recursive dependencies: 13

Run `revdepcheck::cloud_details(, "MRS")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘MRS-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plotTree
    > ### Title: Plot nodes of the representative tree
    > ### Aliases: plotTree
    > 
    > ### ** Examples
    > 
    > set.seed(1)
    ...
    > X = rbind(X1, X2)
    > colnames(X) = c(1,2)
    > G = c(rep(1, n1), rep(2,n2))
    > 
    > ans = mrs(X, G, K=8)
    > plotTree(ans, type = "prob", legend = TRUE)
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: plotTree -> <Anonymous> -> make_graph
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.9Mb
      sub-directories of 1Mb or more:
        libs   9.7Mb
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

*   checking examples ... ERROR
    ```
    Running examples in ‘nat-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: neuron
    > ### Title: neuron: class to represent traced neurons
    > ### Aliases: neuron is.neuron as.neuron as.neuron.data.frame
    > ###   as.neuron.ngraph as.neuron.igraph as.neuron.default
    > 
    > ### ** Examples
    > 
    ...
    [25] xform              xyzmatrix          xyzmatrix<-       
    see '?methods' for accessing help and source code
    > 
    > ## Neurons as graphs 
    > # convert to graph and find longest paths by number of nodes
    > ng=as.ngraph(n)
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: as.ngraph ... as.ngraph.data.frame -> ngraph -> <Anonymous> -> make_graph
    Execution halted
    ```

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
      Error in `make_graph(edges = edges, n = n, isolates = isolates, directed = directed, 
          dir = dir, simplify = simplify, ...)`: 'simplify' should only be used for graph literals
      Backtrace:
          ▆
       1. └─igraph::graph(c(1, 2, 2, 3)) at test-seglist.R:10:3
       2.   └─igraph::make_graph(...)
      
      [ FAIL 44 | WARN 3 | SKIP 4 | PASS 563 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Installation.Rmd’ using rmarkdown
    --- finished re-building ‘Installation.Rmd’
    
    --- re-building ‘neurons-intro.Rmd’ using rmarkdown
    
    Quitting from lines 200-207 [unnamed-chunk-14] (neurons-intro.Rmd)
    Error: processing vignette 'neurons-intro.Rmd' failed with diagnostics:
    'simplify' should only be used for graph literals
    --- failed re-building ‘neurons-intro.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘neurons-intro.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# netdiffuseR

<details>

* Version: 1.22.6
* GitHub: https://github.com/USCCANA/netdiffuseR
* Source code: https://github.com/cran/netdiffuseR
* Date/Publication: 2023-08-30 17:00:10 UTC
* Number of recursive dependencies: 88

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
    ...
     4: `[<-`(`*tmp*`, ids[, 1:2], value = c(15.1666666666667, 9.08333333333333, 4.38888888888889, 4.91666666666667, 4.91666666666667, 3.80555555555556, 4.52777777777778, 4.11111111111111, 4.52777777777778, 7.38888888888889, 4.97222222222222, 6.61111111111111, 4.38888888888889, 4.38888888888889, 4.55555555555556, 3.25, 4.94444444444444, 4.52777777777778, 4.55555555555555, 4.38888888888889, 4.27777777777778, 4.38888888888889, 4.41666666666667, 3.94444444444445, 3.55555555555556, 4.41666666666667, 4.38888888888889, 4.27777777777778, 4.38888888888889, 4.41666666666667, 4.38888888888889, 4.38888888888889, 4.27777777777778, 4.38888888888889, 4.41666666666667, 4.38888888888889, 4.27777777777778, 4.41666666666667, 3.97222222222222, 4.52777777777778, 4.38888888888889, 4.13888888888889, 3.66666666666667, 4.38888888888889, 4.38888888888889, 4.38888888888889, 4.52777777777778, 4.77777777777778, 4.38888888888889, 4.36111111111111, 3.94444444444444, 4.38888888888889, 4.27777777777778, 4.27777777777778, 4.77777777777778, 4.13888888888889, 4.41666666666667, 3.80555555555556, 4.38888888888889, 4.41666666666667, 4.38888888888889, 4.13888888888889, 4.27777777777778, 4.38888888888889, 4.13888888888889, 4.27777777777778, 4.27777777777778, 4.38888888888889, 4.27777777777778, 4.13888888888889, 4.38888888888889, 4.38888888888889, 4.38888888888889, 4.13888888888889, 4.38888888888889, 4.38888888888889, 4.38888888888889, 4.05555555555556, 4.41666666666667, 4.38888888888889, 4.38888888888889, 4.38888888888889, 4.41666666666667, 4.38888888888889, 4.27777777777778, 3.94444444444444, 4.38888888888889, 4.38888888888889, 4.38888888888889, 3.94444444444444, 4.41666666666667, 4.38888888888889, 4.38888888888889, 4.38888888888889, 4.38888888888889, 4.38888888888889, 4.13888888888889, 4.27777777777778, 4.52777777777778, 3.22222222222222, 10.75, 9.72222222222223, 9.72222222222222, 11, 10.1944444444444, 10.8611111111111, 10.1944444444444, 13.7777777777778, 11.3611111111111, 5.11111111111111, 9.77777777777778, 10.3333333333333, 10.9444444444444, 11.3333333333333, 8.30555555555556, 10.1944444444444, 9.27777777777778, 10.75, 10.7777777777778, 10.75, 10.3333333333333, 10.8055555555556, 11.1944444444444, 10.3333333333333, 10.5277777777778, 10.7777777777778, 10.5277777777778, 10.5277777777778, 10.7777777777778, 10.3333333333333, 10.8055555555556, 10.7777777777778, 10.8055555555556, 10.7777777777778, 10.7777777777778, 10.5277777777778, 10.9444444444444, 10.9166666666667, 10.3333333333333, 10.8055555555556, 10.9444444444444, 10.75, 10.75, 10.5277777777778, 9.52777777777778, 9.13888888888889, 10.5277777777778, 10.7777777777778, 10.7777777777778, 10.7777777777778, 10.7777777777778, 10.7777777777778, 11.1666666666667, 10.8055555555556, 9.77777777777778, 10.9166666666667, 10.75, 10.8055555555556, 10.5277777777778, 10.8055555555556, 10.7777777777778, 10.7777777777778, 10.7777777777778, 10.7777777777778, 10.7777777777778, 10.0833333333333, 10.7777777777778, 10.7777777777778, 10.7777777777778, 10.7777777777778, 10.3333333333333, 10.7777777777778, 10.75, 10.7777777777778, 10.7777777777778, 10.9166666666667, 9.77777777777778, 10.7777777777778, 10.75, 10.3333333333333, 10.8055555555556, 10.75, 10.7777777777778, 10.8055555555556, 10.75, 10.7777777777778, 10.75, 10.7777777777778, 10.3333333333333, 10.7777777777778, 9.77777777777778, 10.7777777777778, 10.75, 10.7777777777778, 10.7777777777778, 10.7777777777778, 10.9166666666667, 4.69444444444444, 5.22222222222222, 5.22222222222222, 4.91666666666667, 4.83333333333333, 4.77777777777778, 4.83333333333333, 7.69444444444444, 5.27777777777778, 0.777777777777778, 4, 4.44444444444444, 4.86111111111111, 5.25, 2.91666666666667, 4.36111111111111, 3.61111111111111, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.72222222222222, 4.72222222222222, 5.11111111111111, 4.72222222222222, 4.58333333333333, 4.69444444444444, 4.58333333333333, 4.72222222222222, 4.69444444444444, 4.44444444444444, 4.72222222222222, 4.69444444444444, 4.72222222222222, 4.69444444444444, 4.69444444444444, 4.72222222222222, 4.86111111111111, 4.83333333333333, 4.44444444444444, 4.72222222222222, 4.86111111111111, 4.69444444444444, 4.69444444444444, 4.69444444444444, 3.80555555555556, 3.52777777777778, 4.58333333333333, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 5.08333333333333, 4.72222222222222, 4, 4.83333333333333, 4.69444444444444, 4.72222222222222, 4.69444444444444, 4.72222222222222, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.25, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.83333333333333, 4, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.72222222222222, 4.69444444444444, 4.69444444444444, 4.72222222222222, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.44444444444445, 4.69444444444444, 4, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.83333333333333, 0.527777777777778, 0.527777777777778, 0.222222222222222, 0.138888888888889, 0.0833333333333333, 0.138888888888889, 3, 0.583333333333333, 2.22222222222222, 0, 0, 0.166666666666667, 0.555555555555556, 0.555555555555556, 0.138888888888889, 0.166666666666667, 0, 0, 0, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 1.05555555555556, 0.75, 0.194444444444444, 0.611111111111111, 0.666666666666667, 3.52777777777778, 1.11111111111111, 2.75, 0.527777777777778, 0.527777777777778, 0.694444444444444, 1.08333333333333, 1.08333333333333, 0.666666666666667, 0.694444444444444, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.555555555555556, 0.555555555555556, 0.944444444444444, 0.277777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.416666666666667, 0.694444444444444, 0.666666666666667, 0.527777777777778, 0.555555555555556, 0.694444444444444, 0.527777777777778, 0.527777777777778, 0.416666666666667, 0.666666666666667, 0.916666666666667, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.916666666666667, 0.555555555555556, 0.555555555555556, 0.666666666666667, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.666666666666667, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.277777777777778, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.666666666666667, 0.75, 0.666666666666667, 0.611111111111111, 0.194444444444444, 3.52777777777778, 1.11111111111111, 2.75, 0.527777777777778, 0.527777777777778, 0.694444444444444, 1.08333333333333, 1.08333333333333, 0.666666666666667, 0.694444444444444, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.277777777777778, 0.555555555555556, 0.944444444444444, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.416666666666667, 0.527777777777778, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.555555555555556, 0.694444444444444, 0.666666666666667, 0.527777777777778, 0.555555555555556, 0.694444444444445, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.666666666666667, 0.916666666666667, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.916666666666667, 0.555555555555556, 0.555555555555556, 0.666666666666667, 0.527777777777778, 0.555555555555556, 0.416666666666667, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.277777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.666666666666667, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.666666666666667, 0.361111111111111, 0.305555555555556, 0.361111111111111, 3.22222222222222, 0.805555555555556, 2.44444444444444, 0.222222222222222, 0.222222222222222, 0.388888888888889, 0.777777777777778, 0.777777777777778, 0.361111111111111, 0.388888888888889, 0.222222222222222, 0.194444444444444, 0.222222222222222, 0.25, 0.25, 0.638888888888889, 0.25, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.25, 0.222222222222222, 0.222222222222222, 0.25, 0.222222222222222, 0.25, 0.222222222222222, 0.222222222222222, 0.25, 0.388888888888889, 0.361111111111111, 0.222222222222222, 0.111111111111111, 0.388888888888889, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.361111111111111, 0.611111111111111, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.611111111111111, 0.25, 0.25, 0.361111111111111, 0.222222222222222, 0.25, 0.222222222222222, 0.25, 0.194444444444444, 0.222222222222222, 0.222222222222222, 0.194444444444444, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.111111111111111, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.361111111111111, 0.25, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.25, 0.222222222222222, 0.222222222222222, 0.25, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.25, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.361111111111111, 0.222222222222222, 0.277777777777778, 3.13888888888889, 0.722222222222222, 2.36111111111111, 0.138888888888889, 0.138888888888889, 0.305555555555556, 0.694444444444444, 0.694444444444444, 0.277777777777778, 0.305555555555556, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.166666666666667, 0.555555555555556, 0.0277777777777778, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.305555555555556, 0.277777777777778, 0.138888888888889, 0.166666666666667, 0.305555555555556, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.527777777777778, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.527777777777778, 0.166666666666667, 0.166666666666667, 0.277777777777778, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.222222222222222, 3.08333333333333, 0.666666666666667, 2.30555555555556, 0.0833333333333333, 0.0833333333333333, 0.25, 0.638888888888889, 0.638888888888889, 0.222222222222222, 0.25, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.111111111111111, 0.111111111111111, 0.5, 0.111111111111111, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.111111111111111, 0.0833333333333333, 0.0833333333333333, 0.111111111111111, 0.0833333333333333, 0.111111111111111, 0.0833333333333333, 0.0833333333333333, 0.111111111111111, 0.25, 0.222222222222222, 0.0833333333333333, 0.111111111111111, 0.25, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.222222222222222, 0.472222222222222, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0555555555555556, 0.472222222222222, 0.111111111111111, 0.111111111111111, 0.222222222222222, 0.0833333333333333, 0.111111111111111, 0.0833333333333333, 0.111111111111111, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0555555555555556, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.222222222222222, 0.111111111111111, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.111111111111111, 0.0833333333333333, 0.0833333333333333, 0.111111111111111, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.111111111111111, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0555555555555556, 0.222222222222222, 3.13888888888889, 0.722222222222222, 2.36111111111111, 0.138888888888889, 0.138888888888889, 0.305555555555556, 0.694444444444444, 0.694444444444444, 0.277777777777778, 0.305555555555556, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.0277777777777778, 0.166666666666667, 0.555555555555556, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.305555555555556, 0.277777777777778, 0.138888888888889, 0.166666666666667, 0.305555555555556, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.527777777777778, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.527777777777778, 0.166666666666667, 0.166666666666667, 0.277777777777778, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.0277777777777778, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 1.66666666666667, 5.22222222222222, 3, 3, 2.58333333333333, 3.55555555555556, 3.55555555555556, 3.13888888888889, 3.16666666666667, 3, 3, 3, 3.02777777777778, 3.02777777777778, 3.41666666666667, 3.02777777777778, 3, 3, 3, 3.02777777777778, 2.88888888888889, 3, 3.02777777777778, 2.97222222222222, 2.75, 2.88888888888889, 3, 3.02777777777778, 3.16666666666667, 2.41666666666667, 3, 3.02777777777778, 3.16666666666667, 3, 3, 3, 3.13888888888889, 3.38888888888889, 3, 3, 3, 2.75, 3, 3, 2.25, 3.02777777777778, 3.02777777777778, 3.13888888888889, 3, 2.55555555555556, 3, 3.02777777777778, 3, 3, 3, 3, 3, 3, 3, 3, 2.88888888888889, 2.88888888888889, 3, 3, 3, 2.88888888888889, 2.97222222222222, 3.13888888888889, 3.02777777777778, 2.88888888888889, 3, 3, 2.55555555555556, 3, 3, 3.02777777777778, 3, 2.55555555555556, 3, 3, 3.02777777777778, 2.88888888888889, 3, 2.55555555555556, 3, 2.88888888888889, 3, 3, 2.41666666666667, 2.80555555555555, 0.583333333333333, 0.583333333333333, 0.75, 1.13888888888889, 1.13888888888889, 0.722222222222222, 0.75, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.611111111111111, 0.611111111111111, 1, 0.611111111111111, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.611111111111111, 0.555555555555556, 0.583333333333333, 0.611111111111111, 0.583333333333333, 0.611111111111111, 0.583333333333333, 0.583333333333333, 0.611111111111111, 0.75, 0.25, 0.583333333333333, 0.611111111111111, 0.75, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.722222222222222, 0.972222222222222, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.972222222222222, 0.611111111111111, 0.611111111111111, 0.722222222222222, 0.583333333333333, 0.611111111111111, 0.583333333333333, 0.611111111111111, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.555555555555556, 0.583333333333333, 0.722222222222222, 0.611111111111111, 0.555555555555556, 0.583333333333333, 0.583333333333333, 0.333333333333333, 0.583333333333333, 0.583333333333333, 0.611111111111111, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.611111111111111, 0.555555555555556, 0.583333333333333, 0.333333333333333, 0.583333333333333, 0.555555555555556, 0.583333333333333, 0.583333333333333, 0.722222222222222, 1.77777777777778, 2.22222222222222, 2.38888888888889, 2.77777777777778, 1.08333333333333, 2.36111111111111, 1.5, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.25, 2.25, 2.63888888888889, 2.25, 2.19444444444444, 2.22222222222222, 2.19444444444444, 2.25, 2.22222222222222, 2.11111111111111, 2.25, 2.22222222222222, 2.25, 2.22222222222222, 2.22222222222222, 2.25, 2.38888888888889, 2.36111111111111, 2.11111111111111, 2.25, 2.38888888888889, 2.22222222222222, 2.22222222222222, 2.22222222222222, 1.63888888888889, 1.47222222222222, 2.19444444444444, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.61111111111111, 2.25, 1.77777777777778, 2.36111111111111, 2.22222222222222, 2.25, 2.22222222222222, 2.25, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 1.97222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.36111111111111, 1.77777777777778, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.25, 2.22222222222222, 2.22222222222222, 2.25, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.25, 2.22222222222222, 1.77777777777778, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.36111111111111, 0, 0.166666666666667, 0.555555555555556, 0.555555555555556, 0.138888888888889, 0.166666666666667, 0, 0, 0, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.0277777777777778, 0.138888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.166666666666667, 0.555555555555556, 0.555555555555556, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.722222222222222, 0.722222222222222, 0.305555555555556, 0.333333333333333, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.194444444444444, 0.583333333333333, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.0555555555555556, 0.138888888888889, 0.166666666666667, 0.194444444444444, 0.333333333333333, 0.305555555555556, 0.166666666666667, 0.194444444444444, 0.333333333333333, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.305555555555556, 0.555555555555556, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.0555555555555556, 0.166666666666667, 0.166666666666667, 0.555555555555556, 0.194444444444444, 0.194444444444444, 0.305555555555556, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.305555555555556, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.305555555555556, 1.11111111111111, 0.694444444444444, 0.722222222222222, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.305555555555556, 0.972222222222222, 0.583333333333333, 0.555555555555556, 0.527777777777778, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.722222222222222, 0.694444444444444, 0.555555555555556, 0.583333333333333, 0.138888888888889, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.694444444444444, 0.944444444444444, 0.555555555555556, 0.555555555555556, 0.305555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.944444444444445, 0.583333333333333, 0.583333333333333, 0.694444444444444, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.694444444444444, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.527777777777778, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.444444444444444, 0.555555555555556, 0.694444444444444, 0.694444444444444, 0.138888888888889, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.583333333333333, 0.972222222222222, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.527777777777778, 0.583333333333333, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.722222222222222, 0.694444444444444, 0.527777777777778, 0.583333333333333, 0.722222222222222, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.694444444444444, 0.944444444444444, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.944444444444444, 0.583333333333333, 0.305555555555556, 0.694444444444444, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.444444444444444, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.694444444444444, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.305555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.694444444444444, 0.305555555555556, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.166666666666667, 0.555555555555556, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.305555555555556, 0.277777777777778, 0.138888888888889, 0.166666666666667, 0.305555555555556, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.527777777777778, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.527777777777778, 0.166666666666667, 0.166666666666667, 0.277777777777778, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.0277777777777778, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.194444444444444, 0.583333333333333, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.333333333333333, 0.305555555555556, 0.166666666666667, 0.194444444444444, 0.333333333333333, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.305555555555556, 0.555555555555556, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.555555555555556, 0.194444444444444, 0.0555555555555556, 0.305555555555556, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.305555555555556, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.0555555555555556, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.305555555555556, 0, 0, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0555555555555556, 0.444444444444444, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.416666666666667, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0555555555555556, 0.0555555555555556, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.444444444444444, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.416666666666667, 0.0277777777777778, 0.0277777777777778, 0, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0555555555555556, 0.0555555555555556, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.444444444444444, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.444444444444444, 0.416666666666667, 0.416666666666667, 0.444444444444444, 0.416666666666667, 0.444444444444444, 0.416666666666667, 0.388888888888889, 0.444444444444444, 0.583333333333333, 0.555555555555556, 0.416666666666667, 0.444444444444444, 0.583333333333333, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.555555555555556, 0.805555555555556, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.805555555555556, 0.444444444444444, 0.444444444444444, 0.0833333333333333, 0.416666666666667, 0.444444444444444, 0.416666666666667, 0.444444444444444, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.555555555555556, 0.444444444444444, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.444444444444444, 0.416666666666667, 0.416666666666667, 0.166666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.166666666666667, 0.444444444444444, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.416666666666667, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0555555555555556, 0.0555555555555556, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.416666666666667, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0555555555555556, 0.0555555555555556, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.416666666666667, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0555555555555556, 0.0555555555555556, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.416666666666667, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0555555555555556, 0.0555555555555556, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.194444444444444, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.0277777777777778, 0.0277777777777778, 0, 0.166666666666667, 0.416666666666667, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0555555555555556, 0.0555555555555556, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.305555555555556, 0.166666666666667, 0.194444444444444, 0.333333333333333, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.305555555555556, 0.555555555555556, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.555555555555556, 0.0555555555555556, 0.194444444444444, 0.305555555555556, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.0555555555555556, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.305555555555556, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.305555555555556, 0.138888888888889, 0.166666666666667, 0.305555555555556, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.527777777777778, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.527777777777778, 0.166666666666667, 0.166666666666667, 0.277777777777778, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.0277777777777778, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.0277777777777778, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.194444444444444, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.416666666666667, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0555555555555556, 0.0555555555555556, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.305555555555556, 0.555555555555556, 0.166666666666667, 0.166666666666667, 0.0555555555555556, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.555555555555556, 0.194444444444444, 0.194444444444444, 0.305555555555556, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.305555555555556, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.305555555555556, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0555555555555556, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.527777777777778, 0.166666666666667, 0.166666666666667, 0.277777777777778, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.0277777777777778, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.777777777777778, 0.416666666666667, 0.416666666666667, 0.527777777777778, 0.388888888888889, 0.416666666666667, 0.388888888888889, 0.416666666666667, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.527777777777778, 0.138888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.416666666666667, 0.388888888888889, 0.388888888888889, 0.416666666666667, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.416666666666667, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.527777777777778, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.416666666666667, 0.416666666666667, 0.527777777777778, 0.388888888888889, 0.138888888888889, 0.388888888888889, 0.416666666666667, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.527777777777778, 0.416666666666667, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.416666666666667, 0.388888888888889, 0.388888888888889, 0.416666666666667, 0.388888888888889, 0.138888888888889, 0.388888888888889, 0.388888888888889, 0.416666666666667, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.0555555555555556, 0.0555555555555556, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.0277777777777778, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0.0277777777777778, 0, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0277777777777778, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0.138888888888889, 0, 0, 0.138888888888889, 0, 0.138888888888889, 0.138888888888889))
     5: `[<-`(`*tmp*`, ids[, 1:2], value = c(15.1666666666667, 9.08333333333333, 4.38888888888889, 4.91666666666667, 4.91666666666667, 3.80555555555556, 4.52777777777778, 4.11111111111111, 4.52777777777778, 7.38888888888889, 4.97222222222222, 6.61111111111111, 4.38888888888889, 4.38888888888889, 4.55555555555556, 3.25, 4.94444444444444, 4.52777777777778, 4.55555555555555, 4.38888888888889, 4.27777777777778, 4.38888888888889, 4.41666666666667, 3.94444444444445, 3.55555555555556, 4.41666666666667, 4.38888888888889, 4.27777777777778, 4.38888888888889, 4.41666666666667, 4.38888888888889, 4.38888888888889, 4.27777777777778, 4.38888888888889, 4.41666666666667, 4.38888888888889, 4.27777777777778, 4.41666666666667, 3.97222222222222, 4.52777777777778, 4.38888888888889, 4.13888888888889, 3.66666666666667, 4.38888888888889, 4.38888888888889, 4.38888888888889, 4.52777777777778, 4.77777777777778, 4.38888888888889, 4.36111111111111, 3.94444444444444, 4.38888888888889, 4.27777777777778, 4.27777777777778, 4.77777777777778, 4.13888888888889, 4.41666666666667, 3.80555555555556, 4.38888888888889, 4.41666666666667, 4.38888888888889, 4.13888888888889, 4.27777777777778, 4.38888888888889, 4.13888888888889, 4.27777777777778, 4.27777777777778, 4.38888888888889, 4.27777777777778, 4.13888888888889, 4.38888888888889, 4.38888888888889, 4.38888888888889, 4.13888888888889, 4.38888888888889, 4.38888888888889, 4.38888888888889, 4.05555555555556, 4.41666666666667, 4.38888888888889, 4.38888888888889, 4.38888888888889, 4.41666666666667, 4.38888888888889, 4.27777777777778, 3.94444444444444, 4.38888888888889, 4.38888888888889, 4.38888888888889, 3.94444444444444, 4.41666666666667, 4.38888888888889, 4.38888888888889, 4.38888888888889, 4.38888888888889, 4.38888888888889, 4.13888888888889, 4.27777777777778, 4.52777777777778, 3.22222222222222, 10.75, 9.72222222222223, 9.72222222222222, 11, 10.1944444444444, 10.8611111111111, 10.1944444444444, 13.7777777777778, 11.3611111111111, 5.11111111111111, 9.77777777777778, 10.3333333333333, 10.9444444444444, 11.3333333333333, 8.30555555555556, 10.1944444444444, 9.27777777777778, 10.75, 10.7777777777778, 10.75, 10.3333333333333, 10.8055555555556, 11.1944444444444, 10.3333333333333, 10.5277777777778, 10.7777777777778, 10.5277777777778, 10.5277777777778, 10.7777777777778, 10.3333333333333, 10.8055555555556, 10.7777777777778, 10.8055555555556, 10.7777777777778, 10.7777777777778, 10.5277777777778, 10.9444444444444, 10.9166666666667, 10.3333333333333, 10.8055555555556, 10.9444444444444, 10.75, 10.75, 10.5277777777778, 9.52777777777778, 9.13888888888889, 10.5277777777778, 10.7777777777778, 10.7777777777778, 10.7777777777778, 10.7777777777778, 10.7777777777778, 11.1666666666667, 10.8055555555556, 9.77777777777778, 10.9166666666667, 10.75, 10.8055555555556, 10.5277777777778, 10.8055555555556, 10.7777777777778, 10.7777777777778, 10.7777777777778, 10.7777777777778, 10.7777777777778, 10.0833333333333, 10.7777777777778, 10.7777777777778, 10.7777777777778, 10.7777777777778, 10.3333333333333, 10.7777777777778, 10.75, 10.7777777777778, 10.7777777777778, 10.9166666666667, 9.77777777777778, 10.7777777777778, 10.75, 10.3333333333333, 10.8055555555556, 10.75, 10.7777777777778, 10.8055555555556, 10.75, 10.7777777777778, 10.75, 10.7777777777778, 10.3333333333333, 10.7777777777778, 9.77777777777778, 10.7777777777778, 10.75, 10.7777777777778, 10.7777777777778, 10.7777777777778, 10.9166666666667, 4.69444444444444, 5.22222222222222, 5.22222222222222, 4.91666666666667, 4.83333333333333, 4.77777777777778, 4.83333333333333, 7.69444444444444, 5.27777777777778, 0.777777777777778, 4, 4.44444444444444, 4.86111111111111, 5.25, 2.91666666666667, 4.36111111111111, 3.61111111111111, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.72222222222222, 4.72222222222222, 5.11111111111111, 4.72222222222222, 4.58333333333333, 4.69444444444444, 4.58333333333333, 4.72222222222222, 4.69444444444444, 4.44444444444444, 4.72222222222222, 4.69444444444444, 4.72222222222222, 4.69444444444444, 4.69444444444444, 4.72222222222222, 4.86111111111111, 4.83333333333333, 4.44444444444444, 4.72222222222222, 4.86111111111111, 4.69444444444444, 4.69444444444444, 4.69444444444444, 3.80555555555556, 3.52777777777778, 4.58333333333333, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 5.08333333333333, 4.72222222222222, 4, 4.83333333333333, 4.69444444444444, 4.72222222222222, 4.69444444444444, 4.72222222222222, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.25, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.83333333333333, 4, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.72222222222222, 4.69444444444444, 4.69444444444444, 4.72222222222222, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.44444444444445, 4.69444444444444, 4, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.69444444444444, 4.83333333333333, 0.527777777777778, 0.527777777777778, 0.222222222222222, 0.138888888888889, 0.0833333333333333, 0.138888888888889, 3, 0.583333333333333, 2.22222222222222, 0, 0, 0.166666666666667, 0.555555555555556, 0.555555555555556, 0.138888888888889, 0.166666666666667, 0, 0, 0, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 1.05555555555556, 0.75, 0.194444444444444, 0.611111111111111, 0.666666666666667, 3.52777777777778, 1.11111111111111, 2.75, 0.527777777777778, 0.527777777777778, 0.694444444444444, 1.08333333333333, 1.08333333333333, 0.666666666666667, 0.694444444444444, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.555555555555556, 0.555555555555556, 0.944444444444444, 0.277777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.416666666666667, 0.694444444444444, 0.666666666666667, 0.527777777777778, 0.555555555555556, 0.694444444444444, 0.527777777777778, 0.527777777777778, 0.416666666666667, 0.666666666666667, 0.916666666666667, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.916666666666667, 0.555555555555556, 0.555555555555556, 0.666666666666667, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.666666666666667, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.277777777777778, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.666666666666667, 0.75, 0.666666666666667, 0.611111111111111, 0.194444444444444, 3.52777777777778, 1.11111111111111, 2.75, 0.527777777777778, 0.527777777777778, 0.694444444444444, 1.08333333333333, 1.08333333333333, 0.666666666666667, 0.694444444444444, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.277777777777778, 0.555555555555556, 0.944444444444444, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.416666666666667, 0.527777777777778, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.555555555555556, 0.694444444444444, 0.666666666666667, 0.527777777777778, 0.555555555555556, 0.694444444444445, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.666666666666667, 0.916666666666667, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.916666666666667, 0.555555555555556, 0.555555555555556, 0.666666666666667, 0.527777777777778, 0.555555555555556, 0.416666666666667, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.277777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.666666666666667, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.555555555555556, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.527777777777778, 0.666666666666667, 0.361111111111111, 0.305555555555556, 0.361111111111111, 3.22222222222222, 0.805555555555556, 2.44444444444444, 0.222222222222222, 0.222222222222222, 0.388888888888889, 0.777777777777778, 0.777777777777778, 0.361111111111111, 0.388888888888889, 0.222222222222222, 0.194444444444444, 0.222222222222222, 0.25, 0.25, 0.638888888888889, 0.25, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.25, 0.222222222222222, 0.222222222222222, 0.25, 0.222222222222222, 0.25, 0.222222222222222, 0.222222222222222, 0.25, 0.388888888888889, 0.361111111111111, 0.222222222222222, 0.111111111111111, 0.388888888888889, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.361111111111111, 0.611111111111111, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.611111111111111, 0.25, 0.25, 0.361111111111111, 0.222222222222222, 0.25, 0.222222222222222, 0.25, 0.194444444444444, 0.222222222222222, 0.222222222222222, 0.194444444444444, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.111111111111111, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.361111111111111, 0.25, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.25, 0.222222222222222, 0.222222222222222, 0.25, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.25, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.222222222222222, 0.361111111111111, 0.222222222222222, 0.277777777777778, 3.13888888888889, 0.722222222222222, 2.36111111111111, 0.138888888888889, 0.138888888888889, 0.305555555555556, 0.694444444444444, 0.694444444444444, 0.277777777777778, 0.305555555555556, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.166666666666667, 0.555555555555556, 0.0277777777777778, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.305555555555556, 0.277777777777778, 0.138888888888889, 0.166666666666667, 0.305555555555556, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.527777777777778, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.527777777777778, 0.166666666666667, 0.166666666666667, 0.277777777777778, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.222222222222222, 3.08333333333333, 0.666666666666667, 2.30555555555556, 0.0833333333333333, 0.0833333333333333, 0.25, 0.638888888888889, 0.638888888888889, 0.222222222222222, 0.25, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.111111111111111, 0.111111111111111, 0.5, 0.111111111111111, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.111111111111111, 0.0833333333333333, 0.0833333333333333, 0.111111111111111, 0.0833333333333333, 0.111111111111111, 0.0833333333333333, 0.0833333333333333, 0.111111111111111, 0.25, 0.222222222222222, 0.0833333333333333, 0.111111111111111, 0.25, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.222222222222222, 0.472222222222222, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0555555555555556, 0.472222222222222, 0.111111111111111, 0.111111111111111, 0.222222222222222, 0.0833333333333333, 0.111111111111111, 0.0833333333333333, 0.111111111111111, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0555555555555556, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.222222222222222, 0.111111111111111, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.111111111111111, 0.0833333333333333, 0.0833333333333333, 0.111111111111111, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.111111111111111, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0833333333333333, 0.0555555555555556, 0.222222222222222, 3.13888888888889, 0.722222222222222, 2.36111111111111, 0.138888888888889, 0.138888888888889, 0.305555555555556, 0.694444444444444, 0.694444444444444, 0.277777777777778, 0.305555555555556, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.0277777777777778, 0.166666666666667, 0.555555555555556, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.305555555555556, 0.277777777777778, 0.138888888888889, 0.166666666666667, 0.305555555555556, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.527777777777778, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.527777777777778, 0.166666666666667, 0.166666666666667, 0.277777777777778, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.0277777777777778, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 1.66666666666667, 5.22222222222222, 3, 3, 2.58333333333333, 3.55555555555556, 3.55555555555556, 3.13888888888889, 3.16666666666667, 3, 3, 3, 3.02777777777778, 3.02777777777778, 3.41666666666667, 3.02777777777778, 3, 3, 3, 3.02777777777778, 2.88888888888889, 3, 3.02777777777778, 2.97222222222222, 2.75, 2.88888888888889, 3, 3.02777777777778, 3.16666666666667, 2.41666666666667, 3, 3.02777777777778, 3.16666666666667, 3, 3, 3, 3.13888888888889, 3.38888888888889, 3, 3, 3, 2.75, 3, 3, 2.25, 3.02777777777778, 3.02777777777778, 3.13888888888889, 3, 2.55555555555556, 3, 3.02777777777778, 3, 3, 3, 3, 3, 3, 3, 3, 2.88888888888889, 2.88888888888889, 3, 3, 3, 2.88888888888889, 2.97222222222222, 3.13888888888889, 3.02777777777778, 2.88888888888889, 3, 3, 2.55555555555556, 3, 3, 3.02777777777778, 3, 2.55555555555556, 3, 3, 3.02777777777778, 2.88888888888889, 3, 2.55555555555556, 3, 2.88888888888889, 3, 3, 2.41666666666667, 2.80555555555555, 0.583333333333333, 0.583333333333333, 0.75, 1.13888888888889, 1.13888888888889, 0.722222222222222, 0.75, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.611111111111111, 0.611111111111111, 1, 0.611111111111111, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.611111111111111, 0.555555555555556, 0.583333333333333, 0.611111111111111, 0.583333333333333, 0.611111111111111, 0.583333333333333, 0.583333333333333, 0.611111111111111, 0.75, 0.25, 0.583333333333333, 0.611111111111111, 0.75, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.722222222222222, 0.972222222222222, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.972222222222222, 0.611111111111111, 0.611111111111111, 0.722222222222222, 0.583333333333333, 0.611111111111111, 0.583333333333333, 0.611111111111111, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.555555555555556, 0.583333333333333, 0.722222222222222, 0.611111111111111, 0.555555555555556, 0.583333333333333, 0.583333333333333, 0.333333333333333, 0.583333333333333, 0.583333333333333, 0.611111111111111, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.583333333333333, 0.611111111111111, 0.555555555555556, 0.583333333333333, 0.333333333333333, 0.583333333333333, 0.555555555555556, 0.583333333333333, 0.583333333333333, 0.722222222222222, 1.77777777777778, 2.22222222222222, 2.38888888888889, 2.77777777777778, 1.08333333333333, 2.36111111111111, 1.5, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.25, 2.25, 2.63888888888889, 2.25, 2.19444444444444, 2.22222222222222, 2.19444444444444, 2.25, 2.22222222222222, 2.11111111111111, 2.25, 2.22222222222222, 2.25, 2.22222222222222, 2.22222222222222, 2.25, 2.38888888888889, 2.36111111111111, 2.11111111111111, 2.25, 2.38888888888889, 2.22222222222222, 2.22222222222222, 2.22222222222222, 1.63888888888889, 1.47222222222222, 2.19444444444444, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.61111111111111, 2.25, 1.77777777777778, 2.36111111111111, 2.22222222222222, 2.25, 2.22222222222222, 2.25, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 1.97222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.36111111111111, 1.77777777777778, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.25, 2.22222222222222, 2.22222222222222, 2.25, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.25, 2.22222222222222, 1.77777777777778, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.22222222222222, 2.36111111111111, 0, 0.166666666666667, 0.555555555555556, 0.555555555555556, 0.138888888888889, 0.166666666666667, 0, 0, 0, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.0277777777777778, 0.138888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.166666666666667, 0.555555555555556, 0.555555555555556, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.722222222222222, 0.722222222222222, 0.305555555555556, 0.333333333333333, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.194444444444444, 0.583333333333333, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.0555555555555556, 0.138888888888889, 0.166666666666667, 0.194444444444444, 0.333333333333333, 0.305555555555556, 0.166666666666667, 0.194444444444444, 0.333333333333333, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.305555555555556, 0.555555555555556, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.0555555555555556, 0.166666666666667, 0.166666666666667, 0.555555555555556, 0.194444444444444, 0.194444444444444, 0.305555555555556, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.305555555555556, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.305555555555556, 1.11111111111111, 0.694444444444444, 0.722222222222222, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.305555555555556, 0.972222222222222, 0.583333333333333, 0.555555555555556, 0.527777777777778, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.722222222222222, 0.694444444444444, 0.555555555555556, 0.583333333333333, 0.138888888888889, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.694444444444444, 0.944444444444444, 0.555555555555556, 0.555555555555556, 0.305555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.944444444444445, 0.583333333333333, 0.583333333333333, 0.694444444444444, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.694444444444444, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.527777777777778, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.444444444444444, 0.555555555555556, 0.694444444444444, 0.694444444444444, 0.138888888888889, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.583333333333333, 0.972222222222222, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.527777777777778, 0.583333333333333, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.722222222222222, 0.694444444444444, 0.527777777777778, 0.583333333333333, 0.722222222222222, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.694444444444444, 0.944444444444444, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.944444444444444, 0.583333333333333, 0.305555555555556, 0.694444444444444, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.444444444444444, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.694444444444444, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.583333333333333, 0.555555555555556, 0.305555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.555555555555556, 0.694444444444444, 0.305555555555556, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.166666666666667, 0.555555555555556, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.305555555555556, 0.277777777777778, 0.138888888888889, 0.166666666666667, 0.305555555555556, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.527777777777778, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.527777777777778, 0.166666666666667, 0.166666666666667, 0.277777777777778, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.0277777777777778, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.194444444444444, 0.583333333333333, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.333333333333333, 0.305555555555556, 0.166666666666667, 0.194444444444444, 0.333333333333333, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.305555555555556, 0.555555555555556, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.555555555555556, 0.194444444444444, 0.0555555555555556, 0.305555555555556, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.305555555555556, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.0555555555555556, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.305555555555556, 0, 0, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0555555555555556, 0.444444444444444, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.416666666666667, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0555555555555556, 0.0555555555555556, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.444444444444444, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.416666666666667, 0.0277777777777778, 0.0277777777777778, 0, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0555555555555556, 0.0555555555555556, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.444444444444444, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.444444444444444, 0.416666666666667, 0.416666666666667, 0.444444444444444, 0.416666666666667, 0.444444444444444, 0.416666666666667, 0.388888888888889, 0.444444444444444, 0.583333333333333, 0.555555555555556, 0.416666666666667, 0.444444444444444, 0.583333333333333, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.555555555555556, 0.805555555555556, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.805555555555556, 0.444444444444444, 0.444444444444444, 0.0833333333333333, 0.416666666666667, 0.444444444444444, 0.416666666666667, 0.444444444444444, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.555555555555556, 0.444444444444444, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.444444444444444, 0.416666666666667, 0.416666666666667, 0.166666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.166666666666667, 0.444444444444444, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.416666666666667, 0.555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.416666666666667, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0555555555555556, 0.0555555555555556, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.416666666666667, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0555555555555556, 0.0555555555555556, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.416666666666667, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0555555555555556, 0.0555555555555556, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0277777777777778, 0, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.416666666666667, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0555555555555556, 0.0555555555555556, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.194444444444444, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.194444444444444, 0.0277777777777778, 0.0277777777777778, 0, 0.166666666666667, 0.416666666666667, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0555555555555556, 0.0555555555555556, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.305555555555556, 0.166666666666667, 0.194444444444444, 0.333333333333333, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.305555555555556, 0.555555555555556, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.555555555555556, 0.0555555555555556, 0.194444444444444, 0.305555555555556, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.0555555555555556, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.305555555555556, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.305555555555556, 0.138888888888889, 0.166666666666667, 0.305555555555556, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.527777777777778, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.527777777777778, 0.166666666666667, 0.166666666666667, 0.277777777777778, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.0277777777777778, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.0277777777777778, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.194444444444444, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.416666666666667, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.416666666666667, 0.0555555555555556, 0.0555555555555556, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.305555555555556, 0.555555555555556, 0.166666666666667, 0.166666666666667, 0.0555555555555556, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.555555555555556, 0.194444444444444, 0.194444444444444, 0.305555555555556, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.305555555555556, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.194444444444444, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.305555555555556, 0, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.138888888888889, 0.388888888888889, 0, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0555555555555556, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.527777777777778, 0.166666666666667, 0.166666666666667, 0.277777777777778, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.0277777777777778, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.777777777777778, 0.416666666666667, 0.416666666666667, 0.527777777777778, 0.388888888888889, 0.416666666666667, 0.388888888888889, 0.416666666666667, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.527777777777778, 0.138888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.416666666666667, 0.388888888888889, 0.388888888888889, 0.416666666666667, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.416666666666667, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.527777777777778, 0, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.388888888888889, 0.0277777777777778, 0.0277777777777778, 0.138888888888889, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.416666666666667, 0.416666666666667, 0.527777777777778, 0.388888888888889, 0.138888888888889, 0.388888888888889, 0.416666666666667, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.527777777777778, 0.416666666666667, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.416666666666667, 0.388888888888889, 0.388888888888889, 0.416666666666667, 0.388888888888889, 0.138888888888889, 0.388888888888889, 0.388888888888889, 0.416666666666667, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.388888888888889, 0.0555555555555556, 0.0555555555555556, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.166666666666667, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.0277777777777778, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.0277777777777778, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0.0277777777777778, 0, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0277777777777778, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.166666666666667, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.138888888888889, 0.277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0, 0.0555555555555556, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.0277777777777778, 0, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.0277777777777778, 0.166666666666667, 0, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0, 0.138888888888889, 0, 0, 0, 0.138888888888889, 0, 0, 0.138888888888889, 0, 0.138888888888889, 0.138888888888889))
     6: euclidean_distance(gdist)
     7: struct_equiv_new(geod, v)
     8: struct_equiv.dgCMatrix(methods::as(graph[[i]], "dgCMatrix"),     v, inf.replace, groupvar, ...)
     9: struct_equiv.list(graph$graph, v, inf.replace, groupvar, ...)
    10: struct_equiv(graph)
    11: lapply(struct_equiv(graph), "[[", "SE")
    An irrecoverable exception occurred. R is aborting now ...
    Bus error (core dumped)
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 21.8Mb
      sub-directories of 1Mb or more:
        data   1.1Mb
        doc    2.5Mb
        libs  16.9Mb
    ```

# netseg

<details>

* Version: 1.0-2
* GitHub: https://github.com/mbojan/netseg
* Source code: https://github.com/cran/netseg
* Date/Publication: 2023-07-01 07:40:02 UTC
* Number of recursive dependencies: 63

Run `revdepcheck::cloud_details(, "netseg")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(netseg)
      > 
      > test_check("netseg")
      [ FAIL 3 | WARN 17 | SKIP 0 | PASS 48 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
      Error in `make_graph(edges = edges, n = n, isolates = isolates, directed = directed, 
          dir = dir, simplify = simplify, ...)`: 'simplify' should only be used for graph literals
      Backtrace:
          ▆
       1. └─igraph::graph(c(1, 2, 1, 3, 2, 4, 3, 4, 3, 1, 4, 2), directed = TRUE) at test-orwg.R:12:11
       2.   └─igraph::make_graph(...)
      
      [ FAIL 3 | WARN 17 | SKIP 0 | PASS 48 ]
      Error: Test failures
      Execution halted
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

# pcSteiner

<details>

* Version: 1.0.0.1
* GitHub: https://github.com/krashkov/pcSteiner
* Source code: https://github.com/cran/pcSteiner
* Date/Publication: 2022-05-23 08:02:24 UTC
* Number of recursive dependencies: 36

Run `revdepcheck::cloud_details(, "pcSteiner")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘pcSteiner-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: pcs.tree
    > ### Title: Solve the Prize-Collecting Steiner Tree problem
    > ### Aliases: pcs.tree
    > 
    > ### ** Examples
    > 
    > g <- graph('Bull')
    Warning: `graph()` was deprecated in igraph 1.6.0.
    ℹ Please use `make_graph()` instead.
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: graph -> make_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘tutorial.Rmd’ using rmarkdown
    
    Quitting from lines 643-652 [unnamed-chunk-1] (tutorial.Rmd)
    Error: processing vignette 'tutorial.Rmd' failed with diagnostics:
    'simplify' should only be used for graph literals
    --- failed re-building ‘tutorial.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘tutorial.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## Newly fixed

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘tutorial.Rmd’ using rmarkdown
    tlmgr: package repository https://mirrors.rit.edu/CTAN/systems/texlive/tlnet (verified)
    [1/1, ??:??/??:??] install: grffile [4k]
    running mktexlsr ...
    done running mktexlsr.
    tlmgr: package log updated: /opt/TinyTeX/texmf-var/web2c/tlmgr.log
    tlmgr: command log updated: /opt/TinyTeX/texmf-var/web2c/tlmgr-commands.log
    tlmgr: package repository https://mirror.math.princeton.edu/pub/CTAN/systems/texlive/tlnet (verified)
    [1/1, ??:??/??:??] install: algorithm2e [33k]
    ...
    
    Error: processing vignette 'tutorial.Rmd' failed with diagnostics:
    LaTeX failed to compile /tmp/workdir/pcSteiner/old/pcSteiner.Rcheck/vign_test/pcSteiner/vignettes/tutorial.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See tutorial.log for more info.
    --- failed re-building ‘tutorial.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘tutorial.Rmd’
    
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
    
    > ### Name: addConfidences
    > ### Title: Compare splits and add support values to an object
    > ### Aliases: addConfidences addConfidences.phylo presenceAbsence
    > ###   createLabel
    > ### Keywords: cluster
    > 
    > ### ** Examples
    ...
    +              "extdata/trees/RAxML_bootstrap.woodmouse", package="phangorn"))
    > boot_trees <- read.tree(tmpfile)
    > 
    > dm <- dist.ml(woodmouse)
    > tree <- upgma(dm)
    > nnet <- neighborNet(dm)
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: neighborNet ... as.networx.splits -> circNetwork -> graph -> make_graph
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
    
    Quitting from lines 76-101 [unnamed-chunk-3] (IntertwiningTreesAndNetworks.Rmd)
    ...
    Error: processing vignette 'Trees.Rmd' failed with diagnostics:
    'simplify' should only be used for graph literals
    --- failed re-building ‘Trees.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘IntertwiningTreesAndNetworks.Rmd’ ‘MLbyHand.Rmd’ ‘Networx.Rmd’
      ‘Trees.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking C++ specification ... NOTE
    ```
      Specified C++11: please drop specification unless essential
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 10.0Mb
      sub-directories of 1Mb or more:
        doc    1.5Mb
        libs   5.8Mb
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

# phyloTop

<details>

* Version: 2.1.2
* GitHub: https://github.com/MichelleKendall/phyloTop
* Source code: https://github.com/cran/phyloTop
* Date/Publication: 2023-01-24 15:20:02 UTC
* Number of recursive dependencies: 94

Run `revdepcheck::cloud_details(, "phyloTop")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘phyloTop-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: getLabGenealogy
    > ### Title: Create genealogy
    > ### Aliases: getLabGenealogy
    > 
    > ### ** Examples
    > 
    > ## Generate an epidemiological record:
    > myepirecord <- makeEpiRecord(c(1,2,3,4))
    > ## make the corresponding genealogy from this record:
    > mygenealogy <- getLabGenealogy(myepirecord)
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: getLabGenealogy -> makePhyloTree -> graph -> make_graph
    Execution halted
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
    
    > ### Name: as_igraph
    > ### Title: Convert plexi graph data to igraph
    > ### Aliases: as_igraph
    > 
    > ### ** Examples
    > 
    > data = example_data()
    > graph = as_igraph(plexi.graph = data[["plexi_graph_example"]])
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: as_igraph -> <Anonymous> -> make_graph
    Execution halted
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

*   checking examples ... ERROR
    ```
    Running examples in ‘rgraph6-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: choose_format
    > ### Title: Choose most efficient format heuristically
    > ### Aliases: choose_format choose_format.default choose_format.list
    > 
    > ### ** Examples
    > 
    > # From igraph ------------------------------------------------------
    ...
    +       igraph::sample_gnp(n = 15, p = 0.15, directed = TRUE))
    +       
    +    choose_format(glist)
    + }
    Warning: `graph.famous()` was deprecated in igraph 1.6.0.
    ℹ Please use `make_graph()` instead.
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: <Anonymous> -> make_graph
    Execution halted
    ```

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

# rhcoclust

<details>

* Version: 2.0.0
* GitHub: NA
* Source code: https://github.com/cran/rhcoclust
* Date/Publication: 2023-01-29 03:40:02 UTC
* Number of recursive dependencies: 16

Run `revdepcheck::cloud_details(, "rhcoclust")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rhcoclust-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: rhcoclust_internet
    > ### Title: Interaction network (internet) of the 'rhcoclust' objects
    > ### Aliases: rhcoclust_internet
    > 
    > ### ** Examples
    > 
    > # Load necessary library
    ...
    > # Plot interaction network (internet)
    > # Please use dev.off() to avoid the figure margin from previous plot
    > # mar order: bottom, left, top, and right
    > # please use par(mar=c(5,2,5,2)) or modify when necessary to best fit for the plot
    > Netrhcoclust <- rhcoclust_internet(data, CoClustObj = CoClustObj,
    + CoClust.sig = FALSE, cex.nodes = 0.7, edge.width = 1)
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: rhcoclust_internet -> graph -> make_graph
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

# RScelestial

<details>

* Version: 1.0.3
* GitHub: NA
* Source code: https://github.com/cran/RScelestial
* Date/Publication: 2021-12-09 22:20:02 UTC
* Number of recursive dependencies: 45

Run `revdepcheck::cloud_details(, "RScelestial")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘RScelestial-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: scelestial
    > ### Title: Infer the single-cell phylogenetic tree
    > ### Aliases: scelestial
    > 
    > ### ** Examples
    > 
    > ## simulates tumor evolution
    > S = synthesis(10, 10, 2, seed=7)
    > ## convert to 10-state matrix
    > seq = as.ten.state.matrix(S$seqeunce)
    > ## runs the scelestial to generate 4-restricted Steiner trees. It represents the tree and graph
    > SP = scelestial(seq, mink=3, maxk=4, return.graph = TRUE)
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: scelestial -> <Anonymous> -> make_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘RScelestial-vignette.Rmd’ using rmarkdown
    
    Quitting from lines 45-48 [unnamed-chunk-4] (RScelestial-vignette.Rmd)
    Error: processing vignette 'RScelestial-vignette.Rmd' failed with diagnostics:
    'simplify' should only be used for graph literals
    --- failed re-building ‘RScelestial-vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘RScelestial-vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking C++ specification ... NOTE
    ```
      Specified C++11: please drop specification unless essential
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        libs   4.9Mb
    ```

# satdad

<details>

* Version: 1.1
* GitHub: NA
* Source code: https://github.com/cran/satdad
* Date/Publication: 2023-03-29 15:00:02 UTC
* Number of recursive dependencies: 90

Run `revdepcheck::cloud_details(, "satdad")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘satdad-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: Stock
    > ### Title: Dataset. Yearly maxima of Log Returns of ten stock indices
    > ###   1990-2015.
    > ### Aliases: Stock
    > ### Keywords: datasets
    > 
    > ### ** Examples
    ...
    > 
    > data(Stock)
    > 
    > ## We reproduce below Figure 7(a) of Mercadier and Roustant (2019).
    > 
    > graphsEmp(Stock, k = 26, which = "taildependograph", names = colnames(Stock))
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: graphsEmp -> <Anonymous> -> make_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘satdad.Rmd’ using rmarkdown
    
    Quitting from lines 234-238 [unnamed-chunk-11] (satdad.Rmd)
    Error: processing vignette 'satdad.Rmd' failed with diagnostics:
    'simplify' should only be used for graph literals
    --- failed re-building ‘satdad.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘satdad.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 11.0Mb
      sub-directories of 1Mb or more:
        doc    3.9Mb
        libs   6.7Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘evd’
    ```

# ShapePattern

<details>

* Version: 3.0.1
* GitHub: NA
* Source code: https://github.com/cran/ShapePattern
* Date/Publication: 2023-08-22 07:20:09 UTC
* Number of recursive dependencies: 36

Run `revdepcheck::cloud_details(, "ShapePattern")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ShapePattern-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: porosity
    > ### Title: Compute the porosity of raster zones (patches)
    > ### Aliases: porosity
    > ### Keywords: manip
    > 
    > ### ** Examples
    > 
    > porosity(IN=data$rst, PLOT=TRUE, NEIGH=4)
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: porosity ... components -> ensure_igraph -> <Anonymous> -> make_graph
    Execution halted
    ```

# shazam

<details>

* Version: 1.2.0
* GitHub: NA
* Source code: https://github.com/cran/shazam
* Date/Publication: 2023-10-02 18:50:02 UTC
* Number of recursive dependencies: 128

Run `revdepcheck::cloud_details(, "shazam")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Baseline-Vignette.Rmd’ using rmarkdown
    --- finished re-building ‘Baseline-Vignette.Rmd’
    
    --- re-building ‘DistToNearest-Vignette.Rmd’ using rmarkdown
    
    Quitting from lines 368-390 [subsample] (DistToNearest-Vignette.Rmd)
    Error: processing vignette 'DistToNearest-Vignette.Rmd' failed with diagnostics:
    'k1' must be less than or equal to 'k2'
    ...
    --- finished re-building ‘Shmulate-Vignette.Rmd’
    
    --- re-building ‘Targeting-Vignette.Rmd’ using rmarkdown
    --- finished re-building ‘Targeting-Vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘DistToNearest-Vignette.Rmd’
    
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
    
    > ### Name: generate_st_samples
    > ### Title: Select terminals
    > ### Aliases: generate_st_samples
    > 
    > ### ** Examples
    > 
    > generate_st_samples(graph = graph("Zachary"),
    +                     ter_number = c(3, 4),
    +                     prob = c(0.1, 0.2))
    Warning: `graph()` was deprecated in igraph 1.6.0.
    ℹ Please use `make_graph()` instead.
    Error in make_graph(edges = edges, n = n, isolates = isolates, directed = directed,  : 
      'simplify' should only be used for graph literals
    Calls: generate_st_samples ... as.undirected -> ensure_igraph -> graph -> make_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘tutorial.Rmd’ using rmarkdown
    
    Quitting from lines 49-54 [unnamed-chunk-2] (tutorial.Rmd)
    Error: processing vignette 'tutorial.Rmd' failed with diagnostics:
    'simplify' should only be used for graph literals
    --- failed re-building ‘tutorial.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘tutorial.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# TreeDimensionTest

<details>

* Version: 0.0.2
* GitHub: NA
* Source code: https://github.com/cran/TreeDimensionTest
* Date/Publication: 2022-03-12 10:30:07 UTC
* Number of recursive dependencies: 70

Run `revdepcheck::cloud_details(, "TreeDimensionTest")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Tutorial.Rmd’ using rmarkdown
    
    Quitting from lines 46-56 [unnamed-chunk-5] (Tutorial.Rmd)
    Error: processing vignette 'Tutorial.Rmd' failed with diagnostics:
    'simplify' should only be used for graph literals
    --- failed re-building ‘Tutorial.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Tutorial.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

