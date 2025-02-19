# pomdp

<details>

* Version: 1.2.3
* GitHub: https://github.com/mhahsler/pomdp
* Source code: https://github.com/cran/pomdp
* Date/Publication: 2024-05-05 21:10:06 UTC
* Number of recursive dependencies: 70

Run `revdepcheck::cloud_details(, "pomdp")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘pomdp-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: RussianTiger
    > ### Title: Russian Tiger Problem POMDP Specification
    > ### Aliases: RussianTiger
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > data("RussianTiger")
    > RussianTiger
    POMDP, list - Russian Tiger Problem
      Discount factor: 1
      Horizon: Inf epochs
      Size: 3 states / 4 actions / 3 obs.
      Start: 0.5, 0.5, 0
      Solved: FALSE
    
      List components: ‘name’, ‘discount’, ‘horizon’, ‘states’, ‘actions’,
        ‘observations’, ‘transition_prob’, ‘observation_prob’, ‘reward’,
        ‘start’, ‘terminal_values’, ‘info’
    > 
    > # states, actions, and observations
    > RussianTiger$states  
    [1] "tiger-left"  "tiger-right" "done"       
    > RussianTiger$actions 
    [1] "listen"     "open-left"  "open-right" "nothing"   
    > RussianTiger$observations
    [1] "tiger-left"  "tiger-right" "done"       
    > 
    > # reward (-Inf indicates unavailable actions)
    > RussianTiger$reward
          action start.state end.state observation value
    1     listen        <NA>      <NA>        <NA>    -1
    2    nothing        <NA>      <NA>        <NA>  -Inf
    3       <NA>        done      <NA>        <NA>  -Inf
    4    nothing        done      <NA>        <NA>     0
    5  open-left  tiger-left      <NA>        <NA> -1000
    6 open-right tiger-right      <NA>        <NA> -1000
    7  open-left tiger-right      <NA>        <NA>    10
    8 open-right  tiger-left      <NA>        <NA>    10
    > 
    > sapply(RussianTiger$states, FUN = function(s) actions(RussianTiger, s))
    $`tiger-left`
    [1] "listen"     "open-left"  "open-right"
    
    $`tiger-right`
    [1] "listen"     "open-left"  "open-right"
    
    $done
    [1] "nothing"
    
    > 
    > plot_transition_graph(RussianTiger, vertex.size = 30, edge.arrow.size = .3, margin = .5)
    > 
    > # absorbing states
    > absorbing_states(RussianTiger)
     tiger-left tiger-right        done 
          FALSE       FALSE        TRUE 
    > 
    > # solve the problem.
    > sol <- solve_POMDP(RussianTiger)
    > policy(sol)
         tiger-left  tiger-right      done     action
    1  -1000.000000    10.000000  -2000.00  open-left
    2   -176.217714     8.567046 -15695.15     listen
    3    -29.667899     7.113638 -25560.42     listen
    4     -2.629696     5.544325 -31493.06     listen
    5      0.000000     0.000000      0.00    nothing
    6      3.318222     3.318222 -33493.06     listen
    7      5.544325    -2.629696 -31493.06     listen
    8      7.113638   -29.667899 -25560.42     listen
    9      8.567046  -176.217714 -15695.15     listen
    10    10.000000 -1000.000000  -2000.00 open-right
    > plot_policy_graph(sol)
    Error in `igraph::dfs()`:
    ! `...` must be empty.
    ✖ Problematic argument:
    • unreach = FALSE
    Backtrace:
         ▆
      1. └─pomdp::plot_policy_graph(sol)
      2.   └─pomdp:::.plot.igraph(...)
      3.     └─pomdp::policy_graph(...)
      4.       └─pomdp:::.policy_graph(...)
      5.         ├─igraph::delete_vertices(...)
      6.         │ └─igraph:::as_igraph_vs(graph, v)
      7.         ├─base::setdiff(...)
      8.         │ └─base::as.vector(y)
      9.         └─igraph::dfs(policy_graph, root = initial_pg_node, unreach = FALSE)
     10.           └─rlang::check_dots_empty()
     11.             └─rlang:::action_dots(...)
     12.               ├─base (local) try_dots(...)
     13.               └─rlang (local) action(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library("testthat")
      > library("pomdp")
      > 
      > test_check("pomdp")
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 104 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-solve_POMDP.R:9:1'): (code run outside of `test_that()`) ───────
      <rlib_error_dots_nonempty/rlib_error_dots/rlang_error/error/condition>
      Error in `igraph::dfs(policy_graph, root = initial_pg_node, unreach = FALSE)`: `...` must be empty.
      ✖ Problematic argument:
      • unreach = FALSE
      Backtrace:
           ▆
        1. └─pomdp::plot_policy_graph(sol) at test-solve_POMDP.R:9:1
        2.   └─pomdp:::.plot.igraph(...)
        3.     └─pomdp::policy_graph(...)
        4.       └─pomdp:::.policy_graph(...)
        5.         ├─igraph::delete_vertices(...)
        6.         │ └─igraph:::as_igraph_vs(graph, v)
        7.         ├─base::setdiff(...)
        8.         │ └─base::as.vector(y)
        9.         └─igraph::dfs(policy_graph, root = initial_pg_node, unreach = FALSE)
       10.           └─rlang::check_dots_empty()
       11.             └─rlang:::action_dots(...)
       12.               ├─base (local) try_dots(...)
       13.               └─rlang (local) action(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 104 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘gridworlds.Rmd’ using rmarkdown
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.3Mb
      sub-directories of 1Mb or more:
        libs   5.7Mb
    ```

