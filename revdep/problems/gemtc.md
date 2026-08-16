# gemtc (1.1-1)

* GitHub: <https://github.com/gertvv/gemtc>
* Email: <mailto:gert@gertvv.nl>
* GitHub mirror: <https://github.com/cran/gemtc>

Run `revdepcheck::revdep_details(, "gemtc")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
     Complete output:
       > library(testthat)
       > test_check('gemtc', filter="unit")
       Loading required package: gemtc
       Loading required package: coda
       Saving _problems/test-unit-relative.effect-65.R
       [ FAIL 1 | WARN 11 | SKIP 0 | PASS 377 ]
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('test-unit-relative.effect.R:65:3'): tree.relative.effect handles a more complex tree ──
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

