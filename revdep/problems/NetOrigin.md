# NetOrigin (1.1-7)

* GitHub: <https://github.com/jmanitz/NetOrigin>
* Email: <mailto:r@manitz.org>
* GitHub mirror: <https://github.com/cran/NetOrigin>

Run `revdepcheck::revdep_details(, "NetOrigin")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘NetOrigin-Ex.R’ failed
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: origin-methods
     > ### Title: methods for origin estimation objects of class 'origin'
     > ### Aliases: origin-methods print.origin summary.origin plot.origin
     > ###   performance.origin
     > 
     > ### ** Examples
     > 
     > data(ptnGoe)
     > data(delayGoe)
     > 
     > res <- origin(events=delayGoe[10,-c(1:2)], type='centrality', graph=ptnGoe)
     This graph was created by an old(er) igraph version.
     ℹ Call `igraph::upgrade_graph()` on it to use with the current igraph version.
     For now we convert it on the fly...
     Error in aux %>% dplyr::filter(events > 0) %>% dplyr::select(id) : 
       could not find function "%>%"
     Calls: origin -> origin_centrality
     Execution halted
     ```

*   checking R code for possible problems ... NOTE
     ```
     origin_backtracking: no visible global function definition for ‘%>%’
     origin_centrality: no visible global function definition for ‘%>%’
     origin_edm: no visible global function definition for ‘%>%’
     Undefined global functions or variables:
       %>%
     ```

