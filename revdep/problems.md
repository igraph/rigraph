# causaloptim

<details>

* Version: 0.9.7
* GitHub: https://github.com/sachsmc/causaloptim
* Source code: https://github.com/cran/causaloptim
* Date/Publication: 2023-03-24 12:00:15 UTC
* Number of recursive dependencies: 63

Run `revdepcheck::cloud_details(, "causaloptim")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
          decompose, spectrum
      
      The following object is masked from 'package:base':
      
          union
      
      > 
      > test_check("causaloptim")
      ERROR: Unable to successfully parse objective function.
      	 qNA
      
       *** caught segfault ***
      address 0x2b0000005d, cause 'memory not mapped'
      An irrecoverable exception occurred. R is aborting now ...
      Segmentation fault (core dumped)
    ```

# clustAnalytics

<details>

* Version: 0.5.2
* GitHub: NA
* Source code: https://github.com/cran/clustAnalytics
* Date/Publication: 2022-11-09 11:50:09 UTC
* Number of recursive dependencies: 71

Run `revdepcheck::cloud_details(, "clustAnalytics")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘cluster_stability.Rmd’ using rmarkdown
    --- finished re-building ‘cluster_stability.Rmd’
    
    --- re-building ‘graph_rewiring_functions.Rmd’ using rmarkdown
    --- finished re-building ‘graph_rewiring_functions.Rmd’
    
    --- re-building ‘other_functions.Rmd’ using rmarkdown
    --- finished re-building ‘other_functions.Rmd’
    
    ...
    28: tryCatchList(expr, classes, parentenv, handlers)
    29: tryCatch({    engine$weave(file, quiet = quiet, encoding = enc)    setwd(startdir)    output <- find_vignette_product(name, by = "weave", engine = engine)    if (!have.makefile && vignette_is_tex(output)) {        texi2pdf(file = output, clean = FALSE, quiet = quiet)        output <- find_vignette_product(name, by = "texi2pdf",             engine = engine)    }}, error = function(e) {    OK <<- FALSE    message(gettextf("Error: processing vignette '%s' failed with diagnostics:\n%s",         file, conditionMessage(e)))})
    30: tools:::.buildOneVignette("stability_significance_examples.Rmd",     "/tmp/workdir/clustAnalytics/new/clustAnalytics.Rcheck/vign_test/clustAnalytics",     TRUE, FALSE, "stability_significance_examples", "UTF-8",     "/tmp/RtmparyCh1/file35332ad0ed20.rds")
    An irrecoverable exception occurred. R is aborting now ...
    Segmentation fault (core dumped)
    SUMMARY: processing the following file failed:
      ‘stability_significance_examples.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.6Mb
      sub-directories of 1Mb or more:
        libs   6.1Mb
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
    
    > ### Name: dDAGlevel
    > ### Title: Function to define/calculate the level of nodes in a direct
    > ###   acyclic graph (DAG)
    > ### Aliases: dDAGlevel
    > 
    > ### ** Examples
    > 
    ...
    > 
    > # 4) calculate the node levels
    > # 4a) definition based on the longest path
    > dDAGlevel(subg, level.mode="longest_path")
    Warning in dDAGlevel(subg, level.mode = "longest_path") :
      The input DAG has multiple roots; recalculate the root after being reversed.
    
    Error in dDAGlevel(subg, level.mode = "longest_path") : 
      Even after automatic reversing, the input DAG still has multiple roots; check the eligibility of the input DAG.
    Execution halted
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

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── 9. Failure ('test-4-imports.R:65:3'): responses to imported objects and funct
      justbuilt(config) not equal to `builds`.
      Lengths differ: 5 is not 4
      
      ── 10. Failure ('test-4-imports.R:75:3'): responses to imported objects and func
      justbuilt(config) not equal to `builds`.
      Lengths differ: 1 is not 4
        ... and 16 more
      
      
      Maximum number of 10 failures reached, some test results may be missing.
      
      ══ DONE ════════════════════════════════════════════════════════════════════════
      Error: Test failures
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

*   checking tests ... ERROR
    ```
      Running ‘test.R’
    Running the tests in ‘tests/test.R’ failed.
    Last 13 lines of output:
        5.       └─testthat:::compare.default(act$val, exp$val, ...)
        6.         ├─base::all.equal(x, y, ...)
        7.         └─base::all.equal.default(x, y, ...)
        8.           └─base::all.equal.list(target, current, ...)
        9.             ├─base::all.equal(...)
       10.             └─base::all.equal.default(...)
       11.               └─base::all.equal.list(target, current, ...)
       12.                 └─base::attr.all.equal(target, current, ...)
       13.                   ├─base::length(target)
       14.                   └─igraph:::length.igraph(target)
       15.                     └─igraph::vcount(x)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 376 ]
      Error: Test failures
      Execution halted
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
    Error in find_partition(graph, igraph::E(graph)$weight, resolution, n.iterations) : 
      REAL() can only be applied to a 'numeric', not a 'NULL'
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. ├─base::suppressWarnings(rleiden.community(exampleGraph, n.cores = 1)) at test_functions.R:19:8
       2. │ └─base::withCallingHandlers(...)
       3. └─leidenAlg::rleiden.community(exampleGraph, n.cores = 1)
       4.   └─sccore::plapply(...)
       5.     └─base::lapply(...)
       6.       └─leidenAlg (local) FUN(X[[i]], ...)
       7.         └─leidenAlg::rleiden.community(...)
       8.           └─leidenAlg::leiden.community(graph, resolution = res, ...)
       9.             └─leidenAlg::find_partition(...)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 3 ]
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
      Error in `leidenbase::leiden_find_partition(igraph, partition_type = "RBConfigurationVertexPartition", 
          node_sizes = nodsiz, seed = 123456, resolution_parameter = 0.5)`: REAL() can only be applied to a 'numeric', not a 'NULL'
      Backtrace:
          ▆
       1. └─leidenbase::leiden_find_partition(...) at test-leidenbase.R:224:2
      ── Error ('test-leidenbase.R:245:3'): modularity and significance return values ──
      Error in `leidenbase::leiden_find_partition(igraph, partition_type = "CPMVertexPartition", 
          seed = 123456, resolution_parameter = 0.1)`: REAL() can only be applied to a 'numeric', not a 'NULL'
      Backtrace:
          ▆
       1. └─leidenbase::leiden_find_partition(...) at test-leidenbase.R:245:2
      
      [ FAIL 11 | WARN 0 | SKIP 0 | PASS 6 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘leidenbase.Rmd’ using rmarkdown
    Quitting from lines 87-92 (leidenbase.Rmd) 
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

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Epoch: Iteration #300 error is: 199.576452337934
      x_max = 1692.55352861469
      y_max = 336.30631387777
      [ FAIL 1 | WARN 22 | SKIP 0 | PASS 73 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-compute_TL.R:25:3'): Computation of trophic levels of norway dataset ──
      V(meta0$metaweb)$TL (`actual`) not equal to V(meta_angola$metaweb)$TL (`expected`).
      
        `actual`: 1.2 1.4 0.9 0.5 0.8 0.8 0.2 0.8 0.9 1.8 and 18 more...
      `expected`: 1.6 1.3 1.8 2.3 1.9 1.9 2.6 1.9 1.9 1.0            ...
      
      [ FAIL 1 | WARN 22 | SKIP 0 | PASS 73 ]
      Error: Test failures
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

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      round(unname(tidys$estimate[1]), 3) not equal to -8.47.
      1/1 mismatches
      [1] -3.79 - -8.47 == 4.68
      ── Failure ('test-model_regression.R:35:3'): glance works correctly for network_reg ──
      round(glances$r.squared, 4) not equal to 0.0575.
      1/1 mismatches
      [1] 0.064 - 0.0575 == 0.0065
      ── Failure ('test-motif_census.R:7:3'): node tie census works ──────────────────
      test[1:4] not equal to rep(0, 4).
      1/4 mismatches
      [2] 1 - 0 == 1
      
      [ FAIL 9 | WARN 0 | SKIP 0 | PASS 544 ]
      Error: Test failures
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
    Error in find_partition(graph, igraph::E(graph)$weight, resolution, n.iterations) : 
      REAL() can only be applied to a 'numeric', not a 'NULL'
    Calls: ndr -> <Anonymous> -> find_partition
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
    
    > ### Name: ssi
    > ### Title: Spectral Segregation Index for Social Networks
    > ### Aliases: ssi
    > 
    > ### ** Examples
    > 
    > if(requireNamespace("igraph", quietly = TRUE)) {
    ...
    + vertex.color= gray(k),
    + vertex.shape=c("circle", "csquare")[a],
    + vertex.label.color="black")
    + legend( "topleft", legend=c("Men", "Women"), pch=c(0,1), col=1)
    + }
    Error in igraph::induced.subgraph(g, which(ids == b)) : 
      At core/core/vector.pmt:1030 : Assertion failed: v->stor_begin != NULL. This is an unexpected igraph error; please report this as a bug, along with the steps to reproduce it.
    Please restart your R session to avoid crashes or other surprising behavior.
    Calls: ssi -> unlist -> lapply -> FUN -> ssib -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Error ('test-ssi.R:4:3'): values of ssi for EF3 data correspond to values from the paper ──
      Error in `igraph::induced.subgraph(g, which(ids == b))`: At core/core/vector.pmt:1030 : Assertion failed: v->stor_begin != NULL. This is an unexpected igraph error; please report this as a bug, along with the steps to reproduce it.
      Please restart your R session to avoid crashes or other surprising behavior.
      Backtrace:
          ▆
       1. └─netseg::ssi(EF3, "race") at test-ssi.R:4:2
       2.   ├─base::unlist(...)
       3.   └─base::lapply(...)
       4.     └─netseg (local) FUN(X[[i]], ...)
       5.       └─netseg:::ssib(g = gg, vattr = vattr, b = val)
       6.         └─igraph::induced.subgraph(g, which(ids == b))
      
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
    At core/core/vector.pmt:483 : Assertion failed: v->stor_begin != NULL. This is an unexpected igraph error; please report this as a bug, along with the steps to reproduce it.
    Please restart your R session to avoid crashes or other surprising behavior.
    --- failed re-building ‘netseg.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘netseg.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# SEMgraph

<details>

* Version: 1.2.0
* GitHub: https://github.com/fernandoPalluzzi/SEMgraph
* Source code: https://github.com/cran/SEMgraph
* Date/Publication: 2023-05-04 16:00:02 UTC
* Number of recursive dependencies: 51

Run `revdepcheck::cloud_details(, "SEMgraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SEMgraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: SEMdag
    > ### Title: Estimate a DAG from an input (or empty) graph
    > ### Aliases: SEMdag
    > 
    > ### ** Examples
    > 
    > 
    ...
    > 
    > # DAG estimation (default values)
    > dag0 <- SEMdag(ig, X)
    WARNING: input graph is not acyclic !
     Applying graph -> DAG conversion...
    DAG conversion : TRUE
    Node Linear Ordering with TO setting
    
    Error: from glmnet C++ code (error code 10000); All penalty factors are <= 0
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
    
    > ### Name: makeGraphDf
    > ### Title: Build a data.frame from a ChangeoClone and an igraph object
    > ###   containing a clonal lineage
    > ### Aliases: makeGraphDf
    > 
    > ### ** Examples
    > 
    ...
    > data(ExampleDb, package = "alakazam")
    > data(ExampleTrees, package = "alakazam")
    > graph <- ExampleTrees[[17]]
    > db <- subset(ExampleDb, clone_id == graph$clone)
    > clone <- alakazam::makeChangeoClone(db)
    > 
    > # Extend data with lineage information
    > df <- makeGraphDf(graph, clone)
    Error: Expecting a single string value: [type=character; extent=0].
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
    
    > ### Name: network.scan
    > ### Title: Network Scan Statistic
    > ### Aliases: network.scan
    > ### Keywords: scanning method
    > 
    > ### ** Examples
    > 
    > data(karate)
    > 
    > ks=network.scan(g=karate,radius=3,attribute=NULL,
    + 	model="pois.stat",pattern="structure")	
    Error in is_directed(graph) : 
      This graph was created by a now unsupported old igraph version.
      Call upgrade_version() before using igraph functions on that object.
    Calls: network.scan -> shortest.paths -> is_directed
    Execution halted
    ```

