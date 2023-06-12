# adegenet

<details>

* Version: 2.1.10
* GitHub: https://github.com/thibautjombart/adegenet
* Source code: https://github.com/cran/adegenet
* Date/Publication: 2023-01-26 22:00:23 UTC
* Number of recursive dependencies: 132

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
    +     g <- gengraph(woodmouse, cutoff=5)
    +     g
    +     plot(g$graph)
    + 
    + }
    Loading required package: ape
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: gengraph ... gengraph.matrix -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

# AHPWR

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/AHPWR
* Date/Publication: 2022-12-06 17:02:46 UTC
* Number of recursive dependencies: 96

Run `revdepcheck::cloud_details(, "AHPWR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘AHPWR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: flow_chart
    > ### Title: creates a hierarchical structure
    > ### Aliases: flow_chart
    > 
    > ### ** Examples
    > 
    > p=flow_chart(names=NULL, a=2, c=2)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: flow_chart -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Intro_to_AHP.Rmd’ using rmarkdown
    
    Quitting from lines 45-47 [unnamed-chunk-2] (Intro_to_AHP.Rmd)
    Error: processing vignette 'Intro_to_AHP.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘Intro_to_AHP.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Intro_to_AHP.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# akc

<details>

* Version: 0.9.9
* GitHub: https://github.com/hope-data-science/akc
* Source code: https://github.com/cran/akc
* Date/Publication: 2023-01-06 08:00:02 UTC
* Number of recursive dependencies: 118

Run `revdepcheck::cloud_details(, "akc")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘akc-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: doc_group
    > ### Title: Construct network of documents based on keyword co-occurrence
    > ### Aliases: doc_group
    > 
    > ### ** Examples
    > 
    >  library(akc)
    >  bibli_data_table %>%
    +    keyword_clean(id = "id",keyword = "keyword") %>%
    +    doc_group(id = "id",keyword = "keyword") -> grouped_doc
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: %>% ... as_tbl_graph -> graph_from_data_frame -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        5. ├─dplyr::pull(., 2)
        6. ├─akc::keyword_table(.)
        7. │ └─tidygraph::is.tbl_graph(tibble_graph)
        8. ├─akc::keyword_group(., id = "id", keyword = "keyword")
        9. │ └─... %>% mutate(group = com_detect_fun())
       10. ├─dplyr::mutate(., group = com_detect_fun())
       11. ├─dplyr::rename(., freq = n)
       12. ├─dplyr::inner_join(., freq_table, by = c(name = "keyword"))
       13. ├─tidygraph::as_tbl_graph(.)
       14. └─igraph::graph_from_data_frame(., directed = FALSE)
       15.   └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 4 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Benchmarking.Rmd’ using rmarkdown
    --- finished re-building ‘Benchmarking.Rmd’
    
    --- re-building ‘akc_vignette.Rmd’ using rmarkdown
    
    Quitting from lines 75-79 [unnamed-chunk-5] (akc_vignette.Rmd)
    Error: processing vignette 'akc_vignette.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    ...
    Quitting from lines 63-65 [unnamed-chunk-6] (tutorial_raw_text.Rmd)
    Error: processing vignette 'tutorial_raw_text.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘tutorial_raw_text.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘akc_vignette.Rmd’ ‘tutorial_raw_text.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# alakazam

<details>

* Version: 1.2.1
* GitHub: NA
* Source code: https://github.com/cran/alakazam
* Date/Publication: 2022-09-20 22:10:02 UTC
* Number of recursive dependencies: 117

Run `revdepcheck::cloud_details(, "alakazam")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘alakazam-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: getMRCA
    > ### Title: Retrieve the first non-root node of a lineage tree
    > ### Aliases: getMRCA
    > 
    > ### ** Examples
    > 
    > # Define example graph
    > graph <- ExampleTrees[[23]]
    > 
    > # Use unweighted path length and do not exclude any nodes
    > getMRCA(graph, path="steps", root="Germline")
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: getMRCA ... data.frame -> V -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘AminoAcids-Vignette.Rmd’ using rmarkdown
    A new version of TeX Live has been released. If you need to install or update any LaTeX packages, you have to upgrade TinyTeX with tinytex::reinstall_tinytex(repository = "illinois").
    
    tlmgr: Local TeX Live (2022) is older than remote repository (2023).
    Cross release updates are only supported with
      update-tlmgr-latest(.sh/.exe) --update
    See https://tug.org/texlive/upgrade.html for details.
    Warning in system2("tlmgr", args, ...) :
      running command ''tlmgr' search --file --global '/grffile.sty'' had status 1
    ...
    LaTeX failed to compile /tmp/workdir/alakazam/new/alakazam.Rcheck/vign_test/alakazam/vignettes/Topology-Vignette.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See Topology-Vignette.log for more info.
    --- failed re-building ‘Topology-Vignette.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘AminoAcids-Vignette.Rmd’ ‘Diversity-Vignette.Rmd’
      ‘Fastq-Vignette.Rmd’ ‘Files-Vignette.Rmd’ ‘GeneUsage-Vignette.Rmd’
      ‘Lineage-Vignette.Rmd’ ‘Topology-Vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# AnimalHabitatNetwork

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/AnimalHabitatNetwork
* Date/Publication: 2019-11-25 19:40:02 UTC
* Number of recursive dependencies: 30

Run `revdepcheck::cloud_details(, "AnimalHabitatNetwork")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘AnimalHabitatNetwork-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ahn_gen
    > ### Title: Generate networks characterising habitat physical configurations
    > ### Aliases: ahn_gen
    > 
    > ### ** Examples
    > 
    > # generate a connected and weighted network
    > ahn_gen(N = 10, L = 5, mu = 1, lamda = 5)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: ahn_gen ... graph_from_adjacency_matrix -> graph.adjacency.dense
    Execution halted
    ```

# aniSNA

<details>

* Version: 1.0
* GitHub: NA
* Source code: https://github.com/cran/aniSNA
* Date/Publication: 2023-02-17 09:50:09 UTC
* Number of recursive dependencies: 58

Run `revdepcheck::cloud_details(, "aniSNA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘aniSNA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: elk_network_2010
    > ### Title: An igraph object depicting the network obtained from
    > ###   elk_interactions_2010
    > ### Aliases: elk_network_2010
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > igraph::E(elk_network_2010)
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    ```

# anocva

<details>

* Version: 0.1.1
* GitHub: NA
* Source code: https://github.com/cran/anocva
* Date/Publication: 2017-11-10 04:27:50 UTC
* Number of recursive dependencies: 9

Run `revdepcheck::cloud_details(, "anocva")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘anocva-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: spectralClustering
    > ### Title: Spectral clustering
    > ### Aliases: spectralClustering
    > 
    > ### ** Examples
    > 
    > # Install igraph if necessary
    ...
    +   # Cluster the tree graph in to four clusters
    +   cluster = spectralClustering(adj, 4)
    + 
    +   # See the result clustering
    +   plot(treeGraph, vertex.size=10, vertex.color = cluster, vertex.label = NA)
    + }
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous>
    Execution halted
    ```

# archeofrag

<details>

* Version: 0.8.2
* GitHub: https://github.com/sebastien-plutniak/archeofrag
* Source code: https://github.com/cran/archeofrag
* Date/Publication: 2022-09-11 22:02:59 UTC
* Number of recursive dependencies: 68

Run `revdepcheck::cloud_details(, "archeofrag")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘archeofrag-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: frag.cycles
    > ### Title: Count the k-cycles in a graph, for cycles =< k
    > ### Aliases: frag.cycles
    > ### Keywords: measurement
    > 
    > ### ** Examples
    > 
    > g <- frag.simul.process(n.components=20, vertices=50, disturbance=.15)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: frag.simul.process -> .main -> <Anonymous> -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       2. └─archeofrag::make_cr_graph(g)
       3.   └─igraph::graph_from_data_frame(...)
       4.     └─igraph::make_empty_graph(n = 0, directed = directed)
      ── Error ('test.frag.get.parameters.R:15:3'): retrieved parameters are correct ──
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─archeofrag::make_cr_graph(g) at test.frag.get.parameters.R:15:2
       2. └─archeofrag::make_cr_graph(g)
       3.   └─igraph::graph_from_data_frame(...)
       4.     └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 31 | WARN 0 | SKIP 0 | PASS 4 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘archeofrag-vignette.Rmd’ using rmarkdown
    
    Quitting from lines 61-65 [make-empirical-graph] (archeofrag-vignette.Rmd)
    Error: processing vignette 'archeofrag-vignette.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘archeofrag-vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘archeofrag-vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# arulesViz

<details>

* Version: 1.5-2
* GitHub: https://github.com/mhahsler/arulesViz
* Source code: https://github.com/cran/arulesViz
* Date/Publication: 2023-03-07 16:50:02 UTC
* Number of recursive dependencies: 111

Run `revdepcheck::cloud_details(, "arulesViz")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘arulesViz-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot
    > ### Title: Visualize Association Rules and Itemsets
    > ### Aliases: plot plot.itemsets plot.rules plot.grouped_matrix plotly
    > ###   guide_edge_colourbar
    > ### Keywords: hplot
    > 
    > ### ** Examples
    ...
    > 
    > ## Graph representation
    > # Default engine is ggplot2 with ggraph. Associations are represented as nodes.
    > # We limit the number of rules to the 10 with the larges 
    > # lift (measure used for shading)
    > plot(subrules, method = "graph", limit = 10)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... associations2igraph_nodes -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking running R code from vignettes ... ERROR
    ```
    Errors in running code in vignettes:
    when running code in ‘arulesViz.Rnw’
      ...
    
    > plot(rules, method = "grouped", control = list(k = 50))
    
    > subrules2 <- head(rules, n = 10, by = "lift")
    
    > plot(subrules2, method = "graph")
    
      When sourcing ‘arulesViz.R’:
    Error: could not find function ".igraph.status"
    Execution halted
    
      ‘arulesViz.Rnw’ using ‘UTF-8’... failed
    ```

## In both

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘arulesViz.Rnw’ using Sweave
    Loading required package: arules
    Loading required package: Matrix
    
    Attaching package: ‘arules’
    
    The following objects are masked from ‘package:base’:
    
        abbreviate, write
    ...
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    
    --- failed re-building ‘arulesViz.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘arulesViz.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# autoharp

<details>

* Version: 0.0.10
* GitHub: NA
* Source code: https://github.com/cran/autoharp
* Date/Publication: 2021-11-12 22:50:02 UTC
* Number of recursive dependencies: 92

Run `revdepcheck::cloud_details(, "autoharp")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘autoharp-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: carve_subtree
    > ### Title: Carve out branches to form a new tree.
    > ### Aliases: carve_subtree
    > 
    > ### ** Examples
    > 
    > th3 <- list(a= c(2L,3L,4L), b=NULL, c=c(5L, 6L), d=7L, e=NULL, f=NULL, g=NULL)
    > carve_subtree(TreeHarp(th3), c(1,0,0,0,0,0,0))
    a 
    > st <- subtree_at(TreeHarp(th3), 4)
    > plot(st)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot -> plot -> <Anonymous>
    Execution halted
    ```

# autostats

<details>

* Version: 0.4.0
* GitHub: https://github.com/Harrison4192/autostats
* Source code: https://github.com/cran/autostats
* Date/Publication: 2022-11-07 10:20:06 UTC
* Number of recursive dependencies: 229

Run `revdepcheck::cloud_details(, "autostats")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘autostats.Rmd’ using rmarkdown
    --- finished re-building ‘autostats.Rmd’
    
    --- re-building ‘tidyXgboost.Rmd’ using rmarkdown
    
    Quitting from lines 187-189 [unnamed-chunk-15] (tidyXgboost.Rmd)
    Error: processing vignette 'tidyXgboost.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘tidyXgboost.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘tidyXgboost.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
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
    +                 0,0,0,0,0,100,0,10,10,10,
    +                 0,0,0,0,0,100,10,0,10,10,
    +                 0,0,0,0,0,100,10,10,0,10,
    +                 0,0,0,0,0,100,10,10,10,0),10)
    > 
    > net <- igraph::graph_from_adjacency_matrix(net, mode = "undirected", weighted = TRUE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘tinytest.R’
    Running the tests in ‘tests/tinytest.R’ failed.
    Last 13 lines of output:
      test_backbone.R...............   22 tests [0;32mOK[0m 
      test_backbone.R...............   23 tests [0;32mOK[0m 
      test_backbone.R...............   24 tests [0;32mOK[0m 
      test_backbone.R...............   25 tests [0;32mOK[0m 
      test_backbone.R...............   25 tests [0;32mOK[0m 
      test_backbone.R...............   25 tests [0;32mOK[0m 
      test_backbone.R...............   25 tests [0;32mOK[0m 
      test_backbone.R...............   26 tests [0;32mOK[0m 
      test_backbone.R...............   27 tests [0;32mOK[0m 
      test_backbone.R...............   28 tests [0;32mOK[0m 
      test_backbone.R...............   29 tests [0;32mOK[0m 
      test_backbone.R...............   30 tests [0;32mOK[0m Error in .igraph.status("Make graph external pointer.\n") : 
        could not find function ".igraph.status"
      Calls: <Anonymous> ... run_test_dir -> lapply -> FUN -> eval -> eval -> <Anonymous>
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘backbone.Rmd’ using rmarkdown
    
    Quitting from lines 132-134 [unnamed-chunk-5] (backbone.Rmd)
    Error: processing vignette 'backbone.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
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

*   checking examples ... ERROR
    ```
    Running examples in ‘backShift-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: exampleAdjacencyMatrix
    > ### Title: Example adjacency matrix
    > ### Aliases: exampleAdjacencyMatrix
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > data("exampleAdjacencyMatrix")
    > plotGraphEdgeAttr(estimate = exampleAdjacencyMatrix, plotStabSelec = FALSE, 
    +                   labels = colnames(exampleAdjacencyMatrix),
    +                   thres.point = 0, thres.stab = NULL, main = "True graph")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plotGraphEdgeAttr -> graph.data.frame -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─testthat::expect_is(...) at test_backShift.R:67:12
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─backShift::backShift(...)
       5.   └─backShift:::permuteAndScale(estimatedB, verbose)
       6.     └─backShift:::hasCPsmallerOne(Dhat, returnCycleNodes = FALSE)
       7.       └─igraph::graph.adjacency(Ahat.larger.1, mode = "directed", weighted = "a")
       8.         └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 32 | WARN 7 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘exampleBackShift.Rmd’ using rmarkdown
    
    Quitting from lines 180-184 [unnamed-chunk-7] (exampleBackShift.Rmd)
    Error: processing vignette 'exampleBackShift.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
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

# BallMapper

<details>

* Version: 0.2.0
* GitHub: NA
* Source code: https://github.com/cran/BallMapper
* Date/Publication: 2019-08-20 21:20:17 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::cloud_details(, "BallMapper")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘BallMapper-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ColorIgraphPlot
    > ### Title: Produce a static color visualization of the Ball Mapper graph.
    > ###   It is based on the output from BallMapper function.
    > ### Aliases: ColorIgraphPlot
    > 
    > ### ** Examples
    > 
    ...
    > var <- seq(from=0,to=6.3,by=0.1)
    > points <- as.data.frame( cbind( sin(var),cos(var) ) )
    > values <- as.data.frame( sin(var) )
    > epsilon <- 0.25
    > l <- BallMapper(points,values,epsilon)
    > ColorIgraphPlot(l)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: ColorIgraphPlot -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘testthat’
      All declared Imports should be used.
    ```

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# bamm

<details>

* Version: 0.4.3
* GitHub: https://github.com/luismurao/bamm
* Source code: https://github.com/cran/bamm
* Date/Publication: 2022-12-20 11:10:05 UTC
* Number of recursive dependencies: 110

Run `revdepcheck::cloud_details(, "bamm")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bamm-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: bam_clusters
    > ### Title: bam_clusters: Function to estimate the connectivity of suitable
    > ###   areas
    > ### Aliases: bam_clusters
    > 
    > ### ** Examples
    > 
    ...
    > set.seed(891)
    > model_path <- system.file("extdata/Lepus_californicus_cont.tif",
    +                           package = "bamm")
    > model <- raster::raster(model_path)
    > model <- model > 0.7
    > clusterin <- bamm::bam_clusters(model,ngbs=1,plot_model=TRUE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. ├─bamm::csd_estimate(model, dispersal_steps = c(1, 2)) at test-bam.R:230:2
       2. │ └─... %>% ...
       3. ├─dplyr::summarise(., Clusters = max(clusterID), mean_area = mean(nclust))
       4. ├─dplyr::group_by(., d)
       5. ├─dplyr::summarise(., nclust = dplyr::n())
       6. ├─dplyr::group_by(., d, clusterID)
       7. └─dplyr:::group_by.data.frame(., d, clusterID)
       8.   └─dplyr::group_by_prepare(.data, ..., .add = .add, error_call = current_env())
       9.     └─rlang::abort(bullets, call = error_call)
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 63 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘bam.Rmd’ using rmarkdown
    
    Quitting from lines 97-99 [unnamed-chunk-6] (bam.Rmd)
    Error: processing vignette 'bam.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘bam.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘bam.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

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

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘BASiNET.Rmd’ using rmarkdown
    
    Quitting from lines 69-73 [unnamed-chunk-1] (BASiNET.Rmd)
    Error: processing vignette 'BASiNET.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘BASiNET.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘BASiNET.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# BASiNETEntropy

<details>

* Version: 0.99.5
* GitHub: NA
* Source code: https://github.com/cran/BASiNETEntropy
* Date/Publication: 2022-08-26 14:44:34 UTC
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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: classify ... graph_from_edgelist -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

# basket

<details>

* Version: 0.10.11
* GitHub: https://github.com/kaneplusplus/basket
* Source code: https://github.com/cran/basket
* Date/Publication: 2021-10-16 23:30:22 UTC
* Number of recursive dependencies: 91

Run `revdepcheck::cloud_details(, "basket")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       4.       └─igraph::graph_from_adjacency_matrix(...)
       5.         └─igraph:::graph.adjacency.dense(...)
      ── Error ('test-plot.r:7:5'): Plotting works. ──────────────────────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─basket::mem_mcmc(...) at test-plot.r:7:4
       2.   └─basket:::cluster_comp(ret, cluster_function)
       3.     └─basket (local) cluster_function(map)
       4.       └─igraph::graph_from_adjacency_matrix(...)
       5.         └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 3 | WARN 0 | SKIP 3 | PASS 15 ]
      Error: Test failures
      Execution halted
    ```

# BayesMallows

<details>

* Version: 1.3.0
* GitHub: https://github.com/ocbe-uio/BayesMallows
* Source code: https://github.com/cran/BayesMallows
* Date/Publication: 2023-03-10 16:20:17 UTC
* Number of recursive dependencies: 94

Run `revdepcheck::cloud_details(, "BayesMallows")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘BayesMallows-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: generate_constraints
    > ### Title: Generate Constraint Set from Pairwise Comparisons
    > ### Aliases: generate_constraints
    > 
    > ### ** Examples
    > 
    > # Here is an example with the beach preference data.
    > # First, generate the transitive closure.
    > beach_tc <- generate_transitive_closure(beach_preferences)
    > 
    > # Next, generate an initial ranking.
    > beach_init_rank <- generate_initial_ranking(beach_tc)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: generate_initial_ranking ... <Anonymous> -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. └─BayesMallows::generate_initial_ranking(beach_tc) at test-plot_top_k.R:6:0
       2.   ├─base::do.call(...)
       3.   └─base::lapply(...)
       4.     └─BayesMallows (local) FUN(X[[i]], ...)
       5.       └─BayesMallows:::create_ranks(as.matrix(x), y, sr, r)
       6.         └─igraph::graph_from_edgelist(as.matrix(mat))
       7.           └─igraph::make_graph(t(el), directed = directed)
       8.             ├─base::do.call(old_graph, args)
       9.             └─igraph (local) `<fn>`(`<dbl[,1]>`, directed = TRUE)
      
      [ FAIL 6 | WARN 0 | SKIP 0 | PASS 509 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 47.4Mb
      sub-directories of 1Mb or more:
        doc    1.7Mb
        libs  44.9Mb
    ```

# BayesMRA

<details>

* Version: 1.0.0
* GitHub: https://github.com/jtipton25/BayesMRA
* Source code: https://github.com/cran/BayesMRA
* Date/Publication: 2020-08-18 09:52:11 UTC
* Number of recursive dependencies: 93

Run `revdepcheck::cloud_details(, "BayesMRA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘BayesMRA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: make_Q_alpha_2d
    > ### Title: Generate CAR precision matrix
    > ### Aliases: make_Q_alpha_2d
    > 
    > ### ** Examples
    > 
    > n_dims <- c(4, 8)
    > phi <- c(0.8, 0.9)
    > Q_alpha <- make_Q_alpha_2d(n_dims, phi)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: make_Q_alpha_2d ... as_adjacency_matrix -> ensure_igraph -> make_lattice
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       5.   ├─igraph::as_adjacency_matrix(...)
       6.   │ └─igraph:::ensure_igraph(graph)
       7.   └─igraph::make_lattice(length = n_dims[[m]], dim = 2)
      ── Error ('test-precision-matrices.R:84:5'): make_Q_alpha_tau2 ─────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─BayesMRA::make_Q_alpha_2d(n_dims, phi) at test-precision-matrices.R:84:4
       2.   ├─igraph::as_adjacency_matrix(...)
       3.   │ └─igraph:::ensure_igraph(graph)
       4.   └─igraph::make_lattice(length = n_dims[[m]], dim = 2)
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 121 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        doc    2.8Mb
        libs   2.3Mb
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
    
    > ### Name: AbsorbEvidence
    > ### Title: Absorb evidence into the model
    > ### Aliases: AbsorbEvidence
    > 
    > ### ** Examples
    > 
    > 
    > data(liver)
    > tree.init.p <- Initializer(dag=liver$dag, data=liver$data,
    +                            node.class=liver$node.class,
    +                            propagate = TRUE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: Initializer ... EliminationOrder -> igraph.from.graphNEL -> graph_from_adj_list
    Execution halted
    ```

# BayesSUR

<details>

* Version: 2.1-3
* GitHub: NA
* Source code: https://github.com/cran/BayesSUR
* Date/Publication: 2023-01-28 17:00:02 UTC
* Number of recursive dependencies: 47

Run `revdepcheck::cloud_details(, "BayesSUR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘BayesSUR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot.BayesSUR
    > ### Title: create a selection of plots
    > ### Aliases: plot.BayesSUR
    > 
    > ### ** Examples
    > 
    > data("exampleEQTL", package = "BayesSUR")
    ...
    > 
    > ## plot heatmaps of the estimated beta, gamma and Gy
    > plot(fit, estimator = c("beta", "gamma", "Gy"), type = "heatmap")
    > 
    > ## plot estimated graph of responses Gy
    > plot(fit, estimator = "Gy", type = "graph")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... graph_from_adjacency_matrix -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 32.1Mb
      sub-directories of 1Mb or more:
        data   1.5Mb
        libs  29.8Mb
    ```

# bcgam

<details>

* Version: 1.0
* GitHub: NA
* Source code: https://github.com/cran/bcgam
* Date/Publication: 2018-03-18 22:06:50 UTC
* Number of recursive dependencies: 39

Run `revdepcheck::cloud_details(, "bcgam")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('testthat.R:3:1'): (code run outside of `test_that()`) ───────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─bcgam::bcgam(...) at testthat.R:3:0
       2.   └─bcgam:::bcgam.fit(...)
       3.     └─nimble::nimbleModel(...)
       4.       └─md$setupModel(...)
       5.         └─nimble (local) genExpandedNodeAndParentNames3(debug = debug)
       6.           └─igraph::graph.empty()
      
      [ FAIL 1 | WARN 1 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

# BCT

<details>

* Version: 1.2
* GitHub: NA
* Source code: https://github.com/cran/BCT
* Date/Publication: 2022-05-12 14:00:05 UTC
* Number of recursive dependencies: 14

Run `revdepcheck::cloud_details(, "BCT")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘BCT-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: draw_models
    > ### Title: Plot the results of the BCT and kBCT functions
    > ### Aliases: draw_models
    > 
    > ### ** Examples
    > 
    > 
    > # Use the pewee dataset as an example:
    > q <- BCT(pewee, 5) # maximum depth of 5
    > 
    > draw_models(q)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: draw_models -> show_tree -> <Anonymous>
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
    
    > ### Name: adj2link
    > ### Title: Extract links from an adjacency matrix
    > ### Aliases: adj2link
    > ### Keywords: graphs
    > 
    > ### ** Examples
    > 
    > # Generating a 'random' graph 
    > adj <- graph.sim( p = 6, vis = TRUE )
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: graph.sim ... <Anonymous> -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘BDgraph-Examples.Rmd’ using rmarkdown
    
    Quitting from lines 46-49 [unnamed-chunk-2] (BDgraph-Examples.Rmd)
    Error: processing vignette 'BDgraph-Examples.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘BDgraph-Examples.Rmd’
    
    --- re-building ‘Introduction-BDgraph.Rmd’ using rmarkdown
    ...
    Quitting from lines 200-201 [unnamed-chunk-13] (Introduction-BDgraph.Rmd)
    Error: processing vignette 'Introduction-BDgraph.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
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

# beam

<details>

* Version: 2.0.2
* GitHub: https://github.com/gleday/beam
* Source code: https://github.com/cran/beam
* Date/Publication: 2020-05-28 23:20:18 UTC
* Number of recursive dependencies: 53

Run `revdepcheck::cloud_details(, "beam")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.r’
    Running the tests in ‘tests/testthat.r’ failed.
    Last 13 lines of output:
      ── Error ('test_beam.r:227:3'): NlowerthanP ────────────────────────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(class(bgraph(fit)), "igraph") at test_beam.r:227:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. ├─beam::bgraph(fit)
       5. └─beam::bgraph(fit)
       6.   └─igraph::graph_from_data_frame(d = edges, directed = FALSE)
       7.     └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 2 | WARN 9 | SKIP 0 | PASS 51 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.5Mb
      sub-directories of 1Mb or more:
        libs   5.8Mb
    ```

# bibliometrix

<details>

* Version: 4.1.2
* GitHub: https://github.com/massimoaria/bibliometrix
* Source code: https://github.com/cran/bibliometrix
* Date/Publication: 2023-03-07 16:00:03 UTC
* Number of recursive dependencies: 150

Run `revdepcheck::cloud_details(, "bibliometrix")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bibliometrix-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: biblioNetwork
    > ### Title: Creating Bibliographic networks
    > ### Aliases: biblioNetwork
    > 
    > ### ** Examples
    > 
    > # EXAMPLE 1: Authors collaboration network
    ...
    > data(scientometrics, package = "bibliometrixData")
    > 
    > NetMatrix <- biblioNetwork(scientometrics, analysis = "co-citation", 
    + network = "references", sep = ";")
    > 
    > net <- networkPlot(NetMatrix, n = 30, type = "kamada", Title = "Co-Citation",labelsize=0.5) 
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: networkPlot ... graph.adjacency.sparse -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

# bifurcatingr

<details>

* Version: 1.0.0
* GitHub: NA
* Source code: https://github.com/cran/bifurcatingr
* Date/Publication: 2021-02-15 17:10:02 UTC
* Number of recursive dependencies: 37

Run `revdepcheck::cloud_details(, "bifurcatingr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bifurcatingr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: bfa.tree.plot
    > ### Title: Plotting Bifurcating Autoregressive Trees
    > ### Aliases: bfa.tree.plot
    > 
    > ### ** Examples
    > 
    > z <- bfa.tree.gen(31, 1, 1, 1, 0.5, 0.5, 0, 10, c(0.7))
    > bfa.tree.plot(z)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: bfa.tree.plot -> <Anonymous>
    Execution halted
    ```

# bio3d

<details>

* Version: 2.4-4
* GitHub: NA
* Source code: https://github.com/cran/bio3d
* Date/Publication: 2022-10-26 22:45:06 UTC
* Number of recursive dependencies: 77

Run `revdepcheck::cloud_details(, "bio3d")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bio3d-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: print.cna
    > ### Title: Summarize and Print Features of a cna Network Graph
    > ### Aliases: print.cna summary.cna
    > ### Keywords: utilities
    > 
    > ### ** Examples
    > 
    ...
    + x<- summary(net)
    + x$members[[2]]
    + 
    + detach(hivp)
    + 
    + }
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: print ... <Anonymous> -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 11.0Mb
      sub-directories of 1Mb or more:
        libs   7.3Mb
    ```

# Bioi

<details>

* Version: 0.2.10
* GitHub: NA
* Source code: https://github.com/cran/Bioi
* Date/Publication: 2019-12-08 01:30:08 UTC
* Number of recursive dependencies: 72

Run `revdepcheck::cloud_details(, "Bioi")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. ├─testthat::expect_true(...) at test.euclidean_linker_cpp.R:7:4
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─Bioi::euclidean_linker(input, crit_dist) at test.euclidean_linker_cpp.R:11:6
       5.   └─Bioi::.perform_partitioning(...)
       6.     ├─igraph::components(...)
       7.     │ └─igraph:::ensure_igraph(graph)
       8.     └─igraph::graph.data.frame(pOne_dict, directed = FALSE)
       9.       └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 20 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# bioregion

<details>

* Version: 1.0.0
* GitHub: https://github.com/bioRgeo/bioregion
* Source code: https://github.com/cran/bioregion
* Date/Publication: 2023-04-14 19:30:02 UTC
* Number of recursive dependencies: 119

Run `revdepcheck::cloud_details(, "bioregion")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bioregion-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: map_clusters
    > ### Title: Create a map of bioregions
    > ### Aliases: map_clusters
    > 
    > ### ** Examples
    > 
    > data(fishmat)
    > data(fishsf)
    > 
    > net <- similarity(fishmat, metric = "Simpson")
    > clu <- netclu_greedy(net)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: netclu_greedy -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.1Mb
      sub-directories of 1Mb or more:
        data   1.7Mb
        doc    1.1Mb
        help   1.1Mb
    ```

# Bios2cor

<details>

* Version: 2.2.1
* GitHub: NA
* Source code: https://github.com/cran/Bios2cor
* Date/Publication: 2022-07-08 09:25:23 UTC
* Number of recursive dependencies: 16

Run `revdepcheck::cloud_details(, "Bios2cor")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘Bios2cor-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: network.plot
    > ### Title: Creates network structure of top elements
    > ### Aliases: network.plot
    > 
    > ### ** Examples
    > 
    >   #File path for output file
    ...
    >    
    >   #Analyzing pairs with top scores and creating 'top_pairs' object
    >   top_pairs <- top_pairs_analysis(omes, top = 25, file)
    > 
    >   #Plotting the network structure of top pairs in pdf file 
    >   network.plot(top_pairs, file)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: network.plot -> graph_from_data_frame -> make_empty_graph
    Execution halted
    ```

# bipartite

<details>

* Version: 2.18
* GitHub: https://github.com/biometry/bipartite
* Source code: https://github.com/cran/bipartite
* Date/Publication: 2022-10-18 23:35:14 UTC
* Number of recursive dependencies: 48

Run `revdepcheck::cloud_details(, "bipartite")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bipartite-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: betweenness_w
    > ### Title: Betweenness centrality in a weighted network
    > ### Aliases: betweenness_w
    > 
    > ### ** Examples
    > 
    > ## Load sample data
    ...
    + c(3,4,10),
    + c(4,2,6),
    + c(4,3,10))
    > 
    > ## Run the programme
    > betweenness_w(sampledata)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: betweenness_w ... <Anonymous> -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Intro2bipartite.Rnw’ using Sweave
    Loading required package: vegan
    Loading required package: permute
    Loading required package: lattice
    This is vegan 2.6-4
    Loading required package: sna
    Loading required package: statnet.common
    
    Attaching package: ‘statnet.common’
    
    The following objects are masked from ‘package:base’:
    
        attr, order
    
    Loading required package: network
    
    ‘network’ 1.18.1 (2023-01-24), part of the Statnet Project
    ```

# bnma

<details>

* Version: 1.5.0
* GitHub: NA
* Source code: https://github.com/cran/bnma
* Date/Publication: 2022-01-03 13:40:08 UTC
* Number of recursive dependencies: 56

Run `revdepcheck::cloud_details(, "bnma")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bnma-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: draw.network.graph
    > ### Title: Draws network graph using igraph package
    > ### Aliases: draw.network.graph
    > 
    > ### ** Examples
    > 
    > #cardiovascular
    > network <- with(thrombolytic, {
    +  network.data(Outcomes, Study, Treat, N=N, response = "binomial")
    + })
    > draw.network.graph(network)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: draw.network.graph ... <Anonymous> -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

# bnviewer

<details>

* Version: 0.1.6
* GitHub: NA
* Source code: https://github.com/cran/bnviewer
* Date/Publication: 2020-09-14 06:00:03 UTC
* Number of recursive dependencies: 109

Run `revdepcheck::cloud_details(, "bnviewer")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bnviewer-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: model.to.structure
    > ### Title: Model to Bayesian Network Structure
    > ### Aliases: model.to.structure
    > 
    > ### ** Examples
    > 
    > 
    ...
    +        bayesianNetwork.layout = "layout_on_grid",
    +        node.colors = list(background = "#f4bafd",
    +                          border = "#2b7ce9",
    +                          highlight = list(background = "#97c2fc",
    +                                           border = "#2b7ce9"))
    +       )
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: viewer -> <Anonymous> -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘alarm.R’
    Running the tests in ‘tests/alarm.R’ failed.
    Last 13 lines of output:
      +        bayesianNetwork.title="Discrete Bayesian Network - Coronary",
      +        bayesianNetwork.subtitle = "Coronary heart disease data set",
      +        bayesianNetwork.footer = "Fig. 1 - Layout on grid",
      +        edges.smooth = TRUE,
      +        edges.shadow = TRUE,
      +        edges.width = 1.5,
      +        node.colors = list(background = "#f4bafd",
      +                           border = "#2b7ce9",
      +                           highlight = "#97c2fc")
      + 
      + )
      Error in .igraph.status("Make graph external pointer.\n") : 
        could not find function ".igraph.status"
      Calls: viewer -> <Anonymous> -> <Anonymous> -> make_empty_graph
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘caret’ ‘e1071’
      All declared Imports should be used.
    ```

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# BoolNet

<details>

* Version: 2.1.8
* GitHub: NA
* Source code: https://github.com/cran/BoolNet
* Date/Publication: 2023-02-27 13:52:30 UTC
* Number of recursive dependencies: 8

Run `revdepcheck::cloud_details(, "BoolNet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘BoolNet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: BoolNet-package
    > ### Title: Construction, Simulation and Analysis of Boolean Networks
    > ### Aliases: BoolNet-package BoolNet
    > 
    > ### ** Examples
    > 
    > ##################################
    ...
    > 
    > # identifies asynchronous attractors
    > attractors <- getAttractors(cellcycle, 
    +                             type="asynchronous", startStates=100)
    >                             
    > plotAttractors(attractors, mode="graph")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plotAttractors ... lapply -> FUN -> graph.data.frame -> make_empty_graph
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘BoolNet_package_vignette.Snw’ using Sweave
    Error: processing vignette 'BoolNet_package_vignette.Snw' failed with diagnostics:
    Running 'texi2dvi' on 'BoolNet_package_vignette.tex' failed.
    LaTeX errors:
    ! LaTeX Error: File `a4wide.sty' not found.
    
    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: sty)
    ...
    l.7 ^^M
           
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘BoolNet_package_vignette.Snw’
    
    SUMMARY: processing the following file failed:
      ‘BoolNet_package_vignette.Snw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# bootnet

<details>

* Version: 1.5.3
* GitHub: NA
* Source code: https://github.com/cran/bootnet
* Date/Publication: 2023-06-05 12:30:02 UTC
* Number of recursive dependencies: 190

Run `revdepcheck::cloud_details(, "bootnet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bootnet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: bootnet
    > ### Title: Bootstrapped network estimation
    > ### Aliases: bootnet
    > 
    > ### ** Examples
    > 
    > # BFI Extraversion data from psychTools package:
    ...
    Warning in EBICglassoCore(S = S, n = n, gamma = gamma, penalize.diagonal = penalize.diagonal,  :
      A dense regularized network was selected (lambda < 0.1 * lambda.max). Recent work indicates a possible drop in specificity. Interpret the presence of the smallest edges with care. Setting threshold = TRUE will enforce higher specificity, at the cost of sensitivity.
    > 
    > # Centrality indices:
    > library("qgraph")
    > centralityPlot(Network)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: centralityPlot ... FUN -> centrality -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

# BSBT

<details>

* Version: 1.2.1
* GitHub: https://github.com/rowlandseymour/BSBT
* Source code: https://github.com/cran/BSBT
* Date/Publication: 2022-08-09 09:10:02 UTC
* Number of recursive dependencies: 86

Run `revdepcheck::cloud_details(, "BSBT")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘BSBT-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: constrained_adjacency_covariance_function
    > ### Title: Construct a constrained covariance matrix from the adjacency
    > ###   matrix
    > ### Aliases: constrained_adjacency_covariance_function
    > 
    > ### ** Examples
    > 
    > #Construct covariance matrix of Dar es Salaam, Tanzania, using network metric
    > data(dar.adj.matrix, package = "BSBT") #load dar es salaam adjacency matrix
    > k <- constrained_adjacency_covariance_function(dar.adj.matrix, type = "sqexp",
    +        hyperparameters = c(1, 1), rep(1, dim(dar.adj.matrix)[1]), 0)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: constrained_adjacency_covariance_function -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
          ▆
       1. └─BSBT::constrained_adjacency_covariance_function(...) at test-mcmc_functions.R:32:2
       2.   └─igraph::graph.adjacency(adj.matrix, weighted = TRUE)
       3.     └─igraph:::graph.adjacency.dense(...)
      ── Error ('test-mcmc_functions.R:42:3'): asymmetric MCMC function works ────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─BSBT::constrained_adjacency_covariance_function(...) at test-mcmc_functions.R:42:2
       2.   └─igraph::graph.adjacency(adj.matrix, weighted = TRUE)
       3.     └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 6 | WARN 0 | SKIP 0 | PASS 19 ]
      Error: Test failures
      Execution halted
    ```

# btergm

<details>

* Version: 1.10.10
* GitHub: https://github.com/leifeld/btergm
* Source code: https://github.com/cran/btergm
* Date/Publication: 2023-04-24 12:40:14 UTC
* Number of recursive dependencies: 100

Run `revdepcheck::cloud_details(, "btergm")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      [ FAIL 1 | WARN 0 | SKIP 8 | PASS 51 ]
      
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      • On CRAN (8)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-gof.R:24:3'): basic GOF functionality works ──────────────────
      length(g) not equal to 7.
      1/1 mismatches
      [1] 6 - 7 == -1
      
      [ FAIL 1 | WARN 0 | SKIP 8 | PASS 51 ]
      Error: Test failures
      Execution halted
    ```

# bwsTools

<details>

* Version: 1.2.0
* GitHub: https://github.com/markhwhiteii/bwsTools
* Source code: https://github.com/cran/bwsTools
* Date/Publication: 2020-08-26 22:40:03 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::cloud_details(, "bwsTools")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       6.           └─igraph:::graph.adjacency.dense(...)
      ── Error ('test_walkscoring.R:4:1'): (code run outside of `test_that()`) ───────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─bwsTools::walkscoring(...) at test_walkscoring.R:4:0
       2.   └─base::lapply(...)
       3.     └─bwsTools (local) FUN(X[[i]], ...)
       4.       └─bwsTools:::get_walkscores(...)
       5.         └─igraph::graph_from_adjacency_matrix(M, mode = "directed", weighted = TRUE)
       6.           └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 4 | WARN 3 | SKIP 0 | PASS 96 ]
      Error: Test failures
      Execution halted
    ```

# Canek

<details>

* Version: 0.2.2
* GitHub: https://github.com/MartinLoza/Canek
* Source code: https://github.com/cran/Canek
* Date/Publication: 2023-05-31 04:50:02 UTC
* Number of recursive dependencies: 214

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: CorrectBatch ... neighborsToSNNGraph -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
           ▆
        1. ├─Canek::RunCanek(x, "orig.ident") at test_RunCanek.R:12:0
        2. └─Canek:::RunCanek.Seurat(x, "orig.ident")
        3.   └─Canek::CorrectBatches(counts, debug = debug, ...)
        4.     └─Canek::CorrectBatch(...)
        5.       └─Canek:::ClusterLouvain(pcaQue[, 1:10], k = kNN, verbose = verbose)
        6.         └─bluster::makeSNNGraph(x, k = k)
        7.           └─bluster::neighborsToSNNGraph(nn.out$index, type = match.arg(type))
        8.             └─igraph::make_graph(edges, directed = FALSE)
        9.               ├─base::do.call(old_graph, args)
       10.               └─igraph (local) `<fn>`(`<int>`, directed = FALSE)
      
      [ FAIL 7 | WARN 0 | SKIP 0 | PASS 33 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘toy_example.Rmd’ using rmarkdown
    
    Quitting from lines 79-80 [unnamed-chunk-5] (toy_example.Rmd)
    Error: processing vignette 'toy_example.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘toy_example.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘toy_example.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# cape

<details>

* Version: 3.1.1
* GitHub: NA
* Source code: https://github.com/cran/cape
* Date/Publication: 2022-05-19 13:40:02 UTC
* Number of recursive dependencies: 97

Run `revdepcheck::cloud_details(, "cape")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘cape.Rmd’ using rmarkdown
    
    Quitting from lines 481-483 [run_cape] (cape.Rmd)
    Error: processing vignette 'cape.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘cape.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘cape.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# CARlasso

<details>

* Version: 0.1.2
* GitHub: https://github.com/YunyiShen/CAR-LASSO
* Source code: https://github.com/cran/CARlasso
* Date/Publication: 2021-08-11 19:00:02 UTC
* Number of recursive dependencies: 87

Run `revdepcheck::cloud_details(, "CARlasso")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘CARlasso-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: CARlasso
    > ### Title: Gibbs sampler for Conditional Autoregressive LASSO and
    > ###   extensions
    > ### Aliases: CARlasso
    > 
    > ### ** Examples
    > 
    ...
    [----|----|----|----|----|----|----|----|----|----|
    **************************************************|
    
    done
    
    > plot(car_res,tol = 0.05)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... plot.carlasso_out -> graph.data.frame -> make_empty_graph
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 22.9Mb
      sub-directories of 1Mb or more:
        libs  22.6Mb
    ```

# cartograflow

<details>

* Version: 1.0.3
* GitHub: https://github.com/fbahoken/cartogRaflow
* Source code: https://github.com/cran/cartograflow
* Date/Publication: 2020-07-19 19:50:02 UTC
* Number of recursive dependencies: 105

Run `revdepcheck::cloud_details(, "cartograflow")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘cartograflow-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: flowcontig
    > ### Title: Builds an ordinal distance matrices from a spatial features
    > ###   background
    > ### Aliases: flowcontig
    > 
    > ### ** Examples
    > 
    ...
    Simple feature collection with 12 features and 14 fields
    Geometry type: POLYGON
    Dimension:     XY
    Bounding box:  xmin: 637297.4 ymin: 6838629 xmax: 671752.1 ymax: 6879246
    Projected CRS: Lambert_Conformal_Conic
    > graph_ckij_1 <- flowcontig(bkg = map, code = "EPT_NUM", k = 1, algo = "automatic")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: flowcontig -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

# cassowaryr

<details>

* Version: 2.0.0
* GitHub: https://github.com/numbats/cassowaryr
* Source code: https://github.com/cran/cassowaryr
* Date/Publication: 2022-08-09 12:30:02 UTC
* Number of recursive dependencies: 106

Run `revdepcheck::cloud_details(, "cassowaryr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘cassowaryr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: calc_scags
    > ### Title: Compute selected scagnostics on subsets
    > ### Aliases: calc_scags
    > 
    > ### ** Examples
    > 
    > # Calculate selected scagnostics on a single pair
    > calc_scags(anscombe$x1, anscombe$y1, scags=c("monotonic", "outlying"))
    The legacy packages maptools, rgdal, and rgeos, underpinning this package
    will retire shortly. Please refer to R-spatial evolution reports on
    https://r-spatial.org/r/2023/05/15/evolution4.html for details.
    This package is now running under evolution status 0 
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: calc_scags ... <Anonymous> -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. ├─testthat::expect_equal(sc_striated2(x1, y1), 1) at test_mst.R:98:2
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─cassowaryr::sc_striated2(x1, y1)
        5. └─cassowaryr:::sc_striated2.default(x1, y1)
        6.   └─cassowaryr:::sc_striated2.scree(sc)
        7.     └─cassowaryr:::gen_mst(x$del, x$weights)
        8.       └─igraph::graph_from_edgelist(edges, directed = FALSE)
        9.         └─igraph::make_graph(t(el), directed = directed)
       10.           ├─base::do.call(old_graph, args)
       11.           └─igraph (local) `<fn>`(`<dbl[,5]>`, directed = FALSE)
      
      [ FAIL 7 | WARN 0 | SKIP 0 | PASS 3 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘cassowaryr.Rmd’ using rmarkdown
    
    Quitting from lines 67-69 [unnamed-chunk-2] (cassowaryr.Rmd)
    Error: processing vignette 'cassowaryr.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘cassowaryr.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘cassowaryr.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# causact

<details>

* Version: 0.4.2
* GitHub: https://github.com/flyaflya/causact
* Source code: https://github.com/cran/causact
* Date/Publication: 2022-06-14 16:00:02 UTC
* Number of recursive dependencies: 118

Run `revdepcheck::cloud_details(, "causact")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘causact-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dag_diagrammer
    > ### Title: Convert graph to Diagrammer object for visualization
    > ### Aliases: dag_diagrammer
    > 
    > ### ** Examples
    > 
    > library("DiagrammeR")
    ...
    > dag_create() %>%
    + dag_node("Get Card","y",
    +          rhs = bernoulli(theta),
    +          data = carModelDF$getCard) %>%
    +   dag_diagrammer() %>%
    +   render_graph(title = "DiagrammeR Version of causact_graph")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: %>% ... <Anonymous> -> ensure_igraph -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        2. ├─causact::dag_render(.)
        3. │ └─... %>% generate_dot2()
        4. ├─causact::generate_dot2(.)
        5. ├─causact::dag_diagrammer(., shortLabel = sLabel, wrapWidth = ww)
        6. │ └─graph %>% dag_dim()
        7. ├─causact:::dag_dim(.)
        8. │ ├─... %>% as.integer()
        9. │ └─igraph::graph_from_data_frame(...)
       10. │   └─igraph::make_empty_graph(n = 0, directed = directed)
       11. └─igraph::topo_sort(., mode = "in")
       12.   └─igraph:::ensure_igraph(graph)
      
      [ FAIL 4 | WARN 17 | SKIP 0 | PASS 21 ]
      Error: Test failures
      Execution halted
    ```

# causalDisco

<details>

* Version: 0.9.1
* GitHub: https://github.com/annennenne/causalDisco
* Source code: https://github.com/cran/causalDisco
* Date/Publication: 2022-05-12 07:50:06 UTC
* Number of recursive dependencies: 41

Run `revdepcheck::cloud_details(, "causalDisco")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘causalDisco-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: probmat2amat
    > ### Title: Convert a matrix of probabilities into an adjacency matrix
    > ### Aliases: probmat2amat
    > 
    > ### ** Examples
    > 
    > #Make random probability matrix that can be 
    ...
    > #converted into adjancency matrix
    > pmat <- matrix(runif(25, 0, 1), 5, 5)
    > diag(pmat) <- 0
    > 
    > #Convert to adjacency matrix using cutoff-method (threshold = 0.5)
    > probmat2amat(pmat, threshold = 0.5)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: probmat2amat ... ensure_igraph -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

# ccTensor

<details>

* Version: 1.0.2
* GitHub: https://github.com/rikenbit/ccTensor
* Source code: https://github.com/cran/ccTensor
* Date/Publication: 2021-08-12 04:30:07 UTC
* Number of recursive dependencies: 60

Run `revdepcheck::cloud_details(, "ccTensor")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ccTensor-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: CUR
    > ### Title: CUR Matrix Decomposition
    > ### Aliases: CUR
    > ### Keywords: methods
    > 
    > ### ** Examples
    > 
    ...
    >     library("ccTensor")
    >     library("nnTensor")
    >     # Test data
    >     matdata <- toyModel(model = "NMF")
    >     # Simple usage
    >     out <- CUR(matdata, c.rank=3, r.rank=4)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: CUR ... graph_from_incidence_matrix -> graph.incidence.dense -> make_empty_graph
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘fields’
      All declared Imports should be used.
    ```

# CePa

<details>

* Version: 0.8.0
* GitHub: https://github.com/jokergoo/CePa
* Source code: https://github.com/cran/CePa
* Date/Publication: 2022-06-11 21:30:06 UTC
* Number of recursive dependencies: 10

Run `revdepcheck::cloud_details(, "CePa")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘CePa-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: generate.pathway
    > ### Title: Generate igraph object from edge list
    > ### Aliases: generate.pathway
    > 
    > ### ** Examples
    > 
    > edgelist = rbind(c("a", "b"), c("a", "b"), c("a", "c"))
    > g = generate.pathway(edgelist)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: generate.pathway ... graph.edgelist -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘CePa.Rnw’ using Sweave
    Error: processing vignette 'CePa.Rnw' failed with diagnostics:
    Running 'texi2dvi' on 'CePa.tex' failed.
    LaTeX errors:
    ! LaTeX Error: File `ae.sty' not found.
    
    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: sty)
    
    ...
    l.30 \ifthenelse
                    {\boolean{Sweave@inconsolata}}{%^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘parsing-PID-pathway-data.Rnw’
    
    SUMMARY: processing the following files failed:
      ‘CePa.Rnw’ ‘analysis-p53.Rnw’ ‘parsing-PID-pathway-data.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# CeRNASeek

<details>

* Version: 2.1.3
* GitHub: NA
* Source code: https://github.com/cran/CeRNASeek
* Date/Publication: 2020-04-29 08:00:02 UTC
* Number of recursive dependencies: 9

Run `revdepcheck::cloud_details(, "CeRNASeek")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘CeRNASeek-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ceRNA.Net
    > ### Title: visualize and analyze the identified ceRNA-ceRNA network using
    > ###   ceRNA.Net function
    > ### Aliases: ceRNA.Net
    > ### Keywords: ceRNA.Net
    > 
    > ### ** Examples
    ...
    > ##file identified by the ceRNA.cmi function.
    > ##Here we apply the ceRNA list in the example file for CMI identification to 
    > ##display the network and analyze the network topology properties.
    > ceRNA.Net(as.matrix(dataset[["Pre.ceRNA"]]),net_direct=TRUE,vertex_size=20,v.label = TRUE,
    +          node_shape="circle",n_color = "orange",E_weight=TRUE,ity=1,label_cex=2,
    +          label_color="black",edge_color="gray",n_frame.color = "gray")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: ceRNA.Net ... graph.edgelist -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

# cfid

<details>

* Version: 0.1.4
* GitHub: https://github.com/santikka/cfid
* Source code: https://github.com/cran/cfid
* Date/Publication: 2022-10-26 15:35:07 UTC
* Number of recursive dependencies: 51

Run `revdepcheck::cloud_details(, "cfid")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       1. └─igraph::graph.formula(X - +Y) at test-graphs.R:175:2
       2.   └─igraph:::graph_from_literal_i(mf)
       3.     └─igraph::make_graph(unname(ids[edges]), n = length(v), directed = directed)
       4.       ├─base::do.call(old_graph, args)
       5.       └─igraph (local) `<fn>`(`<int>`, n = 2L, directed = TRUE)
      ── Error ('test-graphs.R:212:3'): causaleffect sanity ──────────────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─cfid::export_graph(g, "causaleffect") at test-graphs.R:212:2
       2.   └─igraph::make_empty_graph(n = sum(!lat))
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 183 ]
      Error: Test failures
      Execution halted
    ```

# chemodiv

<details>

* Version: 0.2.0
* GitHub: https://github.com/hpetren/chemodiv
* Source code: https://github.com/cran/chemodiv
* Date/Publication: 2023-01-12 09:30:06 UTC
* Number of recursive dependencies: 168

Run `revdepcheck::cloud_details(, "chemodiv")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘chemodiv-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: molNet
    > ### Title: Generate a molecular network with some properties
    > ### Aliases: molNet
    > 
    > ### ** Examples
    > 
    > data(minimalCompDis)
    > data(minimalNPCTable)
    > molNet(minimalCompDis, minimalNPCTable, cutOff = 0)
    Using cut-off value = 0
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: molNet ... graph_from_edgelist -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. └─chemodiv::molNet(testCompDis) at test-molNetPlot.R:15:0
       2.   └─tidygraph::tbl_graph(nodes = nodes, edges = links)
       3.     ├─tidygraph::as_tbl_graph(...)
       4.     └─tidygraph:::as_tbl_graph.list(...)
       5.       └─tidygraph:::as_graph_node_edge(x, directed = directed, node_key = node_key)
       6.         └─igraph::graph_from_edgelist(as.matrix(edges[, 1:2]), directed = directed)
       7.           └─igraph::make_graph(t(el), directed = directed)
       8.             ├─base::do.call(old_graph, args)
       9.             └─igraph (local) `<fn>`(`<int[,4]>`, directed = TRUE)
      
      [ FAIL 2 | WARN 0 | SKIP 3 | PASS 75 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘chemodiv-vignette.Rmd’ using rmarkdown
    
    Quitting from lines 313-318 [unnamed-chunk-16] (chemodiv-vignette.Rmd)
    Error: processing vignette 'chemodiv-vignette.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘chemodiv-vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘chemodiv-vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# cholera

<details>

* Version: 0.8.0
* GitHub: https://github.com/lindbrook/cholera
* Source code: https://github.com/cran/cholera
* Date/Publication: 2023-03-01 12:40:02 UTC
* Number of recursive dependencies: 97

Run `revdepcheck::cloud_details(, "cholera")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘cholera-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: addWalkingPath
    > ### Title: Add the shortest walking path between a selected cases or pumps.
    > ### Aliases: addWalkingPath
    > 
    > ### ** Examples
    > 
    > streetNameLocator("broad street", zoom = TRUE, highlight = FALSE,
    +   add.subtitle = FALSE)
    > addWalkingPath(447)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: addWalkingPath ... do.call -> nodeData -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘duplicate.missing.cases.Rmd’ using rmarkdown
    --- finished re-building ‘duplicate.missing.cases.Rmd’
    
    --- re-building ‘kernel.density.Rmd’ using rmarkdown
    
    Quitting from lines 40-42 [unnamed-chunk-5] (kernel.density.Rmd)
    Error: processing vignette 'kernel.density.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘kernel.density.Rmd’
    ...
    --- finished re-building ‘time.series.Rmd’
    
    --- re-building ‘unstacking.bars.Rmd’ using rmarkdown
    --- finished re-building ‘unstacking.bars.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘kernel.density.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.5Mb
      sub-directories of 1Mb or more:
        data   1.0Mb
        doc    1.5Mb
        help   2.2Mb
    ```

# CKMRpop

<details>

* Version: 0.1.3
* GitHub: NA
* Source code: https://github.com/cran/CKMRpop
* Date/Publication: 2021-07-17 10:00:06 UTC
* Number of recursive dependencies: 120

Run `revdepcheck::cloud_details(, "CKMRpop")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘CKMRpop-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: compile_related_pairs
    > ### Title: compile pairwise relationships from the samples
    > ### Aliases: compile_related_pairs
    > 
    > ### ** Examples
    > 
    > C <- compile_related_pairs(three_pops_with_mig_slurped_results$samples)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: compile_related_pairs ... <Anonymous> -> ensure_igraph -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘about_spip.Rmd’ using rmarkdown
    --- finished re-building ‘about_spip.Rmd’
    
    --- re-building ‘simple-example-with-migration.Rmd’ using rmarkdown
    
    Quitting from lines 241-262 [unnamed-chunk-14] (simple-example-with-migration.Rmd)
    Error: processing vignette 'simple-example-with-migration.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    ...
    Quitting from lines 306-307 [unnamed-chunk-20] (species_1_simulation.Rmd)
    Error: processing vignette 'species_1_simulation.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘species_1_simulation.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘simple-example-with-migration.Rmd’ ‘species_1_simulation.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.3Mb
      sub-directories of 1Mb or more:
        data   1.1Mb
        doc    3.6Mb
        help   1.0Mb
        libs   2.4Mb
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
    
    > ### Name: FuzzyMod
    > ### Title: Fuzzy Modularity of a community structure of a graph
    > ### Aliases: FuzzyMod
    > 
    > ### ** Examples
    > 
    > g <- igraph::disjoint_union(igraph::make_full_graph(5),igraph::make_full_graph(4))
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> -> unlist -> lapply -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘CliquePercolation.Rmd’ using rmarkdown
    
    Quitting from lines 110-112 [unnamed-chunk-5] (CliquePercolation.Rmd)
    Error: processing vignette 'CliquePercolation.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘CliquePercolation.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘CliquePercolation.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# ClustAssess

<details>

* Version: 0.3.0
* GitHub: https://github.com/Core-Bioinformatics/ClustAssess
* Source code: https://github.com/cran/ClustAssess
* Date/Publication: 2022-01-26 16:52:46 UTC
* Number of recursive dependencies: 160

Run `revdepcheck::cloud_details(, "ClustAssess")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ClustAssess-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: element_sim
    > ### Title: The Element-Centric Clustering Similarity
    > ### Aliases: element_sim
    > 
    > ### ** Examples
    > 
    > km.res = kmeans(mtcars, 3)$cluster
    > hc.res = hclust(dist(mtcars))
    > element_sim(km.res, hc.res)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: element_sim ... make_cielg_hierarchical -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘ClustAssess.Rmd’ using rmarkdown
    --- finished re-building ‘ClustAssess.Rmd’
    
    --- re-building ‘comparing-soft-and-hierarchical.Rmd’ using rmarkdown
    
    Quitting from lines 76-100 [ecs] (comparing-soft-and-hierarchical.Rmd)
    Error: processing vignette 'comparing-soft-and-hierarchical.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘comparing-soft-and-hierarchical.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘comparing-soft-and-hierarchical.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# ClusTorus

<details>

* Version: 0.2.2
* GitHub: https://github.com/sungkyujung/ClusTorus
* Source code: https://github.com/cran/ClusTorus
* Date/Publication: 2022-01-04 10:10:05 UTC
* Number of recursive dependencies: 131

Run `revdepcheck::cloud_details(, "ClusTorus")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ClusTorus-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: cluster.assign.torus
    > ### Title: Clustering by connected components of ellipsoids
    > ### Aliases: cluster.assign.torus plot.cluster.obj
    > 
    > ### ** Examples
    > 
    > data <- toydata1[, 1:2]
    ...
    +                        kmeansfitmethod = "general",
    +                        J = 4, concentration = 25)
    ellip.kmeans.torus: fitting appr. mixture, J = 4, option = general.Done
    > level <- 0.1
    > 
    > cluster.assign.torus(icp.torus, level = level)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: cluster.assign.torus ... conn.comp.ellipse -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘ClusTorus.Rmd’ using rmarkdown
    
    Quitting from lines 59-62 [unnamed-chunk-4] (ClusTorus.Rmd)
    Error: processing vignette 'ClusTorus.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘ClusTorus.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘ClusTorus.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# clustree

<details>

* Version: 0.5.0
* GitHub: https://github.com/lazappi/clustree
* Source code: https://github.com/cran/clustree
* Date/Publication: 2022-06-25 20:50:02 UTC
* Number of recursive dependencies: 185

Run `revdepcheck::cloud_details(, "clustree")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘clustree-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: clustree
    > ### Title: Plot a clustering tree
    > ### Aliases: clustree clustree.matrix clustree.data.frame
    > ###   clustree.SingleCellExperiment clustree.seurat clustree.Seurat
    > 
    > ### ** Examples
    > 
    > data(nba_clusts)
    > clustree(nba_clusts, prefix = "K")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: clustree ... graph_from_edgelist -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        6.   ├─clustree::clustree(...)
        7.   └─clustree:::clustree.matrix(...)
        8.     └─clustree:::build_tree_graph(...)
        9.       └─tidygraph::tbl_graph(nodes = nodes, edges = edges)
       10.         ├─tidygraph::as_tbl_graph(...)
       11.         └─tidygraph:::as_tbl_graph.list(...)
       12.           └─tidygraph:::as_graph_node_edge(x, directed = directed, node_key = node_key)
       13.             └─igraph::graph_from_edgelist(as.matrix(edges[, 1:2]), directed = directed)
       14.               └─igraph::make_graph(t(el), directed = directed)
       15.                 ├─base::do.call(old_graph, args)
       16.                 └─igraph (local) `<fn>`(`<int[,17]>`, directed = TRUE)
      
      [ FAIL 59 | WARN 4 | SKIP 0 | PASS 13 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘clustree.Rmd’ using rmarkdown
    
    Quitting from lines 81-82 [nba-plot] (clustree.Rmd)
    Error: processing vignette 'clustree.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘clustree.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘clustree.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# clustringr

<details>

* Version: 1.0
* GitHub: NA
* Source code: https://github.com/cran/clustringr
* Date/Publication: 2019-03-30 16:10:03 UTC
* Number of recursive dependencies: 54

Run `revdepcheck::cloud_details(, "clustringr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘clustringr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: cluster_plot
    > ### Title: Plot string clusters as graph.
    > ### Aliases: cluster_plot
    > 
    > ### ** Examples
    > 
    > s_vec <- c("alcool","alcohol","alcoholic","brandy","brandie","cachaça")
    > s_clust <- cluster_strings(s_vec,method="lv",max_dist=3,algo="cc")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: cluster_strings ... graph_from_adjacency_matrix -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘stringi’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 5626 marked UTF-8 strings
    ```

# CoDiNA

<details>

* Version: 1.1.2
* GitHub: NA
* Source code: https://github.com/cran/CoDiNA
* Date/Publication: 2020-07-15 12:30:02 UTC
* Number of recursive dependencies: 50

Run `revdepcheck::cloud_details(, "CoDiNA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘CoDiNA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as.igraph
    > ### Title: as.igraph
    > ### Aliases: as.igraph
    > 
    > ### ** Examples
    > 
    > suppressWarnings(RNGversion("3.5.0"))
    ...
    Coding the groups.
    Recode is done!
    > Graph = plot(x = DiffNet,
    +  layout = NULL, smooth.edges = TRUE,
    +  path = NULL, MakeGroups = FALSE, Cluster = FALSE,
    +  legend = TRUE, manipulation = FALSE, sort.by.Phi = FALSE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot -> plot.CoDiNA -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

# comato

<details>

* Version: 1.1
* GitHub: NA
* Source code: https://github.com/cran/comato
* Date/Publication: 2018-03-02 16:36:47 UTC
* Number of recursive dependencies: 22

Run `revdepcheck::cloud_details(, "comato")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘comato-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as.matrix.conceptmaps
    > ### Title: Convert a conceptmaps object to a matrix
    > ### Aliases: as.matrix.conceptmaps
    > 
    > ### ** Examples
    > 
    > data = rbind(
    ...
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    ```

# concatipede

<details>

* Version: 1.0.1
* GitHub: https://github.com/tardipede/concatipede
* Source code: https://github.com/cran/concatipede
* Date/Publication: 2021-08-06 18:10:05 UTC
* Number of recursive dependencies: 128

Run `revdepcheck::cloud_details(, "concatipede")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘concatipede-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: auto_match_seqs
    > ### Title: Build a template table with automatically matched sequence names
    > ### Aliases: auto_match_seqs
    > 
    > ### ** Examples
    > 
    > xlsx_file <- concatipede_example("sequences-test-matching.xlsx")
    > xlsx_template <- readxl::read_xlsx(xlsx_file)
    > auto_match_seqs(xlsx_template)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: auto_match_seqs -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       7.     └─igraph::make_empty_graph(n = 0, directed = directed)
      ── Error ('test-integration.R:61:5'): Functions work well together (medium pipeline 2) ──
      Error in `eval(code, test_env)`: !file.exists("my-template.xlsx") is not TRUE
      Backtrace:
          ▆
       1. └─base::stopifnot(!file.exists("my-template.xlsx")) at test-integration.R:61:4
      ── Error ('test-integration.R:80:5'): Functions work well together (long pipeline) ──
      Error in `eval(code, test_env)`: !file.exists("my-template.xlsx") is not TRUE
      Backtrace:
          ▆
       1. └─base::stopifnot(!file.exists("my-template.xlsx")) at test-integration.R:80:4
      
      [ FAIL 5 | WARN 0 | SKIP 0 | PASS 31 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Package-usage.Rmd’ using rmarkdown
    Warning in in_dir(input_dir(), expr) :
      You changed the working directory to /tmp/workdir/concatipede/new/concatipede.Rcheck/vign_test/concatipede/vignettes/concatipede_test (probably via setwd()). It will be restored to /tmp/workdir/concatipede/new/concatipede.Rcheck/vign_test/concatipede/vignettes. See the Note section in ?knitr::knit
    
    Quitting from lines 173-181 [unnamed-chunk-15] (Package-usage.Rmd)
    Error: processing vignette 'Package-usage.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘Package-usage.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Package-usage.Rmd’
    
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
    > rownames(a) <- c("a", "b", "c", "d")
    > colnames(a) <- c("a", "b", "c", "d")
    > a.igraph <- igraph::graph_from_adjacency_matrix(a)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

# CoNI

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/CoNI
* Date/Publication: 2021-09-30 09:10:02 UTC
* Number of recursive dependencies: 128

Run `revdepcheck::cloud_details(, "CoNI")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘CoNI-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: NetStats
    > ### Title: Network Statistics
    > ### Aliases: NetStats
    > 
    > ### ** Examples
    > 
    > #Load color nodes table
    ...
    > HFDNetwork<-generate_network(ResultsCoNI = CoNIResultsHFDToy,
    +                              colorVertexNetwork = TRUE,
    +                              colorVertexTable = MetColorTable,
    +                              outputDir = "./",
    +                              outputFileName = "HFD",
    +                              saveFiles = FALSE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: generate_network -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Full_RunCoNI.Rmd’ using rmarkdown
    
    Quitting from lines 133-138 [network_chow] (Full_RunCoNI.Rmd)
    Error: processing vignette 'Full_RunCoNI.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘Full_RunCoNI.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Full_RunCoNI.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# corTest

<details>

* Version: 1.0.7
* GitHub: NA
* Source code: https://github.com/cran/corTest
* Date/Publication: 2020-09-25 15:30:02 UTC
* Number of recursive dependencies: 33

Run `revdepcheck::cloud_details(, "corTest")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘corTest-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: construct_network
    > ### Title: Construct Differential Correlation Network
    > ### Aliases: construct_network
    > ### Keywords: correlation test
    > 
    > ### ** Examples
    > 
    ...
    +                   cor_method = "st5",
    +                   pseudo_adjust_cutoff = FALSE,
    +                   var.grp = "grp",
    +                   pAdjMethod = 'fdr',
    +                   cutoff = 0.05,
    +                   nPseudo = 25)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: construct_network -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘graphics’
      All declared Imports should be used.
    ```

# countland

<details>

* Version: 0.1.1
* GitHub: NA
* Source code: https://github.com/cran/countland
* Date/Publication: 2022-08-17 06:40:06 UTC
* Number of recursive dependencies: 194

Run `revdepcheck::cloud_details(, "countland")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘countland-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: Cluster
    > ### Title: Perform spectral clustering on dot products.
    > ### Aliases: Cluster
    > 
    > ### ** Examples
    > 
    > gold_path <- system.file("testdata", package = "countland", mustWork = TRUE)
    ...
    the fraction of entries that are nonzero is 0.4074
    > C <- Dot(C)
    Calculating dot products between rows...
        done.
    > C <- Embed(C,n_components=5)
    Performing spectral embedding on dot products...
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: Embed ... <Anonymous> -> graph.adjacency.sparse -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Error ('test-countland_shared_counts.R:13:3'): function PlotSharedCounts, returns plot object ──
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─countland::SharedCounts(C, n_clusters = 2, n_cells = 10, subsample = F) at test-countland_shared_counts.R:13:2
       2.   └─countland:::ScikitManifoldSpectralEmbedding(C@sharedcounts, n_clusters)
       3.     ├─igraph::as.undirected(igraph::graph.adjacency(A, weighted = T))
       4.     │ └─igraph:::ensure_igraph(graph)
       5.     └─igraph::graph.adjacency(A, weighted = T)
       6.       └─igraph:::graph.adjacency.sparse(...)
       7.         └─igraph::make_empty_graph(n = vc, directed = (mode == "directed"))
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 59 ]
      Error: Test failures
      Execution halted
    ```

# cppRouting

<details>

* Version: 3.1
* GitHub: https://github.com/vlarmet/cppRouting
* Source code: https://github.com/cran/cppRouting
* Date/Publication: 2022-12-01 13:20:02 UTC
* Number of recursive dependencies: 40

Run `revdepcheck::cloud_details(, "cppRouting")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘cppRouting-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: cpp_simplify
    > ### Title: Reduce the number of edges by removing non-intersection nodes,
    > ###   duplicated edges and isolated loops in the graph.
    > ### Aliases: cpp_simplify
    > 
    > ### ** Examples
    > 
    ...
    > 
    > #Plot
    > if(requireNamespace("igraph",quietly = TRUE)){
    + igr<-igraph::graph_from_data_frame(edges)
    + plot(igr)
    + }
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> -> make_empty_graph
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 16.4Mb
      sub-directories of 1Mb or more:
        libs  16.2Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘RcppProgress’
      All declared Imports should be used.
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# crandep

<details>

* Version: 0.3.1
* GitHub: https://github.com/clement-lee/crandep
* Source code: https://github.com/cran/crandep
* Date/Publication: 2022-06-03 08:30:10 UTC
* Number of recursive dependencies: 70

Run `revdepcheck::cloud_details(, "crandep")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘crandep-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: df_to_graph
    > ### Title: Construct the giant component of the network from two data
    > ###   frames
    > ### Aliases: df_to_graph
    > 
    > ### ** Examples
    > 
    > from <- c("1", "2", "4")
    > to <- c("2", "3", "5")
    > edges <- data.frame(from = from, to = to, stringsAsFactors = FALSE)
    > nodes <- data.frame(name = c("1", "2", "3", "4", "5"), stringsAsFactors = FALSE)
    > df_to_graph(edges, nodes)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: df_to_graph -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.1Mb
      sub-directories of 1Mb or more:
        data   1.2Mb
        doc    2.3Mb
        libs   3.5Mb
    ```

# cranly

<details>

* Version: 0.6.0
* GitHub: https://github.com/ikosmidis/cranly
* Source code: https://github.com/cran/cranly
* Date/Publication: 2022-08-26 22:14:41 UTC
* Number of recursive dependencies: 64

Run `revdepcheck::cloud_details(, "cranly")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘cranly.Rmd’ using rmarkdown
    
    Quitting from lines 63-65 [unnamed-chunk-7] (cranly.Rmd)
    Error: processing vignette 'cranly.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘cranly.Rmd’
    
    --- re-building ‘dependence_trees.Rmd’ using rmarkdown
    ...
    --- failed re-building ‘dependence_trees.Rmd’
    
    --- re-building ‘extractors.Rmd’ using rmarkdown
    --- finished re-building ‘extractors.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘cranly.Rmd’ ‘dependence_trees.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.4Mb
      sub-directories of 1Mb or more:
        doc   5.1Mb
    ```

# criticalpath

<details>

* Version: 0.2.1
* GitHub: https://github.com/rubens2005/criticalpath
* Source code: https://github.com/cran/criticalpath
* Date/Publication: 2022-03-13 22:40:10 UTC
* Number of recursive dependencies: 88

Run `revdepcheck::cloud_details(, "criticalpath")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘criticalpath-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: sch_activities
    > ### Title: Activities
    > ### Aliases: sch_activities
    > 
    > ### ** Examples
    > 
    > sch <- sch_new() %>%
    ...
    +   sch_add_activity( 10L, "a10", 3L, 12) %>%
    +   sch_add_activity( 11L, "a11", 3L, 12) %>%
    +   sch_add_activity( 12L, "a12", 0L) %>%
    +   sch_plan()
    Error in sch_plan(.) : 
      The schedule is invalid!!! To view the problem, execute:
    
             `validation <- sch_validate(sch)`
    Calls: %>% -> sch_plan
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. ├─testthat::expect_silent(sch1 <- sch_plan(sch)) at test-cpt-validate_schedule.R:17:2
       2. │ └─testthat:::quasi_capture(enquo(object), NULL, evaluate_promise)
       3. │   ├─testthat (local) .capture(...)
       4. │   │ ├─withr::with_output_sink(...)
       5. │   │ │ └─base::force(code)
       6. │   │ ├─base::withCallingHandlers(...)
       7. │   │ └─base::withVisible(code)
       8. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
       9. └─criticalpath::sch_plan(sch)
      
      [ FAIL 98 | WARN 0 | SKIP 0 | PASS 162 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘criticalpath-introduction.Rmd’ using rmarkdown
    
    Quitting from lines 95-117 [unnamed-chunk-2] (criticalpath-introduction.Rmd)
    Error: processing vignette 'criticalpath-introduction.Rmd' failed with diagnostics:
    The schedule is invalid!!! To view the problem, execute:
    
             `validation <- sch_validate(sch)`
    --- failed re-building ‘criticalpath-introduction.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘criticalpath-introduction.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# crosstalkr

<details>

* Version: 1.0.2
* GitHub: NA
* Source code: https://github.com/cran/crosstalkr
* Date/Publication: 2023-05-18 17:50:02 UTC
* Number of recursive dependencies: 167

Run `revdepcheck::cloud_details(, "crosstalkr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘crosstalkr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: compute_crosstalk
    > ### Title: Identify proteins with a statistically significant relationship
    > ###   to user-provided seeds.
    > ### Aliases: compute_crosstalk
    > 
    > ### ** Examples
    > 
    > #2) Also works for any other kind of graph- just specify g (must be igraph formatted as of now)
    > g <- igraph::sample_gnp(n = 1000, p = 10/1000)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─igraph::graph_from_adjacency_matrix(w) at test-filter.R:11:0
       2.   └─igraph:::graph.adjacency.dense(...)
      ── Error ('test-plot.R:11:1'): (code run outside of `test_that()`) ─────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─igraph::graph_from_adjacency_matrix(w) at test-plot.R:11:0
       2.   └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 4 | WARN 0 | SKIP 11 | PASS 36 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘crosstalkr_vignette.Rmd’ using rmarkdown
    
    Quitting from lines 79-84 [filter] (crosstalkr_vignette.Rmd)
    Error: processing vignette 'crosstalkr_vignette.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘crosstalkr_vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘crosstalkr_vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# cytometree

<details>

* Version: 2.0.2
* GitHub: https://github.com/sistm/Cytometree
* Source code: https://github.com/cran/cytometree
* Date/Publication: 2019-12-04 22:20:19 UTC
* Number of recursive dependencies: 63

Run `revdepcheck::cloud_details(, "cytometree")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘cytometree-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: CytomeTree
    > ### Title: Binary tree algorithm for cytometry data analysis.
    > ### Aliases: CytomeTree
    > 
    > ### ** Examples
    > 
    > head(DLBCL)
    ...
    > # Choose a node to plot
    > plot_nodes(Tree,"FL4.1")
    > 
    > # Plot a graph of the tree
    > par(mfrow=c(1,1))
    > plot_graph(Tree,edge.arrow.size=.3, Vcex =.5, vertex.size = 30)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot_graph -> graph.data.frame -> make_empty_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘autogating_cytometree.Rmd’ using rmarkdown
    
    Quitting from lines 80-82 [unnamed-chunk-4] (autogating_cytometree.Rmd)
    Error: processing vignette 'autogating_cytometree.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘autogating_cytometree.Rmd’
    
    --- re-building ‘cytoftree.Rmd’ using rmarkdown
    --- finished re-building ‘cytoftree.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘autogating_cytometree.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# d3po

<details>

* Version: 0.3.4
* GitHub: https://github.com/pachadotdev/d3po
* Source code: https://github.com/cran/d3po
* Date/Publication: 2023-03-03 20:20:02 UTC
* Number of recursive dependencies: 56

Run `revdepcheck::cloud_details(, "d3po")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘d3po-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: d3po_graph
    > ### Title: Graph
    > ### Aliases: d3po_graph po_nodes po_edges po_layout
    > 
    > ### ** Examples
    > 
    > tr <- igraph::make_tree(40, children = 3, mode = "undirected")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous>
    Execution halted
    ```

# dartR

<details>

* Version: 2.9.7
* GitHub: NA
* Source code: https://github.com/cran/dartR
* Date/Publication: 2023-06-07 10:40:02 UTC
* Number of recursive dependencies: 285

Run `revdepcheck::cloud_details(, "dartR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dartR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: gl.grm.network
    > ### Title: Represents a genomic relationship matrix (GRM) as a network
    > ### Aliases: gl.grm.network
    > 
    > ### ** Examples
    > 
    > if (requireNamespace("igraph", quietly = TRUE) & requireNamespace("rrBLUP",
    ...
    Completed: gl.subsample.loci 
    Starting gl.grm 
      Processing genlight object with SNP data
    Completed: gl.grm 
    Starting gl.grm.network 
      Processing genlight object with SNP data
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: gl.grm.network -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘dartRTutorials.Rmd’ using rmarkdown
    A new version of TeX Live has been released. If you need to install or update any LaTeX packages, you have to upgrade TinyTeX with tinytex::reinstall_tinytex(repository = "illinois").
    
    tlmgr: Local TeX Live (2022) is older than remote repository (2023).
    Cross release updates are only supported with
      update-tlmgr-latest(.sh/.exe) --update
    See https://tug.org/texlive/upgrade.html for details.
    Warning in system2("tlmgr", args, ...) :
    ...
    
    Error: processing vignette 'dartRTutorials.Rmd' failed with diagnostics:
    LaTeX failed to compile /tmp/workdir/dartR/new/dartR.Rcheck/vign_test/dartR/vignettes/dartRTutorials.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See dartRTutorials.log for more info.
    --- failed re-building ‘dartRTutorials.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘dartRTutorials.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# data.tree

<details>

* Version: 1.0.0
* GitHub: https://github.com/gluc/data.tree
* Source code: https://github.com/cran/data.tree
* Date/Publication: 2020-08-03 15:50:02 UTC
* Number of recursive dependencies: 122

Run `revdepcheck::cloud_details(, "data.tree")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
          ▆
       1. └─data.tree::as.igraph.Node(acme, "p", c("level", "isLeaf"), directed = FALSE) at test-treeConversionigraph.R:6:2
       2.   └─igraph::graph_from_data_frame(data, directed = directed, vertices = vert)
       3.     └─igraph::make_empty_graph(n = 0, directed = directed)
      ── Error ('test-treeConversionigraph.R:15:3'): as.Node.igraph directed ─────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─data.tree::as.igraph.Node(acme, "p", c("level", "isLeaf"), directed = TRUE) at test-treeConversionigraph.R:15:2
       2.   └─igraph::graph_from_data_frame(data, directed = directed, vertices = vert)
       3.     └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 370 ]
      Error: Test failures
      Execution halted
    ```

# DDPNA

<details>

* Version: 0.3.1
* GitHub: https://github.com/liukf10/DDPNA
* Source code: https://github.com/cran/DDPNA
* Date/Publication: 2022-05-17 12:20:02 UTC
* Number of recursive dependencies: 155

Run `revdepcheck::cloud_details(, "DDPNA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘DDPNA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: getmoduleHub
    > ### Title: getmoduleHub
    > ### Aliases: getmoduleHub
    > 
    > ### ** Examples
    > 
    > data(net)
    ...
    > data <- imputedData
    > logD <- data$log2_value
    > rownames(logD) <- data$inf$ori.ID
    > group <- gsub("[0-9]+","", colnames(logD))
    > Module <- Module_inf(net, data$inf)
    > Mod10 <- getmoduleHub(logD, Module, 10, coln = "ori.ID", adjustp = FALSE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: getmoduleHub -> graph.data.frame -> make_empty_graph
    Execution halted
    ```

# deaR

<details>

* Version: 1.4.1
* GitHub: NA
* Source code: https://github.com/cran/deaR
* Date/Publication: 2023-05-02 09:20:02 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::cloud_details(, "deaR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘deaR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot.dea
    > ### Title: Plot for DEA models.
    > ### Aliases: plot.dea
    > 
    > ### ** Examples
    > 
    > data_example <- make_deadata(datadea = Fortune500,
    +                              inputs = 2:4, 
    +                              outputs = 5:6)
    > result <- model_basic(data_example)
    > plot(result)
    Press [enter] to continue
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... plot.dea -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

# deepdep

<details>

* Version: 0.4.2
* GitHub: https://github.com/DominikRafacz/deepdep
* Source code: https://github.com/cran/deepdep
* Date/Publication: 2023-02-21 00:10:05 UTC
* Number of recursive dependencies: 145

Run `revdepcheck::cloud_details(, "deepdep")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Error ('test-plot.R:17:1'): (code run outside of `test_that()`) ─────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─vcr::use_cassette(...) at test-plot.R:17:0
       2. │ └─cassette$call_block(...)
       3. ├─deepdep::plot_dependencies(dd_rlang) at test-plot.R:19:2
       4. └─deepdep:::plot_dependencies.deepdep(dd_rlang)
       5.   └─igraph::make_graph(edges = c(), n = 1)
       6.     ├─base::do.call(old_graph, args)
       7.     └─igraph (local) `<fn>`(`<dbl>`, n = 1)
      
      [ FAIL 3 | WARN 0 | SKIP 1 | PASS 23 ]
      Error: Test failures
      Execution halted
    ```

# degreenet

<details>

* Version: 1.3-3
* GitHub: NA
* Source code: https://github.com/cran/degreenet
* Date/Publication: 2018-03-26 07:38:43 UTC
* Number of recursive dependencies: 18

Run `revdepcheck::cloud_details(, "degreenet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘degreenet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: reedmolloy
    > ### Title: Generate a (non-random) network with a given degree sequence
    > ### Aliases: reedmolloy
    > ### Keywords: models
    > 
    > ### ** Examples
    > 
    ...
    > s4 <- simpln(n=100, v=c(-1,1))
    > table(s4)
    s4
     1  2  3  4  5  6 
    65 18  7  4  4  2 
    > #
    > simr <- reedmolloy(s4)
    Error in reedmolloy(s4) : 
      The reedmolloy function failed to form a valid network from the passed degree sequence.
    Execution halted
    ```

# delayed

<details>

* Version: 0.4.0
* GitHub: https://github.com/tlverse/delayed
* Source code: https://github.com/cran/delayed
* Date/Publication: 2022-10-19 22:25:09 UTC
* Number of recursive dependencies: 81

Run `revdepcheck::cloud_details(, "delayed")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘delayed-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot.Delayed
    > ### Title: Plot Method for Delayed Objects
    > ### Aliases: plot.Delayed
    > 
    > ### ** Examples
    > 
    > adder <- function(x, y) {
    ...
    > delayed_adder <- delayed_fun(adder)
    > z <- delayed_adder(3, 4)
    > z2 <- delayed_adder(z, 4)
    > z2$sequential <- TRUE
    > z3 <- delayed_adder(z2, z)
    > plot(z3)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot -> plot.Delayed -> make_graph -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      • empty test (1)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_make_graph.R:18:3'): can plot graph ────────────────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─base::plot(z3) at test_make_graph.R:18:2
       2. └─delayed:::plot.Delayed(z3)
       3.   └─delayed:::make_graph(x)
       4.     └─igraph::make_empty_graph()
      
      [ FAIL 1 | WARN 0 | SKIP 1 | PASS 12 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘delayed.Rmd’ using rmarkdown
    
    Quitting from lines 97-98 [unnamed-chunk-2] (delayed.Rmd)
    Error: processing vignette 'delayed.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘delayed.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘delayed.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# DemoKin

<details>

* Version: 1.0.3
* GitHub: https://github.com/IvanWilli/DemoKin
* Source code: https://github.com/cran/DemoKin
* Date/Publication: 2023-06-05 09:00:02 UTC
* Number of recursive dependencies: 77

Run `revdepcheck::cloud_details(, "DemoKin")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Reference_OneSex.Rmd’ using rmarkdown
    
    Quitting from lines 119-123 [unnamed-chunk-10] (Reference_OneSex.Rmd)
    Error: processing vignette 'Reference_OneSex.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘Reference_OneSex.Rmd’
    
    --- re-building ‘Reference_TwoSex.Rmd’ using rmarkdown
    --- finished re-building ‘Reference_TwoSex.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Reference_OneSex.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.8Mb
      sub-directories of 1Mb or more:
        data   1.2Mb
        doc    3.1Mb
        help   1.3Mb
    ```

# dexterMST

<details>

* Version: 0.9.3
* GitHub: https://github.com/dexter-psychometrics/dexter
* Source code: https://github.com/cran/dexterMST
* Date/Publication: 2022-02-14 19:40:13 UTC
* Number of recursive dependencies: 91

Run `revdepcheck::cloud_details(, "dexterMST")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dexterMST-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: create_mst_test
    > ### Title: Define a new multi stage test
    > ### Aliases: create_mst_test
    > 
    > ### ** Examples
    > 
    > # extended example
    ...
    > 
    > add_response_data_mst(db, dat)
    Added 90000 responses for 3000 administrations
    > 
    > 
    > design_plot(db)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: design_plot ... ensure_igraph -> graph.data.frame -> make_empty_graph
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.3Mb
      sub-directories of 1Mb or more:
        libs   5.7Mb
    ```

# DiagrammeR

<details>

* Version: 1.0.10
* GitHub: https://github.com/rich-iannone/DiagrammeR
* Source code: https://github.com/cran/DiagrammeR
* Date/Publication: 2023-05-18 14:30:07 UTC
* Number of recursive dependencies: 99

Run `revdepcheck::cloud_details(, "DiagrammeR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘DiagrammeR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_full_graph
    > ### Title: Add a fully connected graph
    > ### Aliases: add_full_graph
    > 
    > ### ** Examples
    > 
    > # Create a new graph object
    ...
    > # and to themselves
    > graph <-
    +   create_graph() %>%
    +   add_full_graph(
    +     n = 3, keep_loops = TRUE
    +   )
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: %>% ... from_adj_matrix -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Error ('test-write_graph_backup.R:922:3'): Graph backups for `recode_node_attrs()` works ──
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─... %>% ... at test-write_graph_backup.R:922:2
       2. ├─DiagrammeR::recode_node_attrs(...)
       3. │ └─DiagrammeR:::graph_object_valid(graph)
       4. │   └─... %in% names(graph)
       5. ├─DiagrammeR::set_node_attrs(...)
       6. └─DiagrammeR::add_gnm_graph(., n = 5, m = 10, set_seed = 23)
       7.   └─igraph::sample_gnm(n = n, m = m, directed = graph_directed, loops = loops)
      
      [ FAIL 109 | WARN 3 | SKIP 0 | PASS 1373 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# diffeRenTES

<details>

* Version: 0.3.2
* GitHub: NA
* Source code: https://github.com/cran/diffeRenTES
* Date/Publication: 2022-04-28 07:20:04 UTC
* Number of recursive dependencies: 60

Run `revdepcheck::cloud_details(, "diffeRenTES")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘diffeRenTES-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: getTESs
    > ### Title: Compute TES
    > ### Aliases: getTESs
    > 
    > ### ** Examples
    > 
    > 
    > net <- BoolNet::generateRandomNKNetwork(10, 2)
    > attractors <- BoolNet::getAttractors(net)
    > ATM <- getATM(net, attractors)
    > getTESs(ATM)
    In the ATM there is no threshold value equal to 0, it will be added for the calculation of TESs
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: getTESs -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Loading required package: diffeRenTES
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 20 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('tests-atm.R:17:3'): TES tests working ───────────────────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─diffeRenTES::getTESs(a) at tests-atm.R:17:2
       2.   └─igraph::graph_from_adjacency_matrix(adj_mtrx, mode = "directed")
       3.     └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 20 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘diffeRenTES_vignette.Rmd’ using rmarkdown
    
    Quitting from lines 67-75 [unnamed-chunk-5] (diffeRenTES_vignette.Rmd)
    Error: processing vignette 'diffeRenTES_vignette.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘diffeRenTES_vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘diffeRenTES_vignette.Rmd’
    
    Error: Vignette re-building failed.
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

*   checking examples ... ERROR
    ```
    Running examples in ‘diffudist-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_distance_matrix
    > ### Title: Diffusion Distance Matrix
    > ### Aliases: get_distance_matrix getDistanceMatrix get_DDM
    > ### Keywords: diffusion distance
    > 
    > ### ** Examples
    > 
    > g <- igraph::sample_pa(10, directed = FALSE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous>
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.1Mb
      sub-directories of 1Mb or more:
        libs   4.1Mb
    ```

# diffusr

<details>

* Version: 0.1.4
* GitHub: https://github.com/dirmeier/diffusr
* Source code: https://github.com/cran/diffusr
* Date/Publication: 2018-05-17 21:01:21 UTC
* Number of recursive dependencies: 65

Run `revdepcheck::cloud_details(, "diffusr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘diffusr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: random.walk
    > ### Title: Graph diffusion using a Markov random walk
    > ### Aliases: random.walk random.walk,numeric,matrix-method
    > ###   random.walk,matrix,matrix-method
    > 
    > ### ** Examples
    > 
    ...
    >  # adjacency matrix (either normalized or not)
    >  graph <- matrix(abs(rnorm(n*n)), n, n)
    >  # computation of stationary distribution
    >  pt    <- random.walk(p0, graph)
    setting diag of graph to zero
    normalizing column vectors!
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: random.walk ... .is.ergodic -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. └─igraph::graph_from_adjacency_matrix(adja) at test_mrw.R:24:0
       2.   └─igraph:::graph.adjacency.dense(...)
      ── Error ('test_util.R:24:1'): (code run outside of `test_that()`) ─────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─igraph::make_graph(c(1, 2, 2, 3, 3, 4, 4, 5), directed = FALSE) at test_util.R:24:0
       2.   ├─base::do.call(old_graph, args)
       3.   └─igraph (local) `<fn>`(`<dbl>`, directed = FALSE)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 21 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘diffusr.Rmd’ using rmarkdown
    
    Quitting from lines 34-42 [unnamed-chunk-2] (diffusr.Rmd)
    Error: processing vignette 'diffusr.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘diffusr.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘diffusr.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 15.8Mb
      sub-directories of 1Mb or more:
        libs  14.8Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘methods’
      All declared Imports should be used.
    ```

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# dimRed

<details>

* Version: 0.2.6
* GitHub: https://github.com/gdkrmr/dimRed
* Source code: https://github.com/cran/dimRed
* Date/Publication: 2022-07-11 12:40:06 UTC
* Number of recursive dependencies: 132

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: embed ... construct_knn_graph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Error ('test_isomap.R:49:3'): check other.data ──────────────────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─dimRed::embed(a, "Isomap", knn = 8, ndim = 2, get_geod = TRUE) at test_isomap.R:49:2
       2. └─dimRed::embed(a, "Isomap", knn = 8, ndim = 2, get_geod = TRUE)
       3.   └─dimRed (local) .local(.data, ...)
       4.     ├─base::do.call(methodObject@fun, args)
       5.     └─dimRed (local) `<fn>`(data = `<dimRedDt>`, keep.org.data = TRUE, pars = `<named list>`)
       6.       └─dimRed:::makeKNNgraph(x = indata, k = pars$knn, eps = pars$eps)
       7.         └─igraph::make_empty_graph(M, directed = TRUE)
      
      [ FAIL 3 | WARN 8 | SKIP 7 | PASS 166 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking for unstated dependencies in examples ... WARNING
    ```
    'library' or 'require' calls not declared from:
      ‘MASS’ ‘Matrix’ ‘NNMF’ ‘RANN’ ‘RSpectra’ ‘c’ ‘coRanking’ ‘ggplot’
      ‘igraph’ ‘loe’ ‘scales’ ‘tidyr’
    ```

# discourseGT

<details>

* Version: 1.1.8
* GitHub: NA
* Source code: https://github.com/cran/discourseGT
* Date/Publication: 2022-10-27 23:25:10 UTC
* Number of recursive dependencies: 119

Run `revdepcheck::cloud_details(, "discourseGT")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘discourseGT-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: basicPlot
    > ### Title: Plot Graphs
    > ### Aliases: basicPlot
    > 
    > ### ** Examples
    > 
    > 
    > df <- sampleData1
    > prepNet <- tabulate_edges(df, iscsvfile = FALSE, silentNodes = 0)
    > baseNet <- prepareGraphs(prepNet, project_title = "Sample Data 1", weightedGraph = TRUE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: prepareGraphs -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

# discretecdAlgorithm

<details>

* Version: 0.0.7
* GitHub: NA
* Source code: https://github.com/cran/discretecdAlgorithm
* Date/Publication: 2020-03-12 06:40:02 UTC
* Number of recursive dependencies: 39

Run `revdepcheck::cloud_details(, "discretecdAlgorithm")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘discretecdAlgorithm-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: generate_discrete_data
    > ### Title: generate_discrete_data
    > ### Aliases: generate_discrete_data
    > 
    > ### ** Examples
    > 
    > 
    ...
    > nlevels <- c(3, 5, 2, 2, 3)
    > gr.params <- coef_gen(edge_list = gr, n_levels = nlevels)
    > data.obs <- discretecdAlgorithm::generate_discrete_data(graph = gr,
    +                                                         n = 100,
    +                                                         n_levels = nlevels,
    +                                                         params = gr.params)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> ... datGen_call -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       2.   └─discretecdAlgorithm:::datGen_call(...)
       3.     └─igraph::graph.adjacency(as.matrix(adj_matrix))
       4.       └─igraph:::graph.adjacency.dense(...)
      ── Error ('test-generate_discrete_data.R:41:3'): Check output ──────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─discretecdAlgorithm::generate_discrete_data(...) at test-generate_discrete_data.R:41:2
       2.   └─discretecdAlgorithm:::datGen_call(...)
       3.     └─igraph::graph.adjacency(as.matrix(adj_matrix))
       4.       └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 9 | WARN 0 | SKIP 0 | PASS 544 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 14.3Mb
      sub-directories of 1Mb or more:
        libs  14.2Mb
    ```

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# dm

<details>

* Version: 1.0.5
* GitHub: https://github.com/cynkra/dm
* Source code: https://github.com/cran/dm
* Date/Publication: 2023-03-16 17:10:02 UTC
* Number of recursive dependencies: 134

Run `revdepcheck::cloud_details(, "dm")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dm-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: copy_dm_to
    > ### Title: Copy data model to data source
    > ### Aliases: copy_dm_to
    > 
    > ### ** Examples
    > 
    > ## Don't show: 
    ...
    + 
    + DBI::dbDisconnect(con)
    + ## Don't show: 
    + }) # examplesIf
    > con <- DBI::dbConnect(RSQLite::SQLite())
    > temp_dm <- copy_dm_to(con, dm_nycflights13(), set_key_constraints = FALSE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> ... create_graph_from_dm -> %>% -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
          ▆
       1. ├─dm::copy_dm_to(...) at test_dm_from_con.R:46:2
       2. │ └─dm:::build_copy_queries(...)
       3. │   └─dm:::create_graph_from_dm(dm, directed = TRUE)
       4. │     └─... %>% ...
       5. └─igraph::graph_from_data_frame(., directed = directed, vertices = def$table)
       6.   └─igraph::make_empty_graph(n = 0, directed = directed)
      ── Error ('test-zoom.R:135:3'): zoom output for compound keys ──────────────────
      `{ ... }` threw an unexpected error.
      Message: could not find function ".igraph.status"
      Class:   simpleError/error/condition
      
      [ FAIL 41 | WARN 2 | SKIP 192 | PASS 1176 ]
      Error: Test failures
      Execution halted
    ```

# dnapath

<details>

* Version: 0.7.4
* GitHub: NA
* Source code: https://github.com/cran/dnapath
* Date/Publication: 2022-05-09 09:00:05 UTC
* Number of recursive dependencies: 149

Run `revdepcheck::cloud_details(, "dnapath")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dnapath-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dnapath
    > ### Title: Differential Network Analysis Using Gene Pathways
    > ### Aliases: dnapath
    > 
    > ### ** Examples
    > 
    > data(meso)
    ...
     7 Regulation of TP53 Degradation … 983      0.141  0.0909       8.49       8.56
     8 Regulation of TP53 Degradation … 7157     0.221  0.182       11.1       10.8 
     9 Regulation of TP53 Degradation … 80196    0.214  0.182        9.37       9.36
    10 Regulation of TP53 Degradation … 5519     0.177  0.182        9.14       9.20
    # ℹ 27 more rows
    > plot(results[[1]]) # Plot of the differential network for pathway 1.
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... <Anonymous> -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘introduction_to_dnapath.Rmd’ using rmarkdown
    
    Quitting from lines 164-165 [unnamed-chunk-3] (introduction_to_dnapath.Rmd)
    Error: processing vignette 'introduction_to_dnapath.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘introduction_to_dnapath.Rmd’
    
    --- re-building ‘package_data.Rmd’ using rmarkdown
    --- finished re-building ‘package_data.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘introduction_to_dnapath.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# dnr

<details>

* Version: 0.3.5
* GitHub: NA
* Source code: https://github.com/cran/dnr
* Date/Publication: 2020-11-30 17:10:03 UTC
* Number of recursive dependencies: 73

Run `revdepcheck::cloud_details(, "dnr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dnr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: clustCoef
    > ### Title: clustCoef
    > ### Aliases: clustCoef
    > 
    > ### ** Examples
    > 
    > clustCoef(beach[[1]][, ])
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: clustCoef ... ensure_igraph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘dnr_vignette.Rnw’ using knitr
    Warning: 'mode(width)' differs between new and previous
    	 ==> NOT changing 'width'
    Warning: 'mode(width)' differs between new and previous
    	 ==> NOT changing 'width'
    Warning: 'mode(width)' differs between new and previous
    	 ==> NOT changing 'width'
    Warning: 'mode(width)' differs between new and previous
    ...
    Quitting from lines 126-133 [beach-vertex-model-fit] (dnr_vignette.Rnw)
    Error: processing vignette 'dnr_vignette.Rnw' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘dnr_vignette.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘dnr_vignette.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# dodgr

<details>

* Version: 0.2.21
* GitHub: https://github.com/ATFutures/dodgr
* Source code: https://github.com/cran/dodgr
* Date/Publication: 2023-06-02 11:40:02 UTC
* Number of recursive dependencies: 110

Run `revdepcheck::cloud_details(, "dodgr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dodgr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dodgr_centrality
    > ### Title: Calculate betweenness centrality for a 'dodgr' network.
    > ### Aliases: dodgr_centrality
    > 
    > ### ** Examples
    > 
    > graph_full <- weight_streetnet (hampi)
    ...
      Graph has duplicated edges. Only the first will be used here,
    but it is better to remove them first with the 'dodgr_deduplicate_graph() function.
    > # 'graph' is then the contracted graph with an additional 'centrality' column
    > # Same calculation via 'igraph':
    > igr <- dodgr_to_igraph (graph)
    Loading required namespace: igraph
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: dodgr_to_igraph -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘sc-conversion-fns.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       3.     └─igraph::make_empty_graph(n = 0, directed = directed)
      ── Error ('test-graph-conversion.R:25:5'): tidyraph ────────────────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─dodgr::dodgr_to_tidygraph(graph) at test-graph-conversion.R:25:4
       2. │ ├─dodgr_to_igraph(graph) %>% tidygraph::as_tbl_graph()
       3. │ └─dodgr::dodgr_to_igraph(graph)
       4. │   └─igraph::graph_from_data_frame(graph, directed = TRUE, vertices = v)
       5. │     └─igraph::make_empty_graph(n = 0, directed = directed)
       6. └─tidygraph::as_tbl_graph(.)
      
      [ FAIL 2 | WARN 0 | SKIP 11 | PASS 242 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘dists-categorical.Rmd’ using rmarkdown
    --- finished re-building ‘dists-categorical.Rmd’
    
    --- re-building ‘dodgr.Rmd’ using rmarkdown
    
    Quitting from lines 501-502 [compare-heaps] (dodgr.Rmd)
    Error: processing vignette 'dodgr.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    ...
    --- finished re-building ‘parallel.Rmd’
    
    --- re-building ‘times.Rmd’ using rmarkdown
    --- finished re-building ‘times.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘dodgr.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 35.2Mb
      sub-directories of 1Mb or more:
        doc    6.5Mb
        libs  28.1Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# dosearch

<details>

* Version: 1.0.8
* GitHub: NA
* Source code: https://github.com/cran/dosearch
* Date/Publication: 2021-08-19 16:40:02 UTC
* Number of recursive dependencies: 15

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
    > ## Graph input using 'igraph' in the 'causaleffect' syntax
    > if (requireNamespace("igraph", quietly = TRUE)) {
    +   g_igraph <- igraph::graph.formula(x -+ z, z -+ y, x -+ y, y -+ x)
    +   g_igraph <- igraph::set.edge.attribute(g_igraph, "description", 3:4, "U")
    +   dosearch(data2, query2, g_igraph)
    + }
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> ... graph_from_literal_i -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.4Mb
      sub-directories of 1Mb or more:
        libs   6.2Mb
    ```

# dragon

<details>

* Version: 1.2.1
* GitHub: https://github.com/sjspielman/dragon
* Source code: https://github.com/cran/dragon
* Date/Publication: 2022-04-08 08:42:33 UTC
* Number of recursive dependencies: 130

Run `revdepcheck::cloud_details(, "dragon")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        5. │       └─testthat:::test_files_setup_state(...)
        6. │         └─testthat::source_test_setup(".", env)
        7. │           └─testthat::source_dir(path, "^setup.*\\.[rR]$", env = env, wrap = FALSE)
        8. │             └─base::lapply(...)
        9. │               └─testthat (local) FUN(X[[i]], ...)
       10. │                 └─testthat::source_file(path, env = env, chdir = chdir, wrap = wrap)
       11. │                   ├─base::withCallingHandlers(...)
       12. │                   └─base::eval(exprs, env)
       13. │                     └─base::eval(exprs, env)
       14. │                       └─igraph::read_graph("graph_by_redox.igraph", format = "ncol") at tests/testthat/setup_test-settings.R:8:0
       15. │                         └─igraph:::read.graph.ncol(file, ...)
       16. └─base::.handleSimpleError(...)
       17.   └─testthat (local) h(simpleError(msg, call))
       18.     └─rlang::abort(...)
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘htmltools’
      All declared Imports should be used.
    ```

# drake

<details>

* Version: 7.13.5
* GitHub: https://github.com/ropensci/drake
* Source code: https://github.com/cran/drake
* Date/Publication: 2023-03-24 13:10:02 UTC
* Number of recursive dependencies: 164

Run `revdepcheck::cloud_details(, "drake")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘drake-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: code_to_plan
    > ### Title: Turn an R script file or 'knitr' / R Markdown report into a
    > ###   'drake' plan. *[Questioning]*
    > ### Aliases: code_to_plan
    > 
    > ### ** Examples
    > 
    ...
    +   hist = create_plot(data),
    +   fit = lm(Ozone ~ Temp + Wind, data)
    + )
    > file <- tempfile()
    > # Turn the plan into an R script a the given file path.
    > plan_to_code(plan, file)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plan_to_code ... cdg_finalize_graph -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
       1. drake::drake_config(...)
            at test-4-rng.R:301:2
       2. drake:::create_drake_graph(...)
       5. drake:::cdg_finalize_graph(edges, targets, args)
       6. igraph::graph_from_data_frame(edges)
       7. igraph::make_empty_graph(n = 0, directed = directed)
        ... and 41 more
      
      
      Maximum number of 10 failures reached, some test results may be missing.
      
      ══ DONE ════════════════════════════════════════════════════════════════════════
      Error: Test failures
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
    
    > ### Name: compute_drug_response_scores
    > ### Title: Calculate drug response score
    > ### Aliases: compute_drug_response_scores
    > 
    > ### ** Examples
    > 
    > data(drug_target_edges_example)
    ...
    > example_drug_response_scores <- compute_drug_response_scores(
    +                                     differential_graph=differential_graph_example,
    +                                     drug_targets=drug_target_edges_example$targets,
    +                                     settings=example_settings)
    [23-06-11 21:55:10] Computing drug response scores based on the mean of the differential scores ...
    
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: compute_drug_response_scores ... <Anonymous> -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘DrDimont_Vignette.Rmd’ using rmarkdown
    
    Quitting from lines 328-333 [Individual graphs] (DrDimont_Vignette.Rmd)
    Error: processing vignette 'DrDimont_Vignette.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘DrDimont_Vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘DrDimont_Vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# DTSEA

<details>

* Version: 0.0.3
* GitHub: NA
* Source code: https://github.com/cran/DTSEA
* Date/Publication: 2022-11-06 13:20:02 UTC
* Number of recursive dependencies: 72

Run `revdepcheck::cloud_details(, "DTSEA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘DTSEA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: calculate_p0
    > ### Title: Function to calculate the p0 vector used in Random Walk with
    > ###   Restart (RwR)
    > ### Aliases: calculate_p0
    > 
    > ### ** Examples
    > 
    ...
    > data("example_disease_list", package = "DTSEA")
    > data("example_drug_target_list", package = "DTSEA")
    > data("example_ppi", package = "DTSEA")
    > 
    > # Compute the p0 vector
    > p0 <- calculate_p0(nodes = example_ppi, disease = example_disease_list)
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: calculate_p0 -> is.igraph -> warn_version
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘DTSEA.Rmd’ using rmarkdown
    
    Quitting from lines 54-67 [unnamed-chunk-2] (DTSEA.Rmd)
    Error: processing vignette 'DTSEA.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘DTSEA.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘DTSEA.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# dyndimred

<details>

* Version: 1.0.4
* GitHub: https://github.com/dynverse/dyndimred
* Source code: https://github.com/cran/dyndimred
* Date/Publication: 2021-03-23 08:30:06 UTC
* Number of recursive dependencies: 160

Run `revdepcheck::cloud_details(, "dyndimred")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       4.   └─igraph::graph_from_data_frame(kdf, vertices = seq_len(nrow(x)))
       5.     └─igraph::make_empty_graph(n = 0, directed = directed)
      ── Error ('test-dimred.R:70:7'): Check sparse capable knn_fr ───────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─utils::capture.output(...) at test-dimred.R:70:6
       2. │ └─base::withVisible(...elt(i))
       3. └─dyndimred (local) dr_fun(sparse_expr) at test-dimred.R:74:8
       4.   └─igraph::graph_from_data_frame(kdf, vertices = seq_len(nrow(x)))
       5.     └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 131 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘lle’
    ```

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# dynetNLAResistance

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/dynetNLAResistance
* Date/Publication: 2016-11-25 14:14:30
* Number of recursive dependencies: 39

Run `revdepcheck::cloud_details(, "dynetNLAResistance")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dynetNLAResistance-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: draw.graph
    > ### Title: Draw a graph contains vertexs with sensitive or unsensitive
    > ###   label
    > ### Aliases: draw.graph
    > 
    > ### ** Examples
    > 
    > dynet <- make.virtual.dynamic.network()
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: make.virtual.dynamic.network -> graph.data.frame -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > test_check("dynetNLAResistance")
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 0 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('testmain.R:5:3'): mvdn ──────────────────────────────────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─dynetNLAResistance::make.virtual.dynamic.network(prop.init = 0.03) at testmain.R:5:2
       2.   └─igraph::graph.data.frame(network, directed = F)
       3.     └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘graphics’
      All declared Imports should be used.
    ```

# dyngen

<details>

* Version: 1.0.5
* GitHub: https://github.com/dynverse/dyngen
* Source code: https://github.com/cran/dyngen
* Date/Publication: 2022-10-12 15:22:39 UTC
* Number of recursive dependencies: 203

Run `revdepcheck::cloud_details(, "dyngen")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       14. │     │ └─base::withCallingHandlers(...)
       15. │     ├─purrr:::call_with_cleanup(...)
       16. │     └─dyngen (local) .f(start = .l[[1L]][[i]], stop = .l[[2L]][[i]], ...)
       17. │       └─dyngen:::.feature_network_sample_downstream(...)
       18. │         └─... %>% ...
       19. ├─igraph::graph_from_data_frame(., vertices = colnames(realnet))
       20. │ └─igraph::make_empty_graph(n = 0, directed = directed)
       21. └─base::.handleSimpleError(...)
       22.   └─purrr (local) h(simpleError(msg, call))
       23.     └─cli::cli_abort(...)
       24.       └─rlang::abort(...)
      
      [ FAIL 1 | WARN 17 | SKIP 0 | PASS 64 ]
      Error: Test failures
      Execution halted
    ```

# dynplot

<details>

* Version: 1.1.2
* GitHub: https://github.com/dynverse/dynplot
* Source code: https://github.com/cran/dynplot
* Date/Publication: 2021-12-07 19:00:02 UTC
* Number of recursive dependencies: 134

Run `revdepcheck::cloud_details(, "dynplot")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dynplot-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot_dendro
    > ### Title: Plot a trajectory as a dendrogram
    > ### Aliases: plot_dendro
    > ### Keywords: plot_trajectory
    > 
    > ### ** Examples
    > 
    > data(example_tree)
    > plot_dendro(example_tree)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot_dendro ... as_graph_edge_df -> graph_from_data_frame -> make_empty_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘plotting-a-toy.Rmd’ using rmarkdown
    
    Quitting from lines 40-41 [dendro] (plotting-a-toy.Rmd)
    Error: processing vignette 'plotting-a-toy.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘plotting-a-toy.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘plotting-a-toy.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# dynwrap

<details>

* Version: 1.2.3
* GitHub: https://github.com/dynverse/dynwrap
* Source code: https://github.com/cran/dynwrap
* Date/Publication: 2023-03-01 17:10:02 UTC
* Number of recursive dependencies: 95

Run `revdepcheck::cloud_details(, "dynwrap")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dynwrap-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_branch_trajectory
    > ### Title: Construct a trajectory given its branch network and the
    > ###   pseudotime of the cells on one of the branches.
    > ### Aliases: add_branch_trajectory
    > ### Keywords: create_trajectory
    > 
    > ### ** Examples
    ...
    > trajectory <- add_branch_trajectory(
    +   dataset,
    +   branch_network,
    +   branches,
    +   branch_progressions
    + )
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: add_branch_trajectory ... <Anonymous> -> ensure_igraph -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. ├─wrap_data(id = id, cell_ids = cell_ids) %>% ... at test-wrap_label_milestones.R:28:0
        2. ├─dynwrap::add_trajectory(...)
        3. │ └─dynwrap:::changed_topology(dataset)
        4. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        5. │     └─... %>% simplify_igraph_network()
        6. ├─dynwrap::simplify_igraph_network(.)
        7. │ ├─base::paste0("#M#", igraph::V(gr)$name)
        8. │ └─igraph::V(gr)
        9. │   └─igraph:::ensure_igraph(graph)
       10. └─igraph::graph_from_data_frame(., directed = is_directed)
       11.   └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 108 | WARN 11 | SKIP 1 | PASS 137 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘create_ti_method_container.Rmd’ using rmarkdown
    --- finished re-building ‘create_ti_method_container.Rmd’
    
    --- re-building ‘create_ti_method_definition.Rmd’ using rmarkdown
    running: bash  -c 'chmod +x run.R'
    --- finished re-building ‘create_ti_method_definition.Rmd’
    
    --- re-building ‘create_ti_method_r.Rmd’ using rmarkdown
    
    ...
    Quitting from lines 77-83 [unnamed-chunk-5] (create_ti_method_wrappers.Rmd)
    Error: processing vignette 'create_ti_method_wrappers.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘create_ti_method_wrappers.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘create_ti_method_r.Rmd’ ‘create_ti_method_wrappers.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# ecoCopula

<details>

* Version: 1.0.2
* GitHub: NA
* Source code: https://github.com/cran/ecoCopula
* Date/Publication: 2022-03-02 00:20:02 UTC
* Number of recursive dependencies: 114

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: cgr ... ensure_igraph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. ├─testthat::expect_is(cgr(spider.mod), "cgr") at test_try.R:13:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
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

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘the_basics.Rmd’ using rmarkdown
    
    Quitting from lines 117-123 [unnamed-chunk-10] (the_basics.Rmd)
    Error: processing vignette 'the_basics.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
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
* Number of recursive dependencies: 41

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: complexity ... eval -> c.N1 -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. ├─ECoL::smoothness(speed ~ ., cars, measures = "S1", summary = "mean") at test_smoothness.R:5:2
        2. └─ECoL:::smoothness.formula(speed ~ ., cars, measures = "S1", summary = "mean")
        3.   └─ECoL:::smoothness.default(...)
        4.     └─base::sapply(...)
        5.       └─base::lapply(X = X, FUN = FUN, ...)
        6.         └─ECoL (local) FUN(X[[i]], ...)
        7.           ├─base::eval(call(paste("r", f, sep = "."), d = d, x = x, y = y))
        8.           │ └─base::eval(call(paste("r", f, sep = "."), d = d, x = x, y = y))
        9.           └─ECoL:::r.S1(d = `<dbl[,50]>`, x = `<df[,1]>`, y = `<dbl>`)
       10.             └─igraph::graph.adjacency(d, mode = "undirected", weighted = TRUE)
       11.               └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 6 | WARN 0 | SKIP 0 | PASS 83 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# econet

<details>

* Version: 1.0.0
* GitHub: NA
* Source code: https://github.com/cran/econet
* Date/Publication: 2022-04-28 00:00:02 UTC
* Number of recursive dependencies: 64

Run `revdepcheck::cloud_details(, "econet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘econet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: horse_race
    > ### Title: Compare the explanatory power of parameter.dependent network
    > ###   centrality measures with those of standard measures of network
    > ###   centrality.
    > ### Aliases: horse_race
    > 
    > ### ** Examples
    ...
    +                             data = db_model, unobservables = NULL, G = G_model,
    +                             model = "model_A", estimation = "NLLS",
    +                             start.val = c(alpha = -0.31055275,
    +                                           beta_dw = 1.50666982,
    +                                           beta_betweenness = 0.09666742,
    +                                           phi = 16.13035695))
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: horse_race ... compute_centralities -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘econet.tex’ using tex
    Error: processing vignette 'econet.tex' failed with diagnostics:
    Running 'texi2dvi' on 'econet.tex' failed.
    LaTeX errors:
    ! LaTeX Error: File `ae.sty' not found.
    
    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: sty)
    ...
    l.55 \RequirePackage
                        [T1]{fontenc}^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘econet.tex’
    
    SUMMARY: processing the following file failed:
      ‘econet.tex’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# EcoNetGen

<details>

* Version: 0.2.3
* GitHub: https://github.com/cboettig/EcoNetGen
* Source code: https://github.com/cran/EcoNetGen
* Date/Publication: 2019-07-13 23:30:14 UTC
* Number of recursive dependencies: 85

Run `revdepcheck::cloud_details(, "EcoNetGen")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
          ▆
       1. └─EcoNetGen:::netgen_v1() at test-netsample.R:10:2
       2.   └─igraph::graph_from_adjacency_matrix(M)
       3.     └─igraph:::graph.adjacency.dense(...)
      ── Error ('test-netsample.R:22:3'): net sample works with other settings ───────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─EcoNetGen:::netgen_v1() at test-netsample.R:22:2
       2.   └─igraph::graph_from_adjacency_matrix(M)
       3.     └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 7 | WARN 0 | SKIP 0 | PASS 10 ]
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

* Version: 1.4.0
* GitHub: https://github.com/pachadotdev/economiccomplexity
* Source code: https://github.com/cran/economiccomplexity
* Date/Publication: 2022-09-04 07:00:02 UTC
* Number of recursive dependencies: 95

Run `revdepcheck::cloud_details(, "economiccomplexity")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘economiccomplexity-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: projections
    > ### Title: Projections of a Country-Product Network
    > ### Aliases: projections
    > ### Keywords: functions
    > 
    > ### ** Examples
    > 
    ...
    +  economiccomplexity_output$proximity$proximity_product,
    +  avg_links = 10,
    +  tolerance = 0.1
    + )
    computing product projection...
    --------------------------------------------------
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: projections ... graph_from_adjacency_matrix -> graph.adjacency.sparse -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
           ▆
        1. ├─testthat::expect_warning(...) at test-projections.R:51:2
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. └─economiccomplexity::projections(...)
        7.   └─economiccomplexity (local) trim_network(proximity_product, avg_links)
        8.     └─igraph::graph_from_adjacency_matrix(...)
        9.       └─igraph:::graph.adjacency.sparse(...)
       10.         └─igraph::make_empty_graph(n = vc, directed = (mode == "directed"))
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 80 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘Rdpack’
      All declared Imports should be used.
    ```

# econullnetr

<details>

* Version: 0.2.1
* GitHub: https://github.com/ivaughan/econullnetr
* Source code: https://github.com/cran/econullnetr
* Date/Publication: 2021-06-02 08:10:05 UTC
* Number of recursive dependencies: 97

Run `revdepcheck::cloud_details(, "econullnetr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘econullnetr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: generate_edgelist
    > ### Title: Export null modelling results
    > ### Aliases: generate_edgelist
    > 
    > ### ** Examples
    > 
    > set.seed(1234)
    ...
    + 
    +  igraph::plot.igraph(net.1, layout = igraph::layout_in_circle,
    +                      edge.color = igraph::E(net.1)$edge.cols,
    +                      edge.width = sqrt(igraph::E(net.1)$obs.str),
    +                      edge.arrow.size = .4)
    + }
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘econullnetr-intro.Rmd’ using rmarkdown
    
    Quitting from lines 183-198 [unnamed-chunk-13] (econullnetr-intro.Rmd)
    Error: processing vignette 'econullnetr-intro.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘econullnetr-intro.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘econullnetr-intro.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# EcotoneFinder

<details>

* Version: 0.2.3
* GitHub: NA
* Source code: https://github.com/cran/EcotoneFinder
* Date/Publication: 2021-02-16 23:00:02 UTC
* Number of recursive dependencies: 113

Run `revdepcheck::cloud_details(, "EcotoneFinder")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘EcotoneFinder-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: DistEco
    > ### Title: Tools for internal data structure exploration
    > ### Aliases: DistEco
    > 
    > ### ** Examples
    > 
    >  ### Artificial data:
    ...
    > 
    >  ## Network of species, with raw spinglass groups:
    >  DistEco(SyntheticTrial[,2:ncol(SyntheticTrial)], transpose = TRUE,
    +          plot = c("network"), spinglass = TRUE, run = 10,
    +          spinglass.groups = c("raw"))
    Metric: 'inner_product'; comparing: 21 vectors.
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: DistEco ... graph.edgelist -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Rmisc’ ‘rlang’
      All declared Imports should be used.
    ```

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# ecpc

<details>

* Version: 3.1.1
* GitHub: NA
* Source code: https://github.com/cran/ecpc
* Date/Publication: 2023-02-27 21:12:30 UTC
* Number of recursive dependencies: 145

Run `revdepcheck::cloud_details(, "ecpc")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ecpc-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: visualiseGroupset
    > ### Title: Visualise a group set
    > ### Aliases: visualiseGroupset
    > 
    > ### ** Examples
    > 
    > #groups without hierarchical constraints
    > groupset <- list("Group1"=c(1:20),"Group2"=c(15,30))
    > visualiseGroupset(groupset,c(0.5,2))
    Loading required namespace: ggraph
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: visualiseGroupset -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

# edgebundle

<details>

* Version: 0.4.1
* GitHub: https://github.com/schochastics/edgebundle
* Source code: https://github.com/cran/edgebundle
* Date/Publication: 2022-11-22 07:00:02 UTC
* Number of recursive dependencies: 55

Run `revdepcheck::cloud_details(, "edgebundle")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘edgebundle-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: tnss_smooth
    > ### Title: Smooth a Steiner tree
    > ### Aliases: tnss_smooth
    > 
    > ### ** Examples
    > 
    > xy <- cbind(state.center$x,state.center$y)[!state.name%in%c("Alaska","Hawaii"),]
    ...
    > xy_dummy <- tnss_dummies(xy,root = 4)
    > gtree <- tnss_tree(cali2010,xy,xy_dummy,root = 4,gamma = 0.9)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: tnss_tree ... <Anonymous> -> make_graph -> do.call -> <Anonymous>
    Execution halted
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. └─igraph::graph_from_edgelist(...) at test-bundle_test.R:2:2
       2.   └─igraph::make_graph(t(el), directed = directed)
       3.     ├─base::do.call(old_graph, args)
       4.     └─igraph (local) `<fn>`(`<dbl[,6]>`, directed = FALSE)
      ── Error ('test-bundle_test.R:9:4'): stub bundle works ─────────────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─igraph::graph.star(10, "undirected") at test-bundle_test.R:9:3
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 22 marked UTF-8 strings
    ```

# edmcr

<details>

* Version: 0.2.0
* GitHub: https://github.com/great-northern-diver/edmcr
* Source code: https://github.com/cran/edmcr
* Date/Publication: 2021-09-10 10:40:06 UTC
* Number of recursive dependencies: 46

Run `revdepcheck::cloud_details(, "edmcr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘edmcr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dpf
    > ### Title: Dissimilarity Parameterization Formulation
    > ### Aliases: dpf
    > 
    > ### ** Examples
    > 
    > set.seed(1337)
    ...
    +              4,1,0,5,NA,5,
    +              3,NA,5,0,1,NA,
    +              4,5,NA,1,0,5,
    +              3,NA,5,NA,5,0),byrow=TRUE, nrow=6)
    > 
    > edmc(D, method="dpf", d=3, toler=1e-8)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: edmc ... dpf -> mstUB -> graph.data.frame -> make_empty_graph
    Execution halted
    ```

# EDOIF

<details>

* Version: 0.1.3
* GitHub: https://github.com/DarkEyes/EDOIF
* Source code: https://github.com/cran/EDOIF
* Date/Publication: 2021-03-28 06:20:05 UTC
* Number of recursive dependencies: 61

Run `revdepcheck::cloud_details(, "EDOIF")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘EDOIF-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: EDOIF
    > ### Title: Empirical Distribution Ordering Inference Framework (EDOIF)
    > ### Aliases: EDOIF
    > 
    > ### ** Examples
    > 
    > # Generate simulation data
    ...
    > simData1$Values<-c(simData1$Values,rnorm(nInv,mean=initMean+4*stepMean,sd=std) )
    > simData1$Group<-c(simData1$Group, rep(c("C5"),times=nInv) )
    > 
    > # Performing ordering infernce from simData1
    > 
    > resultObj<-EDOIF(simData1$Values,simData1$Group)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: EDOIF ... graph_from_adjacency_matrix -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘EDOIF_demo.Rmd’ using knitr
    
    Quitting from lines 34-45 [unnamed-chunk-1] (EDOIF_demo.Rmd)
    Error: processing vignette 'EDOIF_demo.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘EDOIF_demo.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘EDOIF_demo.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# eff2

<details>

* Version: 1.0.1
* GitHub: https://github.com/richardkwo/eff2
* Source code: https://github.com/cran/eff2
* Date/Publication: 2021-09-30 20:40:02 UTC
* Number of recursive dependencies: 115

Run `revdepcheck::cloud_details(, "eff2")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘eff2-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: estimateEffect
    > ### Title: Estimate the total causal effect
    > ### Aliases: estimateEffect
    > 
    > ### ** Examples
    > 
    > data("ex1")
    > result <- estimateEffect(ex1$data, c(5,3), 7, ex1$amat.cpdag, bootstrap=TRUE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: estimateEffect ... ensure_igraph -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
           ▆
        1. └─eff2::estimateEffect(ex1$data, .x, .y, ex1$amat.cpdag, bootstrap = FALSE) at test_ex1.R:26:4
        2.   └─eff2:::.estimateEffect(stats::cov(data), x, y, amat)
        3.     └─eff2:::getBucketDecomp(x, y, amat)
        4.       ├─base::stopifnot(pcalg::isValidGraph(amat, type = "pdag"))
        5.       └─pcalg::isValidGraph(amat, type = "pdag")
        6.         └─pcalg:::chordalComponents(corresp.cpdag)
        7.           ├─igraph::graph.dfs(...)
        8.           │ └─igraph:::ensure_igraph(graph)
        9.           └─igraph::graph.adjacency(amat.undir, mode = "undirected")
       10.             └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 5 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘eff2-doc.Rmd’ using rmarkdown
    
    Quitting from lines 62-63 [unnamed-chunk-4] (eff2-doc.Rmd)
    Error: processing vignette 'eff2-doc.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘eff2-doc.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘eff2-doc.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# EGAnet

<details>

* Version: 1.2.3
* GitHub: NA
* Source code: https://github.com/cran/EGAnet
* Date/Publication: 2022-09-05 15:50:02 UTC
* Number of recursive dependencies: 160

Run `revdepcheck::cloud_details(, "EGAnet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘EGAnet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: convert2igraph
    > ### Title: Convert networks to 'igraph'
    > ### Aliases: convert2igraph
    > 
    > ### ** Examples
    > 
    > convert2igraph(ega.wmt$network)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: convert2igraph
    Execution halted
    ```

# egor

<details>

* Version: 1.23.3
* GitHub: https://github.com/tilltnet/egor
* Source code: https://github.com/cran/egor
* Date/Publication: 2023-03-16 04:40:02 UTC
* Number of recursive dependencies: 89

Run `revdepcheck::cloud_details(, "egor")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘egor-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as_igraph
    > ### Title: Convert 'egor' object to 'network' or 'igraph' objects
    > ### Aliases: as_igraph as_igraph.nested_egor as.igraph.egor as_network
    > ###   as.network.egor
    > 
    > ### ** Examples
    > 
    > e <- make_egor(3, 22)
    > as_igraph(e)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: as_igraph ... mapply -> <Anonymous> -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        7. ├─egor:::rotate_to_equilibrium(.)
        8. ├─igraph::layout_as_star(.)
        9. │ └─igraph:::ensure_igraph(graph)
       10. ├─egor::as_igraph(.)
       11. └─egor:::as_igraph.egor(.)
       12.   ├─egor::as_igraph(...)
       13.   └─egor:::as_igraph.nested_egor(...)
       14.     └─base::mapply(...)
       15.       └─egor (local) `<fn>`(dots[[1L]][[1L]], dots[[2L]][[1L]])
       16.         └─igraph::graph.data.frame(...)
       17.           └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 48 | WARN 8 | SKIP 15 | PASS 152 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘egor_allbus.Rmd’ using rmarkdown
    
    Quitting from lines 179-181 [unnamed-chunk-11] (egor_allbus.Rmd)
    Error: processing vignette 'egor_allbus.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘egor_allbus.Rmd’
    
    --- re-building ‘qualtrics.Rmd’ using rmarkdown
    ...
    Quitting from lines 222-241 [unnamed-chunk-16] (using_egor.Rmd)
    Error: processing vignette 'using_egor.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘using_egor.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘egor_allbus.Rmd’ ‘using_egor.Rmd’
    
    Error: Vignette re-building failed.
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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plotNetworkFromMatrix -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘eicm.Rmd’ using rmarkdown
    
    Quitting from lines 185-187 [unnamed-chunk-7] (eicm.Rmd)
    Error: processing vignette 'eicm.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
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
* Number of recursive dependencies: 67

Run `revdepcheck::cloud_details(, "einet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘einet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: causal_emergence
    > ### Title: Causal Emergence
    > ### Aliases: causal_emergence
    > 
    > ### ** Examples
    > 
    > graph <- matrix(
    ...
    +     c(0.0, 0.0, 0.0, 1.0),
    +     c(0.0, 0.0, 0.0, 0.0)
    +   ),
    +  nrow = 4
    + ) %>%
    +   igraph::graph.adjacency(mode = "directed")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: %>% -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        5. └─einet:::effective_information.igraph(karate)
        6.   ├─assertthat::assert_that(igraph::is.igraph(graph))
        7.   │ └─assertthat::see_if(..., env = env, msg = msg)
        8.   │   ├─base::tryCatch(...)
        9.   │   │ └─base (local) tryCatchList(expr, classes, parentenv, handlers)
       10.   │   │   └─base (local) tryCatchOne(expr, names, parentenv, handlers[[1L]])
       11.   │   │     └─base (local) doTryCatch(return(expr), name, parentenv, handler)
       12.   │   └─base::eval(assertion, env)
       13.   │     └─base::eval(assertion, env)
       14.   └─igraph::is.igraph(graph)
       15.     └─igraph:::warn_version(graph)
      
      [ FAIL 5 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

# EmbedSOM

<details>

* Version: 2.1.2
* GitHub: https://github.com/exaexa/EmbedSOM
* Source code: https://github.com/cran/EmbedSOM
* Date/Publication: 2022-07-05 10:20:02 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::cloud_details(, "EmbedSOM")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘EmbedSOM-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: RandomMap
    > ### Title: Create a map by randomly selecting points
    > ### Aliases: RandomMap
    > 
    > ### ** Examples
    > 
    > d <- iris[,1:4]
    ...
    > EmbedSOM::PlotEmbed(
    +   EmbedSOM::EmbedSOM(
    +     data = d,
    +     map = EmbedSOM::RandomMap(d, 30, EmbedSOM::GraphCoords())),
    +   pch=19, clust=iris[,5]
    + )
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> ... ensure_igraph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Matrix’ ‘Rtsne’ ‘uwot’
      All declared Imports should be used.
    ```

# enviGCMS

<details>

* Version: 0.7.1
* GitHub: https://github.com/yufree/enviGCMS
* Source code: https://github.com/cran/enviGCMS
* Date/Publication: 2023-02-06 08:42:34 UTC
* Number of recursive dependencies: 150

Run `revdepcheck::cloud_details(, "enviGCMS")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘enviGCMS-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: getalign2
    > ### Title: Align mass to charge ratio and/or retention time to remove
    > ###   redundancy
    > ### Aliases: getalign2
    > 
    > ### ** Examples
    > 
    > mz <- c(221.1171, 221.1170, 229.1546, 233.1497, 271.0790 )
    > rt <- c(590.8710, 587.3820, 102.9230, 85.8850, 313.8240)
    > getalign2(mz,rt)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: getalign2 -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

# epicontacts

<details>

* Version: 1.1.3
* GitHub: https://github.com/reconhub/epicontacts
* Source code: https://github.com/cran/epicontacts
* Date/Publication: 2023-03-28 13:10:12 UTC
* Number of recursive dependencies: 88

Run `revdepcheck::cloud_details(, "epicontacts")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘epicontacts-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_clusters
    > ### Title: Assign cluster IDs to epicontacts data
    > ### Aliases: get_clusters
    > 
    > ### ** Examples
    > 
    > if (require(outbreaks)) {
    ...
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: get_clusters ... as.igraph.epicontacts -> <Anonymous> -> make_empty_graph
    Execution halted
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘epicontacts.Rmd’ using rmarkdown
    
    Quitting from lines 128-130 [unnamed-chunk-9] (epicontacts.Rmd)
    Error: processing vignette 'epicontacts.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘epicontacts.Rmd’
    
    --- re-building ‘epicontacts_class.Rmd’ using rmarkdown
    --- finished re-building ‘epicontacts_class.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘epicontacts.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘colorspace’
      All declared Imports should be used.
    ```

# EpiILMCT

<details>

* Version: 1.1.7
* GitHub: https://github.com/waleedalmutiry/EpiILMCT
* Source code: https://github.com/cran/EpiILMCT
* Date/Publication: 2021-06-29 06:10:06 UTC
* Number of recursive dependencies: 8

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... plot.contactnet -> <Anonymous> -> do.call -> <Anonymous>
    Execution halted
    ```

# epinetr

<details>

* Version: 0.96
* GitHub: https://github.com/diondetterer/epinetr
* Source code: https://github.com/cran/epinetr
* Date/Publication: 2022-03-10 10:30:02 UTC
* Number of recursive dependencies: 87

Run `revdepcheck::cloud_details(, "epinetr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘epinetr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: getEpiNet
    > ### Title: Epistatic network retrieval.
    > ### Aliases: getEpiNet
    > 
    > ### ** Examples
    > 
    > # Create population and attach an epistatic network
    ...
    Estimating heritability...
    Estimating SNP effects...
    > 
    > # Plot epistatic network
    > epiNet <- getEpiNet(pop)
    > plot(epiNet)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... plot.EpiNet -> <Anonymous> -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘epinetr-vignette.Rmd’ using rmarkdown
    
    Quitting from lines 36-51 [unnamed-chunk-2] (epinetr-vignette.Rmd)
    Error: processing vignette 'epinetr-vignette.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘epinetr-vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘epinetr-vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# espadon

<details>

* Version: 1.3.2
* GitHub: NA
* Source code: https://github.com/cran/espadon
* Date/Publication: 2023-04-04 07:50:06 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::cloud_details(, "espadon")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘espadon-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: display.obj.links
    > ### Title: Display patient objects links
    > ### Aliases: display.obj.links
    > 
    > ### ** Examples
    > 
    > # loading of toy-patient objects
    > patient <- toy.load.patient (dxyz = c (5, 5, 5), beam.nb = 1)
    > display.obj.links (patient, group.by.connected.FoR = FALSE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: display.obj.links ... graph_from_adjacency_matrix -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.0Mb
      sub-directories of 1Mb or more:
        libs   6.5Mb
    ```

# ess

<details>

* Version: 1.1.2
* GitHub: https://github.com/mlindsk/ess
* Source code: https://github.com/cran/ess
* Date/Publication: 2021-05-31 07:40:08 UTC
* Number of recursive dependencies: 9

Run `revdepcheck::cloud_details(, "ess")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ess-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: fit_graph
    > ### Title: Fit a decomposable graphical model
    > ### Aliases: fit_graph
    > 
    > ### ** Examples
    > 
    > 
    ...
       - max: 2 
       - min: 2 
       - avg: 2 
      <fwd, gengraph, list> 
     -------------------------
    > plot(g)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... plot.gengraph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

# etree

<details>

* Version: 0.1.0
* GitHub: https://github.com/ricgbl/etree
* Source code: https://github.com/cran/etree
* Date/Publication: 2022-07-16 08:30:02 UTC
* Number of recursive dependencies: 128

Run `revdepcheck::cloud_details(, "etree")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘etree-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dist_comp
    > ### Title: Distances
    > ### Aliases: dist_comp
    > 
    > ### ** Examples
    > 
    > 
    ...
    > obj <- fda.usc::rproc2fdata(nobs, seq(0, 1, len = 100), sigma = 1)
    > d <- dist_comp(obj)
    Warning: executing %dopar% sequentially: no parallel backend registered
    > 
    > ## Graphs
    > obj <- lapply(1:nobs, function(j) igraph::sample_gnp(100, 0.2))
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: lapply -> FUN -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        7. └─etree::etree(resp_cls, covs_cls, split_type = "cluster")
        8.   └─base::lapply(covariates, dist_comp)
        9.     └─etree (local) FUN(X[[i]], ...)
       10.       └─base::sapply(x, function(i) is.null(igraph::edge.attributes(i)$weight))
       11.         └─base::lapply(X = X, FUN = FUN, ...)
       12.           └─etree (local) FUN(X[[i]], ...)
       13.             └─igraph::edge.attributes(i)
       14.               └─igraph:::ensure_igraph(graph)
       15.                 └─igraph::is_igraph(graph)
       16.                   └─igraph:::warn_version(graph)
      
      [ FAIL 28 | WARN 1 | SKIP 0 | PASS 37 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘etree-vignette-eforest.Rmd’ using rmarkdown
    
    Quitting from lines 148-170 [unnamed-chunk-4] (etree-vignette-eforest.Rmd)
    Error: processing vignette 'etree-vignette-eforest.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘etree-vignette-eforest.Rmd’
    
    --- re-building ‘etree-vignette.Rmd’ using rmarkdown
    ...
    Quitting from lines 142-164 [unnamed-chunk-4] (etree-vignette.Rmd)
    Error: processing vignette 'etree-vignette.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘etree-vignette.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘etree-vignette-eforest.Rmd’ ‘etree-vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# fairadapt

<details>

* Version: 0.2.5
* GitHub: https://github.com/dplecko/fairadapt
* Source code: https://github.com/cran/fairadapt
* Date/Publication: 2023-03-23 15:02:04 UTC
* Number of recursive dependencies: 103

Run `revdepcheck::cloud_details(, "fairadapt")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘fairadapt-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: fairTwins
    > ### Title: Fair Twin Inspection convenience function.
    > ### Aliases: fairTwins
    > 
    > ### ** Examples
    > 
    > n_samp <- 200
    ...
    > uni_ada <- fairadapt(score ~ .,
    +   train.data = head(uni_admission, n = n_samp),
    +   test.data = tail(uni_admission, n = n_samp),
    +   adj.mat = uni_adj,
    +   prot.attr = "gender"
    + )
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: fairadapt ... graph_from_adjacency_matrix -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      • generics/fttrn_cts.csv
      • generics/fttrn_lin.csv
      • generics/fttrn_rf.csv
      • generics/graph_cts.png
      • generics/graph_lin.png
      • generics/graph_rf.png
      • generics/plot_cts.png
      • generics/plot_lin.png
      • generics/plot_rf.png
      • generics/predi_cts.csv
      • generics/predi_disc.csv
      • generics/predi_lin.csv
      • generics/predi_rf.csv
      Error: Test failures
      Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘jss.Rmd’ using rmarkdown
    Error: processing vignette 'jss.Rmd' failed with diagnostics:
    pandoc version 2.7 or higher is required and was not found (see the help page ?rmarkdown::pandoc_available).
    --- failed re-building ‘jss.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘jss.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# FAIRmaterials

<details>

* Version: 0.3.0
* GitHub: NA
* Source code: https://github.com/cran/FAIRmaterials
* Date/Publication: 2023-02-11 07:10:07 UTC
* Number of recursive dependencies: 69

Run `revdepcheck::cloud_details(, "FAIRmaterials")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘FAIRmaterials-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot_json_graph
    > ### Title: Plot an igraph visualization of a JSON document
    > ### Aliases: plot_json_graph
    > 
    > ### ** Examples
    > 
    > json_file <- '{
    ...
    + "name": "Jane Doe",
    + "jobTitle": "Professor",
    + "telephone": "(425) 123-4567",
    + "url": "http://www.janedoe.com"}'
    > 
    > plot_json_graph(json_file)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot_json_graph -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.5Mb
      sub-directories of 1Mb or more:
        doc   5.3Mb
    ```

# fake

<details>

* Version: 1.4.0
* GitHub: NA
* Source code: https://github.com/cran/fake
* Date/Publication: 2023-04-13 22:30:24 UTC
* Number of recursive dependencies: 41

Run `revdepcheck::cloud_details(, "fake")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘fake-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ExpectedCommunities
    > ### Title: Expected community structure
    > ### Aliases: ExpectedCommunities
    > 
    > ### ** Examples
    > 
    > # Simulation parameters
    ...
    [1] 40
    > 
    > # Comparing observed and expected modularity
    > igraph::modularity(igraph::graph_from_adjacency_matrix(theta, mode = "undirected"),
    +   membership = rep.int(1:length(pk), times = pk)
    + )
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

# fastnet

<details>

* Version: 1.0.0
* GitHub: https://github.com/networkgroupR/fastnet
* Source code: https://github.com/cran/fastnet
* Date/Publication: 2020-12-01 07:40:02 UTC
* Number of recursive dependencies: 29

Run `revdepcheck::cloud_details(, "fastnet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘fastnet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: from.adjacency
    > ### Title: Adjacency Matrix to 'fastnet'
    > ### Aliases: from.adjacency
    > 
    > ### ** Examples
    > 
    > adj.mat <- matrix(c(0,1,0,0,1,0,0,0,0,0,0,1,0,0,1,0), nrow = 4, ncol = 4)
    > g <- from.adjacency(adj.mat)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: from.adjacency ... ensure_igraph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# fbnet

<details>

* Version: 1.0.2
* GitHub: https://github.com/MarsicoFL/fbnet
* Source code: https://github.com/cran/fbnet
* Date/Publication: 2023-02-27 22:02:35 UTC
* Number of recursive dependencies: 10

Run `revdepcheck::cloud_details(, "fbnet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘fbnet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: buildBN
    > ### Title: buildBN: a function for building the bayesian network.
    > ### Aliases: buildBN
    > 
    > ### ** Examples
    > 
    > bnet <- buildBN(pbn,QP=3)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: buildBN -> graph_from_data_frame -> make_empty_graph
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Rsolnp’ ‘assertthat’ ‘utils’
      All declared Imports should be used.
    ```

# FCMapper

<details>

* Version: 1.1
* GitHub: NA
* Source code: https://github.com/cran/FCMapper
* Date/Publication: 2016-02-12 07:40:47
* Number of recursive dependencies: 7

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: graph.fcm -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

# FindIt

<details>

* Version: 1.2.0
* GitHub: NA
* Source code: https://github.com/cran/FindIt
* Date/Publication: 2019-11-20 21:50:02 UTC
* Number of recursive dependencies: 60

Run `revdepcheck::cloud_details(, "FindIt")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘FindIt-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: CausalANOVA
    > ### Title: Estimating the AMEs and AMIEs with the CausalANOVA.
    > ### Aliases: CausalANOVA
    > 
    > ### ** Examples
    > 
    > 
    ...
    1 newRecordF        promise
    2 newRecordF   coeth_voting
    3    promise relevantdegree
    
     ***** Collapsing ***** 
    > summary(fit.r2)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: summary ... graph_from_adjacency_matrix -> graph.adjacency.dense
    Execution halted
    ```

# fnets

<details>

* Version: 0.1.3
* GitHub: NA
* Source code: https://github.com/cran/fnets
* Date/Publication: 2023-06-08 15:10:02 UTC
* Number of recursive dependencies: 59

Run `revdepcheck::cloud_details(, "fnets")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─base::plot(out, type = "pc", display = "network") at test-omega.R:21:0
       2. └─fnets:::plot.fnets(out, type = "pc", display = "network")
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

# foodingraph

<details>

* Version: 0.1.0
* GitHub: https://github.com/vgasque/foodingraph
* Source code: https://github.com/cran/foodingraph
* Date/Publication: 2019-10-06 11:30:08 UTC
* Number of recursive dependencies: 60

Run `revdepcheck::cloud_details(, "foodingraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘foodingraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: graph_from_links_nodes
    > ### Title: Display a graph from a list of links and nodes
    > ### Aliases: graph_from_links_nodes
    > 
    > ### ** Examples
    > 
    > adj_matrix <- cor(iris[,-5])
    > legend <- data.frame(name = colnames(iris[,-5]),
    +                      title = colnames(iris[,-5]))
    > graph_iris <- links_nodes_from_mat(adj_matrix, legend)
    > graph_from_links_nodes(graph_iris, main_title = "Iris graph")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: graph_from_links_nodes -> graph_from_data_frame -> make_empty_graph
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘grid’
      All declared Imports should be used.
    ```

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: getForestGaps ... ensure_igraph -> <Anonymous> -> do.call -> <Anonymous>
    Execution halted
    ```

# forestRK

<details>

* Version: 0.0-5
* GitHub: NA
* Source code: https://github.com/cran/forestRK
* Date/Publication: 2019-07-19 10:50:02 UTC
* Number of recursive dependencies: 57

Run `revdepcheck::cloud_details(, "forestRK")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘forestRK-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: draw.treeRK
    > ### Title: Creates a 'igraph' plot of a 'rktree'
    > ### Aliases: draw.treeRK
    > ### Keywords: plot treeRK tree.plot
    > 
    > ### ** Examples
    > 
    ...
    > 
    >   # Plot the tree
    >   draw.treeRK(tree.entropy, y.factor.levels, font="Times",
    +               node.colour = "black", text.colour = "white", text.size = 0.7,
    +               tree.vertex.size = 100, tree.title = "Decision Tree",
    +               title.colour = "dark green")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: draw.treeRK -> make_empty_graph
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘pkgKitten’
      All declared Imports should be used.
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
    
    > ### Name: plot_taxa
    > ### Title: plot_taxa
    > ### Aliases: plot_taxa
    > 
    > ### ** Examples
    > 
    > # load dataset
    > data("brachios")
    > # define ranks in dataset
    > b_ranks <- c("phylum", "class", "order", "family", "genus")
    > # plot taxon
    > plot_taxa(brachios, "Atrypa", trank = "genus", ranks = b_ranks, mode = "parent")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot_taxa ... <Anonymous> -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘fossilbrush_vignette.Rmd’ using rmarkdown
    
    Quitting from lines 92-99 [unnamed-chunk-5] (fossilbrush_vignette.Rmd)
    Error: processing vignette 'fossilbrush_vignette.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘fossilbrush_vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘fossilbrush_vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 31 marked UTF-8 strings
    ```

# FrF2

<details>

* Version: 2.3
* GitHub: NA
* Source code: https://github.com/cran/FrF2
* Date/Publication: 2023-05-07 23:00:02 UTC
* Number of recursive dependencies: 34

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
    > ##D ## look up its id number in the title bar of the graph window and use it for id
    > ##D par(xpd=TRUE)
    > ##D CIGstatic(ex.CIG, id=1)
    > ## End(Not run)
    > 
    > graph1 <- CIG("9-4.2", plot=FALSE)   ### create graph object from design name
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: CIG -> graph.empty
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘FrF2test.R’
    Running the tests in ‘tests/FrF2test.R’ failed.
    Last 13 lines of output:
        ..$ replications       : num 1
        ..$ repeat.only        : logi FALSE
        ..$ randomize          : logi FALSE
        ..$ seed               : NULL
        ..$ creator            : language FrF2(64, 7, blocks = 32, alias.block.2fis = TRUE, randomize = FALSE)
      > 
      >   ## godolphin with estimable
      >   str.wover(FrF2(64,9,blocks=16,factor.names=Letters[15:23], 
      +        estimable=compromise(9,3)$requirement,
      +        alias.block.2fis=TRUE,randomize=FALSE))
      a clear design requires at least 32 runs
      Error in .igraph.status("Make graph external pointer.\n") : 
        could not find function ".igraph.status"
      Calls: str.wover -> FrF2 -> estimable -> mapcalc -> graph.empty
      Execution halted
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

*   checking examples ... ERROR
    ```
    Running examples in ‘fssemR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: fssemR
    > ### Title: Solving Sparse Structural Equation Model
    > ### Aliases: fssemR package-fssemR
    > 
    > ### ** Examples
    > 
    > seed = as.numeric(Sys.time())
    ...
    > Ns = 1                                            # sparse ratio
    > sigma2 = 0.01                                     # sigma2
    > set.seed(seed)
    > library(fssemR)
    > data = randomFSSEMdata(n = N, p = Ng, k = Nk, sparse = Ns, df = 0.3, sigma2 = sigma2,
    +                        u = 5, type = "DG", nhub = 1, dag = TRUE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: randomFSSEMdata ... graph_from_adjacency_matrix -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘fssemR.Rmd’ using rmarkdown
    
    Quitting from lines 45-57 [unnamed-chunk-2] (fssemR.Rmd)
    Error: processing vignette 'fssemR.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘fssemR.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘fssemR.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

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

# gDefrag

<details>

* Version: 0.3
* GitHub: NA
* Source code: https://github.com/cran/gDefrag
* Date/Publication: 2020-09-02 20:00:03 UTC
* Number of recursive dependencies: 12

Run `revdepcheck::cloud_details(, "gDefrag")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘gDefrag-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: prioritize
    > ### Title: Prioritizing connectivity corridors
    > ### Aliases: prioritize
    > 
    > ### ** Examples
    > 
    > data(road_P)
    ...
    > 
    > #Prioritize
    > out3 <- prioritize(nodes = out1, edges = out2, 
    + 	method = "value")#Raster value
    > out4 <- prioritize(nodes = out1, edges = out2, 
    + 	method = "between")#Betweenness
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: prioritize -> graph_from_data_frame -> make_empty_graph
    Execution halted
    ```

# gemtc

<details>

* Version: 1.0-1
* GitHub: https://github.com/gertvv/gemtc
* Source code: https://github.com/cran/gemtc
* Date/Publication: 2021-05-14 23:20:02 UTC
* Number of recursive dependencies: 58

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: mtc.model ... ensure_igraph -> mtc.network.graph -> graph.create -> graph.empty
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘test.R’
    Running the tests in ‘tests/test.R’ failed.
    Last 13 lines of output:
       5.       └─igraph::graph.empty()
      ── Error ('test-unit-relative.effect.table.R:5:3'): it works for the smoking example ──
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─gemtc::relative.effect.table(smoking_result) at test-unit-relative.effect.table.R:5:2
       2.   ├─base::as.matrix(...)
       3.   └─gemtc::relative.effect(...)
       4.     └─gemtc:::spanning.tree.mtc.result(result)
       5.       └─gemtc:::graph.create(...)
       6.         └─igraph::graph.empty()
      
      [ FAIL 48 | WARN 0 | SKIP 0 | PASS 221 ]
      Error: Test failures
      Execution halted
    ```

# genscore

<details>

* Version: 1.0.2.1
* GitHub: https://github.com/sqyu/genscore
* Source code: https://github.com/cran/genscore
* Date/Publication: 2023-05-12 06:57:06 UTC
* Number of recursive dependencies: 45

Run `revdepcheck::cloud_details(, "genscore")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘genscore-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: cov_cons
    > ### Title: Random generator of inverse covariance matrices.
    > ### Aliases: cov_cons
    > 
    > ### ** Examples
    > 
    > p <- 100
    > K1 <- cov_cons("random", p, seed = 1, spars = 0.05, eig = 0.1)
    > K2 <- cov_cons("sub", p, seed = 2, spars = 0.5, eig = 0.1, subgraphs=10)
    > K3 <- cov_cons("er", p, seed = 3, spars = 0.05, eig = 0.1)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: cov_cons ... as.matrix -> <Anonymous> -> ensure_igraph -> <Anonymous>
    Execution halted
    ```

# geonetwork

<details>

* Version: 0.5.0
* GitHub: NA
* Source code: https://github.com/cran/geonetwork
* Date/Publication: 2023-04-14 08:30:02 UTC
* Number of recursive dependencies: 156

Run `revdepcheck::cloud_details(, "geonetwork")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘geonetwork-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: geonetwork
    > ### Title: Create geographic networks
    > ### Aliases: geonetwork
    > 
    > ### ** Examples
    > 
    >   e <- data.frame(from = c("A", "A"), to = c("B", "C"))
    >   n <- data.frame(id = LETTERS[1:3], x = c(0, 0, 1), y = c(0, 1, 0))
    >   geonetwork(e, n)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: geonetwork -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

# ggdag

<details>

* Version: 0.2.10
* GitHub: https://github.com/r-causal/ggdag
* Source code: https://github.com/cran/ggdag
* Date/Publication: 2023-05-28 23:30:02 UTC
* Number of recursive dependencies: 102

Run `revdepcheck::cloud_details(, "ggdag")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggdag-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: activate_collider_paths
    > ### Title: Activate paths opened by stratifying on a collider
    > ### Aliases: activate_collider_paths
    > 
    > ### ** Examples
    > 
    > dag <- dagify(m ~ x + y, x ~ y)
    > 
    > collided_dag <- activate_collider_paths(dag, adjust_for = "m")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: activate_collider_paths ... tidy_dagitty -> %>% -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        7. │           └─testthat::source_dir(path, "^helper.*\\.[rR]$", env = env, wrap = FALSE)
        8. │             └─base::lapply(...)
        9. │               └─testthat (local) FUN(X[[i]], ...)
       10. │                 └─testthat::source_file(path, env = env, chdir = chdir, wrap = wrap)
       11. │                   ├─base::withCallingHandlers(...)
       12. │                   └─base::eval(exprs, env)
       13. │                     └─base::eval(exprs, env)
       14. │                       └─ggdag::tidy_dagitty(test_dag) at tests/testthat/helper-load_dag.R:13:0
       15. │                         └─... %>% ...
       16. ├─igraph::graph_from_data_frame(., vertices = names(.dagitty))
       17. │ └─igraph::make_empty_graph(n = 0, directed = directed)
       18. └─base::.handleSimpleError(...)
       19.   └─testthat (local) h(simpleError(msg, call))
       20.     └─rlang::abort(...)
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘bias-structures.Rmd’ using rmarkdown
    
    Quitting from lines 44-46 [unnamed-chunk-1] (bias-structures.Rmd)
    Error: processing vignette 'bias-structures.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘bias-structures.Rmd’
    
    --- re-building ‘intro-to-dags.Rmd’ using rmarkdown
    
    ...
    Quitting from lines 35-41 [dagitty] (intro-to-ggdag.Rmd)
    Error: processing vignette 'intro-to-ggdag.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘intro-to-ggdag.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘bias-structures.Rmd’ ‘intro-to-dags.Rmd’ ‘intro-to-ggdag.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# ggenealogy

<details>

* Version: 1.0.1
* GitHub: NA
* Source code: https://github.com/cran/ggenealogy
* Date/Publication: 2020-03-04 09:40:14 UTC
* Number of recursive dependencies: 82

Run `revdepcheck::cloud_details(, "ggenealogy")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggenealogy-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: getBasicStatistics
    > ### Title: Determine basic statistics of the graph object
    > ### Aliases: getBasicStatistics
    > 
    > ### ** Examples
    > 
    > data(sbGeneal)
    > ig <- dfToIG(sbGeneal)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: dfToIG -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking running R code from vignettes ... ERROR
    ```
    Errors in running code in vignettes:
    when running code in ‘ggenealogy.Rnw’
      ...
    
         <URL: https://www.r-project.org> for iGraph information
    
    
    
    > ig <- dfToIG(sbGeneal)
    
      When sourcing ‘ggenealogy.R’:
    Error: could not find function ".igraph.status"
    Execution halted
    
      ‘ggenealogy.Rnw’ using ‘UTF-8’... failed
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 2356 marked UTF-8 strings
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘ggenealogy.Rnw’ using Sweave
    dfToIG               package:ggenealogy                R Documentation
    
    _P_r_o_c_e_s_s _t_h_e _g_e_n_e_a_l_o_g_y _g_r_a_p_h
    
    _D_e_s_c_r_i_p_t_i_o_n:
    
         Processes the genealogy into an igraph object with appropriate
         vertex information, graph type, and edge weights.
    ...
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    
    --- failed re-building ‘ggenealogy.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘ggenealogy.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# ggflowchart

<details>

* Version: 1.0.0
* GitHub: NA
* Source code: https://github.com/cran/ggflowchart
* Date/Publication: 2023-05-11 10:10:05 UTC
* Number of recursive dependencies: 60

Run `revdepcheck::cloud_details(, "ggflowchart")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggflowchart-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ggflowchart
    > ### Title: Generate a flowchart in ggplot2
    > ### Aliases: ggflowchart
    > 
    > ### ** Examples
    > 
    > data <- tibble::tibble(from = c("A", "A", "A", "B", "C", "F"), to = c("B", "C", "D", "E", "F", "G"))
    > ggflowchart(data)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: ggflowchart -> get_layout -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘decision-tree-example.Rmd’ using rmarkdown
    
    Quitting from lines 64-65 [flowchart] (decision-tree-example.Rmd)
    Error: processing vignette 'decision-tree-example.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘decision-tree-example.Rmd’
    
    --- re-building ‘minimal-example.Rmd’ using rmarkdown
    ...
    Quitting from lines 31-32 [flowchart] (minimal-example.Rmd)
    Error: processing vignette 'minimal-example.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘minimal-example.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘decision-tree-example.Rmd’ ‘minimal-example.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# ggm

<details>

* Version: 2.5
* GitHub: NA
* Source code: https://github.com/cran/ggm
* Date/Publication: 2020-02-16 14:00:02 UTC
* Number of recursive dependencies: 9

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: AG -> plotfun -> graph -> do.call -> <Anonymous>
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘graph’
      All declared Imports should be used.
    ```

# ggnetwork

<details>

* Version: 0.5.12
* GitHub: https://github.com/briatte/ggnetwork
* Source code: https://github.com/cran/ggnetwork
* Date/Publication: 2023-03-06 20:00:02 UTC
* Number of recursive dependencies: 73

Run `revdepcheck::cloud_details(, "ggnetwork")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Error ('test-fortify-network.R:13:1'): (code run outside of `test_that()`) ──
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─igraph::random.graph.game(n = 1, p.or.m = 0) at test-fortify-network.R:13:0
      ── Error ('test-ggnetwork.R:7:3'): ggnetwork works ─────────────────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─igraph::graph_from_adjacency_matrix(as.matrix(emon[[1]])) at test-ggnetwork.R:7:2
       2.   └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 25 ]
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

# ggraph

<details>

* Version: 2.1.0
* GitHub: https://github.com/thomasp85/ggraph
* Source code: https://github.com/cran/ggraph
* Date/Publication: 2022-10-09 20:33:19 UTC
* Number of recursive dependencies: 98

Run `revdepcheck::cloud_details(, "ggraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: autograph
    > ### Title: Quickplot wrapper for networks
    > ### Aliases: autograph autograph.default
    > 
    > ### ** Examples
    > 
    > library(tidygraph)
    ...
    
        filter
    
    > gr <- create_notable('herschel') %>%
    +   mutate(class = sample(letters[1:3], n(), TRUE)) %E>%
    +   mutate(weight = runif(n()))
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: %E>% ... create_notable -> as_tbl_graph -> make_graph -> make_famous_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Edges.Rmd’ using rmarkdown
    
    Quitting from lines 40-75 [unnamed-chunk-2] (Edges.Rmd)
    Error: processing vignette 'Edges.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘Edges.Rmd’
    
    --- re-building ‘Layouts.Rmd’ using rmarkdown
    
    ...
    Quitting from lines 67-77 [unnamed-chunk-2] (tidygraph.Rmd)
    Error: processing vignette 'tidygraph.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘tidygraph.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘Edges.Rmd’ ‘Layouts.Rmd’ ‘Nodes.Rmd’ ‘tidygraph.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.7Mb
      sub-directories of 1Mb or more:
        doc    3.5Mb
        libs   5.9Mb
    ```

# ghypernet

<details>

* Version: 1.1.0
* GitHub: NA
* Source code: https://github.com/cran/ghypernet
* Date/Publication: 2021-10-15 13:30:05 UTC
* Number of recursive dependencies: 98

Run `revdepcheck::cloud_details(, "ghypernet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ghypernet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: CreateIgGraphs
    > ### Title: Convert a list of adjacency matrices to a list of igraph graphs.
    > ### Aliases: CreateIgGraphs
    > 
    > ### ** Examples
    > 
    > data('adj_karate')
    > adj_list <- list(adj_karate)
    > glist <- CreateIgGraphs(adj_list, FALSE, FALSE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: CreateIgGraphs -> lapply -> FUN -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Significantlinks.Rmd’ using rmarkdown
    --- finished re-building ‘Significantlinks.Rmd’
    
    --- re-building ‘Tutorial_NRM.Rmd’ using rmarkdown
    
    Quitting from lines 643-649 [unnamed-chunk-39] (Tutorial_NRM.Rmd)
    Error: processing vignette 'Tutorial_NRM.Rmd' failed with diagnostics:
    No layout function defined for objects of class <matrix>
    ...
    --- failed re-building ‘Tutorial_NRM.Rmd’
    
    --- re-building ‘tutorial.Rmd’ using rmarkdown
    --- finished re-building ‘tutorial.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Tutorial_NRM.Rmd’
    
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

# GISSB

<details>

* Version: 1.1
* GitHub: NA
* Source code: https://github.com/cran/GISSB
* Date/Publication: 2023-01-10 18:33:14 UTC
* Number of recursive dependencies: 114

Run `revdepcheck::cloud_details(, "GISSB")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘GISSB-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: path_leaflet
    > ### Title: Visualize the shortest path with Leaflet
    > ### Aliases: path_leaflet
    > 
    > ### ** Examples
    > 
    > 
    ...
    > shortest_path_igraph(from_node_ID = 25,
    +                              to_node_ID = 33,
    +                              unit = "minutes",
    +                              path = TRUE,
    +                              graph_object = graph_sampledata) %>%
    +                              path_leaflet(graph_object = graph_sampledata)
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: %>% ... <Anonymous> -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       12. │                   └─base::eval(exprs, env)
       13. │                     └─base::eval(exprs, env)
       14. │                       └─GISSB::vegnett_to_R(...) at tests/testthat/helper_files.R:4:0
       15. │                         └─tidygraph::tbl_graph(...)
       16. │                           ├─tidygraph::as_tbl_graph(...)
       17. │                           └─tidygraph:::as_tbl_graph.list(...)
       18. │                             └─tidygraph:::as_graph_node_edge(x, directed = directed, node_key = node_key)
       19. │                               └─igraph::graph_from_edgelist(as.matrix(edges[, 1:2]), directed = directed)
       20. │                                 └─igraph::make_graph(t(el), directed = directed)
       21. │                                   ├─base::do.call(old_graph, args)
       22. │                                   └─igraph (local) `<fn>`(`<int[,1741]>`, directed = TRUE)
       23. └─base::.handleSimpleError(...)
       24.   └─testthat (local) h(simpleError(msg, call))
       25.     └─rlang::abort(...)
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 866 marked UTF-8 strings
    ```

# gmat

<details>

* Version: 0.2.2
* GitHub: https://github.com/gherardovarando/gmat
* Source code: https://github.com/cran/gmat
* Date/Publication: 2020-08-30 01:00:18 UTC
* Number of recursive dependencies: 55

Run `revdepcheck::cloud_details(, "gmat")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘gmat-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dag-constrained correlation matrices
    > ### Title: Simulation of correlation matrices
    > ### Aliases: 'dag-constrained correlation matrices' chol_mh chol_iid
    > 
    > ### ** Examples
    > 
    > ## Cholesky sampling via Metropolis-Hastings
    ...
    [2,] -0.7183196  1.0000000  0.9953518
    [3,] -0.7542058  0.9953518  1.0000000
    
    > 
    > # Generate a matrix with a percentage of zeros
    > chol_mh(d = 0.5)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: chol_mh -> rgraph -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─gmat::rgraph(p = p, d = d) at test_utils.R:98:2
       2.   └─igraph::sample_gnp(n = p, p = d)
      ── Error ('test_utils.R:113:3'): the oriented dag does not contain v-structures ──
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─gmat::rgraph(p = p, d = d) at test_utils.R:113:2
       2.   └─igraph::sample_gnp(n = p, p = d)
      
      [ FAIL 16 | WARN 0 | SKIP 0 | PASS 45 ]
      Error: Test failures
      Execution halted
    ```

# GMPro

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/GMPro
* Date/Publication: 2020-06-25 14:00:02 UTC
* Number of recursive dependencies: 40

Run `revdepcheck::cloud_details(, "GMPro")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘GMPro-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: DP_SBM
    > ### Title: Degree profile graph matching with community detection.
    > ### Aliases: DP_SBM
    > 
    > ### ** Examples
    > 
    > ### Here we use graphs under stochastic block model(SBM).
    ...
    > dB[lower.tri(dB)] = t(dB)[lower.tri(dB)]
    > B1 = G*dB
    > indB = sample(1:n, n, replace = FALSE)
    > labelB = l[indB]
    > B = B1[indB, indB]
    > DP_SBM(A = A, B = B, K = 2, fun = "EEpost", rep = 10, d = 3)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: DP_SBM ... graph.incidence -> graph.incidence.dense -> make_empty_graph
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# GOxploreR

<details>

* Version: 1.2.6
* GitHub: NA
* Source code: https://github.com/cran/GOxploreR
* Date/Publication: 2022-04-19 14:02:33 UTC
* Number of recursive dependencies: 114

Run `revdepcheck::cloud_details(, "GOxploreR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘GOxploreR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: prioritizedGOTerms
    > ### Title: prioritization of a lists of GO-terms
    > ### Aliases: prioritizedGOTerms
    > 
    > ### ** Examples
    > 
    > 
    > Terms <-c("GO:0000278", "GO:0006414","GO:0022403","GO:0006415","GO:0006614",
    +  "GO:0045047","GO:0022411","GO:0001775","GO:0046649","GO:045321")
    > prioritizedGOTerms(Terms, organism = "Human", sp=TRUE, domain = "BP")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: prioritizedGOTerms ... graph.edgelist -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘GOxploreR.Rmd’ using rmarkdown
    
    Quitting from lines 355-366 [unnamed-chunk-16] (GOxploreR.Rmd)
    Error: processing vignette 'GOxploreR.Rmd' failed with diagnostics:
    error in evaluating the argument 'x' in selecting a method for function 'head': No layout function defined for objects of class <network>
    --- failed re-building ‘GOxploreR.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘GOxploreR.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.7Mb
      sub-directories of 1Mb or more:
        R   6.2Mb
    ```

# gRain

<details>

* Version: 1.3.13
* GitHub: NA
* Source code: https://github.com/cran/gRain
* Date/Publication: 2023-03-09 16:20:02 UTC
* Number of recursive dependencies: 59

Run `revdepcheck::cloud_details(, "gRain")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘gRain-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: chest
    > ### Title: Chest clinic example
    > ### Aliases: chest chest_cpt
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    ...
    > b.s  <- cptable(~bronc|smoke, values=c(6,4,3,7), levels=yn)
    > e.lt <- cptable(~either|lung:tub,values=c(1,0,1,0,1,0,0,1),levels=yn)
    > x.e  <- cptable(~xray|either, values=c(98,2,5,95), levels=yn)
    > d.be <- cptable(~dysp|bronc:either, values=c(9,1,7,3,8,2,1,9), levels=yn)
    > 
    > grain(compileCPT(a, t.a, s, l.s, b.s, e.lt, x.e, d.be))
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: grain ... asMethod -> g_gn2ig_ -> <Anonymous> -> graph_from_adj_list
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testhat.R’
    Running the tests in ‘tests/testhat.R’ failed.
    Last 13 lines of output:
        8.         │ └─gRbase:::topo_sortMAT_(amat)
        9.         └─methods::as(object, "dgCMatrix")
       10.           └─gRbase (local) asMethod(object)
       11.             └─gRbase::g_gn2sm_(from)
       12.               ├─igraph::as_adjacency_matrix(as(object, "igraph"))
       13.               │ └─igraph:::ensure_igraph(graph)
       14.               └─methods::as(object, "igraph")
       15.                 └─gRbase (local) asMethod(object)
       16.                   └─gRbase::g_gn2ig_(from)
       17.                     └─igraph::igraph.from.graphNEL(object)
       18.                       └─igraph::graph_from_adj_list(al, mode = mode, duplicate = TRUE)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘grain-intro.Rnw’ using knitr
    
    Quitting from lines 121-134 [unnamed-chunk-3] (grain-intro.Rnw)
    Error: processing vignette 'grain-intro.Rnw' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘grain-intro.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘grain-intro.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# grainscape

<details>

* Version: 0.4.4
* GitHub: https://github.com/achubaty/grainscape
* Source code: https://github.com/cran/grainscape
* Date/Publication: 2023-04-20 08:40:02 UTC
* Number of recursive dependencies: 96

Run `revdepcheck::cloud_details(, "grainscape")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘grainscape-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: GOC
    > ### Title: Produce a grains of connectivity model at multiple scales
    > ###   (patch-based or lattice GOC)
    > ### Aliases: GOC GOC,mpg-method
    > 
    > ### ** Examples
    > 
    ...
    > tiny <- raster::raster(system.file("extdata/tiny.asc", package = "grainscape"))
    > 
    > ## Create a resistance surface from a raster using an is-becomes reclassification
    > tinyCost <- raster::reclassify(tiny, rcl = cbind(c(1, 2, 3, 4), c(1, 5, 10, 12)))
    > ## Produce a patch-based MPG where patches are resistance features=1
    > tinyPatchMPG <- MPG(cost = tinyCost, patch = tinyCost == 1)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: MPG -> MPG -> graph_from_data_frame -> make_empty_graph
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘MPG_algorithm.Rmd’ using rmarkdown
    A new version of TeX Live has been released. If you need to install or update any LaTeX packages, you have to upgrade TinyTeX with tinytex::reinstall_tinytex(repository = "illinois").
    
    tlmgr: Local TeX Live (2022) is older than remote repository (2023).
    Cross release updates are only supported with
      update-tlmgr-latest(.sh/.exe) --update
    See https://tug.org/texlive/upgrade.html for details.
    Warning in system2("tlmgr", args, ...) :
      running command ''tlmgr' search --file --global '/grffile.sty'' had status 1
    ...
    
    Error: processing vignette 'grainscape_vignette.Rmd' failed with diagnostics:
    LaTeX failed to compile /tmp/workdir/grainscape/new/grainscape.Rcheck/vign_test/grainscape/vignettes/grainscape_vignette.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See grainscape_vignette.log for more info.
    --- failed re-building ‘grainscape_vignette.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘MPG_algorithm.Rmd’ ‘grainscape_vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        doc    1.5Mb
        libs   2.3Mb
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
    
    > ### Name: grand
    > ### Title: Apply Guidelines for Reporting About Network Data (GRAND) to an
    > ###   igraph object
    > ### Aliases: grand
    > 
    > ### ** Examples
    > 
    > data(airport)  #Load example data
    > airport <- grand(airport)  #Apply GRAND interactively
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: grand ... <Anonymous> -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘grand.Rmd’ using rmarkdown
    
    Quitting from lines 167-178 [unnamed-chunk-3] (grand.Rmd)
    Error: processing vignette 'grand.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
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
    
    > ### Name: add_nodes_attr
    > ### Title: Add attributes to the nodes of a graph
    > ### Aliases: add_nodes_attr
    > 
    > ### ** Examples
    > 
    > data("data_tuto")
    > graph <- data_tuto[[3]]
    > df_nodes <- data.frame(Id = igraph::V(graph)$name,
    +                        Area = runif(50, min = 10, max = 60))
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: data.frame ... <Anonymous> -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Error loading dataset 'data_tuto':
       Error in .igraph.status("Restore graph external pointer.\n") : 
        could not find function ".igraph.status"
      
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘Rdpack’
      All declared Imports should be used.
    ```

# graphclust

<details>

* Version: 1.3
* GitHub: NA
* Source code: https://github.com/cran/graphclust
* Date/Publication: 2023-06-07 16:50:02 UTC
* Number of recursive dependencies: 15

Run `revdepcheck::cloud_details(, "graphclust")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘graphclust-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: metagraph
    > ### Title: Plot the metagraph of the parameter of the stochastic block
    > ###   model associated with one of the estimated graph clusters
    > ### Aliases: metagraph
    > 
    > ### ** Examples
    > 
    ...
    
    initialization of DelatICL...
    
    clustering algorithm...
    
    > metagraph(1, res)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: metagraph ... graph_from_adjacency_matrix -> graph.adjacency.dense
    Execution halted
    ```

# graphicalExtremes

<details>

* Version: 0.2.0
* GitHub: https://github.com/sebastian-engelke/graphicalExtremes
* Source code: https://github.com/cran/graphicalExtremes
* Date/Publication: 2022-12-02 12:20:04 UTC
* Number of recursive dependencies: 94

Run `revdepcheck::cloud_details(, "graphicalExtremes")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘graphicalExtremes-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: Gamma2graph
    > ### Title: Transformation of matrix to graph object
    > ### Aliases: Gamma2graph Theta2graph
    > 
    > ### ** Examples
    > 
    > Gamma <- cbind(
    ...
    +   c(1.5, 0, 2, 1.5),
    +   c(1.5, 2, 0, 1.5),
    +   c(2, 1.5, 1.5, 0)
    + )
    > 
    > Gamma2graph(Gamma)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: Gamma2graph ... Theta2graph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘glasso’
    ```

# graphlayouts

<details>

* Version: 1.0.0
* GitHub: https://github.com/schochastics/graphlayouts
* Source code: https://github.com/cran/graphlayouts
* Date/Publication: 2023-05-01 08:00:02 UTC
* Number of recursive dependencies: 93

Run `revdepcheck::cloud_details(, "graphlayouts")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─igraph::make_full_graph(3) at test-graph_manipulate.R:2:3
      ── Error ('test-layout_backbone.R:2:3'): backbone layout works ─────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─graphlayouts::layout_as_backbone(igraph::graph.full(10)) at test-layout_backbone.R:2:2
       2. │ └─igraph::is.igraph(g)
       3. └─igraph::graph.full(10)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 113 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 11.1Mb
      sub-directories of 1Mb or more:
        doc    1.9Mb
        help   2.4Mb
        libs   6.5Mb
    ```

# graphseg

<details>

* Version: 0.1.0
* GitHub: https://github.com/goepp/graphseg
* Source code: https://github.com/cran/graphseg
* Date/Publication: 2023-05-02 08:10:06 UTC
* Number of recursive dependencies: 67

Run `revdepcheck::cloud_details(, "graphseg")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘graphseg-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: utrecht_district
    > ### Title: Administrative areas of the Netherlands aroung the city of
    > ###   Utrecht
    > ### Aliases: utrecht_district graph_utrecht_district
    > ### Keywords: datasets
    > 
    > ### ** Examples
    ...
    old-style crs object detected; please recreate object with a recent sf::st_crs()
    old-style crs object detected; please recreate object with a recent sf::st_crs()
    Warning: st_crs<- : replacing crs does not reproject data; use st_transform for that
    > adj_municip <- as(as(igraph::as_adjacency_matrix(graph_utrecht_district, type = "both"),
    +                      "symmetricMatrix"),
    +                   "TsparseMatrix")
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: as ... <Anonymous> -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 14768 marked UTF-8 strings
    ```

# graphTweets

<details>

* Version: 0.5.3
* GitHub: https://github.com/JohnCoene/graphTweets
* Source code: https://github.com/cran/graphTweets
* Date/Publication: 2020-01-08 09:00:08 UTC
* Number of recursive dependencies: 58

Run `revdepcheck::cloud_details(, "graphTweets")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘graphTweets-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: gt_graph
    > ### Title: Graph
    > ### Aliases: gt_graph
    > 
    > ### ** Examples
    > 
    > # simulate dataset
    ...
    + )
    > 
    > tweets %>% 
    +   gt_edges(text, screen_name, status_id) %>% 
    +   gt_nodes() %>% 
    +   gt_graph() -> net
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: %>% -> gt_graph -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Error ('test_overhaul.R:53:3'): nodes & edges & dyn ─────────────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─testthat::expect_is(...) at test_overhaul.R:53:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. ├─... %>% gt_graph()
       5. └─graphTweets::gt_graph(.)
       6.   └─igraph::graph.data.frame(gt[["edges"]], directed = TRUE, vertices = gt[["nodes"]])
       7.     └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 11 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘utils’
      All declared Imports should be used.
    ```

# gRbase

<details>

* Version: 1.8.9
* GitHub: NA
* Source code: https://github.com/cran/gRbase
* Date/Publication: 2022-11-10 10:40:02 UTC
* Number of recursive dependencies: 49

Run `revdepcheck::cloud_details(, "gRbase")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘gRbase-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dag2chol
    > ### Title: Create regression matrix matrix from DAG A DAG can be
    > ###   represented as a triangular matrix of regression coefficients.
    > ### Aliases: dag2chol
    > 
    > ### ** Examples
    > 
    > 
    > g <- dag(~x2|x1 + x3|x1:x2 + x4|x3)
    > gi <- as(g, "igraph")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: as ... asMethod -> g_gn2ig_ -> <Anonymous> -> graph_from_adj_list
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testhat.R’
    Running the tests in ‘tests/testhat.R’ failed.
    Last 13 lines of output:
        9.     └─gRbase (local) asMethod(object)
       10.       └─gRbase::g_gn2dm_(from)
       11.         ├─methods::as(...)
       12.         │ └─methods:::.class1(object)
       13.         ├─igraph::as_adjacency_matrix(as(object, "igraph"))
       14.         │ └─igraph:::ensure_igraph(graph)
       15.         └─methods::as(object, "igraph")
       16.           └─gRbase (local) asMethod(object)
       17.             └─gRbase::g_gn2ig_(from)
       18.               └─igraph::igraph.from.graphNEL(object)
       19.                 └─igraph::graph_from_adj_list(al, mode = mode, duplicate = TRUE)
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 52 ]
      Error: Test failures
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
    Quitting from lines 369-377 [unnamed-chunk-15] (graphs.Rnw)
    Error: processing vignette 'graphs.Rnw' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘graphs.Rnw’
    
    SUMMARY: processing the following files failed:
      ‘arrays.Rnw’ ‘graphs.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 25.7Mb
      sub-directories of 1Mb or more:
        libs  23.6Mb
    ```

# gRim

<details>

* Version: 0.2.10
* GitHub: NA
* Source code: https://github.com/cran/gRim
* Date/Publication: 2022-10-15 22:22:35 UTC
* Number of recursive dependencies: 55

Run `revdepcheck::cloud_details(, "gRim")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘gRim-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: getEdges
    > ### Title: Find edges in a graph or edges not in an undirected graph.
    > ### Aliases: getEdges getEdges.list getEdges.graphNEL getEdges.matrix
    > ###   getInEdges getOutEdges getEdgesMAT getInEdgesMAT getOutEdgesMAT
    > ### Keywords: utilities
    > 
    > ### ** Examples
    > 
    > 
    > gg     <- ug(~a:b:d + a:c:d + c:e)
    > glist  <- getCliques(gg)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: getCliques ... asMethod -> g_gn2ig_ -> <Anonymous> -> graph_from_adj_list
    Execution halted
    ```

*   checking running R code from vignettes ... ERROR
    ```
    Errors in running code in vignettes:
    when running code in ‘grim.Rnw’
      ...
    +     "mental", "phys")), data = reinis, interactions = 2)
    
    > formula(dm3)
    ~smoke * mental + smoke * phys + mental * phys + smoke * systol
    
    > iplot(dm1)
    
      When sourcing ‘grim.R’:
    Error: could not find function ".igraph.status"
    Execution halted
    
      ‘grim.Rnw’ using ‘latin1’... failed
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.7Mb
      sub-directories of 1Mb or more:
        libs   4.9Mb
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘grim.Rnw’ using Sweave
    Loading required package: gRbase
    Warning in dir.create("figures") : 'figures' already exists
    Loading required package: graph
    Loading required package: BiocGenerics
    
    Attaching package: ‘BiocGenerics’
    
    The following objects are masked from ‘package:stats’:
    ...
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    
    --- failed re-building ‘grim.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘grim.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# handwriter

<details>

* Version: 1.0.1
* GitHub: NA
* Source code: https://github.com/cran/handwriter
* Date/Publication: 2021-08-16 16:20:02 UTC
* Number of recursive dependencies: 64

Run `revdepcheck::cloud_details(, "handwriter")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘handwriter-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: AddLetterImages
    > ### Title: AddLetterImages
    > ### Aliases: AddLetterImages
    > 
    > ### ** Examples
    > 
    > twoSent_document = list()
    > twoSent_document$image = twoSent
    > twoSent_document$thin = thinImage(twoSent_document$image)
    > twoSent_processList = processHandwriting(twoSent_document$thin, dim(twoSent_document$image))
    Starting Processing...
    Getting Nodes...Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: processHandwriting -> graph_from_data_frame -> make_empty_graph
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.6Mb
      sub-directories of 1Mb or more:
        libs   4.5Mb
    ```

# hero

<details>

* Version: 0.4.7
* GitHub: NA
* Source code: https://github.com/cran/hero
* Date/Publication: 2020-01-24 22:00:02 UTC
* Number of recursive dependencies: 148

Run `revdepcheck::cloud_details(, "hero")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘hero-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: adjacent
    > ### Title: Determine adjacent points
    > ### Aliases: adjacent
    > 
    > ### ** Examples
    > 
    > # basic coordinates
    ...
    > coords = expand.grid(1:4, 1:4)
    > # plot coordinates to see relationships
    > plot(coords, type = "n")
    > text(coords)
    > a = adjacent(coords, digits = 1)
    > plot(a)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... graph.adjacency.sparse -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

# HLSM

<details>

* Version: 0.9.0
* GitHub: NA
* Source code: https://github.com/cran/HLSM
* Date/Publication: 2021-12-06 13:00:02 UTC
* Number of recursive dependencies: 10

Run `revdepcheck::cloud_details(, "HLSM")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘HLSM-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: HLSMrandomEF
    > ### Title: Function to run the MCMC sampler in random effects latent space
    > ###   model, HLSMfixedEF for fixed effects model, or LSM for single network
    > ###   latent space model)
    > ### Aliases: HLSMrandomEF HLSMfixedEF LSM print.HLSM print.summary.HLSM
    > ###   summary.HLSM getIntercept getLS getLikelihood getBeta
    > 
    ...
    > 
    > #Fixed effect HLSM on Pitt and Spillane data 
    > 
    > fixed.fit = HLSMfixedEF(Y = ps.advice.mat, senderCov=ps.node.df,
    + 	initialVals = initialVals,priors = priors,
    + 	tune = tune,tuneIn = FALSE,dd = 2,niter = niter)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: HLSMfixedEF ... lapply -> FUN -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

# HospitalNetwork

<details>

* Version: 0.9.3
* GitHub: https://github.com/PascalCrepey/HospitalNetwork
* Source code: https://github.com/cran/HospitalNetwork
* Date/Publication: 2023-02-27 08:22:43 UTC
* Number of recursive dependencies: 115

Run `revdepcheck::cloud_details(, "HospitalNetwork")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘HospitalNetwork-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: HospiNet
    > ### Title: Class providing the HospiNet object with its methods
    > ### Aliases: HospiNet
    > ### Keywords: data
    > 
    > ### ** Examples
    > 
    ...
    +   condition = "dates"
    + )
    Checking for missing values...
    Checking for duplicated records...
    Removed 0 duplicates
    Done.
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: hospinet_from_subject_database ... checkClass -> <Anonymous> -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        9. │     └─checkmate::checkClass(x, classes, ordered, null.ok)
       10. └─HospitalNetwork (local) `<fn>`()
       11.   └─igraph::graph_from_data_frame(self$edgelist)
       12.     └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 2 | WARN 0 | SKIP 2 | PASS 55 ]
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

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘HospitalNetwork-Workflow.Rmd’ using rmarkdown
    
    Quitting from lines 154-157 [setup2] (HospitalNetwork-Workflow.Rmd)
    Error: processing vignette 'HospitalNetwork-Workflow.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘HospitalNetwork-Workflow.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘HospitalNetwork-Workflow.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# HTT

<details>

* Version: 0.1.2
* GitHub: NA
* Source code: https://github.com/cran/HTT
* Date/Publication: 2023-03-12 14:30:02 UTC
* Number of recursive dependencies: 72

Run `revdepcheck::cloud_details(, "HTT")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘HTT-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: Hypothesis Testing Tree
    > ### Title: Hypothesis Testing Tree
    > ### Aliases: HTT
    > ### Keywords: HTT
    > 
    > ### ** Examples
    > 
    > ## regression
    > data("Boston", package = "MASS")
    > Bostonhtt <- HTT(medv ~ . , data = Boston, controls = htt_control(R = 99))
    > plot(Bostonhtt)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... plot.htt -> graph_from_data_frame -> make_empty_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Intro.Rmd’ using rmarkdown
    
    Quitting from lines 24-32 [unnamed-chunk-2] (Intro.Rmd)
    Error: processing vignette 'Intro.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘Intro.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Intro.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.1Mb
      sub-directories of 1Mb or more:
        libs   6.5Mb
    ```

# huge

<details>

* Version: 1.3.5
* GitHub: NA
* Source code: https://github.com/cran/huge
* Date/Publication: 2021-06-30 20:20:02 UTC
* Number of recursive dependencies: 10

Run `revdepcheck::cloud_details(, "huge")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘huge-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: huge
    > ### Title: High-dimensional undirected graph estimation
    > ### Aliases: huge
    > 
    > ### ** Examples
    > 
    > #generate data
    ...
    Model: Meinshausen & Buhlmann graph estimation (mb)
    Input: The Data Matrix
    Path length: 10 
    Graph dimension: 12 
    Sparsity level: 0 -----> 0.6969697 
    > plot(out1)         #Not aligned
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... plot.huge -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘vignette.Rnw’ using Sweave
    Error: processing vignette 'vignette.Rnw' failed with diagnostics:
    Running 'texi2dvi' on 'vignette.tex' failed.
    LaTeX errors:
    ! LaTeX Error: File `pdfpages.sty' not found.
    
    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: sty)
    ...
    l.8 \usepackage
                   {Sweave}^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘vignette.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘vignette.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 13.5Mb
      sub-directories of 1Mb or more:
        libs  12.0Mb
    ```

# ICDS

<details>

* Version: 0.1.2
* GitHub: NA
* Source code: https://github.com/cran/ICDS
* Date/Publication: 2021-07-15 11:30:10 UTC
* Number of recursive dependencies: 93

Run `revdepcheck::cloud_details(, "ICDS")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ICDS-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: opt_subpath
    > ### Title: opt_subpath
    > ### Aliases: opt_subpath
    > 
    > ### ** Examples
    > 
    > zz<-GetExampleData("zzz")
    > subpathdata<-GetExampleData("subpathdata")
    > optsubpath<-opt_subpath(subpathdata,zz,overlap=0.6)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: opt_subpath ... overlapSPMatrix -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘ICDS.Rmd’ using rmarkdown
    
    Quitting from lines 137-140 [unnamed-chunk-10] (ICDS.Rmd)
    Error: processing vignette 'ICDS.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘ICDS.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘ICDS.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# iconr

<details>

* Version: 0.1.0
* GitHub: https://github.com/zoometh/iconr
* Source code: https://github.com/cran/iconr
* Date/Publication: 2021-02-16 09:10:05 UTC
* Number of recursive dependencies: 81

Run `revdepcheck::cloud_details(, "iconr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘iconr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: contemp_nds
    > ### Title: Select Contemporaneous Nodes
    > ### Aliases: contemp_nds
    > ### Keywords: ~kwd1 graphs
    > 
    > ### ** Examples
    > 
    ...
    > eds.df <- read_eds(site = "Ibahernando",
    +                    decor = "Ibahernando",
    +                    dir = dataDir)
    > 
    > # Extract the subgraph contemporaneous to the node 2
    > l_dec_df <- contemp_nds(nds.df, eds.df, selected.nd = 2)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: contemp_nds -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# icosa

<details>

* Version: 0.11.0
* GitHub: https://github.com/adamkocsis/icosa
* Source code: https://github.com/cran/icosa
* Date/Publication: 2023-03-23 14:42:09 UTC
* Number of recursive dependencies: 52

Run `revdepcheck::cloud_details(, "icosa")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘icosa-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: SpPolygons
    > ### Title: Spatial polygons from an icosahedral grid
    > ### Aliases: SpPolygons SpPolygons,trigrid-method
    > ###   SpPolygons,hexagrid-method
    > 
    > ### ** Examples
    > 
    > a <- trigrid()
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: trigrid ... .local -> do.call -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘icosa_cran.Rmd’ using rmarkdown
    
    Quitting from lines 17-20 [unnamed-chunk-1] (icosa_cran.Rmd)
    Error: processing vignette 'icosa_cran.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘icosa_cran.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘icosa_cran.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.9Mb
      sub-directories of 1Mb or more:
        libs   4.3Mb
    ```

# idopNetwork

<details>

* Version: 0.1.2
* GitHub: https://github.com/cxzdsa2332/idopNetwork
* Source code: https://github.com/cran/idopNetwork
* Date/Publication: 2023-04-18 06:50:02 UTC
* Number of recursive dependencies: 78

Run `revdepcheck::cloud_details(, "idopNetwork")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘idopNetwork_vignette.Rmd’ using rmarkdown
    
    Quitting from lines 309-311 [unnamed-chunk-36] (idopNetwork_vignette.Rmd)
    Error: processing vignette 'idopNetwork_vignette.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘idopNetwork_vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘idopNetwork_vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# iGraphMatch

<details>

* Version: 2.0.1
* GitHub: https://github.com/dpmcsuss/iGraphMatch
* Source code: https://github.com/cran/iGraphMatch
* Date/Publication: 2022-09-13 18:30:02 UTC
* Number of recursive dependencies: 80

Run `revdepcheck::cloud_details(, "iGraphMatch")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘iGraphMatch-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: C.Elegans
    > ### Title: Chemical synapses and electrical synapses networks of roundworm
    > ### Aliases: C.Elegans
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > data(C.Elegans)
    > g1 <- C.Elegans[[1]]
    > g2 <- C.Elegans[[2]]
    > plot(g1, g2)
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... .local -> identity_match -> is.igraph -> warn_version
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─igraph::sample_gnm(20, 60) at test-split_igraph.R:1:0
      ── Error ('test-umeyama.R:5:1'): (code run outside of `test_that()`) ───────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─iGraphMatch::sample_correlated_gnp_pair(10, 0.9, 0.5) at test-umeyama.R:5:0
       2.   └─iGraphMatch:::sample_correlated_gnp_pair_no_junk(...)
       3.     └─igraph::sample_gnp(n, p, ...)
      
      [ FAIL 22 | WARN 0 | SKIP 1 | PASS 25 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘iGraphMatch.Rmd’ using rmarkdown
    
    Quitting from lines 648-654 [sample_graph] (iGraphMatch.Rmd)
    Error: processing vignette 'iGraphMatch.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘iGraphMatch.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘iGraphMatch.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# IMEC

<details>

* Version: 0.2.0
* GitHub: NA
* Source code: https://github.com/cran/IMEC
* Date/Publication: 2020-11-27 10:10:03 UTC
* Number of recursive dependencies: 103

Run `revdepcheck::cloud_details(, "IMEC")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘IMEC-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: computeIMEC
    > ### Title: Computes the Ising model of explanatory coherence.
    > ### Aliases: computeIMEC
    > 
    > ### ** Examples
    > 
    > # simple example comparing two hypotheses one of them with more explanatory breadth##
    ...
    > coherence <- computeIMEC(explanations, Thresholds, Phenomena, T1)
    > summary(coherence)
      T1     EC_T1
    1 H1 0.8673686
    2 H2 0.1347264
    > plot(coherence)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot -> plot.IMEC -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       2. └─IMEC:::plot.IMEC(IMEC)
       3.   └─igraph::graph_from_adjacency_matrix(...)
       4.     └─igraph:::graph.adjacency.dense(...)
      ── Error ('test-0-basictests.R:58:3'): analytic way of calculating coherence works for 1 theory ──
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─base::plot(IMEC) at test-0-basictests.R:58:2
       2. └─IMEC:::plot.IMEC(IMEC)
       3.   └─igraph::graph_from_adjacency_matrix(...)
       4.     └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 2 | WARN 0 | SKIP 1 | PASS 2 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# immunarch

<details>

* Version: 0.9.0
* GitHub: https://github.com/immunomind/immunarch
* Source code: https://github.com/cran/immunarch
* Date/Publication: 2022-12-15 15:00:05 UTC
* Number of recursive dependencies: 194

Run `revdepcheck::cloud_details(, "immunarch")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘immunarch-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: seqCluster
    > ### Title: Function for assigning clusters based on sequences similarity
    > ### Aliases: seqCluster
    > 
    > ### ** Examples
    > 
    > 
    ...
     18. ├─reshape2::melt(.)
     19. ├─igraph::clusters(.)
     20. │ └─igraph:::ensure_igraph(graph)
     21. ├─igraph::graph_from_data_frame(.)
     22. │ └─igraph::make_empty_graph(n = 0, directed = directed)
     23. └─base::.handleSimpleError(...)
     24.   └─purrr (local) h(simpleError(msg, call))
     25.     └─cli::cli_abort(...)
     26.       └─rlang::abort(...)
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.4Mb
      sub-directories of 1Mb or more:
        data   3.3Mb
        doc    1.6Mb
    ```

# immuneSIM

<details>

* Version: 0.8.7
* GitHub: https://github.com/GreiffLab/immuneSIM
* Source code: https://github.com/cran/immuneSIM
* Date/Publication: 2019-09-27 10:30:06 UTC
* Number of recursive dependencies: 66

Run `revdepcheck::cloud_details(, "immuneSIM")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘immuneSIM-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: hub_seqs_exclusion
    > ### Title: Deletes top hub sequences from repertoire, changing the network
    > ###   architecture.
    > ### Aliases: hub_seqs_exclusion
    > 
    > ### ** Examples
    > 
    > repertoire <- list_example_repertoires[["example_repertoire_A"]]
    > rep_excluded_hubs <- hub_seqs_exclusion(repertoire, top_x = 0.005, output_dir = "")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: hub_seqs_exclusion -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# imsig

<details>

* Version: 1.1.3
* GitHub: https://github.com/ajitjohnson/imsig
* Source code: https://github.com/cran/imsig
* Date/Publication: 2021-01-10 01:00:02 UTC
* Number of recursive dependencies: 52

Run `revdepcheck::cloud_details(, "imsig")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘imsig-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot_network
    > ### Title: Network graph of ImSig genes
    > ### Aliases: plot_network
    > 
    > ### ** Examples
    > 
    > plot_network (exp = example_data, r = 0.7)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot_network ... graph_from_adjacency_matrix -> graph.adjacency.dense
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

*   checking examples ... ERROR
    ```
    Running examples in ‘incidentally-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add.blocks
    > ### Title: Adds a block structure to an incidence matrix
    > ### Aliases: add.blocks
    > 
    > ### ** Examples
    > 
    > I <- incidence.from.probability(R = 100, C = 100, P = .1)
    ...
    > all(rowSums(I)==rowSums(blocked))
    [1] TRUE
    > all(colSums(I)==colSums(blocked))
    [1] TRUE
    > 
    > B <- igraph::sample_bipartite(100, 100, p=.1)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous>
    Execution halted
    ```

# influenceR

<details>

* Version: 0.1.5
* GitHub: https://github.com/khanna-lab/influenceR
* Source code: https://github.com/cran/influenceR
* Date/Publication: 2023-05-18 10:00:02 UTC
* Number of recursive dependencies: 35

Run `revdepcheck::cloud_details(, "influenceR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘influenceR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: betweenness
    > ### Title: Vertex Betweenness centrality measure.
    > ### Aliases: betweenness
    > 
    > ### ** Examples
    > 
    > ig.ex <- igraph::erdos.renyi.game(100, p.or.m=0.3) # generate an undirected 'igraph' object
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       6.   └─igraph::is_igraph(g)
       7.     └─igraph:::warn_version(graph)
      ── Error ('test_reference.R:72:3'): bridging matches reference function ────────
      Error in `.igraph.status("Restore graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─influenceR (local) bridge_test(flo_graph) at test_reference.R:72:2
       2.   └─igraph::V(g) at test_reference.R:26:2
       3.     └─igraph:::ensure_igraph(graph)
       4.       └─igraph::is_igraph(graph)
       5.         └─igraph:::warn_version(graph)
      
      [ FAIL 5 | WARN 2 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

# influential

<details>

* Version: 2.2.7
* GitHub: https://github.com/asalavaty/influential
* Source code: https://github.com/cran/influential
* Date/Publication: 2023-05-16 05:10:02 UTC
* Number of recursive dependencies: 187

Run `revdepcheck::cloud_details(, "influential")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘influential-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: V
    > ### Title: Vertices of an igraph graph
    > ### Aliases: V vertices
    > ### Keywords: graph_vertices
    > 
    > ### ** Examples
    > 
    > MyData <- coexpression.data
    > My_graph <- graph_from_data_frame(MyData)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: graph_from_data_frame -> make_empty_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Vignettes.Rmd’ using rmarkdown
    
    Quitting from lines 140-145 [g_dataframe] (Vignettes.Rmd)
    Error: processing vignette 'Vignettes.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘Vignettes.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Vignettes.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# intergraph

<details>

* Version: 2.0-2
* GitHub: NA
* Source code: https://github.com/cran/intergraph
* Date/Publication: 2016-12-05 18:28:47
* Number of recursive dependencies: 49

Run `revdepcheck::cloud_details(, "intergraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘intergraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: asDF
    > ### Title: Convert network to data frame(s)
    > ### Aliases: asDF asDF.igraph asDF.network
    > 
    > ### ** Examples
    > 
    > # using method for 'network' objects
    ...
      ..$ label        : chr [1:15] "a" "b" "c" "d" ...
      ..$ na           : logi [1:15] FALSE FALSE FALSE FALSE FALSE FALSE ...
      ..$ vertex.names : chr [1:15] "a" "b" "c" "d" ...
    > 
    > # using method for 'igraph' objects
    > d2 <- asDF(exIgraph)
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: asDF ... <Anonymous> -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    ```

# IOHanalyzer

<details>

* Version: 0.1.6.3
* GitHub: https://github.com/IOHprofiler/IOHAnalyzer
* Source code: https://github.com/cran/IOHanalyzer
* Date/Publication: 2022-03-09 08:20:12 UTC
* Number of recursive dependencies: 132

Run `revdepcheck::cloud_details(, "IOHanalyzer")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘IOHanalyzer-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: Plot.Stats.Significance_Graph
    > ### Title: Plot a network graph showing the statistically different
    > ###   algorithms
    > ### Aliases: Plot.Stats.Significance_Graph
    > ###   Plot.Stats.Significance_Graph.DataSetList
    > 
    > ### ** Examples
    > 
    > Plot.Stats.Significance_Graph(subset(dsl, funcId == 2), 16)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: Plot.Stats.Significance_Graph ... Plot.Stats.Significance_Graph.DataSetList -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.3Mb
      sub-directories of 1Mb or more:
        data           1.4Mb
        libs           4.1Mb
        shiny-server   1.0Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 102 marked UTF-8 strings
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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: sweep.graph ... sweep.graph.default -> <Anonymous> -> do.call -> <Anonymous>
    Execution halted
    ```

# isotracer

<details>

* Version: 1.1.4
* GitHub: NA
* Source code: https://github.com/cran/isotracer
* Date/Publication: 2023-03-21 14:10:02 UTC
* Number of recursive dependencies: 157

Run `revdepcheck::cloud_details(, "isotracer")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘isotracer-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ggflows
    > ### Title: A quick-and-dirty way of visualizing relative flows in a network
    > ### Aliases: ggflows
    > 
    > ### ** Examples
    > 
    > if (requireNamespace("ggraph")) {
    ...
     13. │     └─tidygraph:::as_tbl_graph.data.frame(graph)
     14. │       └─tidygraph:::as_graph_edge_df(x, directed)
     15. │         └─igraph::graph_from_data_frame(x, directed = directed)
     16. │           └─igraph::make_empty_graph(n = 0, directed = directed)
     17. └─base::.handleSimpleError(...)
     18.   └─rlang (local) h(simpleError(msg, call))
     19.     └─handlers[[1L]](cnd)
     20.       └─cli::cli_abort("No layout function defined for objects of class {.cls {class(graph)[1]}}")
     21.         └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. └─isotracer::sankey(r, debug = TRUE, edge_f = 0.2, node_s = "prop")
        7.   └─isotracer:::sankey_place_nodes(...)
        8.     └─isotracer:::sankey_calc_nodes_locations(topo, layout)
        9.       ├─isotracer::as_tbl_graph(x)
       10.       └─isotracer:::as_tbl_graph.topology(x)
       11.         └─igraph::graph_from_adjacency_matrix(t(x))
       12.           └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 9 | WARN 0 | SKIP 0 | PASS 284 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 89.6Mb
      sub-directories of 1Mb or more:
        data   1.8Mb
        doc    2.3Mb
        libs  84.4Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘rstantools’
      All declared Imports should be used.
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# ITNr

<details>

* Version: 0.7.0
* GitHub: NA
* Source code: https://github.com/cran/ITNr
* Date/Publication: 2023-03-31 14:10:11 UTC
* Number of recursive dependencies: 82

Run `revdepcheck::cloud_details(, "ITNr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ITNr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ITNproperties
    > ### Title: ITN Properties
    > ### Aliases: ITNproperties
    > 
    > ### ** Examples
    > 
    > ##Load the network
    ...
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: ITNproperties ... <Anonymous> -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    ```

# IxPopDyMod

<details>

* Version: 0.2.0
* GitHub: https://github.com/dallenmidd/IxPopDyMod
* Source code: https://github.com/cran/IxPopDyMod
* Date/Publication: 2022-02-08 07:30:05 UTC
* Number of recursive dependencies: 69

Run `revdepcheck::cloud_details(, "IxPopDyMod")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘IxPopDyMod-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: graph_lifecycle
    > ### Title: Visualize transitions as a life cycle graph
    > ### Aliases: graph_lifecycle
    > 
    > ### ** Examples
    > 
    > graph_lifecycle(config_ex_1$transitions)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: graph_lifecycle ... %>% -> plot -> graph_from_data_frame -> make_empty_graph
    Execution halted
    ```

# jewel

<details>

* Version: 2.0.0
* GitHub: https://github.com/annaplaksienko/jewel
* Source code: https://github.com/cran/jewel
* Date/Publication: 2023-05-12 14:30:08 UTC
* Number of recursive dependencies: 45

Run `revdepcheck::cloud_details(, "jewel")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘jewel-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: constructWeights
    > ### Title: Construct weights for _jewel_ minimization problem from prior
    > ###   information on vertices degrees.
    > ### Aliases: constructWeights
    > 
    > ### ** Examples
    > 
    ...
    + G_list_true <- data$Graphs
    + true_degrees <- rowSums(G_list_true[[1]])
    + cut <- sort(true_degrees, decreasing = TRUE)[ceiling(p * 0.03)]
    + apriori_hubs <- ifelse(true_degrees >= cut, 10, 1)
    + W <- constructWeights(apriori_hubs, K = K)
    + }
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: generateData_rewire -> barabasi.game
    Execution halted
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
    
    > ### Name: compile
    > ### Title: Compile information
    > ### Aliases: compile compile.cpt_list
    > 
    > ### ** Examples
    > 
    > cptl <- cpt_list(asia2)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: cpt_list ... cpt_list.list -> graph_from_cpt_list -> <Anonymous>
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.1Mb
      sub-directories of 1Mb or more:
        libs   5.3Mb
    ```

# kangar00

<details>

* Version: 1.4.1
* GitHub: NA
* Source code: https://github.com/cran/kangar00
* Date/Publication: 2022-12-06 08:40:06 UTC
* Number of recursive dependencies: 95

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
      ..$ adj : int [1:180, 1:180] 0 0 0 0 0 0 0 0 0 0 ...
      .. ..- attr(*, "dimnames")=List of 2
      .. .. ..$ : chr [1:180] "ITPKA" "ITPKB" "ITPKC" "ADCY1" ...
      .. .. ..$ : chr [1:180] "ITPKA" "ITPKB" "ITPKC" "ADCY1" ...
      ..$ sign: int [1:594] 1 1 1 1 1 1 1 1 1 1 ...
    > g <- pathway2igraph(hsa04020)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: pathway2igraph ... pathway2igraph -> .local -> <Anonymous> -> graph.adjacency.dense
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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: get.cdn ... graph_from_adjacency_matrix -> graph.adjacency.dense
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

# keyplayer

<details>

* Version: 1.0.3
* GitHub: NA
* Source code: https://github.com/cran/keyplayer
* Date/Publication: 2016-04-16 10:33:52
* Number of recursive dependencies: 20

Run `revdepcheck::cloud_details(, "keyplayer")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘keyplayer-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: fragment
    > ### Title: Compute the Fragmentation Centrality Score in a Netwrok
    > ### Aliases: fragment
    > 
    > ### ** Examples
    > 
    > # Create a 5x5 weighted and directed adjacency matrix, where edge values
    ...
    > # Transform the edge value to distance interpretaion
    > A <- W
    > A[W!=0] <- 1/W[W!=0]
    > 
    > # List the fragmentation centrality scores for every node
    > fragment(A)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: fragment -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

# kknn

<details>

* Version: 1.3.1
* GitHub: https://github.com/KlausVigo/kknn
* Source code: https://github.com/cran/kknn
* Date/Publication: 2016-03-26 22:02:21
* Number of recursive dependencies: 7

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: specClust -> graph -> do.call -> <Anonymous>
    Execution halted
    ```

# l1spectral

<details>

* Version: 0.99.6
* GitHub: NA
* Source code: https://github.com/cran/l1spectral
* Date/Publication: 2022-01-26 17:12:46 UTC
* Number of recursive dependencies: 84

Run `revdepcheck::cloud_details(, "l1spectral")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘l1spectral-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ComputePerformances
    > ### Title: Compute the performances of the l1-spectral clustering algorithm
    > ### Aliases: ComputePerformances
    > 
    > ### ** Examples
    > 
    >  #############################################################
    ...
    >  #############################################################
    > 
    >  data(ToyData)
    > 
    >  results <- l1_spectralclustering(A = ToyData$A_hat, pen = "lasso",
    +              k=2, elements = c(1,4))
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: l1_spectralclustering ... graph_from_adjacency_matrix -> graph.adjacency.dense
    Execution halted
    ```

# lconnect

<details>

* Version: 0.1.1
* GitHub: https://github.com/FMestre1/lconnect
* Source code: https://github.com/cran/lconnect
* Date/Publication: 2021-02-06 16:10:02 UTC
* Number of recursive dependencies: 19

Run `revdepcheck::cloud_details(, "lconnect")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘lconnect-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: patch_imp
    > ### Title: Prioritization of patches
    > ### Aliases: patch_imp
    > 
    > ### ** Examples
    > 
    > vec_path <- system.file("extdata/vec_projected.shp", package = "lconnect")
    > landscape <- upload_land(vec_path, bound_path = NULL,
    +                         habitat = 1, max_dist = 500)
    > importance <- patch_imp(landscape, metric = "IIC")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: patch_imp -> con_metric -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# leidenAlg

<details>

* Version: 1.0.5
* GitHub: https://github.com/kharchenkolab/leidenAlg
* Source code: https://github.com/cran/leidenAlg
* Date/Publication: 2022-09-30 07:20:02 UTC
* Number of recursive dependencies: 68

Run `revdepcheck::cloud_details(, "leidenAlg")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘leidenAlg-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as.dendrogram.fakeCommunities
    > ### Title: Returns pre-calculated dendrogram
    > ### Aliases: as.dendrogram.fakeCommunities
    > 
    > ### ** Examples
    > 
    > rLeidenComm = suppressWarnings(rleiden.community(exampleGraph, n.cores=1))
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       4.       └─igraph::is_igraph(graph)
       5.         └─igraph:::warn_version(graph)
      ── Error ('test_functions.R:25:2'): membership.fakeCommunities() functionality ──
      Error in `.igraph.status("Restore graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─leidenAlg::leiden.community(exampleGraph) at test_functions.R:25:8
       2.   └─igraph::is_weighted(graph)
       3.     └─igraph:::ensure_igraph(graph)
       4.       └─igraph::is_igraph(graph)
       5.         └─igraph:::warn_version(graph)
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# leidenbase

<details>

* Version: 0.1.18
* GitHub: https://github.com/cole-trapnell-lab/leidenbase
* Source code: https://github.com/cran/leidenbase
* Date/Publication: 2023-04-15 09:20:02 UTC
* Number of recursive dependencies: 54

Run `revdepcheck::cloud_details(, "leidenbase")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘leidenbase-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: leiden_find_partition
    > ### Title: Leiden find partition community detection function
    > ### Aliases: leiden_find_partition
    > 
    > ### ** Examples
    > 
    >   library(igraph)
    ...
    
    >   fpath <- system.file( 'testdata', 'igraph_n1500_edgelist.txt.gz', package = 'leidenbase' )
    >   zfp <- gzfile(fpath)
    >   igraph <- read_graph( file = zfp, format='edgelist', n=1500 )
    >   res <- leiden_find_partition(igraph=igraph,
    +                                partition_type='CPMVertexPartition',
    +                                resolution_parameter=1e-5)
    Error in leiden_find_partition(igraph = igraph, partition_type = "CPMVertexPartition",  : 
      REAL() can only be applied to a 'numeric', not a 'NULL'
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > testthat::test_check("leidenbase")
      Loading required package: leidenbase
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 0 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-leidenbase.R:27:3'): (code run outside of `test_that()`) ───────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─igraph::read_graph(file = zfp, format = "edgelist", n = 1500) at test-leidenbase.R:27:2
       2.   └─igraph:::read.graph.edgelist(file, ...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘leidenbase.Rmd’ using rmarkdown
    
    Quitting from lines 87-92 [unnamed-chunk-1] (leidenbase.Rmd)
    Error: processing vignette 'leidenbase.Rmd' failed with diagnostics:
    REAL() can only be applied to a 'numeric', not a 'NULL'
    --- failed re-building ‘leidenbase.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘leidenbase.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 19.1Mb
      sub-directories of 1Mb or more:
        libs  18.8Mb
    ```

# lexRankr

<details>

* Version: 0.5.2
* GitHub: https://github.com/AdamSpannbauer/lexRankr
* Source code: https://github.com/cran/lexRankr
* Date/Publication: 2019-03-17 21:00:03 UTC
* Number of recursive dependencies: 52

Run `revdepcheck::cloud_details(, "lexRankr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘lexRankr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: lexRank
    > ### Title: Extractive text summarization with LexRank
    > ### Aliases: lexRank
    > 
    > ### ** Examples
    > 
    > lexRank(c("This is a test.","Tests are fun.",
    + "Do you think the exam will be hard?","Is an exam the same as a test?",
    + "How many questions are going to be on the exam?"))
    Parsing text into sentences and tokens...DONE
    Calculating pairwise sentence similarities...DONE
    Applying LexRank...Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: lexRank ... lexRankFromSimil -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
          ▆
       1. └─lexRankr::lexRankFromSimil(similDf$sent1, similDf$sent2, similDf$similVal) at test-lexRankFromSimil.R:14:2
       2.   └─igraph::graph_from_data_frame(edges, directed = FALSE)
       3.     └─igraph::make_empty_graph(n = 0, directed = directed)
      ── Error ('test-lexRankFromSimil.R:52:3'): object out value ────────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─lexRankr::lexRankFromSimil(similDf$sent1, similDf$sent2, similDf$similVal) at test-lexRankFromSimil.R:52:2
       2.   └─igraph::graph_from_data_frame(edges, directed = FALSE)
       3.     └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 8 | WARN 0 | SKIP 0 | PASS 112 ]
      Error: Test failures
      Execution halted
    ```

# linkprediction

<details>

* Version: 1.0-0
* GitHub: https://github.com/recon-icm/linkprediction
* Source code: https://github.com/cran/linkprediction
* Date/Publication: 2018-10-19 13:40:03 UTC
* Number of recursive dependencies: 43

Run `revdepcheck::cloud_details(, "linkprediction")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘linkprediction-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: proxfun
    > ### Title: Vertex proximity indexes
    > ### Aliases: proxfun proxfun.igraph proxfun.network
    > 
    > ### ** Examples
    > 
    > if(requireNamespace("igraph")) {
    ...
    + proxfun(g, method="aa", value="edgelist")
    +   
    + # Random Walk with Restart
    + proxfun(g, method="rwr", value="edgelist")
    + }
    Loading required namespace: igraph
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> ... graph_from_literal_i -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
          ▆
       1. └─igraph::graph(c(1, 2, 1, 3, 1, 4, 2, 4, 1, 5, 2, 5, 4, 5), directed = FALSE) at test_check_vertices.R:3:0
       2.   ├─base::do.call(old_graph, args)
       3.   └─igraph (local) `<fn>`(`<dbl>`, directed = FALSE)
      ── Error ('test_proxfun.R:3:1'): (code run outside of `test_that()`) ───────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─igraph::graph(c(1, 2, 1, 3, 1, 4, 2, 4, 1, 5, 2, 5, 4, 5), directed = FALSE) at test_proxfun.R:3:0
       2.   ├─base::do.call(old_graph, args)
       3.   └─igraph (local) `<fn>`(`<dbl>`, directed = FALSE)
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: find_loops -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘workflow_LoopDetectR.Rmd’ using knitr
    
    Quitting from lines 53-73 [quick_example] (workflow_LoopDetectR.Rmd)
    Error: processing vignette 'workflow_LoopDetectR.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘workflow_LoopDetectR.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘workflow_LoopDetectR.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# LSVAR

<details>

* Version: 1.2
* GitHub: NA
* Source code: https://github.com/cran/LSVAR
* Date/Publication: 2021-05-26 12:00:02 UTC
* Number of recursive dependencies: 38

Run `revdepcheck::cloud_details(, "LSVAR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘LSVAR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: fista.LpS
    > ### Title: A function to solve low rank plus sparse model estimation using
    > ###   FISTA algorithm
    > ### Aliases: fista.LpS
    > 
    > ### ** Examples
    > 
    > n <- 300
    > p <- 20
    > try <- testVAR(n, p, struct = "LS", signal = 0.75, rank = 2,
    +                singular_vals = c(1, 0.8))
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: testVAR -> erdos.renyi.game
    Execution halted
    ```

# lvm4net

<details>

* Version: 0.3
* GitHub: https://github.com/igollini/lvm4net
* Source code: https://github.com/cran/lvm4net
* Date/Publication: 2019-06-13 15:40:07 UTC
* Number of recursive dependencies: 67

Run `revdepcheck::cloud_details(, "lvm4net")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘lvm4net-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: boxroc
    > ### Title: Boxplot and ROC Curves
    > ### Aliases: boxroc
    > 
    > ### ** Examples
    > 
    > 
    > N <- 20
    > Y <- network(N, directed = FALSE)[,]
    > 
    > modLSM <- lsm(Y, D = 2) 
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: lsm ... make_call -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

# macrosyntR

<details>

* Version: 0.2.19
* GitHub: https://github.com/SamiLhll/macrosyntR
* Source code: https://github.com/cran/macrosyntR
* Date/Publication: 2023-03-29 13:30:16 UTC
* Number of recursive dependencies: 63

Run `revdepcheck::cloud_details(, "macrosyntR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘macrosyntR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: reorder_macrosynteny
    > ### Title: Reorder the mbh_df before plotting
    > ### Aliases: reorder_macrosynteny
    > 
    > ### ** Examples
    > 
    > # basic usage of reorder_macrosynteny : 
    ...
    > 
    > orthologs_table <- system.file("extdata","my_orthologs.tab",package="macrosyntR")
    > 
    > my_orthologs <- read.table(orthologs_table,header=TRUE)
    > 
    > my_orthologs_reordered <- reorder_macrosynteny(my_orthologs)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: reorder_macrosynteny -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘macrosyntR.Rmd’ using rmarkdown
    
    Quitting from lines 210-221 [unnamed-chunk-12] (macrosyntR.Rmd)
    Error: processing vignette 'macrosyntR.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘macrosyntR.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘macrosyntR.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# madrat

<details>

* Version: 3.3.0
* GitHub: https://github.com/pik-piam/madrat
* Source code: https://github.com/cran/madrat
* Date/Publication: 2023-05-02 11:10:02 UTC
* Number of recursive dependencies: 81

Run `revdepcheck::cloud_details(, "madrat")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘madrat-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: cacheGet
    > ### Title: Tool: cacheGet
    > ### Aliases: cacheGet
    > 
    > ### ** Examples
    > 
    > madrat:::cacheGet("calc", "TauTotal", packages = "madrat")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> ... fingerprint -> getDependencies -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        9.   ├─madrat:::withMadratLogging(do.call(cfg$functionCode, cfg$fullNow))
       10.   │ └─base::withCallingHandlers(...)
       11.   ├─base::do.call(cfg$functionCode, cfg$fullNow)
       12.   └─madrat (local) `<fn>`()
       13.     └─madrat::calcOutput("WarningTest", aggregate = FALSE) at test-retrieveData.R:105:4
       14.       └─madrat:::cacheGet(prefix = "calc", type = type, args = args)
       15.         └─madrat:::cacheName(...)
       16.           └─madrat:::fingerprint(...)
       17.             └─madrat::getDependencies(...)
       18.               └─igraph::graph_from_data_frame(graph)
       19.                 └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 12 | WARN 0 | SKIP 8 | PASS 524 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘madrat-caching.Rmd’ using rmarkdown
    
    Quitting from lines 37-38 [unnamed-chunk-3] (madrat-caching.Rmd)
    Error: processing vignette 'madrat-caching.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘madrat-caching.Rmd’
    
    --- re-building ‘madrat-puc.Rmd’ using rmarkdown
    ...
    --- finished re-building ‘madrat-puc.Rmd’
    
    --- re-building ‘madrat.Rmd’ using rmarkdown
    --- finished re-building ‘madrat.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘madrat-caching.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# malan

<details>

* Version: 1.0.2
* GitHub: https://github.com/mikldk/malan
* Source code: https://github.com/cran/malan
* Date/Publication: 2020-06-25 12:00:06 UTC
* Number of recursive dependencies: 89

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> ... graph_from_literal_i -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘case-study-partial.Rmd’ using rmarkdown
    
    Quitting from lines 76-78 [unnamed-chunk-8] (case-study-partial.Rmd)
    Error: processing vignette 'case-study-partial.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘case-study-partial.Rmd’
    
    --- re-building ‘introduction.Rmd’ using rmarkdown
    ...
    Quitting from lines 52-53 [unnamed-chunk-6] (introduction.Rmd)
    Error: processing vignette 'introduction.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘introduction.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘case-study-partial.Rmd’ ‘introduction.Rmd’
    
    Error: Vignette re-building failed.
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

* Version: 0.1.10
* GitHub: https://github.com/sfcheung/manymome
* Source code: https://github.com/cran/manymome
* Date/Publication: 2023-06-08 15:30:03 UTC
* Number of recursive dependencies: 157

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: all_indirect_paths -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─manymome::all_indirect_paths(fit) at test_all_indirect_paths_lv.R:28:0
       2.   └─igraph::graph_from_adjacency_matrix(adj, mode = "directed")
       3.     └─igraph:::graph.adjacency.dense(...)
      ── Failure ('test_lavaan2lm_list.R:51:5'): lm_from_lavaan: predict ─────────────
      predict(fit_list[["y"]], dat[3:5, ]) (`actual`) not equal to predict(lm_y, dat[3:5, ]) - coef(lm_y)[1] (`expected`).
      
        `actual`: 15.544720 15.345482 15.139308
      `expected`: 15.544747 15.345493 15.139317
      
      [ FAIL 2 | WARN 0 | SKIP 22 | PASS 392 ]
      Error: Test failures
      Execution halted
    ```

# manynet

<details>

* Version: 0.1.1
* GitHub: https://github.com/snlab-ch/manynet
* Source code: https://github.com/cran/manynet
* Date/Publication: 2023-06-10 14:10:02 UTC
* Number of recursive dependencies: 89

Run `revdepcheck::cloud_details(, "manynet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘manynet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add
    > ### Title: Adding nodes and ties and their attributes
    > ### Aliases: add add_nodes add_ties add_node_attribute add_tie_attribute
    > 
    > ### ** Examples
    > 
    >   other <- create_filled(4) %>% mutate(name = c("A", "B", "C", "D"))
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: %>% ... create_filled -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        5.       ├─dplyr::mutate(ungroup(activate(graph, "nodes")), .ggraph.orig_index = seq_len(graph_order()))
        6.       └─tidygraph:::mutate.tbl_graph(...)
        7.         └─tidygraph::mutate_as_tbl(.data, !!!dot)
        8.           ├─tibble::as_tibble(.data)
        9.           └─tidygraph:::as_tibble.tbl_graph(.data)
       10.             └─tidygraph:::node_tibble(x)
       11.               ├─tibble::as_tibble(vertex_attr(x))
       12.               └─igraph::vertex_attr(x)
       13.                 └─igraph:::ensure_igraph(graph)
       14.                   └─igraph::is_igraph(graph)
       15.                     └─igraph:::warn_version(graph)
      
      [ FAIL 45 | WARN 0 | SKIP 0 | PASS 12 ]
      Error: Test failures
      Execution halted
    ```

# matrixcut

<details>

* Version: 0.0.1
* GitHub: NA
* Source code: https://github.com/cran/matrixcut
* Date/Publication: 2023-03-24 16:30:02 UTC
* Number of recursive dependencies: 8

Run `revdepcheck::cloud_details(, "matrixcut")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘matrixcut-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: componentplot
    > ### Title: Draws a Plot Showing the Number of Components as a Function of
    > ###   the Cutoff Value.
    > ### Aliases: componentplot
    > 
    > ### ** Examples
    > 
    > componentplot(xenarthra,0.75,0.9)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: componentplot -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘stats’
      All declared Imports should be used.
    ```

# maxmatching

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/maxmatching
* Date/Publication: 2017-01-15 09:51:07
* Number of recursive dependencies: 7

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> -> do.call -> <Anonymous>
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
* Number of recursive dependencies: 7

Run `revdepcheck::cloud_details(, "mazeGen")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mazeGen-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: genEMLseed
    > ### Title: Generate Equal Minimum Legs Seed
    > ### Aliases: genEMLseed
    > 
    > ### ** Examples
    > 
    > 
    ...
    > seed <- 1
    > 
    > #Search for just one unique path
    > justOne <- genEMLseed(path=1,rank=rank,satPercent=satPercent,seed=seed)
    > nodePosition <- np(rank,satPercent,seed=justOne)
    > mazeEst(nodePosition)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: mazeEst -> graph -> do.call -> <Anonymous>
    Execution halted
    ```

# MBNMAdose

<details>

* Version: 0.4.1
* GitHub: NA
* Source code: https://github.com/cran/MBNMAdose
* Date/Publication: 2022-02-24 11:40:02 UTC
* Number of recursive dependencies: 95

Run `revdepcheck::cloud_details(, "MBNMAdose")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘MBNMAdose-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: MBNMAdose-package
    > ### Title: MBNMAdose for dose-response Model-Based Network Meta-Analysis
    > ### Aliases: MBNMAdose MBNMAdose-package
    > ### Keywords: internal
    > 
    > ### ** Examples
    > 
    ...
    > network <- mbnma.network(triptans)
    Values for `agent` with dose = 0 have been recoded to `Placebo`
    agent is being recoded to enforce sequential numbering and allow inclusion of `Placebo`
    > 
    > # Generate a network plot at the dose/treatment level
    > plot(network, level="treatment")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot -> plot.mbnma.network -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘mbnmadose.Rmd’ using rmarkdown
    Warning in eng_r(options) :
      Failed to tidy R code in chunk 'unnamed-chunk-2'. Reason:
    Error : The formatR package is required by the chunk option tidy = TRUE but not installed; tidy = TRUE will be ignored.
    
    Warning in eng_r(options) :
      Failed to tidy R code in chunk 'unnamed-chunk-6'. Reason:
    Error : The formatR package is required by the chunk option tidy = TRUE but not installed; tidy = TRUE will be ignored.
    ...
    Quitting from lines 112-115 [unnamed-chunk-6] (mbnmadose.Rmd)
    Error: processing vignette 'mbnmadose.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘mbnmadose.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘mbnmadose.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 6 marked Latin-1 strings
    ```

# MBNMAtime

<details>

* Version: 0.2.3
* GitHub: NA
* Source code: https://github.com/cran/MBNMAtime
* Date/Publication: 2023-03-17 12:30:13 UTC
* Number of recursive dependencies: 108

Run `revdepcheck::cloud_details(, "MBNMAtime")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘MBNMAtime-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: inconsistency.loops
    > ### Title: Identify comparisons in loops that fulfil criteria for
    > ###   node-splitting
    > ### Aliases: inconsistency.loops
    > 
    > ### ** Examples
    > 
    ...
    > data <- data.frame(studyID=c(1,1,2,2,3,3,4,4,5,5,5),
    +   treatment=c(1,2,1,3,2,3,3,4,1,2,4)
    +   )
    > 
    > # Identify comparisons informed by direct and indirect evidence
    > inconsistency.loops(data)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: inconsistency.loops -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘MBNMAtime.Rmd’ using rmarkdown
    
    Quitting from lines 146-151 [unnamed-chunk-6] (MBNMAtime.Rmd)
    Error: processing vignette 'MBNMAtime.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘MBNMAtime.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘MBNMAtime.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# mcMST

<details>

* Version: 1.1.1
* GitHub: https://github.com/jakobbossek/mcMST
* Source code: https://github.com/cran/mcMST
* Date/Publication: 2023-03-13 19:00:02 UTC
* Number of recursive dependencies: 138

Run `revdepcheck::cloud_details(, "mcMST")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mcMST-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: mcMSTEmoaBG
    > ### Title: Subgraph EMOA for the multi-criteria MST problem.
    > ### Aliases: mcMSTEmoaBG
    > 
    > ### ** Examples
    > 
    > inst = genRandomMCGP(10)
    > res = mcMSTEmoaBG(inst, mu = 20L, max.iter = 100L)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: mcMSTEmoaBG ... <Anonymous> -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

# mcvis

<details>

* Version: 1.0.8
* GitHub: NA
* Source code: https://github.com/cran/mcvis
* Date/Publication: 2021-07-30 08:20:05 UTC
* Number of recursive dependencies: 92

Run `revdepcheck::cloud_details(, "mcvis")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mcvis-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: alt_mcvis
    > ### Title: Multi-collinearity Visualization plots
    > ### Aliases: alt_mcvis ggplot_mcvis igraph_mcvis plot.mcvis
    > 
    > ### ** Examples
    > 
    > set.seed(1)
    ...
    > n = 100
    > X = matrix(rnorm(n*p), ncol = p)
    > X[,1] = X[,2] + rnorm(n, 0, 0.1)
    > mcvis_result = mcvis(X)
    > plot(mcvis_result)
    > plot(mcvis_result, type = "igraph")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... igraph_mcvis -> <Anonymous> -> graph.incidence.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-plot-mcvis.R:10:1'): (code run outside of `test_that()`) ───────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─base::plot(mcvis_result, type = "igraph") at test-plot-mcvis.R:10:0
       2. └─mcvis:::plot.mcvis(mcvis_result, type = "igraph")
       3.   └─mcvis::igraph_mcvis(mcvis_result = x, eig_max = eig_max, var_max = var_max)
       4.     └─igraph::graph_from_incidence_matrix(M)
       5.       └─igraph:::graph.incidence.dense(...)
      
      [ FAIL 1 | WARN 1 | SKIP 0 | PASS 3 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘mcvis.Rmd’ using rmarkdown
    
    Quitting from lines 71-72 [unnamed-chunk-4] (mcvis.Rmd)
    Error: processing vignette 'mcvis.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘mcvis.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘mcvis.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# meconetcomp

<details>

* Version: 0.2.0
* GitHub: https://github.com/ChiLiubio/meconetcomp
* Source code: https://github.com/cran/meconetcomp
* Date/Publication: 2022-10-05 15:20:02 UTC
* Number of recursive dependencies: 147

Run `revdepcheck::cloud_details(, "meconetcomp")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘meconetcomp-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: cal_module
    > ### Title: Assign modules to each network
    > ### Aliases: cal_module
    > 
    > ### ** Examples
    > 
    > data(soil_amp_network)
    > soil_amp_network <- cal_module(soil_amp_network)
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: cal_module ... is_directed -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    ```

# Mercator

<details>

* Version: 1.1.2
* GitHub: NA
* Source code: https://github.com/cran/Mercator
* Date/Publication: 2022-06-30 16:20:02 UTC
* Number of recursive dependencies: 98

Run `revdepcheck::cloud_details(, "Mercator")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘test-01Metrics.R’
      Comparing ‘test-01Metrics.Rout’ to ‘test-01Metrics.Rout.save’ ... OK
      Running ‘test-02binmat.R’
      Comparing ‘test-02binmat.Rout’ to ‘test-02binmat.Rout.save’ ... OK
      Running ‘test-03thresh.R’
      Comparing ‘test-03thresh.Rout’ to ‘test-03thresh.Rout.save’ ... OK
      Running ‘test-04vis.R’
    Running the tests in ‘tests/test-04vis.R’ failed.
    Last 13 lines of output:
      > vis1 <- addVisualization(vis1, "tsne", perplexity=30)
    ...
      > ## hclust
      > vis1 <- addVisualization(vis1, "hclust")
      > plot(vis1, view = "hclust")
      > 
      > ## now test the igraph part
      > vis1 <- addVisualization(vis1, "graph")
      Error in .igraph.status("Make graph external pointer.\n") : 
        could not find function ".igraph.status"
      Calls: addVisualization ... createGraph -> graph_from_data_frame -> make_empty_graph
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘mercVis.Rmd’ using rmarkdown
    
    Quitting from lines 118-124 [igraph] (mercVis.Rmd)
    Error: processing vignette 'mercVis.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘mercVis.Rmd’
    
    --- re-building ‘mercator.Rmd’ using rmarkdown
    ...
    --- failed re-building ‘mercator.Rmd’
    
    --- re-building ‘umap-som.Rmd’ using rmarkdown
    --- finished re-building ‘umap-som.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘mercVis.Rmd’ ‘mercator.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# metacoder

<details>

* Version: 0.3.6
* GitHub: https://github.com/grunwaldlab/metacoder
* Source code: https://github.com/cran/metacoder
* Date/Publication: 2023-04-04 02:20:02 UTC
* Number of recursive dependencies: 201

Run `revdepcheck::cloud_details(, "metacoder")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘metacoder-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: layout_functions
    > ### Title: Layout functions
    > ### Aliases: layout_functions
    > 
    > ### ** Examples
    > 
    > # List available function names:
    ...
     [4] "gem"                  "graphopt"             "mds"                 
     [7] "fruchterman-reingold" "kamada-kawai"         "large-graph"         
    [10] "drl"                 
    > 
    > # Execute layout function on graph:
    > layout_functions("davidson-harel", igraph::make_ring(5))
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: layout_functions -> <Anonymous> -> ensure_igraph -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        6. ├─metacoder::heat_tree(...)
        7. └─metacoder:::heat_tree.Taxmap(...)
        8.   ├─base::do.call(heat_tree, arguments)
        9.   ├─metacoder (local) `<fn>`(...)
       10.   └─metacoder:::heat_tree.default(...)
       11.     └─base::lapply(sub_graph_taxa, get_sub_graphs)
       12.       └─metacoder (local) FUN(X[[i]], ...)
       13.         └─igraph::graph_from_edgelist(edgelist)
       14.           └─igraph::make_graph(unname(ids[t(el)]), directed = directed)
       15.             ├─base::do.call(old_graph, args)
       16.             └─igraph (local) `<fn>`(`<int>`, directed = TRUE)
      
      [ FAIL 3 | WARN 0 | SKIP 3 | PASS 533 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘R6’
      All declared Imports should be used.
    ```

# metanetwork

<details>

* Version: 0.7.0
* GitHub: https://github.com/MarcOhlmann/metanetwork
* Source code: https://github.com/cran/metanetwork
* Date/Publication: 2022-12-05 14:10:02 UTC
* Number of recursive dependencies: 106

Run `revdepcheck::cloud_details(, "metanetwork")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘metanetwork-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: append_agg_nets
    > ### Title: append aggregated networks
    > ### Aliases: append_agg_nets append_agg_nets.metanetwork
    > 
    > ### ** Examples
    > 
    > library(metanetwork)
    > data(meta_angola)
    > meta_angola = append_agg_nets(meta_angola)
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: append_agg_nets ... graph_attr -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    ```

# MetricGraph

<details>

* Version: 1.1.1
* GitHub: https://github.com/davidbolin/MetricGraph
* Source code: https://github.com/cran/MetricGraph
* Date/Publication: 2023-06-01 12:00:11 UTC
* Number of recursive dependencies: 124

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
    > line2 <- Line(rbind(c(1, 0), c(2, 0)))
    > line3 <- Line(rbind(c(1, 1), c(2, 1)))
    > Lines <-  SpatialLines(list(Lines(list(line1), ID = "1"),
    +                            Lines(list(line2), ID = "2"),
    +                            Lines(list(line3), ID = "3")))
    > graphs <- graph_components$new(Lines)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> -> initialize -> graph -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       4.       ├─base::do.call(old_graph, args)
       5.       └─igraph (local) `<fn>`(`<dbl>`, directed = FALSE)
      ── Error ('test_split_line.R:12:1'): Testing if splitting edges, and adding obsevations casuse error ──
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─metric_graph$new(lines = Lines) at test_split_line.R:12:0
       2.   └─MetricGraph (local) initialize(...)
       3.     └─igraph::graph(edges = c(t(self$E)), directed = FALSE)
       4.       ├─base::do.call(old_graph, args)
       5.       └─igraph (local) `<fn>`(`<dbl>`, directed = FALSE)
      
      [ FAIL 12 | WARN 0 | SKIP 1 | PASS 8 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 19.9Mb
      sub-directories of 1Mb or more:
        libs  19.0Mb
    ```

# mfpp

<details>

* Version: 0.0.4
* GitHub: https://github.com/kzst/mfpp
* Source code: https://github.com/cran/mfpp
* Date/Publication: 2022-08-22 10:20:02 UTC
* Number of recursive dependencies: 65

Run `revdepcheck::cloud_details(, "mfpp")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mfpp-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot.mfpp
    > ### Title: Plot function for Matrix-Based Flexible Project Planning
    > ### Aliases: plot.PDM_matrix plot.PDM_list plot.Set_PDM_matrix
    > ###   plot.Set_PDM_list plot.TPT
    > 
    > ### ** Examples
    > 
    ...
    > 
    > # Generation of PDM list for TCTP a project scenario using MFPP package.
    > 
    > PDM<-generatepdm(N,ff,cf,mTD,mCD,mRD,w,nR,nW,scale,lst=TRUE)
    > 
    > plot(PDM)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... plot.PDM_matrix -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

# migraph

<details>

* Version: 0.13.2
* GitHub: https://github.com/snlab-ch/migraph
* Source code: https://github.com/cran/migraph
* Date/Publication: 2022-12-20 16:20:02 UTC
* Number of recursive dependencies: 138

Run `revdepcheck::cloud_details(, "migraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘migraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add
    > ### Title: Adding and copying attributes from one graph to another
    > ### Aliases: add add_node_attribute add_tie_attribute copy_node_attributes
    > ###   join_ties
    > 
    > ### ** Examples
    > 
    > add_node_attribute(mpn_elite_mex, "wealth", 1:35)
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: add_node_attribute ... <Anonymous> -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Error ('test-viz_layout_partition.R:20:3'): concentric layout works ─────────
      Error in `.igraph.status("Restore graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─migraph::layout_tbl_graph_concentric(ison_southern_women) at test-viz_layout_partition.R:20:2
       2.   ├─migraph::is_twomode(object)
       3.   └─migraph:::is_twomode.igraph(object)
       4.     └─igraph::is.bipartite(object)
       5.       └─igraph:::ensure_igraph(graph)
       6.         └─igraph::is_igraph(graph)
       7.           └─igraph:::warn_version(graph)
      
      [ FAIL 85 | WARN 0 | SKIP 0 | PASS 12 ]
      Error: Test failures
      Execution halted
    ```

# miniCRAN

<details>

* Version: 0.2.16
* GitHub: https://github.com/andrie/miniCRAN
* Source code: https://github.com/cran/miniCRAN
* Date/Publication: 2022-02-14 09:00:05 UTC
* Number of recursive dependencies: 108

Run `revdepcheck::cloud_details(, "miniCRAN")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      ── Error ('test-2-makeDepGraph.R:66:3'): makeDepGraph and pgkDep gives similar results for MASS ──
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─testthat::expect_true(checkPkgDepFunctions(tag)) at test-2-makeDepGraph.R:66:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─miniCRAN (local) checkPkgDepFunctions(tag)
       5.   └─miniCRAN::makeDepGraph(...) at test-2-makeDepGraph.R:12:2
       6.     └─igraph::graph.data.frame(d = edges, directed = TRUE, vertices = vert)
       7.       └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 2 | WARN 3 | SKIP 28 | PASS 32 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘miniCRAN-dependency-graph.rmd’ using rmarkdown
    
    Quitting from lines 55-58 [makeDepGraph] (miniCRAN-dependency-graph.rmd)
    Error: processing vignette 'miniCRAN-dependency-graph.rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘miniCRAN-dependency-graph.rmd’
    
    --- re-building ‘miniCRAN-introduction.rmd’ using rmarkdown
    ...
    --- finished re-building ‘miniCRAN-introduction.rmd’
    
    --- re-building ‘miniCRAN-non-CRAN-repos.rmd’ using rmarkdown
    --- finished re-building ‘miniCRAN-non-CRAN-repos.rmd’
    
    SUMMARY: processing the following file failed:
      ‘miniCRAN-dependency-graph.rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# missSBM

<details>

* Version: 1.0.3
* GitHub: https://github.com/grossSBM/missSBM
* Source code: https://github.com/cran/missSBM
* Date/Publication: 2022-08-23 12:10:06 UTC
* Number of recursive dependencies: 113

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... <Anonymous> -> plotMeso -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.6Mb
      sub-directories of 1Mb or more:
        libs   8.6Mb
    ```

# mlmts

<details>

* Version: 1.1.1
* GitHub: NA
* Source code: https://github.com/cran/mlmts
* Date/Publication: 2023-01-22 21:30:02 UTC
* Number of recursive dependencies: 236

Run `revdepcheck::cloud_details(, "mlmts")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mlmts-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dis_mcc
    > ### Title: Constructs a pairwise distance matrix based on maximal
    > ###   cross-correlations
    > ### Aliases: dis_mcc
    > 
    > ### ** Examples
    > 
    > reduced_dataset <- dis_mcc(RacketSports$data[1], features = TRUE) # Reducing
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: dis_mcc ... lapply -> FUN -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘ClusterR’ ‘MASS’ ‘Rdpack’ ‘multiwave’ ‘randomForest’ ‘ranger’
      All declared Imports should be used.
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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: ednn_IOprepare ... graph_from_edgelist -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘MASS’ ‘Matrix’ ‘magrittr’ ‘reticulate’ ‘tensorflow’ ‘usethis’
      All declared Imports should be used.
    ```

# modnets

<details>

* Version: 0.9.0
* GitHub: https://github.com/tswanson222/modnets
* Source code: https://github.com/cran/modnets
* Date/Publication: 2021-10-01 08:20:02 UTC
* Number of recursive dependencies: 136

Run `revdepcheck::cloud_details(, "modnets")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘modnets-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: CentClust
    > ### Title: Node centrality, clustering coefficients, and shortest path
    > ###   lengths
    > ### Aliases: CentClust centAuto clustAuto
    > 
    > ### ** Examples
    > 
    > x <- fitNetwork(ggmDat, 'M')
    > 
    > clustAuto(x)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: clustAuto -> <Anonymous> -> graph.adjacency.dense
    Execution halted
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
    
    > ### Name: determine_drug_targets
    > ### Title: Determine drug target nodes in network
    > ### Aliases: determine_drug_targets
    > 
    > ### ** Examples
    > 
    > data(drug_gene_interactions)
    ...
    + interaction_table=drug_gene_interactions,
    + match_on='gene_name')
    > drug_targets <- determine_drug_targets(combined_graphs[["graphs"]],
    + combined_graphs[["annotations"]],
    + drug_target_interaction,
    + settings)
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: determine_drug_targets ... <Anonymous> -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Molnet_Vignette.Rmd’ using rmarkdown
    
    Quitting from lines 255-256 [Individual Graphs] (Molnet_Vignette.Rmd)
    Error: processing vignette 'Molnet_Vignette.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘Molnet_Vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Molnet_Vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# moranajp

<details>

* Version: 0.9.6
* GitHub: https://github.com/matutosi/moranajp
* Source code: https://github.com/cran/moranajp
* Date/Publication: 2023-02-28 05:12:29 UTC
* Number of recursive dependencies: 129

Run `revdepcheck::cloud_details(, "moranajp")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘moranajp-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: draw_bigram_network
    > ### Title: Draw bigram network using morphological analysis data.
    > ### Aliases: draw_bigram_network bigram bigram_depend bigram_network
    > ###   word_freq bigram_network_plot
    > 
    > ### ** Examples
    > 
    ...
    +   clean_up(use_common_data = TRUE, synonym_df = synonym)
    Joining with `by = join_by(原形)`
    > 
    > bigram_neko <- 
    +   neko_mecab %>%
    +   draw_bigram_network()
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: %>% ... bigram_network -> %>% -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

# motifcluster

<details>

* Version: 0.2.3
* GitHub: https://github.com/wgunderwood/motifcluster
* Source code: https://github.com/cran/motifcluster
* Date/Publication: 2022-11-18 08:10:02 UTC
* Number of recursive dependencies: 66

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: get_largest_component ... graph_from_adjacency_matrix -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       5.         └─igraph::make_empty_graph(n = vc, directed = (mode == "directed"))
      ── Error ('test_utils.R:65:3'): get_largest_component returns correct indices ──
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(...) at test_utils.R:65:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─motifcluster::get_largest_component(adj_mat_dense)
       5.   └─igraph::graph_from_adjacency_matrix(...)
       6.     └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 478 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘motifcluster_vignette.Rmd’ using rmarkdown
    
    Quitting from lines 424-429 [unnamed-chunk-23] (motifcluster_vignette.Rmd)
    Error: processing vignette 'motifcluster_vignette.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘motifcluster_vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘motifcluster_vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# motifr

<details>

* Version: 1.0.0
* GitHub: https://github.com/marioangst/motifr
* Source code: https://github.com/cran/motifr
* Date/Publication: 2020-12-10 15:40:02 UTC
* Number of recursive dependencies: 121

Run `revdepcheck::cloud_details(, "motifr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘motifr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: directed_dummy_net
    > ### Title: Two-level directed network dummy example
    > ### Aliases: directed_dummy_net
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > plot_mnet(directed_dummy_net)
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot_mnet ... vertex_attr -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    ```

# mppR

<details>

* Version: 1.4.0
* GitHub: https://github.com/vincentgarin/mppR
* Source code: https://github.com/cran/mppR
* Date/Publication: 2023-01-05 20:50:02 UTC
* Number of recursive dependencies: 71

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: MQE_gen_effects ... graph_from_edgelist -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
           ▆
        1. └─mppR::mpp_proc(...) at test_mpp_proc.R:32:2
        2.   └─mppR::QTL_gen_effects(...)
        3.     └─base::mapply(...)
        4.       └─mppR (local) `<fn>`(...)
        5.         └─mppR::design_connectivity(...)
        6.           └─igraph::graph(vertices)
        7.             └─igraph::graph_from_edgelist(el, directed = directed)
        8.               └─igraph::make_graph(unname(ids[t(el)]), directed = directed)
        9.                 ├─base::do.call(old_graph, args)
       10.                 └─igraph (local) `<fn>`(`<int>`, directed = TRUE)
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 24 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘MPP_ME_QTL_detect.Rmd’ using rmarkdown
    
    Quitting from lines 126-129 [setup] (MPP_ME_QTL_detect.Rmd)
    Error: processing vignette 'MPP_ME_QTL_detect.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘MPP_ME_QTL_detect.Rmd’
    
    --- re-building ‘mppR_gen_vignette.Rmd’ using rmarkdown
    ...
    Quitting from lines 355-360 [design_connectivity] (mppR_gen_vignette.Rmd)
    Error: processing vignette 'mppR_gen_vignette.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘mppR_gen_vignette.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘MPP_ME_QTL_detect.Rmd’ ‘mppR_gen_vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# MRFcov

<details>

* Version: 1.0.39
* GitHub: https://github.com/nicholasjclark/MRFcov
* Source code: https://github.com/cran/MRFcov
* Date/Publication: 2023-04-06 10:13:19 UTC
* Number of recursive dependencies: 115

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
    ℹ Please use one dimensional logical vectors instead.
    ℹ The deprecated feature was likely used in the MRFcov package.
      Please report the issue to the authors.
    > 
    > #To plot as an igraph network instead, we can simply extract the adjacency matrix
    > net <- igraph::graph.adjacency(CRFmod$graph, weighted = TRUE, mode = "undirected")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Bird_Parasite_CRF.Rmd’ using rmarkdown
    
    Quitting from lines 52-58 [unnamed-chunk-6] (Bird_Parasite_CRF.Rmd)
    Error: processing vignette 'Bird_Parasite_CRF.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
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

# MRReg

<details>

* Version: 0.1.5
* GitHub: https://github.com/DarkEyes/MRReg
* Source code: https://github.com/cran/MRReg
* Date/Publication: 2022-08-19 15:30:02 UTC
* Number of recursive dependencies: 99

Run `revdepcheck::cloud_details(, "MRReg")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘MRReg-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plotOptimalClustersTree
    > ### Title: plotOptimalClustersTree
    > ### Aliases: plotOptimalClustersTree
    > 
    > ### ** Examples
    > 
    > # Running FindMaxHomoOptimalPartitions using simulation data
    ...
    Warning in summary.lm(submodels[[inx2]]) :
      essentially perfect fit: summary may be unreliable
    Warning in summary.lm(submodels[[inx2]]) :
      essentially perfect fit: summary may be unreliable
    > # Plotting the result
    > plotOptimalClustersTree(obj)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plotOptimalClustersTree ... graph_from_adjacency_matrix -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘MDLResFramework_Demo.Rmd’ using knitr
    
    Quitting from lines 51-52 [unnamed-chunk-2] (MDLResFramework_Demo.Rmd)
    Error: processing vignette 'MDLResFramework_Demo.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘MDLResFramework_Demo.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘MDLResFramework_Demo.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# MRS

<details>

* Version: 1.2.4
* GitHub: NA
* Source code: https://github.com/cran/MRS
* Date/Publication: 2018-01-23 09:10:10 UTC
* Number of recursive dependencies: 10

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plotTree -> <Anonymous> -> do.call -> <Anonymous>
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.2Mb
      sub-directories of 1Mb or more:
        libs   7.1Mb
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
    
    > ### Name: compute.costs.proximity.graph
    > ### Title: Computes the edge costs sum of a proximity graph
    > ### Aliases: compute.costs.proximity.graph
    > ### Keywords: internal
    > 
    > ### ** Examples
    > 
    ...
    > ##Generates complete graph (CG)
    > 
    > cg <- generate.complete.graph(1:nrow(x),d)
    > 
    > ##Generates a proximity graph (MST)
    > mstree <- generate.mst(cg)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: generate.mst -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘guide.Rmd’ using rmarkdown
    
    Quitting from lines 77-79 [unnamed-chunk-4] (guide.Rmd)
    Error: processing vignette 'guide.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘guide.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘guide.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# MTA

<details>

* Version: 0.4.1
* GitHub: https://github.com/riatelab/MTA
* Source code: https://github.com/cran/MTA
* Date/Publication: 2022-06-03 16:00:02 UTC
* Number of recursive dependencies: 51

Run `revdepcheck::cloud_details(, "MTA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘MTA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: map_mst
    > ### Title: Map Multiscalar Typology (3 deviations)
    > ### Aliases: map_mst
    > 
    > ### ** Examples
    > 
    > # Load data
    ...
    > ept <- st_read(system.file("metroparis.gpkg", package = "MTA"), layer = "ept", quiet = TRUE)
    > 
    > # Prerequisites - Compute the 3 deviations
    > com$gdev <- gdev(x = com, var1 = "INC", var2 = "TH")
    > com$tdev <- tdev(x = com, var1 = "INC", var2 = "TH", key = "EPT")
    > com$sdev <- sdev(x = com, var1 = "INC", var2 = "TH", order = 1)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: sdev ... contiguityMat -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘MTA.Rmd’ using rmarkdown
    --- finished re-building ‘MTA.Rmd’
    
    --- re-building ‘MTA_Scenario.Rmd’ using rmarkdown
    
    Quitting from lines 439-473 [localdevrel_plot] (MTA_Scenario.Rmd)
    Error: processing vignette 'MTA_Scenario.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘MTA_Scenario.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘MTA_Scenario.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# mully

<details>

* Version: 2.1.38
* GitHub: https://github.com/frankkramer-lab/mully
* Source code: https://github.com/cran/mully
* Date/Publication: 2023-02-22 17:00:03 UTC
* Number of recursive dependencies: 51

Run `revdepcheck::cloud_details(, "mully")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mully-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: addEdge
    > ### Title: Add an edge
    > ### Aliases: addEdge
    > 
    > ### ** Examples
    > 
    > g=mully::demo()
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> -> mully -> graph.empty
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘mully-pdf.Rmd’ using rmarkdown
    A new version of TeX Live has been released. If you need to install or update any LaTeX packages, you have to upgrade TinyTeX with tinytex::reinstall_tinytex(repository = "illinois").
    
    tlmgr: Local TeX Live (2022) is older than remote repository (2023).
    Cross release updates are only supported with
      update-tlmgr-latest(.sh/.exe) --update
    See https://tug.org/texlive/upgrade.html for details.
    Warning in system2("tlmgr", args, ...) :
      running command ''tlmgr' search --file --global '/grffile.sty'' had status 1
    ...
    --- failed re-building ‘mully-pdf.Rmd’
    
    --- re-building ‘mully-vignette.Rmd’ using rmarkdown
    --- finished re-building ‘mully-vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘mully-pdf.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# multilaterals

<details>

* Version: 1.0
* GitHub: NA
* Source code: https://github.com/cran/multilaterals
* Date/Publication: 2017-09-07 15:23:58 UTC
* Number of recursive dependencies: 11

Run `revdepcheck::cloud_details(, "multilaterals")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘multilaterals-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: multilaterals
    > ### Title: Transitive Index Numbers for Cross-Sections and Panel Data
    > ### Aliases: multilaterals-package multilaterals
    > ### Keywords: package
    > 
    > ### ** Examples
    > 
    ...
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    ```

# multilink

<details>

* Version: 0.1.1
* GitHub: https://github.com/aleshing/multilink
* Source code: https://github.com/cran/multilink
* Date/Publication: 2023-06-09 14:20:07 UTC
* Number of recursive dependencies: 57

Run `revdepcheck::cloud_details(, "multilink")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘multilink-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: find_bayes_estimate
    > ### Title: Find the Bayes Estimate of a Partition
    > ### Aliases: find_bayes_estimate
    > 
    > ### ** Examples
    > 
    > # Example with small no duplicate dataset
    ...
    > # The following line corresponds to only keeping pairs of records as
    > # potential matches in the initialization for which neither gname nor fname
    > # disagree at the highest level
    > pairs_to_keep <- (comparison_list$comparisons[, "gname_DL_3"] != TRUE) &
    +  (comparison_list$comparisons[, "fname_DL_3"] != TRUE)
    > Z_init <- initialize_partition(comparison_list, pairs_to_keep, seed = 42)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: initialize_partition ... <Anonymous> -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.7Mb
      sub-directories of 1Mb or more:
        libs   8.4Mb
    ```

# multinets

<details>

* Version: 0.2.2
* GitHub: https://github.com/neylsoncrepalde/multinets
* Source code: https://github.com/cran/multinets
* Date/Publication: 2019-12-14 17:20:03 UTC
* Number of recursive dependencies: 73

Run `revdepcheck::cloud_details(, "multinets")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘multinets-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: extract_highlevel
    > ### Title: Extract the high level of a multilevel network
    > ### Aliases: extract_highlevel
    > 
    > ### ** Examples
    > 
    > organizations <- extract_highlevel(linked_sim)
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: extract_highlevel ... <Anonymous> -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       12.     └─igraph:::ensure_igraph(graph)
       13.       └─igraph::is_igraph(graph)
       14.         └─igraph:::warn_version(graph)
      ── Error ('test-mode_transformation.R:15:3'): mode transformation works without specifying 'which' ──
      Error in `.igraph.status("Restore graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─igraph::bipartite_projection(g.bip) at test-mode_transformation.R:15:2
       2.   └─igraph:::ensure_igraph(graph)
       3.     └─igraph::is_igraph(graph)
       4.       └─igraph:::warn_version(graph)
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 10 ]
      Error: Test failures
      Execution halted
    ```

# multinma

<details>

* Version: 0.5.1
* GitHub: https://github.com/dmphillippo/multinma
* Source code: https://github.com/cran/multinma
* Date/Publication: 2023-05-24 11:20:02 UTC
* Number of recursive dependencies: 139

Run `revdepcheck::cloud_details(, "multinma")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘multinma-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: example_pso_mlnmr
    > ### Title: Example plaque psoriasis ML-NMR
    > ### Aliases: example_pso_mlnmr
    > ### Keywords: examples
    > 
    > ### ** Examples
    > 
    ...
    +               study = studyc,
    +               trt = trtc,
    +               r = pasi75_r,
    +               n = pasi75_n,
    +               trt_class = trtclass)
    + )
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: combine_network ... as.igraph.nma_data -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─multinma::nma(...) at test-relative_effects.R:10:0
       2.   └─multinma::is_network_connected(network)
       3.     ├─igraph::is_connected(igraph::as.igraph(network))
       4.     │ └─igraph:::ensure_igraph(graph)
       5.     ├─igraph::as.igraph(network)
       6.     └─multinma:::as.igraph.nma_data(network)
       7.       └─igraph::graph_from_data_frame(e_all, directed = FALSE, vertices = v_all)
       8.         └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 26 | WARN 0 | SKIP 12 | PASS 320 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 286.7Mb
      sub-directories of 1Mb or more:
        doc     4.0Mb
        libs  281.3Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# MultIS

<details>

* Version: 0.6.2
* GitHub: NA
* Source code: https://github.com/cran/MultIS
* Date/Publication: 2021-08-06 11:10:02 UTC
* Number of recursive dependencies: 81

Run `revdepcheck::cloud_details(, "MultIS")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘QuickStart.Rmd’ using knitr
    
    Quitting from lines 189-203 [QS-clusteringC3] (QuickStart.Rmd)
    Error: processing vignette 'QuickStart.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
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

# multivariance

<details>

* Version: 2.4.1
* GitHub: NA
* Source code: https://github.com/cran/multivariance
* Date/Publication: 2021-10-06 15:50:05 UTC
* Number of recursive dependencies: 37

Run `revdepcheck::cloud_details(, "multivariance")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘multivariance-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: clean.graph
    > ### Title: cleanup dependence structure graph
    > ### Aliases: clean.graph
    > 
    > ### ** Examples
    > 
    > N = 200
    ...
        Dependence structure detection
    
    data: 'x' with 200 samples of 9 variables
    structure: clustered
    detection method: test -- method for p-values: conservative -- significance level: 0.05
    
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: dependence.structure -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > 
      > test_check("multivariance")
      [ FAIL 1 | WARN 34 | SKIP 0 | PASS 160 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('testmultivariances.R:341:1'): (code run outside of `test_that()`) ───
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─multivariance::dependence.structure(...) at testmultivariances.R:341:0
       2.   └─igraph::graph.empty(, directed = FALSE)
      
      [ FAIL 1 | WARN 34 | SKIP 0 | PASS 160 ]
      Error: Test failures
      Execution halted
    ```

# mverse

<details>

* Version: 0.1.0
* GitHub: https://github.com/mverseanalysis/mverse
* Source code: https://github.com/cran/mverse
* Date/Publication: 2022-05-23 08:10:02 UTC
* Number of recursive dependencies: 149

Run `revdepcheck::cloud_details(, "mverse")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘mverse_gettingstarted.Rmd’ using rmarkdown
    --- finished re-building ‘mverse_gettingstarted.Rmd’
    
    --- re-building ‘mverse_intro_glmmodelling.Rmd’ using rmarkdown
    
    Quitting from lines 210-211 [unnamed-chunk-8] (mverse_intro_glmmodelling.Rmd)
    Error: processing vignette 'mverse_intro_glmmodelling.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    ...
    --- failed re-building ‘mverse_intro_glmmodelling.Rmd’
    
    --- re-building ‘mverse_intro_regressionmodelling.Rmd’ using rmarkdown
    --- finished re-building ‘mverse_intro_regressionmodelling.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘mverse_intro_glmmodelling.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# mwcsr

<details>

* Version: 0.1.7
* GitHub: https://github.com/ctlab/mwcsr
* Source code: https://github.com/cran/mwcsr
* Date/Publication: 2023-05-16 11:10:05 UTC
* Number of recursive dependencies: 91

Run `revdepcheck::cloud_details(, "mwcsr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mwcsr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_instance_type
    > ### Title: Check the type and the validity of an MWCS instance
    > ### Aliases: get_instance_type
    > 
    > ### ** Examples
    > 
    > data(mwcs_example)
    > get_instance_type(mwcs_example)
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: get_instance_type -> check_graph -> <Anonymous> -> warn_version
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. └─mwcsr::solve_mwcsp(solver, gam_example) at test_rmwcs.R:55:4
       2.   └─mwcsr:::check_graph(instance)
       3.     └─igraph::is.igraph(g)
       4.       └─igraph:::warn_version(graph)
      ── Error ('test_rmwcs.R:61:5'): rmwcs solver works with empty solutions ────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─igraph::graph.ring(10) at test_rmwcs.R:61:4
      
      [ FAIL 5 | WARN 1 | SKIP 5 | PASS 32 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 17.4Mb
      sub-directories of 1Mb or more:
        java   2.5Mb
        libs  14.3Mb
    ```

# nat

<details>

* Version: 1.8.22
* GitHub: https://github.com/natverse/nat
* Source code: https://github.com/cran/nat
* Date/Publication: 2023-06-07 14:50:05 UTC
* Number of recursive dependencies: 90

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: as.ngraph ... as.ngraph.data.frame -> ngraph -> <Anonymous> -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. ├─nat::as.neuron(testd) at test-neuron.R:13:0
       2. └─nat:::as.neuron.data.frame(testd)
       3.   ├─nat::as.neuron(as.ngraph(x), vertexData = x, ...)
       4.   ├─nat::as.ngraph(x)
       5.   └─nat:::as.ngraph.data.frame(x)
       6.     └─nat::ngraph(...)
       7.       └─igraph::graph(rawel, n = length(vertexlabels), directed = directed)
       8.         ├─base::do.call(old_graph, args)
       9.         └─igraph (local) `<fn>`(`<int>`, n = 6L, directed = TRUE)
      
      [ FAIL 30 | WARN 2 | SKIP 4 | PASS 633 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Installation.Rmd’ using rmarkdown
    --- finished re-building ‘Installation.Rmd’
    
    --- re-building ‘neurons-intro.Rmd’ using rmarkdown
    
    Quitting from lines 200-207 [unnamed-chunk-14] (neurons-intro.Rmd)
    Error: processing vignette 'neurons-intro.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘neurons-intro.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘neurons-intro.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# nbTransmission

<details>

* Version: 1.1.2
* GitHub: https://github.com/sarahleavitt/nbTransmission
* Source code: https://github.com/cran/nbTransmission
* Date/Publication: 2021-01-06 19:50:03 UTC
* Number of recursive dependencies: 123

Run `revdepcheck::cloud_details(, "nbTransmission")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. ├─testthat::expect_message(...) at test_visualizeResults.R:167:2
       2. │ └─testthat:::quasi_capture(enquo(object), label, capture_messages)
       3. │   ├─testthat (local) .capture(...)
       4. │   │ └─base::withCallingHandlers(...)
       5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
       6. └─nbTransmission (local) createNetworkWrapper(nbResults, probBreaks = c(0.01, 0.05, 1))
       7.   └─nbTransmission:::createNetwork(...) at test_visualizeResults.R:48:2
       8.     └─igraph::graph_from_data_frame(d = edges, vertices = nodes, directed = T)
       9.       └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 4 | WARN 5 | SKIP 0 | PASS 124 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘nbTransmission-vignette.Rmd’ using rmarkdown
    
    Quitting from lines 266-269 [networkFull] (nbTransmission-vignette.Rmd)
    Error: processing vignette 'nbTransmission-vignette.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘nbTransmission-vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘nbTransmission-vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# nda

<details>

* Version: 0.1.6
* GitHub: https://github.com/kzst/nda
* Source code: https://github.com/cran/nda
* Date/Publication: 2022-10-14 13:10:02 UTC
* Number of recursive dependencies: 81

Run `revdepcheck::cloud_details(, "nda")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘nda-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: biplot.nda
    > ### Title: Biplot function for Network-based Dimensionality Reduction and
    > ###   Analysis (NDA)
    > ### Aliases: biplot.nda
    > ### Keywords: plot
    > 
    > ### ** Examples
    ...
    > 
    > # Biplot function without feature selection
    > 
    > data("CrimesUSA1990.X")
    > df<-CrimesUSA1990.X
    > p<-ndr(df)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: ndr ... ensure_igraph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

# neat

<details>

* Version: 1.2.3
* GitHub: NA
* Source code: https://github.com/cran/neat
* Date/Publication: 2021-01-07 06:00:02 UTC
* Number of recursive dependencies: 36

Run `revdepcheck::cloud_details(, "neat")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘neat-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: neat
    > ### Title: Performs neat for lists of gene sets
    > ### Aliases: neat pvalue neatc
    > ### Keywords: htest
    > 
    > ### ** Examples
    > 
    ...
    > blist = list('set 3' = set3)
    > 
    > # test without multiple testing correction
    > test1 = neat(alist = alist, blist = blist, network=A, 
    +              nettype='directed', nodes=labels, 
    +              alpha=0.05, mtc.type = 'none')
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: neat ... networkmatrix -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘neat.Rmd’ using rmarkdown
    
    Quitting from lines 158-159 [unnamed-chunk-13] (neat.Rmd)
    Error: processing vignette 'neat.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘neat.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘neat.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# neatmaps

<details>

* Version: 2.1.0
* GitHub: https://github.com/PhilBoileau/neatmaps
* Source code: https://github.com/cran/neatmaps
* Date/Publication: 2019-05-12 19:10:03 UTC
* Number of recursive dependencies: 98

Run `revdepcheck::cloud_details(, "neatmaps")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘neatmaps-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: consClustResTable
    > ### Title: Consensus Cluster Results in a Table
    > ### Aliases: consClustResTable
    > 
    > ### ** Examples
    > 
    > # create the data frame using the network, node and edge attributes
    > df <- netsDataFrame(network_attr_df,
    +                     node_attr_df,
    +                     edge_df)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: netsDataFrame ... <Anonymous> -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.3Mb
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
    
    > ### Name: neighb
    > ### Title: Compute standard errors and confidence intervals
    > ### Aliases: neighb
    > 
    > ### ** Examples
    > 
    > #Load the synthetic population network dataset.
    ...
    Loading required package: RDStreeboot
    > RDS.samp <- sample.RDS(pop.network$traits, pop.network$adj.mat, 200, 10,
    +  3, c(1/6,1/3,1/3,1/6), FALSE)
    > 
    > #Compute 95% confidence intervals using the percentile method
    > neighb(RDS.data=RDS.samp, quant=c(0.025, 0.975),method="percentile", B=100)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: neighb -> .Nb -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

# netCoin

<details>

* Version: 2.0.48
* GitHub: https://github.com/Modesto-Escobar/netCoin-2.x
* Source code: https://github.com/cran/netCoin
* Date/Publication: 2023-03-23 22:40:02 UTC
* Number of recursive dependencies: 73

Run `revdepcheck::cloud_details(, "netCoin")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘netCoin-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: addDescription
    > ### Title: Adds a description to a 'netCoin' object.
    > ### Aliases: addDescription
    > 
    > ### ** Examples
    > 
    > data(finches)
    ...
    > 
    > Net<-allNet(Galapagos,nodes=finches, criteria="hyp", maxL=.05,
    +         lwidth ="Haberman",lweight="Haberman",
    +         size="frequency", color="species", layout="mds",
    +         main="Species coincidences in Galapagos Islands",
    +         note="Data source: Sanderson (2000)")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: allNet ... ensure_igraph -> rd3_toIgraph -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 21 marked UTF-8 strings
    ```

# netcom

<details>

* Version: 2.1.6
* GitHub: https://github.com/langendorfr/netcom
* Source code: https://github.com/cran/netcom
* Date/Publication: 2022-07-21 17:40:06 UTC
* Number of recursive dependencies: 102

Run `revdepcheck::cloud_details(, "netcom")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘netcom-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: align
    > ### Title: Network Alignment
    > ### Aliases: align
    > 
    > ### ** Examples
    > 
    > # The two networks to be aligned
    > net_one <- matrix(stats::runif(25,0,1), nrow=5, ncol=5)
    > net_two <- matrix(stats::runif(25,0,1), nrow=5, ncol=5)
    > 
    > align(net_one, net_two)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: align ... ensure_igraph -> <Anonymous> -> graph.adjacency.dense
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
* Number of recursive dependencies: 101

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
    +     nc_standardize(starts_with("metabolite"))
    > 
    > metabolite_network <- simulated_data %>%
    +     nc_standardize(starts_with("metabolite"),
    +                    regressed_on = "age") %>%
    +     nc_estimate_network(starts_with("metabolite"))
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: %>% ... %>% -> <Anonymous> -> <Anonymous> -> graph_from_adj_list
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       11. │                   ├─base::withCallingHandlers(...)
       12. │                   └─base::eval(exprs, env)
       13. │                     └─base::eval(exprs, env)
       14. │                       └─... %>% nc_estimate_network(starts_with("metabolite")) at tests/testthat/helpers-test-prep.R:6:0
       15. ├─NetCoupler::nc_estimate_network(., starts_with("metabolite"))
       16. │ └─subset_data %>% pc_estimate_undirected_graph(alpha) %>% ...
       17. ├─NetCoupler:::as_tbl_graph.pcAlgo(.)
       18. │ └─... %>% tidygraph::as_tbl_graph()
       19. ├─tidygraph::as_tbl_graph(.)
       20. ├─igraph::graph_from_graphnel(.)
       21. │ └─igraph::graph_from_adj_list(al, mode = mode, duplicate = TRUE)
       22. └─base::.handleSimpleError(...)
       23.   └─testthat (local) h(simpleError(msg, call))
       24.     └─rlang::abort(...)
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘NetCoupler.Rmd’ using rmarkdown
    
    Quitting from lines 175-178 [create-network] (NetCoupler.Rmd)
    Error: processing vignette 'NetCoupler.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘NetCoupler.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘NetCoupler.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# netdiffuseR

<details>

* Version: 1.22.5
* GitHub: https://github.com/USCCANA/netdiffuseR
* Source code: https://github.com/cran/netdiffuseR
* Date/Publication: 2022-12-02 16:20:02 UTC
* Number of recursive dependencies: 86

Run `revdepcheck::cloud_details(, "netdiffuseR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘netdiffuseR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: approx_geodesic
    > ### Title: Approximate Geodesic Distances
    > ### Aliases: approx_geodesic Geodesic Shortest-Path approx_geodist
    > 
    > ### ** Examples
    > 
    > # A very simple example -----------------------------------------------------
    ...
     [9,]    1    1    2    2    2    3    3    3    0     1
    [10,]    1    1    1    2    2    2    3    3    3     0
    > igraph::distances(
    +   igraph::graph_from_adjacency_matrix(g, mode = "directed"),
    +   mode = "out"
    + )
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> ... graph.adjacency.sparse -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        4. base::with.default(...)
        5. base::eval(substitute(expr), data, enclos = parent.frame())
        6. base::eval(substitute(expr), data, enclos = parent.frame())
        7. netdiffuseR:::diffusionMap.default(graph[[slice]], toa, ...)
        8. igraph::graph_from_adjacency_matrix(graph, weighted = TRUE)
        9. igraph:::graph.adjacency.sparse(...)
       10. igraph::make_empty_graph(n = vc, directed = (mode == "directed"))
        ... and 1 more
      
      
      Maximum number of 10 failures reached, some test results may be missing.
      
      ══ DONE ════════════════════════════════════════════════════════════════════════
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘analyzing-medical-innovation-data.Rmd’ using rmarkdown
    
    Quitting from lines 85-88 [Checking-the-methods] (analyzing-medical-innovation-data.Rmd)
    Error: processing vignette 'analyzing-medical-innovation-data.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘analyzing-medical-innovation-data.Rmd’
    
    --- re-building ‘introduction-to-netdiffuser.Rmd’ using rmarkdown
    
    ...
    
    --- re-building ‘time_discount_suscep_infect.Rmd’ using rmarkdown
    --- finished re-building ‘time_discount_suscep_infect.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘analyzing-medical-innovation-data.Rmd’
      ‘introduction-to-netdiffuser.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 16.7Mb
      sub-directories of 1Mb or more:
        doc    2.5Mb
        libs  12.4Mb
    ```

# NetFACS

<details>

* Version: 0.5.0
* GitHub: NA
* Source code: https://github.com/cran/NetFACS
* Date/Publication: 2022-12-06 17:32:35 UTC
* Number of recursive dependencies: 100

Run `revdepcheck::cloud_details(, "NetFACS")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘NetFACS-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: multiple_netfacs_network
    > ### Title: Creates network objects out of the netfacs data
    > ### Aliases: multiple_netfacs_network multiple.netfacs.network
    > 
    > ### ** Examples
    > 
    > data(emotions_set)
    ...
    +   condition = emotions_set[[2]]$emotion,
    +   ran.trials = 10, # only for example
    +   combination.size = 2
    + )
    > 
    > emo.nets <- multiple_netfacs_network(emo.faces)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: multiple_netfacs_network ... %>% -> <Anonymous> -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘netfacs_tutorial.Rmd’ using rmarkdown
    
    Quitting from lines 286-297 [overlap] (netfacs_tutorial.Rmd)
    Error: processing vignette 'netfacs_tutorial.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘netfacs_tutorial.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘netfacs_tutorial.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# netgsa

<details>

* Version: 4.0.4
* GitHub: https://github.com/mikehellstern/netgsa
* Source code: https://github.com/cran/netgsa
* Date/Publication: 2022-10-25 06:02:36 UTC
* Number of recursive dependencies: 113

Run `revdepcheck::cloud_details(, "netgsa")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘netgsa.Rmd’ using rmarkdown
    
    Quitting from lines 150-154 [unnamed-chunk-6] (netgsa.Rmd)
    Error: processing vignette 'netgsa.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘netgsa.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘netgsa.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 28.1Mb
      sub-directories of 1Mb or more:
        doc    2.8Mb
        libs  24.4Mb
    ```

# netjack

<details>

* Version: 1.2.0
* GitHub: NA
* Source code: https://github.com/cran/netjack
* Date/Publication: 2019-07-07 17:50:03 UTC
* Number of recursive dependencies: 64

Run `revdepcheck::cloud_details(, "netjack")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘netjack-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: diff_test
    > ### Title: Test for differences from original statistic
    > ### Aliases: diff_test
    > 
    > ### ** Examples
    > 
    > data(GroupA)
    > GroupA_Net = as_NetSample(GroupA, 1:20, node.variables = list(community = c(rep(1, 10), rep(2,10))),
    +   sample.variables = list(group = c(rep(1, 10), rep(2,10))))
    > Jackknife_GroupA_Net = net_apply(GroupA_Net, node_jackknife)
    > GlobEff_GroupA_Net = net_stat_apply(Jackknife_GroupA_Net, global_efficiency)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: net_stat_apply ... <Anonymous> -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘developingNetjack.Rmd’ using rmarkdown
    --- finished re-building ‘developingNetjack.Rmd’
    
    --- re-building ‘netjackIntro.Rmd’ using rmarkdown
    
    Quitting from lines 114-124 [unnamed-chunk-6] (netjackIntro.Rmd)
    Error: processing vignette 'netjackIntro.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘netjackIntro.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘netjackIntro.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘Rdpack’
      All declared Imports should be used.
    ```

# netmap

<details>

* Version: 0.1.2
* GitHub: https://github.com/artod83/netmap
* Source code: https://github.com/cran/netmap
* Date/Publication: 2023-03-06 14:40:02 UTC
* Number of recursive dependencies: 84

Run `revdepcheck::cloud_details(, "netmap")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      id or vertex.names not found in lookup table
      Invalid network/igraph object supplied
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 20 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-ggcentrality.R:34:3'): ggconn_area returns the correct connected areas for am igraph object ──
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─igraph::graph_from_adjacency_matrix(...) at test-ggcentrality.R:34:2
       2.   └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 20 ]
      Error: Test failures
      Execution halted
    ```

# netmeta

<details>

* Version: 2.8-2
* GitHub: https://github.com/guido-s/netmeta
* Source code: https://github.com/cran/netmeta
* Date/Publication: 2023-05-06 10:10:05 UTC
* Number of recursive dependencies: 98

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
    > data("Woods2010")
    > p1 <- pairwise(treatment, event = r, n = N,
    +   studlab = author, data = Woods2010, sm = "OR")
    > 
    > net1 <- netmeta(p1)
    > cm <- netcontrib(net1)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: netcontrib ... <Anonymous> -> make_graph -> do.call -> <Anonymous>
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
    +                       mmsbm.control = list(seed = 123,
    +                                            conv_tol = 1e-2,
    +                                            hessian = FALSE))
    > 
    > ## Plot blockmodel as network
    > plot(lazega_mmsbm)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot -> plot.mmsbm -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.1Mb
      sub-directories of 1Mb or more:
        libs   5.8Mb
    ```

# netplot

<details>

* Version: 0.1-1
* GitHub: https://github.com/USCCANA/netplot
* Source code: https://github.com/cran/netplot
* Date/Publication: 2021-06-16 07:10:02 UTC
* Number of recursive dependencies: 82

Run `revdepcheck::cloud_details(, "netplot")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘netplot-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: make_colors
    > ### Title: Create a vector of colors for vertices and edges
    > ### Aliases: make_colors make_edges_colors make_vertex_colors
    > 
    > ### ** Examples
    > 
    > 
    > data(UKfaculty, package="igraphdata")
    > col <- make_vertex_colors(UKfaculty, "Group")
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: make_vertex_colors ... <Anonymous> -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    ```

# netrankr

<details>

* Version: 1.2.0
* GitHub: https://github.com/schochastics/netrankr
* Source code: https://github.com/cran/netrankr
* Date/Publication: 2022-09-26 21:00:02 UTC
* Number of recursive dependencies: 65

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: exact_rank_prob ... ensure_igraph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 12.5Mb
      sub-directories of 1Mb or more:
        doc    1.6Mb
        libs  10.6Mb
    ```

# netropy

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/netropy
* Date/Publication: 2022-02-02 08:20:02 UTC
* Number of recursive dependencies: 85

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: assoc_graph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘joint_entropies.Rmd’ using rmarkdown
    
    Quitting from lines 96-98 [assoc_g] (joint_entropies.Rmd)
    Error: processing vignette 'joint_entropies.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
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

# NetSci

<details>

* Version: 1.0.0
* GitHub: NA
* Source code: https://github.com/cran/NetSci
* Date/Publication: 2022-07-03 18:00:02 UTC
* Number of recursive dependencies: 61

Run `revdepcheck::cloud_details(, "NetSci")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘NetSci-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: Histogram_LCC
    > ### Title: Histogram_LCC
    > ### Aliases: Histogram_LCC
    > 
    > ### ** Examples
    > 
    > set.seed(666)
    ...
    + Node.2 = sample(LETTERS[1:10], 15, replace = TRUE))
    > net$value = 1
    > net =  CoDiNA::OrderNames(net)
    > net = unique(net)
    > 
    > g <- igraph::graph_from_data_frame(net, directed = FALSE )
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> -> make_empty_graph
    Execution halted
    ```

# netseg

<details>

* Version: 1.0-1
* GitHub: https://github.com/mbojan/netseg
* Source code: https://github.com/cran/netseg
* Date/Publication: 2022-08-25 12:10:06 UTC
* Number of recursive dependencies: 61

Run `revdepcheck::cloud_details(, "netseg")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘netseg-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: EF3
    > ### Title: Example data from Figure III of Echenique and Fryer (2006)
    > ### Aliases: EF3
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    ...
    +     vertex.color = igraph::V(EF3)$type+1,
    +     vertex.label.family = "",
    +     sub = "Source: Echenique & Fryer (2006)",
    +     main = "Neighborhood racial segregation\n in a fictional city"
    +   )
    + }
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... plot.igraph -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
          ▆
       1. ├─netseg::assort(WhiteKinship, "gender") at test-assort.R:11:10
       2. └─netseg:::assort.igraph(WhiteKinship, "gender")
       3.   ├─netseg::mixingm(object, vattr)
       4.   └─netseg:::mixingm.igraph(object, vattr)
       5.     └─igraph::any_multiple(object)
       6.       └─igraph:::ensure_igraph(graph)
       7.         └─igraph::is_igraph(graph)
       8.           └─igraph:::warn_version(graph)
      ── Failure ('test-smi.R:5:3'): SMI works ───────────────────────────────────────
      `smi(as.directed(WhiteKinship), "gender")` produced messages.
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 72 ]
      Error: Test failures
      Execution halted
    ```

# nett

<details>

* Version: 1.0.0
* GitHub: https://github.com/aaamini/nett
* Source code: https://github.com/cran/nett
* Date/Publication: 2022-11-09 10:50:05 UTC
* Number of recursive dependencies: 97

Run `revdepcheck::cloud_details(, "nett")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘nett-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: fast_cpl
    > ### Title: CPL algorithm for community detection (fast)
    > ### Aliases: fast_cpl
    > ### Keywords: comm_detect
    > 
    > ### ** Examples
    > 
    > head(fast_cpl(igraph::as_adj(polblogs), 2), 50)
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: head ... <Anonymous> -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    ```

# netUtils

<details>

* Version: 0.8.1
* GitHub: https://github.com/schochastics/netUtils
* Source code: https://github.com/cran/netUtils
* Date/Publication: 2022-12-19 21:00:02 UTC
* Number of recursive dependencies: 52

Run `revdepcheck::cloud_details(, "netUtils")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘netUtils-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: core_periphery
    > ### Title: Discrete core-periphery model
    > ### Aliases: core_periphery
    > 
    > ### ** Examples
    > 
    > set.seed(121)
    ...
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    ```

# NetworkExtinction

<details>

* Version: 1.0.3
* GitHub: NA
* Source code: https://github.com/cran/NetworkExtinction
* Date/Publication: 2023-03-31 11:40:02 UTC
* Number of recursive dependencies: 100

Run `revdepcheck::cloud_details(, "NetworkExtinction")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘NetworkExtinction-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ExtinctionPlot
    > ### Title: Plots the extinctions history of a network
    > ### Aliases: ExtinctionPlot
    > 
    > ### ** Examples
    > 
    > # If you don't specify the y variable it will plot the secondary extinctions
    > # by default
    > data("net")
    > history <- SimulateExtinctions(Network = net, Method = "Mostconnected")
    
      |                                                                            
      |                                                                      |   0%Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: SimulateExtinctions ... withCallingHandlers -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        2. │ └─testthat:::expect_condition_matching(...)
        3. │   └─testthat:::quasi_capture(...)
        4. │     ├─testthat (local) .capture(...)
        5. │     │ └─base::withCallingHandlers(...)
        6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        7. └─NetworkExtinction::SimulateExtinctions(Network = net, Method = "Mostconnected")
        8.   └─NetworkExtinction::ExtinctionOrder(...)
        9.     ├─base::suppressMessages(...)
       10.     │ └─base::withCallingHandlers(...)
       11.     └─igraph::graph_from_adjacency_matrix(net, mode = "directed", weighted = TRUE)
       12.       └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 2 | WARN 0 | SKIP 3 | PASS 2 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘NetworkExtinction.Rmd’ using rmarkdown
    
    Quitting from lines 136-141 [mostconnected2] (NetworkExtinction.Rmd)
    Error: processing vignette 'NetworkExtinction.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘NetworkExtinction.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘NetworkExtinction.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# networkGen

<details>

* Version: 0.1.1
* GitHub: NA
* Source code: https://github.com/cran/networkGen
* Date/Publication: 2017-12-04 17:31:37 UTC
* Number of recursive dependencies: 9

Run `revdepcheck::cloud_details(, "networkGen")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘networkGen-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: check.graph
    > ### Title: check.graph
    > ### Aliases: check.graph
    > 
    > ### ** Examples
    > 
    > check.graph(nodeLogic(value = 1, type= "circuit", itemFamily= 1))
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: check.graph ... graph_from_literal_i -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘mgcv’ ‘stats’
      All declared Imports should be used.
    ```

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# NetworkInference

<details>

* Version: 1.2.4
* GitHub: https://github.com/desmarais-lab/NetworkInference
* Source code: https://github.com/cran/NetworkInference
* Date/Publication: 2019-02-28 05:50:06 UTC
* Number of recursive dependencies: 77

Run `revdepcheck::cloud_details(, "NetworkInference")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘NetworkInference-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: simulate_cascades
    > ### Title: Simulate cascades from a diffusion network
    > ### Aliases: simulate_cascades
    > 
    > ### ** Examples
    > 
    > 
    ...
    **************************************************|
    Inferring 5 edges...
    0%   10   20   30   40   50   60   70   80   90   100%
    [----|----|----|----|----|----|----|----|----|----|
    **************************************************|
    > simulated_cascades <- simulate_cascades(out, nsim = 10)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: simulate_cascades ... lapply -> FUN -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘quickstart_vignette.Rmd’ using rmarkdown
    --- finished re-building ‘quickstart_vignette.Rmd’
    
    --- re-building ‘tutorial_vignette.Rmd’ using rmarkdown
    Warning: ggrepel: 16 unlabeled data points (too many overlaps). Consider increasing max.overlaps
    
    Quitting from lines 278-284 [unnamed-chunk-29] (tutorial_vignette.Rmd)
    Error: processing vignette 'tutorial_vignette.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘tutorial_vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘tutorial_vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# NetworkToolbox

<details>

* Version: 1.4.2
* GitHub: NA
* Source code: https://github.com/cran/NetworkToolbox
* Date/Publication: 2021-05-28 11:40:06 UTC
* Number of recursive dependencies: 111

Run `revdepcheck::cloud_details(, "NetworkToolbox")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘NetworkToolbox-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: comcat
    > ### Title: Communicating Nodes
    > ### Aliases: comcat
    > 
    > ### ** Examples
    > 
    > # Pearson's correlation only for CRAN checks
    > A <- TMFG(neoOpen, normal = FALSE)$A
    > 
    > communicating <- comcat(A, comm = "walktrap", cent = "strength", metric = "across")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: comcat ... graph.edgelist -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

# networktools

<details>

* Version: 1.5.0
* GitHub: https://github.com/paytonjjones/networktools
* Source code: https://github.com/cran/networktools
* Date/Publication: 2022-06-03 22:20:02 UTC
* Number of recursive dependencies: 158

Run `revdepcheck::cloud_details(, "networktools")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > 
      > test_check("networktools")
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 0 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-networktools.R:7:1'): (code run outside of `test_that()`) ──────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─igraph::graph_from_adjacency_matrix(dep_cor, mode = "undirected") at test-networktools.R:7:0
       2.   └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
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
    
    > ### Name: analyseNetwork
    > ### Title: General properties of the network
    > ### Aliases: analyseNetwork
    > 
    > ### ** Examples
    > 
    > # generate a toy graph
    > g1 <- igraph::make_graph(c(1, 2, 3, 4, 1, 3), directed = FALSE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       1. └─igraph::make_graph(c(1, 2, 3, 4, 1, 3), directed = FALSE) at test-analyse-network.R:2:2
       2.   ├─base::do.call(old_graph, args)
       3.   └─igraph (local) `<fn>`(`<dbl>`, directed = FALSE)
      ── Error ('test-find-cluster.R:5:3'): find cluster works ───────────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─NIMAA::findCluster(...) at test-find-cluster.R:5:2
       2.   └─NIMAA:::projectGraph(inc_mat, dim = part)
       3.     └─igraph::graph_from_adjacency_matrix(...)
       4.       └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 2 | WARN 6 | SKIP 0 | PASS 8 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘NIMAA-vignette.Rmd’ using rmarkdown
    
    Quitting from lines 70-74 [plotBipartite] (NIMAA-vignette.Rmd)
    Error: processing vignette 'NIMAA-vignette.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘NIMAA-vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘NIMAA-vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        doc   4.0Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 24 marked UTF-8 strings
    ```

# nimble

<details>

* Version: 1.0.0
* GitHub: https://github.com/nimble-dev/nimble
* Source code: https://github.com/cran/nimble
* Date/Publication: 2023-05-23 19:42:03 UTC
* Number of recursive dependencies: 38

Run `revdepcheck::cloud_details(, "nimble")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘nimble-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: MCMCconf-class
    > ### Title: Class 'MCMCconf'
    > ### Aliases: MCMCconf-class MCMCconf addSampler removeSamplers setSamplers
    > ###   printSamplers getSamplers setSamplerExecutionOrder
    > ###   getSamplerExecutionOrder addMonitors addMonitors2 setMonitors
    > ###   setMonitors2 resetMonitors getMonitors getMonitors2 printMonitors
    > ###   setThin setThin2
    ...
    > code <- nimbleCode({
    +  mu ~ dnorm(0, 1)
    +  x ~ dnorm(mu, 1)
    + })
    > Rmodel <- nimbleModel(code)
    Defining model
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: nimbleModel ... <Anonymous> -> genExpandedNodeAndParentNames3 -> graph.empty
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 45.2Mb
      sub-directories of 1Mb or more:
        CppCode        2.6Mb
        R              7.4Mb
        classic-bugs   1.6Mb
        include       10.6Mb
        libs          22.1Mb
    ```

# nlnet

<details>

* Version: 1.4
* GitHub: NA
* Source code: https://github.com/cran/nlnet
* Date/Publication: 2020-10-19 23:10:05 UTC
* Number of recursive dependencies: 38

Run `revdepcheck::cloud_details(, "nlnet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘nlnet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: nlnet
    > ### Title: Non-Linear Network reconstruction from expression matrix
    > ### Aliases: nlnet
    > 
    > ### ** Examples
    > 
    >  
    ...
    > ## now input includes data matrix and hiden clusters, so get the matrix as input.
    > input<-input$data 
    > ##change the ploting method
    >  result<-nlnet(input,plot.method="graph")
    ------fdr cutoff aimed  7.426061e-16 -------
    ------fdr cutoff real  0.05 -------
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: nlnet -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

# nlrx

<details>

* Version: 0.4.4
* GitHub: https://github.com/ropensci/nlrx
* Source code: https://github.com/cran/nlrx
* Date/Publication: 2023-05-16 14:40:02 UTC
* Number of recursive dependencies: 155

Run `revdepcheck::cloud_details(, "nlrx")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat-class.R’
      Running ‘testthat-exe1.R’
      Running ‘testthat-exe2.R’
      Running ‘testthat-exe3.R’
      Running ‘testthat-nldoc.R’
    Running the tests in ‘tests/testthat-nldoc.R’ failed.
    Last 13 lines of output:
      [1] "File successfully compiled!"
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 2 ]
      
    ...
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─nlrx::nldoc_network(modelfiles) at test-nldoc.R:51:4
       2.   └─igraph::graph_from_data_frame(nw)
       3.     └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 2 ]
      Error: Test failures
      Execution halted
    ```

# node2vec

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/node2vec
* Date/Publication: 2021-01-14 09:00:02 UTC
* Number of recursive dependencies: 34

Run `revdepcheck::cloud_details(, "node2vec")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘node2vec-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: node2vecR
    > ### Title: Algorithmic Framework for Representational Learning on Graphs
    > ### Aliases: node2vecR
    > 
    > ### ** Examples
    > 
    > #Parameters can be customized as needed
    > data(gene_edges)
    > use_data<-gene_edges
    > emb<-node2vecR(use_data,p=2,q=1,num_walks=5,walk_length=5,dim=10)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: node2vecR -> graph_from_data_frame -> make_empty_graph
    Execution halted
    ```

# nutriNetwork

<details>

* Version: 0.1.1
* GitHub: NA
* Source code: https://github.com/cran/nutriNetwork
* Date/Publication: 2019-04-26 10:00:02 UTC
* Number of recursive dependencies: 17

Run `revdepcheck::cloud_details(, "nutriNetwork")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘nutriNetwork-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot.nutriNetwork
    > ### Title: plot for S3 class "nutriNetwork"
    > ### Aliases: plot.nutriNetwork
    > 
    > ### ** Examples
    > 
    > ## Don't show: 
    ...
    > out <- nutriNetwork(vfit, method = "npn")
    Network reconstruction is in progress ... 
     
    Network reconstruction is done. 
     
    > plot(out)  
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... plot.nutriNetwork -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

# OCNet

<details>

* Version: 1.0.1
* GitHub: NA
* Source code: https://github.com/cran/OCNet
* Date/Publication: 2023-04-25 13:50:02 UTC
* Number of recursive dependencies: 77

Run `revdepcheck::cloud_details(, "OCNet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘OCNet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: OCN_to_SSN
    > ### Title: Transform OCN into SSN object
    > ### Aliases: OCN_to_SSN
    > 
    > ### ** Examples
    > 
    > # transform a 20x20 single-outlet OCN (aggregated at the AG level)
    > # into a SSN object and plot it
    > OCN <- aggregate_OCN(landscape_OCN(OCN_20), thrA = 4)
    > ssn1 <- OCN_to_SSN(OCN, "AG", obsDesign = SSN::poissonDesign(10), 
    + path=paste(tempdir(),"/OCN.ssn", sep = ""), importToR = TRUE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: OCN_to_SSN ... graph.adjacency.sparse -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.1Mb
      sub-directories of 1Mb or more:
        data   2.6Mb
        libs   4.4Mb
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
    
    > ### Name: anomalous_networks
    > ### Title: Identifies anomalous networks from a series of temporal
    > ###   networks.
    > ### Aliases: anomalous_networks
    > 
    > ### ** Examples
    > 
    ...
    > p.or.m.seq <- rep(0.1, 50)
    > p.or.m.seq[20] <- 0.3  # anomalous network at 20
    > for(i in 1:50){
    +   gr <- igraph::erdos.renyi.game(50, p.or.m = p.or.m.seq[i])
    +   networks[[i]] <- igraph::as_adjacency_matrix(gr)
    + }
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous>
    Execution halted
    ```

# ohun

<details>

* Version: 0.1.0
* GitHub: https://github.com/maRce10/ohun
* Source code: https://github.com/cran/ohun
* Date/Publication: 2022-12-19 09:30:02 UTC
* Number of recursive dependencies: 89

Run `revdepcheck::cloud_details(, "ohun")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ohun-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: label_detection
    > ### Title: Label detections from a sound event detection procedure
    > ### Aliases: label_detection
    > 
    > ### ** Examples
    > 
    > {
    ...
    + label_detection(reference = lbh_reference, detection = Y)
    + 
    + # remove split to get only merge
    + Y <- Y[-2, ]
    + label_detection(reference = lbh_reference, detection = Y)
    + }
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: label_detection ... lapply -> FUN -> <Anonymous> -> graph.incidence.dense
    Execution halted
    ```

# OpenRepGrid

<details>

* Version: 0.1.14
* GitHub: https://github.com/markheckmann/OpenRepGrid
* Source code: https://github.com/cran/OpenRepGrid
* Date/Publication: 2023-05-16 15:00:11 UTC
* Number of recursive dependencies: 86

Run `revdepcheck::cloud_details(, "OpenRepGrid")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘OpenRepGrid-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: indexDilemma
    > ### Title: Detect implicative dilemmas (conflicts).
    > ### Aliases: indexDilemma
    > 
    > ### ** Examples
    > 
    > id <- indexDilemma(boeker, self = 1, ideal = 2)
    ...
    	R = Correlation including Self & Ideal
    	RexSI = Correlation excluding Self & Ideal
    	R was used as criterion> 
    > # plot dilemmas as network graph (see ?plot.indexDilemma for help)
    > # set a seed for reproducibility
    > plot(id, layout = "rows")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... plot.indexDilemma -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

# OpenRepGrid.ic

<details>

* Version: 0.6.1
* GitHub: https://github.com/markheckmann/OpenRepGrid.ic
* Source code: https://github.com/cran/OpenRepGrid.ic
* Date/Publication: 2022-10-25 18:57:49 UTC
* Number of recursive dependencies: 148

Run `revdepcheck::cloud_details(, "OpenRepGrid.ic")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
          ▆
       1. └─OpenRepGrid.ic::network_graph_images(...) at test-excel.R:15:2
       2.   └─igraph::graph_from_adjacency_matrix(MM, diag = FALSE, mode = "undirected")
       3.     └─igraph:::graph.adjacency.dense(...)
      ── Error ('test-excel.R:57:3'): Excel output file gets created ─────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─OpenRepGrid.ic::network_graph_images(...) at test-excel.R:57:2
       2.   └─igraph::graph_from_adjacency_matrix(MM, diag = FALSE, mode = "undirected")
       3.     └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 29 ]
      Error: Test failures
      Execution halted
    ```

# OrdCD

<details>

* Version: 1.1.2
* GitHub: https://github.com/nySTAT/OrdCD
* Source code: https://github.com/cran/OrdCD
* Date/Publication: 2023-05-17 21:40:11 UTC
* Number of recursive dependencies: 19

Run `revdepcheck::cloud_details(, "OrdCD")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘OrdCD-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: OrdCD
    > ### Title: Causal Discovery for Ordinal Categorical Data
    > ### Aliases: OrdCD
    > 
    > ### ** Examples
    > 
    > set.seed(2020)
    ...
    > for (j in 1:q){
    +   y[,j]=as.factor(y[,j])
    + }
    > 
    > time=proc.time()
    > G=OrdCD(y) #estimated DAG adjacency matrix
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: OrdCD ... <Anonymous> -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

# PAC

<details>

* Version: 1.1.4
* GitHub: NA
* Source code: https://github.com/cran/PAC
* Date/Publication: 2021-02-18 07:00:02 UTC
* Number of recursive dependencies: 62

Run `revdepcheck::cloud_details(, "PAC")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘intro.Rmd’ using rmarkdown
    
    Quitting from lines 42-43 [PAC and Network Inference] (intro.Rmd)
    Error: processing vignette 'intro.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘intro.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘intro.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# PAFit

<details>

* Version: 1.2.5
* GitHub: https://github.com/thongphamthe/PAFit
* Source code: https://github.com/cran/PAFit
* Date/Publication: 2022-01-11 10:02:48 UTC
* Number of recursive dependencies: 61

Run `revdepcheck::cloud_details(, "PAFit")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘PAFit-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: from_igraph
    > ### Title: Convert an igraph object to a PAFit_net object
    > ### Aliases: from_igraph
    > 
    > ### ** Examples
    > 
    >   library("PAFit")
    >   # a network from Bianconi-Barabasi model
    >   net          <- generate_BB(N = 50 , m = 10 , s = 10)
    >   igraph_graph <- to_igraph(net)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: to_igraph -> graph.data.frame -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘fit_node_no_new_edge.R’
      Running ‘loop_generate.R’
      Running ‘loop_joint_estimate.R’
      Running ‘loop_overall.R’
      Running ‘loop_test_Newman_Kong.R’
      Running ‘test_GenerateNet_final_padding.R’
      Running ‘test_GetStatistics_compress_2.R’
      Running ‘test_GetStatistics_undirected.R’
      Running ‘test_Newman_Kong.R’
      Running ‘test_PAFit_oneshot.R’
    ...
      > library(PAFit)
      > 
      > net <- generate_BA(N = 100, multiple_node = 20, m = 1)
      > 
      > system.time(b <- to_igraph(net))
      Error in .igraph.status("Make graph external pointer.\n") : 
        could not find function ".igraph.status"
      Calls: system.time -> to_igraph -> graph.data.frame -> make_empty_graph
      Timing stopped at: 0.002 0 0.002
      Execution halted
    ```

# PairViz

<details>

* Version: 1.3.6
* GitHub: NA
* Source code: https://github.com/cran/PairViz
* Date/Publication: 2022-08-12 15:00:05 UTC
* Number of recursive dependencies: 109

Run `revdepcheck::cloud_details(, "PairViz")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘MultipleComparisons.Rmd’ using rmarkdown
    
    Quitting from lines 146-160 [unnamed-chunk-11] (MultipleComparisons.Rmd)
    Error: processing vignette 'MultipleComparisons.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘MultipleComparisons.Rmd’
    
    --- re-building ‘PairVizIntroduction.Rmd’ using rmarkdown
    
    ...
    Quitting from lines 370-371 [unnamed-chunk-29] (pcp.Rmd)
    Error: processing vignette 'pcp.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘pcp.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘MultipleComparisons.Rmd’ ‘PairVizIntroduction.Rmd’ ‘pcp.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# pald

<details>

* Version: 0.0.2
* GitHub: https://github.com/LucyMcGowan/pald
* Source code: https://github.com/cran/pald
* Date/Publication: 2022-06-03 08:30:02 UTC
* Number of recursive dependencies: 35

Run `revdepcheck::cloud_details(, "pald")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘pald-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: cohesion_strong
    > ### Title: Cohesion Matrix: Strong Ties
    > ### Aliases: cohesion_strong
    > 
    > ### ** Examples
    > 
    > C <- cohesion_matrix(dist(exdata2))
    ...
    > if (requireNamespace("igraph", quietly = TRUE)) {
    + G_strong <- igraph::simplify(
    +   igraph::graph.adjacency(CS, weighted = TRUE, mode = "undirected")
    +   )
    + plot(G_strong)
    + }
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> ... ensure_igraph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-pald_functions.R:59:3'): community_clusters works ──────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─pald::community_clusters(C) at test-pald_functions.R:59:2
       2.   └─pald::community_graphs(c)
       3.     ├─igraph::simplify(...)
       4.     │ └─igraph:::ensure_igraph(graph)
       5.     └─igraph::graph.adjacency(c_symmetric, weighted = TRUE, mode = "undirected")
       6.       └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 11 ]
      Error: Test failures
      Execution halted
    ```

# PANACEA

<details>

* Version: 1.0.0
* GitHub: https://github.com/egeulgen/PANACEA
* Source code: https://github.com/cran/PANACEA
* Date/Publication: 2023-05-02 21:10:05 UTC
* Number of recursive dependencies: 86

Run `revdepcheck::cloud_details(, "PANACEA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘PANACEA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: score_drugs
    > ### Title: Scoring of Drugs via Network-based Methods
    > ### Aliases: score_drugs
    > 
    > ### ** Examples
    > 
    > toy_data <- data.frame(
    ...
    +   driveR_res = toy_data,
    +   drug_interactions_df = toy_interactions, # leave blank for default
    +   W_mat = toy_W_mat, # leave blank for default
    +   method = "distance-based",
    +   verbose = FALSE
    + )
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: score_drugs ... score_drugs_distance_based -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

# paramlink

<details>

* Version: 1.1-5
* GitHub: https://github.com/magnusdv/paramlink
* Source code: https://github.com/cran/paramlink
* Date/Publication: 2022-04-15 08:10:02 UTC
* Number of recursive dependencies: 21

Run `revdepcheck::cloud_details(, "paramlink")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘paramlink-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: pedigreeLoops
    > ### Title: Pedigree loops
    > ### Aliases: pedigreeLoops breakLoops tieLoops findLoopBreakers
    > ###   findLoopBreakers2
    > 
    > ### ** Examples
    > 
    ...
    > if(requireNamespace("igraph", quietly = TRUE)) {
    +     y = doubleCousins(1, 1, child=TRUE)
    +     findLoopBreakers(y) # --> 9
    +     findLoopBreakers2(y) # --> 9 and 4
    +     breakLoops(y) # uses both 9 and 4
    + }
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: findLoopBreakers2 ... <Anonymous> -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

# particles

<details>

* Version: 0.2.3
* GitHub: https://github.com/thomasp85/particles
* Source code: https://github.com/cran/particles
* Date/Publication: 2022-08-19 12:20:05 UTC
* Number of recursive dependencies: 81

Run `revdepcheck::cloud_details(, "particles")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘particles-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: evolve
    > ### Title: Move the simulation forward one or more steps
    > ### Aliases: evolve
    > 
    > ### ** Examples
    > 
    > graph <- tidygraph::create_notable('folkman')
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> -> as_tbl_graph -> make_graph -> make_famous_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘intro.Rmd’ using rmarkdown
    
    Quitting from lines 61-71 [unnamed-chunk-1] (intro.Rmd)
    Error: processing vignette 'intro.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘intro.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘intro.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# pathfindR

<details>

* Version: 2.1.0
* GitHub: https://github.com/egeulgen/pathfindR
* Source code: https://github.com/cran/pathfindR
* Date/Publication: 2023-05-12 07:10:03 UTC
* Number of recursive dependencies: 143

Run `revdepcheck::cloud_details(, "pathfindR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘pathfindR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: combine_pathfindR_results
    > ### Title: Combine 2 pathfindR Results
    > ### Aliases: combine_pathfindR_results
    > 
    > ### ** Examples
    > 
    > combined_results <- combine_pathfindR_results(example_pathfindR_output, example_comparison_output)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: combine_pathfindR_results ... combined_results_graph -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat-active_snw.R’
      Running ‘testthat-clustering.R’
    Running the tests in ‘tests/testthat-clustering.R’ failed.
    Last 13 lines of output:
                with the additional columns `Cluster` and `Status` ──
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─pathfindR::cluster_enriched_terms(...) at test-clustering.R:419:2
       2.   ├─R.utils::doCall(...)
       3.   ├─R.utils::doCall.default(...)
       4.   │ └─base::do.call(.fcn, args = args, envir = envir)
       5.   └─pathfindR::cluster_graph_vis(...)
       6.     └─igraph::graph_from_adjacency_matrix(kappa_mat2, weighted = TRUE)
       7.       └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 3 | WARN 0 | SKIP 1 | PASS 45 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘comparing_results.Rmd’ using rmarkdown
    
    Quitting from lines 34-35 [compare_graph1] (comparing_results.Rmd)
    Error: processing vignette 'comparing_results.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘comparing_results.Rmd’
    
    --- re-building ‘intro_vignette.Rmd’ using rmarkdown
    --- finished re-building ‘intro_vignette.Rmd’
    ...
    Quitting from lines 122-123 [term_gene1] (visualization_vignette.Rmd)
    Error: processing vignette 'visualization_vignette.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘visualization_vignette.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘comparing_results.Rmd’ ‘visualization_vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# pcalg

<details>

* Version: 2.7-8
* GitHub: NA
* Source code: https://github.com/cran/pcalg
* Date/Publication: 2022-12-21 00:20:05 UTC
* Number of recursive dependencies: 58

Run `revdepcheck::cloud_details(, "pcalg")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘pcalg-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: addBgKnowledge
    > ### Title: Add background knowledge to a CPDAG or PDAG
    > ### Aliases: addBgKnowledge
    > ### Keywords: models
    > 
    > ### ** Examples
    > 
    > ## a -- b -- c
    > amat <- matrix(c(0,1,0, 1,0,1, 0,1,0), 3,3)
    > colnames(amat) <- rownames(amat) <- letters[1:3]
    > ## plot(as(t(amat), "graphNEL"))             
    > addBgKnowledge(gInput = amat) ## amat is a valid CPDAG
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: addBgKnowledge ... ensure_igraph -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘test_LINGAM.R’
      Running ‘test_addBgKnowledge.R’
    Running the tests in ‘tests/test_addBgKnowledge.R’ failed.
    Last 13 lines of output:
          duplicated, eval, evalq, get, grep, grepl, intersect, is.unsorted,
          lapply, mapply, match, mget, order, paste, pmax, pmax.int, pmin,
          pmin.int, rank, rbind, rownames, sapply, setdiff, sort, table,
          tapply, union, unique, unsplit, which.max, which.min
      
      > cpdag <- dag2cpdag(g)
      > ## plot(cpdag)
      > cpdag.mat <- t(as(cpdag,"matrix")) ## has correct encoding
      > 
      > ## test 1: using graph, valid
      > g1 <- addBgKnowledge(gInput = cpdag, x = 3, y = 5)
      Error in .igraph.status("Make graph external pointer.\n") : 
        could not find function ".igraph.status"
      Calls: addBgKnowledge ... ensure_igraph -> graph.adjacency -> graph.adjacency.dense
      Execution halted
    ```

*   checking running R code from vignettes ... ERROR
    ```
    Errors in running code in vignettes:
    when running code in ‘vignette2018.Rnw’
      ...
    
    > amat <- matrix(c(0, 1, 0, 1, 0, 1, 0, 1, 0), 3, 3)
    
    > colnames(amat) <- rownames(amat) <- letters[1:3]
    
    > bg <- addBgKnowledge(gInput = amat, x = "a", y = "b")
    
      When sourcing 'vignette2018.R':
    Error: could not find function ".igraph.status"
    Execution halted
    
      ‘vignette2018.Rnw’ using ‘UTF-8’... failed
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 16.7Mb
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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    
    --- failed re-building 'vignette2018.Rnw'
    
    SUMMARY: processing the following file failed:
      'vignette2018.Rnw'
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# pcFactorStan

<details>

* Version: 1.5.3
* GitHub: https://github.com/jpritikin/pcFactorStan
* Source code: https://github.com/cran/pcFactorStan
* Date/Publication: 2021-09-25 15:50:02 UTC
* Number of recursive dependencies: 126

Run `revdepcheck::cloud_details(, "pcFactorStan")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘pcFactorStan-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: filterGraph
    > ### Title: Filter graph to remove vertices that are not well connected
    > ### Aliases: filterGraph
    > 
    > ### ** Examples
    > 
    > df <- filterGraph(phyActFlowPropensity[,c(paste0('pa',1:2),'predict')])
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: filterGraph ... graph_from_edgelist -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       6.         └─igraph (local) `<fn>`(`<int>`, directed = FALSE)
      ── Error ('test-7report.R:62:3'): parInterval+parDistributionFor ───────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─pcFactorStan::prepData(phyActFlowPropensity[, c(1, 2, 3)]) at test-7report.R:62:2
       2.   └─pcFactorStan::filterGraph(df)
       3.     └─igraph::graph_from_edgelist(el, directed = FALSE)
       4.       └─igraph::make_graph(unname(ids[t(el)]), directed = directed)
       5.         ├─base::do.call(old_graph, args)
       6.         └─igraph (local) `<fn>`(`<int>`, directed = FALSE)
      
      [ FAIL 5 | WARN 0 | SKIP 5 | PASS 53 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 300.1Mb
      sub-directories of 1Mb or more:
        doc     2.9Mb
        libs  296.5Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘rstantools’
      All declared Imports should be used.
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# pedtools

<details>

* Version: 2.2.0
* GitHub: https://github.com/magnusdv/pedtools
* Source code: https://github.com/cran/pedtools
* Date/Publication: 2023-05-25 10:40:02 UTC
* Number of recursive dependencies: 77

Run `revdepcheck::cloud_details(, "pedtools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘pedtools-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: inbreedingLoops
    > ### Title: Pedigree loops
    > ### Aliases: inbreedingLoops breakLoops tieLoops findLoopBreakers
    > ###   findLoopBreakers2
    > 
    > ### ** Examples
    > 
    ...
    +   plot(y2)
    + 
    +   # Or loop breakers chosen by user
    +   y3 = breakLoops(y, 6:7)
    +   plot(y3)
    + }
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: findLoopBreakers2 ... <Anonymous> -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

## In both

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-founder-inbreeding.R:24:3'): setFounderInbreeding works on lists ──
      fi(y1) not equal to c(`1` = 1, `2` = 1, `4` = 1).
      3/3 mismatches (average diff: 1)
      [1] 0 - 1 == -1
      [2] 0 - 1 == -1
      [3] 0 - 1 == -1
      ── Failure ('test-founder-inbreeding.R:27:3'): setFounderInbreeding works on lists ──
      fi(y2) not equal to c(`1` = 0, `2` = 1, `4` = 0).
      1/3 mismatches
      [2] 0 - 1 == -1
      
      [ FAIL 2 | WARN 0 | SKIP 2 | PASS 595 ]
      Error: Test failures
      Execution halted
    ```

# perturbR

<details>

* Version: 0.1.3
* GitHub: NA
* Source code: https://github.com/cran/perturbR
* Date/Publication: 2019-02-19 09:30:03 UTC
* Number of recursive dependencies: 54

Run `revdepcheck::cloud_details(, "perturbR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘perturbR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: perturbR
    > ### Title: Perturb networks and evaluate subgroup structures.
    > ### Aliases: perturbR evalClust
    > 
    > ### ** Examples
    > 
    > perturbR(exampledata, plot=FALSE, resolution=0.10, reps=1, errbars = FALSE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: perturbR -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

# pGRN

<details>

* Version: 0.3.5
* GitHub: NA
* Source code: https://github.com/cran/pGRN
* Date/Publication: 2023-01-17 17:20:02 UTC
* Number of recursive dependencies: 94

Run `revdepcheck::cloud_details(, "pGRN")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘pGRN-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_networks
    > ### Title: Get the list of sub-networks
    > ### Aliases: get_networks
    > 
    > ### ** Examples
    > 
    > example_data <- pGRNDB
    ...
    > pseudotime_list <- example_data[["ptime"]]$PseudoTime
    > dtw_dist_matrix <- get_dtw_dist_mat(expression_matrix,
    +                                     pseudotime_list,
    +                                     cores=1)
    > adj_df <- matrix2adj(dtw_dist_matrix)
    > get_networks(adj_df,network_min_genes=5)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: get_networks ... as_graph_edge_df -> graph_from_data_frame -> make_empty_graph
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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: neighborNet ... as.networx.splits -> circNetwork -> graph -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
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
    could not find function ".igraph.status"
    --- failed re-building ‘Trees.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘IntertwiningTreesAndNetworks.Rmd’ ‘MLbyHand.Rmd’ ‘Networx.Rmd’
      ‘Trees.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.8Mb
      sub-directories of 1Mb or more:
        doc    1.5Mb
        libs   5.8Mb
    ```

# PhaseTypeR

<details>

* Version: 1.0.4
* GitHub: https://github.com/rivasiker/PhaseTypeR
* Source code: https://github.com/cran/PhaseTypeR
* Date/Publication: 2022-07-21 16:20:05 UTC
* Number of recursive dependencies: 62

Run `revdepcheck::cloud_details(, "PhaseTypeR")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. ├─testthat::expect_warning(...) at test-phase_type_to_network.R:33:4
       2. │ └─testthat:::expect_condition_matching(...)
       3. │   └─testthat:::quasi_capture(...)
       4. │     ├─testthat (local) .capture(...)
       5. │     │ └─base::withCallingHandlers(...)
       6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
       7. └─PhaseTypeR::phase_type_to_network(disc_phase_type, 3)
       8.   └─igraph::graph_from_data_frame(...)
       9.     └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 5 | WARN 0 | SKIP 8 | PASS 102 ]
      Error: Test failures
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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: graph_perm_test -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘gt_vignette.Rmd’ using rmarkdown
    
    Quitting from lines 128-134 [unnamed-chunk-4] (gt_vignette.Rmd)
    Error: processing vignette 'gt_vignette.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
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

# phylosignal

<details>

* Version: 1.3
* GitHub: NA
* Source code: https://github.com/cran/phylosignal
* Date/Publication: 2020-02-03 20:40:07 UTC
* Number of recursive dependencies: 110

Run `revdepcheck::cloud_details(, "phylosignal")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘phylosignal-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: graphClust
    > ### Title: Phylogenetically constrained clustering
    > ### Aliases: graphClust
    > 
    > ### ** Examples
    > 
    > data(navic)
    > gC <- graphClust(navic, lim.phylo = 1, lim.trait = 2, scale.lim = FALSE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: graphClust -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.7Mb
      sub-directories of 1Mb or more:
        help   1.6Mb
        libs   2.9Mb
    ```

# phyloTop

<details>

* Version: 2.1.2
* GitHub: https://github.com/MichelleKendall/phyloTop
* Source code: https://github.com/cran/phyloTop
* Date/Publication: 2023-01-24 15:20:02 UTC
* Number of recursive dependencies: 93

Run `revdepcheck::cloud_details(, "phyloTop")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘phyloTop-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: avgLadder
    > ### Title: Average ladder size
    > ### Aliases: avgLadder
    > 
    > ### ** Examples
    > 
    > ## Find the average ladder size in a random tree with 20 tips:
    > tree <- rtree(20)
    > plot(tree)
    > avgLadder(tree)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: avgLadder ... graph_from_edgelist -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('testbasics.R:11:1'): (code run outside of `test_that()`) ────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─phyloTop::phyloTop(trees) at testbasics.R:11:0
       2.   └─phyloTop::ladderSizes(treeList[[i]])
       3.     └─igraph::graph_from_edgelist(chEL)
       4.       └─igraph::make_graph(unname(ids[t(el)]), directed = directed)
       5.         ├─base::do.call(old_graph, args)
       6.         └─igraph (local) `<fn>`(`<int>`, directed = TRUE)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

# pkggraph

<details>

* Version: 0.2.3
* GitHub: https://github.com/talegari/pkggraph
* Source code: https://github.com/cran/pkggraph
* Date/Publication: 2018-11-15 09:50:03 UTC
* Number of recursive dependencies: 71

Run `revdepcheck::cloud_details(, "pkggraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘pkggraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: make_neighborhood_graph
    > ### Title: make_neighborhood_graph
    > ### Aliases: make_neighborhood_graph
    > 
    > ### ** Examples
    > 
    > pkggraph::init(local = TRUE)
    Using 'local' data ...
    To fetch data from CRAN over internet, run:`pkggraph::init(local = FALSE)`
    Done!
    > graph_object <- pkggraph::get_neighborhood("caret")
    > pkggraph::make_neighborhood_graph(graph_object)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

# PlackettLuce

<details>

* Version: 0.4.2
* GitHub: https://github.com/hturner/PlackettLuce
* Source code: https://github.com/cran/PlackettLuce
* Date/Publication: 2022-08-15 07:50:05 UTC
* Number of recursive dependencies: 184

Run `revdepcheck::cloud_details(, "PlackettLuce")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘PlackettLuce-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: PlackettLuce
    > ### Title: Fit a Plackett-Luce Model
    > ### Aliases: PlackettLuce
    > 
    > ### ** Examples
    > 
    > # Six partial rankings of four objects, 1 is top rank, e.g
    ...
    > 
    > # create rankings object
    > R <- as.rankings(R)
    > 
    > # Standard maximum likelihood estimates
    > mod_mle <- PlackettLuce(R, npseudo = 0)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: PlackettLuce ... graph_from_adjacency_matrix -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Overview.Rmd’ using rmarkdown
    
    Quitting from lines 489-491 [unnamed-chunk-7] (Overview.Rmd)
    Error: processing vignette 'Overview.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘Overview.Rmd’
    
    --- re-building ‘PLADMM.Rmd’ using rmarkdown
    ...
    Quitting from lines 124-126 [unnamed-chunk-5] (PLADMM.Rmd)
    Error: processing vignette 'PLADMM.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘PLADMM.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘Overview.Rmd’ ‘PLADMM.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       2.   └─PlackettLuce::connectivity(X, verbose = FALSE)
       3.     └─igraph::graph_from_adjacency_matrix(x > 0L)
       4.       └─igraph:::graph.adjacency.dense(...)
      ── Error ('test-weights.R:35:5'): (code run outside of `test_that()`) ──────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─PlackettLuce::PlackettLuce(R, npseudo = 0) at test-weights.R:35:4
       2.   └─PlackettLuce::connectivity(X, verbose = FALSE)
       3.     └─igraph::graph_from_adjacency_matrix(x > 0L)
       4.       └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 19 | WARN 0 | SKIP 11 | PASS 104 ]
      Error: Test failures
      Execution halted
    ```

# plantTracker

<details>

* Version: 1.1.0
* GitHub: https://github.com/aestears/plantTracker
* Source code: https://github.com/cran/plantTracker
* Date/Publication: 2023-05-05 18:20:02 UTC
* Number of recursive dependencies: 86

Run `revdepcheck::cloud_details(, "plantTracker")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘plantTracker-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: aggregateByGenet
    > ### Title: aggregateByGenet
    > ### Aliases: aggregateByGenet
    > 
    > ### ** Examples
    > 
    > dat <- grasslandData[grasslandData$Site == c("AZ") &
    ...
    +  aggByGenet = FALSE
    +  )
    Site: AZ
    
    -- Quadrat: SG2
    
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: trackSpp ... graph.adjacency.sparse -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. └─plantTracker::trackSpp(...) at test-trackSpp.R:5:0
        2.   └─plantTracker:::assign(...)
        3.     └─plantTracker (local) ifClonal(cloneDat = tempPreviousYear, clonal = clonal, buffGenet = buffGenet)
        4.       └─plantTracker::groupByGenet(cloneDat, buffGenet)
        5.         ├─igraph::clusters(...)
        6.         │ └─igraph:::ensure_igraph(graph)
        7.         └─igraph::graph_from_adjacency_matrix(methods::as(connects, "lMatrix"))
        8.           └─igraph:::graph.adjacency.sparse(...)
        9.             └─igraph::make_graph(n = vc, edges, directed = (mode == "directed"))
       10.               ├─base::do.call(old_graph, args)
       11.               └─igraph (local) `<fn>`(`<int[,11]>`, n = 11L, directed = TRUE)
      
      [ FAIL 9 | WARN 0 | SKIP 0 | PASS 3 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Suggested_plantTracker_Workflow.Rmd’ using rmarkdown
    Warning in check_pandoc_version(minimum = "2.0.0", recommend = "2.7.2") :
      minidown supports Pandoc >= 2.7.2 Pandoc with older versions may result in unexpected behaviors.
    Warning in options[opts_class] <- Map(code_folding_class, options[opts_class],  :
      number of items to replace is not a multiple of replacement length
    Warning in options[opts_attr] <- Map(code_folding_attr, options[opts_attr],  :
      number of items to replace is not a multiple of replacement length
    Warning in options[opts_class] <- Map(code_folding_class, options[opts_class],  :
      number of items to replace is not a multiple of replacement length
    ...
    Error: processing vignette 'Using_the_plantTracker_trackSpp_function.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘Using_the_plantTracker_trackSpp_function.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘Suggested_plantTracker_Workflow.Rmd’
      ‘Using_the_plantTracker_trackSpp_function.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# plinkQC

<details>

* Version: 0.3.4
* GitHub: https://github.com/meyer-lab-cshl/plinkQC
* Source code: https://github.com/cran/plinkQC
* Date/Publication: 2021-07-15 15:40:02 UTC
* Number of recursive dependencies: 90

Run `revdepcheck::cloud_details(, "plinkQC")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       4.       └─igraph::graph_from_data_frame(combination, directed = FALSE)
       5.         └─igraph::make_empty_graph(n = 0, directed = directed)
      ── Error ('test-utils.R:165:5'): relatednessFilter only returns one fail ID for 4-way relatedness ──
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─plinkQC::relatednessFilter(...) at test-utils.R:165:4
       2.   └─base::lapply(...)
       3.     └─plinkQC (local) FUN(X[[i]], ...)
       4.       └─igraph::graph_from_data_frame(combination, directed = FALSE)
       5.         └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 5 | WARN 8 | SKIP 0 | PASS 69 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘AncestryCheck.Rmd’ using rmarkdown
    A new version of TeX Live has been released. If you need to install or update any LaTeX packages, you have to upgrade TinyTeX with tinytex::reinstall_tinytex(repository = "illinois").
    
    tlmgr: Local TeX Live (2022) is older than remote repository (2023).
    Cross release updates are only supported with
      update-tlmgr-latest(.sh/.exe) --update
    See https://tug.org/texlive/upgrade.html for details.
    Warning in system2("tlmgr", args, ...) :
      running command ''tlmgr' search --file --global '/grffile.sty'' had status 1
    ...
    
    Error: processing vignette 'plinkQC.Rmd' failed with diagnostics:
    LaTeX failed to compile /tmp/workdir/plinkQC/new/plinkQC.Rcheck/vign_test/plinkQC/vignettes/plinkQC.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See plinkQC.log for more info.
    --- failed re-building ‘plinkQC.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘AncestryCheck.Rmd’ ‘Genomes1000.Rmd’ ‘HapMap.Rmd’ ‘plinkQC.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# PLNmodels

<details>

* Version: 1.0.1
* GitHub: https://github.com/pln-team/PLNmodels
* Source code: https://github.com/cran/PLNmodels
* Date/Publication: 2023-02-12 14:42:07 UTC
* Number of recursive dependencies: 147

Run `revdepcheck::cloud_details(, "PLNmodels")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─testthat::expect_true(...) at test-plnnetworkfit.R:45:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. ├─igraph::is.igraph(myPLNfit$plot_network(output = "igraph", plot = FALSE))
       5. └─myPLNfit$plot_network(output = "igraph", plot = FALSE)
       6.   └─igraph::graph_from_adjacency_matrix(...)
       7.     └─igraph:::graph.adjacency.sparse(...)
       8.       └─igraph::make_empty_graph(n = vc, directed = (mode == "directed"))
      
      [ FAIL 1 | WARN 4 | SKIP 0 | PASS 716 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Import_data.Rmd’ using rmarkdown
    --- finished re-building ‘Import_data.Rmd’
    
    --- re-building ‘PLN.Rmd’ using rmarkdown
    --- finished re-building ‘PLN.Rmd’
    
    --- re-building ‘PLNLDA.Rmd’ using rmarkdown
    --- finished re-building ‘PLNLDA.Rmd’
    
    ...
    --- failed re-building ‘PLNnetwork.Rmd’
    
    --- re-building ‘Trichoptera.Rmd’ using rmarkdown
    --- finished re-building ‘Trichoptera.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘PLNnetwork.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 25.2Mb
      sub-directories of 1Mb or more:
        doc    2.2Mb
        libs  21.6Mb
    ```

# pmd

<details>

* Version: 0.2.1
* GitHub: https://github.com/yufree/pmd
* Source code: https://github.com/cran/pmd
* Date/Publication: 2021-01-21 23:20:08 UTC
* Number of recursive dependencies: 122

Run `revdepcheck::cloud_details(, "pmd")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘pmd-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: getcda
    > ### Title: Perform correlation directed analysis for peaks list.
    > ### Aliases: getcda
    > 
    > ### ** Examples
    > 
    > data(spmeinvivo)
    > cluster <- getcorcluster(spmeinvivo)
    75 retention time cluster found.
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: getcorcluster -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘globalstd.Rmd’ using rmarkdown
    
    Quitting from lines 151-161 [comp] (globalstd.Rmd)
    Error: processing vignette 'globalstd.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘globalstd.Rmd’
    
    --- re-building ‘reactomics.Rmd’ using rmarkdown
    --- finished re-building ‘reactomics.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘globalstd.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 62 marked UTF-8 strings
    ```

# PNAR

<details>

* Version: 1.4
* GitHub: NA
* Source code: https://github.com/cran/PNAR
* Date/Publication: 2023-05-12 07:20:06 UTC
* Number of recursive dependencies: 47

Run `revdepcheck::cloud_details(, "PNAR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘PNAR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: adja
    > ### Title: Generation of a network from the Stochastic Block Model
    > ### Aliases: adja
    > 
    > ### ** Examples
    > 
    > W <- adja(N = 20, K = 5, alpha = 0.1)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: adja -> <Anonymous>
    Execution halted
    ```

# polymapR

<details>

* Version: 1.1.3
* GitHub: NA
* Source code: https://github.com/cran/polymapR
* Date/Publication: 2023-03-13 17:20:02 UTC
* Number of recursive dependencies: 198

Run `revdepcheck::cloud_details(, "polymapR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘polymapR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: bridgeHomologues
    > ### Title: Use bridge markers to cluster homologues into linkage groups
    > ### Aliases: bridgeHomologues assembleDuplexLinks
    > 
    > ### ** Examples
    > 
    > data("P1_homologues", "P2_homologues", "SN_DN_P1", "SN_SS_P1", "SN_SS_P2")
    ...
    > ChHomDf<-bridgeHomologues(cluster_stack = P1_homologues[["5"]],
    +                  linkage_df=SN_DN_P1,
    +                  LOD_threshold=4,
    +                  automatic_clustering=TRUE,
    +                  LG_number=5,
    +                  parentname="P1")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: bridgeHomologues -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Vignette_genotype_probabilities.Rmd’ using rmarkdown
    --- finished re-building ‘Vignette_genotype_probabilities.Rmd’
    
    --- re-building ‘Vignette_polymapR.Rmd’ using rmarkdown
    
    Quitting from lines 242-246 [unnamed-chunk-18] (Vignette_polymapR.Rmd)
    Error: processing vignette 'Vignette_polymapR.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘Vignette_polymapR.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Vignette_polymapR.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 12.2Mb
      sub-directories of 1Mb or more:
        R      6.5Mb
        data   4.6Mb
    ```

# polyqtlR

<details>

* Version: 0.0.9
* GitHub: NA
* Source code: https://github.com/cran/polyqtlR
* Date/Publication: 2022-02-02 16:40:02 UTC
* Number of recursive dependencies: 182

Run `revdepcheck::cloud_details(, "polyqtlR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘polyqtlR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: visualisePairing
    > ### Title: Visualise pairing of parental homologues
    > ### Aliases: visualisePairing
    > 
    > ### ** Examples
    > 
    > data("mr.ls")
    > visualisePairing(meiosis_report.ls = mr.ls,
    +                  parent = "P1",
    +                  datawidemax = 3)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: visualisePairing ... setNames -> lapply -> FUN -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘polyqtlR_vignette.rmd’ using rmarkdown
    
    Quitting from lines 694-698 [unnamed-chunk-63] (polyqtlR_vignette.rmd)
    Error: processing vignette 'polyqtlR_vignette.rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘polyqtlR_vignette.rmd’
    
    SUMMARY: processing the following file failed:
      ‘polyqtlR_vignette.rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.0Mb
      sub-directories of 1Mb or more:
        data   2.6Mb
        doc    1.7Mb
        libs   2.2Mb
    ```

# pomdp

<details>

* Version: 1.1.0
* GitHub: https://github.com/mhahsler/pomdp
* Source code: https://github.com/cran/pomdp
* Date/Publication: 2023-01-24 15:40:10 UTC
* Number of recursive dependencies: 77

Run `revdepcheck::cloud_details(, "pomdp")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘POMDP.Rmd’ using rmarkdown
    
    Quitting from lines 376-377 [unnamed-chunk-11] (POMDP.Rmd)
    Error: processing vignette 'POMDP.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘POMDP.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘POMDP.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘pomdp-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: MDP
    > ### Title: Define an MDP Problem
    > ### Aliases: MDP MDP2POMDP is_solved_MDP
    > 
    > ### ** Examples
    > 
    > # Michael's Sleepy Tiger Problem is like the POMDP Tiger problem, but
    ...
      Horizon: Inf epochs
      Size: 2 states / 3 actions
    
      List components: ‘name’, ‘discount’, ‘horizon’, ‘states’, ‘actions’,
        ‘transition_prob’, ‘reward’, ‘start’
    > 
    > sol <- solve_MDP(STiger, eps = 1e-7)
    Error in P[[a]][s, ] : no 'dimnames' attribute for array
    Calls: solve_MDP ... MDP_value_iteration_inf_horizon -> outer -> FUN -> do.call -> mapply -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─pomdp::plot_policy_graph(sol) at test-solve_POMDP.R:9:0
       2.   └─pomdp:::.plot.igraph(...)
       3.     └─pomdp::policy_graph(...)
       4.       └─pomdp:::policy_graph_converged(...)
       5.         └─igraph::graph.edgelist(as.matrix(l[, 1:2]))
       6.           └─igraph::make_graph(t(el), directed = directed)
       7.             ├─base::do.call(old_graph, args)
       8.             └─igraph (local) `<fn>`(`<dbl[,10]>`, directed = TRUE)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 58 ]
      Error: Test failures
      Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.5Mb
      sub-directories of 1Mb or more:
        libs   5.6Mb
    ```

# pop

<details>

* Version: 0.1
* GitHub: NA
* Source code: https://github.com/cran/pop
* Date/Publication: 2016-06-07 06:26:35
* Number of recursive dependencies: 40

Run `revdepcheck::cloud_details(, "pop")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘pop-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dynamic
    > ### Title: dynamic objects
    > ### Aliases: as.matrix.dynamic dynamic is.dynamic parameters.dynamic
    > ###   parameters<-.dynamic plot.dynamic print.dynamic states
    > 
    > ### ** Examples
    > 
    ...
    > # combine these into one dynamic (the same as listing all the transitions
    > # separately)
    > all <- dynamic(stasis, growth, reproduction)
    > 
    > # plot these
    > plot(stasis)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... plot.dynamic -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      • On CRAN (1)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_dynamic_class.R:143:3'): dynamic classes work ──────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─base::plot(stasis) at test_dynamic_class.R:143:2
       2. └─pop:::plot.dynamic(stasis)
       3.   └─igraph::graph.adjacency(linkmat, weighted = TRUE)
       4.     └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 1 | WARN 0 | SKIP 1 | PASS 212 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# poppr

<details>

* Version: 2.9.4
* GitHub: https://github.com/grunwaldlab/poppr
* Source code: https://github.com/cran/poppr
* Date/Publication: 2023-03-23 03:20:02 UTC
* Number of recursive dependencies: 98

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: bruvo.msn ... msn_constructor -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
       2.   └─poppr:::msn_constructor(...)
       3.     └─igraph::graph.adjacency(indist, weighted = TRUE, mode = "undirected")
       4.       └─igraph:::graph.adjacency.dense(...)
      ── Error ('test-msn.R:118:1'): (code run outside of `test_that()`) ─────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─poppr::bruvo.msn(gend, replen = c(1, 1), showplot = FALSE) at test-msn.R:118:0
       2.   └─poppr:::msn_constructor(...)
       3.     └─igraph::graph.adjacency(indist, weighted = TRUE, mode = "undirected")
       4.       └─igraph:::graph.adjacency.dense(...)
      
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

# POSetR

<details>

* Version: 1.1.1
* GitHub: NA
* Source code: https://github.com/cran/POSetR
* Date/Publication: 2023-01-17 10:40:02 UTC
* Number of recursive dependencies: 10

Run `revdepcheck::cloud_details(, "POSetR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘POSetR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: intersection
    > ### Title: Intersection of two posets
    > ### Aliases: intersection %it%
    > 
    > ### ** Examples
    > 
    > dom <- matrix(c(
    ...
    +   "a", "b",
    +   "c", "b",
    +   "b", "d"
    + ), ncol = 2, byrow = TRUE)
    > p <- poset(x = dom)
    > plot(p)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot -> plot.poset -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 26.0Mb
      sub-directories of 1Mb or more:
        libs  25.8Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘Rdpack’
      All declared Imports should be used.
    ```

# ProjectManagement

<details>

* Version: 1.4.7
* GitHub: NA
* Source code: https://github.com/cran/ProjectManagement
* Date/Publication: 2022-09-19 08:26:16 UTC
* Number of recursive dependencies: 83

Run `revdepcheck::cloud_details(, "ProjectManagement")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ProjectManagement-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dag.plot
    > ### Title: DAG plot
    > ### Aliases: dag.plot
    > 
    > ### ** Examples
    > 
    > 
    > prec1and2<-matrix(c(0,1,0,2,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,2,0),nrow=5,ncol=5,byrow=TRUE)
    > prec3and4<-matrix(0,nrow=5,ncol=5)
    > prec3and4[3,1]<-3
    > dag.plot(prec1and2,prec3and4)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: dag.plot ... graph_from_adjacency_matrix -> graph.adjacency.dense
    Execution halted
    ```

# provGraphR

<details>

* Version: 1.0.1
* GitHub: NA
* Source code: https://github.com/cran/provGraphR
* Date/Publication: 2022-08-17 15:30:02 UTC
* Number of recursive dependencies: 36

Run `revdepcheck::cloud_details(, "provGraphR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘provGraphR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get.lineage
    > ### Title: Calculate lineage of a node
    > ### Aliases: get.lineage
    > 
    > ### ** Examples
    > 
    > adj.graph <- create.graph(system.file("testdata", "basic.json", package = "provGraphR"))
    > get.lineage (adj.graph, "d24")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: get.lineage ... graph.adjacency.sparse -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       9.         └─igraph (local) `<fn>`(`<dbl[,46]>`, n = 56L, directed = TRUE)
      ── Error ('test_provGraphR.R:115:7'): order ────────────────────────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─provGraphR::get.lineage(adj.graph, "d4") at test_provGraphR.R:115:6
       2.   └─igraph::graph_from_adjacency_matrix(adj.graph)
       3.     └─igraph:::graph.adjacency.sparse(...)
       4.       └─igraph::make_graph(n = vc, edges, directed = (mode == "directed"))
       5.         ├─base::do.call(old_graph, args)
       6.         └─igraph (local) `<fn>`(`<dbl[,7]>`, n = 10L, directed = TRUE)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 47 ]
      Error: Test failures
      Execution halted
    ```

# ptools

<details>

* Version: 2.0.0
* GitHub: https://github.com/apwheele/ptools
* Source code: https://github.com/cran/ptools
* Date/Publication: 2023-02-07 19:02:30 UTC
* Number of recursive dependencies: 82

Run `revdepcheck::cloud_details(, "ptools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ptools-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: near_strings1
    > ### Title: Strings of Near Repeats
    > ### Aliases: near_strings1
    > 
    > ### ** Examples
    > 
    > # Simplified example showing two clusters
    ...
    > s <- c(0,0,0,4,4)
    > ccheck <- c(1,1,1,2,2)
    > dat <- data.frame(x=1:5,y=0,
    +                   ti=s,
    +                   id=1:5)
    > res1 <- near_strings1(dat,'id','x','y','ti',2,1)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: near_strings1 -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
          ▆
       1. └─ptools::near_strings1(dat, "id", "x", "y", "ti", 1, 1) at test-nearstring.R:34:2
       2.   └─igraph::graph_from_data_frame(...)
       3.     └─igraph::make_empty_graph(n = 0, directed = directed)
      ── Error ('test-nearstring.R:46:3'): Checking two components ───────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─ptools::near_strings1(dat, "id", "x", "y", "ti", 2, 1) at test-nearstring.R:46:2
       2.   └─igraph::graph_from_data_frame(...)
       3.     └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 40 ]
      Error: Test failures
      Execution halted
    ```

# qdap

<details>

* Version: 2.4.6
* GitHub: https://github.com/trinker/qdap
* Source code: https://github.com/cran/qdap
* Date/Publication: 2023-05-11 06:10:02 UTC
* Number of recursive dependencies: 98

Run `revdepcheck::cloud_details(, "qdap")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        |======================================================================| 100%
      [ FAIL 1 | WARN 1 | SKIP 0 | PASS 216 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-phrase_net.R:19:5'): phrase_net gives a `phrase_net` and `igraph` object ──
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─qdap::phrase_net(sents, r = 0.5) at test-phrase_net.R:19:4
       2.   └─igraph::graph.data.frame(X2, directed = FALSE)
       3.     └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 1 | WARN 1 | SKIP 0 | PASS 216 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘gplots’
    ```

# qgraph

<details>

* Version: 1.9.5
* GitHub: https://github.com/SachaEpskamp/qgraph
* Source code: https://github.com/cran/qgraph
* Date/Publication: 2023-05-16 10:10:02 UTC
* Number of recursive dependencies: 89

Run `revdepcheck::cloud_details(, "qgraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘qgraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: centrality
    > ### Title: Centrality statistics of graphs
    > ### Aliases: centrality
    > ### Keywords: graphs
    > 
    > ### ** Examples
    > 
    > set.seed(1)
    > adj <- matrix(sample(0:1,10^2,TRUE,prob=c(0.8,0.2)),nrow=10,ncol=10)
    > Q <- qgraph(adj)
    > 
    > centrality(Q)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: centrality -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

# R.temis

<details>

* Version: 0.1.3
* GitHub: https://github.com/nalimilan/R.TeMiS
* Source code: https://github.com/cran/R.temis
* Date/Publication: 2021-05-12 19:02:12 UTC
* Number of recursive dependencies: 135

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: terms_graph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘testthat’
      All declared Imports should be used.
    ```

# R6causal

<details>

* Version: 0.7.0
* GitHub: NA
* Source code: https://github.com/cran/R6causal
* Date/Publication: 2022-11-04 08:00:02 UTC
* Number of recursive dependencies: 98

Run `revdepcheck::cloud_details(, "R6causal")` for more info

</details>

## Newly broken

*   checking whether package ‘R6causal’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/R6causal/new/R6causal.Rcheck/00install.out’ for details.
    ```

## Newly fixed

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘using_R6causal.Rmd’ using rmarkdown
    A new version of TeX Live has been released. If you need to install or update any LaTeX packages, you have to upgrade TinyTeX with tinytex::reinstall_tinytex(repository = "illinois").
    
    tlmgr: Local TeX Live (2022) is older than remote repository (2023).
    Cross release updates are only supported with
      update-tlmgr-latest(.sh/.exe) --update
    See https://tug.org/texlive/upgrade.html for details.
    Warning in system2("tlmgr", args, ...) :
    ...
    
    Error: processing vignette 'using_R6causal.Rmd' failed with diagnostics:
    LaTeX failed to compile /tmp/workdir/R6causal/old/R6causal.Rcheck/vign_test/R6causal/vignettes/using_R6causal.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See using_R6causal.log for more info.
    --- failed re-building ‘using_R6causal.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘using_R6causal.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## Installation

### Devel

```
* installing *source* package ‘R6causal’ ...
** package ‘R6causal’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in .igraph.status("Make graph external pointer.\n") : 
  could not find function ".igraph.status"
Error: unable to load R code in package ‘R6causal’
Execution halted
ERROR: lazy loading failed for package ‘R6causal’
* removing ‘/tmp/workdir/R6causal/new/R6causal.Rcheck/R6causal’


```
### CRAN

```
* installing *source* package ‘R6causal’ ...
** package ‘R6causal’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (R6causal)


```
# RaceID

<details>

* Version: 0.3.0
* GitHub: NA
* Source code: https://github.com/cran/RaceID
* Date/Publication: 2023-03-13 12:10:02 UTC
* Number of recursive dependencies: 157

Run `revdepcheck::cloud_details(, "RaceID")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘RaceID-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: compfr
    > ### Title: Computation of a two dimensional Fruchterman-Rheingold
    > ###   representation
    > ### Aliases: compfr
    > 
    > ### ** Examples
    > 
    ...
    determine final clustering partition 2 
    determine final clustering partition 3 
    determine final clustering partition 4 
    determine final clustering partition 5 
    determine final clustering partition 6 
    > sc <- compfr(sc)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: compfr ... graph_from_adjacency_matrix -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘RaceID.Rmd’ using rmarkdown
    
    Quitting from lines 119-120 [unnamed-chunk-17] (RaceID.Rmd)
    Error: processing vignette 'RaceID.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘RaceID.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘RaceID.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 12.1Mb
      sub-directories of 1Mb or more:
        data   2.1Mb
        doc    6.6Mb
        libs   2.6Mb
    ```

# rags2ridges

<details>

* Version: 2.2.6
* GitHub: https://github.com/CFWP/rags2ridges
* Source code: https://github.com/cran/rags2ridges
* Date/Publication: 2022-05-01 14:40:02 UTC
* Number of recursive dependencies: 103

Run `revdepcheck::cloud_details(, "rags2ridges")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rags2ridges-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: Communities
    > ### Title: Search and visualize community-structures
    > ### Aliases: Communities
    > 
    > ### ** Examples
    > 
    > 
    ...
    - Retained elements:  11 
    - Corresponding to 3.67 % of possible edges 
     
    > 
    > ## Search and visualize communities
    > Commy <- Communities(PC0)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: Communities -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.6Mb
      sub-directories of 1Mb or more:
        libs   6.4Mb
    ```

# RavenR

<details>

* Version: 2.2.0
* GitHub: https://github.com/rchlumsk/RavenR
* Source code: https://github.com/cran/RavenR
* Date/Publication: 2022-10-28 21:02:50 UTC
* Number of recursive dependencies: 141

Run `revdepcheck::cloud_details(, "RavenR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘RavenR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: rvn_calc_runoff_coeff
    > ### Title: Generate runoff coefficients upstream of gauges
    > ### Aliases: rvn_calc_runoff_coeff
    > 
    > ### ** Examples
    > 
    >  myrvh <- system.file("extdata","Nith.rvh", package="RavenR")
    >  mycust <- system.file("extdata", "run1_PRECIP_Daily_Average_BySubbasin.csv", package="RavenR")
    >  myhyd <- system.file("extdata", "run1_Hydrographs.csv", package="RavenR")
    > 
    >  rcs <- rvn_calc_runoff_coeff(myrvh, mycust, myhyd, correct=TRUE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: rvn_calc_runoff_coeff ... rvn_rvh_read -> graph_from_data_frame -> make_empty_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Introduction_to_RavenR.Rmd’ using rmarkdown
    
    Quitting from lines 213-217 [RVI connection plot example] (Introduction_to_RavenR.Rmd)
    Error: processing vignette 'Introduction_to_RavenR.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘Introduction_to_RavenR.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Introduction_to_RavenR.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# rcrimeanalysis

<details>

* Version: 0.5.0
* GitHub: NA
* Source code: https://github.com/cran/rcrimeanalysis
* Date/Publication: 2023-05-18 21:50:02 UTC
* Number of recursive dependencies: 104

Run `revdepcheck::cloud_details(, "rcrimeanalysis")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rcrimeanalysis-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: near_repeat_analysis
    > ### Title: Near Repeat Analysis of Crime Incidents with Crime Linkage
    > ###   Output
    > ### Aliases: near_repeat_analysis
    > ### Keywords: spatial
    > 
    > ### ** Examples
    > 
    > data(crimes)
    > nr_data <- head(crimes, n = 1000) #truncate dataset for near repeat analysis
    > out <- near_repeat_analysis(data=nr_data,tz="America/Chicago",epsg="32616")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: near_repeat_analysis -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘rcrimeanalysis.Rmd’ using rmarkdown
    
    Quitting from lines 157-162 [unnamed-chunk-8] (rcrimeanalysis.Rmd)
    Error: processing vignette 'rcrimeanalysis.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘rcrimeanalysis.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘rcrimeanalysis.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# rD3plot

<details>

* Version: 1.0.68
* GitHub: NA
* Source code: https://github.com/cran/rD3plot
* Date/Publication: 2023-03-22 16:50:10 UTC
* Number of recursive dependencies: 49

Run `revdepcheck::cloud_details(, "rD3plot")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rD3plot-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: rd3_fromIgraph
    > ### Title: Produce interactive networks from 'igraph' objects.
    > ### Aliases: rd3_fromIgraph
    > 
    > ### ** Examples
    > 
    > g <- igraph::make_ring(10)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous>
    Execution halted
    ```

# RDS

<details>

* Version: 0.9-6
* GitHub: NA
* Source code: https://github.com/cran/RDS
* Date/Publication: 2023-02-10 18:20:02 UTC
* Number of recursive dependencies: 106

Run `revdepcheck::cloud_details(, "RDS")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘RDS-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: read.rdsat
    > ### Title: Import data from the 'RDSAT' format as an 'rds.data.frame'
    > ### Aliases: read.rdsat
    > 
    > ### ** Examples
    > 
    > fn <- paste0(path.package("RDS"),"/extdata/nyjazz.rdsat")
    > rd <- read.rdsat(fn)
    > plot(rd)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... <Anonymous> -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘tests.R’
    Running the tests in ‘tests/tests.R’ failed.
    Complete output:
      > 
      > 
      > library(testthat)
      > library(RDS)
      > 
      > test_check("RDS")
      Killed
    ```

# readsdr

<details>

* Version: 0.2.0
* GitHub: https://github.com/jandraor/readsdr
* Source code: https://github.com/cran/readsdr
* Date/Publication: 2021-01-08 16:00:02 UTC
* Number of recursive dependencies: 74

Run `revdepcheck::cloud_details(, "readsdr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > 
      > test_check("readsdr")
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 252 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-generate_igraph_inputs.R:28:3'): get_igraph_inputs() valid inputs for igraph ──
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─igraph::graph_from_data_frame(...) at test-generate_igraph_inputs.R:28:2
       2.   └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 252 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# ReDaMoR

<details>

* Version: 0.7.1
* GitHub: https://github.com/patzaw/ReDaMoR
* Source code: https://github.com/cran/ReDaMoR
* Date/Publication: 2022-10-19 13:47:56 UTC
* Number of recursive dependencies: 86

Run `revdepcheck::cloud_details(, "ReDaMoR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ReDaMoR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: df_to_model
    > ### Title: Create a RelDataModel object from column names of data frames
    > ### Aliases: df_to_model
    > 
    > ### ** Examples
    > 
    > ## Read data files ----
    ...
    +    list=names(hpo_tables), envir=as.environment(hpo_tables)
    + )
    > ## Plot the model ----
    > new_model %>%
    +    auto_layout(lengthMultiplier=250) %>%
    +    plot()
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: %>% ... %>% -> <Anonymous> -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘ReDaMoR.Rmd’ using rmarkdown
    
    Quitting from lines 383-390 [unnamed-chunk-12] (ReDaMoR.Rmd)
    Error: processing vignette 'ReDaMoR.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘ReDaMoR.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘ReDaMoR.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# refdb

<details>

* Version: 0.1.1
* GitHub: https://github.com/fkeck/refdb
* Source code: https://github.com/cran/refdb
* Date/Publication: 2022-09-22 17:00:05 UTC
* Number of recursive dependencies: 163

Run `revdepcheck::cloud_details(, "refdb")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘refdb-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: refdb_plot_tax_tree
    > ### Title: Reference database taxonomy tree
    > ### Aliases: refdb_plot_tax_tree
    > 
    > ### ** Examples
    > 
    > lib <- read.csv(system.file("extdata", "baetidae_bold.csv", package = "refdb"))
    ...
    Selected rank column for the color: species_name
    Warning: There was 1 warning in `dplyr::group_by()`.
    ℹ In argument: `dplyr::across()`.
    Caused by warning:
    ! Using `across()` without supplying `.cols` was deprecated in dplyr 1.1.0.
    ℹ Please supply `.cols` instead.
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: refdb_plot_tax_tree ... igraph_from_taxo -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      • On CRAN (1)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_plots.R:7:3'): Test plot functions ─────────────────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─refdb:::igraph_from_taxo(test) at test_plots.R:7:2
       2.   └─igraph::graph_from_data_frame(graph_def_edges, vertices = res_tidy)
       3.     └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 1 | WARN 16 | SKIP 1 | PASS 123 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘intro_refdb.Rmd’ using rmarkdown
    
    Quitting from lines 227-228 [unnamed-chunk-17] (intro_refdb.Rmd)
    Error: processing vignette 'intro_refdb.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘intro_refdb.Rmd’
    
    --- re-building ‘ncbi_bold.Rmd’ using rmarkdown
    --- finished re-building ‘ncbi_bold.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘intro_refdb.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# RepertoiR

<details>

* Version: 0.0.1
* GitHub: https://github.com/systemsbiomed/RepertoiR
* Source code: https://github.com/cran/RepertoiR
* Date/Publication: 2021-10-25 07:00:21 UTC
* Number of recursive dependencies: 45

Run `revdepcheck::cloud_details(, "RepertoiR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘RepertoiR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: network
    > ### Title: Sequences distance network
    > ### Aliases: network
    > 
    > ### ** Examples
    > 
    > 
    ...
    + }
    > 
    > rownames(data) <- aavec
    > colnames(data) <- LETTERS[1:ncol(data)]
    > 
    > network(data, by = 3, nrow = 100)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: network ... ensure_igraph -> graph.data.frame -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       9.     └─igraph::make_empty_graph(n = 0, directed = directed)
      ── Error ('test-sunflower.R:5:3'): check no error has occurred ─────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─testthat::expect_identical(sunflower(data), NULL) at test-sunflower.R:5:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. ├─RepertoiR::sunflower(data)
       5. └─RepertoiR:::sunflower.default(data)
       6.   └─igraph::make_empty_graph(length(mat))
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 1 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘stringi’
      All declared Imports should be used.
    ```

# repo

<details>

* Version: 2.1.5
* GitHub: NA
* Source code: https://github.com/cran/repo
* Date/Publication: 2020-02-08 16:20:02 UTC
* Number of recursive dependencies: 58

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

# ResIN

<details>

* Version: 0.1.0
* GitHub: https://github.com/pwarncke77/ResIN
* Source code: https://github.com/cran/ResIN
* Date/Publication: 2023-05-10 13:50:06 UTC
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
    > ## Load the 12-item simulated Likert-type ResIN toy dataset
    > data(lik_data)
    > library(ggplot2)
    > 
    > # Apply the ResIN function to toy Likert data:
    > output <- ResIN(lik_data, cor_method = "spearman", network_stats = TRUE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: ResIN -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘ResIN-VIGNETTE.Rmd’ using rmarkdown
    
    Quitting from lines 61-65 [run ResIN] (ResIN-VIGNETTE.Rmd)
    Error: processing vignette 'ResIN-VIGNETTE.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘ResIN-VIGNETTE.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘ResIN-VIGNETTE.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# RevEcoR

<details>

* Version: 0.99.3
* GitHub: NA
* Source code: https://github.com/cran/RevEcoR
* Date/Publication: 2016-04-03 17:14:01
* Number of recursive dependencies: 23

Run `revdepcheck::cloud_details(, "RevEcoR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘RevEcoR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: reconstructGsMN
    > ### Title: Reconstuction of the specific-organism genome-scale metabolic
    > ###   network
    > ### Aliases: reconstructGsMN
    > 
    > ### ** Examples
    > 
    ...
    > ## species detected in a human microbiome
    > annodir <- system.file("extdata","koanno.tab",package = "RevEcoR")
    > metabolic.data <- read.delim2(file=annodir,stringsAsFactors=FALSE)
    > ##load the reference metabolic data
    > data(RefDbcache)
    > g2 <- reconstructGsMN(metabolic.data, RefData = RefDbcache)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: reconstructGsMN -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

# rflexscan

<details>

* Version: 1.1.0
* GitHub: NA
* Source code: https://github.com/cran/rflexscan
* Date/Publication: 2023-03-01 08:52:30 UTC
* Number of recursive dependencies: 53

Run `revdepcheck::cloud_details(, "rflexscan")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rflexscan-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot.rflexscan
    > ### Title: Graph plotting of flexscan results
    > ### Aliases: plot.rflexscan
    > 
    > ### ** Examples
    > 
    > # load sample data (North Carolina SIDS data)
    ...
    +                  name = rownames(nc.sids),
    +                  clustersize = 10,
    +                  nb = ncCR85.nb)
    > 
    > # display all clusters
    > plot(fls)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... graph_from_adjacency_matrix -> graph.adjacency.dense
    Execution halted
    ```

# rgexf

<details>

* Version: 0.16.2
* GitHub: https://github.com/gvegayon/rgexf
* Source code: https://github.com/cran/rgexf
* Date/Publication: 2021-08-12 21:30:02 UTC
* Number of recursive dependencies: 53

Run `revdepcheck::cloud_details(, "rgexf")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rgexf-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: igraph.to.gexf
    > ### Title: Converting between 'gexf' and 'igraph' classes
    > ### Aliases: igraph.to.gexf gexf.to.igraph
    > ### Keywords: manip
    > 
    > ### ** Examples
    > 
    ...
    +   demo(gexfigraph)
    + }
    >  
    >   fn <- system.file("gexf-graphs/lesmiserables.gexf", package = "rgexf")
    >   gexf1 <- read.gexf(fn)
    >   igraph1 <- gexf.to.igraph(gexf1)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: gexf.to.igraph -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘tinytest.R’
    Running the tests in ‘tests/tinytest.R’ failed.
    Complete output:
      > 
      > if ( requireNamespace("tinytest", quietly=TRUE) ){
      +   tinytest::test_package("rgexf")
      + }
      
      test-bugs.r...................    0 tests    Error in .igraph.status("Make graph external pointer.\n") : 
        could not find function ".igraph.status"
      Calls: <Anonymous> ... run_test_dir -> lapply -> FUN -> eval -> eval -> <Anonymous>
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘rgexf.Rmd’ using rmarkdown
    
    Quitting from lines 52-58 [igraph-plot] (rgexf.Rmd)
    Error: processing vignette 'rgexf.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘rgexf.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘rgexf.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# rgraph6

<details>

* Version: 2.0-2
* GitHub: https://github.com/mbojan/rgraph6
* Source code: https://github.com/cran/rgraph6
* Date/Publication: 2022-08-25 12:10:02 UTC
* Number of recursive dependencies: 58

Run `revdepcheck::cloud_details(, "rgraph6")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rgraph6-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: adjacency_from_text
    > ### Title: Create adjacency matrices from 'graph6', 'sparse6', or
    > ###   'digraph6' symbols
    > ### Aliases: adjacency_from_text
    > 
    > ### ** Examples
    > 
    ...
    
    > 
    > # Sparse6 symbols
    > s6 <- c(":DgXI@G~", ":DgWCgCb")
    > adjacency_from_text(s6)
    Loading required namespace: igraph
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: adjacency_from_text ... igraph_from_sparse6 -> lapply -> FUN -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        4. │   │ ├─withr::with_output_sink(...)
        5. │   │ │ └─base::force(code)
        6. │   │ ├─base::withCallingHandlers(...)
        7. │   │ └─base::withVisible(code)
        8. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        9. └─rgraph6::read_file6(...)
       10.   └─rgraph6::adjacency_from_text(txt)
       11.     └─rgraph6::igraph_from_sparse6(object[fmt == "sparse6"])
       12.       └─base::lapply(ellist, my_graph_from_edgelist)
       13.         └─rgraph6 (local) FUN(X[[i]], ...)
       14.           └─igraph::make_empty_graph(attr(el, "gorder"), directed = FALSE)
      
      [ FAIL 10 | WARN 0 | SKIP 0 | PASS 199 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘rgraph6.Rmd’ using rmarkdown
    
    Quitting from lines 31-38 [unnamed-chunk-1] (rgraph6.Rmd)
    Error: processing vignette 'rgraph6.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
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
* Number of recursive dependencies: 36

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: rhcoclust_internet ... graph_from_edgelist -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

# rmangal

<details>

* Version: 2.1.3
* GitHub: https://github.com/ropensci/rmangal
* Source code: https://github.com/cran/rmangal
* Date/Publication: 2023-03-30 14:10:02 UTC
* Number of recursive dependencies: 140

Run `revdepcheck::cloud_details(, "rmangal")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 78 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-get_network_by_id.R:9:3'): get_network_by_id() works ───────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─igraph::as.igraph(mg100) at test-get_network_by_id.R:9:2
       2. └─rmangal:::as.igraph.mgNetwork(mg100)
       3.   └─igraph::graph_from_data_frame(...)
       4.     └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 78 ]
      Error: Test failures
      Execution halted
    ```

# rmcfs

<details>

* Version: 1.3.5
* GitHub: NA
* Source code: https://github.com/cran/rmcfs
* Date/Publication: 2021-09-18 13:30:02 UTC
* Number of recursive dependencies: 65

Run `revdepcheck::cloud_details(, "rmcfs")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─rmcfs::build.idgraph(result) at test-man.mcfs.R:57:2
       2.   └─igraph::graph.empty()
      ── Error ('test-man.plot.idgraph.R:19:3'): man build.idgraph ───────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─rmcfs::build.idgraph(result, size = 6, size_ID = 12, orphan_nodes = TRUE) at test-man.plot.idgraph.R:19:2
       2.   └─igraph::graph.empty()
      
      [ FAIL 3 | WARN 4 | SKIP 0 | PASS 35 ]
      Error: Test failures
      Execution halted
    ```

# rmonad

<details>

* Version: 0.7.0
* GitHub: https://github.com/arendsee/rmonad
* Source code: https://github.com/cran/rmonad
* Date/Publication: 2020-02-14 07:00:02 UTC
* Number of recursive dependencies: 81

Run `revdepcheck::cloud_details(, "rmonad")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rmonad-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: clear_cache
    > ### Title: Clear cached values and delete temporary files
    > ### Aliases: clear_cache
    > 
    > ### ** Examples
    > 
    > 256 %v>% sqrt %>>% sqrt %>>% sqrt  -> m
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: %>>% ... as_monad -> Rmonad -> .new_rmonad_graph -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       6.           └─igraph::make_empty_graph(directed = TRUE, n = 1)
      ── Error (???): view handles failure ───────────────────────────────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─rmonad (local) `<fn>`(as_monad("hi") %>>% sqrt %>% tag("a/f"), log)
       2.   └─rmonad (local) entry_lhs_transform(x, f, desc = lhs_str)
       3.     └─rmonad::as_monad(m, lossy = TRUE, ...)
       4.       └─rmonad:::Rmonad(node_id = paste(key, collapse = ""))
       5.         └─rmonad:::.new_rmonad_graph(m, node_id = node_id)
       6.           └─igraph::make_empty_graph(directed = TRUE, n = 1)
      
      [ FAIL 73 | WARN 0 | SKIP 1 | PASS 79 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘cheatsheet.Rmd’ using rmarkdown
    --- finished re-building ‘cheatsheet.Rmd’
    
    --- re-building ‘gff-processing.Rmd’ using rmarkdown
    
    Quitting from lines 563-566 [unnamed-chunk-8] (gff-processing.Rmd)
    Error: processing vignette 'gff-processing.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘gff-processing.Rmd’
    ...
    --- failed re-building ‘introduction.Rmd’
    
    --- re-building ‘nozzle.Rmd’ using rmarkdown
    --- finished re-building ‘nozzle.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘gff-processing.Rmd’ ‘introduction.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# roads

<details>

* Version: 1.1.0
* GitHub: https://github.com/LandSciTech/roads
* Source code: https://github.com/cran/roads
* Date/Publication: 2023-02-02 16:10:02 UTC
* Number of recursive dependencies: 113

Run `revdepcheck::cloud_details(, "roads")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘roads-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plotRoads
    > ### Title: Plot projected roads
    > ### Aliases: plotRoads
    > 
    > ### ** Examples
    > 
    > 
    > prRes <- projectRoads(CLUSexample$landings, CLUSexample$cost, CLUSexample$roads)
    0s detected in cost raster, these will be considered as existing roads
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: projectRoads ... <Anonymous> -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. └─roads::rasterToLineSegments(roadRast)
        7.   ├─roads::projectRoads(...)
        8.   └─roads::projectRoads(...)
        9.     └─roads:::getGraph(sim, neighbourhood)
       10.       └─igraph::graph.edgelist(edge_mat, dir = FALSE)
       11.         └─igraph::make_graph(t(el), directed = directed)
       12.           ├─base::do.call(old_graph, args)
       13.           └─igraph (local) `<fn>`(`<dbl[,39402]>`, directed = FALSE)
      
      [ FAIL 5 | WARN 0 | SKIP 0 | PASS 11 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘ReconstructRoadHistory.Rmd’ using rmarkdown
    
    Quitting from lines 43-55 [unnamed-chunk-2] (ReconstructRoadHistory.Rmd)
    Error: processing vignette 'ReconstructRoadHistory.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘ReconstructRoadHistory.Rmd’
    
    --- re-building ‘roads-vignette.Rmd’ using rmarkdown
    ...
    Quitting from lines 133-147 [unnamed-chunk-4] (roads-vignette.Rmd)
    Error: processing vignette 'roads-vignette.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘roads-vignette.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘ReconstructRoadHistory.Rmd’ ‘roads-vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# robber

<details>

* Version: 0.2.3
* GitHub: https://github.com/Chabert-Liddell/robber
* Source code: https://github.com/cran/robber
* Date/Publication: 2023-02-28 08:32:35 UTC
* Number of recursive dependencies: 144

Run `revdepcheck::cloud_details(, "robber")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘robber-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: simulate_lbm
    > ### Title: Simulate a bipartite interaction network using block model
    > ### Aliases: simulate_lbm
    > 
    > ### ** Examples
    > 
    > # For a random number of interactions and blocks sizes
    ...
    > con <- matrix(c(.5,.3,.3,.1), 2, 2)
    > pi  <- c(.25,.75)
    > rho <- c(1/3, 2/3)
    > nr <- 50
    > nc <- 30
    > simulate_lbm(con, pi, rho, nr, nc, method = "gnp")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: simulate_lbm -> <Anonymous> -> ensure_igraph -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       5.   ├─igraph::as_incidence_matrix(...)
       6.   │ └─igraph:::ensure_igraph(graph)
       7.   └─igraph::sample_bipartite(...)
      ── Error ('test-simulate_bm.R:29:1'): (code run outside of `test_that()`) ──────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─robber::simulate_lbm(con, pi, rho, nr, nc, method = "gnm") at test-simulate_bm.R:29:0
       2.   ├─igraph::as_incidence_matrix(...)
       3.   │ └─igraph:::ensure_igraph(graph)
       4.   └─igraph::sample_bipartite(...)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 41 ]
      Error: Test failures
      Execution halted
    ```

# robin

<details>

* Version: 1.1.1
* GitHub: https://github.com/ValeriaPolicastro/robin
* Source code: https://github.com/cran/robin
* Date/Publication: 2022-05-16 18:30:02 UTC
* Number of recursive dependencies: 156

Run `revdepcheck::cloud_details(, "robin")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘robin-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: robinCompareFast
    > ### Title: robinCompareFast
    > ### Aliases: robinCompareFast
    > 
    > ### ** Examples
    > 
    > my_file <- system.file("example/football.gml", package="robin")
    > graph <- prepGraph(file=my_file, file.format="gml")
    > robinCompareFast(graph=graph, method1="louvain", 
    + method2="fastGreedy", measure="vi")
    Detecting robin method independent type, wait it can take time it depends on the size of the network.
    Error in checkForRemoteErrors(val) : 
      12 nodes produced errors; first error: could not find function ".igraph.status"
    Calls: robinCompareFast ... <Anonymous> -> staticClusterApply -> checkForRemoteErrors
    Execution halted
    ```

# RobustIV

<details>

* Version: 0.2.5
* GitHub: https://github.com/zijguo/RobustIV
* Source code: https://github.com/cran/RobustIV
* Date/Publication: 2022-12-20 01:10:02 UTC
* Number of recursive dependencies: 26

Run `revdepcheck::cloud_details(, "RobustIV")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘RobustIV-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: TSHT
    > ### Title: Two-Stage Hard Thresholding
    > ### Aliases: TSHT
    > 
    > ### ** Examples
    > 
    > data("lineardata")
    > Y <- lineardata[,"Y"]
    > D <- lineardata[,"D"]
    > Z <- as.matrix(lineardata[,c("Z.1","Z.2","Z.3","Z.4","Z.5","Z.6","Z.7","Z.8")])
    > X <- as.matrix(lineardata[,c("age","sex")])
    > TSHT.model <- TSHT(Y=Y,D=D,Z=Z,X=X)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: TSHT ... ensure_igraph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

# robustrao

<details>

* Version: 1.0-5
* GitHub: NA
* Source code: https://github.com/cran/robustrao
* Date/Publication: 2020-01-24 21:50:08 UTC
* Number of recursive dependencies: 16

Run `revdepcheck::cloud_details(, "robustrao")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘robustrao-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: LowerIndexBound
    > ### Title: Lower bound of the uncertainty interval of the Rao-Stirling
    > ###   diversity index.
    > ### Aliases: LowerIndexBound
    > 
    > ### ** Examples
    > 
    ...
    > #Get number of uncategorized references in the publication
    > uncat <- pd1.uncat.refs[1]
    > 
    > #Get vector of permissible disciplines.
    > logic.disciplines <- counts > 0
    > permissible <- PruneDisciplines(logic.disciplines, 0.233, pd1.similarity)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: PruneDisciplines -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

# roprov

<details>

* Version: 0.1.2
* GitHub: NA
* Source code: https://github.com/cran/roprov
* Date/Publication: 2018-11-06 09:10:03 UTC
* Number of recursive dependencies: 13

Run `revdepcheck::cloud_details(, "roprov")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘roprov-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: fullprovgraph
    > ### Title: Create the full (multiple values per variable) provenance graph
    > ###   for a cache
    > ### Aliases: fullprovgraph fullprovgraph,ProvStoreDF-method
    > ###   fullprovgraph,ProvStoreDF fullprovgraph,data.frame-method
    > ###   fullprovgraph,data.frame
    > 
    ...
    +                  invarhashes = invarhashes,
    +                  invarclasses = invarclasses,
    +                  code = code,
    +                  agent = "coolguyorgirl")
    > 
    > plot(fullprovgraph(ps))
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... graph_from_edgelist -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

# RPANDA

<details>

* Version: 2.2
* GitHub: https://github.com/hmorlon/PANDA
* Source code: https://github.com/cran/RPANDA
* Date/Publication: 2022-10-24 15:28:00 UTC
* Number of recursive dependencies: 129

Run `revdepcheck::cloud_details(, "RPANDA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘RPANDA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: JSDtree
    > ### Title: Jensen-Shannon distance between phylogenies
    > ### Aliases: JSDtree
    > 
    > ### ** Examples
    > 
    > trees<-TESS::tess.sim.age(n=20,age=10,0.15,0.05,MRCA=TRUE)
    > JSDtree(trees)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: JSDtree -> lapply -> FUN -> graph.adjacency.dense
    Execution halted
    ```

# rquery

<details>

* Version: 1.4.9
* GitHub: https://github.com/WinVector/rquery
* Source code: https://github.com/cran/rquery
* Date/Publication: 2022-02-28 18:00:02 UTC
* Number of recursive dependencies: 46

Run `revdepcheck::cloud_details(, "rquery")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rquery-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: topo_sort_tables
    > ### Title: Topologically sort join plan so values are available before
    > ###   uses.
    > ### Aliases: topo_sort_tables
    > 
    > ### ** Examples
    > 
    ...
    +               inspect_join_plan(tDesc, sorted$columnJoinPlan)))
    +   print(plot(sorted$dependencyGraph))
    +   DBI::dbDisconnect(my_db)
    +   my_db <- NULL
    + }
    [1] "problems: key col(s) ( dept ) not contained in result cols of previous table(s) for table: revenue"
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: topo_sort_tables -> <Anonymous>
    Execution halted
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

*   checking examples ... ERROR
    ```
    Running examples in ‘rscc-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as_igraph
    > ### Title: as.igraph
    > ### Aliases: as_igraph
    > 
    > ### ** Examples
    > 
    > files <- list.files(path=system.file("examples", package="rscc"), pattern="*.R$", full.names = TRUE)
    ...
    /tmp/workdir/rscc/new/rscc.Rcheck/rscc/examples/kwantyle1.R 
    /tmp/workdir/rscc/new/rscc.Rcheck/rscc/examples/kwantyle1_variables.R 
    > docs  <- documents(prgs)
    > simm  <- similarities(docs)
    > # a similarity coefficients equal to zero does not create an edge!
    > g <- as_igraph(simm, diag=FALSE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: as_igraph -> do.call -> <Anonymous> -> graph.adjacency.dense
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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: scelestial ... graph_from_edgelist -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        libs   4.9Mb
    ```

# rsetse

<details>

* Version: 0.5.0
* GitHub: https://github.com/JonnoB/rSETSe
* Source code: https://github.com/cran/rsetse
* Date/Publication: 2021-06-11 10:00:02 UTC
* Number of recursive dependencies: 81

Run `revdepcheck::cloud_details(, "rsetse")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rsetse-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: calc_tension_strain
    > ### Title: Calculate line tension and strain from the topology and node
    > ###   embeddings
    > ### Aliases: calc_tension_strain
    > 
    > ### ** Examples
    > 
    ...
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    ```

# rSpectral

<details>

* Version: 1.0.0.10
* GitHub: https://github.com/cmclean5/rSpectral
* Source code: https://github.com/cran/rSpectral
* Date/Publication: 2023-01-18 12:00:02 UTC
* Number of recursive dependencies: 44

Run `revdepcheck::cloud_details(, "rSpectral")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rSpectral-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: spectral_igraph_communities
    > ### Title: Spectral clustering for 'igraph' objects
    > ### Aliases: spectral_igraph_communities
    > 
    > ### ** Examples
    > 
    > data(karate,package='igraphdata')
    > c<-spectral_igraph_communities(karate)
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: spectral_igraph_communities ... <Anonymous> -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Error ('test-igraph.R:24:3'): membership fix_neig=1 is correct ──────────────
      Error in `.igraph.status("Restore graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─rSpectral::spectral_igraph_communities(karate, fix_neig = 1) at test-igraph.R:24:2
       2.   └─rSpectral::spectral_igraph_membership(...)
       3.     ├─base::as.data.frame(igraph::get.edgelist(g, names = TRUE))
       4.     └─igraph::get.edgelist(g, names = TRUE)
       5.       └─igraph:::ensure_igraph(graph)
       6.         └─igraph::is_igraph(graph)
       7.           └─igraph:::warn_version(graph)
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 4 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.9Mb
      sub-directories of 1Mb or more:
        libs   5.2Mb
    ```

# rsppfp

<details>

* Version: 1.0.4
* GitHub: https://github.com/melvidoni/rsppfp
* Source code: https://github.com/cran/rsppfp
* Date/Publication: 2019-02-19 15:10:03 UTC
* Number of recursive dependencies: 84

Run `revdepcheck::cloud_details(, "rsppfp")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rsppfp-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_shortest_path
    > ### Title: igraph Shortest Path
    > ### Aliases: get_shortest_path
    > 
    > ### ** Examples
    > 
    > # Given a specific gStar graph:
    ...
    16   s|u s|u|v      4
    17     u   u|v      4
    18   u|v u|v|y      3
    > 
    > # Obtain the shortest path
    > get_shortest_path(gStar, "s", "v", "weight")                                                 
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: get_shortest_path -> graph_from_data_frame -> make_empty_graph
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# rvinecopulib

<details>

* Version: 0.6.3.1.1
* GitHub: https://github.com/vinecopulib/rvinecopulib
* Source code: https://github.com/cran/rvinecopulib
* Date/Publication: 2023-02-23 11:50:02 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::cloud_details(, "rvinecopulib")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rvinecopulib-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot.rvine_structure
    > ### Title: Plotting R-vine structures
    > ### Aliases: plot.rvine_structure plot.rvine_matrix
    > 
    > ### ** Examples
    > 
    > plot(cvine_structure(1:5))
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... lapply -> FUN -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        4. │   │ ├─withr::with_output_sink(...)
        5. │   │ │ └─base::force(code)
        6. │   │ ├─base::withCallingHandlers(...)
        7. │   │ └─base::withVisible(code)
        8. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        9. ├─base::plot(vc, edge_labels = "family", var_names = "legend")
       10. └─rvinecopulib:::plot.vinecop_dist(...)
       11.   └─base::lapply(tree, get_graph, vc = x, edge_labels = edge_labels)
       12.     └─rvinecopulib (local) FUN(X[[i]], ...)
       13.       └─igraph::graph_from_adjacency_matrix(I, mode = "undirected")
       14.         └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 290 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 76.5Mb
      sub-directories of 1Mb or more:
        include   5.0Mb
        libs     71.1Mb
    ```

# safedata

<details>

* Version: 1.1.3
* GitHub: https://github.com/ImperialCollegeLondon/safedata
* Source code: https://github.com/cran/safedata
* Date/Publication: 2023-05-05 15:00:02 UTC
* Number of recursive dependencies: 80

Run `revdepcheck::cloud_details(, "safedata")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘safedata-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_taxon_graph
    > ### Title: Get a graph of the taxa in a dataset
    > ### Aliases: get_taxon_graph
    > 
    > ### ** Examples
    > 
    >    set_example_safe_dir()
    Loading and caching index
    Validating directory
    >    beetle_graph <- get_taxon_graph(1400562)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: get_taxon_graph -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘overview.Rmd’ using rmarkdown
    --- finished re-building ‘overview.Rmd’
    
    --- re-building ‘using_safe_data.Rmd’ using rmarkdown
    
    Quitting from lines 513-516 [get_phylo] (using_safe_data.Rmd)
    Error: processing vignette 'using_safe_data.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘using_safe_data.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘using_safe_data.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# saotd

<details>

* Version: 0.3.0
* GitHub: https://github.com/evan-l-munson/saotd
* Source code: https://github.com/cran/saotd
* Date/Publication: 2021-10-13 09:50:02 UTC
* Number of recursive dependencies: 121

Run `revdepcheck::cloud_details(, "saotd")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Error ('test_word_corr_network.R:68:1'): (code run outside of `test_that()`) ──
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─saotd::word_corr_network(WordCorr = test, Correlation = 0.1) at test_word_corr_network.R:68:0
       2. │ └─... %>% ggraph::ggraph(layout = layout)
       3. ├─ggraph::ggraph(., layout = layout)
       4. │ ├─ggplot2::ggplot(data = create_layout(graph, layout, ...), environment = envir)
       5. │ └─ggraph::create_layout(graph, layout, ...)
       6. └─igraph::graph_from_data_frame(.)
       7.   └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 2 | WARN 1 | SKIP 0 | PASS 59 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘saotd.Rmd’ using rmarkdown
    
    Quitting from lines 171-181 [bigram_network] (saotd.Rmd)
    Error: processing vignette 'saotd.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘saotd.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘saotd.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# sBIC

<details>

* Version: 0.2.0
* GitHub: https://github.com/Lucaweihs/sBIC
* Source code: https://github.com/cran/sBIC
* Date/Publication: 2016-10-01 14:31:14
* Number of recursive dependencies: 52

Run `revdepcheck::cloud_details(, "sBIC")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. ├─testthat::expect_equal(...) at test_LatentForests.R:379:2
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─sBIC:::forestDepth(...)
        5. │ ├─base::unique(igraph::clusters(forest)$membership[1:numLeaves])
        6. │ └─igraph::clusters(forest)
        7. │   └─igraph:::ensure_igraph(graph)
        8. └─igraph::graph.edgelist(...)
        9.   └─igraph::make_graph(t(el), directed = directed)
       10.     ├─base::do.call(old_graph, args)
       11.     └─igraph (local) `<fn>`(`<dbl[,3]>`, directed = FALSE)
      
      [ FAIL 11 | WARN 0 | SKIP 0 | PASS 12 ]
      Error: Test failures
      Execution halted
    ```

# sbm

<details>

* Version: 0.4.5
* GitHub: https://github.com/GrossSBM/sbm
* Source code: https://github.com/cran/sbm
* Date/Publication: 2023-01-09 10:30:02 UTC
* Number of recursive dependencies: 108

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
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
    Last 13 lines of output:
        4. │   │ ├─withr::with_output_sink(...)
        5. │   │ │ └─base::force(code)
    ...
        9. ├─base::plot(myMBM, type = "meso")
       10. └─sbm:::plot.SBM(myMBM, type = "meso")
       11.   └─x$plot(type, ordered, plotOptions)
       12.     └─sbm:::plotMesoMultipartite(...)
       13.       └─igraph::graph.adjacency(...)
       14.         └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 1045 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Multipartite_EcologicalNetwork.Rmd’ using rmarkdown
    
    Quitting from lines 152-158 [plot meso] (Multipartite_EcologicalNetwork.Rmd)
    Error: processing vignette 'Multipartite_EcologicalNetwork.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘Multipartite_EcologicalNetwork.Rmd’
    
    --- re-building ‘MultiplexNetwork_principle.Rmd’ using rmarkdown
    --- finished re-building ‘MultiplexNetwork_principle.Rmd’
    ...
    Quitting from lines 114-115 [simpleSBMfit plotmeso] (SBM_fungus_tree_network.Rmd)
    Error: processing vignette 'SBM_fungus_tree_network.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘SBM_fungus_tree_network.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘Multipartite_EcologicalNetwork.Rmd’ ‘SBM_fungus_tree_network.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# SBN

<details>

* Version: 1.0.0
* GitHub: NA
* Source code: https://github.com/cran/SBN
* Date/Publication: 2022-01-17 19:42:42 UTC
* Number of recursive dependencies: 7

Run `revdepcheck::cloud_details(, "SBN")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SBN-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: sbn_change_dir
    > ### Title: Change the upstream/downstream direction of an SBN
    > ### Aliases: sbn_change_dir
    > 
    > ### ** Examples
    > 
    > g <- sbn_create(10, 0.7)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: sbn_create -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

# sccore

<details>

* Version: 1.0.3
* GitHub: https://github.com/kharchenkolab/sccore
* Source code: https://github.com/cran/sccore
* Date/Publication: 2023-03-13 00:00:02 UTC
* Number of recursive dependencies: 76

Run `revdepcheck::cloud_details(, "sccore")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sccore-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: graphToAdjList
    > ### Title: Convert igraph graph into an adjacency list
    > ### Aliases: graphToAdjList
    > 
    > ### ** Examples
    > 
    > library(dplyr)
    ...
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > edge.list.fact <- igraph::as_edgelist(conosGraph) %>% as_factor()
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: %>% ... <Anonymous> -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       6.       └─igraph:::warn_version(graph)
      ── Error ('test_helpers.R:43:2'): graphToAdjList() functionality ───────────────
      Error in `.igraph.status("Restore graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─igraph::as_edgelist(conosGraph) %>% as_factor() at test_helpers.R:43:8
       2. ├─sccore::as_factor(.)
       3. └─igraph::as_edgelist(conosGraph)
       4.   └─igraph:::ensure_igraph(graph)
       5.     └─igraph::is_igraph(graph)
       6.       └─igraph:::warn_version(graph)
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 2 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.9Mb
      sub-directories of 1Mb or more:
        libs   7.1Mb
    ```

# scDHA

<details>

* Version: 1.2.1
* GitHub: https://github.com/duct317/scDHA
* Source code: https://github.com/cran/scDHA
* Date/Publication: 2023-04-04 12:10:02 UTC
* Number of recursive dependencies: 62

Run `revdepcheck::cloud_details(, "scDHA")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      • On CRAN (2)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-scDHA.R:33:3'): scDHA.pt can run ───────────────────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─scDHA::scDHA.pt(result, start.point = 1, ncores = 2, seed = 1) at test-scDHA.R:33:2
       2.   └─igraph::graph_from_adjacency_matrix(adj, weighted = TRUE, mode = "undirected")
       3.     └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 1 | WARN 0 | SKIP 2 | PASS 3 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.3Mb
      sub-directories of 1Mb or more:
        data   3.2Mb
        libs   4.7Mb
    ```

# scDiffCom

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/scDiffCom
* Date/Publication: 2021-08-17 07:20:05 UTC
* Number of recursive dependencies: 245

Run `revdepcheck::cloud_details(, "scDiffCom")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       13.                 └─igraph::graph_from_data_frame(...)
       14.                   └─igraph::make_empty_graph(n = 0, directed = directed)
      ── Error ('test-everything.R:1023:1'): (code run outside of `test_that()`) ─────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─scDiffCom:::build_interactive_network(...) at test-everything.R:1023:0
       2.   └─scDiffCom:::interactive_from_igraph(...)
       3.     └─scDiffCom:::build_igraph(...)
       4.       └─igraph::graph_from_data_frame(...)
       5.         └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 80 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘future’ ‘utils’
      All declared Imports should be used.
    ```

# SCORPION

<details>

* Version: 1.0.1
* GitHub: NA
* Source code: https://github.com/cran/SCORPION
* Date/Publication: 2022-09-22 09:30:02 UTC
* Number of recursive dependencies: 12

Run `revdepcheck::cloud_details(, "SCORPION")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SCORPION-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: scorpion
    > ### Title: Constructs PANDA gene regulatory networks from single-cell gene
    > ###   expression data
    > ### Aliases: scorpion
    > 
    > ### ** Examples
    > 
    ...
    > scorpionOutput <- scorpion(tfMotifs = scorpionTest$tf,
    +                            gexMatrix = scorpionTest$gex,
    +                            ppiNet = scorpionTest$ppi,
    +                            alphaValue = 0.8)
    
    ── SCORPION ────────────────────────────────────────────────────────────────────
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: scorpion ... makeSuperCells -> buildKNN -> buildNN2 -> <Anonymous>
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘RhpcBLASctl’
      All declared Imports should be used.
    ```

# scRNAtools

<details>

* Version: 1.0
* GitHub: NA
* Source code: https://github.com/cran/scRNAtools
* Date/Publication: 2018-07-05 14:00:03 UTC
* Number of recursive dependencies: 131

Run `revdepcheck::cloud_details(, "scRNAtools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘scRNAtools-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: scRNAtools_inter_net
    > ### Title: Construction of interactive network in scRNA sequencing data
    > ### Aliases: scRNAtools_inter_net
    > 
    > ### ** Examples
    > 
    > data(corr_re)
    ...
    > p<-0.05
    > r<-0.9
    > size<-5 #nodes size
    > color<-"#00B2EE" ##Color of nodes.
    > pdf(file=file.path(tempdir(), "interact_net.pdf"))
    > scRNAtools_inter_net(corr_re,p,r,size,color)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: scRNAtools_inter_net -> graph.data.frame -> make_empty_graph
    Execution halted
    ```

# secrlinear

<details>

* Version: 1.2.1
* GitHub: https://github.com/MurrayEfford/secrlinear
* Source code: https://github.com/cran/secrlinear
* Date/Publication: 2023-05-19 04:10:02 UTC
* Number of recursive dependencies: 83

Run `revdepcheck::cloud_details(, "secrlinear")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘secrlinear-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: Arvicola
    > ### Title: Water Vole Capture Dataset
    > ### Aliases: arvicola
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    ...
    20.B 163.85 629.66
    40.A 164.88 649.19
    40.B 164.88 649.19
    > 
    > ## for speed, pre-compute distance matrix
    > userd <- networkdistance (traps(arvicola), glymemask, glymemask)
    Error in .igraph.status("Restore graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: networkdistance ... cbind -> V -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-secrlinear.R:14:1'): (code run outside of `test_that()`) ───────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─secrlinear::read.linearmask(data = xy, spacing = 20) at test-secrlinear.R:14:0
       2.   └─secrlinear:::make.linearmask(...)
       3.     └─secrlinear::asgraph(mask)
       4.       └─igraph::graph.adjacency(tempdist, mode = "lower")
       5.         └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘secrlinear-vignette.Rmd’ using rmarkdown
    
    Quitting from lines 71-73 [readglyme] (secrlinear-vignette.Rmd)
    Error: processing vignette 'secrlinear-vignette.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘secrlinear-vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘secrlinear-vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# SelectBoost

<details>

* Version: 2.2.2
* GitHub: https://github.com/fbertran/SelectBoost
* Source code: https://github.com/cran/SelectBoost
* Date/Publication: 2022-11-30 09:10:06 UTC
* Number of recursive dependencies: 114

Run `revdepcheck::cloud_details(, "SelectBoost")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SelectBoost-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: boost
    > ### Title: Boost step by step functions
    > ### Aliases: boost boost.normalize boost.compcorrs boost.correlation_sign
    > ###   boost.findgroups boost.Xpass boost.adjust boost.random boost.apply
    > ###   boost.select
    > 
    > ### ** Examples
    ...
    > xran_corr<- boost.compcorrs(xran_norm)
    > 
    > xran_corr_sign <- boost.correlation_sign(xran_corr)
    > 
    > xran_groups <- boost.findgroups(xran_corr, group=group_func_1, .3)
    > xran_groups_2 <- boost.findgroups(xran_corr, group=group_func_2, .3)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: boost.findgroups ... group2 -> group -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

# SEMID

<details>

* Version: 0.4.0
* GitHub: https://github.com/Lucaweihs/SEMID
* Source code: https://github.com/cran/SEMID
* Date/Publication: 2022-01-13 15:12:43 UTC
* Number of recursive dependencies: 38

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
    ...
    +    0, 0, 0, 0, 0,
    +    0, 0, 0, 0, 0,
    +    0, 0, 0, 0, 0), 5, 5)); O=O+t(O)
    > 
    > # Create a mixed graph object
    > graph = MixedGraph(L, O)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: MixedGraph ... LatentDigraphFixedOrder -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Error ('test_edgewiseID.R:43:9'): TO DELETE ─────────────────────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─SEMID::MixedGraph(L, O) at test_edgewiseID.R:43:8
       2.   ├─R.oo::extend(...)
       3.   ├─R.oo::extend.Object(...)
       4.   └─SEMID::LatentDigraph(...)
       5.     └─SEMID::LatentDigraphFixedOrder(L, length(observedNodes))
       6.       └─igraph::graph.adjacency(L, mode = "directed")
       7.         └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 11 | WARN 641 | SKIP 0 | PASS 478 ]
      Error: Test failures
      Execution halted
    ```

# sensitivity

<details>

* Version: 1.28.1
* GitHub: NA
* Source code: https://github.com/cran/sensitivity
* Date/Publication: 2023-03-19 19:10:02 UTC
* Number of recursive dependencies: 124

Run `revdepcheck::cloud_details(, "sensitivity")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sensitivity-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: shapleyBlockEstimation
    > ### Title: Computation of the Shapley effects in the Gaussian linear
    > ###   framework with an unknown block-diagonal covariance matrix
    > ### Aliases: shapleyBlockEstimation shapleyBlockEstimationS
    > ###   shapleyBlockEstimationX
    > 
    > ### ** Examples
    ...
    +       cex.main=3,ylab = "", xlab = "",axes=FALSE)
    > box()
    > 
    > 
    > Beta_ord=3*runif(p)+1
    > eta_ord=shapleyLinearGaussian(Beta=Beta_ord, Sigma=Sigma_ord)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: shapleyLinearGaussian ... ensure_igraph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.0Mb
      sub-directories of 1Mb or more:
        R      2.2Mb
        libs   6.2Mb
    ```

# SeqDetect

<details>

* Version: 1.0.7
* GitHub: NA
* Source code: https://github.com/cran/SeqDetect
* Date/Publication: 2020-03-02 14:30:05 UTC
* Number of recursive dependencies: 23

Run `revdepcheck::cloud_details(, "SeqDetect")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SeqDetect-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plotMachines,HybridSequenceClassifier-method
    > ### Title: Sequence Detector Method: plot machines (ETTs)
    > ### Aliases: plotMachines,HybridSequenceClassifier-method
    > 
    > ### ** Examples
    > 
    > ldf1 <- data.frame(product=c("P1","P1","P1","P1"),sequence_id=c(1,3,5,7),
    ...
    
    
    
    > hsc$cleanKeys()
    > hsc$mergeMachines()
    > hsc$plotMachines()
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> -> graph_from_data_frame -> make_empty_graph
    Execution halted
    ```

*   checking running R code from vignettes ... ERROR
    ```
    Errors in running code in vignettes:
    when running code in ‘SequentialDetector.Rnw’
      ...
            Transition(278bf27b866ebd1b659a) to:H_REL Symbols:[H_REL] Input state: Output state: Population:1
                Patterns:[Hospital release]
    =========
    -==***************************************==-
    
    > seq_detector$plotMachines()
    
      When sourcing ‘SequentialDetector.R’:
    Error: could not find function ".igraph.status"
    Execution halted
    
      ‘SequentialDetector.Rnw’ using ‘UTF-8’... failed
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 18.1Mb
      sub-directories of 1Mb or more:
        libs  16.8Mb
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘SequentialDetector.Rnw’ using Sweave
    Loading required package: Rcpp
    Loading required package: eventdataR
    
    Attaching package: ‘dplyr’
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    ...
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    
    --- failed re-building ‘SequentialDetector.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘SequentialDetector.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# seqHMM

<details>

* Version: 1.2.4
* GitHub: https://github.com/helske/seqHMM
* Source code: https://github.com/cran/seqHMM
* Date/Publication: 2023-01-09 11:20:02 UTC
* Number of recursive dependencies: 64

Run `revdepcheck::cloud_details(, "seqHMM")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘seqHMM-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: hmm_biofam
    > ### Title: Hidden Markov model for the biofam data
    > ### Aliases: hmm_biofam
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > 
    > # Plotting the model
    > plot(hmm_biofam)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... plot.hmm -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘seqHMM.Rnw’ using knitr
    
    Quitting from lines 495-498 [plottingHMM] (seqHMM.Rnw)
    Error: processing vignette 'seqHMM.Rnw' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘seqHMM.Rnw’
    
    --- re-building ‘seqHMM_algorithms.Rnw’ using knitr
    Error: processing vignette 'seqHMM_algorithms.Rnw' failed with diagnostics:
    ...
    Quitting from lines 112-128 [HMMplot] (seqHMM_visualization.Rnw)
    Error: processing vignette 'seqHMM_visualization.Rnw' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘seqHMM_visualization.Rnw’
    
    SUMMARY: processing the following files failed:
      ‘seqHMM.Rnw’ ‘seqHMM_algorithms.Rnw’ ‘seqHMM_visualization.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 34.4Mb
      sub-directories of 1Mb or more:
        doc    6.4Mb
        libs  27.2Mb
    ```

# SeqNet

<details>

* Version: 1.1.3
* GitHub: NA
* Source code: https://github.com/cran/SeqNet
* Date/Publication: 2021-07-09 08:20:08 UTC
* Number of recursive dependencies: 74

Run `revdepcheck::cloud_details(, "SeqNet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SeqNet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_random_module_to_network
    > ### Title: Adds a random module of a given size to the network
    > ### Aliases: add_random_module_to_network
    > 
    > ### ** Examples
    > 
    > # This function provides an alternative way to iteratively add random
    > # modules to the network. It uses a weighted sampling of nodes, where
    > # nodes that haven't been selected for a module have a higher probability 
    > # of being sampled for the new module.
    > nw <- create_empty_network(100)
    > plot(nw) # An empty network of 100 nodes.
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... plot_network -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > test_check("SeqNet")
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 36 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_network_structure.R:12:3'): networks have appropriate structure. ──
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─SeqNet::get_network_characteristics(network) at test_network_structure.R:12:2
       2.   └─igraph::graph_from_adjacency_matrix(adj, mode = "undirected")
       3.     └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 36 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.0Mb
      sub-directories of 1Mb or more:
        data   4.7Mb
        libs   1.8Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘Rdpack’
      All declared Imports should be used.
    ```

# SetRank

<details>

* Version: 1.1.0
* GitHub: NA
* Source code: https://github.com/cran/SetRank
* Date/Publication: 2016-05-11 12:06:23
* Number of recursive dependencies: 15

Run `revdepcheck::cloud_details(, "SetRank")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SetRank-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: setRankAnalysis
    > ### Title: Advanced gene set enrichment analysis.
    > ### Aliases: setRankAnalysis
    > 
    > ### ** Examples
    > 
    > options(mc.cores=1)
    ...
    1 gene set DBs, 9 initial gene sets, 9 sets remaining and 50 genes in collection
    7 intersections to test...Pre-calculating critical Fisher-test values...
    > genes = reference[sample(c(TRUE, FALSE), 50, TRUE)]
    > network = setRankAnalysis(genes, collection, TRUE)
    2023-06-11 21:50:07 - calculating primary set p-values
    2023-06-11 21:50:07 - 0 significant sets
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: setRankAnalysis ... buildSetNet -> add.vertices -> ensure_igraph -> graph.empty
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘vignette.ltx’ using tex
    Error: processing vignette 'vignette.ltx' failed with diagnostics:
    Running 'texi2dvi' on 'vignette.ltx' failed.
    LaTeX errors:
    ! LaTeX Error: File `beramono.sty' not found.
    
    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: sty)
    ...
    l.7 \usepackage
                   [T1]{fontenc}^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘vignette.ltx’
    
    SUMMARY: processing the following file failed:
      ‘vignette.ltx’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# sfcr

<details>

* Version: 0.2.1
* GitHub: https://github.com/joaomacalos/sfcr
* Source code: https://github.com/cran/sfcr
* Date/Publication: 2021-10-11 08:00:02 UTC
* Number of recursive dependencies: 140

Run `revdepcheck::cloud_details(, "sfcr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sfcr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: sfcr_baseline
    > ### Title: Simulate the baseline scenario of a stock-flow consistent model
    > ### Aliases: sfcr_baseline
    > 
    > ### ** Examples
    > 
    > eqs <- sfcr_set(
    ...
    > 
    > external <- sfcr_set(Gd ~ 20, W ~ 1, alpha1 ~ 0.6, alpha2 ~ 0.4, theta ~ 0.2)
    > 
    > # Periods is set to 10 to run faster. A usual model should run at
    > # least 50 periods to find a steady state
    > sfcr_baseline(equations = eqs, external = external, periods = 10)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: sfcr_baseline ... .find_blocks -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       4.       └─igraph::graph.adjacency(adjmatrix = t(adj), mode = "directed")
       5.         └─igraph:::graph.adjacency.dense(...)
      ── Error ('test-sfcr_scenario.R:25:1'): (code run outside of `test_that()`) ────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─sfcr::sfcr_baseline(...) at test-sfcr_scenario.R:25:0
       2.   └─sfcr:::.sfcr_find_order(equations)
       3.     └─sfcr:::.find_blocks(km)
       4.       └─igraph::graph.adjacency(adjmatrix = t(adj), mode = "directed")
       5.         └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 17 | WARN 0 | SKIP 0 | PASS 11 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘sfcr_multis.Rmd’ using rmarkdown
    
    Quitting from lines 50-51 [unnamed-chunk-2] (sfcr_multis.Rmd)
    Error: processing vignette 'sfcr_multis.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘sfcr_multis.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘sfcr_multis.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# sfdep

<details>

* Version: 0.2.3
* GitHub: https://github.com/josiahparry/sfdep
* Source code: https://github.com/cran/sfdep
* Date/Publication: 2023-01-11 06:30:02 UTC
* Number of recursive dependencies: 100

Run `revdepcheck::cloud_details(, "sfdep")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sfdep-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: st_as_graph
    > ### Title: Create an sfnetwork
    > ### Aliases: st_as_graph st_as_graph.sf st_as_graph.sfc
    > 
    > ### ** Examples
    > 
    > library(magrittr)
    > 
    > guerry_nb %>%
    +   st_as_graph(nb, wt)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: %>% ... graph_from_edgelist -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

# sfnetworks

<details>

* Version: 0.6.3
* GitHub: https://github.com/luukvdmeer/sfnetworks
* Source code: https://github.com/cran/sfnetworks
* Date/Publication: 2023-03-22 16:40:02 UTC
* Number of recursive dependencies: 106

Run `revdepcheck::cloud_details(, "sfnetworks")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sfnetworks-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as_sfnetwork
    > ### Title: Convert a foreign object to a sfnetwork
    > ### Aliases: as_sfnetwork as_sfnetwork.default as_sfnetwork.sf
    > ###   as_sfnetwork.linnet as_sfnetwork.psp as_sfnetwork.sfc
    > ###   as_sfnetwork.sfNetwork as_sfnetwork.sfnetwork as_sfnetwork.tbl_graph
    > 
    > ### ** Examples
    ...
    > # From an sf object.
    > library(sf, quietly = TRUE)
    Linking to GEOS 3.8.0, GDAL 3.0.4, PROJ 6.3.1; sf_use_s2() is TRUE
    > 
    > # With LINESTRING geometries.
    > as_sfnetwork(roxel)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: as_sfnetwork ... graph_from_edgelist -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. ├─sfnetworks::as_sfnetwork(rdm_rox) at test_bbox.R:5:2
        2. └─sfnetworks:::as_sfnetwork.sf(rdm_rox)
        3.   └─sfnetworks::sfnetwork(...)
        4.     └─tidygraph::tbl_graph(nodes, edges_df, directed, node_key)
        5.       ├─tidygraph::as_tbl_graph(...)
        6.       └─tidygraph:::as_tbl_graph.list(...)
        7.         └─tidygraph:::as_graph_node_edge(x, directed = directed, node_key = node_key)
        8.           └─igraph::graph_from_edgelist(as.matrix(edges[, 1:2]), directed = directed)
        9.             └─igraph::make_graph(t(el), directed = directed)
       10.               ├─base::do.call(old_graph, args)
       11.               └─igraph (local) `<fn>`(`<int[,50]>`, directed = TRUE)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 269 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘sfn01_structure.Rmd’ using rmarkdown
    --- finished re-building ‘sfn01_structure.Rmd’
    
    --- re-building ‘sfn02_preprocess_clean.Rmd’ using rmarkdown
    --- finished re-building ‘sfn02_preprocess_clean.Rmd’
    
    --- re-building ‘sfn03_join_filter.Rmd’ using rmarkdown
    --- finished re-building ‘sfn03_join_filter.Rmd’
    ...
    --- failed re-building ‘sfn04_routing.Rmd’
    
    --- re-building ‘sfn05_morphers.Rmd’ using rmarkdown
    --- finished re-building ‘sfn05_morphers.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘sfn04_routing.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# SFSI

<details>

* Version: 1.2.0
* GitHub: NA
* Source code: https://github.com/cran/SFSI
* Date/Publication: 2022-08-16 15:40:09 UTC
* Number of recursive dependencies: 62

Run `revdepcheck::cloud_details(, "SFSI")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SFSI-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: net.plot
    > ### Title: Network plot
    > ### Aliases: net.plot
    > 
    > ### ** Examples
    > 
    >   require(SFSI)
    ...
      |====================================================================  |  96%
      |                                                                            
      |======================================================================| 100%
    >   
    >   # Basic setting
    >   net.plot(fm)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: net.plot -> get_net -> <Anonymous>
    Execution halted
    ```

# sharp

<details>

* Version: 1.4.2
* GitHub: https://github.com/barbarabodinier/sharp
* Source code: https://github.com/cran/sharp
* Date/Publication: 2023-06-09 16:20:02 UTC
* Number of recursive dependencies: 150

Run `revdepcheck::cloud_details(, "sharp")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sharp-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: GraphComparison
    > ### Title: Edge-wise comparison of two graphs
    > ### Aliases: GraphComparison
    > 
    > ### ** Examples
    > 
    > # Data simulation
    ...
    > 
    > # Edge-wise comparison of the two graphs
    > mygraph <- GraphComparison(
    +   graph1 = simul1,
    +   graph2 = simul2
    + )
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: GraphComparison ... <Anonymous> -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘overview.Rnw’ using Sweave
    Error: processing vignette 'overview.Rnw' failed with diagnostics:
    Running 'texi2dvi' on 'overview.tex' failed.
    LaTeX errors:
    ! LaTeX Error: File `pdfpages.sty' not found.
    
    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: sty)
    ...
    l.4 ^^M
           
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘overview.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘overview.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# sharpshootR

<details>

* Version: 2.1
* GitHub: https://github.com/ncss-tech/sharpshootR
* Source code: https://github.com/cran/sharpshootR
* Date/Publication: 2023-03-22 16:50:05 UTC
* Number of recursive dependencies: 149

Run `revdepcheck::cloud_details(, "sharpshootR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sharpshootR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: component.adj.matrix
    > ### Title: Create an adjacency matrix from a data.frame of component data
    > ### Aliases: component.adj.matrix
    > ### Keywords: manip
    > 
    > ### ** Examples
    > 
    ...
    +   m <- component.adj.matrix(amador)
    + 
    +   # plot network diagram, with Amador soil highlighted
    +   plotSoilRelationGraph(m, s = 'amador')
    + }
    Loading required namespace: igraph
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plotSoilRelationGraph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

# shazam

<details>

* Version: 1.1.2
* GitHub: NA
* Source code: https://github.com/cran/shazam
* Date/Publication: 2022-10-01 07:30:02 UTC
* Number of recursive dependencies: 124

Run `revdepcheck::cloud_details(, "shazam")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘shazam-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: distToNearest
    > ### Title: Distance to nearest neighbor
    > ### Aliases: distToNearest
    > 
    > ### ** Examples
    > 
    > # Subset example data to one sample as a demo
    ...
    > # Use genotyped V assignments, Hamming distance, and normalize by junction length
    > # First partition based on V and J assignments, then by junction length
    > # Take into consideration ambiguous V and J annotations
    > dist <- distToNearest(db, sequenceColumn="junction", 
    +                       vCallColumn="v_call_genotyped", jCallColumn="j_call",
    +                       model="ham", first=FALSE, VJthenLen=TRUE, normalize="len")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: distToNearest ... graph.adjacency.sparse -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Baseline-Vignette.Rmd’ using rmarkdown
    A new version of TeX Live has been released. If you need to install or update any LaTeX packages, you have to upgrade TinyTeX with tinytex::reinstall_tinytex(repository = "illinois").
    
    tlmgr: Local TeX Live (2022) is older than remote repository (2023).
    Cross release updates are only supported with
      update-tlmgr-latest(.sh/.exe) --update
    See https://tug.org/texlive/upgrade.html for details.
    Warning in system2("tlmgr", args, ...) :
      running command ''tlmgr' search --file --global '/grffile.sty'' had status 1
    ...
    LaTeX failed to compile /tmp/workdir/shazam/new/shazam.Rcheck/vign_test/shazam/vignettes/Targeting-Vignette.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See Targeting-Vignette.log for more info.
    --- failed re-building ‘Targeting-Vignette.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘Baseline-Vignette.Rmd’ ‘DistToNearest-Vignette.Rmd’
      ‘Mutation-Vignette.Rmd’ ‘Shmulate-Vignette.Rmd’
      ‘Targeting-Vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# shock

<details>

* Version: 1.0
* GitHub: NA
* Source code: https://github.com/cran/shock
* Date/Publication: 2015-12-24 14:45:29
* Number of recursive dependencies: 14

Run `revdepcheck::cloud_details(, "shock")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘shock-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: computeLoglikeFromPartition
    > ### Title: Compute the log-likelihood of the model
    > ### Aliases: computeLoglikeFromPartition
    > 
    > ### ** Examples
    > 
    > ## load data to test
    >  data(dataTest)
    >  
    > ## threshold of absS matrix
    > myLABELS <- thresholdAbsSPath(dataTest)$partitionList
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: thresholdAbsSPath -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

# sidier

<details>

* Version: 4.1.0
* GitHub: NA
* Source code: https://github.com/cran/sidier
* Date/Publication: 2021-06-25 11:50:02 UTC
* Number of recursive dependencies: 58

Run `revdepcheck::cloud_details(, "sidier")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sidier-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: zero.thr
    > ### Title: Zero distance networks
    > ### Aliases: zero.thr
    > 
    > ### ** Examples
    > 
    > 
    ...
    Pop9      0.640 0.360 0.800 0.64 0.840 0.56 0.000  0.62     0.465
    Pop10     0.010 0.330 0.940 0.88 0.760 0.81 0.620  0.00     0.920
    Pop4-Pop5 0.555 0.875 0.715 0.54 0.295 0.27 0.465  0.92     0.000
    > # It is now possible to estimate a percolation threshold
    > perc.thr(dis=Dis1_Merged,ptPDF=FALSE, estimPDF=FALSE, estimOutfile=FALSE) 
    [1] "Threshold value:0  Range to test: from 0 to 1"
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: perc.thr -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

# sigmajs

<details>

* Version: 0.1.5
* GitHub: https://github.com/JohnCoene/sigmajs
* Source code: https://github.com/cran/sigmajs
* Date/Publication: 2020-06-18 18:10:02 UTC
* Number of recursive dependencies: 76

Run `revdepcheck::cloud_details(, "sigmajs")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sigmajs-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: sg_cluster
    > ### Title: Cluster
    > ### Aliases: sg_cluster sg_get_cluster
    > 
    > ### ** Examples
    > 
    > nodes <- sg_make_nodes() 
    ...
    > 
    > sigmajs() %>% 
    +   sg_nodes(nodes, id, size) %>% 
    +   sg_edges(edges, id, source, target) %>% 
    +   sg_layout() %>% 
    +   sg_cluster() 
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: %>% ... sg_get_layout -> .build_igraph -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       4.     └─sigmajs:::.build_igraph(edges, directed = directed, nodes, save = save_igraph)
       5.       └─igraph::graph_from_data_frame(edges, directed, nodes)
       6.         └─igraph::make_empty_graph(n = 0, directed = directed)
      ── Error ('test-formats.R:21:3'): igraph ───────────────────────────────────────
      Error in `.igraph.status("Restore graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─igraph::layout_with_fr(lesmis_igraph) at test-formats.R:21:2
       2.   └─igraph:::ensure_igraph(graph)
       3.     └─igraph::is_igraph(graph)
       4.       └─igraph:::warn_version(graph)
      
      [ FAIL 3 | WARN 8 | SKIP 0 | PASS 57 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 28 marked UTF-8 strings
    ```

# signnet

<details>

* Version: 1.0.1
* GitHub: https://github.com/schochastics/signnet
* Source code: https://github.com/cran/signnet
* Date/Publication: 2023-01-27 13:40:02 UTC
* Number of recursive dependencies: 104

Run `revdepcheck::cloud_details(, "signnet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘signnet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as_complex_edges
    > ### Title: Convert Signed Network to Complex
    > ### Aliases: as_complex_edges
    > 
    > ### ** Examples
    > 
    > g <- sample_islands_signed(2,10,1,10)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: sample_islands_signed ... <Anonymous> -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
          ▆
       1. └─igraph::graph.full(5, directed = T) at test-signed_triangles.R:106:2
      ── Error ('test-utils.R:9:3'): from_edgelist works ─────────────────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─signnet::graph_from_edgelist_signed(el, signs) at test-utils.R:9:2
       2.   └─igraph::graph_from_edgelist(el, directed = directed)
       3.     └─igraph::make_graph(unname(ids[t(el)]), directed = directed)
       4.       ├─base::do.call(old_graph, args)
       5.       └─igraph (local) `<fn>`(`<int>`, directed = FALSE)
      
      [ FAIL 65 | WARN 0 | SKIP 0 | PASS 23 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.7Mb
      sub-directories of 1Mb or more:
        libs   6.1Mb
    ```

# simcausal

<details>

* Version: 0.5.6
* GitHub: https://github.com/osofr/simcausal
* Source code: https://github.com/cran/simcausal
* Date/Publication: 2022-10-28 11:52:27 UTC
* Number of recursive dependencies: 84

Run `revdepcheck::cloud_details(, "simcausal")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘simcausal-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: network
    > ### Title: Define a Network Generator
    > ### Aliases: network
    > 
    > ### ** Examples
    > 
    > #--------------------------------------------------------------------------------------------------
    ...
    node W3, order:4
    node A, order:5
    node Y, order:6
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in sampleNodeDistr(newNodeParams = newNodeParams, distr = distr,  : 
      failed while sampling node 'ER.net', from distribution 'gen.ER'
    Error in set.DAG(D, n.test = 100) : 
    ...attempt to simulate data from DAG failed...
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      ERROR in test.set.DAG_DAG2b_newactions: Error in .igraph.status("Make graph external pointer.\n") : 
        could not find function ".igraph.status"
      ERROR in test.networkgen1: Error in set.DAG(D) : 
      ...attempt to simulate data from DAG failed...
      ERROR in test.networkgen_time: Error in set.DAG(D) : 
      ...attempt to simulate data from DAG failed...
      ERROR in test.tKmaxnet: Error in set.DAG(D, n.test = 200) : 
      ...attempt to simulate data from DAG failed...
      ERROR in test.MV: Error in .igraph.status("Make graph external pointer.\n") : 
        could not find function ".igraph.status"
      Error: 
      
      unit testing failed (#test failures: 0, #R errors: 7)
      
      Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘simcausal_vignette.Rnw’ using knitr
    
    Quitting from lines 963-966 [DAG1t] (simcausal_vignette.Rnw)
    Error: processing vignette 'simcausal_vignette.Rnw' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘simcausal_vignette.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘simcausal_vignette.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# simer

<details>

* Version: 0.9.0.2
* GitHub: https://github.com/xiaolei-lab/SIMER
* Source code: https://github.com/cran/simer
* Date/Publication: 2022-08-08 13:30:02 UTC
* Number of recursive dependencies: 21

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: GxG.network -> ba.game
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.5Mb
      sub-directories of 1Mb or more:
        libs   8.6Mb
    ```

# simPATHy

<details>

* Version: 0.6
* GitHub: NA
* Source code: https://github.com/cran/simPATHy
* Date/Publication: 2021-11-23 09:50:02 UTC
* Number of recursive dependencies: 150

Run `revdepcheck::cloud_details(, "simPATHy")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘simPATHy-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plotCorGraph
    > ### Title: Plot correlation or partial correlation matrix
    > ### Aliases: plotCorGraph
    > 
    > ### ** Examples
    > 
    > if( require(gRbase) & require(graph)){
    ...
        as.data.frame, basename, cbind, colnames, dirname, do.call,
        duplicated, eval, evalq, get, grep, grepl, intersect, is.unsorted,
        lapply, mapply, match, mget, order, paste, pmax, pmax.int, pmin,
        pmin.int, rank, rbind, rownames, sapply, setdiff, sort, table,
        tapply, union, unique, unsplit, which.max, which.min
    
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: fitSgraph ... asMethod -> g_gn2ig_ -> <Anonymous> -> graph_from_adj_list
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘simPATHy.Rmd’ using rmarkdown
    
    Quitting from lines 54-56 [unnamed-chunk-6] (simPATHy.Rmd)
    Error: processing vignette 'simPATHy.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘simPATHy.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘simPATHy.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# simplifyNet

<details>

* Version: 0.0.1
* GitHub: NA
* Source code: https://github.com/cran/simplifyNet
* Date/Publication: 2022-11-15 16:30:02 UTC
* Number of recursive dependencies: 23

Run `revdepcheck::cloud_details(, "simplifyNet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘simplifyNet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: EffRSparse
    > ### Title: Sparsification through edge sampling via effective resistances
    > ### Aliases: EffRSparse
    > 
    > ### ** Examples
    > 
    > #Generate random ER graph with uniformly random edge weights
    > g = igraph::erdos.renyi.game(100, 0.1)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous>
    Execution halted
    ```

# SIRE

<details>

* Version: 1.1.0
* GitHub: NA
* Source code: https://github.com/cran/SIRE
* Date/Publication: 2019-04-11 16:32:41 UTC
* Number of recursive dependencies: 79

Run `revdepcheck::cloud_details(, "SIRE")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SIRE-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: causal_decompose
    > ### Title: Estimation and decomposition of simultaneous equation model
    > ### Aliases: causal_decompose
    > 
    > ### ** Examples
    > 
    > data("macroIT")
    ...
    > 
    > causal_decompose(data = macroIT,
    +                eq.system = eq.system,
    +                resid.est = "noDfCor",
    +                instruments = instruments,
    +                sigma.in = NULL)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: causal_decompose -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dplyr’ ‘magrittr’ ‘psych’ ‘stringr’
      All declared Imports should be used.
    ```

# sirt

<details>

* Version: 3.12-66
* GitHub: https://github.com/alexanderrobitzsch/sirt
* Source code: https://github.com/cran/sirt
* Date/Publication: 2022-05-17 09:10:05 UTC
* Number of recursive dependencies: 110

Run `revdepcheck::cloud_details(, "sirt")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sirt-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: sia.sirt
    > ### Title: Statistical Implicative Analysis (SIA)
    > ### Aliases: sia.sirt
    > 
    > ### ** Examples
    > 
    > #############################################################################
    ...
    > #############################################################################
    > 
    > data(data.read)
    > dat <- data.read
    > 
    > res <- sirt::sia.sirt(dat, significance=.85 )
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous> ... <Anonymous> -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 22.0Mb
      sub-directories of 1Mb or more:
        R      2.1Mb
        libs  17.8Mb
    ```

# SITH

<details>

* Version: 1.1.0
* GitHub: https://github.com/phillipnicol/SITH
* Source code: https://github.com/cran/SITH
* Date/Publication: 2021-01-05 15:10:02 UTC
* Number of recursive dependencies: 58

Run `revdepcheck::cloud_details(, "SITH")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘SITH.Rmd’ using rmarkdown
    Warning in snapshot3d(paste0(name, ".png")) :
      webshot = TRUE requires the webshot2 package and Chrome browser; using rgl.snapshot() instead
    Warning in rgl.snapshot(filename, fmt, top) :
      this build of rgl does not support snapshots
    Warning in snapshot3d(paste0(name, ".png")) :
      webshot = TRUE requires the webshot2 package and Chrome browser; using rgl.snapshot() instead
    Warning in rgl.snapshot(filename, fmt, top) :
    ...
    Quitting from lines 296-304 [unnamed-chunk-17] (SITH.Rmd)
    Error: processing vignette 'SITH.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘SITH.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘SITH.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# skynet

<details>

* Version: 1.4.3
* GitHub: https://github.com/ropensci/skynet
* Source code: https://github.com/cran/skynet
* Date/Publication: 2022-06-17 13:00:02 UTC
* Number of recursive dependencies: 105

Run `revdepcheck::cloud_details(, "skynet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘skynet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: summary.skynet
    > ### Title: Displays a summary of a skynet object
    > ### Aliases: summary.skynet
    > 
    > ### ** Examples
    > 
    > net <- make_net_dir(OD_Sample)
    ...
    
    # Auto named with `tibble::lst()`: tibble::lst(mean, median)
    
    # Using lambdas list(~ mean(., trim = .2), ~ median(., na.rm = TRUE))
    ℹ The deprecated feature was likely used in the skynet package.
      Please report the issue at <https://github.com/ropensci/skynet/issues>.
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: make_net_dir -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       1. └─skynet::make_net_dir(OD_Sample) at test_smallerfunctions.R:21:2
       2.   └─igraph::graph_from_data_frame(netDir_all, directed = TRUE, vertices = nodes)
       3.     └─igraph::make_empty_graph(n = 0, directed = directed)
      ── Error ('test_smallerfunctions.R:33:3'): Plot Map ────────────────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─skynet::net_map(make_net_dir(OD_Sample)) at test_smallerfunctions.R:33:2
       2. └─skynet::make_net_dir(OD_Sample)
       3.   └─igraph::graph_from_data_frame(netDir_all, directed = TRUE, vertices = nodes)
       4.     └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 14 | WARN 14 | SKIP 4 | PASS 20 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘skynet.Rmd’ using rmarkdown
    
    Quitting from lines 97-101 [unnamed-chunk-4] (skynet.Rmd)
    Error: processing vignette 'skynet.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘skynet.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘skynet.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘maps’
      All declared Imports should be used.
    ```

# SmCCNet

<details>

* Version: 0.99.0
* GitHub: https://github.com/KechrisLab/SmCCNet
* Source code: https://github.com/cran/SmCCNet
* Date/Publication: 2019-03-04 16:50:03 UTC
* Number of recursive dependencies: 9

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plotMultiOmicsNetwork -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

# smotefamily

<details>

* Version: 1.3.1
* GitHub: NA
* Source code: https://github.com/cran/smotefamily
* Date/Publication: 2019-05-30 07:30:02 UTC
* Number of recursive dependencies: 10

Run `revdepcheck::cloud_details(, "smotefamily")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘smotefamily-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: DBSMOTE
    > ### Title: Density-based SMOTE
    > ### Aliases: DBSMOTE
    > ### Keywords: manip methods
    > 
    > ### ** Examples
    > 
    > data_example = sample_generator(5000,ratio = 0.90)
    > genData = DBSMOTE(data_example[,-3],data_example[,3])
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: DBSMOTE -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

# snowboot

<details>

* Version: 1.0.2
* GitHub: NA
* Source code: https://github.com/cran/snowboot
* Date/Publication: 2020-04-25 18:30:03 UTC
* Number of recursive dependencies: 10

Run `revdepcheck::cloud_details(, "snowboot")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘snowboot-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: igraph_to_network
    > ### Title: Create a "Network" Object from an igraph Object
    > ### Aliases: igraph_to_network
    > 
    > ### ** Examples
    > 
    > hex_ring <- igraph::make_ring(6, directed = FALSE, mutual = FALSE, circular = TRUE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: <Anonymous>
    Execution halted
    ```

# SNscan

<details>

* Version: 1.0
* GitHub: NA
* Source code: https://github.com/cran/SNscan
* Date/Publication: 2016-01-19 13:09:28
* Number of recursive dependencies: 11

Run `revdepcheck::cloud_details(, "SNscan")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SNscan-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: group.graph
    > ### Title: Generate igraph Objects with Different Connection
    > ###   Characteristics.
    > ### Aliases: group.graph
    > ### Keywords: graph sampling
    > 
    > ### ** Examples
    ...
    > 
    > group.graph(V=10, cv =1:3 , p1=1/10, p2 = 1/2)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: group.graph -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    Error in .igraph.status("Free graph external pointer.\n") : 
      could not find function ".igraph.status"
    ```

# SOAs

<details>

* Version: 1.3
* GitHub: https://github.com/bertcarnell/SOAs
* Source code: https://github.com/cran/SOAs
* Date/Publication: 2022-10-03 11:30:02 UTC
* Number of recursive dependencies: 58

Run `revdepcheck::cloud_details(, "SOAs")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       8.             └─igraph (local) `<fn>`(`<int[,20]>`, directed = TRUE)
      ── Error ('test-utilitiesCreate.R:3:1'): utilitiesCreate ───────────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─SOAs:::createAB(3) at test-utilitiesCreate.R:3:0
       2.   └─SOAs:::BcolsFromBcolllist(Bcollist)
       3.     └─igraph::graph_from_edgelist(el)
       4.       └─igraph::make_graph(t(el), directed = directed)
       5.         ├─base::do.call(old_graph, args)
       6.         └─igraph (local) `<fn>`(`<int[,18]>`, directed = TRUE)
      
      [ FAIL 3 | WARN 0 | SKIP 14 | PASS 1036 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘iterators’ ‘itertools’
      All declared Imports should be used.
    ```

# SoilR

<details>

* Version: 1.2.105
* GitHub: NA
* Source code: https://github.com/cran/SoilR
* Date/Publication: 2022-01-23 16:12:42 UTC
* Number of recursive dependencies: 49

Run `revdepcheck::cloud_details(, "SoilR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SoilR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: WangThreePoolNonAutonomous_sym
    > ### Title: A non-autonomous version of the original Wang 3 pool model
    > ### Aliases: WangThreePoolNonAutonomous_sym
    > 
    > ### ** Examples
    > 
    > # This is a working example which demostrates some of the new functionality.
    > require('SoilR',quietly =TRUE)
    > smod <- WangThreePoolNonAutonomous_sym() 
    > # (look at the source code of WangThreePoolNonAutonomous_sym )
    > plotPoolGraph(smod)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plotPoolGraph ... plotPoolGraphFromTupleLists -> graph_from_data_frame -> make_empty_graph
    Execution halted
    ```

# solitude

<details>

* Version: 1.1.3
* GitHub: https://github.com/talegari/solitude
* Source code: https://github.com/cran/solitude
* Date/Publication: 2021-07-29 20:00:02 UTC
* Number of recursive dependencies: 131

Run `revdepcheck::cloud_details(, "solitude")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘solitude-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: terminalNodesDepth
    > ### Title: Depth of each terminal node of all trees in a ranger model
    > ### Aliases: terminalNodesDepth
    > 
    > ### ** Examples
    > 
    > rf = ranger::ranger(Species ~ ., data = iris, num.trees = 100)
    > terminalNodesDepth(rf)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: terminalNodesDepth ... resolve.list -> signalConditionsASAP -> signalConditions
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘R6’ ‘lgr’
      All declared Imports should be used.
    ```

# SourceSet

<details>

* Version: 0.1.5
* GitHub: NA
* Source code: https://github.com/cran/SourceSet
* Date/Publication: 2022-11-21 11:30:02 UTC
* Number of recursive dependencies: 106

Run `revdepcheck::cloud_details(, "SourceSet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SourceSet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: infoSource
    > ### Title: Get summary statistics on graphs and variables
    > ### Aliases: infoSource
    > 
    > ### ** Examples
    > 
    > ## Load the SourceSetObj obtained from the source set analysis of ALL dataset
    ...
        as.data.frame, basename, cbind, colnames, dirname, do.call,
        duplicated, eval, evalq, get, grep, grepl, intersect, is.unsorted,
        lapply, mapply, match, mget, order, paste, pmax, pmax.int, pmin,
        pmin.int, rank, rbind, rownames, sapply, setdiff, sort, table,
        tapply, union, unique, unsplit, which.max, which.min
    
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: infoSource ... ensure_igraph -> <Anonymous> -> graph_from_adj_list
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘SourceSet.Rmd’ using rmarkdown
    
    Quitting from lines 151-158 [unnamed-chunk-5] (SourceSet.Rmd)
    Error: processing vignette 'SourceSet.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘SourceSet.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘SourceSet.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘r2cytoscape’
    ```

# spacejamr

<details>

* Version: 0.2.1
* GitHub: https://github.com/dscolby/spacejamr
* Source code: https://github.com/cran/spacejamr
* Date/Publication: 2022-04-01 20:10:02 UTC
* Number of recursive dependencies: 138

Run `revdepcheck::cloud_details(, "spacejamr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘spacejamr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: NetSim
    > ### Title: Simulate a network from a point process or sequence
    > ### Aliases: NetSim
    > 
    > ### ** Examples
    > 
    > # Load spacejamr object
    ...
    +                     power = -2.4)
    Warning: There was 1 warning in `dplyr::mutate()`.
    ℹ In argument: `dplyr::across(...)`.
    Caused by warning:
    ! Using `across()` without supplying `.cols` was deprecated in dplyr 1.1.0.
    ℹ Please supply `.cols` instead.
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: NetSim ... ensure_igraph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─spacejamr::NetSim(ri_points) at test-generics.R:6:0
       2. │ └─spacejamr:::new_NetSim(...)
       3. │   └─spacejamr:::validate_NetSim(...)
       4. │     ├─... %>% igraph::simplify()
       5. │     └─igraph::graph_from_adjacency_matrix(distances, mode = "undirected")
       6. │       └─igraph:::graph.adjacency.dense(...)
       7. └─igraph::simplify(.)
       8.   └─igraph:::ensure_igraph(graph)
      
      [ FAIL 3 | WARN 1 | SKIP 0 | PASS 10 ]
      Error: Test failures
      Execution halted
    ```

# sparsebnUtils

<details>

* Version: 0.0.8
* GitHub: https://github.com/itsrainingdata/sparsebnUtils
* Source code: https://github.com/cran/sparsebnUtils
* Date/Publication: 2021-01-27 06:30:02 UTC
* Number of recursive dependencies: 69

Run `revdepcheck::cloud_details(, "sparsebnUtils")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        2. │ └─testthat::quasi_label(enquo(expected), expected.label, arg = "expected")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─sparsebnUtils::to_edgeList(to_graphNEL(to_network(to_igraph(sbf.empty))))
        5. ├─sparsebnUtils::to_graphNEL(to_network(to_igraph(sbf.empty)))
        6. ├─sparsebnUtils::to_network(to_igraph(sbf.empty))
        7. ├─sparsebnUtils::to_igraph(sbf.empty)
        8. └─sparsebnUtils:::to_igraph.sparsebnFit(sbf.empty)
        9.   ├─sparsebnUtils::to_igraph(x$edges)
       10.   └─sparsebnUtils:::to_igraph.edgeList(x$edges)
       11.     └─igraph::graph.adjacency(as.matrix(x))
       12.       └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 8 | WARN 0 | SKIP 1 | PASS 284 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Unknown package ‘sparsebn’ in Rd xrefs
    ```

# spathial

<details>

* Version: 0.1.2
* GitHub: NA
* Source code: https://github.com/cran/spathial
* Date/Publication: 2020-04-10 18:20:02 UTC
* Number of recursive dependencies: 43

Run `revdepcheck::cloud_details(, "spathial")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘spathial-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: spathialPrefiltering
    > ### Title: Prefilter data
    > ### Aliases: spathialPrefiltering
    > 
    > ### ** Examples
    > 
    > # Load data matrix X
    ...
    > boundaryRes <- spathialBoundaryIds(X, X_labels, mode=2, from=3, to=6)
    > X <- boundaryRes$X
    > X_labels <- boundaryRes$X_labels
    > boundary_ids <- boundaryRes$boundary_ids
    > # Run spathial spathialPrefilterinh with the output of the function spathialBoundaryIds
    > filterRes <- spathialPrefiltering(X, boundary_ids)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: spathialPrefiltering ... rkm_prefilter -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘vignette.rmd’ using rmarkdown
    
    Quitting from lines 178-186 [unnamed-chunk-15] (vignette.rmd)
    Error: processing vignette 'vignette.rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘vignette.rmd’
    
    SUMMARY: processing the following file failed:
      ‘vignette.rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘irlba’ ‘knitr’ ‘rmarkdown’
      All declared Imports should be used.
    ```

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# spatsoc

<details>

* Version: 0.1.16
* GitHub: https://github.com/ropensci/spatsoc
* Source code: https://github.com/cran/spatsoc
* Date/Publication: 2021-02-24 06:50:02 UTC
* Number of recursive dependencies: 70

Run `revdepcheck::cloud_details(, "spatsoc")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘spatsoc-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_gbi
    > ### Title: Generate group by individual matrix
    > ### Aliases: get_gbi
    > 
    > ### ** Examples
    > 
    > # Load data.table
    ...
     Please note that rgeos will be retired during October 2023,
    plan transition to sf or terra functions using GEOS at your earliest convenience.
    See https://r-spatial.org/r/2023/05/15/evolution4.html for details.
     Linking to sp version: 1.6-1 
     Polygon checking: TRUE 
    
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: group_polys ... [.data.table -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       7. └─igraph::graph_from_adjacency_matrix(distMatrix <= threshold)
       8.   └─igraph:::graph.adjacency.dense(...)
      ── Error ('test-random.R:11:1'): (code run outside of `test_that()`) ───────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─spatsoc::group_pts(...) at test-random.R:11:0
       2. │ ├─...[]
       3. │ └─data.table:::`[.data.table`(...)
       4. └─igraph::graph_from_adjacency_matrix(distMatrix <= threshold)
       5.   └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 26 | WARN 7 | SKIP 0 | PASS 184 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘using-edge-and-dyad.Rmd’ using rmarkdown
    --- finished re-building ‘using-edge-and-dyad.Rmd’
    
    --- re-building ‘faq.Rmd’ using knitr
    
    Quitting from lines 32-53 [unnamed-chunk-1] (faq.Rmd)
    Error: processing vignette 'faq.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘faq.Rmd’
    ...
    --- failed re-building ‘intro-spatsoc.Rmd’
    
    --- re-building ‘using-in-sna.Rmd’ using knitr
    --- finished re-building ‘using-in-sna.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘faq.Rmd’ ‘intro-spatsoc.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# specr

<details>

* Version: 1.0.0
* GitHub: https://github.com/masurp/specr
* Source code: https://github.com/cran/specr
* Date/Publication: 2023-01-20 13:50:02 UTC
* Number of recursive dependencies: 152

Run `revdepcheck::cloud_details(, "specr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘specr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot_decisiontree
    > ### Title: Plot decision tree
    > ### Aliases: plot_decisiontree
    > 
    > ### ** Examples
    > 
    > results <- run_specs(df = example_data,
    ...
    +                     controls = c("c1", "c2"))
    > 
    > # Basic, non-labelled decisions tree
    > plot_decisiontree(results)
    Warning: `plot_decisiontree()` was deprecated in specr 1.0.0.
    ℹ Please use `plot.specr.setup()` instead.
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot_decisiontree ... create_layout -> graph_from_data_frame -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─base::plot(specs) at test-generics.R:13:2
       2. ├─specr:::plot.specr.setup(specs)
       3. │ └─edge_list %>% graph_from_data_frame %>% ...
       4. ├─ggraph::ggraph(., layout = layout, circular = circular)
       5. │ ├─ggplot2::ggplot(data = create_layout(graph, layout, ...), environment = envir)
       6. │ └─ggraph::create_layout(graph, layout, ...)
       7. └─igraph::graph_from_data_frame(.)
       8.   └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 1 | WARN 8 | SKIP 0 | PASS 25 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘custom-plot.rmd’ using rmarkdown
    --- finished re-building ‘custom-plot.rmd’
    
    --- re-building ‘different-specifications.Rmd’ using rmarkdown
    --- finished re-building ‘different-specifications.Rmd’
    
    --- re-building ‘getting-started.rmd’ using rmarkdown
    
    Quitting from lines 75-76 [unnamed-chunk-5] (getting-started.rmd)
    ...
    --- finished re-building ‘parallel-bayesian-models.Rmd’
    
    --- re-building ‘parallelization.Rmd’ using rmarkdown
    --- finished re-building ‘parallelization.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘getting-started.rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# spinner

<details>

* Version: 1.1.0
* GitHub: NA
* Source code: https://github.com/cran/spinner
* Date/Publication: 2023-03-21 06:10:02 UTC
* Number of recursive dependencies: 76

Run `revdepcheck::cloud_details(, "spinner")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(spinner)
      > 
      > test_check("spinner")
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 0 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test.R:1:1'): (code run outside of `test_that()`) ───────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─igraph::random.graph.game(20, 0.3) at test.R:1:0
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

# spNetwork

<details>

* Version: 0.4.3.7
* GitHub: https://github.com/JeremyGelb/spNetwork
* Source code: https://github.com/cran/spNetwork
* Date/Publication: 2023-04-11 15:50:02 UTC
* Number of recursive dependencies: 150

Run `revdepcheck::cloud_details(, "spNetwork")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘spNetwork-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: build_graph
    > ### Title: Network generation
    > ### Aliases: build_graph
    > 
    > ### ** Examples
    > 
    > data(mtl_network)
    > mtl_network$length <- as.numeric(sf::st_length(mtl_network))
    > graph_result <- build_graph(mtl_network, 2, "length", attrs = TRUE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: build_graph -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Error ('test_tnkde_sf.R:285:3'): Testing the multicore version of the function TNKDE ──
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─spNetwork::tnkde(...) at test_tnkde_sf.R:285:2
       2.   └─base::lapply(...)
       3.     └─spNetwork (local) FUN(X[[i]], ...)
       4.       └─spNetwork:::tnkde_worker(...)
       5.         └─spNetwork::build_graph(lines, digits = digits, line_weight = "length")
       6.           └─igraph::graph_from_data_frame(linelist, directed = FALSE, vertices = NULL)
       7.             └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 56 | WARN 0 | SKIP 0 | PASS 18 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Isochrones.Rmd’ using rmarkdown
    
    Quitting from lines 66-72 [unnamed-chunk-2] (Isochrones.Rmd)
    Error: processing vignette 'Isochrones.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘Isochrones.Rmd’
    
    --- re-building ‘KNetworkFunctions.Rmd’ using rmarkdown
    --- finished re-building ‘KNetworkFunctions.Rmd’
    ...
    --- finished re-building ‘SpatialWeightMatrices.Rmd’
    
    --- re-building ‘TNKDE.Rmd’ using rmarkdown
    --- finished re-building ‘TNKDE.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Isochrones.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 30.6Mb
      sub-directories of 1Mb or more:
        doc       1.1Mb
        extdata   2.6Mb
        libs     25.5Mb
    ```

# spqdep

<details>

* Version: 0.1.2
* GitHub: NA
* Source code: https://github.com/cran/spqdep
* Date/Publication: 2022-03-28 16:20:02 UTC
* Number of recursive dependencies: 114

Run `revdepcheck::cloud_details(, "spqdep")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘spqdep-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: Q.map.test
    > ### Title: Compute the QE and QI tests of Equivalence and Independence
    > ###   between maps
    > ### Aliases: Q.map.test
    > 
    > ### ** Examples
    > 
    ...
    
    attr(,"class")
    [1] "qmap" "list"
    > plot(qmap)
    > plot(qmap, ci=.6)
    > plot(qmap[[1]]$mh)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... plot.m_surr -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘spq_userguide.Rmd’ using rmarkdown
    
    Quitting from lines 137-138 [plot mh] (spq_userguide.Rmd)
    Error: processing vignette 'spq_userguide.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘spq_userguide.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘spq_userguide.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘lwgeom’ ‘rgeoda’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    ```

# SSN

<details>

* Version: 1.1.17
* GitHub: NA
* Source code: https://github.com/cran/SSN
* Date/Publication: 2023-02-27 08:22:38 UTC
* Number of recursive dependencies: 27

Run `revdepcheck::cloud_details(, "SSN")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SSN-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: SimulateOnSSN
    > ### Title: Simulating Data on Spatial Stream Networks
    > ### Aliases: SimulateOnSSN
    > 
    > ### ** Examples
    > 
    > #######################################
    ...
    > library(SSN)
    > set.seed(101)
    > ## simulate a SpatialStreamNetwork object
    > raw1.ssn <- createSSN(n = c(10,10),
    +     obsDesign = binomialDesign(c(50,50)), predDesign = binomialDesign(c(100,100)),
    + 	importToR = TRUE, path = paste(tempdir(),"/sim1", sep = ""))
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: createSSN
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘SSN.Rnw’ using Sweave
    Error: processing vignette 'SSN.Rnw' failed with diagnostics:
    Running 'texi2dvi' on 'SSN.tex' failed.
    LaTeX errors:
    ! LaTeX Error: File `ae.sty' not found.
    
    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: sty)
    
    ...
    l.30 \ifthenelse
                    {\boolean{Sweave@inconsolata}}{%^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘STARS.Rnw’
    
    SUMMARY: processing the following files failed:
      ‘SSN.Rnw’ ‘STARS.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# stagedtrees

<details>

* Version: 2.2.1
* GitHub: https://github.com/gherardovarando/stagedtrees
* Source code: https://github.com/cran/stagedtrees
* Date/Publication: 2022-04-28 23:10:02 UTC
* Number of recursive dependencies: 48

Run `revdepcheck::cloud_details(, "stagedtrees")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        2. │ └─testthat:::quasi_capture(enquo(object), NULL, evaluate_promise)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ ├─withr::with_output_sink(...)
        5. │   │ │ └─base::force(code)
        6. │   │ ├─base::withCallingHandlers(...)
        7. │   │ └─base::withVisible(code)
        8. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        9. ├─base::plot(ceg(mod), col = "stages")
       10. └─stagedtrees:::plot.ceg(ceg(mod), col = "stages")
       11.   └─igraph::graph_from_adjacency_matrix(A)
       12.     └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 1037 ]
      Error: Test failures
      Execution halted
    ```

# statGraph

<details>

* Version: 0.5.0
* GitHub: NA
* Source code: https://github.com/cran/statGraph
* Date/Publication: 2021-05-19 07:00:06 UTC
* Number of recursive dependencies: 17

Run `revdepcheck::cloud_details(, "statGraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘statGraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: GIC
    > ### Title: Graph Information Criterion (GIC)
    > ### Aliases: GIC
    > ### Keywords: graph_information_criterion
    > 
    > ### ** Examples
    > 
    > set.seed(1)
    > G <- as.matrix(igraph::get.adjacency(igraph::sample_gnp(n=50, p=0.5)))
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: as.matrix -> <Anonymous> -> ensure_igraph -> <Anonymous>
    Execution halted
    ```

# stemmatology

<details>

* Version: 0.3.2
* GitHub: https://github.com/Jean-Baptiste-Camps/stemmatology
* Source code: https://github.com/cran/stemmatology
* Date/Publication: 2019-04-10 15:52:51 UTC
* Number of recursive dependencies: 64

Run `revdepcheck::cloud_details(, "stemmatology")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘stemmatology-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: PCC.Exploratory
    > ### Title: PCC Exploratory methods
    > ### Aliases: PCC.Exploratory
    > ### Keywords: stemmatology
    > 
    > ### ** Examples
    > 
    ...
    > ## Don't show: 
    > # subsetting for exec time
    > fournival = fournival[1:50,c(-5,-8)]
    > ## End(Don't show)
    > # Non interactive mode
    > PCC.Exploratory(fournival, ask = FALSE, threshold = 0.06)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: PCC.Exploratory ... <Anonymous> -> make_graph -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(...) at test-layout_as_stemma.R:11:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─stemmatology::layout_as_stemma(edgelist)
       5.   └─igraph::graph_from_edgelist(edgelist[, 1:2], directed = TRUE)
       6.     └─igraph::make_graph(unname(ids[t(el)]), directed = directed)
       7.       ├─base::do.call(old_graph, args)
       8.       └─igraph (local) `<fn>`(`<int>`, directed = TRUE)
      
      [ FAIL 13 | WARN 0 | SKIP 4 | PASS 43 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘stemmatology.Rnw’ using Sweave
    Error: processing vignette 'stemmatology.Rnw' failed with diagnostics:
    Running 'texi2dvi' on 'stemmatology.tex' failed.
    LaTeX errors:
    ! LaTeX Error: File `ae.sty' not found.
    
    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: sty)
    ...
    l.55 \RequirePackage
                        [T1]{fontenc}^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘stemmatology.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘stemmatology.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# stm

<details>

* Version: 1.3.6
* GitHub: https://github.com/bstewart/stm
* Source code: https://github.com/cran/stm
* Date/Publication: 2020-09-18 13:50:02 UTC
* Number of recursive dependencies: 86

Run `revdepcheck::cloud_details(, "stm")` for more info

</details>

## Newly broken

*   checking running R code from vignettes ... ERROR
    ```
    Errors in running code in vignettes:
    when running code in ‘stmVignette.Rnw’
      ...
    
    > cloud(poliblogPrevFit, topic = 7, scale = c(2, 0.25))
    
    > mod.out.corr <- topicCorr(poliblogPrevFit)
    
    > plot(mod.out.corr)
    
      When sourcing 'stmVignette.R':
    Error: could not find function ".igraph.status"
    Execution halted
    
      ‘stmVignette.Rnw’ using ‘UTF-8’... failed
    ```

## In both

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `if (...length() && any(...names() == "Dimnames")) .Object@Dimnames <- fixupDN(.Object@Dimnames)`: missing value where TRUE/FALSE needed
      Backtrace:
          ▆
       1. ├─quanteda::dfm(...) at test-quanteda-stm.R:9:4
       2. └─quanteda:::dfm.corpus(...)
       3.   └─(function(x, tolower = TRUE, remove_padding = FALSE, stem = NULL, ...
       4.     └─quanteda:::dfm.tokens(...)
       5.       └─quanteda:::build_dfm(...)
       6.         └─methods::new(...)
       7.           ├─methods::initialize(value, ...)
       8.           └─Matrix (local) initialize(value, ...)
      
      [ FAIL 1 | WARN 3 | SKIP 0 | PASS 8 ]
      Error: Test failures
      Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.3Mb
      sub-directories of 1Mb or more:
        data   1.7Mb
        libs   3.4Mb
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘stmVignette.Rnw’ using Sweave
    stm v1.3.6 successfully loaded. See ?stm for help. 
     Papers, resources, and other materials at structuraltopicmodel.com
    
    Error: processing vignette 'stmVignette.Rnw' failed with diagnostics:
     chunk 27 
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    
    --- failed re-building 'stmVignette.Rnw'
    
    SUMMARY: processing the following file failed:
      'stmVignette.Rnw'
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# stplanr

<details>

* Version: 1.0.2
* GitHub: https://github.com/ropensci/stplanr
* Source code: https://github.com/cran/stplanr
* Date/Publication: 2022-11-08 12:40:02 UTC
* Number of recursive dependencies: 167

Run `revdepcheck::cloud_details(, "stplanr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘stplanr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: rnet_group
    > ### Title: Assign segments in a route network to groups
    > ### Aliases: rnet_group rnet_group.default rnet_group.sfc rnet_group.sf
    > 
    > ### ** Examples
    > 
    > rnet <- rnet_breakup_vertices(stplanr::osm_net_example)
    > rnet$group <- rnet_group(rnet)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: rnet_group ... rnet_group.sf -> rnet_group -> rnet_group.sfc -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘stplanr-od.Rmd’ using rmarkdown
    --- finished re-building ‘stplanr-od.Rmd’
    
    --- re-building ‘stplanr-paper.Rmd’ using rmarkdown
    --- finished re-building ‘stplanr-paper.Rmd’
    
    --- re-building ‘stplanr-parallel.Rmd’ using rmarkdown
    --- finished re-building ‘stplanr-parallel.Rmd’
    
    ...
    --- finished re-building ‘stplanr-routing.Rmd’
    
    --- re-building ‘stplanr.Rmd’ using rmarkdown
    --- finished re-building ‘stplanr.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘stplanr-route-nets.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# SurvHiDim

<details>

* Version: 0.1.1
* GitHub: NA
* Source code: https://github.com/cran/SurvHiDim
* Date/Publication: 2021-06-26 15:40:02 UTC
* Number of recursive dependencies: 171

Run `revdepcheck::cloud_details(, "SurvHiDim")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SurvHiDim-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: hdNetwork
    > ### Title: hdNetwork
    > ### Aliases: hdNetwork
    > 
    > ### ** Examples
    > 
    > ##
    > data(hnscc)
    > hdNetwork(7,105,0.05,0.2,ID="id",OS="os",Death="death",PFS="pfs",Prog="prog",hnscc)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: hdNetwork ... graph_from_adjacency_matrix -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘readr’
      All declared Imports should be used.
    ```

# targets

<details>

* Version: 1.1.3
* GitHub: https://github.com/ropensci/targets
* Source code: https://github.com/cran/targets
* Date/Publication: 2023-05-23 14:10:02 UTC
* Number of recursive dependencies: 177

Run `revdepcheck::cloud_details(, "targets")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ────────────────────────────────────────────────────────────────────────────────
      Maximum number of failures exceeded; quitting at end of file.
      ℹ Increase this number with (e.g.) `testthat::set_max_fails(Inf)` 
      
      ══ Results ═════════════════════════════════════════════════════════════════════
      Duration: 4.7 s
      
      ── Skipped tests  ──────────────────────────────────────────────────────────────
      • On CRAN (44)
      • version of crew, mirai, or nanonext is too low (6)
      
      [ FAIL 36 | WARN 0 | SKIP 50 | PASS 202 ]
      ══ Terminated early ════════════════════════════════════════════════════════════
      Error: Test failures
      Execution halted
    ```

# TDA

<details>

* Version: 1.9
* GitHub: NA
* Source code: https://github.com/cran/TDA
* Date/Publication: 2023-02-04 18:42:30 UTC
* Number of recursive dependencies: 59

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
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
    Error: could not find function ".igraph.status"
    Execution halted
    
      ‘article.Rnw’ using ‘UTF-8’... failed
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 51.4Mb
      sub-directories of 1Mb or more:
        libs  50.2Mb
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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    
    --- failed re-building ‘article.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘article.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# text2map

<details>

* Version: 0.1.6
* GitHub: NA
* Source code: https://github.com/cran/text2map
* Date/Publication: 2022-08-17 22:20:02 UTC
* Number of recursive dependencies: 133

Run `revdepcheck::cloud_details(, "text2map")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘text2map-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: CoCA
    > ### Title: Performs Concept Class Analysis (CoCA)
    > ### Aliases: CoCA
    > 
    > ### ** Examples
    > 
    > 
    ...
    +   wv = ft_wv_sample,
    +   directions = sem_dirs,
    +   filter_sig = TRUE,
    +   filter_value = 0.05,
    +   zero_action = "drop"
    + )
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: CoCA ... .get_cor_class -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       13. │                     └─base::eval(exprs, env)
       14. │                       └─text2map:::tidytext_dfm(corpus) at tests/testthat/helper-data.R:184:0
       15. │                         └─... %>% tidytext::cast_dfm(doc_id, word, n) at tests/testthat/helper-data.R:162:12
       16. ├─tidytext::cast_dfm(., doc_id, word, n)
       17. │ ├─quanteda::as.dfm(m)
       18. │ └─quanteda:::as.dfm.Matrix(m)
       19. │   └─quanteda:::matrix2dfm(x)
       20. │     └─quanteda:::build_dfm(...)
       21. │       └─methods::new(...)
       22. │         ├─methods::initialize(value, ...)
       23. │         └─Matrix (local) initialize(value, ...)
       24. └─base::.handleSimpleError(...)
       25.   └─testthat (local) h(simpleError(msg, call))
       26.     └─rlang::abort(...)
      Execution halted
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 3 marked UTF-8 strings
    ```

# textrank

<details>

* Version: 0.3.1
* GitHub: https://github.com/bnosac/textrank
* Source code: https://github.com/cran/textrank
* Date/Publication: 2020-10-12 11:50:02 UTC
* Number of recursive dependencies: 54

Run `revdepcheck::cloud_details(, "textrank")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘textrank-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: textrank_candidates_lsh
    > ### Title: Use locality-sensitive hashing to get combinations of sentences
    > ###   which contain words which are in the same minhash bucket
    > ### Aliases: textrank_candidates_lsh
    > 
    > ### ** Examples
    > 
    ...
    +                          textrank_candidates = candidates)
    + summary(tr, n = 2)
    + ## Don't show: 
    + } # End of main if statement running only if the required packages are installed
    Loading required package: udpipe
    Loading required package: textreuse
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: textrank_sentences -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘textrank.Rmd’ using rmarkdown
    
    Quitting from lines 78-81 [unnamed-chunk-4] (textrank.Rmd)
    Error: processing vignette 'textrank.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘textrank.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘textrank.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# tidygraph

<details>

* Version: 1.2.3
* GitHub: https://github.com/thomasp85/tidygraph
* Source code: https://github.com/cran/tidygraph
* Date/Publication: 2023-02-01 21:10:02 UTC
* Number of recursive dependencies: 77

Run `revdepcheck::cloud_details(, "tidygraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidygraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: activate
    > ### Title: Determine the context of subsequent manipulations
    > ### Aliases: activate active %N>% %E>%
    > 
    > ### ** Examples
    > 
    > gr <- create_complete(5) %>%
    +   activate(nodes) %>%
    +   mutate(class = sample(c('a', 'b'), 5, TRUE)) %>%
    +   activate(edges) %>%
    +   arrange(from)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: %>% ... activate -> create_complete -> as_tbl_graph -> make_full_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       2.   ├─tidygraph::as_tbl_graph(make_tree(n, children, mode))
       3.   └─igraph::make_tree(n, children, mode)
      ── Error ('test-search.R:33:3'): search requires active nodes ──────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─create_tree(10, 2) %>% activate(edges) at test-search.R:33:2
       2. ├─tidygraph::activate(., edges)
       3. └─tidygraph::create_tree(10, 2)
       4.   ├─tidygraph::as_tbl_graph(make_tree(n, children, mode))
       5.   └─igraph::make_tree(n, children, mode)
      
      [ FAIL 54 | WARN 0 | SKIP 0 | PASS 3 ]
      Error: Test failures
      Execution halted
    ```

# tilemaps

<details>

* Version: 0.2.0
* GitHub: https://github.com/kaerosen/tilemaps
* Source code: https://github.com/cran/tilemaps
* Date/Publication: 2020-07-10 04:20:02 UTC
* Number of recursive dependencies: 75

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
    Linking to GEOS 3.8.0, GDAL 3.0.4, PROJ 6.3.1; sf_use_s2() is TRUE
    > northeast <- governors[c(6,7,17,18,19,27,28,30,36,37,43),]
    > tile_map <- generate_map(northeast$geometry, square = FALSE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: generate_map -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘tilemaps.Rmd’ using rmarkdown
    
    Quitting from lines 33-41 [unnamed-chunk-2] (tilemaps.Rmd)
    Error: processing vignette 'tilemaps.Rmd' failed with diagnostics:
    ℹ In argument: `tile_map = generate_map(geometry, square = FALSE,
      flat_topped = TRUE)`.
    Caused by error in `.igraph.status()`:
    ! could not find function ".igraph.status"
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

# tip

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/tip
* Date/Publication: 2022-11-14 17:30:02 UTC
* Number of recursive dependencies: 100

Run `revdepcheck::cloud_details(, "tip")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tip-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: partition_undirected_graph
    > ### Title: Partition an undirected graph
    > ### Aliases: partition_undirected_graph
    > 
    > ### ** Examples
    > 
    > # Import the tip library
    ...
    + }
    > 
    > # Generate a one-cluster graph (i.e., partitioned_graph_matrix)
    > partition_undirected_graph(.graph_matrix = posterior_prob_matrix,
    +                            .num_components = 1,
    +                            .step_size = 0.001)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: partition_undirected_graph -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘matrix-CONSTANT-simulated-vignette.Rmd’ using rmarkdown
    
    Quitting from lines 113-117 [unnamed-chunk-6] (matrix-CONSTANT-simulated-vignette.Rmd)
    Error: processing vignette 'matrix-CONSTANT-simulated-vignette.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘matrix-CONSTANT-simulated-vignette.Rmd’
    
    --- re-building ‘matrix-MNIW-simulated-vignette.Rmd’ using rmarkdown
    
    ...
    --- failed re-building ‘vector-NIW-usarrests-vignette.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘matrix-CONSTANT-simulated-vignette.Rmd’
      ‘matrix-MNIW-simulated-vignette.Rmd’
      ‘tensor-CONSTANT-simulated-vignette.Rmd’
      ‘vector-NIW-iris-vignette.Rmd’ ‘vector-NIW-usarrests-vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# Tlasso

<details>

* Version: 1.0.2
* GitHub: NA
* Source code: https://github.com/cran/Tlasso
* Date/Publication: 2022-02-01 08:20:08 UTC
* Number of recursive dependencies: 42

Run `revdepcheck::cloud_details(, "Tlasso")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘Tlasso-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: graph.pattern
    > ### Title: Graph Pattern Visualization
    > ### Aliases: graph.pattern
    > 
    > ### ** Examples
    > 
    >  
    > graph.pattern(ChainOmega(5, sd = 13))
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: graph.pattern -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Tlasso.Rmd’ using rmarkdown
    
    Quitting from lines 319-327 [unnamed-chunk-10] (Tlasso.Rmd)
    Error: processing vignette 'Tlasso.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘Tlasso.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Tlasso.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# TOHM

<details>

* Version: 1.4
* GitHub: NA
* Source code: https://github.com/cran/TOHM
* Date/Publication: 2021-03-09 20:30:05 UTC
* Number of recursive dependencies: 40

Run `revdepcheck::cloud_details(, "TOHM")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘TOHM-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: EC_LRT
    > ### Title: Compute the Euler characteristic for the generalized Likelihood
    > ###   Ratio Test field
    > ### Aliases: EC_LRT
    > ### Keywords: Euler characteristic generalized Likelihood Ratio random
    > ###   field
    > 
    ...
    > THETA_sel<-THETA2[(THETA2[,2]<=(28+sqrt(30^2-(THETA2[,1]-
    + 195)^2)))&(THETA2[,2]>=(28-sqrt(30^2-(THETA2[,1]-195)^2))),]
    > 
    > EC_LRT(ck=c(1,8),x=data,mll=mll,null0=0,init=c(0.1),
    + lowlim=c(0),uplim=c(1), THETA_sel)
    Evaluating LRT for each point of the grid...
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: EC_LRT ... graph_from_adjacency_matrix -> graph.adjacency.dense
    Execution halted
    ```

# TreeDimensionTest

<details>

* Version: 0.0.2
* GitHub: NA
* Source code: https://github.com/cran/TreeDimensionTest
* Date/Publication: 2022-03-12 10:30:07 UTC
* Number of recursive dependencies: 68

Run `revdepcheck::cloud_details(, "TreeDimensionTest")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Tutorial.Rmd’ using rmarkdown
    
    Quitting from lines 46-56 [unnamed-chunk-5] (Tutorial.Rmd)
    Error: processing vignette 'Tutorial.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
    --- failed re-building ‘Tutorial.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Tutorial.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# treefit

<details>

* Version: 1.0.2
* GitHub: https://github.com/hayamizu-lab/treefit-r
* Source code: https://github.com/cran/treefit
* Date/Publication: 2022-01-18 07:50:02 UTC
* Number of recursive dependencies: 154

Run `revdepcheck::cloud_details(, "treefit")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─treefit::treefit(list(expression = star), "tree-like") at test-treefit.R:142:2
       2.   └─treefit:::calculate_eigenvectors_list(...)
       3.     └─base::lapply(...)
       4.       └─treefit (local) FUN(X[[i]], ...)
       5.         └─treefit:::do_build_tree(original, target, build_tree)
       6.           └─treefit:::calculate_mst(target)
       7.             └─igraph::graph_from_adjacency_matrix(...)
       8.               └─igraph:::graph.adjacency.dense(...)
      
      [ FAIL 5 | WARN 0 | SKIP 0 | PASS 7 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘treefit.Rmd’ using rmarkdown
    
    Quitting from lines 100-105 [estimate-tree-like-data] (treefit.Rmd)
    Error: processing vignette 'treefit.Rmd' failed with diagnostics:
    could not find function ".igraph.status"
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

# treemap

<details>

* Version: 2.4-4
* GitHub: NA
* Source code: https://github.com/cran/treemap
* Date/Publication: 2023-05-25 15:20:02 UTC
* Number of recursive dependencies: 62

Run `revdepcheck::cloud_details(, "treemap")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘treemap-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: treegraph
    > ### Title: Create a tree graph
    > ### Aliases: treegraph
    > 
    > ### ** Examples
    > 
    > data(business)
    > treegraph(business, index=c("NACE1", "NACE2", "NACE3", "NACE4"), show.labels=FALSE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: treegraph -> graph.data.frame -> make_empty_graph
    Execution halted
    ```

# VARDetect

<details>

* Version: 0.1.6
* GitHub: NA
* Source code: https://github.com/cran/VARDetect
* Date/Publication: 2022-05-10 08:00:06 UTC
* Number of recursive dependencies: 85

Run `revdepcheck::cloud_details(, "VARDetect")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘VARDetect-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot.VARDetect.result
    > ### Title: Plotting the output from VARDetect.result class
    > ### Aliases: plot.VARDetect.result
    > 
    > ### ** Examples
    > 
    > nob <- 1000
    ...
    [1] 341 682
    [1] "second.brk.points:"
    [1] 341 682
    no refit for the parameter estimation> plot(fit, display = "cp")
    > plot(fit, display = "param")
    > plot(fit, display = "granger", threshold = 0.2, layout = "nicely")
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plot ... plot_granger -> graph.adjacency -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.5Mb
      sub-directories of 1Mb or more:
        libs   6.0Mb
    ```

# vennLasso

<details>

* Version: 0.1.6
* GitHub: https://github.com/jaredhuling/vennLasso
* Source code: https://github.com/cran/vennLasso
* Date/Publication: 2020-06-03 08:50:02 UTC
* Number of recursive dependencies: 51

Run `revdepcheck::cloud_details(, "vennLasso")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘vennLasso-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plotCoefs
    > ### Title: plotting function to investigate estimated coefficients
    > ### Aliases: plotCoefs
    > 
    > ### ** Examples
    > 
    > set.seed(123)
    ...
    > 
    > dat.sim <- genHierSparseData(ncats = 3, nvars = 25, nobs = 200)
    > 
    > fit <- vennLasso(x = dat.sim$x, y = dat.sim$y, groups = dat.sim$group.ind)
    > 
    > plotCoefs(fit, s = fit$lambda[22])
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: plotCoefs ... %in% -> visIgraphLayout -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘using_the_vennLasso_package.Rmd’ using rmarkdown
    A new version of TeX Live has been released. If you need to install or update any LaTeX packages, you have to upgrade TinyTeX with tinytex::reinstall_tinytex(repository = "illinois").
    
    tlmgr: Local TeX Live (2022) is older than remote repository (2023).
    Cross release updates are only supported with
      update-tlmgr-latest(.sh/.exe) --update
    See https://tug.org/texlive/upgrade.html for details.
    Warning in system2("tlmgr", args, ...) :
    ...
    
    Error: processing vignette 'using_the_vennLasso_package.Rmd' failed with diagnostics:
    LaTeX failed to compile /tmp/workdir/vennLasso/new/vennLasso.Rcheck/vign_test/vennLasso/vignettes/using_the_vennLasso_package.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See using_the_vennLasso_package.log for more info.
    --- failed re-building ‘using_the_vennLasso_package.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘using_the_vennLasso_package.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 36.1Mb
      sub-directories of 1Mb or more:
        libs  35.5Mb
    ```

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# VertexSimilarity

<details>

* Version: 0.1
* GitHub: NA
* Source code: https://github.com/cran/VertexSimilarity
* Date/Publication: 2016-01-24 21:37:10
* Number of recursive dependencies: 7

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
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: VertexSimilarity -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# vivainsights

<details>

* Version: 0.3.1
* GitHub: NA
* Source code: https://github.com/cran/vivainsights
* Date/Publication: 2023-05-22 13:10:02 UTC
* Number of recursive dependencies: 98

Run `revdepcheck::cloud_details(, "vivainsights")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘vivainsights-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: tm_cooc
    > ### Title: Analyse word co-occurrence in subject lines and return a network
    > ###   plot
    > ### Aliases: tm_cooc
    > 
    > ### ** Examples
    > 
    > # Demo using a subset of `mt_data`
    > mt_data %>%
    +   dplyr::slice(1:20) %>%
    +   tm_cooc(lmult = 0.01)
    Selecting by n
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: %>% ... ggplot -> create_layout -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 52 marked UTF-8 strings
    ```

# wdnet

<details>

* Version: 1.1.0
* GitHub: NA
* Source code: https://github.com/cran/wdnet
* Date/Publication: 2023-05-17 10:10:02 UTC
* Number of recursive dependencies: 54

Run `revdepcheck::cloud_details(, "wdnet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘wdnet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: adj_to_wdnet
    > ### Title: Creates a 'wdnet' object using an adjacency matrix
    > ### Aliases: adj_to_wdnet
    > 
    > ### ** Examples
    > 
    > adj <- matrix(c(0, 1, 2, 0), nrow = 2, ncol = 2, byrow = TRUE)
    > adj_to_wdnet(adj = adj, directed = TRUE, weighted = FALSE)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: adj_to_wdnet ... adj_to_edgelist -> <Anonymous> -> graph.adjacency.dense
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       5.         └─igraph::graph_from_adjacency_matrix(...)
       6.           └─igraph:::graph.adjacency.dense(...)
      ── Error ('test-wdnet-igraph.R:4:3'): multiplication works ─────────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─wdnet::wdnet_to_igraph(netwk0) at test-wdnet-igraph.R:4:2
       2.   └─igraph::graph_from_edgelist(netwk$edgelist, directed = netwk$directed)
       3.     └─igraph::make_graph(t(el), directed = directed)
       4.       ├─base::do.call(old_graph, args)
       5.       └─igraph (local) `<fn>`(`<dbl[,1001]>`, directed = TRUE)
      
      [ FAIL 5 | WARN 0 | SKIP 0 | PASS 16 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.3Mb
      sub-directories of 1Mb or more:
        libs   9.0Mb
    ```

# webtrackR

<details>

* Version: 0.0.1
* GitHub: https://github.com/schochastics/webtrackR
* Source code: https://github.com/cran/webtrackR
* Date/Publication: 2023-03-13 13:30:02 UTC
* Number of recursive dependencies: 40

Run `revdepcheck::cloud_details(, "webtrackR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘webtrackR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: audience_incidence
    > ### Title: Create incidence matrix for audience-outlet network
    > ### Aliases: audience_incidence
    > 
    > ### ** Examples
    > 
    > data("test_data")
    > wt <- as.wt_dt(test_data)
    > wt <- add_duration(wt)
    > wt <- extract_domain(wt)
    > audience_incidence(wt)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: audience_incidence -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 21 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-audience_networks.R:6:3'): audience_incidence ──────────────────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. └─webtrackR::audience_incidence(wt) at test-audience_networks.R:6:2
       2.   └─igraph::graph_from_data_frame(el, directed = FALSE)
       3.     └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 21 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 14 marked UTF-8 strings
    ```

# whitechapelR

<details>

* Version: 0.3.0
* GitHub: NA
* Source code: https://github.com/cran/whitechapelR
* Date/Publication: 2018-10-02 17:40:03 UTC
* Number of recursive dependencies: 47

Run `revdepcheck::cloud_details(, "whitechapelR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘whitechapelR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: show_board
    > ### Title: Display game board representation
    > ### Aliases: show_board
    > 
    > ### ** Examples
    > 
    > possibilities = start_round(64)
    ...
    > possibilities = take_a_step(possibilities,roads)
    > possibilities = take_a_step(possibilities,roads,blocked=list(c(63,82),c(63,65)))
    > possibilities = take_a_step(possibilities,alley)
    > show_board(paths=possibilities,hideouts=NULL,roads,alley,node_locations)
    Warning in v$color[as.numeric(names(tbl))] <- to_replace :
      number of items to replace is not a multiple of replacement length
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: show_board -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_whitechapel.R:77:3'): Expect plot generates without errors ─────
      Error in `.igraph.status("Make graph external pointer.\n")`: could not find function ".igraph.status"
      Backtrace:
          ▆
       1. ├─testthat::expect_null(...) at test_whitechapel.R:77:2
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─whitechapelR::show_board(list(69), c(45, 46), roads, alley, node_locations)
       5.   └─igraph::graph_from_data_frame(...)
       6.     └─igraph::make_empty_graph(n = 0, directed = directed)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 13 ]
      Error: Test failures
      Execution halted
    ```

# wpa

<details>

* Version: 1.8.1
* GitHub: https://github.com/microsoft/wpa
* Source code: https://github.com/cran/wpa
* Date/Publication: 2023-01-30 15:00:02 UTC
* Number of recursive dependencies: 121

Run `revdepcheck::cloud_details(, "wpa")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘wpa-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: network_describe
    > ### Title: Uncover HR attributes which best represent a population for a
    > ###   Person to Person query
    > ### Aliases: network_describe
    > 
    > ### ** Examples
    > 
    > # Simulate a P2P edge list
    > sim_data <- p2p_data_sim()
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: p2p_data_sim ... as.data.frame -> <Anonymous> -> ensure_igraph -> <Anonymous>
    Execution halted
    ```

# xgboost

<details>

* Version: 1.7.5.1
* GitHub: https://github.com/dmlc/xgboost
* Source code: https://github.com/cran/xgboost
* Date/Publication: 2023-03-30 19:40:02 UTC
* Number of recursive dependencies: 107

Run `revdepcheck::cloud_details(, "xgboost")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘xgboost-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: xgb.ggplot.deepness
    > ### Title: Plot model trees deepness
    > ### Aliases: xgb.ggplot.deepness xgb.plot.deepness
    > 
    > ### ** Examples
    > 
    > 
    ...
    [47]	train-logloss:0.009265 
    [48]	train-logloss:0.008787 
    [49]	train-logloss:0.008370 
    [50]	train-logloss:0.007953 
    > 
    > xgb.plot.deepness(bst)
    Error in .igraph.status("Make graph external pointer.\n") : 
      could not find function ".igraph.status"
    Calls: xgb.plot.deepness ... [ -> [.data.table -> <Anonymous> -> make_empty_graph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ⠇ |         9 | update trees in an existing model                               [22:10:17] WARNING: src/gbm/gbtree.cc:84: DANGER AHEAD: You have manually specified `updater` parameter. The `tree_method` parameter will be ignored. Incorrect sequence of updaters will produce undefined behavior. For common uses, we recommend using `tree_method` parameter instead.
      [22:10:17] WARNING: src/gbm/gbtree.cc:84: DANGER AHEAD: You have manually specified `updater` parameter. The `tree_method` parameter will be ignored. Incorrect sequence of updaters will produce undefined behavior. For common uses, we recommend using `tree_method` parameter instead.
      
      ⠏ |        20 | update trees in an existing model                               
      ✔ |        22 | update trees in an existing model [0.4s]
      
      ══ Results ═════════════════════════════════════════════════════════════════════
      Duration: 45.3 s
      
      ── Skipped tests  ──────────────────────────────────────────────────────────────
      • empty test (1)
      
      [ FAIL 1 | WARN 2 | SKIP 1 | PASS 1325 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 134.1Mb
      sub-directories of 1Mb or more:
        libs  133.2Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

