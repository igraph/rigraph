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

