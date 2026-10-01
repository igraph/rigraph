# handwriter (3.2.4)

* GitHub: <https://github.com/CSAFE-ISU/handwriter>
* Email: <mailto:srein@iastate.edu>
* GitHub mirror: <https://github.com/cran/handwriter>

Run `revdepcheck::revdep_details(, "handwriter")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘handwriter-Ex.R’ failed
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: calculate_accuracy
     > ### Title: Calculate Accuracy
     > ### Aliases: calculate_accuracy
     > 
     > ### ** Examples
     > 
     > # calculate the accuracy for example analysis performed on test documents and a model with 1 chain
     > calculate_accuracy(example_analysis)
     Error in pp %>% tidyr::separate(known_writer, into = c(NA, NA, "known_writer_ID"),  : 
       could not find function "%>%"
     Calls: calculate_accuracy
     Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     Error(s) in re-building vignettes:
       ...
     --- re-building ‘handwriter.Rmd’ using rmarkdown
     
     Quitting from handwriter.Rmd:74-77 [unnamed-chunk-4]
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     <error/rlang_error>
     Error in `counts %>% dplyr::group_by(writer, doc, cluster) %>% dplyr::summarize(count = dplyr::n())`:
     ! could not find function "%>%"
     ---
     Backtrace:
         ▆
      1. └─handwriter::format_template_data(template = template)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'handwriter.Rmd' failed with diagnostics:
     could not find function "%>%"
     --- failed re-building ‘handwriter.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘handwriter.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

*   checking R code for possible problems ... NOTE
     ```
     ...
     chooseCenters: no visible global function definition for ‘%>%’
     delete_crazy_graphs: no visible global function definition for ‘%>%’
     format_model_data: no visible global function definition for ‘%>%’
     format_questioned_data: no visible global function definition for ‘%>%’
     format_template_data: no visible global function definition for ‘%>%’
     get_cluster_fill_counts: no visible global function definition for
       ‘%>%’
     get_cluster_fill_rates: no visible global function definition for ‘%>%’
     get_strata: no visible global function definition for ‘%>%’
     plot_cluster_centers: no visible global function definition for ‘%>%’
     plot_cluster_fill_counts: no visible global function definition for
       ‘%>%’
     plot_cluster_fill_rates: no visible global function definition for
       ‘%>%’
     plot_credible_intervals: no visible global function definition for
       ‘%>%’
     plot_graphs : format_graph_df: no visible global function definition
       for ‘%>%’
     plot_graphs: no visible global function definition for ‘%>%’
     plot_posterior_probabilities: no visible global function definition for
       ‘%>%’
     plot_trace: no visible global function definition for ‘%>%’
     plot_writer_profiles: no visible global function definition for ‘%>%’
     Undefined global functions or variables:
       %>%
     ```

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

