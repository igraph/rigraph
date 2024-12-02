# drake

<details>

* Version: 7.13.10
* GitHub: https://github.com/ropensci/drake
* Source code: https://github.com/cran/drake
* Date/Publication: 2024-05-15 20:40:05 UTC
* Number of recursive dependencies: 164

Run `revdepcheck::cloud_details(, "drake")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘drake-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: target
    > ### Title: Customize a target in 'drake_plan()'. *[Stable]*
    > ### Aliases: target
    > 
    > ### ** Examples
    > 
    > # Use target() to create your own custom columns in a drake plan.
    > # See ?triggers for more on triggers.
    > drake_plan(
    +   website_data = target(
    +     download_data("www.your_url.com"),
    +     trigger = "always",
    +     custom_column = 5
    +   ),
    +   analysis = analyze(website_data)
    + )
    # A tibble: 2 × 4
      target       command                           trigger       custom_column
      <chr>        <expr_lst>                        <expr_lst>            <dbl>
    1 website_data download_data("www.your_url.com") "always"                  5
    2 analysis     analyze(website_data)             NA_character_            NA
    > models <- c("glm", "hierarchical")
    > plan <- drake_plan(
    +   data = target(
    +     get_data(x),
    +     transform = map(x = c("simulated", "survey"))
    +   ),
    +   analysis = target(
    +     analyze_data(data, model),
    +     transform = cross(data, model = !!models, .id = c(x, model))
    +   ),
    +   summary = target(
    +     summarize_analysis(analysis),
    +     transform = map(analysis, .id = c(x, model))
    +   ),
    +   results = target(
    +     bind_rows(summary),
    +     transform = combine(summary, .by = data)
    +   )
    + )
    Error: A grouping variable for target summary is either undefined or improperly invoked. Details: https://books.ropensci.org/drake/static.html#grouping-variables
    Execution halted
    ```

# sfnetworks

<details>

* Version: 0.6.4
* GitHub: https://github.com/luukvdmeer/sfnetworks
* Source code: https://github.com/cran/sfnetworks
* Date/Publication: 2024-04-09 22:40:02 UTC
* Number of recursive dependencies: 106

Run `revdepcheck::cloud_details(, "sfnetworks")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(sfnetworks)
      > 
      > test_check("sfnetworks")
      [ FAIL 1 | WARN 1 | SKIP 0 | PASS 167 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_morphers.R:90:1'): (code run outside of `test_that()`) ─────────
      Error in `st_line_merge.sfc(st_combine(orig_geoms))`: inherits(x, "sfc_MULTILINESTRING") is not TRUE
      Backtrace:
           ▆
        1. ├─tidygraph::convert(net_l, to_spatial_smooth) at test_morphers.R:90:1
        2. └─tidygraph:::convert.tbl_graph(net_l, to_spatial_smooth)
        3.   ├─tidygraph::crystallise(morph(.data, .f, ...))
        4.   ├─tidygraph::morph(.data, .f, ...)
        5.   └─sfnetworks:::morph.sfnetwork(.data, .f, ...)
        6.     └─base::tryCatch(...)
        7.       └─base (local) tryCatchList(expr, classes, parentenv, handlers)
        8.         └─base (local) tryCatchOne(expr, names, parentenv, handlers[[1L]])
        9.           └─value[[3L]](cond)
       10.             └─base::tryCatch(morph(as_tbl_graph(.data), ...), error = function(e2) stop(e1))
       11.               └─base (local) tryCatchList(expr, classes, parentenv, handlers)
       12.                 └─base (local) tryCatchOne(expr, names, parentenv, handlers[[1L]])
       13.                   └─value[[3L]](cond)
      
      [ FAIL 1 | WARN 1 | SKIP 0 | PASS 167 ]
      Error: Test failures
      Execution halted
    ```

