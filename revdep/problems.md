# BCT

<details>

* Version: 1.2
* GitHub: NA
* Source code: https://github.com/cran/BCT
* Date/Publication: 2022-05-12 14:00:05 UTC
* Number of recursive dependencies: 13

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
    Error in igraph::graph.lattice(length(subwords) + 1, directed = TRUE) : 
      argument "circular" is missing, with no default
    Calls: draw_models -> show_tree -> <Anonymous>
    Execution halted
    ```

## In both

*   checking C++ specification ... NOTE
    ```
      Specified C++11: please drop specification unless essential
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
    Loading required package: ggplot2
    > # use internal data set
    > data(lawdata)
    > df.att <- lawdata[[4]]
    > 
    > # three steps of data editing:
    > # 1. categorize variables 'years' and 'age' based on
    > # approximately three equally size groups (values based on cdf)
    > # 2. make sure all outcomes start from the value 0 (optional)
    > # 3. remove variable 'senior' as it consists of only unique values (thus redundant)
    > df.att.ed <- data.frame(
    +    status   = df.att$status,
    +    gender   = df.att$gender,
    +    office   = df.att$office-1,
    +    years    = ifelse(df.att$years<=3,0,
    +               ifelse(df.att$years<=13,1,2)),
    +    age      = ifelse(df.att$age<=35,0,
    +                 ifelse(df.att$age<=45,1,2)),
    +    practice = df.att$practice,
    +    lawschool= df.att$lawschool-1)
    > 
    > # association graph based on cutoff 0.15
    > assoc_graph(df.att.ed, 0.15)
    Error in igraph::distances(g) : 
      At vendor/cigraph/src/paths/dijkstra.c:128 : Weights must not contain NaN values. Invalid value
    Calls: assoc_graph ... layout_with_stress -> .layout_with_stress_dim -> <Anonymous>
    Execution halted
    ```

*   checking running R code from vignettes ... ERROR
    ```
    Errors in running code in vignettes:
    when running code in ‘joint_entropies.Rmd’
      ...
    21    0         4        45
    
    > library(ggraph)
    Loading required package: ggplot2
    
    > assoc_graph(dyad.var, 0.15)
    
      When sourcing ‘joint_entropies.R’:
    Error: At vendor/cigraph/src/paths/dijkstra.c:128 : Weights must not contain NaN values. Invalid value
    Execution halted
    
      ‘joint_entropies.Rmd’ using ‘UTF-8’... failed
      ‘prediction_power.Rmd’ using ‘UTF-8’... OK
      ‘univariate_bivariate_trivariate.Rmd’ using ‘UTF-8’... OK
      ‘variable_domains.Rmd’ using ‘UTF-8’... OK
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘joint_entropies.Rmd’ using rmarkdown
    
    Quitting from lines 96-98 [assoc_g] (joint_entropies.Rmd)
    Error: processing vignette 'joint_entropies.Rmd' failed with diagnostics:
    At vendor/cigraph/src/paths/dijkstra.c:128 : Weights must not contain NaN values. Invalid value
    --- failed re-building ‘joint_entropies.Rmd’
    
    --- re-building ‘prediction_power.Rmd’ using rmarkdown
    --- finished re-building ‘prediction_power.Rmd’
    
    --- re-building ‘univariate_bivariate_trivariate.Rmd’ using rmarkdown
    --- finished re-building ‘univariate_bivariate_trivariate.Rmd’
    
    --- re-building ‘variable_domains.Rmd’ using rmarkdown
    --- finished re-building ‘variable_domains.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘joint_entropies.Rmd’
    
    Error: Vignette re-building failed.
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
      [ FAIL 13 | WARN 9 | SKIP 1 | PASS 426 ]
      
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
      
      [ FAIL 13 | WARN 9 | SKIP 1 | PASS 426 ]
      Error: Test failures
      Execution halted
    ```

