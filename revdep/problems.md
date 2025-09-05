# AnimalHabitatNetwork

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/AnimalHabitatNetwork
* Date/Publication: 2019-11-25 19:40:02 UTC
* Number of recursive dependencies: 27

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
    Error in `graph_from_adjacency_matrix()`:
    ! Cannot create a graph object because the adjacency matrix contains
      NAs.
    Backtrace:
        ▆
     1. └─AnimalHabitatNetwork::ahn_gen(N = 10, L = 5, mu = 1, lamda = 5)
     2.   └─igraph::graph_from_adjacency_matrix(ahn_wei_matrix, mode = "undirected", diag = FALSE, weighted = TRUE)
     3.     └─igraph:::ensure_no_na(adjmatrix, "adjacency matrix")
     4.       └─cli::cli_abort(...)
     5.         └─rlang::abort(...)
    Execution halted
    ```

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

# cfid

<details>

* Version: 0.1.7
* GitHub: https://github.com/santikka/cfid
* Source code: https://github.com/cran/cfid
* Date/Publication: 2023-11-27 16:00:04 UTC
* Number of recursive dependencies: 46

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
      ── Failure ('test-graphs.R:166:3'): causaleffect syntax with igraph supported ──
      import_graph(ig) (`actual`) not identical to dag("X -> Z -> Y X <-> Y") (`expected`).
      
        `dim(actual)`: 5 5
      `dim(expected)`: 4 4
      
      `attr(actual, 'labels')[2:5]`:   "Z" "Y" "U[X,Y]" "U[Z,Y]"
      `attr(expected, 'labels')[2:4]`: "Z" "Y" "U[X,Y]"         
      
      `attr(actual, 'latent')[2:5]`:   FALSE FALSE TRUE TRUE
      `attr(expected, 'latent')[2:4]`: FALSE FALSE TRUE     
      
        `attr(actual, 'order')`: 4 5 3 1 2
      `attr(expected, 'order')`: 4 1 2 3  
      
      `attr(actual, 'text')`:   "X; Z; Y; X -> Z; Y -> X; X <-> Y; Z <-> Y"
      `attr(expected, 'text')`: "X; Z; Y; X -> Z; Z -> Y; X <-> Y"         
      
              `actual`: 0 0 1 1 0 1 0 0 0 1 and 15 more...
      `expected[2:16]`: 0 0 1 1 0 0 0 0 1 0            ...
      
      [ FAIL 1 | WARN 4 | SKIP 0 | PASS 203 ]
      Error: Test failures
      Execution halted
    ```

# cglasso

<details>

* Version: 2.0.7
* GitHub: NA
* Source code: https://github.com/cran/cglasso
* Date/Publication: 2024-02-12 08:40:02 UTC
* Number of recursive dependencies: 12

Run `revdepcheck::cloud_details(, "cglasso")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘cglasso-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot.cglasso2igraph
    > ### Title: Plot Method for a cglasso2igraph Object"
    > ### Aliases: plot.cglasso2igraph
    > ### Keywords: graphs
    > 
    > ### ** Examples
    > 
    > set.seed(123)
    > # Y ~ N(0, Sigma) and probability of left/right censored values equal to 0.05
    > n <- 100L
    > p <- 3L
    > rho <- 0.3
    > Sigma <- outer(1L:p, 1L:p, function(i, j) rho^abs(i - j))
    > Z <- rcggm(n = n, Sigma = Sigma, probl = 0.05, probr = 0.05)
    > out <- cglasso(. ~ ., data = Z)
    > out.graph <- to_graph(out)
    > plot(out.graph, type = "Gyy")
    Warning: vertex attribute color contains NAs. Replacing with default value 1
    Warning: vertex attribute frame.color contains NAs. Replacing with default value black
    > 
    > out.graph <- to_graph(out, weighted = TRUE)
    > plot(out.graph,  type = "Gyy")
    Warning: Non-positive edge weight found, ignoring all weights during graph layout.
    Warning: vertex attribute color contains NAs. Replacing with default value 1
    Warning: vertex attribute frame.color contains NAs. Replacing with default value black
    > 
    > 
    > # Y ~ N(b0 +XB, Sigma)  and probability of left/right censored values equal to 0.05
    > n <- 100L
    > p <- 3L
    > q <- 2L
    > b0 <- runif(p)
    > B <- matrix(runif(q * p), nrow = q, ncol = p)
    > X <- matrix(rnorm(n * q), nrow = n, ncol = q)
    > rho <- 0.3
    > Sigma <- outer(1L:p, 1L:p, function(i, j) rho^abs(i - j))
    > Z <- rcggm(n = n, b0 = b0, X = X, B = B, Sigma = Sigma, probl = 0.05, probr = 0.05)
    > out <- cglasso(. ~ ., data = Z)
    > out.graph <- to_graph(out, lambda.id = 3, rho.id = 3, weighted = TRUE)
    > plot(out.graph, type = "Gyy")
    Warning: Non-positive edge weight found, ignoring all weights during graph layout.
    Error in (function (graph, root = numeric(), circular = FALSE, rootlevel = numeric(),  : 
      unused argument (weights = NA)
    Calls: plot ... i.postprocess.layout -> %in% -> params -> ret -> v -> do.call
    Execution halted
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

# DiagrammeR

<details>

* Version: 1.0.11
* GitHub: https://github.com/rich-iannone/DiagrammeR
* Source code: https://github.com/cran/DiagrammeR
* Date/Publication: 2024-02-02 23:30:03 UTC
* Number of recursive dependencies: 79

Run `revdepcheck::cloud_details(, "DiagrammeR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘DiagrammeR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_leverage_centrality
    > ### Title: Get leverage centrality
    > ### Aliases: get_leverage_centrality
    > 
    > ### ** Examples
    > 
    > # Create a random graph using the
    > # `add_gnm_graph()` function
    > graph <-
    +   create_graph(
    +     directed = FALSE) %>%
    +   add_gnm_graph(
    +     n = 10,
    +     m = 15,
    +     set_seed = 23)
    > 
    > # Get leverage centrality values
    > # for all nodes in the graph
    > graph %>%
    +   get_leverage_centrality()
    Error in `purrr::map()`:
    ℹ In index: 1.
    Caused by error in `igraph::neighbors()`:
    ! Can't find vertex corresponding to `v`.
    Backtrace:
         ▆
      1. ├─graph %>% get_leverage_centrality()
      2. ├─DiagrammeR::get_leverage_centrality(.)
      3. │ ├─... %>% unlist()
      4. │ └─purrr::map(...)
      5. │   └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
      6. │     ├─purrr:::with_indexed_errors(...)
      7. │     │ └─base::withCallingHandlers(...)
      8. │     ├─purrr:::call_with_cleanup(...)
      9. │     └─DiagrammeR (local) .f(.x[[i]], ...)
     10. │       ├─base::mean(...)
     11. │       └─igraph::neighbors(ig_graph, degree_vals)
     12. │         └─igraph:::check_vertex(v)
     13. │           └─cli::cli_abort(...)
     14. │             └─rlang::abort(...)
     15. └─base::unlist(.)
    Execution halted
    ```

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
      > library(DiagrammeR)
      > 
      > test_check("DiagrammeR")
      [ FAIL 1 | WARN 3 | SKIP 24 | PASS 1696 ]
      
      ══ Skipped tests (24) ══════════════════════════════════════════════════════════
      • On CRAN (24): 'test-add_forward_reverse_edges.R:94:3',
        'test-add_graphs.R:41:3', 'test-add_graphs.R:262:3',
        'test-add_graphs.R:1787:3', 'test-add_nodes_edges_from_table.R:684:3',
        'test-cache_attrs.R:38:3', 'test-colorize_nodes_edges.R:415:3',
        'test-create_combine_nodes.R:88:3', 'test-create_subgraph.R:73:3',
        'test-delete_node_edge.R:286:3',
        'test-get_select_last_nodes_edges_created.R:135:3',
        'test-graph_series.R:361:3', 'test-graph_validation.R:17:3',
        'test-graph_validation.R:241:3', 'test-graph_validation.R:301:3',
        'test-render_graph.R:3:3', 'test-selections.R:163:3',
        'test-set_get_node_edge_attrs.R:332:3', 'test-similarity_measures.R:106:3',
        'test-similarity_measures.R:126:3', 'test-transform_graph.R:138:3',
        'test-transform_graph.R:308:3', 'test-trav_out_until.R:73:3',
        'test-traversals.R:148:3'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-get_node_calculations.R:255:3'): Getting leverage centrality is possible ──
      <purrr_error_indexed/rlang_error/error/condition>
      Error in `purrr::map(seq_along(degree_vals), function(x) {
          mean((degree_vals[x] - degree_vals[igraph::neighbors(ig_graph, 
              degree_vals)])/(degree_vals[x] + degree_vals[igraph::neighbors(ig_graph, 
              degree_vals)]))
      })`: i In index: 1.
      Caused by error in `igraph::neighbors()`:
      ! Can't find vertex corresponding to `v`.
      
      [ FAIL 1 | WARN 3 | SKIP 24 | PASS 1696 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.0Mb
      sub-directories of 1Mb or more:
        R             1.5Mb
        help          1.5Mb
        htmlwidgets   2.8Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
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
    [25-09-04 20:40:54] WARNING: Python executable in virtual environment 'r-DrDimont' not found. Either run `install_python_dependencies(package_manager='pip') or set `conda=TRUE` in `drdimont_settings()` if conda installation was used.
    > 
    > example_individual_graphs <- generate_individual_graphs(
    +                                  correlation_matrices=correlation_matrices_example,
    +                                  layers=layers_example, 
    +                                  settings=example_settings)
    [25-09-04 20:40:54] Generating graph of layer mrna for groupA...
    [25-09-04 20:40:54] Reducing network by WGCNA::pickHardThreshold...
    [25-09-04 20:40:54] R2 cutoff: 0.65
    [25-09-04 20:40:54] Cut Threshold: 0.26
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

## In both

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) generate_individual_graphs.Rd:11: Lost braces
        11 | code{\link[DrDimont]{compute_correlation_matrices}}}
           |     ^
    ```

# egor

<details>

* Version: 1.24.2
* GitHub: https://github.com/tilltnet/egor
* Source code: https://github.com/cran/egor
* Date/Publication: 2024-02-02 05:30:02 UTC
* Number of recursive dependencies: 88

Run `revdepcheck::cloud_details(, "egor")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘egor_allbus.Rmd’ using rmarkdown
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

# incidentally

<details>

* Version: 1.0.3
* GitHub: https://github.com/zpneal/incidentally
* Source code: https://github.com/cran/incidentally
* Date/Publication: 2025-07-28 22:10:02 UTC
* Number of recursive dependencies: 36

