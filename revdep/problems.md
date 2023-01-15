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

# gRbase

<details>

* Version: 1.8.9
* GitHub: NA
* Source code: https://github.com/cran/gRbase
* Date/Publication: 2022-11-10 10:40:02 UTC
* Number of recursive dependencies: 50

Run `revdepcheck::cloud_details(, "gRbase")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘gRbase-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: graph-moralize
    > ### Title: Moralize a directed acyclic graph
    > ### Aliases: graph-moralize moralize moralize.default moralizeMAT
    > ### Keywords: utilities
    > 
    > ### ** Examples
    > 
    ...
    
        decompose, spectrum
    
    The following object is masked from ‘package:base’:
    
        union
    
    Error in simple_vs_index(x, ii, na_ok) : Unknown vertex selected
    Calls: moralize ... [ -> [.igraph.vs -> lapply -> FUN -> simple_vs_index
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
    l.63 ^^M
            
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘graphs.Rnw’
    
    SUMMARY: processing the following files failed:
      ‘arrays.Rnw’ ‘graphs.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 26.4Mb
      sub-directories of 1Mb or more:
        libs  24.3Mb
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
      Epoch: Iteration #300 error is: 199.570455828093
      x_max = 1356.85756899361
      y_max = 349.758686734959
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

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-neuroml-io.R:41'): parse neuroml files ───────────────────────
      myidentical_graph(as.ngraph(read.morphml(nml)[[1]]), as.ngraph(read.neuron(swc))) is not TRUE
      
      `actual`:   FALSE
      `expected`: TRUE 
      Backtrace:
          ▆
       1. ├─base::suppressWarnings(...) at test-neuroml-io.R:41:2
       2. │ └─base::withCallingHandlers(...)
       3. └─testthat::expect_true(...)
      
      [ FAIL 1 | WARN 424 | SKIP 5 | PASS 787 ]
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
    > #
    > data("Woods2010")
    > p1 <- pairwise(treatment, event = r, n = N,
    +   studlab = author, data = Woods2010, sm = "OR")
    > 
    > net1 <- netmeta(p1)
    > cm <- netcontrib(net1)
    Error in simple_vs_index(x, ii, na_ok) : Unknown vertex selected
    Calls: netcontrib ... [ -> [.igraph.vs -> lapply -> FUN -> simple_vs_index
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 2 marked UTF-8 strings
    ```

# NetOrigin

<details>

* Version: 1.1-4
* GitHub: https://github.com/jmanitz/NetOrigin
* Source code: https://github.com/cran/NetOrigin
* Date/Publication: 2022-01-20 08:32:42 UTC
* Number of recursive dependencies: 77

Run `revdepcheck::cloud_details(, "NetOrigin")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘NetOrigin-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: origin
    > ### Title: Origin Estimation for Propagation Processes on Complex Networks
    > ### Aliases: origin origin_edm origin_backtracking origin_centrality
    > ###   origin_bayesian
    > 
    > ### ** Examples
    > 
    ...
    > performance(om, start=1, graph=ptnGoe)
                      start                         est  hitt rank spj dist
    1 X.Adolf.Hoyer.Strasse X.Gotthelf.Leimbach.Strasse FALSE    2   2 1332
    > 
    > # backtracking origin estimation (Manitz et al., 2016)
    > ob <- origin(events=delayGoe[10,-c(1:2)], type='backtracking', graph=ptnGoe)
    Error in `[.data.frame`(value, rep.int(NA_integer_, vcount(graph))) : 
      undefined columns selected
    Calls: origin ... origin_backtracking -> V<- -> i_set_vertex_attr -> [ -> [.data.frame
    Execution halted
    ```

# netseg

<details>

* Version: 1.0-1
* GitHub: https://github.com/mbojan/netseg
* Source code: https://github.com/cran/netseg
* Date/Publication: 2022-08-25 12:10:06 UTC
* Number of recursive dependencies: 59

Run `revdepcheck::cloud_details(, "netseg")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘netseg-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ssi
    > ### Title: Spectral Segregation Index for Social Networks
    > ### Aliases: ssi
    > 
    > ### ** Examples
    > 
    > if(requireNamespace("igraph", quietly = TRUE)) {
    ...
    + vertex.label.family="",
    + vertex.label=igraph::V(WhiteKinship)$name,
    + vertex.color= gray(k),
    + vertex.shape=c("circle", "csquare")[a],
    + vertex.label.color="black")
    + legend( "topleft", legend=c("Men", "Women"), pch=c(0,1), col=1)
    + }
    Error in simple_vs_index(x, ii, na_ok) : Unknown vertex selected
    Calls: ssi ... [ -> [.igraph.vs -> lapply -> FUN -> simple_vs_index
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error in `simple_vs_index(x, ii, na_ok)`: Unknown vertex selected
      Backtrace:
          ▆
       1. └─netseg::ssi(EF3, "race") at test-ssi.R:4:2
       2.   └─igraph::`V<-`(`*tmp*`, value = `*vtmp*`)
       3.     └─igraph:::i_set_vertex_attr(...)
       4.       ├─value[rep.int(NA_integer_, vcount(graph))]
       5.       └─igraph:::`[.igraph.vs`(value, rep.int(NA_integer_, vcount(graph)))
       6.         └─base::lapply(...)
       7.           └─igraph (local) FUN(X[[i]], ...)
       8.             └─igraph:::simple_vs_index(x, ii, na_ok)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 72 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘netseg.Rmd’ using rmarkdown
    Quitting from lines 252-253 (netseg.Rmd) 
    Error: processing vignette 'netseg.Rmd' failed with diagnostics:
    Unknown vertex selected
    --- failed re-building ‘netseg.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘netseg.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
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
       3.   │ └─base::eval(...)
       4.   └─testthat::expect_equal(...)
      ── Failure ('test-msn.R:439'): nodes are properly scaled ───────────────────────
      sort(...) not equal to sort(...).
      names for target but not for current
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
    Error in value_in[seq_along(value_in)] <- value : 
      replacement has length zero
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

