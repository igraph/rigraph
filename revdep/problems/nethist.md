# nethist (1.0.0)

* GitHub: <https://github.com/EnigmaSong/nethist>
* Email: <mailto:youngseok.song@mail.wvu.edu>
* GitHub mirror: <https://github.com/cran/nethist>

Run `revdepcheck::revdep_details(, "nethist")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
           ▆
        1. ├─base::suppressMessages(...) at test_netsummary_plot.R:18:12
        2. │ └─base::withCallingHandlers(...)
        3. └─testthat::expect_no_error(...)
       ── Failure ('test_netsummary_plot.R:23:12'): netsummary_plot with sparse matrix object ──
       Expected `{ ... }` not to throw any errors.
       Actually got a <simpleError> with message:
         A is not a simple graph. All non-zero entries must be 1 (binary adjacency matrix).
       Backtrace:
           ▆
        1. ├─base::suppressMessages(...) at test_netsummary_plot.R:23:12
        2. │ └─base::withCallingHandlers(...)
        3. └─testthat::expect_no_error(...)
       ── Error ('test_summary.R:3:1'): (code run outside of `test_that()`) ───────────
       Error in `multinethist.array(array(A, dim = c(nrow(A), ncol(A), 1)), h, common_f, method, control, ...)`: Layer 1: A is not a simple graph. All non-zero entries must be 1 (binary adjacency matrix).
       Backtrace:
           ▆
        1. ├─nethist::multinethist(...) at test_summary.R:3:1
        2. └─nethist:::multinethist.matrix(...)
        3.   └─nethist:::multinethist.array(...)
       
       [ FAIL 5 | WARN 5 | SKIP 1 | PASS 210 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

