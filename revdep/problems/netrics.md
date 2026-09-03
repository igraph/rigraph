# netrics (0.4.0)

* GitHub: <https://github.com/stocnet/netrics>
* Email: <mailto:james.hollway@graduateinstitute.ch>
* GitHub mirror: <https://github.com/cran/netrics>

Run `revdepcheck::revdep_details(, "netrics")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
         'test-motif_net.R:6:7'
       • grepl("triad|dyad", fn) && is_twomode(data_objs[[ob]]) is TRUE (2):
         'test-motif_nodes.R:5:7', 'test-motif_nodes.R:5:7'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('test-tutorials_netrics.R:4:5'): netrics tutorial code runs without warnings or errors ──
       Expected `w` to be NULL.
       Differences:
       `actual` is an S3 object of class <lifecycle_warning_deprecated/rlang_warning/warning/condition>, a list
       `expected` is NULL
       
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

