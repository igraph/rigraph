# iDINGO (1.0.4)

* Email: <mailto:cclass@butler.edu>
* GitHub mirror: <https://github.com/cran/iDINGO>

Run `revdepcheck::revdep_details(, "iDINGO")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > # Plot the iDINGO result using a p-value threshold of 0.01.
     > plotNetwork(brca$fit, threshold = 0.01, thresh.type = "p.val")
     Warning: `graph.data.frame()` was deprecated in igraph 2.0.0.
     ℹ Please use `graph_from_data_frame()` instead.
     ℹ The deprecated feature was likely used in the iDINGO package.
       Please report the issue to the authors.
     Warning: `get.data.frame()` was deprecated in igraph 2.0.0.
     ℹ Please use `as_data_frame()` instead.
     ℹ The deprecated feature was likely used in the visNetwork package.
       Please report the issue at
       <https://github.com/datastorm-open/visNetwork/issues>.
     Warning: `is.directed()` was deprecated in igraph 2.0.0.
     ℹ Please use `is_directed()` instead.
     ℹ The deprecated feature was likely used in the visNetwork package.
       Please report the issue at
       <https://github.com/datastorm-open/visNetwork/issues>.
     Warning: `layout.norm()` was deprecated in igraph 2.0.0.
     ℹ Please use `norm_coords()` instead.
     ℹ The deprecated feature was likely used in the visNetwork package.
       Please report the issue at
       <https://github.com/datastorm-open/visNetwork/issues>.
     Error in visNet %>% visGroups(groupname = groups[1], color = list(background = "lightgreen",  : 
       could not find function "%>%"
     Calls: plotNetwork
     Execution halted
     ```

*   checking R code for possible problems ... NOTE
     ```
     plotNetwork: no visible global function definition for ‘%>%’
     Undefined global functions or variables:
       %>%
     ```

