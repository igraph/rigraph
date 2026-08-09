# checked (0.5.4)

* GitHub: <https://github.com/Genentech/checked>
* Email: <mailto:sz.maksymiuk@gmail.com>
* GitHub mirror: <https://github.com/cran/checked>

Run `revdepcheck::revdep_details(, "checked")` for more info

## Newly broken

*   checking tests ...
     ```
       Running ‘testthat.R’ [708s/266s]
      [708s/266s] ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       + Message
       +   [][check] rev.both.error finished with 1 ERROR, 1 WARNING [7/7] ()
       +   Finished in 
       
       
       ── Snapshots ───────────────────────────────────────────────────────────────────
       To review and process snapshots locally:
       * Download and unzip artifact.
       * Copy 'tests/testthat/_snaps' to local package.
       * Run `testthat::snapshot_accept()` to accept all changes.
       * Run `testthat::snapshot_review()` to review all changes.
       [ FAIL 1 | WARN 322 | SKIP 0 | PASS 171 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# cranly (0.6.0)

* GitHub: <https://github.com/ikosmidis/cranly>
* Email: <mailto:ioannis.kosmidis@warwick.ac.uk>
* GitHub mirror: <https://github.com/cran/cranly>

Run `revdepcheck::revdep_details(, "cranly")` for more info

## Newly broken

*   checking examples with --run-donttest ... [554s/569s] ERROR
     ```
     ...
     > cran_db <- clean_CRAN_db()
     > package_network <- build_network(cran_db)
     > 
     > package_summaries <- summary(package_network)
     Error:
     ! The `scale` argument of `eigen_centrality()` always as if TRUE as of
       igraph 2.1.1.
     ℹ Normalization is always performed
     Backtrace:
         ▆
      1. ├─base::summary(package_network)
      2. └─cranly:::summary.cranly_network(package_network)
      3.   └─igraph::eigen_centrality(cranly_graph, scale = FALSE)
      4.     └─lifecycle::deprecate_stop(...) at igraph/R/centrality.R:1493:7
      5.       └─lifecycle:::deprecate_stop0(msg)
      6.         └─rlang::cnd_signal(...)
     Execution halted
     Examples with CPU (user + system) or elapsed time > 5s
                                             user system elapsed
     as.igraph.cranly_network             185.905  0.324 188.128
     build_network.cranly_db               92.796  0.012  94.868
     plot.cranly_network                   92.603  0.066  96.060
     extractor-functions                   85.480  0.042  87.510
     build_dependence_tree.cranly_network  29.500  0.053  31.353
     clean_CRAN_db                         26.577  0.007  28.678
     ```

*   checking re-building of vignette outputs ... [22s/22s] ERROR
     ```
     ...
         ▆
      1. ├─base::summary(package_network)
      2. └─cranly:::summary.cranly_network(package_network)
      3.   └─igraph::eigen_centrality(cranly_graph, scale = FALSE)
      4.     └─lifecycle::deprecate_stop(...) at igraph/R/centrality.R:1493:7
      5.       └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'cranly.Rmd' failed with diagnostics:
     The `scale` argument of `eigen_centrality()` always as if TRUE as of
     igraph 2.1.1.
     ℹ Normalization is always performed
     --- failed re-building ‘cranly.Rmd’
     
     --- re-building ‘dependence_trees.Rmd’ using rmarkdown
     --- finished re-building ‘dependence_trees.Rmd’
     
     --- re-building ‘extractors.Rmd’ using rmarkdown
     --- finished re-building ‘extractors.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘cranly.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# gemtc (1.1-1)

* GitHub: <https://github.com/gertvv/gemtc>
* Email: <mailto:gert@gertvv.nl>
* GitHub mirror: <https://github.com/cran/gemtc>

Run `revdepcheck::revdep_details(, "gemtc")` for more info

## Newly broken

