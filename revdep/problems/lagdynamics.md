# lagdynamics (0.32)

* GitHub: <https://github.com/mohsaqr/lagdynamics>
* Email: <mailto:saqr@saqr.me>
* GitHub mirror: <https://github.com/cran/lagdynamics>

Run `revdepcheck::cloud_details(, "lagdynamics")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘lagdynamics-Ex.R’ failed
     The error most likely occurred in:
     
     > ### Name: lsa_to_tna
     > ### Title: Convert an lsa Fit to a tna Network
     > ### Aliases: lsa_to_tna lsa_to_tna.lsa lsa_to_tna.lsa_group
     > 
     > ### ** Examples
     > 
     > ## Don't show: 
     > if (requireNamespace("tna", quietly = TRUE)) withAutoprint({ # examplesIf
     + ## End(Don't show)
     + fit <- lsa(engagement)
     + net <- lsa_to_tna(fit, weights = "prob")
     + tna::centralities(net)
     + ## Don't show: 
     + }) # examplesIf
     > fit <- lsa(engagement)
     > net <- lsa_to_tna(fit, weights = "prob")
     > tna::centralities(net)
     Error in igraph::graph_from_adjacency_matrix(adjmatrix = x, mode = mode,  : 
       argument is missing, with no default
     Calls: withAutoprint ... as.igraph.matrix -> <Anonymous> -> migrate_recover_args
     Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     
     Error: processing vignette 'interop.Rmd' failed with diagnostics:
     argument is missing, with no default
     --- failed re-building ‘interop.Rmd’
     
     --- re-building ‘intro.Rmd’ using rmarkdown
     --- finished re-building ‘intro.Rmd’
     
     --- re-building ‘lag-transition-networks.Rmd’ using rmarkdown
     --- finished re-building ‘lag-transition-networks.Rmd’
     
     --- re-building ‘lagdynamics.Rmd’ using rmarkdown
     --- finished re-building ‘lagdynamics.Rmd’
     
     --- re-building ‘plotting.Rmd’ using rmarkdown
     --- finished re-building ‘plotting.Rmd’
     
     --- re-building ‘workflow.Rmd’ using rmarkdown
     --- finished re-building ‘workflow.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘interop.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```
