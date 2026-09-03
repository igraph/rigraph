# joinery (1.0.1)

* GitHub: <https://github.com/edubruell/joinery>
* Email: <mailto:eduard.bruell@zew.de>
* GitHub mirror: <https://github.com/cran/joinery>

Run `revdepcheck::revdep_details(, "joinery")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘joinery-Ex.R’ failed
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: fuzzy_tokens
     > ### Title: Collapse near-duplicate tokens to a canonical form
     > ### Aliases: fuzzy_tokens
     > 
     > ### ** Examples
     > 
     > fuzzy_tokens(c("Neumann", "Neumaxn", "Neuman"), max_dist = 2)
     Error:
     ! The `edges` argument of `add_edges()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─joinery::fuzzy_tokens(c("Neumann", "Neumaxn", "Neuman"), max_dist = 2)
      2.   └─igraph::add_edges(g, t(edges))
      3.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      4.       └─lifecycle::deprecate_stop(...)
      5.         └─lifecycle:::deprecate_stop0(msg)
      6.           └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
       ══ Skipped tests (5) ═══════════════════════════════════════════════════════════
       • On CRAN (4): 'test_audit_strategy.R:391:1', 'test_sample_matches.R:353:1',
         'test_summarise_matches.R:290:1', 'test_summarise_matches.R:296:1'
       • recipes installed (1): 'test_tidymodels_shim.R:51:3'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test_preparers_datatable.R:1364:3'): fuzzy_tokens() performs fuzzy clustering correctly ──
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: The `edges` argument of `add_edges()` supplied as a matrix should be a n
       times 2 matrix, not 2 times n as of igraph 2.1.5.
       ℹ either transpose the matrix with t() or convert it to a data.frame with two
         columns.
       Backtrace:
           ▆
        1. └─joinery::fuzzy_tokens(x, max_dist = 2, method = "osa") at test_preparers_datatable.R:1364:3
        2.   └─igraph::add_edges(g, t(edges))
        3.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
        4.       └─lifecycle::deprecate_stop(...)
        5.         └─lifecycle:::deprecate_stop0(msg)
        6.           └─rlang::cnd_signal(...)
       
       [ FAIL 1 | WARN 0 | SKIP 5 | PASS 2252 ]
       Error:
       ! Test failures.
       Execution halted
     ```