*   checking tests ...
     ```
       Running ‘test.R’ [13s/13s]
      [14s/13s] ERROR
     Running the tests in ‘tests/test.R’ failed.
     Last 13 lines of output:
       Expected `x` to be equivalent to `expected`.
       3/7 mismatches (average diff: 1.33)
       [3]  0 - -1 ==  1
       [5]  1 -  0 ==  1
       [6] -1 -  1 == -2
       Backtrace:
           ▆
        1. └─testthat::expect_that(...) at test-unit-relative.effect.R:65:3
        2.   └─testthat (local) condition(object)
        3.     └─testthat::expect_equivalent(x, expected, expected.label = label)
       
       [ FAIL 1 | WARN 11 | SKIP 0 | PASS 377 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# ggraph (2.2.2)

* GitHub: <https://github.com/thomasp85/ggraph>
* Email: <mailto:thomasp85@gmail.com>
* GitHub mirror: <https://github.com/cran/ggraph>

Run `revdepcheck::revdep_details(, "ggraph")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     Caused by error:
     ! The `father` argument of `bfs()` was deprecated in igraph 2.2.0 and is
       now defunct.
     ℹ Please use the `parent` argument instead.
     Backtrace:
          ▆
       1. ├─tbl_graph(flare$vertices, flare$edges) %>% ...
       2. ├─dplyr::mutate(...)
       3. ├─tidygraph:::mutate.tbl_graph(...)
       4. │ └─tidygraph::mutate_as_tbl(.data, !!!dot)
       5. │   ├─dplyr::mutate(d_tmp, ...)
       6. │   └─dplyr:::mutate.data.frame(d_tmp, ...)
       7. │     └─dplyr:::mutate_cols(.data, dplyr_quosures(...), by)
       8. │       ├─base::withCallingHandlers(...)
       9. │       └─dplyr:::mutate_col(dots[[i]], data, mask, new_columns)
      10. │         └─mask$eval_all_mutate(quo)
      11. │           └─dplyr (local) eval()
      12. └─tidygraph::map_bfs_chr(...)
      13.   └─tidygraph::map_bfs(...)
      14.     └─tidygraph:::bfs_df(graph, root, mode, unreachable)
      15.       └─igraph::bfs(...)
      16.         └─lifecycle::deprecate_stop("2.2.0", "bfs(father = )", "bfs(parent = )") at igraph/R/structural-properties.R:3771:5
      17.           └─lifecycle:::deprecate_stop0(msg)
      18.             └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking re-building of vignette outputs ... [22s/20s] ERROR
     ```
     ...
      16.           └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'Edges.Rmd' failed with diagnostics:
     ℹ In argument: `Class = map_bfs_back_chr(...)`.
     Caused by error:
     ! The `father` argument of `bfs()` was deprecated in igraph 2.2.0 and is
       now defunct.
     ℹ Please use the `parent` argument instead.
     --- failed re-building ‘Edges.Rmd’
     
     --- re-building ‘Layouts.Rmd’ using rmarkdown
     --- finished re-building ‘Layouts.Rmd’
     
     --- re-building ‘Nodes.Rmd’ using rmarkdown
     --- finished re-building ‘Nodes.Rmd’
     
     --- re-building ‘tidygraph.Rmd’ using rmarkdown
     --- finished re-building ‘tidygraph.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘Edges.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# migraph (1.6.8)

* GitHub: <https://github.com/stocnet/migraph>
* Email: <mailto:james.hollway@graduateinstitute.ch>
* GitHub mirror: <https://github.com/cran/migraph>

Run `revdepcheck::revdep_details(, "migraph")` for more info

## Newly broken

*   checking tests ...
     ```
       Running ‘testthat.R’ [21s/13s]
      [22s/13s] ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       `expected` is NULL
       
       Warning in expression 17 : rg <- create_ring(32, width = 2)
       Backtrace:
           ▆
        1. ├─testthat::expect_null(...) at test-tutorials_migraph.R:12:5
        2. │ └─testthat::quasi_label(enquo(object), label)
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─migraph:::check_tute_functions(tute, skip = "ergm\\(|play_diffusions\\(")
        5.   └─testthat::expect_null(...) at ./helper-functions.R:126:5
       
       [ FAIL 1 | WARN 0 | SKIP 3 | PASS 260 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# netrics (0.4.0)

* GitHub: <https://github.com/stocnet/netrics>
* Email: <mailto:james.hollway@graduateinstitute.ch>
* GitHub mirror: <https://github.com/cran/netrics>

Run `revdepcheck::revdep_details(, "netrics")` for more info

## Newly broken

*   checking tests ...
     ```
       Running ‘testthat.R’ [49s/22s]
      [50s/22s] ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       
       Warning in expression 18 : (graphr(create_ring(50, width = 2), "circle") + ggtitle("The Ring Two", 
       Warning in expression 18 :     subtitle = "No different?"))
       Backtrace:
           ▆
        1. ├─testthat::expect_null(...) at test-tutorials_netrics.R:4:5
        2. │ └─testthat::quasi_label(enquo(object), label)
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─netrics:::check_tute_functions(tute)
        5.   └─testthat::expect_null(...) at ./helper-netrics.R:190:5
       
       [ FAIL 1 | WARN 0 | SKIP 41 | PASS 1803 ]
       Error:
       ! Test failures.
       Execution halted
     ```

