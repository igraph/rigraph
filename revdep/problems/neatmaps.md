# neatmaps (2.1.0)

* GitHub: <https://github.com/PhilBoileau/neatmaps>
* Email: <mailto:philippe_boileau@berkeley.edu>
* GitHub mirror: <https://github.com/cran/neatmaps>

Run `revdepcheck::revdep_details(, "neatmaps")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > ### ** Examples
     > 
     > # create the data frame using the network, node and edge attributes
     > df <- netsDataFrame(network_attr_df,
     +                     node_attr_df,
     +                     edge_df)
     Warning: `graph.density()` was deprecated in igraph 2.0.0.
     ℹ Please use `edge_density()` instead.
     ℹ The deprecated feature was likely used in the neatmaps package.
       Please report the issue to the authors.
     > 
     > # run the neatmap code on df
     > neat_res <- neatmap(df, scale_df = "ecdf", max_k = 3, reps = 100, 
     +                     xlab = "vars", ylab = "nets", xlab_cex = 1, ylab_cex = 1)
     Warning: Using `size` aesthetic for lines was deprecated in ggplot2 3.4.0.
     ℹ Please use `linewidth` instead.
     ℹ The deprecated feature was likely used in the dendextend package.
       Please report the issue at <https://github.com/talgalili/dendextend/issues>.
     > 
     > # get the consensus cluster results for each iteration
     > consensus_res_df <- consClustResTable(neat_res)
     Error in cc_res$clusterConsensus %>% as.data.frame : 
       could not find function "%>%"
     Calls: consClustResTable
     Execution halted
     ```

## In both

*   checking R code for possible problems ... NOTE
     ```
     consClustResTable: no visible global function definition for ‘%>%’
     Undefined global functions or variables:
       %>%
     
     Found if() conditions comparing class() to string:
     File ‘neatmaps/R/aggNodeAttr.R’: if (class(node_df) != "data.frame" || (("mean" %in% measure_of_cent) == FALSE) && ("median" %in% measure_of_cent) == FALSE) ...
     File ‘neatmaps/R/createNetworks.R’: if (class(edge_df) != "data.frame") ...
     File ‘neatmaps/R/getStructuralAttr.R’: if (class(net_list) != "list" || sum(sapply(net_list, class) == "igraph") != length(net_list)) ...
     File ‘neatmaps/R/netsDataFrame.R’: if (class(net_attr_df) != "data.frame" || class(node_attr_df) != "data.frame" || class(edge_df) != "data.frame" || nrow(net_attr_df) != nrow(node_attr_df) || nrow(net_attr_df) != nrow(edge_df)) ...
     Use inherits() (or maybe is()) instead.
     ```

