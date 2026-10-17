# specr (1.1.0)

* GitHub: <https://github.com/masurp/specr>
* Email: <mailto:phil.masur@gmail.com>
* GitHub mirror: <https://github.com/cran/specr>

Run `revdepcheck::revdep_details(, "specr")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       
       Models fitted based on 32 specifications
       Number of cores used: 1 
       
       Descriptive summary of the specification curve:
       
        median  mad  min  max  q25 q75
          0.44 0.26 0.16 0.66 0.23 0.6
       boundary (singular) fit: see help('isSingular')
       boundary (singular) fit: see help('isSingular')
       [ FAIL 1 | WARN 0 | SKIP 4 | PASS 273 ]
       
       ══ Skipped tests (4) ═══════════════════════════════════════════════════════════
       • On CRAN (4): 'test-infer_curve.R:136:3', 'test-infer_curve.R:224:3',
         'test-specr.R:60:3', 'test-specr.R:174:3'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('test-deprecated.R:44:3'): the plot functions still work ───────────
       Expected `deprecations(p <- plot_decisiontree(results_old))` to have length 1.
       Actual length: 2.
       
       [ FAIL 1 | WARN 0 | SKIP 4 | PASS 273 ]
       Error:
       ! Test failures.
       Execution halted
     ```

