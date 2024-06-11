# degreenet

<details>

* Version: 1.3-5
* GitHub: NA
* Source code: https://github.com/cran/degreenet
* Date/Publication: 2024-02-01 08:00:05 UTC
* Number of recursive dependencies: 18

Run `revdepcheck::cloud_details(, "degreenet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘degreenet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: reedmolloy
    > ### Title: Generate a undirected network with a given sequence of degrees
    > ### Aliases: reedmolloy
    > ### Keywords: models
    > 
    > ### ** Examples
    > 
    > # Now, simulate a Poisson Lognormal distribution over 100
    > # observations with mean = -1 and s.d. = 1.
    > 
    > set.seed(2)
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

# qgraph

<details>

* Version: 1.9.8
* GitHub: https://github.com/SachaEpskamp/qgraph
* Source code: https://github.com/cran/qgraph
* Date/Publication: 2023-11-03 11:00:02 UTC
* Number of recursive dependencies: 88

Run `revdepcheck::cloud_details(, "qgraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘qgraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: smallworldness
    > ### Title: Compute the small-worldness index.
    > ### Aliases: smallworldness
    > ### Keywords: smallworld transitivity
    > 
    > ### ** Examples
    > 
    > set.seed(1)
    > # a regular lattice. Even if the small-worldness is higher than three, the average path length is 
    > # much higher than that of random networks.
    > regnet<-igraph::watts.strogatz.game(dim=1, size=1000, nei=10, p=0, loops=FALSE, multiple=FALSE)
    Warning: `watts.strogatz.game()` was deprecated in igraph 2.0.0.
    ℹ Please use `sample_smallworld()` instead.
    > smallworldness(regnet, B=10)
    Error in `sample_degseq()`:
    ! `arg` must be one of "configuration", "vl", "fast.heur.simple",
      "configuration.simple", or "edge.switching.simple", not "simple.no.multiple".
    Backtrace:
         ▆
      1. ├─qgraph::smallworldness(regnet, B = 10)
      2. │ └─base::lapply(...)
      3. │   └─qgraph (local) FUN(X[[i]], ...)
      4. │     └─igraph::degree.sequence.game(deg.dist, method = "simple.no.multiple")
      5. │       └─igraph::sample_degseq(out.deg = out.deg, in.deg = in.deg, method = method)
      6. │         └─igraph:::igraph.match.arg(method)
      7. │           └─rlang::arg_match(arg = arg, values = values, error_call = error_call)
      8. │             └─rlang::arg_match0(arg, values, error_arg, error_call = error_call)
      9. └─rlang:::stop_arg_match(w, values = x, error_arg = y, error_call = z)
     10.   └─rlang::abort(msg, call = error_call, arg = error_arg)
    Execution halted
    ```

# tidygraph

<details>

* Version: 1.3.1
* GitHub: https://github.com/thomasp85/tidygraph
* Source code: https://github.com/cran/tidygraph
* Date/Publication: 2024-01-30 13:40:02 UTC
* Number of recursive dependencies: 80

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
      [ FAIL 13 | WARN 2 | SKIP 1 | PASS 426 ]
      
      ══ Skipped tests (1) ═══════════════════════════════════════════════════════════
      • On CRAN (1): 'test-random-walk.R:19:3'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-graph_measures.R:17:3'): graph measures returns scalars ────────
      Error in `radius_dijkstra_impl(graph, weights = weights, mode = mode)`: At vendor/cigraph/src/paths/distances.c:328 : Weight vector length (1) does not match number of edges (8). Invalid value
      Backtrace:
          ▆
       1. ├─testthat::expect_length(graph_radius(), 1) at test-graph_measures.R:17:3
       2. │ └─testthat::quasi_label(enquo(object), arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─tidygraph::graph_radius()
       5.   └─igraph::radius(graph, mode)
       6.     └─igraph:::radius_dijkstra_impl(graph, weights = weights, mode = mode)
      ── Failure ('test-graph_measures.R:32:1'): graph context is empty after test ───
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-group.R:92:1'): graph context is empty after test ────────────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-group_by.R:15:1'): graph context is empty after test ─────────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-local.R:37:1'): graph context is empty after test ────────────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-morph.R:135:1'): graph context is empty after test ───────────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-mutate.R:15:1'): graph context is empty after test ───────────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-node_measures.R:78:1'): graph context is empty after test ────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-node_types.R:58:1'): graph context is empty after test ───────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-pair_measures.R:58:1'): graph context is empty after test ────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-search.R:58:1'): graph context is empty after test ───────────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-slice.R:27:1'): graph context is empty after test ────────────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-tidyr-utils.R:18:1'): graph context is empty after test ──────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      
      [ FAIL 13 | WARN 2 | SKIP 1 | PASS 426 ]
      Error: Test failures
      Execution halted
    ```

