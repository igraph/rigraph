# migraph (1.7.0)

* GitHub: <https://github.com/stocnet/migraph>
* Email: <mailto:james.hollway@graduateinstitute.ch>
* GitHub mirror: <https://github.com/cran/migraph>

Run `revdepcheck::revdep_details(, "migraph")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       ══ Skipped tests (3) ═══════════════════════════════════════════════════════════
       • On Linux (1): 'test-model_tests.R:58:3'
       • Skipping slow functions in diffusion.Rmd (1): 'test-tutorials_migraph.R:12:5'
       • empty test (1): 'test-measure_over.R:1:1'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('test-tutorials_migraph.R:12:5'): migraph tutorial code runs without warnings or errors ──
       Expected `w` to be NULL.
       Differences:
       `actual` is an S3 object of class <lifecycle_warning_deprecated/rlang_warning/warning/condition>, a list
       `expected` is NULL
       
       Warning in expression 17 : rg <- create_ring(32, width = 2)
       Backtrace:
           ▆
        1. ├─testthat::expect_null(...) at test-tutorials_migraph.R:12:5
        2. │ └─testthat::quasi_label(enquo(object), label)
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─migraph:::check_tute_functions(tute, skip = "ergm\\(|play_diffusions\\(")
        5.   └─testthat::expect_null(...) at ./helper-functions.R:126:5
       
       [ FAIL 1 | WARN 0 | SKIP 3 | PASS 276 ]
       Error:
       ! Test failures.
       Execution halted
     ```

