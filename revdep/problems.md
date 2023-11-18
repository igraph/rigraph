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
* Number of recursive dependencies: 189

Run `revdepcheck::cloud_details(, "influential")` for more info

</details>

## Newly broken

*   checking dependencies in R code ... WARNING
    ```
    '::' or ':::' import not declared from: ‘lifecycle’
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

