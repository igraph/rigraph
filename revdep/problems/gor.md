# gor (2.0)

* Email: <mailto:casencha@unizar.es>
* GitHub mirror: <https://github.com/cran/gor>

Run `revdepcheck::revdep_details(, "gor")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > 
     > ### ** Examples
     > 
     > library(igraph)
     
     Attaching package: ‘igraph’
     
     The following objects are masked from ‘package:stats’:
     
         decompose, spectrum
     
     The following object is masked from ‘package:base’:
     
         union
     
     > ## Example with known vertex cover
     > K25 <- make_full_graph(25)   # Cover of size 24
     > X0 <- build_cover_approx(K25)
     > X0$size  # 24
     [1] 24
     > plot_cover(X0, K25)
     Error in gcov %>% add_edges(t(eG[as.numeric(incident(G, v)), ])) : 
       could not find function "%>%"
     Calls: plot_cover
     Execution halted
     ```

*   checking R code for possible problems ... NOTE
     ```
     compute_lower_bound_1tree: no visible global function definition for
       ‘%>%’
     crossover_tours: no visible global function definition for ‘%>%’
     plot_cover: no visible global function definition for ‘%>%’
     Undefined global functions or variables:
       %>%
     ```

