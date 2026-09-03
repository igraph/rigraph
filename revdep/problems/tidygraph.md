# tidygraph (1.3.1)

* GitHub: <https://github.com/thomasp85/tidygraph>
* Email: <mailto:thomasp85@gmail.com>
* GitHub mirror: <https://github.com/cran/tidygraph>

Run `revdepcheck::revdep_details(, "tidygraph")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     #
     # Edge Data: 5 × 2
        from    to
       <int> <int>
     1     1     2
     2     1     3
     3     2     3
     # ℹ 2 more rows
     > 
     > # Add edges
     > graph %>% bind_edges(data.frame(from = 1, to = 4:5))
     Error:
     ! The `edges` argument of `add_edges()` is not allowed to be a 2 times 2
       matrix as of igraph 2.1.5.
     Backtrace:
         ▆
      1. ├─graph %>% bind_edges(data.frame(from = 1, to = 4:5))
      2. └─tidygraph::bind_edges(., data.frame(from = 1, to = 4:5))
      3.   ├─... %gr_attr% .data
      4.   └─igraph::add_edges(.data, rbind(new_edges$from, new_edges$to))
      5.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      6.       └─lifecycle::deprecate_stop("2.1.5", paste0(fn, "(", arg, " = 'is not allowed to be a 2 times 2 matrix')"))
      7.         └─lifecycle:::deprecate_stop0(msg)
      8.           └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
         9.         └─lifecycle:::deprecate_stop0(msg)
        10.           └─rlang::cnd_signal(...)
       ── Error ('test-search.R:9:3'): search returns correct type ────────────────────
       <dplyr:::mutate_error/rlang_error/error/condition>
       Error in `mutate(d_tmp, ...)`: i In argument: `val = fn`.
       Caused by error:
       ! The `father` argument of `bfs()` was deprecated in igraph 2.2.0 and is now defunct.
       i Please use the `parent` argument instead.
       ── Error ('test-search.R:22:3'): search returns correct length ─────────────────
       <dplyr:::mutate_error/rlang_error/error/condition>
       Error in `mutate(d_tmp, ...)`: i In argument: `val = fn`.
       Caused by error:
       ! The `father` argument of `bfs()` was deprecated in igraph 2.2.0 and is now defunct.
       i Please use the `parent` argument instead.
       ── Error ('test-search.R:36:3'): search returns correct length ─────────────────
       <dplyr:::mutate_error/rlang_error/error/condition>
       Error in `mutate(d_tmp, ...)`: i In argument: `val = fn`.
       Caused by error:
       ! The `father` argument of `bfs()` was deprecated in igraph 2.2.0 and is now defunct.
       i Please use the `parent` argument instead.
       
       [ FAIL 13 | WARN 52 | SKIP 1 | PASS 387 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## In both

*   checking DESCRIPTION meta-information ... NOTE
     ```
       Missing dependency on R >= 4.1.0 because package code uses the pipe
       |> or function shorthand \(...) syntax added in R 4.1.0.
       File(s) using such syntax:
         ‘iterate.Rd’ ‘random_walk_rank.Rd’
     ```

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

