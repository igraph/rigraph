# bitriad (0.4)

* Email: <mailto:cornelioid@gmail.com>
* GitHub mirror: <https://github.com/cran/bitriad>

Run `revdepcheck::revdep_details(, "bitriad")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: triad
     > ### Title: Affiliation network triads
     > ### Aliases: triad make_triad is_triad triad_class layout_triad plot_triad
     > ###   an_triad is.triad triad.class an.triad layout.triad plotTriad
     > 
     > ### ** Examples
     > 
     > tr <- make_triad(lambda = c(3,1,1), w = 2)
     Error:
     ! The `edges` argument of `add_edges()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─bitriad::make_triad(lambda = c(3, 1, 1), w = 2)
      2.   └─igraph::add_edges(tr, t(el))
      3.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      4.       └─lifecycle::deprecate_stop(...)
      5.         └─lifecycle:::deprecate_stop0(msg)
      6.           └─rlang::cnd_signal(...)
     Execution halted
     ```

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

