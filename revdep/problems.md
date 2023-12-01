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
    > averagedis(g)
    Error in getIgraphOpt("add.vertex.names") && is.named(graph) : 
      invalid 'x' type in 'x && y'
    Calls: averagedis
    Execution halted
    ```

# cfid

<details>

* Version: 0.1.7
* GitHub: https://github.com/santikka/cfid
* Source code: https://github.com/cran/cfid
* Date/Publication: 2023-11-27 16:00:04 UTC
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
      [ FAIL 1 | WARN 4 | SKIP 0 | PASS 203 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─cfid::import_graph(ig)
       5.   └─cfid::dag(paste0(c(g_obs, g_unobs), collapse = "; "))
       6.     └─cfid:::stopifnot_(nzchar(x), "Argument `x` contains only whitespace or special characters.")
       7.       └─cfid:::stop_(message)
      
      [ FAIL 1 | WARN 4 | SKIP 0 | PASS 203 ]
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
    Error in (function (edges, n = max(edges), directed = TRUE)  : 
      unused arguments (3, FALSE)
    Calls: estimateGraph ... max_cliques -> ensure_igraph -> graph -> make_graph -> do.call
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
       3.     ├─igraph::maximal.cliques(graph(as.vector(t(E)), d, FALSE))
       4.     │ └─igraph::max_cliques(...)
       5.     │   └─igraph:::ensure_igraph(graph)
       6.     └─igraph::graph(as.vector(t(E)), d, FALSE)
       7.       └─igraph::make_graph(...)
       8.         └─base::do.call(old_graph, args)
      
      [ FAIL 6 | WARN 3 | SKIP 0 | PASS 6 ]
      Error: Test failures
      Execution halted
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
      [ FAIL 2 | WARN 141 | SKIP 0 | PASS 54 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
    ...
      i Actually got a <lifecycle_stage> with text:
        is.directed() is deprecated
      ── Error ('test-netcompare.R:5:3'): netcompare just works ──────────────────────
      `print(r)` threw an unexpected error.
      Message: object 'r' not found
      Class:   simpleError/error/condition
      
      [ FAIL 2 | WARN 141 | SKIP 0 | PASS 54 ]
      Error: Test failures
      Execution halted
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
    tlmgr: package repository https://ctan.mirrors.hoobly.com/systems/texlive/tlnet (verified)
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
    
    tlmgr: Remote database (rev 69002) seems to be older than local (rev 69004 of texlive-scripts); please use different mirror or  wait a day or so.
    Warning in system2("tlmgr", args, ...) :
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
    At core/graph/type_indexededgelist.c:117 : Number of vertices must not be negative. Invalid value
    --- failed re-building ‘Tutorial.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Tutorial.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

