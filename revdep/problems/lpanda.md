# lpanda (0.2.1)

* GitHub: <https://github.com/localpolitics/lpanda>
* Email: <mailto:bubenicek@pef.czu.cz>
* GitHub mirror: <https://github.com/cran/lpanda>

Run `revdepcheck::revdep_details(, "lpanda")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     +   show_legend = FALSE,
     +   do_not_print_to_console = TRUE
     + )
     > 
     > # candidate network snapshots coloured by groups and bordered by lists
     > plot_continuity(
     +   netdata,
     +   mark = "parties",
     +   show_candidate_networks = TRUE,
     +   do_not_print_to_console = TRUE
     + )
     Error:
     ! The `edges` argument of `add_edges()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─lpanda::plot_continuity(...)
      2.   └─igraph::add_edges(sub.sit.roku, t(edgelist.roku))
      3.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      4.       └─lifecycle::deprecate_stop(...)
      5.         └─lifecycle:::deprecate_stop0(msg)
      6.           └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
       ── Failure ('test-plot_continuity.R:160:3'): show_candidate_networks works also with only single election ──
       Expected `quiet_plot(...)` not to throw any errors.
       Actually got a <lifecycle_error_deprecated> with message:
         The `edges` argument of `add_edges()` supplied as a matrix should be a n times 2 matrix, not 2 times n as of igraph 2.1.5.
         i either transpose the matrix with t() or convert it to a data.frame with two columns.
       ── Failure ('test-plot_continuity.R:169:3'): show_candidate_networks works also with only single election ──
       Expected `quiet_plot(...)` not to throw any errors.
       Actually got a <lifecycle_error_deprecated> with message:
         The `edges` argument of `add_edges()` supplied as a matrix should be a n times 2 matrix, not 2 times n as of igraph 2.1.5.
         i either transpose the matrix with t() or convert it to a data.frame with two columns.
       ── Failure ('test-plot_continuity.R:176:3'): show_candidate_networks works with party and candidate highlighting ──
       Expected `quiet_plot(...)` not to throw any errors.
       Actually got a <lifecycle_error_deprecated> with message:
         The `edges` argument of `add_edges()` supplied as a matrix should be a n times 2 matrix, not 2 times n as of igraph 2.1.5.
         i either transpose the matrix with t() or convert it to a data.frame with two columns.
       ── Failure ('test-plot_continuity.R:181:3'): show_candidate_networks works with party and candidate highlighting ──
       Expected `quiet_plot(...)` not to throw any errors.
       Actually got a <lifecycle_error_deprecated> with message:
         The `edges` argument of `add_edges()` supplied as a matrix should be a n times 2 matrix, not 2 times n as of igraph 2.1.5.
         i either transpose the matrix with t() or convert it to a data.frame with two columns.
       
       [ FAIL 9 | WARN 0 | SKIP 0 | PASS 409 ]
       Error:
       ! Test failures.
       Execution halted
     ```

