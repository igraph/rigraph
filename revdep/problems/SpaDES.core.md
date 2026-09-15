# SpaDES.core (3.2.1)

* GitHub: <https://github.com/PredictiveEcology/SpaDES.core>
* Email: <mailto:eliot.mcintire@canada.ca>
* GitHub mirror: <https://github.com/cran/SpaDES.core>

Run `revdepcheck::revdep_details(, "SpaDES.core")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       Error in `if (grepl("In .+:", w$message)) {     warningSplitOnColon(w)     invokeRestart("muffleWarning") }`: the condition has length > 1
       Backtrace:
            ▆
         1. ├─SpaDES.core::simInit() at test-Copy.R:4:3
         2. ├─SpaDES.core::simInit()
         3. │ ├─SpaDES.core::simInit(...)
         4. │ └─SpaDES.core::simInit(...)
         5. │   ├─base::withCallingHandlers(...)
         6. │   └─SpaDES.core:::resolveDepsRunInitIfPoss(...)
         7. │     ├─SpaDES.core::.depsLoadOrder(sim, depsGr)
         8. │     └─SpaDES.core::.depsLoadOrder(sim, depsGr)
         9. │       └─igraph::topo_sort(simGraph, "out")
        10. │         └─lifecycle::deprecate_soft(...)
        11. │           └─lifecycle:::deprecate_warn0(...)
        12. │             ├─base::withRestarts(...)
        13. │             │ └─base (local) withOneRestart(expr, restarts[[1L]])
        14. │             │   └─base (local) doWithOneRestart(return(expr), restart)
        15. │             └─base::signalCondition(wrn)
        16. └─SpaDES.core (local) `<fn>`(`<lfcycl__>`)
       
       [ FAIL 1 | WARN 0 | SKIP 180 | PASS 1443 ]
       Error:
       ! Test failures.
       Execution halted
       Ran 1/1 deferred expressions
     ```

