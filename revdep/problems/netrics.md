# netrics (1.0.3)

* GitHub: <https://github.com/stocnet/netrics>
* Email: <mailto:james.hollway@graduateinstitute.ch>
* GitHub mirror: <https://github.com/cran/netrics>

Run `revdepcheck::revdep_details(, "netrics")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
         'test-measure_net.R:6:7'
       • grepl("tie_is_imbalanced", fn) && ob == "twomode" is TRUE (1):
         'test-mark_ties.R:5:7'
       • grepl("triad", fn) && is_twomode(data_objs[[ob]]) is TRUE (1):
         'test-motif_net.R:6:7'
       • grepl("triad|dyad", fn) && is_twomode(data_objs[[ob]]) is TRUE (2):
         'test-motif_nodes.R:5:7', 'test-motif_nodes.R:5:7'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('test-member_community.R:65:3'): every k-capable algorithm returns exactly k communities ──
       Expected the warnings and messages raised to match regexp "communities".
       Actual text:
       x | 
       Backtrace:
           ▆
        1. ├─testthat::expect_s3_class(...) at test-member_community.R:65:3
        2. │ └─testthat::quasi_label(enquo(object))
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─netrics:::expect_snet_warn(...)
        5.   └─testthat::expect_match(...) at ./helper-netrics.R:46:3
       
       [ FAIL 1 | WARN 0 | SKIP 38 | PASS 2774 ]
       Error:
       ! Test failures.
       Execution halted
     ```