*   checking running R code from vignettes ... ERROR
    ```
    Errors in running code in vignettes:
    when running code in ‘sfn02_preprocess_clean.Rmd’
      ...
    +     lwd = 4)
    
    > plot(st_geometry(subdivision, "nodes"), pch = 20, 
    +     cex = 1.5, add = TRUE)
    
    > smoothed = convert(subdivision, to_spatial_smooth)
    
      When sourcing ‘sfn02_preprocess_clean.R’:
    Error: inherits(x, "sfc_MULTILINESTRING") is not TRUE
    Execution halted
    when running code in ‘sfn05_morphers.Rmd’
      ...
    [90m# A tibble: 1 × 7[39m
       from    to name  type                    geometry  flow .tidygraph_edge_index
      [3m[90m<int>[39m[23m [3m[90m<int>[39m[23m [3m[90m<chr>[39m[23m [3m[90m<fct>[39m[23m           [3m[90m<LINESTRING [m]>[39m[23m [3m[90m<dbl>[39m[23m [3m[90m<list>[39m[23m               
    [90m1[39m   118   119 [31mNA[39m    servi… (4150716 3207080, 415071…   164 [90m<int [2]>[39m            
    
    > smoothed_net = convert(net, to_spatial_smooth)
    
      When sourcing ‘sfn05_morphers.R’:
    Error: Invalid vertex name(s)
    Execution halted
    
      ‘sfn01_structure.Rmd’ using ‘UTF-8’... OK
      ‘sfn02_preprocess_clean.Rmd’ using ‘UTF-8’... failed
      ‘sfn03_join_filter.Rmd’ using ‘UTF-8’... OK
      ‘sfn04_routing.Rmd’ using ‘UTF-8’... OK
      ‘sfn05_morphers.Rmd’ using ‘UTF-8’... failed
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘sfn01_structure.Rmd’ using rmarkdown
    ```

# targets

<details>

* Version: 1.9.0
* GitHub: https://github.com/ropensci/targets
* Source code: https://github.com/cran/targets
* Date/Publication: 2024-11-20 08:30:03 UTC
* Number of recursive dependencies: 160

