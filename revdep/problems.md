# archeofrag

<details>

* Version: 1.2.0
* GitHub: https://github.com/sebastien-plutniak/archeofrag
* Source code: https://github.com/cran/archeofrag
* Date/Publication: 2025-03-27 11:50:25 UTC
* Number of recursive dependencies: 62

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
    Error in `vctrs::vec_c()`:
    ! Can't combine `..1` <double> and `..2` <character>.
    Backtrace:
         ▆
      1. ├─archeofrag::frag.simul.process(...)
      2. │ └─igraph::disjoint_union(g.layer1, g.layer2)
      3. │   └─vctrs::vec_c(attr[[exattr[a]]], va[[exattr[a]]])
      4. └─vctrs (local) `<fn>`()
      5.   └─vctrs::vec_default_ptype2(...)
      6.     ├─base::withRestarts(...)
      7.     │ └─base (local) withOneRestart(expr, restarts[[1L]])
      8.     │   └─base (local) doWithOneRestart(return(expr), restart)
      9.     └─vctrs::stop_incompatible_type(...)
     10.       └─vctrs:::stop_incompatible(...)
     11.         └─vctrs:::stop_vctrs(...)
     12.           └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = call)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(archeofrag)
      > 
      > test_check("archeofrag")
      More than 2 layers: the 'frag.edges.weighting' function is applied to each pair of layers.
      More than 2 layers: the 'frag.edges.weighting' function is applied to each pair of layers.
      More than 2 layers: the 'frag.edges.weighting' function is applied to each pair of layers.
      More than 2 layers: the 'frag.edges.weighting' function is applied to each pair of layers.
      [ FAIL 9 | WARN 0 | SKIP 0 | PASS 58 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-frag.graph.reduce.R:24:3'): reduce vertice number (not conserving objects nr) ──
      <vctrs_error_ptype2/vctrs_error_incompatible_type/vctrs_error_incompatible/vctrs_error/rlang_error/error/condition>
      Error in `vctrs::vec_c(attr[[exattr[a]]], va[[exattr[a]]])`: Can't combine `..1` <double> and `..2` <character>.
      Backtrace:
           ▆
        1. ├─archeofrag::frag.simul.process(...) at test-frag.graph.reduce.R:24:3
        2. │ └─igraph::disjoint_union(g.layer1, g.layer2)
        3. │   └─vctrs::vec_c(attr[[exattr[a]]], va[[exattr[a]]])
        4. └─vctrs (local) `<fn>`()
        5.   └─vctrs::vec_default_ptype2(...)
        6.     ├─base::withRestarts(...)
        7.     │ └─base (local) withOneRestart(expr, restarts[[1L]])
        8.     │   └─base (local) doWithOneRestart(return(expr), restart)
        9.     └─vctrs::stop_incompatible_type(...)
       10.       └─vctrs:::stop_incompatible(...)
       11.         └─vctrs:::stop_vctrs(...)
       12.           └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = call)
      ── Error ('test-frag.graph.reduce.R:33:3'): reduce vertice number (conserving objects nr, conserving fragments balance) ──
      <vctrs_error_ptype2/vctrs_error_incompatible_type/vctrs_error_incompatible/vctrs_error/rlang_error/error/condition>
      Error in `vctrs::vec_c(attr[[exattr[a]]], va[[exattr[a]]])`: Can't combine `..1` <double> and `..2` <character>.
      Backtrace:
           ▆
        1. ├─archeofrag::frag.simul.process(...) at test-frag.graph.reduce.R:33:3
        2. │ └─igraph::disjoint_union(g.layer1, g.layer2)
        3. │   └─vctrs::vec_c(attr[[exattr[a]]], va[[exattr[a]]])
        4. └─vctrs (local) `<fn>`()
        5.   └─vctrs::vec_default_ptype2(...)
        6.     ├─base::withRestarts(...)
        7.     │ └─base (local) withOneRestart(expr, restarts[[1L]])
        8.     │   └─base (local) doWithOneRestart(return(expr), restart)
        9.     └─vctrs::stop_incompatible_type(...)
       10.       └─vctrs:::stop_incompatible(...)
       11.         └─vctrs:::stop_vctrs(...)
       12.           └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = call)
      ── Error ('test-frag.graph.reduce.R:48:3'): reduce vertice number (conserving fragments balance and inter-units connection) ──
      <vctrs_error_ptype2/vctrs_error_incompatible_type/vctrs_error_incompatible/vctrs_error/rlang_error/error/condition>
      Error in `vctrs::vec_c(attr[[exattr[a]]], va[[exattr[a]]])`: Can't combine `..1` <double> and `..2` <character>.
      Backtrace:
           ▆
        1. ├─archeofrag::frag.simul.process(...) at test-frag.graph.reduce.R:48:3
        2. │ └─igraph::disjoint_union(g.layer1, g.layer2)
        3. │   └─vctrs::vec_c(attr[[exattr[a]]], va[[exattr[a]]])
        4. └─vctrs (local) `<fn>`()
        5.   └─vctrs::vec_default_ptype2(...)
        6.     ├─base::withRestarts(...)
        7.     │ └─base (local) withOneRestart(expr, restarts[[1L]])
        8.     │   └─base (local) doWithOneRestart(return(expr), restart)
        9.     └─vctrs::stop_incompatible_type(...)
       10.       └─vctrs:::stop_incompatible(...)
       11.         └─vctrs:::stop_vctrs(...)
       12.           └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = call)
      ── Error ('test-frag.simul.compare.R:5:3'): frag.simul.compare works ───────────
      <vctrs_error_ptype2/vctrs_error_incompatible_type/vctrs_error_incompatible/vctrs_error/rlang_error/error/condition>
      Error in `vctrs::vec_c(attr[[exattr[a]]], va[[exattr[a]]])`: Can't combine `..1` <double> and `..2` <character>.
      Backtrace:
           ▆
        1. ├─archeofrag::frag.simul.process(...) at test-frag.simul.compare.R:5:3
        2. │ └─igraph::disjoint_union(g.layer1, g.layer2)
        3. │   └─vctrs::vec_c(attr[[exattr[a]]], va[[exattr[a]]])
        4. └─vctrs (local) `<fn>`()
        5.   └─vctrs::vec_default_ptype2(...)
        6.     ├─base::withRestarts(...)
        7.     │ └─base (local) withOneRestart(expr, restarts[[1L]])
        8.     │   └─base (local) doWithOneRestart(return(expr), restart)
        9.     └─vctrs::stop_incompatible_type(...)
       10.       └─vctrs:::stop_incompatible(...)
       11.         └─vctrs:::stop_vctrs(...)
       12.           └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = call)
      ── Error ('test-frag.simul.process.R:44:3'): parameters of a generated graph with 2 initial layers are correct ──
      <vctrs_error_ptype2/vctrs_error_incompatible_type/vctrs_error_incompatible/vctrs_error/rlang_error/error/condition>
      Error in `vctrs::vec_c(attr[[exattr[a]]], va[[exattr[a]]])`: Can't combine `..1` <double> and `..2` <character>.
      Backtrace:
           ▆
        1. ├─archeofrag::frag.simul.process(...) at test-frag.simul.process.R:44:3
        2. │ └─igraph::disjoint_union(g.layer1, g.layer2)
        3. │   └─vctrs::vec_c(attr[[exattr[a]]], va[[exattr[a]]])
        4. └─vctrs (local) `<fn>`()
        5.   └─vctrs::vec_default_ptype2(...)
        6.     ├─base::withRestarts(...)
        7.     │ └─base (local) withOneRestart(expr, restarts[[1L]])
        8.     │   └─base (local) doWithOneRestart(return(expr), restart)
        9.     └─vctrs::stop_incompatible_type(...)
       10.       └─vctrs:::stop_incompatible(...)
       11.         └─vctrs:::stop_vctrs(...)
       12.           └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = call)
      ── Error ('test-frag.simul.process.R:56:3'): admixture and cohesion values of a graph with 2 initial layers are correct ──
      <vctrs_error_ptype2/vctrs_error_incompatible_type/vctrs_error_incompatible/vctrs_error/rlang_error/error/condition>
      Error in `vctrs::vec_c(attr[[exattr[a]]], va[[exattr[a]]])`: Can't combine `..1` <double> and `..2` <character>.
      Backtrace:
           ▆
        1. ├─archeofrag::frag.simul.process(...) at test-frag.simul.process.R:56:3
        2. │ └─igraph::disjoint_union(g.layer1, g.layer2)
        3. │   └─vctrs::vec_c(attr[[exattr[a]]], va[[exattr[a]]])
        4. └─vctrs (local) `<fn>`()
        5.   └─vctrs::vec_default_ptype2(...)
        6.     ├─base::withRestarts(...)
        7.     │ └─base (local) withOneRestart(expr, restarts[[1L]])
        8.     │   └─base (local) doWithOneRestart(return(expr), restart)
        9.     └─vctrs::stop_incompatible_type(...)
       10.       └─vctrs:::stop_incompatible(...)
       11.         └─vctrs:::stop_vctrs(...)
       12.           └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = call)
      ── Error ('test-frag.simul.process.R:67:3'): the optional asymmetric.transport.from parameter works ──
      <vctrs_error_ptype2/vctrs_error_incompatible_type/vctrs_error_incompatible/vctrs_error/rlang_error/error/condition>
      Error in `vctrs::vec_c(attr[[exattr[a]]], va[[exattr[a]]])`: Can't combine `..1` <double> and `..2` <character>.
      Backtrace:
           ▆
        1. ├─archeofrag::frag.simul.process(...) at test-frag.simul.process.R:67:3
        2. │ └─igraph::disjoint_union(g.layer1, g.layer2)
        3. │   └─vctrs::vec_c(attr[[exattr[a]]], va[[exattr[a]]])
        4. └─vctrs (local) `<fn>`()
        5.   └─vctrs::vec_default_ptype2(...)
        6.     ├─base::withRestarts(...)
        7.     │ └─base (local) withOneRestart(expr, restarts[[1L]])
        8.     │   └─base (local) doWithOneRestart(return(expr), restart)
        9.     └─vctrs::stop_incompatible_type(...)
       10.       └─vctrs:::stop_incompatible(...)
       11.         └─vctrs:::stop_vctrs(...)
       12.           └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = call)
      ── Error ('test-frag.simul.process.R:84:3'): the optional from.observed.graph parameter works ──
      <vctrs_error_ptype2/vctrs_error_incompatible_type/vctrs_error_incompatible/vctrs_error/rlang_error/error/condition>
      Error in `vctrs::vec_c(attr[[exattr[a]]], va[[exattr[a]]])`: Can't combine `..1` <double> and `..2` <character>.
      Backtrace:
           ▆
        1. ├─archeofrag::frag.simul.process(...) at test-frag.simul.process.R:84:3
        2. │ └─igraph::disjoint_union(g.layer1, g.layer2)
        3. │   └─vctrs::vec_c(attr[[exattr[a]]], va[[exattr[a]]])
        4. └─vctrs (local) `<fn>`()
        5.   └─vctrs::vec_default_ptype2(...)
        6.     ├─base::withRestarts(...)
        7.     │ └─base (local) withOneRestart(expr, restarts[[1L]])
        8.     │   └─base (local) doWithOneRestart(return(expr), restart)
        9.     └─vctrs::stop_incompatible_type(...)
       10.       └─vctrs:::stop_incompatible(...)
       11.         └─vctrs:::stop_vctrs(...)
       12.           └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = call)
      ── Error ('test-frag.simul.summarise.R:4:3'): parameters of a constrained generated graph with 1 initial layer are correct ──
      <vctrs_error_ptype2/vctrs_error_incompatible_type/vctrs_error_incompatible/vctrs_error/rlang_error/error/condition>
      Error in `vctrs::vec_c(attr[[exattr[a]]], va[[exattr[a]]])`: Can't combine `..1` <double> and `..2` <character>.
      Backtrace:
           ▆
        1. ├─archeofrag::frag.simul.process(...) at test-frag.simul.summarise.R:4:3
        2. │ └─igraph::disjoint_union(g.layer1, g.layer2)
        3. │   └─vctrs::vec_c(attr[[exattr[a]]], va[[exattr[a]]])
        4. └─vctrs (local) `<fn>`()
        5.   └─vctrs::vec_default_ptype2(...)
        6.     ├─base::withRestarts(...)
        7.     │ └─base (local) withOneRestart(expr, restarts[[1L]])
        8.     │   └─base (local) doWithOneRestart(return(expr), restart)
        9.     └─vctrs::stop_incompatible_type(...)
       10.       └─vctrs:::stop_incompatible(...)
       11.         └─vctrs:::stop_vctrs(...)
       12.           └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = call)
      
      [ FAIL 9 | WARN 0 | SKIP 0 | PASS 58 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘archeofrag-vignette.Rmd’ using rmarkdown
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 3 marked UTF-8 strings
    ```

# CITMIC

<details>

* Version: 0.1.2
* GitHub: NA
* Source code: https://github.com/cran/CITMIC
* Date/Publication: 2024-11-08 12:20:02 UTC
* Number of recursive dependencies: 34

Run `revdepcheck::cloud_details(, "CITMIC")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘CITMIC.Rmd’ using rmarkdown
    
    Quitting from CITMIC.Rmd:38-49 [unnamed-chunk-2]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    NULL
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Error: processing vignette 'CITMIC.Rmd' failed with diagnostics:
    `name` must be a single string, not `TRUE`.
    --- failed re-building ‘CITMIC.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘CITMIC.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# dosearch

<details>

* Version: 1.0.11
* GitHub: https://github.com/santikka/dosearch
* Source code: https://github.com/cran/dosearch
* Date/Publication: 2024-07-16 09:50:02 UTC
* Number of recursive dependencies: 90

Run `revdepcheck::cloud_details(, "dosearch")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > #' @srrstats {G5.2} Error and warning behavior is tested.
      > #' @srrstats {G5.2a} Messages are unique.
      > #' @srrstats {G5.2b} Conditions are demonstrated.
      > #' @srrstats {G5.4, G5.4a, G5.6} Output of dosearch is compared against known
      > #'   theoretical identifiability and non-identifiability results.
      > #'   In other words, correctness can be tested independently of the
      > #'   implementation.
      > #' @srrstats {G5.5} The algorithm is deterministic, so this could also be NA
      > #' @srrstats {G5.6a} Because the package output is symbolic, the recovery
      > #'   of e.g., a causal effect is exact.
      > #' @srrstats {G5.7} Performance and scalability have been demonstrated
      > #'   in the JSS paper, and the simulations are too large to run on a single
      > #'   PC and require a cluster. The replication materials for this simulation
      > #'   are included in the 'rep' directory. The algorithm has exponential
      > #'   time and memory complexity in the number of the vertices of the graph,
      > #'   and it has been hypothesized that the general identifiability problem
      > #'   itself is NP-hard.
      > #' @srrstats {G5.8, G5.8a G5.8b, G5.8c, G5.8d} Edge conditions are tested.
      > #' @srrstats {NW6.0} Inputs types are tested.
      > #' @noRd
      > library(testthat)
      > library(dosearch)
      > 
      > test_check("dosearch")
      [ FAIL 1 | WARN 3 | SKIP 0 | PASS 294 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-interface.R:32:3'): igraph graph without names gets named ──────
      Error in `FUN(X[[i]], ...)`: Error: Logical index length does not match the number of edges. Recycling is not allowed.
      Backtrace:
           ▆
        1. ├─testthat::expect_message(parse_graph(g_igraph), "Argument `graph` is not named, node names have been assigned") at test-interface.R:32:3
        2. │ └─testthat:::expect_condition_matching(...)
        3. │   └─testthat:::quasi_capture(...)
        4. │     ├─testthat (local) .capture(...)
        5. │     │ └─base::withCallingHandlers(...)
        6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        7. └─dosearch:::parse_graph(g_igraph)
        8.   ├─e[(is.na(description) | description != "U")]
        9.   └─igraph:::`[.igraph.es`(...)
       10.     └─base::lapply(...)
       11.       └─igraph (local) FUN(X[[i]], ...)
       12.         └─cli::cli_abort("Error: Logical index length does not match the number of edges. Recycling is not allowed.")
       13.           └─rlang::abort(...)
      
      [ FAIL 1 | WARN 3 | SKIP 0 | PASS 294 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.9Mb
      sub-directories of 1Mb or more:
        libs   5.0Mb
    ```

# DrDimont

<details>

* Version: 0.1.4
* GitHub: NA
* Source code: https://github.com/cran/DrDimont
* Date/Publication: 2022-09-23 15:40:02 UTC
* Number of recursive dependencies: 124

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
    > WGCNA::disableWGCNAThreads()
    > ## End(Don't show)
    > 
    > data(layers_example)
    > data(correlation_matrices_example)
    > 
    > example_settings <- drdimont_settings(
    +                         handling_missing_data=list(
    +                             default="pairwise.complete.obs",
    +                             mrna="all.obs"),
    +                         reduction_method="pickHardThreshold",
    +                         r_squared=list(default=0.65, metabolite=0.1),
    +                         cut_vector=list(default=seq(0.2, 0.5, 0.01)))
    [25-07-10 09:23:08] WARNING: Python executable in virtual environment 'r-DrDimont' not found. Either run `install_python_dependencies(package_manager='pip') or set `conda=TRUE` in `drdimont_settings()` if conda installation was used.
    > 
    > example_individual_graphs <- generate_individual_graphs(
    +                                  correlation_matrices=correlation_matrices_example,
    +                                  layers=layers_example, 
    +                                  settings=example_settings)
    [25-07-10 09:23:08] Generating graph of layer mrna for groupA...
    [25-07-10 09:23:08] Reducing network by WGCNA::pickHardThreshold...
    [25-07-10 09:23:08] R2 cutoff: 0.65
    [25-07-10 09:23:08] Cut Threshold: 0.26
    Error in `graph_from_adjacency_matrix()`:
    ! Cannot create a graph object because the adjacency matrix contains
      NAs.
    Backtrace:
        ▆
     1. └─DrDimont::generate_individual_graphs(...)
     2.   └─DrDimont::generate_reduced_graph(...)
     3.     └─igraph::graph.adjacency(...)
     4.       └─igraph::graph_from_adjacency_matrix(...)
     5.         └─igraph:::ensure_no_na(adjmatrix, "adjacency matrix")
     6.           └─cli::cli_abort(...)
     7.             └─rlang::abort(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘DrDimont_Vignette.Rmd’ using rmarkdown
    
    Quitting from DrDimont_Vignette.Rmd:327-333 [Individual graphs]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    NULL
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Error: processing vignette 'DrDimont_Vignette.Rmd' failed with diagnostics:
    Cannot create a graph object because the adjacency matrix contains NAs.
    --- failed re-building ‘DrDimont_Vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘DrDimont_Vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# FCMapper

<details>

* Version: 1.1
* GitHub: NA
* Source code: https://github.com/cran/FCMapper
* Date/Publication: 2016-02-12 07:40:47
* Number of recursive dependencies: 11

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
    > matrix = matrix(nrow=7,ncol=7)
    > matrix[1,] = c(0,-0.5,0,0,1,0,1)
    > matrix[2,] = c(1,0,1,0.2,0,0,0.6)
    > matrix[3,] = c(0,1,0,0,0,0,0)
    > matrix[4,] = c(0.6,0,0,1,0,0,0.1)
    > matrix[5,] = c(0,0.5,0,0,1,0,-0.6) 
    > matrix[6,] = c(0,0,-1,0,0,0,0)
    > matrix[7,] = c(0,0,0,-0.5,0,0,1)
    > concept.names = c("A","B","C","D","E","F","G")
    > 
    > results = nochanges.scenario(matrix,iter=25,concept.names)
    > 
    > graph.fcm(matrix,concept.sizes=results$Equilibrium_value,concept.names)
    Warning: Non-positive edge weight found, ignoring all weights during graph layout.
    Warning in rep(no, length.out = len) :
      'x' is NULL so the result will be NULL
    Error in ans[npos] <- rep(no, length.out = len)[npos] : 
      replacement has length zero
    Calls: graph.fcm ... .tkplot.update.vertex -> .tkplot.update.edge -> ifelse
    Execution halted
    ```

# GephiForR

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/GephiForR
* Date/Publication: 2024-08-27 16:50:06 UTC
* Number of recursive dependencies: 13

Run `revdepcheck::cloud_details(, "GephiForR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘GephiForR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: rotate_layout
    > ### Title: Rotate layout positions by a custom angle
    > ### Aliases: rotate_layout
    > 
    > ### ** Examples
    > 
    > 
    > # Create a random graph
    > library(igraph)
    
    Attaching package: ‘igraph’
    
    The following objects are masked from ‘package:stats’:
    
        decompose, spectrum
    
    The following object is masked from ‘package:base’:
    
        union
    
    > g <- erdos.renyi.game(100, 0.05)
    > 
    > # Initializing position vector and plotting
    > position <- as.matrix(data.frame(X = c(1, 2, 3), Y = c(4, 5, 6)))
    > plot(g, layout = position)
    Error in `plot()`:
    ! The layout has 3 rows, but the graph has 100 vertices.
    ℹ It is recommended to store the layout as x and y vertex attributes and not as
      a matrix graph attribute.
    Backtrace:
        ▆
     1. ├─base::plot(g, layout = position)
     2. └─igraph::plot.igraph(g, layout = position)
     3.   └─cli::cli_abort(...)
     4.     └─rlang::abort(...)
    Execution halted
    ```

# gor

<details>

* Version: 1.0
* GitHub: NA
* Source code: https://github.com/cran/gor
* Date/Publication: 2023-05-03 18:40:02 UTC
* Number of recursive dependencies: 11

Run `revdepcheck::cloud_details(, "gor")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘gor-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: generate_fundamental_cycles
    > ### Title: Generate fundamental cycles in a connected graph
    > ### Aliases: generate_fundamental_cycles
    > 
    > ### ** Examples
    > 
    > g <- make_graph("Dodecahedron")
    > n <- gorder(g)
    > b <- bfs(g, 1, father = TRUE)                 # BFS tree
    Warning: The `father` argument of `bfs()` is deprecated as of igraph 2.2.0.
    ℹ Please use the `parent` argument instead.
    > T <- make_graph(rbind(b$father[2:n], 2:n), n) # Tree as igraph graph
    > eT <- as_edgelist(T)
    > eG <- as_edgelist(g)
    > C <- generate_fundamental_cycles(eT, eG)      # Fundamental cycles
    > mu <- gsize(g) - gorder(g) + 1                # Cyclomatic number
    > z <- layout_with_gem(g)
    > for (i in 1:mu) {                             # Cycle drawing
    +     c1 <- make_graph(t(eG[which(C[i,] == 1),]) , dir = FALSE)
    +     plot(g, layout = z)
    +     plot(c1, layout = z, add = TRUE, edge.color = "cyan4",
    +          edge.lty = "dashed", edge.width = 3)
    +     title(paste0("Cycle ", i, " of ", mu))
    +     #Sys.sleep(1) # Adjust time to see the cycles
    + }
    Error in `plot()`:
    ! The layout has 20 rows, but the graph has 5 vertices.
    ℹ It is recommended to store the layout as x and y vertex attributes and not as
      a matrix graph attribute.
    Backtrace:
        ▆
     1. ├─base::plot(...)
     2. └─igraph::plot.igraph(...)
     3.   └─cli::cli_abort(...)
     4.     └─rlang::abort(...)
    Execution halted
    ```

# handwriterRF

<details>

* Version: 1.1.1
* GitHub: https://github.com/CSAFE-ISU/handwriterRF
* Source code: https://github.com/cran/handwriterRF
* Date/Publication: 2025-01-29 00:20:01 UTC
* Number of recursive dependencies: 123

Run `revdepcheck::cloud_details(, "handwriterRF")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > # This file is part of the standard setup for testthat.
      > # It is recommended that you do not modify it.
      > #
      > # Where should you do additional test configuration?
      > # Learn more about the roles of various files in:
      > # * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
      > # * https://testthat.r-lib.org/articles/special-files.html
      > 
      > library(testthat)
      > library(handwriterRF)
      > 
      > test_check("handwriterRF")
      Copying samples to project directory > docs...
      
      Estimating writer profiles...
      Listing documents to be processed...
      Creating output directory...
      Directory already exists.
      Processing document w0030_s01_pWOZ_r01.png...
      path in readPNGBinary: /tmp/RtmpSZltDI/comparison/docs/w0030_s01_pWOZ_r01.png
      Starting Processing...
      Getting Nodes...
      Skeletonizing writing...
      Splitting document into components...
      Merging nodes...
      Finding paths...
      Split paths into graphs...
      Organizing graphs...
      Creating graph lists...
      Adding character features...
      Document processing complete
      Saving processed document w0030_s01_pWOZ_r01.png...
      
      Processing document w0030_s01_pWOZ_r02.png...
      path in readPNGBinary: /tmp/RtmpSZltDI/comparison/docs/w0030_s01_pWOZ_r02.png
      Starting Processing...
      Getting Nodes...
      Skeletonizing writing...
      Splitting document into components...
      Merging nodes...
      Finding paths...
      Split paths into graphs...
      Organizing graphs...
      Creating graph lists...
      Adding character features...
      Document processing complete
      Saving processed document w0030_s01_pWOZ_r02.png...
      
      All documents were successfully processed...
      
      Loading graphs for w0030_s01_pWOZ_r01_proclist.rds
      Getting cluster assignments for w0030_s01_pWOZ_r01
      Saving cluster assignments for  w0030_s01_pWOZ_r01 
      
      Loading graphs for w0030_s01_pWOZ_r02_proclist.rds
      Getting cluster assignments for w0030_s01_pWOZ_r02
      Saving cluster assignments for  w0030_s01_pWOZ_r02 
      
      Calculating distance between samples...
      Calculating similarity score...
      Calculating distance between samples...
      Calculating similarity score...
      Calculating distance between samples...
      Calculating similarity score...
      Calculating distance between samples...
      Calculating similarity score...
      Calculating SLR...
      Calculating distance between samples...
      Calculating similarity score...
      Calculating SLR...
      Killed
    ```

# pathfindR

<details>

* Version: 2.5.0
* GitHub: https://github.com/egeulgen/pathfindR
* Source code: https://github.com/cran/pathfindR
* Date/Publication: 2025-06-15 00:00:02 UTC
* Number of recursive dependencies: 147

Run `revdepcheck::cloud_details(, "pathfindR")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat-active_snw.R’
      Running ‘testthat-clustering.R’
    Running the tests in ‘tests/testthat-clustering.R’ failed.
    Complete output:
      > library(testthat)
      > library(pathfindR)
      Loading required package: pathfindR.data
      ##############################################################################
                              Welcome to pathfindR!
      
      Please cite the article below if you use pathfindR in published reseach:
      
      Ulgen E, Ozisik O, Sezerman OU. 2019. pathfindR: An R Package for Comprehensive
      Identification of Enriched Pathways in Omics Data Through Active Subnetworks.
      Front. Genet. doi:10.3389/fgene.2019.00858
      
      ##############################################################################
      > 
      > test_check("pathfindR", filter = "clustering")
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 77 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-clustering.R:198:5'): `cluster_graph_vis()` -- coloring of 'extra' clusters work ──
      Error in `igraph::graph_from_adjacency_matrix(kappa_mat2, weighted = TRUE)`: Cannot create a graph object because the adjacency matrix contains NAs.
      Backtrace:
           ▆
        1. ├─testthat::expect_silent(...) at test-clustering.R:198:5
        2. │ └─testthat:::quasi_capture(enquo(object), NULL, evaluate_promise)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ ├─withr::with_output_sink(...)
        5. │   │ │ └─base::force(code)
        6. │   │ ├─base::withCallingHandlers(...)
        7. │   │ └─base::withVisible(code)
        8. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        9. └─pathfindR::cluster_graph_vis(...)
       10.   └─igraph::graph_from_adjacency_matrix(kappa_mat2, weighted = TRUE)
       11.     └─igraph:::ensure_no_na(adjmatrix, "adjacency matrix")
       12.       └─cli::cli_abort(...)
       13.         └─rlang::abort(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 77 ]
      Error: Test failures
      Execution halted
    ```

# PopComm

<details>

* Version: 0.1.0.1
* GitHub: NA
* Source code: https://github.com/cran/PopComm
* Date/Publication: 2025-04-25 15:20:09 UTC
* Number of recursive dependencies: 172

Run `revdepcheck::cloud_details(, "PopComm")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘PopComm-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: circle_plot
    > ### Title: Plot Circular Ligand-Receptor Interaction Network
    > ### Aliases: circle_plot
    > 
    > ### ** Examples
    > 
    > # Plot Circular Cell-Cell Interaction Network
    > data(filtered_lr_eg)
    > p <- circle_plot(filtered_lr_eg, edge_width = "count", show_self_interactions = TRUE)
    Warning: edge attribute loop.angle contains NAs. Replacing with default value
    Error in p[[type]][[name]][is.na(p[[type]][[name]])] <- i.default.values[[type]][[name]] : 
      replacement has length zero
    Calls: circle_plot -> plot -> plot.igraph -> params
    Execution halted
    ```

