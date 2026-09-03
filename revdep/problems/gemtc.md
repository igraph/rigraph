# gemtc (1.1-2)

* GitHub: <https://github.com/gertvv/gemtc>
* Email: <mailto:gert@gertvv.nl>
* GitHub mirror: <https://github.com/cran/gemtc>

Run `revdepcheck::revdep_details(, "gemtc")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-unit-nodesplit.R:196:3'): non-lexicographical treatment order works correctly ──
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: The `edges` argument of `add_edges()` supplied as a matrix should be a n
       times 2 matrix, not 2 times n as of igraph 2.1.5.
       ℹ either transpose the matrix with t() or convert it to a data.frame with two
         columns.
       Backtrace:
            ▆
         1. └─gemtc::mtc.model(network, type = "nodesplit", t1 = 10, t2 = 11) at test-unit-nodesplit.R:196:3
         2.   └─gemtc:::mtc.model.call("mtc.model", model, ...)
         3.     ├─base::do.call(fn, c(list(model), list(...)))
         4.     └─gemtc:::mtc.model.nodesplit(`<named list>`, t1 = 10, t2 = 11)
         5.       └─gemtc:::connect.mds.forest(mtc.network.graph(network.indirect))
         6.         └─igraph:::`+.igraph`(h, edges(t(tree$edges)))
         7.           └─igraph::add_edges(e1, unnamed[[1]], attr = attr)
         8.             └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
         9.               └─lifecycle::deprecate_stop(...)
        10.                 └─lifecycle:::deprecate_stop0(msg)
        11.                   └─rlang::cnd_signal(...)
       
       [ FAIL 1 | WARN 11 | SKIP 0 | PASS 377 ]
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

