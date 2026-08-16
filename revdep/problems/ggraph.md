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

*   checking re-building of vignette outputs ... ERROR
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