Run `revdepcheck::cloud_details(, "incidentally")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘congress.Rmd’ using rmarkdown
    trying URL 'https://www.govinfo.gov/bulkdata/BILLSTATUS/115/sres/BILLSTATUS-115-sres.zip'
    Content type 'application/zip' length 1883678 bytes (1.8 MB)
    ==================================================
    downloaded 1.8 MB
    
    trying URL 'https://www.govinfo.gov/bulkdata/BILLSTATUS/115/sres/BILLSTATUS-115-sres.zip'
    Content type 'application/zip' length 1883678 bytes (1.8 MB)
    ==================================================
    downloaded 1.8 MB
    ```

# IOHanalyzer

<details>

* Version: 0.1.8.10
* GitHub: https://github.com/IOHprofiler/IOHAnalyzer
* Source code: https://github.com/cran/IOHanalyzer
* Date/Publication: 2024-03-01 12:52:37 UTC
* Number of recursive dependencies: 136

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
    Error in `igraph::graph_from_adjacency_matrix()`:
    ! Cannot create a graph object because the adjacency matrix contains
      NAs.
    Backtrace:
        ▆
     1. ├─IOHanalyzer::Plot.Stats.Significance_Graph(...)
     2. └─IOHanalyzer:::Plot.Stats.Significance_Graph.DataSetList(...)
     3.   └─igraph::graph_from_adjacency_matrix(p_matrix <= alpha, mode = "directed", diag = F)
     4.     └─igraph:::ensure_no_na(adjmatrix, "adjacency matrix")
     5.       └─cli::cli_abort(...)
     6.         └─rlang::abort(...)
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.6Mb
      sub-directories of 1Mb or more:
        data           1.4Mb
        libs           3.2Mb
        shiny-server   1.1Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 102 marked UTF-8 strings
    ```

# klassR

<details>

* Version: 1.0.2
* GitHub: https://github.com/statisticsnorway/ssb-klassr
* Source code: https://github.com/cran/klassR
* Date/Publication: 2025-02-07 10:40:02 UTC
* Number of recursive dependencies: 76

Run `revdepcheck::cloud_details(, "klassR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘klassR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: update_klass_node
    > ### Title: Given a node and a graph, find the node at the end of a sequence
    > ###   of changes.
    > ### Aliases: update_klass_node
    > 
    > ### ** Examples
    > 
    > 
    > # Build a graph directed towards the most recent codes.
    > library(klassR)
    > klass_131 <- klass_graph(131)
    Error in `FUN()`:
    ! Error: Logical index length does not match the number of edges.
      Recycling is not allowed.
    Backtrace:
        ▆
     1. └─klassR::klass_graph(131)
     2.   ├─igraph::reverse_edges(...)
     3.   │ └─igraph:::as_igraph_es(graph, eids)
     4.   ├─igraph::E(graph)[igraph::E(graph)$changeOccurred > date]
     5.   └─igraph:::`[.igraph.es`(...)
     6.     └─base::lapply(...)
     7.       └─igraph (local) FUN(X[[i]], ...)
     8.         └─cli::cli_abort("Error: Logical index length does not match the number of edges. Recycling is not allowed.")
     9.           └─rlang::abort(...)
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1764 marked UTF-8 strings
    ```

# manynet

<details>

* Version: 1.6.0
* GitHub: https://github.com/stocnet/manynet
* Source code: https://github.com/cran/manynet
* Date/Publication: 2025-08-22 23:40:02 UTC
* Number of recursive dependencies: 117

Run `revdepcheck::cloud_details(, "manynet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘manynet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: mark_features
    > ### Title: Marking networks features
    > ### Aliases: mark_features is_connected is_perfect_matching is_eulerian
    > ###   is_acyclic is_aperiodic
    > 
    > ### ** Examples
    > 
    > is_connected(ison_southern_women)
    [1] TRUE
    > is_perfect_matching(ison_southern_women)
    [1] FALSE
    > is_eulerian(ison_brandes)
    [1] FALSE
    > is_acyclic(ison_algebra)
    [1] FALSE
    > is_aperiodic(ison_algebra)
    Killed
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(manynet)
      > 
      > test_check("manynet")
      Starting 2 test processes
      
      
      Error in `private$handle_error()`:
      ! testthat subprocess exited in file `test-measure_closure.R`
      Caused by error:
      ! R session crashed with exit code -9
      Backtrace:
           ▆
        1. └─testthat::test_check("manynet")
        2.   └─testthat::test_dir(...)
        3.     └─testthat:::test_files(...)
        4.       └─testthat:::test_files_parallel(...)
        5.         ├─withr::with_dir(...)
        6.         │ └─base::force(code)
        7.         ├─testthat::with_reporter(...)
        8.         │ └─base::tryCatch(...)
        9.         │   └─base (local) tryCatchList(expr, classes, parentenv, handlers)
       10.         │     └─base (local) tryCatchOne(expr, names, parentenv, handlers[[1L]])
       11.         │       └─base (local) doTryCatch(return(expr), name, parentenv, handler)
       12.         └─testthat:::parallel_event_loop_chunky(queue, reporters, ".")
       13.           └─queue$poll(Inf)
       14.             └─base::lapply(...)
       15.               └─testthat (local) FUN(X[[i]], ...)
       16.                 └─private$handle_error(msg, i)
       17.                   └─rlang::abort(...)
      Execution halted
    ```

# multinet

<details>

* Version: 4.2.2
* GitHub: NA
* Source code: https://github.com/cran/multinet
* Date/Publication: 2025-04-08 07:20:06 UTC
* Number of recursive dependencies: 13

Run `revdepcheck::cloud_details(, "multinet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘multinet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: multinet.conversion
    > ### Title: Conversion to a simple or multi graph
    > ### Aliases: multinet.conversion as.igraph.multinet
    > ###   as.igraph.Rcpp_RMLNetwork
    > 
    > ### ** Examples
    > 
    > net <- ml_aucs()
    > # using the default merge.actors=TRUE we create a multigraph,
    > # where each actor corresponds to a vertex in the result
    > multigraph <- as.igraph(net)
    Error in `make_empty_graph()`:
    ! `directed` must be a logical, not a number.
    Backtrace:
        ▆
     1. ├─igraph::as.igraph(net)
     2. └─multinet:::as.igraph.Rcpp_RMLNetwork(net)
     3.   └─igraph::graph_from_data_frame(vertices = a_df, e_df, directed = dir)
     4.     └─igraph::make_empty_graph(n = 0, directed = directed)
     5.       └─cli::cli_abort("{.arg directed} must be a logical, not {.obj_type_friendly {directed}}.")
     6.         └─rlang::abort(...)
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 137.5Mb
      sub-directories of 1Mb or more:
        libs  137.2Mb
    ```

# mwcsr

<details>

* Version: 0.1.9
* GitHub: https://github.com/ctlab/mwcsr
* Source code: https://github.com/cran/mwcsr
* Date/Publication: 2024-09-09 11:30:10 UTC
* Number of recursive dependencies: 86

Run `revdepcheck::cloud_details(, "mwcsr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mwcsr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: virgo_solver
    > ### Title: Construct a virgo solver
    > ### Aliases: virgo_solver
    > 
    > ### ** Examples
    > 
    > data("sgmwcs_small_instance")
    > approx_vs <- virgo_solver(mst=TRUE, threads = 1)
    > approx_vs$run_main("-h")
    Option (* = required)                  Description                            
    ---------------------                  -----------                            
    --benchmark, --bm                      Benchmark output file (default: )      
    -c <Integer>                           Threshold for CPE solver (default: 25) 
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(mwcsr)
      > 
      > test_check("mwcsr")
      [ FAIL 2 | WARN 10 | SKIP 5 | PASS 41 ]
      
      ══ Skipped tests (5) ═══════════════════════════════════════════════════════════
      • No CPLEX available (3): 'test_virgo.R:5:9', 'test_virgo.R:15:9',
        'test_virgo.R:24:9'
      • SCIP is not available (2): 'test_scip.R:5:9', 'test_scip.R:16:9'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_virgo.R:48:5'): heuristic virgo_solver works on SGMWCS ─────────
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. ├─mwcsr::solve_mwcsp(solver, sgmwcs_small_instance) at test_virgo.R:48:5
        2. └─mwcsr:::solve_mwcsp.virgo_solver(solver, sgmwcs_small_instance)
        3.   └─mwcsr:::solve_sgmwcs(solver, instance, ...)
        4.     └─mwcsr:::run_solver(...)
        5.       └─igraph::get.edge.ids(instance, t(edges[, 1:2]))
        6.         └─igraph::get_edge_ids(...)
        7.           └─igraph:::el_to_vec(vp, call = rlang::caller_env())
        8.             └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
        9.               └─lifecycle:::deprecate_stop0(msg)
       10.                 └─rlang::cnd_signal(...)
      ── Error ('test_virgo.R:81:5'): heuristic virgo_solver works on SGMWCS ─────────
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. ├─mwcsr::solve_mwcsp(solver, si) at test_virgo.R:81:5
        2. └─mwcsr:::solve_mwcsp.virgo_solver(solver, si)
        3.   └─mwcsr:::solve_sgmwcs(solver, instance, ...)
        4.     └─mwcsr:::run_solver(...)
        5.       └─igraph::get.edge.ids(instance, t(edges[, 1:2]))
        6.         └─igraph::get_edge_ids(...)
        7.           └─igraph:::el_to_vec(vp, call = rlang::caller_env())
        8.             └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
        9.               └─lifecycle:::deprecate_stop0(msg)
       10.                 └─rlang::cnd_signal(...)
      
      [ FAIL 2 | WARN 10 | SKIP 5 | PASS 41 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 13.6Mb
      sub-directories of 1Mb or more:
        java   2.5Mb
        libs  10.5Mb
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

# ProgModule

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/ProgModule
* Date/Publication: 2024-05-16 14:40:05 UTC
* Number of recursive dependencies: 219

Run `revdepcheck::cloud_details(, "ProgModule")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘ProgModule.Rmd’ using rmarkdown
    
    Quitting from ProgModule.Rmd:110-122 [unnamed-chunk-6]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    NULL
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Error: processing vignette 'ProgModule.Rmd' failed with diagnostics:
    Can't find vertex corresponding to `v`.
    --- failed re-building ‘ProgModule.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘ProgModule.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# remify

<details>

* Version: 3.2.8
* GitHub: https://github.com/TilburgNetworkGroup/remify
* Source code: https://github.com/cran/remify
* Date/Publication: 2025-01-29 13:20:05 UTC
* Number of recursive dependencies: 36

Run `revdepcheck::cloud_details(, "remify")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘tinytest.R’
    Running the tests in ‘tests/tinytest.R’ failed.
    Complete output:
      > if ( requireNamespace("tinytest", quietly=TRUE) ){
      +   tinytest::test_package("remify")
      + }
      
      test-rehshape.R...............    0 tests    
      test-rehshape.R...............    1 tests [0;32mOK[0m 
      test-rehshape.R...............    1 tests [0;32mOK[0m 
      test-rehshape.R...............    2 tests [0;32mOK[0m 
      test-rehshape.R...............    3 tests [0;32mOK[0m 
      test-rehshape.R...............    4 tests [0;32mOK[0m 
      test-rehshape.R...............    5 tests [0;32mOK[0m 
      test-rehshape.R...............    6 tests [0;32mOK[0m 
      test-rehshape.R...............    7 tests [0;32mOK[0m 
      test-rehshape.R...............    8 tests [0;32mOK[0m 
      test-rehshape.R...............    9 tests [0;32mOK[0m 
      test-rehshape.R...............   10 tests [0;32mOK[0m 
      test-rehshape.R...............   10 tests [0;32mOK[0m 
      test-rehshape.R...............   11 tests [0;32mOK[0m 
      test-rehshape.R...............   12 tests [0;32mOK[0m 
      test-rehshape.R...............   13 tests [0;32mOK[0m 
      test-rehshape.R...............   14 tests [0;32mOK[0m 
      test-rehshape.R...............   15 tests [0;32mOK[0m 
      test-rehshape.R...............   16 tests [0;32mOK[0m 
      test-rehshape.R...............   17 tests [0;32mOK[0m 
      test-rehshape.R...............   18 tests [0;32mOK[0m 
      test-rehshape.R...............   19 tests [0;32mOK[0m 
      test-rehshape.R...............   19 tests [0;32mOK[0m 
      test-rehshape.R...............   20 tests [0;32mOK[0m 
      test-rehshape.R...............   20 tests [0;32mOK[0m 
      test-rehshape.R...............   21 tests [0;32mOK[0m 
      test-rehshape.R...............   22 tests [0;32mOK[0m 
      test-rehshape.R...............   22 tests [0;32mOK[0m 
      test-rehshape.R...............   22 tests [0;32mOK[0m 
      test-rehshape.R...............   23 tests [0;32mOK[0m 
      test-rehshape.R...............   24 tests [0;32mOK[0m 
      test-rehshape.R...............   24 tests [0;32mOK[0m 
      test-rehshape.R...............   24 tests [0;32mOK[0m 
      test-rehshape.R...............   25 tests [0;32mOK[0m 
      test-rehshape.R...............   26 tests [0;32mOK[0m [0;34m2.9s[0m
      
      test-remify-error-messages.R..    1 tests [0;32mOK[0m 
      test-remify-error-messages.R..    1 tests [0;32mOK[0m 
      test-remify-error-messages.R..    1 tests [0;32mOK[0m 
      test-remify-error-messages.R..    2 tests [0;32mOK[0m 
      test-remify-error-messages.R..    2 tests [0;32mOK[0m 
      test-remify-error-messages.R..    2 tests [0;32mOK[0m 
      test-remify-error-messages.R..    3 tests [0;32mOK[0m 
      test-remify-error-messages.R..    3 tests [0;32mOK[0m 
      test-remify-error-messages.R..    3 tests [0;32mOK[0m 
      test-remify-error-messages.R..    4 tests [0;32mOK[0m 
      test-remify-error-messages.R..    5 tests [0;32mOK[0m 
      test-remify-error-messages.R..    6 tests [0;32mOK[0m 
      test-remify-error-messages.R..    6 tests [0;32mOK[0m 
      test-remify-error-messages.R..    6 tests [0;32mOK[0m 
      test-remify-error-messages.R..    7 tests [0;32mOK[0m 
      test-remify-error-messages.R..    7 tests [0;32mOK[0m 
      test-remify-error-messages.R..    8 tests [0;32mOK[0m 
      test-remify-error-messages.R..    8 tests [0;32mOK[0m 
      test-remify-error-messages.R..    8 tests [0;32mOK[0m 
      test-remify-error-messages.R..    9 tests [0;32mOK[0m 
      test-remify-error-messages.R..    9 tests [0;32mOK[0m 
      test-remify-error-messages.R..    9 tests [0;32mOK[0m 
      test-remify-error-messages.R..   10 tests [0;32mOK[0m 
      test-remify-error-messages.R..   10 tests [0;32mOK[0m 
      test-remify-error-messages.R..   10 tests [0;32mOK[0m 
      test-remify-error-messages.R..   11 tests [0;32mOK[0m 
      test-remify-error-messages.R..   11 tests [0;32mOK[0m 
      test-remify-error-messages.R..   11 tests [0;32mOK[0m 
      test-remify-error-messages.R..   12 tests [0;32mOK[0m 
      test-remify-error-messages.R..   12 tests [0;32mOK[0m 
      test-remify-error-messages.R..   12 tests [0;32mOK[0m 
      test-remify-error-messages.R..   13 tests [0;32mOK[0m 
      test-remify-error-messages.R..   13 tests [0;32mOK[0m 
      test-remify-error-messages.R..   14 tests [0;32mOK[0m 
      test-remify-error-messages.R..   14 tests [0;32mOK[0m 
      test-remify-error-messages.R..   14 tests [0;32mOK[0m 
      test-remify-error-messages.R..   15 tests [0;32mOK[0m 
      test-remify-error-messages.R..   15 tests [0;32mOK[0m 
      test-remify-error-messages.R..   15 tests [0;32mOK[0m 
      test-remify-error-messages.R..   16 tests [0;32mOK[0m 
      test-remify-error-messages.R..   16 tests [0;32mOK[0m 
      test-remify-error-messages.R..   16 tests [0;32mOK[0m 
      test-remify-error-messages.R..   17 tests [0;32mOK[0m 
      test-remify-error-messages.R..   17 tests [0;32mOK[0m 
      test-remify-error-messages.R..   17 tests [0;32mOK[0m 
      test-remify-error-messages.R..   18 tests [0;32mOK[0m 
      test-remify-error-messages.R..   18 tests [0;32mOK[0m 
      test-remify-error-messages.R..   19 tests [0;32mOK[0m 
      test-remify-error-messages.R..   19 tests [0;32mOK[0m 
      test-remify-error-messages.R..   20 tests [0;32mOK[0m 
      test-remify-error-messages.R..   20 tests [0;32mOK[0m 
      test-remify-error-messages.R..   21 tests [0;32mOK[0m [0;34m0.2s[0m
      
      test-remify-methods.R.........    0 tests    
      test-remify-methods.R.........    0 tests    
      test-remify-methods.R.........    1 tests [0;32mOK[0m 
      test-remify-methods.R.........    2 tests [0;32mOK[0m 
      test-remify-methods.R.........    3 tests [0;32mOK[0m 
      test-remify-methods.R.........    4 tests [0;32mOK[0m 
      test-remify-methods.R.........    4 tests [0;32mOK[0m 
      test-remify-methods.R.........    4 tests [0;32mOK[0m 
      test-remify-methods.R.........    4 tests [0;32mOK[0m 
      test-remify-methods.R.........    5 tests [0;32mOK[0m 
      test-remify-methods.R.........    6 tests [0;32mOK[0m 
      test-remify-methods.R.........    7 tests [0;32mOK[0m 
      test-remify-methods.R.........    8 tests [0;32mOK[0m 
      test-remify-methods.R.........    8 tests [0;32mOK[0m 
      test-remify-methods.R.........    8 tests [0;32mOK[0m 
      test-remify-methods.R.........    8 tests [0;32mOK[0m 
      test-remify-methods.R.........    8 tests [0;32mOK[0m 
      test-remify-methods.R.........    9 tests [0;32mOK[0m 
      test-remify-methods.R.........   10 tests [0;32mOK[0m 
      test-remify-methods.R.........   11 tests [0;32mOK[0m 
      test-remify-methods.R.........   12 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   14 tests [0;32mOK[0m 
      test-remify-methods.R.........   15 tests [0;32mOK[0m 
      test-remify-methods.R.........   16 tests [0;32mOK[0m 
      test-remify-methods.R.........   17 tests [0;32mOK[0m 
      test-remify-methods.R.........   18 tests [0;32mOK[0m 
      test-remify-methods.R.........   18 tests [0;32mOK[0m 
      test-remify-methods.R.........   18 tests [0;32mOK[0m 
      test-remify-methods.R.........   18 tests [0;32mOK[0m 
      test-remify-methods.R.........   18 tests [0;32mOK[0m 
      test-remify-methods.R.........   19 tests [0;32mOK[0m 
      test-remify-methods.R.........   20 tests [0;32mOK[0m 
      test-remify-methods.R.........   21 tests [0;32mOK[0m 
      test-remify-methods.R.........   22 tests [0;32mOK[0m 
      test-remify-methods.R.........   23 tests [0;32mOK[0m 
      test-remify-methods.R.........   23 tests [0;32mOK[0m 
      test-remify-methods.R.........   23 tests [0;32mOK[0m 
      test-remify-methods.R.........   24 tests [0;32mOK[0m 
      test-remify-methods.R.........   25 tests [0;32mOK[0m 
      test-remify-methods.R.........   26 tests [0;32mOK[0m 
      test-remify-methods.R.........   27 tests [0;32mOK[0m 
      test-remify-methods.R.........   27 tests [0;32mOK[0m 
      test-remify-methods.R.........   27 tests [0;32mOK[0m 
      test-remify-methods.R.........   28 tests [0;32mOK[0m 
      test-remify-methods.R.........   29 tests [0;32mOK[0m 
      test-remify-methods.R.........   30 tests [0;32mOK[0m 
      test-remify-methods.R.........   31 tests [0;32mOK[0m 
      test-remify-methods.R.........   31 tests [0;32mOK[0m 
      test-remify-methods.R.........   31 tests [0;32mOK[0m 
      test-remify-methods.R.........   32 tests [0;32mOK[0m 
      test-remify-methods.R.........   33 tests [0;32mOK[0m 
      test-remify-methods.R.........   33 tests [0;32mOK[0m 
      test-remify-methods.R.........   33 tests [0;32mOK[0m 
      test-remify-methods.R.........   34 tests [0;32mOK[0m 
      test-remify-methods.R.........   35 tests [0;32mOK[0m 
      test-remify-methods.R.........   36 tests [0;32mOK[0m 
      test-remify-methods.R.........   37 tests [0;32mOK[0m 
      test-remify-methods.R.........   38 tests [0;32mOK[0m 
      test-remify-methods.R.........   39 tests [0;32mOK[0m 
      test-remify-methods.R.........   40 tests [0;32mOK[0m 
      test-remify-methods.R.........   41 tests [0;32mOK[0m 
      test-remify-methods.R.........   42 tests [0;32mOK[0m 
      test-remify-methods.R.........   43 tests [0;32mOK[0m 
      test-remify-methods.R.........   44 tests [0;32mOK[0m 
      test-remify-methods.R.........   45 tests [0;32mOK[0m 
      test-remify-methods.R.........   46 tests [0;32mOK[0m 
      test-remify-methods.R.........   47 tests [0;32mOK[0m 
      test-remify-methods.R.........   48 tests [0;32mOK[0m 
      test-remify-methods.R.........   49 tests [0;32mOK[0m 
      test-remify-methods.R.........   49 tests [0;32mOK[0m 
      test-remify-methods.R.........   50 tests [0;32mOK[0m 
      test-remify-methods.R.........   51 tests [0;32mOK[0m 
      test-remify-methods.R.........   52 tests [0;32mOK[0m 
      test-remify-methods.R.........   53 tests [0;32mOK[0m 
      test-remify-methods.R.........   54 tests [0;32mOK[0m 
      test-remify-methods.R.........   55 tests [0;32mOK[0m 
      test-remify-methods.R.........   56 tests [0;32mOK[0m 
      test-remify-methods.R.........   57 tests [0;32mOK[0m 
      test-remify-methods.R.........   58 tests [0;32mOK[0m 
      test-remify-methods.R.........   59 tests [0;32mOK[0m 
      test-remify-methods.R.........   60 tests [0;32mOK[0m 
      test-remify-methods.R.........   61 tests [0;32mOK[0m 
      test-remify-methods.R.........   62 tests [0;32mOK[0m 
      test-remify-methods.R.........   63 tests [0;32mOK[0m 
      test-remify-methods.R.........   64 tests [0;32mOK[0m 
      test-remify-methods.R.........   64 tests [0;32mOK[0m 
      test-remify-methods.R.........   65 tests [0;32mOK[0m 
      test-remify-methods.R.........   66 tests [0;32mOK[0m 
      test-remify-methods.R.........   67 tests [0;32mOK[0m 
      test-remify-methods.R.........   68 tests [0;32mOK[0m 
      test-remify-methods.R.........   69 tests [0;32mOK[0m 
      test-remify-methods.R.........   70 tests [0;32mOK[0m 
      test-remify-methods.R.........   71 tests [0;32mOK[0m 
      test-remify-methods.R.........   72 tests [0;32mOK[0m 
      test-remify-methods.R.........   73 tests [0;32mOK[0m 
      test-remify-methods.R.........   74 tests [0;32mOK[0m 
      test-remify-methods.R.........   75 tests [0;32mOK[0m 
      test-remify-methods.R.........   76 tests [0;32mOK[0m 
      test-remify-methods.R.........   76 tests [0;32mOK[0m 
      test-remify-methods.R.........   76 tests [0;32mOK[0m 
      test-remify-methods.R.........   77 tests [0;32mOK[0m 
      test-remify-methods.R.........   78 tests [0;32mOK[0m 
      test-remify-methods.R.........   79 tests [0;32mOK[0m 
      test-remify-methods.R.........   80 tests [0;32mOK[0m 
      test-remify-methods.R.........   81 tests [0;32mOK[0m 
      test-remify-methods.R.........   82 tests [0;32mOK[0m 
      test-remify-methods.R.........   82 tests [0;32mOK[0m 
      test-remify-methods.R.........   82 tests [0;32mOK[0m 
      test-remify-methods.R.........   83 tests [0;32mOK[0m 
      test-remify-methods.R.........   84 tests [0;32mOK[0m 
      test-remify-methods.R.........   85 tests [0;32mOK[0m 
      test-remify-methods.R.........   86 tests [0;32mOK[0m 
      test-remify-methods.R.........   87 tests [0;32mOK[0m 
      test-remify-methods.R.........   88 tests [0;32mOK[0m 
      test-remify-methods.R.........   89 tests [0;32mOK[0m 
      test-remify-methods.R.........   90 tests [0;32mOK[0m 
      test-remify-methods.R.........   90 tests [0;32mOK[0m 
      test-remify-methods.R.........   90 tests [0;32mOK[0m 
      test-remify-methods.R.........   90 tests [0;32mOK[0m 
      test-remify-methods.R.........   91 tests [0;32mOK[0m 
      test-remify-methods.R.........   91 tests [0;32mOK[0m 
      test-remify-methods.R.........   92 tests [0;31m1 fails[0m 
      test-remify-methods.R.........   93 tests [0;31m2 fails[0m 
      test-remify-methods.R.........   94 tests [0;31m3 fails[0m 
      test-remify-methods.R.........   95 tests [0;31m4 fails[0m 
      test-remify-methods.R.........   96 tests [0;31m5 fails[0m 
      test-remify-methods.R.........   97 tests [0;31m6 fails[0m 
      test-remify-methods.R.........   98 tests [0;31m7 fails[0m 
      test-remify-methods.R.........   98 tests [0;31m7 fails[0m 
      test-remify-methods.R.........   99 tests [0;31m8 fails[0m 
      test-remify-methods.R.........  100 tests [0;31m9 fails[0m 
      test-remify-methods.R.........  101 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  101 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  102 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  103 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  104 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  105 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  106 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  107 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  107 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  107 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  108 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  109 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  109 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  109 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  110 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  110 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  110 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  111 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  111 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  111 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  112 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  112 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  112 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  113 tests [0;31m10 fails[0m [0;34m10.3s[0m
      
      test-remify-warning-messages.R    0 tests    
      test-remify-warning-messages.R    0 tests    
      test-remify-warning-messages.R    1 tests [0;32mOK[0m 
      test-remify-warning-messages.R    1 tests [0;32mOK[0m 
      test-remify-warning-messages.R    2 tests [0;32mOK[0m 
      test-remify-warning-messages.R    2 tests [0;32mOK[0m 
      test-remify-warning-messages.R    2 tests [0;32mOK[0m 
      test-remify-warning-messages.R    3 tests [0;32mOK[0m 
      test-remify-warning-messages.R    3 tests [0;32mOK[0m 
      test-remify-warning-messages.R    3 tests [0;32mOK[0m 
      test-remify-warning-messages.R    4 tests [0;32mOK[0m 
      test-remify-warning-messages.R    4 tests [0;32mOK[0m 
      test-remify-warning-messages.R    4 tests [0;32mOK[0m 
      test-remify-warning-messages.R    5 tests [0;32mOK[0m 
      test-remify-warning-messages.R    5 tests [0;32mOK[0m 
      test-remify-warning-messages.R    5 tests [0;32mOK[0m 
      test-remify-warning-messages.R    6 tests [0;32mOK[0m 
      test-remify-warning-messages.R    6 tests [0;32mOK[0m 
      test-remify-warning-messages.R    6 tests [0;32mOK[0m 
      test-remify-warning-messages.R    7 tests [0;32mOK[0m 
      test-remify-warning-messages.R    7 tests [0;32mOK[0m 
      test-remify-warning-messages.R    7 tests [0;32mOK[0m 
      test-remify-warning-messages.R    7 tests [0;32mOK[0m 
      test-remify-warning-messages.R    8 tests [0;32mOK[0m 
      test-remify-warning-messages.R    9 tests [0;32mOK[0m 
      test-remify-warning-messages.R    9 tests [0;32mOK[0m 
      test-remify-warning-messages.R   10 tests [0;32mOK[0m 
      test-remify-warning-messages.R   11 tests [0;32mOK[0m 
      test-remify-warning-messages.R   11 tests [0;32mOK[0m 
      test-remify-warning-messages.R   11 tests [0;32mOK[0m 
      test-remify-warning-messages.R   12 tests [0;32mOK[0m 
      test-remify-warning-messages.R   13 tests [0;32mOK[0m 
      test-remify-warning-messages.R   13 tests [0;32mOK[0m 
      test-remify-warning-messages.R   14 tests [0;32mOK[0m 
      test-remify-warning-messages.R   15 tests [0;32mOK[0m 
      test-remify-warning-messages.R   15 tests [0;32mOK[0m 
      test-remify-warning-messages.R   15 tests [0;32mOK[0m 
      test-remify-warning-messages.R   15 tests [0;32mOK[0m 
      test-remify-warning-messages.R   15 tests [0;32mOK[0m 
      test-remify-warning-messages.R   16 tests [0;32mOK[0m 
      test-remify-warning-messages.R   17 tests [0;32mOK[0m 
      test-remify-warning-messages.R   17 tests [0;32mOK[0m 
      test-remify-warning-messages.R   18 tests [0;32mOK[0m 
      test-remify-warning-messages.R   19 tests [0;32mOK[0m 
      test-remify-warning-messages.R   19 tests [0;32mOK[0m 
      test-remify-warning-messages.R   19 tests [0;32mOK[0m 
      test-remify-warning-messages.R   19 tests [0;32mOK[0m 
      test-remify-warning-messages.R   20 tests [0;32mOK[0m 
      test-remify-warning-messages.R   21 tests [0;32mOK[0m 
      test-remify-warning-messages.R   21 tests [0;32mOK[0m 
      test-remify-warning-messages.R   22 tests [0;32mOK[0m 
      test-remify-warning-messages.R   23 tests [0;32mOK[0m 
      test-remify-warning-messages.R   23 tests [0;32mOK[0m 
      test-remify-warning-messages.R   23 tests [0;32mOK[0m 
      test-remify-warning-messages.R   23 tests [0;32mOK[0m 
      test-remify-warning-messages.R   23 tests [0;32mOK[0m 
      test-remify-warning-messages.R   24 tests [0;32mOK[0m 
      test-remify-warning-messages.R   25 tests [0;32mOK[0m 
      test-remify-warning-messages.R   25 tests [0;32mOK[0m 
      test-remify-warning-messages.R   26 tests [0;32mOK[0m 
      test-remify-warning-messages.R   27 tests [0;32mOK[0m 
      test-remify-warning-messages.R   27 tests [0;32mOK[0m 
      test-remify-warning-messages.R   27 tests [0;32mOK[0m 
      test-remify-warning-messages.R   27 tests [0;32mOK[0m 
      test-remify-warning-messages.R   28 tests [0;32mOK[0m 
      test-remify-warning-messages.R   29 tests [0;32mOK[0m 
      test-remify-warning-messages.R   29 tests [0;32mOK[0m 
      test-remify-warning-messages.R   30 tests [0;32mOK[0m 
      test-remify-warning-messages.R   31 tests [0;32mOK[0m [0;34m0.6s[0m
      
      test-remify.R.................    0 tests    
      test-remify.R.................    1 tests [0;32mOK[0m 
      test-remify.R.................    2 tests [0;32mOK[0m 
      test-remify.R.................    3 tests [0;32mOK[0m 
      test-remify.R.................    4 tests [0;32mOK[0m 
      test-remify.R.................    5 tests [0;32mOK[0m 
      test-remify.R.................    6 tests [0;32mOK[0m 
      test-remify.R.................    7 tests [0;32mOK[0m 
      test-remify.R.................    8 tests [0;32mOK[0m 
      test-remify.R.................    9 tests [0;32mOK[0m 
      test-remify.R.................   10 tests [0;32mOK[0m 
      test-remify.R.................   10 tests [0;32mOK[0m 
      test-remify.R.................   10 tests [0;32mOK[0m 
      test-remify.R.................   10 tests [0;32mOK[0m 
      test-remify.R.................   11 tests [0;32mOK[0m 
      test-remify.R.................   12 tests [0;32mOK[0m 
      test-remify.R.................   13 tests [0;32mOK[0m 
      test-remify.R.................   13 tests [0;32mOK[0m 
      test-remify.R.................   13 tests [0;32mOK[0m 
      test-remify.R.................   14 tests [0;32mOK[0m 
      test-remify.R.................   15 tests [0;32mOK[0m 
      test-remify.R.................   15 tests [0;32mOK[0m 
      test-remify.R.................   15 tests [0;32mOK[0m 
      test-remify.R.................   15 tests [0;32mOK[0m 
      test-remify.R.................   16 tests [0;32mOK[0m 
      test-remify.R.................   17 tests [0;32mOK[0m 
      test-remify.R.................   17 tests [0;32mOK[0m 
      test-remify.R.................   17 tests [0;32mOK[0m 
      test-remify.R.................   17 tests [0;32mOK[0m 
      test-remify.R.................   18 tests [0;32mOK[0m 
      test-remify.R.................   19 tests [0;32mOK[0m 
      test-remify.R.................   19 tests [0;32mOK[0m 
      test-remify.R.................   19 tests [0;32mOK[0m 
      test-remify.R.................   19 tests [0;32mOK[0m 
      test-remify.R.................   20 tests [0;32mOK[0m 
      test-remify.R.................   20 tests [0;32mOK[0m 
      test-remify.R.................   21 tests [0;32mOK[0m 
      test-remify.R.................   21 tests [0;32mOK[0m 
      test-remify.R.................   21 tests [0;32mOK[0m 
      test-remify.R.................   21 tests [0;32mOK[0m 
      test-remify.R.................   21 tests [0;32mOK[0m 
      test-remify.R.................   22 tests [0;32mOK[0m 
      test-remify.R.................   22 tests [0;32mOK[0m 
      test-remify.R.................   23 tests [0;32mOK[0m 
      test-remify.R.................   23 tests [0;32mOK[0m 
      test-remify.R.................   23 tests [0;32mOK[0m 
      test-remify.R.................   23 tests [0;32mOK[0m 
      test-remify.R.................   24 tests [0;32mOK[0m 
      test-remify.R.................   24 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   26 tests [0;32mOK[0m 
      test-remify.R.................   26 tests [0;32mOK[0m 
      test-remify.R.................   26 tests [0;32mOK[0m 
      test-remify.R.................   27 tests [0;32mOK[0m 
      test-remify.R.................   27 tests [0;32mOK[0m 
      test-remify.R.................   27 tests [0;32mOK[0m 
      test-remify.R.................   27 tests [0;32mOK[0m 
      test-remify.R.................   28 tests [0;32mOK[0m 
      test-remify.R.................   29 tests [0;32mOK[0m 
      test-remify.R.................   30 tests [0;32mOK[0m 
      test-remify.R.................   30 tests [0;32mOK[0m 
      test-remify.R.................   31 tests [0;32mOK[0m 
      test-remify.R.................   31 tests [0;32mOK[0m 
      test-remify.R.................   32 tests [0;32mOK[0m 
      test-remify.R.................   32 tests [0;32mOK[0m 
      test-remify.R.................   33 tests [0;32mOK[0m 
      test-remify.R.................   33 tests [0;32mOK[0m 
      test-remify.R.................   34 tests [0;32mOK[0m 
      test-remify.R.................   34 tests [0;32mOK[0m 
      test-remify.R.................   34 tests [0;32mOK[0m 
      test-remify.R.................   34 tests [0;32mOK[0m 
      test-remify.R.................   34 tests [0;32mOK[0m 
      test-remify.R.................   35 tests [0;32mOK[0m 
      test-remify.R.................   35 tests [0;32mOK[0m 
      test-remify.R.................   36 tests [0;32mOK[0m 
      test-remify.R.................   37 tests [0;32mOK[0m 
      test-remify.R.................   38 tests [0;32mOK[0m 
      test-remify.R.................   39 tests [0;32mOK[0m 
      test-remify.R.................   40 tests [0;32mOK[0m 
      test-remify.R.................   41 tests [0;32mOK[0m 
      test-remify.R.................   42 tests [0;32mOK[0m 
      test-remify.R.................   43 tests [0;32mOK[0m 
      test-remify.R.................   44 tests [0;32mOK[0m 
      test-remify.R.................   45 tests [0;32mOK[0m 
      test-remify.R.................   45 tests [0;32mOK[0m 
      test-remify.R.................   45 tests [0;32mOK[0m 
      test-remify.R.................   46 tests [0;32mOK[0m 
      test-remify.R.................   47 tests [0;32mOK[0m 
      test-remify.R.................   47 tests [0;32mOK[0m 
      test-remify.R.................   47 tests [0;32mOK[0m 
      test-remify.R.................   48 tests [0;32mOK[0m 
      test-remify.R.................   49 tests [0;32mOK[0m 
      test-remify.R.................   49 tests [0;32mOK[0m 
      test-remify.R.................   50 tests [0;32mOK[0m 
      test-remify.R.................   51 tests [0;32mOK[0m 
      test-remify.R.................   51 tests [0;32mOK[0m 
      test-remify.R.................   52 tests [0;32mOK[0m 
      test-remify.R.................   53 tests [0;32mOK[0m 
      test-remify.R.................   53 tests [0;32mOK[0m 
      test-remify.R.................   54 tests [0;32mOK[0m 
      test-remify.R.................   55 tests [0;32mOK[0m 
      test-remify.R.................   55 tests [0;32mOK[0m 
      test-remify.R.................   55 tests [0;32mOK[0m 
      test-remify.R.................   55 tests [0;32mOK[0m 
      test-remify.R.................   55 tests [0;32mOK[0m 
      test-remify.R.................   56 tests [0;32mOK[0m 
      test-remify.R.................   56 tests [0;32mOK[0m 
      test-remify.R.................   57 tests [0;32mOK[0m 
      test-remify.R.................   57 tests [0;32mOK[0m 
      test-remify.R.................   57 tests [0;32mOK[0m 
      test-remify.R.................   58 tests [0;32mOK[0m 
      test-remify.R.................   58 tests [0;32mOK[0m 
      test-remify.R.................   59 tests [0;32mOK[0m 
      test-remify.R.................   59 tests [0;32mOK[0m 
      test-remify.R.................   59 tests [0;32mOK[0m 
      test-remify.R.................   59 tests [0;32mOK[0m 
      test-remify.R.................   60 tests [0;32mOK[0m 
      test-remify.R.................   60 tests [0;32mOK[0m 
      test-remify.R.................   61 tests [0;32mOK[0m 
      test-remify.R.................   61 tests [0;32mOK[0m 
      test-remify.R.................   61 tests [0;32mOK[0m 
      test-remify.R.................   62 tests [0;32mOK[0m 
      test-remify.R.................   62 tests [0;32mOK[0m 
      test-remify.R.................   63 tests [0;32mOK[0m [0;34m0.7s[0m
      ----- FAILED[xcpt]: test-remify-methods.R<349--349>
       call| expect_silent(plot(x = out))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<350--350>
       call| expect_silent(plot(x = out, breaks = NULL, palette = NULL, n_intervals = NULL, 
       call| -->    rev = NULL, actors = NULL, pch.degree = NULL, igraph.edge.color = NULL, 
       call| -->    igraph.vertex.color = NULL))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<351--351>
       call| expect_silent(plot(x = out, pch.degree = -1))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<352--352>
       call| expect_silent(plot(x = out, igraph.edge.color = "#000000000", 
       call| -->    igraph.vertex.color = "#000000000"))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<353--353>
       call| expect_silent(plot(x = out, igraph.edge.color = "magenta", igraph.vertex.color = "cyan4"))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<354--354>
       call| expect_silent(plot(x = out, n_intervals = 5))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<355--355>
       call| expect_silent(plot(x = out, actors = attr(out, "dictionary")$actors$actorName[1:5]))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<362--362>
       call| expect_silent(plot(x = out))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<363--363>
       call| expect_silent(plot(x = out, n_intervals = 5))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<364--364>
       call| expect_silent(plot(x = out, actors = attr(out, "dictionary")$actors$actorName[1:5]))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      Error: 10 out of 254 tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.2Mb
      sub-directories of 1Mb or more:
        doc    3.5Mb
        libs   4.8Mb
    ```

# rsetse

<details>

* Version: 0.5.0
* GitHub: https://github.com/JonnoB/rSETSe
* Source code: https://github.com/cran/rsetse
* Date/Publication: 2021-06-11 10:00:02 UTC
* Number of recursive dependencies: 79

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
    > 
    > library(igraph)
    
    Attaching package: ‘igraph’
    
    The following objects are masked from ‘package:stats’:
    
        decompose, spectrum
    
    The following object is masked from ‘package:base’:
    
        union
    
    > set.seed(234)
    > g_prep <- generate_peels_network("A") %>%
    +  set.edge.attribute(., name = "edge_characteristic", value = rep(1:16, each = 10))
    Warning: `set.edge.attribute()` was deprecated in igraph 2.0.0.
    ℹ Please use `set_edge_attr()` instead.
    Error in `igraph::graph_from_adjacency_matrix()`:
    ! Cannot create a graph object because the adjacency matrix contains
      NAs.
    Backtrace:
         ▆
      1. ├─generate_peels_network("A") %>% ...
      2. ├─igraph::set.edge.attribute(...)
      3. │ ├─igraph::set_edge_attr(...)
      4. │ │ └─igraph:::is_complete_iterator(index)
      5. │ └─igraph::E(graph)
      6. │   └─igraph:::ensure_igraph(graph)
      7. └─rsetse::generate_peels_network("A")
      8.   └─rsetse:::generate_peels_network_internal(type, k_values)
      9.     └─igraph::graph_from_adjacency_matrix(...)
     10.       └─igraph:::ensure_no_na(adjmatrix, "adjacency matrix")
     11.         └─cli::cli_abort(...)
     12.           └─rlang::abort(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Categorical-and-continuous-features.Rmd’ using rmarkdown
    ```

# SEMID

<details>

* Version: 0.4.1
* GitHub: https://github.com/Lucaweihs/SEMID
* Source code: https://github.com/cran/SEMID
* Date/Publication: 2023-07-19 14:00:11 UTC
* Number of recursive dependencies: 33

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
    > # Checking the generic identifiability of parameters in a mixed graph.
    > ###
    > 
    > # Mixed graphs are specified by their directed adjacency matrix L and
    > # bidirected adjacency matrix O.
    > L = t(matrix(
    +  c(0, 1, 1, 0, 0,
    +    0, 0, 1, 1, 1,
    +    0, 0, 0, 1, 0,
    +    0, 0, 0, 0, 1,
    +    0, 0, 0, 0, 0), 5, 5))
    > 
    > O = t(matrix(
    +  c(0, 0, 0, 1, 0,
    +    0, 0, 1, 0, 1,
    +    0, 0, 0, 0, 0,
    +    0, 0, 0, 0, 0,
    +    0, 0, 0, 0, 0), 5, 5)); O=O+t(O)
    > 
    > # Create a mixed graph object
    > graph = MixedGraph(L, O)
    > 
    > # We can plot what this mixed graph looks like, blue edges are directed
    > # red edges are bidirected.
    > plot(graph)
    > 
    > # Without using decomposition techniques we can't identify all nodes
    > # just using the half-trek criterion
    > htcID(graph, tianDecompose = FALSE)
    Warning: The `vp` argument of `get_edge_ids()` supplied as a matrix should be a n times
    2 matrix, not 2 times n as of igraph 2.1.5.
    ℹ either transpose the matrix with t() or convert it to a data.frame with two
      columns.
    ℹ The deprecated feature was likely used in the igraph package.
      Please report the issue at <https://github.com/igraph/rigraph/issues>.
    Call: htcID(mixedGraph = graph, tianDecompose = FALSE)
    
    Mixed Graph Info.
    # nodes: 5 
    # dir. edges: 7 
    # bi. edges: 3 
    
    Generic Identifiability Summary
    # dir. edges shown gen. identifiable: 1 
    # bi. edges shown gen. identifiable: 0 
    
    Generically identifiable dir. edges:
    1->2 
    
    Generically identifiable bi. edges:
    None
    > 
    > # The edgewiseTSID function can show that all edges are generically
    > # identifiable without proprocessing with decomposition techniques
    > edgewiseTSID(graph, tianDecompose = FALSE)
    Error:
    ! The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
    Backtrace:
         ▆
      1. └─SEMID::edgewiseTSID(graph, tianDecompose = FALSE)
      2.   └─SEMID::generalGenericID(...)
      3.     └─SEMID (local) idStepFunction(mixedGraph, unsolvedParents, solvedParents, identifier)
      4.       └─SEMID::trekSeparationIdentifyStep(...)
      5.         └─mixedGraph$getTrekSystem(sources, c(targets, i), avoidRightEdges = toRemoveOnRight)
      6.           ├─SEMID::getTrekSystem(this, ...)
      7.           └─SEMID:::getTrekSystem.MixedGraph(this, ...)
      8.             └─this$.internalGraph$getTrekSystem(...)
      9.               ├─SEMID::getTrekSystem(this, ...)
     10.               └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
     11.                 └─this$.internalGraph$getTrekSystem(...)
     12.                   ├─SEMID::getTrekSystem(this, ...)
     13.                   └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
     14.                     └─this$.trekFlowGraph$updateEdgeCapacities(...)
     15.                       ├─SEMID::updateEdgeCapacities(this, ...)
     16.                       └─SEMID:::updateEdgeCapacities.FlowGraph(this, ...)
     17.                         └─igraph::get.edge.ids(...)
     18.                           └─igraph::get_edge_ids(...)
     19.                             └─igraph:::el_to_vec(vp, call = rlang::caller_env())
     20.                               └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
     21.                                 └─lifecycle:::deprecate_stop0(msg)
     22.                                   └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(SEMID)
      > 
      > test_check("SEMID")
      [ FAIL 7 | WARN 11 | SKIP 0 | PASS 965 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_LatentDigraph.R:67:3'): Single node graph works properly ───────
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. ├─testthat::expect_equal(...) at test_LatentDigraph.R:67:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─g$getTrekSystem(1, 1)
        5.   ├─SEMID::getTrekSystem(this, ...)
        6.   └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
        7.     └─this$.internalGraph$getTrekSystem(...)
        8.       ├─SEMID::getTrekSystem(this, ...)
        9.       └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
       10.         └─this$createTrekFlowGraph()
       11.           ├─SEMID::createTrekFlowGraph(this, ...)
       12.           └─SEMID:::createTrekFlowGraph.LatentDigraphFixedOrder(this, ...)
       13.             └─SEMID::FlowGraph(adjMat, 1, adjMat)
       14.               └─igraph::get.edge.ids(flowGraph, rbind(1:m, 1:m + m))
       15.                 └─igraph::get_edge_ids(...)
       16.                   └─igraph:::el_to_vec(vp, call = rlang::caller_env())
       17.                     └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
       18.                       └─lifecycle:::deprecate_stop0(msg)
       19.                         └─rlang::cnd_signal(...)
      ── Error ('test_ancestral.R:19:17'): Ancestral identification does not identify edges erroneously. ──
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. └─SEMID::ancestralID(g) at test_ancestral.R:19:17
        2.   └─SEMID::generalGenericID(...)
        3.     └─SEMID::generalGenericID(...)
        4.       └─SEMID (local) idStepFunction(mixedGraph, unsolvedParents, solvedParents, identifier)
        5.         └─tianAncGraph$getHalfTrekSystem(allowedNodes, nodeParents)
        6.           ├─SEMID::getHalfTrekSystem(this, ...)
        7.           └─SEMID:::getHalfTrekSystem.MixedGraph(this, ...)
        8.             └─this$getTrekSystem(...)
        9.               ├─SEMID::getTrekSystem(this, ...)
       10.               └─SEMID:::getTrekSystem.MixedGraph(this, ...)
       11.                 └─this$.internalGraph$getTrekSystem(...)
       12.                   ├─SEMID::getTrekSystem(this, ...)
       13.                   └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
       14.                     └─this$.internalGraph$getTrekSystem(...)
       15.                       ├─SEMID::getTrekSystem(this, ...)
       16.                       └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
       17.                         └─this$.trekFlowGraph$updateEdgeCapacities(...)
       18.                           ├─SEMID::updateEdgeCapacities(this, ...)
       19.                           └─SEMID:::updateEdgeCapacities.FlowGraph(this, ...)
       20.                             └─igraph::get.edge.ids(...)
       21.                               └─igraph::get_edge_ids(...)
       22.                                 └─igraph:::el_to_vec(vp, call = rlang::caller_env())
       23.                                   └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
       24.                                     └─lifecycle:::deprecate_stop0(msg)
       25.                                       └─rlang::cnd_signal(...)
      ── Error ('test_ancestral.R:44:17'): Old and new ancestralID implementations agree. ──
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. └─SEMID::ancestralID(MixedGraph(L, O)) at test_ancestral.R:44:17
        2.   └─SEMID::generalGenericID(...)
        3.     └─SEMID::generalGenericID(...)
        4.       └─SEMID (local) idStepFunction(mixedGraph, unsolvedParents, solvedParents, identifier)
        5.         └─tianAncGraph$getHalfTrekSystem(allowedNodes, nodeParents)
        6.           ├─SEMID::getHalfTrekSystem(this, ...)
        7.           └─SEMID:::getHalfTrekSystem.MixedGraph(this, ...)
        8.             └─this$getTrekSystem(...)
        9.               ├─SEMID::getTrekSystem(this, ...)
       10.               └─SEMID:::getTrekSystem.MixedGraph(this, ...)
       11.                 └─this$.internalGraph$getTrekSystem(...)
       12.                   ├─SEMID::getTrekSystem(this, ...)
       13.                   └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
       14.                     └─this$.internalGraph$getTrekSystem(...)
       15.                       ├─SEMID::getTrekSystem(this, ...)
       16.                       └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
       17.                         └─this$.trekFlowGraph$updateEdgeCapacities(...)
       18.                           ├─SEMID::updateEdgeCapacities(this, ...)
       19.                           └─SEMID:::updateEdgeCapacities.FlowGraph(this, ...)
       20.                             └─igraph::get.edge.ids(...)
       21.                               └─igraph::get_edge_ids(...)
       22.                                 └─igraph:::el_to_vec(vp, call = rlang::caller_env())
       23.                                   └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
       24.                                     └─lifecycle:::deprecate_stop0(msg)
       25.                                       └─rlang::cnd_signal(...)
      ── Error ('test_edgewiseID.R:18:17'): Edgewise identification does not identify edges erroneously. ──
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. └─SEMID::htcID(g) at test_edgewiseID.R:18:17
        2.   └─SEMID::generalGenericID(mixedGraph, list(htcIdentifyStep), tianDecompose = tianDecompose)
        3.     └─SEMID::generalGenericID(...)
        4.       └─SEMID (local) idStepFunction(mixedGraph, unsolvedParents, solvedParents, identifier)
        5.         └─mixedGraph$getHalfTrekSystem(allowedNodes, nodeParents)
        6.           ├─SEMID::getHalfTrekSystem(this, ...)
        7.           └─SEMID:::getHalfTrekSystem.MixedGraph(this, ...)
        8.             └─this$getTrekSystem(...)
        9.               ├─SEMID::getTrekSystem(this, ...)
       10.               └─SEMID:::getTrekSystem.MixedGraph(this, ...)
       11.                 └─this$.internalGraph$getTrekSystem(...)
       12.                   ├─SEMID::getTrekSystem(this, ...)
       13.                   └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
       14.                     └─this$.internalGraph$getTrekSystem(...)
       15.                       ├─SEMID::getTrekSystem(this, ...)
       16.                       └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
       17.                         └─this$.trekFlowGraph$updateEdgeCapacities(...)
       18.                           ├─SEMID::updateEdgeCapacities(this, ...)
       19.                           └─SEMID:::updateEdgeCapacities.FlowGraph(this, ...)
       20.                             └─igraph::get.edge.ids(...)
       21.                               └─igraph::get_edge_ids(...)
       22.                                 └─igraph:::el_to_vec(vp, call = rlang::caller_env())
       23.                                   └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
       24.                                     └─lifecycle:::deprecate_stop0(msg)
       25.                                       └─rlang::cnd_signal(...)
      ── Error ('test_edgewiseID.R:44:9'): TO DELETE ─────────────────────────────────
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. └─SEMID::htcID(g, tianDecompose = F) at test_edgewiseID.R:44:9
        2.   └─SEMID::generalGenericID(mixedGraph, list(htcIdentifyStep), tianDecompose = tianDecompose)
        3.     └─SEMID (local) idStepFunction(mixedGraph, unsolvedParents, solvedParents, identifier)
        4.       └─mixedGraph$getHalfTrekSystem(allowedNodes, nodeParents)
        5.         ├─SEMID::getHalfTrekSystem(this, ...)
        6.         └─SEMID:::getHalfTrekSystem.MixedGraph(this, ...)
        7.           └─this$getTrekSystem(...)
        8.             ├─SEMID::getTrekSystem(this, ...)
        9.             └─SEMID:::getTrekSystem.MixedGraph(this, ...)
       10.               └─this$.internalGraph$getTrekSystem(...)
       11.                 ├─SEMID::getTrekSystem(this, ...)
       12.                 └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
       13.                   └─this$.internalGraph$getTrekSystem(...)
       14.                     ├─SEMID::getTrekSystem(this, ...)
       15.                     └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
       16.                       └─this$.trekFlowGraph$updateEdgeCapacities(...)
       17.                         ├─SEMID::updateEdgeCapacities(this, ...)
       18.                         └─SEMID:::updateEdgeCapacities.FlowGraph(this, ...)
       19.                           └─igraph::get.edge.ids(...)
       20.                             └─igraph::get_edge_ids(...)
       21.                               └─igraph:::el_to_vec(vp, call = rlang::caller_env())
       22.                                 └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
       23.                                   └─lifecycle:::deprecate_stop0(msg)
       24.                                     └─rlang::cnd_signal(...)
      ── Error ('test_lfhtcID.R:8:5'): lfhtcID returns correct value for known examples. ──
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. └─SEMID::lfhtcID(digraphExamples[[i]]$graph) at test_lfhtcID.R:8:5
        2.   └─SEMID::lfhtcIdentifyStep(...)
        3.     └─graph$getTrekSystem(...)
        4.       ├─SEMID::getTrekSystem(this, ...)
        5.       └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
        6.         └─this$.internalGraph$getTrekSystem(...)
        7.           ├─SEMID::getTrekSystem(this, ...)
        8.           └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
        9.             └─this$.trekFlowGraph$updateEdgeCapacities(...)
       10.               ├─SEMID::updateEdgeCapacities(this, ...)
       11.               └─SEMID:::updateEdgeCapacities.FlowGraph(this, ...)
       12.                 └─igraph::get.edge.ids(...)
       13.                   └─igraph::get_edge_ids(...)
       14.                     └─igraph:::el_to_vec(vp, call = rlang::caller_env())
       15.                       └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
       16.                         └─lifecycle:::deprecate_stop0(msg)
       17.                           └─rlang::cnd_signal(...)
      ── Error ('test_trekSepID.R:25:17'): Edgewise identification does not identify edges erroneously. ──
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: The `vp` argument of `get_edge_ids()` is not allowed to be a 2 times 2
      matrix as of igraph 2.1.5.
      Backtrace:
           ▆
        1. └─SEMID (local) trekSepId(MixedGraph(L, O)) at test_trekSepID.R:25:17
        2.   └─SEMID::generalGenericID(mixedGraph, list(tsIdStep)) at test_trekSepID.R:11:5
        3.     └─SEMID::generalGenericID(...)
        4.       └─SEMID (local) idStepFunction(mixedGraph, unsolvedParents, solvedParents, identifier)
        5.         └─SEMID::trekSeparationIdentifyStep(...) at test_trekSepID.R:8:9
        6.           └─mixedGraph$getTrekSystem(sources, c(targets, i), avoidRightEdges = toRemoveOnRight)
        7.             ├─SEMID::getTrekSystem(this, ...)
        8.             └─SEMID:::getTrekSystem.MixedGraph(this, ...)
        9.               └─this$.internalGraph$getTrekSystem(...)
       10.                 ├─SEMID::getTrekSystem(this, ...)
       11.                 └─SEMID:::getTrekSystem.LatentDigraph(this, ...)
       12.                   └─this$.internalGraph$getTrekSystem(...)
       13.                     ├─SEMID::getTrekSystem(this, ...)
       14.                     └─SEMID:::getTrekSystem.LatentDigraphFixedOrder(this, ...)
       15.                       └─this$.trekFlowGraph$updateEdgeCapacities(...)
       16.                         ├─SEMID::updateEdgeCapacities(this, ...)
       17.                         └─SEMID:::updateEdgeCapacities.FlowGraph(this, ...)
       18.                           └─igraph::get.edge.ids(...)
       19.                             └─igraph::get_edge_ids(...)
       20.                               └─igraph:::el_to_vec(vp, call = rlang::caller_env())
       21.                                 └─lifecycle::deprecate_stop("2.1.5", "get_edge_ids(vp = 'is not allowed to be a 2 times 2 matrix')")
       22.                                   └─lifecycle:::deprecate_stop0(msg)
       23.                                     └─rlang::cnd_signal(...)
      
      [ FAIL 7 | WARN 11 | SKIP 0 | PASS 965 ]
      Error: Test failures
      Execution halted
    ```

# sfnetworks

<details>

* Version: 0.6.5
* GitHub: https://github.com/luukvdmeer/sfnetworks
* Source code: https://github.com/cran/sfnetworks
* Date/Publication: 2024-12-06 15:40:02 UTC
* Number of recursive dependencies: 104

Run `revdepcheck::cloud_details(, "sfnetworks")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(sfnetworks)
      > 
      > test_check("sfnetworks")
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 276 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_paths.R:41:3'): Only the first from argument
                is used for shortest paths calculations ──
      Error in `get_all_shortest_paths_dijkstra_impl(graph, from = from, to = to, 
          weights = weights, mode = mode)`: Can't find vertex corresponding to `from`.
      Backtrace:
           ▆
        1. ├─testthat::expect_warning(...) at test_paths.R:41:3
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. ├─sfnetworks::st_network_paths(...)
        7. └─sfnetworks:::st_network_paths.sfnetwork(...)
        8.   └─sfnetworks:::get_all_shortest_paths(...)
        9.     └─igraph::all_shortest_paths(x, from, to, weights = weights, ...)
       10.       └─igraph:::get_all_shortest_paths_dijkstra_impl(graph, from = from, to = to, weights = weights, mode = mode)
       11.         └─igraph:::check_vertex(from)
       12.           └─cli::cli_abort(...)
       13.             └─rlang::abort(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 276 ]
      Error: Test failures
      Execution halted
    ```

# sharpshootR

<details>

* Version: 2.3.3
* GitHub: https://github.com/ncss-tech/sharpshootR
* Source code: https://github.com/cran/sharpshootR
* Date/Publication: 2025-04-17 06:50:02 UTC
* Number of recursive dependencies: 146

Run `revdepcheck::cloud_details(, "sharpshootR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sharpshootR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: table5.2
    > ### Title: Table 5.2 from Hole and Campbell, 1985.
    > ### Aliases: table5.2
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > 
    > data("table5.2")
    > 
    > if(requireNamespace("igraph")) {
    +   
    +   # note special incantation to get the "correct" graph structure
    +   g <- igraph::graph_from_adjacency_matrix(table5.2, mode = 'upper', diag = FALSE, weighted = TRUE)
    +   
    +   # visualize
    +   op <- par(no.readonly = TRUE)
    +   
    +   par(mar = c(0,0,0,0))
    +   plot(g)
    +   
    +   plot(g, vertex.size = sqrt(igraph::degree(g) * 25), vertex.label.family = 'sans')
    +   
    +   # find communities
    +   cm <- igraph::cluster_walktrap(g)
    +   plot(cm, g, vertex.label.family = 'sans')
    +   
    +   par(op)
    + }
    Error in `igraph::graph_from_adjacency_matrix()`:
    ! Cannot create a graph object because the adjacency matrix contains
      NAs.
    Backtrace:
        ▆
     1. └─igraph::graph_from_adjacency_matrix(table5.2, mode = "upper", diag = FALSE, weighted = TRUE)
     2.   └─igraph:::ensure_no_na(adjmatrix, "adjacency matrix")
     3.     └─cli::cli_abort(...)
     4.       └─rlang::abort(...)
    Execution halted
    ```

# TDApplied

<details>

* Version: 3.0.4
* GitHub: https://github.com/shaelebrown/TDApplied
* Source code: https://github.com/cran/TDApplied
* Date/Publication: 2024-10-29 08:30:02 UTC
* Number of recursive dependencies: 81

Run `revdepcheck::cloud_details(, "TDApplied")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘TDApplied-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot_vr_graph
    > ### Title: Plot a VR graph using the igraph package.
    > ### Aliases: plot_vr_graph
    > 
    > ### ** Examples
    > 
    > 
    > if(require("TDAstats") & require("igraph"))
    + {
    +   # simulate data from the unit circle and calculate 
    +   # its diagram
    +   df <- TDAstats::circle2d[sample(1:100,25),]
    +   diag <- TDAstats::calculate_homology(df,
    +                                        dim = 1,
    +                                        threshold = 2)
    +   
    +   # get minimum death radius of any data cluster
    +   min_death_H0 <- 
    +   min(diag[which(diag[,1] == 0),3L])
    +   
    +   # get birth and death radius of the loop
    +   loop_birth <- as.numeric(diag[nrow(diag),2L])
    +   loop_death <- as.numeric(diag[nrow(diag),3L])
    + 
    +   # compute VR graphs at radii half of 
    +   # min_death_H0 and the mean of loop_birth and 
    +   # loop_death, returning clusters
    +   graphs <- vr_graphs(X = df,eps = 
    +   c(0.5*min_death_H0,(loop_birth + loop_death)/2))
    +   
    +   # plot graph of smaller (first) radius
    +   plot_vr_graph(graphs = graphs,eps = 0.5*min_death_H0,
    +                   plot_isolated_vertices = TRUE)
    +   
    +   # plot graph of larger (second) radius
    +   plot_vr_graph(graphs = graphs,eps = (loop_birth + loop_death)/2)
    +   
    +   # repeat but with rownames for df, each vertex
    +   # will be plotted with its rownames
    +   rownames(df) <- paste0("V",1:25)
    +   graphs <- vr_graphs(X = df,eps = 
    +   c(0.5*min_death_H0,(loop_birth + loop_death)/2))
    +   plot_vr_graph(graphs = graphs,eps = 0.5*min_death_H0,
    +                   plot_isolated_vertices = TRUE)
    +   
    +   # plot without vertex labels
    +   plot_vr_graph(graphs = graphs,eps = (loop_birth + loop_death)/2,
    +                   vertex_labels = FALSE)
    +                  
    +   # plot only the graph component containing vertex "1"
    +   plot_vr_graph(graphs = graphs,eps = 0.5*min_death_H0,
    +                   component_of = "V1",plot_isolated_vertices = TRUE)
    +  
    +   # save the layout of the graph for adding features to 
    +   # the same graph layout, like color
    +   layout <- plot_vr_graph(graphs = graphs,eps = (loop_birth + loop_death)/2,
    +                             return_layout = TRUE,vertex_labels = TRUE)
    +   cols <- rep("blue",25)
    +   cols[1:5] <- "red"
    +   plot_vr_graph(graphs = graphs,eps = (loop_birth + loop_death)/2,cols = cols,
    +                   layout = layout)
    +   
    + }
    Loading required package: TDAstats
    
    Attaching package: ‘TDAstats’
    
    The following object is masked from ‘package:TDApplied’:
    
        permutation_test
    
    Loading required package: igraph
    
    Attaching package: ‘igraph’
    
    The following objects are masked from ‘package:stats’:
    
        decompose, spectrum
    
    The following object is masked from ‘package:base’:
    
        union
    
    Error in if (vr[1] == vr[2]) { : missing value where TRUE/FALSE needed
    Calls: plot_vr_graph -> <Anonymous> -> norm_coords -> .layout.norm.col
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 12.3Mb
      sub-directories of 1Mb or more:
        doc    8.2Mb
        libs   3.6Mb
    ```

# tidygraph

<details>

* Version: 1.3.1
* GitHub: https://github.com/thomasp85/tidygraph
* Source code: https://github.com/cran/tidygraph
* Date/Publication: 2024-01-30 13:40:02 UTC
* Number of recursive dependencies: 78

Run `revdepcheck::cloud_details(, "tidygraph")` for more info

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
      > library(tidygraph)
      
      Attaching package: 'tidygraph'
      
      The following object is masked from 'package:testthat':
      
          matches
      
      The following object is masked from 'package:stats':
      
          filter
      
      > 
      > test_check("tidygraph")
      Ungrouping `.data`...
      Splitting by nodes
      Unfocusing graph...
      `focus()` selected all nodes. Returning unfocused graph
      `focus()` didn't select any nodes. Returning unfocused graph
      Unfocusing graph...
      Unfocusing prior to grouping
      Unfocusing prior to morphing
      Unfocusing graph...
      Joining with `by = join_by(from, to)`
      Joining with `by = join_by(from, to)`
      Joining with `by = join_by(from, to)`
      Joining with `by = join_by(from, to)`
      Joining with `by = join_by(from, to)`
      Joining with `by = join_by(from, to)`
      Ungrouping `.data`...
      Subsetting by nodes
      Splitting by nodes
      Unfocusing prior to morphing
      [ FAIL 2 | WARN 20 | SKIP 1 | PASS 428 ]
      
      ══ Skipped tests (1) ═══════════════════════════════════════════════════════════
      • On CRAN (1): 'test-random-walk.R:19:3'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-group.R:18:3'): grouping returns integer vector ────────────────
      <dplyr:::mutate_error/rlang_error/error/condition>
      Error in `mutate(d_tmp, ...)`: i In argument: `group = fn`.
      Caused by error in `modularity.igraph()`:
      ! At vendor/cigraph/src/community/modularity.c:177 : Weight vector size differs from number of edges. Invalid value
      Backtrace:
           ▆
        1. ├─testthat::expect_type(get_group(gr, group_label_prop()), "integer") at test-group.R:18:3
        2. │ └─testthat::quasi_label(enquo(object), arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─tidygraph (local) get_group(gr, group_label_prop())
        5. │ └─gr %>% mutate(group = fn) %>% pull(group) at test-group.R:2:3
        6. ├─dplyr::pull(., group)
        7. ├─dplyr::mutate(., group = fn)
        8. ├─tidygraph:::mutate.tbl_graph(., group = fn)
        9. │ └─tidygraph::mutate_as_tbl(.data, !!!dot)
       10. │   ├─dplyr::mutate(d_tmp, ...)
       11. │   └─dplyr:::mutate.data.frame(d_tmp, ...)
       12. │     └─dplyr:::mutate_cols(.data, dplyr_quosures(...), by)
       13. │       ├─base::withCallingHandlers(...)
       14. │       └─dplyr:::mutate_col(dots[[i]], data, mask, new_columns)
       15. │         └─mask$eval_all_mutate(quo)
       16. │           └─dplyr (local) eval()
       17. ├─tidygraph::group_label_prop()
       18. │ ├─igraph::membership(...)
       19. │ └─igraph::cluster_label_prop(...)
       20. │   └─igraph:::cluster_label_prop0(graph, weights, mode, initial, fixed)
       21. │     ├─igraph::modularity(...)
       22. │     └─igraph:::modularity.igraph(...)
       23. └─base::.handleSimpleError(...)
       24.   └─dplyr (local) h(simpleError(msg, call))
       25.     └─rlang::abort(message, class = error_class, parent = parent, call = error_call)
      ── Error ('test-group.R:38:3'): grouping returns integer of correct length ─────
      <dplyr:::mutate_error/rlang_error/error/condition>
      Error in `mutate(d_tmp, ...)`: i In argument: `group = fn`.
      Caused by error in `modularity.igraph()`:
      ! At vendor/cigraph/src/community/modularity.c:177 : Weight vector size differs from number of edges. Invalid value
      Backtrace:
           ▆
        1. ├─testthat::expect_length(get_group(gr, group_label_prop()), igraph::gorder(gr)) at test-group.R:38:3
        2. │ └─testthat::quasi_label(enquo(object), arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─tidygraph (local) get_group(gr, group_label_prop())
        5. │ └─gr %>% mutate(group = fn) %>% pull(group) at test-group.R:2:3
        6. ├─dplyr::pull(., group)
        7. ├─dplyr::mutate(., group = fn)
        8. ├─tidygraph:::mutate.tbl_graph(., group = fn)
        9. │ └─tidygraph::mutate_as_tbl(.data, !!!dot)
       10. │   ├─dplyr::mutate(d_tmp, ...)
       11. │   └─dplyr:::mutate.data.frame(d_tmp, ...)
       12. │     └─dplyr:::mutate_cols(.data, dplyr_quosures(...), by)
       13. │       ├─base::withCallingHandlers(...)
       14. │       └─dplyr:::mutate_col(dots[[i]], data, mask, new_columns)
       15. │         └─mask$eval_all_mutate(quo)
       16. │           └─dplyr (local) eval()
       17. ├─tidygraph::group_label_prop()
       18. │ ├─igraph::membership(...)
       19. │ └─igraph::cluster_label_prop(...)
       20. │   └─igraph:::cluster_label_prop0(graph, weights, mode, initial, fixed)
       21. │     ├─igraph::modularity(...)
       22. │     └─igraph:::modularity.igraph(...)
       23. └─base::.handleSimpleError(...)
       24.   └─dplyr (local) h(simpleError(msg, call))
       25.     └─rlang::abort(message, class = error_class, parent = parent, call = error_call)
      
      [ FAIL 2 | WARN 20 | SKIP 1 | PASS 428 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘NetSwan’
    ```

# tilemaps

<details>

* Version: 0.2.0
* GitHub: https://github.com/kaerosen/tilemaps
* Source code: https://github.com/cran/tilemaps
* Date/Publication: 2020-07-10 04:20:02 UTC
* Number of recursive dependencies: 69

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
    Linking to GEOS 3.12.1, GDAL 3.8.4, PROJ 9.4.0; sf_use_s2() is TRUE
    > northeast <- governors[c(6,7,17,18,19,27,28,30,36,37,43),]
    > tile_map <- generate_map(northeast$geometry, square = FALSE)
    Error:
    ! The `neimode` argument of `bfs()` was deprecated in igraph 1.3.0 and
      is now defunct.
    ℹ Please use the `mode` argument instead.
    Backtrace:
        ▆
     1. └─tilemaps::generate_map(northeast$geometry, square = FALSE)
     2.   └─igraph::bfs(neighbor_graph, 1, neimode = "all", unreachable = FALSE)
     3.     └─lifecycle::deprecate_stop("1.3.0", "bfs(neimode = )", "bfs(mode = )")
     4.       └─lifecycle:::deprecate_stop0(msg)
     5.         └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘tilemaps.Rmd’ using rmarkdown
    
    Quitting from tilemaps.Rmd:32-41 [unnamed-chunk-2]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    NULL
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Error: processing vignette 'tilemaps.Rmd' failed with diagnostics:
    ℹ In argument: `tile_map = generate_map(geometry, square = FALSE,
      flat_topped = TRUE)`.
    Caused by error:
    ! The `neimode` argument of `bfs()` was deprecated in igraph 1.3.0 and
      is now defunct.
    ℹ Please use the `mode` argument instead.
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

# timeordered

<details>

* Version: 1.0.1
* GitHub: NA
* Source code: https://github.com/cran/timeordered
* Date/Publication: 2024-09-15 22:10:02 UTC
* Number of recursive dependencies: 13

Run `revdepcheck::cloud_details(, "timeordered")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘timeordered-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: transformspreadbyindividual
    > ### Title: A helper function to assess differences in spreading potential
    > ###   by vertex.
    > ### Aliases: transformspreadbyindividual
    > 
    > ### ** Examples
    > 
    > data(ants)
    > allindivs <- c(union(as.character(ants$VertexFrom), as.character(ants$VertexTo)), "NULL1", "NULL2")
    > g <- generatetonetwork(ants, allindivs)
    > sa <- spreadanalysis(g, seq(0,1000,by=50), 20)
    [1] 0.05
    [1] 0.1
    [1] 0.15
    [1] 0.2
    [1] 0.25
    [1] 0.3
    [1] 0.35
    [1] 0.4
    [1] 0.45
    [1] 0.5
    [1] 0.55
    [1] 0.6
    [1] 0.65
    [1] 0.7
    [1] 0.75
    [1] 0.8
    [1] 0.85
    [1] 0.9
    [1] 0.95
    [1] 1
    > b <- transformspreadbyindividual(sa)
    > plot(ts(b),plot.type="single",col=rainbow(ncol(b)),xlab="Time",ylab="Fraction reached")
    Error in xy.coords(x, NULL, log = log, setLab = FALSE) : 
      'list' object cannot be coerced to type 'double'
    Calls: plot -> plot.ts -> plotts -> xy.coords
    Execution halted
    ```

