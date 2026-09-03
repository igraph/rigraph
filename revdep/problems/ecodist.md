# ecodist (2.1.3)

* GitHub: <https://github.com/phiala/ecodist>
* Email: <mailto:Sarah.Goslee@usda.gov>
* GitHub mirror: <https://github.com/cran/ecodist>

Run `revdepcheck::revdep_details(, "ecodist")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     + 			1, 1, 1, 0,
     + 			1, 0, 1, 1,
     + 			0, 0, 1, 1), ncol = 4, byrow = TRUE)
     > 
     > 	# the maximum Jaccard distance is 1
     > 	# regardless of how different the samples are
     > 	x.jd <- dist(x, "binary")
     > 
     > 	# estimate the true distance between those pairs
     > 	# by following the shorted path along connected sites
     > 	pathdist(x.jd)
     Error:
     ! The `edges` argument of `add_edges()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─ecodist::pathdist(x.jd)
      2.   └─igraph::add_edges(...)
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

