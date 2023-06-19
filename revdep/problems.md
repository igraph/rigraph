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
        8.           └─base::all.equal.list(target, current, ...)
        9.             ├─base::all.equal(...)
       10.             └─base::all.equal.default(...)
       11.               └─base::all.equal.list(target, current, ...)
       12.                 └─base::attr.all.equal(target, current, ...)
       13.                   ├─base::length(target)
       14.                   └─igraph:::length.igraph(target)
       15.                     └─igraph::vcount(x)
       16.                       └─igraph:::ensure_igraph(graph)
       17.                         └─igraph::is_igraph(graph)
       18.                           └─igraph:::warn_version(graph)
      
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
    This graph was created by an old(er) igraph version.
      Call upgrade_graph() on it to use with the current igraph version
      For now we convert it on the fly...
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

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(netseg)
      > 
      > test_check("netseg")
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 73 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-smi.R:5:3'): SMI works ───────────────────────────────────────
      `smi(as.directed(WhiteKinship), "gender")` produced messages.
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 73 ]
      Error: Test failures
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
    Error in warn_version(graph) : 
      This graph was created by a now unsupported old igraph version.
      Call upgrade_version() before using igraph functions on that object.
    Calls: network.scan ... shortest.paths -> ensure_igraph -> is_igraph -> warn_version
    Execution halted
    ```

