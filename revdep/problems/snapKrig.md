# snapKrig (0.0.3)

* GitHub: <https://github.com/deankoch/snapKrig>
* Email: <mailto:deankoch@gmail.com>
* GitHub mirror: <https://github.com/cran/snapKrig>

Run `revdepcheck::revdep_details(, "snapKrig")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       > # * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
       > # * https://testthat.r-lib.org/articles/special-files.html
       > 
       > library(testthat)
       > library(snapKrig)
       > 
       > test_check("snapKrig")
       Saving _problems/test-sk_index-8.R
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 71 ]
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-sk_index.R:8:3'): invert sk_rescale (going down then up) and check factor 1 case ──
       Error in `sk_validate(sk_make(g))`: grid must have two or more grid lines along each dimension
       Backtrace:
           ▆
        1. ├─utils::modifyList(sk_pars(gdim), list(eps = 0.01)) at test-sk_index.R:8:3
        2. │ └─base::stopifnot(is.list(x), is.list(val))
        3. └─snapKrig::sk_pars(gdim)
        4.   └─snapKrig::sk(g)
        5.     └─snapKrig::sk_validate(sk_make(g))
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 71 ]
       Error:
       ! Test failures.
       Execution halted
     ```

