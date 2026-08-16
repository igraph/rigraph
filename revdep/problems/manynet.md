# manynet (2.2.3)

* GitHub: <https://github.com/stocnet/manynet>
* Email: <mailto:james.hollway@graduateinstitute.ch>
* GitHub mirror: <https://github.com/cran/manynet>

Run `revdepcheck::revdep_details(, "manynet")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
           ▆
        1. ├─testthat::expect_null(...) at test-tutorials_manynet.R:4:5
        2. │ └─testthat::quasi_label(enquo(object), label)
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─manynet:::check_tute_functions(tute)
        5.   └─testthat::expect_null(...) at ./helper-manynet.R:225:5
       ── Failure ('test-tutorials_manynet.R:4:5'): manynet tutorial code runs without warnings or errors ──
       Expected `w` to be NULL.
       Differences:
       `actual` is an S3 object of class <lifecycle_warning_deprecated/rlang_warning/warning/condition>, a list
       `expected` is NULL
       
       Warning in expression 46 : mean(as_matrix(s_women))
       Backtrace:
           ▆
        1. ├─testthat::expect_null(...) at test-tutorials_manynet.R:4:5
        2. │ └─testthat::quasi_label(enquo(object), label)
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─manynet:::check_tute_functions(tute)
        5.   └─testthat::expect_null(...) at ./helper-manynet.R:225:5
       
       [ FAIL 2 | WARN 644 | SKIP 77 | PASS 3304 ]
       Error:
       ! Test failures.
       Execution halted
     ```