Run `revdepcheck::cloud_details(, "targets")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > Sys.setenv(PROCESSX_NOTIFY_OLD_SIGCHLD = "true")
      > library(testthat)
      > library(targets)
      
      Attaching package: 'targets'
      
      The following object is masked from 'package:testthat':
      
          matches
      
      > test_check("targets", reporter = ProgressReporter$new())
      ✔ | F W  S  OK | Context
      
      ⠏ |          0 | class_active                                                   
      ⠋ |          1 | class_active                                                   
      ⠼ |         15 | class_active                                                   
      ⠏ |         20 | class_active                                                   
      ⠋ |         21 | class_active                                                   
      ✔ |         21 | class_active
      
      ⠏ |          0 | class_auto                                                     
      ✔ |      2   2 | class_auto
      
      ⠏ |          0 | class_aws                                                      
      ⠧ |          8 | class_aws                                                      
      ⠦ |      1  16 | class_aws                                                      
      ✔ |      3  20 | class_aws
      
      ⠏ |          0 | class_aws_file                                                 
      ✔ |      6   2 | class_aws_file
      
      ⠏ |          0 | class_backoff                                                  
      ⠦ |         17 | class_backoff                                                  
      ✔ |         21 | class_backoff
      
      ⠏ |          0 | class_branch                                                   
      ⠋ |         11 | class_branch                                                   
      ⠹ |         13 | class_branch                                                   
      ✔ |         29 | class_branch
      
      ⠏ |          0 | class_bud                                                      
      ⠼ |          5 | class_bud                                                      
      ⠙ |         12 | class_bud                                                      
      ✔ |         20 | class_bud
      
      ⠏ |          0 | class_build                                                    
      ⠸ |      1  13 | class_build                                                    
      ⠏ |      4  26 | class_build                                                    
      ✔ |      7  40 | class_build
      
      ⠏ |          0 | class_builder                                                  
      ⠏ |      2   8 | class_builder                                                  
      ⠋ |     10  11 | class_builder                                                  
      ⠏ |     18  12 | class_builder                                                  
      ⠴ |     18  18 | class_builder                                                  
      ⠇ |     26  23 | class_builder                                                  
      ✔ |     30  23 | class_builder
      
      ⠏ |          0 | class_clustermq                                                
      ⠏ |     10   0 | class_clustermq                                                
      ✔ |     10   0 | class_clustermq
      
      ⠏ |          0 | class_command                                                  
      ⠸ |         14 | class_command                                                  
      ⠋ |         21 | class_command                                                  
      ✔ |         23 | class_command
      
      ⠏ |          0 | class_counter                                                  
      ⠙ |         12 | class_counter                                                  
      ⠧ |         28 | class_counter                                                  
      ✔ |         33 | class_counter
      
      ⠏ |          0 | class_crew                                                     
      ⠋ |          1 | class_crew                                                     
      ⠹ |          3 | class_crew                                                     
      ⠦ |      1   6 | class_crew                                                     
      ✔ |      4   6 | class_crew [5.3s]
      
      ⠏ |          0 | class_cue                                                      
      ⠹ |          3 | class_cue                                                      
      ⠴ |          6 | class_cue                                                      
      ⠦ |          7 | class_cue                                                      
      ⠏ |         10 | class_cue                                                      
      ⠹ |         13 | class_cue                                                      
      ⠴ |         16 | class_cue                                                      
      ⠇ |         19 | class_cue                                                      
      ⠋ |         21 | class_cue                                                      
      ⠸ |         24 | class_cue                                                      
      ⠦ |         27 | class_cue                                                      
      ⠋ |         31 | class_cue                                                      
      ⠸ |         34 | class_cue                                                      
      ⠼ |         35 | class_cue                                                      
      ⠦ |         37 | class_cue                                                      
      ⠧ |         38 | class_cue                                                      
      ⠋ |         41 | class_cue                                                      
      ⠸ |         44 | class_cue                                                      
      ⠦ |         47 | class_cue                                                      
      ⠇ |         49 | class_cue                                                      
      ⠙ |         52 | class_cue                                                      
      ⠼ |         55 | class_cue                                                      
      ⠦ |         57 | class_cue                                                      
      ⠏ |         60 | class_cue                                                      
      ✔ |         62 | class_cue [3.1s]
      
      ⠏ |          0 | class_database                                                 
      ⠙ |      1  11 | class_database                                                 
      ⠸ |      1  23 | class_database                                                 
      ⠙ |      1  31 | class_database                                                 
      ⠹ |      1  42 | class_database                                                 
      ⠧ |      1  57 | class_database                                                 
      ⠙ |      1  61 | class_database                                                 
      ⠼ |      1  64 | class_database                                                 
      ⠦ |      1  76 | class_database                                                 
      ⠴ |      1  85 | class_database                                                 
      ⠹ |      2  91 | class_database                                                 
      ⠦ |      2 105 | class_database                                                 
      ⠏ |      2 118 | class_database                                                 
      ✔ |      2 122 | class_database [1.4s]
      
      ⠏ |          0 | class_database_aws                                             
      ✔ |          1 | class_database_aws
      
      ⠏ |          0 | class_database_gcp                                             
      ⠋ |          1 | class_database_gcp                                             
      ✔ |          1 | class_database_gcp
      
      ⠏ |          0 | class_dynamic                                                  
      ⠇ |          9 | class_dynamic                                                  
      ✔ |         15 | class_dynamic
      
      ⠏ |          0 | class_feather                                                  
      ⠏ |     10   0 | class_feather                                                  
      ✔ |     12   0 | class_feather
      
      ⠏ |          0 | class_file                                                     
      ⠦ |          7 | class_file                                                     
      ⠼ |         25 | class_file                                                     
      ⠦ |         47 | class_file                                                     
      ⠇ |         69 | class_file                                                     
      ⠇ |         89 | class_file                                                     
      ⠴ |        106 | class_file                                                     
      ⠇ |      1 118 | class_file                                                     
      ⠹ |      1 122 | class_file                                                     
      ✔ |      1 124 | class_file
      
      ⠏ |          0 | class_frames                                                   
      ⠧ |          8 | class_frames                                                   
      ✔ |         20 | class_frames
      
      ⠏ |          0 | class_fst                                                      
      ⠸ |          4 | class_fst                                                      
      ⠦ |          7 | class_fst                                                      
      ⠧ |          8 | class_fst                                                      
      ✔ |         12 | class_fst
      
      ⠏ |          0 | class_fst_dt                                                   
      ⠼ |          5 | class_fst_dt                                                   
      ✔ |      1   9 | class_fst_dt
      
      ⠏ |          0 | class_fst_tbl                                                  
      ⠦ |          7 | class_fst_tbl                                                  
      ✔ |         11 | class_fst_tbl
      
      ⠏ |          0 | class_future                                                   
      ⠧ |      7   1 | class_future                                                   
      ✔ |      8   2 | class_future
      
      ⠏ |          0 | class_gcp                                                      
      ⠧ |      1   7 | class_gcp                                                      
      ✔ |      2   8 | class_gcp
      
      ⠏ |          0 | class_gcp_file                                                 
      ⠼ |          5 | class_gcp_file                                                 
      ✔ |          5 | class_gcp_file
      
      ⠏ |          0 | class_glimpse                                                  
      ⠴ |          6 | class_glimpse                                                  
      ⠙ | 1       11 | class_glimpse                                                  
      ⠼ | 3       12 | class_glimpse                                                  
      ✖ | 3       15 | class_glimpse
      ────────────────────────────────────────────────────────────────────────────────
      Failure ('test-class_glimpse.R:138:3'): glimpse$update() with names
      sort(net$vertices$name) (`actual`) not equal to sort(c("x", "y")) (`expected`).
      
      `actual`:   "y"    
      `expected`: "x" "y"
      
      Failure ('test-class_glimpse.R:139:3'): glimpse$update() with names
      net$edges$from (`actual`) not equal to "x" (`expected`).
      
      `actual`:      
      `expected`: "x"
      
      Failure ('test-class_glimpse.R:140:3'): glimpse$update() with names
      net$edges$to (`actual`) not equal to "y" (`expected`).
      
      `actual`:      
      `expected`: "y"
      ────────────────────────────────────────────────────────────────────────────────
      
      ⠏ |          0 | class_graph                                                    
      ⠏ |         10 | class_graph                                                    
      ⠙ |         22 | class_graph                                                    
      ⠼ |         35 | class_graph                                                    
      ⠧ |         48 | class_graph                                                    
      ⠹ |         63 | class_graph                                                    
      ✔ |         70 | class_graph
      
      ⠏ |          0 | class_group                                                    
      ⠏ |         10 | class_group                                                    
      ⠙ |         12 | class_group                                                    
      ✔ |         14 | class_group
      
      ⠏ |          0 | class_imports                                                  
      ⠏ |         10 | class_imports                                                  
      ⠼ |      1  24 | class_imports                                                  
      ⠦ |      1  26 | class_imports                                                  
      ⠇ |      1  28 | class_imports                                                  
      ⠋ |      1  30 | class_imports                                                  
      ⠙ |      1  31 | class_imports                                                  
      ⠹ |      1  32 | class_imports                                                  
      ⠸ |      1  33 | class_imports                                                  
      ✔ |      1  34 | class_imports [2.1s]
      
      ⠏ |          0 | class_inspection                                               
      ⠦ |          7 | class_inspection                                               
      ⠋ |         11 | class_inspection                                               
      ⠹ |         13 | class_inspection                                               
      ⠙ |         22 | class_inspection                                               
      ⠸ |         24 | class_inspection                                               
      ⠦ |         27 | class_inspection                                               
      ⠏ | 1       29 | class_inspection                                               
      ⠸ | 3       31 | class_inspection                                               
      ⠴ | 3       33 | class_inspection                                               
      ✖ | 3       36 | class_inspection [1.3s]
      ────────────────────────────────────────────────────────────────────────────────
      Failure ('test-class_inspection.R:357:3'): inspection$update() with names
      sort(net$vertices$name) (`actual`) not equal to sort(c("x", "y")) (`expected`).
      
      `actual`:   "y"    
      `expected`: "x" "y"
      
      Failure ('test-class_inspection.R:358:3'): inspection$update() with names
      net$edges$from (`actual`) not equal to "x" (`expected`).
      
      `actual`:      
      `expected`: "x"
      
      Failure ('test-class_inspection.R:359:3'): inspection$update() with names
      net$edges$to (`actual`) not equal to "y" (`expected`).
      
      `actual`:      
      `expected`: "y"
      ────────────────────────────────────────────────────────────────────────────────
      
      ⠏ |          0 | class_inventory                                                
      ⠼ |         15 | class_inventory                                                
      ✔ |         21 | class_inventory
      
      ⠏ |          0 | class_junction                                                 
      ⠇ |      1   8 | class_junction                                                 
      ✔ |      1  11 | class_junction
      
      ⠏ |          0 | class_keras                                                    
      ✔ |      5   0 | class_keras
      
      ⠏ |          0 | class_list                                                     
      ⠇ |          9 | class_list                                                     
      ✔ |          9 | class_list
      
      ⠏ |          0 | class_local                                                    
      ⠹ |          3 | class_local                                                    
      ⠸ |         14 | class_local                                                    
      ⠦ | 1       16 | class_local                                                    
      ✖ | 1       16 | class_local
      ────────────────────────────────────────────────────────────────────────────────
      Error ('test-class_local.R:51:3'): can run on a subset of targets
      Error: object 'data1' not found
      Backtrace:
           ▆
        1. └─local$run() at test-class_local.R:51:3
        2.   └─self$process_next()
        3.     └─self$process_target(self$scheduler$queue$dequeue())
        4.       └─self$run_target(target)
        5.         ├─targets:::target_conclude(...)
        6.         └─targets:::target_conclude.tar_builder(...)
        7.           └─targets:::builder_error(target, pipeline, scheduler, meta)
        8.             └─targets:::builder_handle_error(target, pipeline, scheduler, meta)
        9.               └─targets:::builder_error_exit(target, pipeline, scheduler, meta)
       10.                 └─targets::tar_throw_run(target$metrics$error, class = target$metrics$error_class)
       11.                   └─targets::tar_error(...)
       12.                     └─rlang::abort(message = message, class = class, call = tar_envir_base)
      ────────────────────────────────────────────────────────────────────────────────
      
      ⠏ |          0 | class_lookup                                                   
      ⠋ |         21 | class_lookup                                                   
      ⠸ |         44 | class_lookup                                                   
      ⠼ |         65 | class_lookup                                                   
      ⠦ |         87 | class_lookup                                                   
      ⠋ |        111 | class_lookup                                                   
      ⠼ |        135 | class_lookup                                                   
      ⠴ |        156 | class_lookup                                                   
      ✔ |        172 | class_lookup
      
      ⠏ |          0 | class_mermaid                                                  
      ⠹ |          3 | class_mermaid                                                  
      ⠦ |          7 | class_mermaid                                                  
      ⠏ |         10 | class_mermaid                                                  
      ⠋ |         21 | class_mermaid                                                  
      ⠇ |         29 | class_mermaid                                                  
      ⠴ |         36 | class_mermaid                                                  
      ✔ |         36 | class_mermaid [1.1s]
      
      ⠏ |          0 | class_meta                                                     
      ⠏ |         10 | class_meta                                                     
      ⠦ |         17 | class_meta                                                     
      ⠏ |         30 | class_meta                                                     
      ⠸ |         34 | class_meta                                                     
      ⠦ |         37 | class_meta                                                     
      ⠋ |         41 | class_meta                                                     
      ⠼ |         45 | class_meta                                                     
      ⠇ |         49 | class_meta                                                     
      ⠸ |         54 | class_meta                                                     
      ⠧ |         58 | class_meta                                                     
      ✔ |         60 | class_meta [1.4s]
      
      ⠏ |          0 | class_metrics                                                  
      ⠧ |          8 | class_metrics                                                  
      ✔ |         11 | class_metrics
      
      ⠏ |          0 | class_null                                                     
      ✔ |      1   1 | class_null
      
      ⠏ |          0 | class_options                                                  
      ⠹ |         13 | class_options                                                  
      ⠋ |         31 | class_options                                                  
      ⠙ |         42 | class_options                                                  
      ⠸ |         54 | class_options                                                  
      ⠴ |         66 | class_options                                                  
      ⠼ |         75 | class_options                                                  
      ⠦ |         87 | class_options                                                  
      ⠇ |         99 | class_options                                                  
      ⠇ |        109 | class_options                                                  
      ⠋ |        121 | class_options                                                  
      ⠸ |        134 | class_options                                                  
      ⠼ |        145 | class_options                                                  
      ✔ |      1 149 | class_options [1.3s]
      
      ⠏ |          0 | class_outdated                                                 
      ⠏ |     10   0 | class_outdated                                                 
      ⠼ |     14   1 | class_outdated                                                 
      ✔ |     14   1 | class_outdated
      
      ⠏ |          0 | class_parallel                                                 
      ⠴ |          6 | class_parallel                                                 
      ⠹ |         13 | class_parallel                                                 
      ⠹ |         23 | class_parallel                                                 
      ⠼ |         35 | class_parallel                                                 
      ⠦ |         47 | class_parallel                                                 
      ⠼ |         55 | class_parallel                                                 
      ✔ |         59 | class_parallel
      
      ⠏ |          0 | class_parquet                                                  
      ⠏ |     10   0 | class_parquet                                                  
      ✔ |     12   0 | class_parquet
      
      ⠏ |          0 | class_pattern                                                  
      ⠼ |          5 | class_pattern                                                  
      ⠏ |         10 | class_pattern                                                  
      ⠸ |         14 | class_pattern                                                  
      ⠧ |         18 | class_pattern                                                  
      ⠋ |         21 | class_pattern                                                  
      ⠏ |         30 | class_pattern                                                  
      ⠋ |         31 | class_pattern                                                  
      ⠋ |         51 | class_pattern                                                  
      ⠙ |         52 | class_pattern                                                  
      ⠋ |         71 | class_pattern                                                  
      ⠸ |         74 | class_pattern                                                  
      ⠇ |         79 | class_pattern                                                  
      ⠦ |         97 | class_pattern                                                  
      ⠇ |         99 | class_pattern                                                  
      ⠹ |        103 | class_pattern                                                  
      ⠦ |        107 | class_pattern                                                  
      ⠋ |        111 | class_pattern                                                  
      ⠦ |        117 | class_pattern                                                  
      ⠙ |        122 | class_pattern                                                  
      ⠼ |        135 | class_pattern                                                  
      ⠴ |        136 | class_pattern                                                  
      ⠦ |        137 | class_pattern                                                  
      ⠇ |        139 | class_pattern                                                  
      ⠏ |        140 | class_pattern                                                  
      ⠸ |        144 | class_pattern                                                  
      ⠙ |        152 | class_pattern                                                  
      ⠸ | 1      153 | class_pattern                                                  
      ✖ | 1    1 155 | class_pattern [5.8s]
      ────────────────────────────────────────────────────────────────────────────────
      Error ('test-class_pattern.R:783:3'): bootstrap a pattern for a shortcut pattern and stem
      <tar_condition_validate/tar_condition_targets/tar_condition_run/rlang_error/error/condition>
      Error: targets::tar_make() error
          • tar_errored()
          • tar_meta(fields = any_of("error"), complete_only = TRUE)
          • tar_workspace()
          • tar_workspaces()
          • Debug: https://books.ropensci.org/targets/debugging.html
          • Help: https://books.ropensci.org/targets/help.html
          Target y tried to branch over x, which is illegal. Patterns must only branch over explicitly declared targets in the pipeline. Stems and patterns are fine, but you cannot branch over branches or global objects. Also, if you branch over a target with format = "file", then that target must also be a pattern.
          stop(x)
          .handleSimpleError(function (condition)  {     state$error <- build_mess...
          h(simpleError(msg, call))
      Backtrace:
          ▆
       1. └─targets::tar_make(names = c("y", "z"), shortcut = TRUE, callr_function = NULL) at test-class_pattern.R:783:3
       2.   └─targets:::callr_outer(...)
       3.     ├─targets:::if_any(...)
       4.     └─targets:::callr_error(traced_condition = out, fun = fun)
       5.       └─targets::tar_throw_run(message, class = class(traced_condition$condition))
       6.         └─targets::tar_error(...)
       7.           └─rlang::abort(message = message, class = class, call = tar_envir_base)
      ────────────────────────────────────────────────────────────────────────────────
      
      ⠏ |          0 | class_patternview                                              
      ⠙ |          2 | class_patternview                                              
      ⠼ |          5 | class_patternview                                              
      ✔ |          6 | class_patternview
      
      ⠏ |          0 | class_pipeline                                                 
      ⠸ |          4 | class_pipeline                                                 
      ⠏ |         10 | class_pipeline                                                 
      ⠇ |         19 | class_pipeline                                                 
      ⠇ |         29 | class_pipeline                                                 
      ⠋ | 2       29 | class_pipeline                                                 
      ⠦ | 2       45 | class_pipeline                                                 
      ⠹ | 2       51 | class_pipeline                                                 
      ⠦ | 2       55 | class_pipeline                                                 
      ⠙ | 2    1  59 | class_pipeline                                                 
      ✖ | 2    1  60 | class_pipeline [1.3s]
      ────────────────────────────────────────────────────────────────────────────────
      Error ('test-class_pipeline.R:170:3'): pipeline_prune_targets() with one name
      Error in `as_igraph_vs(graph, v)`: Invalid vertex names
      Backtrace:
          ▆
       1. └─targets:::pipeline_prune_targets(pipeline, "mins") at test-class_pipeline.R:170:3
       2.   └─targets:::upstream_vertices(graph = graph, from = names)
       3.     └─targets:::nbhd_vertices(...)
       4.       └─targets:::targets_adjacent_vertices(graph, v = from, mode = mode)
       5.         └─igraph::adjacent_vertices(graph = graph, v = v, mode = mode)
       6.           └─igraph:::as_igraph_vs(graph, v)
      
      Failure ('test-class_pipeline.R:181:3'): pipeline_prune_targets() with multiple names
      sort(out) (`actual`) not equal to sort(exp) (`expected`).
      
      `actual`:   "all"   "data2" "max1" "max2" "min1"
      `expected`: "data1" "data2"        "max2" "min1"
      ────────────────────────────────────────────────────────────────────────────────
      Maximum number of failures exceeded; quitting at end of file.
      ℹ Increase this number with (e.g.) `testthat::set_max_fails(Inf)` 
      
      ══ Results ═════════════════════════════════════════════════════════════════════
      Duration: 36.4 s
      
      ── Skipped tests (125) ─────────────────────────────────────────────────────────
      • On CRAN (125): 'test-class_auto.R:2:3', 'test-class_auto.R:25:3',
        'test-class_aws.R:70:3', 'test-class_aws.R:80:3', 'test-class_aws.R:122:3',
        'test-class_aws_file.R:2:3', 'test-class_aws_file.R:17:3',
        'test-class_aws_file.R:29:3', 'test-class_aws_file.R:44:3',
        'test-class_aws_file.R:61:3', 'test-class_aws_file.R:80:3',
        'test-class_build.R:32:3', 'test-class_build.R:40:3',
        'test-class_build.R:48:3', 'test-class_build.R:54:3',
        'test-class_build.R:92:3', 'test-class_build.R:110:3',
        'test-class_build.R:117:3', 'test-class_builder.R:25:3',
        'test-class_builder.R:41:3', 'test-class_builder.R:89:3',
        'test-class_builder.R:102:3', 'test-class_builder.R:121:3',
        'test-class_builder.R:133:3', 'test-class_builder.R:148:3',
        'test-class_builder.R:164:3', 'test-class_builder.R:185:3',
        'test-class_builder.R:210:3', 'test-class_builder.R:225:3',
        'test-class_builder.R:231:3', 'test-class_builder.R:290:3',
        'test-class_builder.R:316:3', 'test-class_builder.R:327:3',
        'test-class_builder.R:338:3', 'test-class_builder.R:350:3',
        'test-class_builder.R:378:3', 'test-class_builder.R:427:3',
        'test-class_builder.R:443:3', 'test-class_builder.R:465:3',
        'test-class_builder.R:473:3', 'test-class_builder.R:501:3',
        'test-class_builder.R:517:3', 'test-class_builder.R:526:3',
        'test-class_builder.R:560:3', 'test-class_builder.R:592:3',
        'test-class_builder.R:638:3', 'test-class_builder.R:674:3',
        'test-class_builder.R:712:3', 'test-class_clustermq.R:2:3',
        'test-class_clustermq.R:8:3', 'test-class_clustermq.R:34:3',
        'test-class_clustermq.R:64:3', 'test-class_clustermq.R:92:3',
        'test-class_clustermq.R:120:3', 'test-class_clustermq.R:154:3',
        'test-class_clustermq.R:195:3', 'test-class_clustermq.R:249:3',
        'test-class_clustermq.R:273:3', 'test-class_crew.R:92:3',
        'test-class_crew.R:171:3', 'test-class_crew.R:222:3',
        'test-class_crew.R:273:3', 'test-class_database.R:40:3',
        'test-class_database.R:495:3', 'test-class_feather.R:2:3',
        'test-class_feather.R:32:3', 'test-class_feather.R:50:3',
        'test-class_feather.R:77:3', 'test-class_feather.R:85:3',
        'test-class_feather.R:96:3', 'test-class_feather.R:106:3',
        'test-class_feather.R:116:3', 'test-class_feather.R:124:3',
        'test-class_feather.R:131:3', 'test-class_feather.R:141:3',
        'test-class_feather.R:152:3', 'test-class_file.R:307:3',
        'test-class_fst_dt.R:92:3', 'test-class_future.R:7:3',
        'test-class_future.R:30:3', 'test-class_future.R:53:3',
        'test-class_future.R:75:3', 'test-class_future.R:97:3',
        'test-class_future.R:120:3', 'test-class_future.R:147:3',
        'test-class_future.R:195:3', 'test-class_gcp.R:18:3',
        'test-class_gcp.R:60:3', 'test-class_imports.R:33:3',
        'test-class_junction.R:10:3', 'test-class_keras.R:2:3',
        'test-class_keras.R:9:3', 'test-class_keras.R:16:3',
        'test-class_keras.R:22:3', 'test-class_keras.R:31:3',
        'test-class_null.R:9:3', 'test-class_options.R:483:3',
        'test-class_outdated.R:2:3', 'test-class_outdated.R:8:3',
        'test-class_outdated.R:14:3', 'test-class_outdated.R:21:3',
        'test-class_outdated.R:27:3', 'test-class_outdated.R:40:3',
        'test-class_outdated.R:61:3', 'test-class_outdated.R:81:3',
        'test-class_outdated.R:103:3', 'test-class_outdated.R:131:3',
        'test-class_outdated.R:158:3', 'test-class_outdated.R:183:3',
        'test-class_outdated.R:210:3', 'test-class_outdated.R:234:3',
        'test-class_parquet.R:2:3', 'test-class_parquet.R:32:3',
        'test-class_parquet.R:50:3', 'test-class_parquet.R:77:3',
        'test-class_parquet.R:85:3', 'test-class_parquet.R:96:3',
        'test-class_parquet.R:106:3', 'test-class_parquet.R:116:3',
        'test-class_parquet.R:124:3', 'test-class_parquet.R:131:3',
        'test-class_parquet.R:141:3', 'test-class_parquet.R:152:3',
        'test-class_pattern.R:808:3', 'test-class_pipeline.R:286:3'
      
      ── Failed tests ────────────────────────────────────────────────────────────────
      Failure ('test-class_glimpse.R:138:3'): glimpse$update() with names
      sort(net$vertices$name) (`actual`) not equal to sort(c("x", "y")) (`expected`).
      
      `actual`:   "y"    
      `expected`: "x" "y"
      
      Failure ('test-class_glimpse.R:139:3'): glimpse$update() with names
      net$edges$from (`actual`) not equal to "x" (`expected`).
      
      `actual`:      
      `expected`: "x"
      
      Failure ('test-class_glimpse.R:140:3'): glimpse$update() with names
      net$edges$to (`actual`) not equal to "y" (`expected`).
      
      `actual`:      
      `expected`: "y"
      
      Failure ('test-class_inspection.R:357:3'): inspection$update() with names
      sort(net$vertices$name) (`actual`) not equal to sort(c("x", "y")) (`expected`).
      
      `actual`:   "y"    
      `expected`: "x" "y"
      
      Failure ('test-class_inspection.R:358:3'): inspection$update() with names
      net$edges$from (`actual`) not equal to "x" (`expected`).
      
      `actual`:      
      `expected`: "x"
      
      Failure ('test-class_inspection.R:359:3'): inspection$update() with names
      net$edges$to (`actual`) not equal to "y" (`expected`).
      
      `actual`:      
      `expected`: "y"
      
      Error ('test-class_local.R:51:3'): can run on a subset of targets
      Error: object 'data1' not found
      Backtrace:
           ▆
        1. └─local$run() at test-class_local.R:51:3
        2.   └─self$process_next()
        3.     └─self$process_target(self$scheduler$queue$dequeue())
        4.       └─self$run_target(target)
        5.         ├─targets:::target_conclude(...)
        6.         └─targets:::target_conclude.tar_builder(...)
        7.           └─targets:::builder_error(target, pipeline, scheduler, meta)
        8.             └─targets:::builder_handle_error(target, pipeline, scheduler, meta)
        9.               └─targets:::builder_error_exit(target, pipeline, scheduler, meta)
       10.                 └─targets::tar_throw_run(target$metrics$error, class = target$metrics$error_class)
       11.                   └─targets::tar_error(...)
       12.                     └─rlang::abort(message = message, class = class, call = tar_envir_base)
      
      Error ('test-class_pattern.R:783:3'): bootstrap a pattern for a shortcut pattern and stem
      <tar_condition_validate/tar_condition_targets/tar_condition_run/rlang_error/error/condition>
      Error: targets::tar_make() error
          • tar_errored()
          • tar_meta(fields = any_of("error"), complete_only = TRUE)
          • tar_workspace()
          • tar_workspaces()
          • Debug: https://books.ropensci.org/targets/debugging.html
          • Help: https://books.ropensci.org/targets/help.html
          Target y tried to branch over x, which is illegal. Patterns must only branch over explicitly declared targets in the pipeline. Stems and patterns are fine, but you cannot branch over branches or global objects. Also, if you branch over a target with format = "file", then that target must also be a pattern.
          stop(x)
          .handleSimpleError(function (condition)  {     state$error <- build_mess...
          h(simpleError(msg, call))
      Backtrace:
          ▆
       1. └─targets::tar_make(names = c("y", "z"), shortcut = TRUE, callr_function = NULL) at test-class_pattern.R:783:3
       2.   └─targets:::callr_outer(...)
       3.     ├─targets:::if_any(...)
       4.     └─targets:::callr_error(traced_condition = out, fun = fun)
       5.       └─targets::tar_throw_run(message, class = class(traced_condition$condition))
       6.         └─targets::tar_error(...)
       7.           └─rlang::abort(message = message, class = class, call = tar_envir_base)
      
      Error ('test-class_pipeline.R:170:3'): pipeline_prune_targets() with one name
      Error in `as_igraph_vs(graph, v)`: Invalid vertex names
      Backtrace:
          ▆
       1. └─targets:::pipeline_prune_targets(pipeline, "mins") at test-class_pipeline.R:170:3
       2.   └─targets:::upstream_vertices(graph = graph, from = names)
       3.     └─targets:::nbhd_vertices(...)
       4.       └─targets:::targets_adjacent_vertices(graph, v = from, mode = mode)
       5.         └─igraph::adjacent_vertices(graph = graph, v = v, mode = mode)
       6.           └─igraph:::as_igraph_vs(graph, v)
      
      Failure ('test-class_pipeline.R:181:3'): pipeline_prune_targets() with multiple names
      sort(out) (`actual`) not equal to sort(exp) (`expected`).
      
      `actual`:   "all"   "data2" "max1" "max2" "min1"
      `expected`: "data1" "data2"        "max2" "min1"
      
      [ FAIL 10 | WARN 0 | SKIP 125 | PASS 1568 ]
      ══ Terminated early ════════════════════════════════════════════════════════════
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.5Mb
      sub-directories of 1Mb or more:
        R      3.5Mb
        help   1.7Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘qs’
    ```

