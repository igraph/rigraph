# rnmamod (0.5.1)

* GitHub: <https://github.com/LoukiaSpin/rnmamod>
* Email: <mailto:Spineli.Loukia@mh-hannover.de>
* GitHub mirror: <https://github.com/cran/rnmamod>

Run `revdepcheck::revdep_details(, "rnmamod")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: The `edges` argument of `add_edges()` is not allowed to be a 2 times 2 matrix as of igraph 2.1.5.
       Backtrace:
            ▆
         1. └─gemtc::mtc.nodesplit(...) at test-run.nodesplit.no.MOD.R:24:3
         2.   └─base::apply(...)
         3.     └─gemtc (local) FUN(newX[, i], ...)
         4.       └─gemtc:::mtc.model.run(...)
         5.         ├─base::do.call(mtc.model, modelArgs)
         6.         └─gemtc (local) `<fn>`(...)
         7.           └─gemtc:::mtc.model.call("mtc.model", model, ...)
         8.             ├─base::do.call(fn, c(list(model), list(...)))
         9.             └─gemtc:::mtc.model.nodesplit(`<named list>`, t1 = `<chr>`, t2 = `<chr>`)
        10.               └─gemtc:::connect.mds.forest(mtc.network.graph(network.indirect))
        11.                 └─igraph:::`+.igraph`(h, edges(t(tree$edges)))
        12.                   └─igraph::add_edges(e1, unnamed[[1]], attr = attr)
        13.                     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
        14.                       └─lifecycle::deprecate_stop("2.1.5", paste0(fn, "(", arg, " = 'is not allowed to be a 2 times 2 matrix')"))
        15.                         └─lifecycle:::deprecate_stop0(msg)
        16.                           └─rlang::cnd_signal(...)
       
       [ FAIL 1 | WARN 8 | SKIP 1 | PASS 24 ]
       Error:
       ! Test failures.
       Execution halted
     ```

