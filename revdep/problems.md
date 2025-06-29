# AnimalHabitatNetwork

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/AnimalHabitatNetwork
* Date/Publication: 2019-11-25 19:40:02 UTC
* Number of recursive dependencies: 27

Run `revdepcheck::cloud_details(, "AnimalHabitatNetwork")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘AnimalHabitatNetwork-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ahn_gen
    > ### Title: Generate networks characterising habitat physical configurations
    > ### Aliases: ahn_gen
    > 
    > ### ** Examples
    > 
    > # generate a connected and weighted network
    > ahn_gen(N = 10, L = 5, mu = 1, lamda = 5)
    Error in `graph_from_adjacency_matrix()`:
    ! Cannot create a graph object because the adjacency matrix contains
      NAs.
    Backtrace:
        ▆
     1. └─AnimalHabitatNetwork::ahn_gen(N = 10, L = 5, mu = 1, lamda = 5)
     2.   └─igraph::graph_from_adjacency_matrix(ahn_wei_matrix, mode = "undirected", diag = FALSE, weighted = TRUE)
     3.     └─igraph:::ensure_no_na(adjmatrix, "adjacency matrix")
     4.       └─cli::cli_abort(...)
     5.         └─rlang::abort(...)
    Execution halted
    ```

# CITMIC

<details>

* Version: 0.1.2
* GitHub: NA
* Source code: https://github.com/cran/CITMIC
* Date/Publication: 2024-11-08 12:20:02 UTC
* Number of recursive dependencies: 34

Run `revdepcheck::cloud_details(, "CITMIC")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘CITMIC.Rmd’ using rmarkdown
    
    Quitting from CITMIC.Rmd:38-49 [unnamed-chunk-2]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    NULL
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Error: processing vignette 'CITMIC.Rmd' failed with diagnostics:
    `name` must be a single string, not `TRUE`.
    --- failed re-building ‘CITMIC.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘CITMIC.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# CoDiNA

<details>

* Version: 1.1.2
* GitHub: NA
* Source code: https://github.com/cran/CoDiNA
* Date/Publication: 2020-07-15 12:30:02 UTC
* Number of recursive dependencies: 49

Run `revdepcheck::cloud_details(, "CoDiNA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘CoDiNA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as.igraph
    > ### Title: as.igraph
    > ### Aliases: as.igraph
    > 
    > ### ** Examples
    > 
    > suppressWarnings(RNGversion("3.5.0"))
    > Nodes = LETTERS[1:10]
    > Net1 = data.frame(Node.1 = sample(Nodes) , Node.2 = sample(Nodes), wTO = runif(10,-1,1))
    > Net2 = data.frame(Node.1 = sample(Nodes) , Node.2 = sample(Nodes), wTO = runif(10,-1,1))
    > Net3 = data.frame(Node.1 = sample(Nodes) , Node.2 = sample(Nodes), wTO = runif(10,-1,1))
    > DiffNet = MakeDiffNet (Data = list(Net1,Net2,Net3), Code = c('Net1', 'Net2', 'Net3') )
    Starting now.
    Net1 contains 10 edges and 10 nodes.
    Net2 contains 10 edges and 10 nodes.
    Net3 contains 10 edges and 10 nodes.
    Warning in CreateFullBase(x = Data, Code = Code) :
      You have duplicated links. Results will be presented, but you should double check your input.
    Total of nodes: 10
    Total of edges: 20
    Coding correlations.
    Total of edges (inside the cutoff): 19
    Starting Phi categorization.
    Coding the groups.
    Recode is done!
    > Graph = plot(x = DiffNet,
    +  layout = NULL, smooth.edges = TRUE,
    +  path = NULL, MakeGroups = FALSE, Cluster = FALSE,
    +  legend = TRUE, manipulation = FALSE, sort.by.Phi = FALSE)
    > x = as.igraph(Graph)
    Error in `igraph::graph_from_data_frame()`:
    ! Cannot create a graph object because the edge data frame contains NAs.
    Backtrace:
        ▆
     1. └─CoDiNA::as.igraph(Graph)
     2.   └─igraph::graph_from_data_frame(x$network$x$edges, directed = FALSE, vertices = x$network$x$nodes)
     3.     └─igraph:::ensure_no_na(d, "edge data frame")
     4.       └─cli::cli_abort(...)
     5.         └─rlang::abort(...)
    Execution halted
    ```

# criticalpath

<details>

* Version: 0.2.1
* GitHub: https://github.com/rubens2005/criticalpath
* Source code: https://github.com/cran/criticalpath
* Date/Publication: 2022-03-13 22:40:10 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::cloud_details(, "criticalpath")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘criticalpath-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: sch_activities
    > ### Title: Activities
    > ### Aliases: sch_activities
    > 
    > ### ** Examples
    > 
    > sch <- sch_new() %>%
    +   sch_title("Fictitious Project Example") %>%
    +   sch_reference("VANHOUCKE, Mario. Measuring time:
    +   improving project performance using earned value management.
    +   Gent: Springer, 2009, p. 18") %>%
    +   sch_add_activity(  1L, "a1" , 0L, 2,3,4) %>%
    +   sch_add_activity(  2L, "a2" , 4L, 5) %>%
    +   sch_add_activity(  3L, "a3" , 9L, 10) %>%
    +   sch_add_activity(  4L, "a4" , 1L, 6) %>%
    +   sch_add_activity(  5L, "a5" , 4L, 9) %>%
    +   sch_add_activity(  6L, "a6" , 5L, 7) %>%
    +   sch_add_activity(  7L, "a7" , 1L, 8,11) %>%
    +   sch_add_activity(  8L, "a8" , 7L, 12) %>%
    +   sch_add_activity(  9L, "a9" , 8L, 12) %>%
    +   sch_add_activity( 10L, "a10", 3L, 12) %>%
    +   sch_add_activity( 11L, "a11", 3L, 12) %>%
    +   sch_add_activity( 12L, "a12", 0L) %>%
    +   sch_plan()
    Error in sch_plan(.) : 
      The schedule is invalid!!! To view the problem, execute:
    
             `validation <- sch_validate(sch)`
    Calls: %>% -> sch_plan
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(criticalpath)
      > 
      > test_check("criticalpath")
      [ FAIL 86 | WARN 0 | SKIP 0 | PASS 256 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-cpt-add_act_rel.R:24:3'): Creating a sch step-by-step, with activities and relations together ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─criticalpath (local) vanhoucke_2009_p18() at test-cpt-add_act_rel.R:24:3
       2. │ └─... %>% sch_plan() at test-cpt-add_act_rel.R:2:3
       3. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-add_act_rel.R:106:3'): Creating a sch step-by-step, with activities and relations together: float tests ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─criticalpath (local) vanhoucke_2009_p18() at test-cpt-add_act_rel.R:106:3
       2. │ └─... %>% sch_plan() at test-cpt-add_act_rel.R:2:3
       3. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-add_act_rel.R:126:3'): Does not return Inf!!! ──────────────
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-add_act_rel.R:126:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-add_relation.R:29:3'): Creating a sch step-by-step: first with activities and then with relations. ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─sch %<>% sch_add_relation(1L, 2L) %>% sch_plan() at test-cpt-add_relation.R:29:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-add_relation.R:100:3'): Add relations tibble. ──────────────
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-add_relation.R:100:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-add_relation.R:120:3'): Evaluete redundancy. ───────────────
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_evaluate_redundancy() at test-cpt-add_relation.R:120:3
       2. ├─criticalpath::sch_evaluate_redundancy(.)
       3. │ └─criticalpath::sch_nr_relations(sch)
       4. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-change_durations.R:23:3'): Project 2: sch duration is 25 ───
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─criticalpath (local) vanhoucke2014_project_2() at test-cpt-change_durations.R:23:3
       2. │ └─... %>% sch_plan() at test-cpt-change_durations.R:2:3
       3. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-change_durations.R:28:3'): Project 2: sch critical activities are identified ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─vanhoucke2014_project_2() %>% sch_critical_activities() at test-cpt-change_durations.R:28:3
       2. ├─criticalpath::sch_critical_activities(.)
       3. │ └─sch %>% sch_activities() %>% dplyr::filter(critical)
       4. ├─dplyr::filter(., critical)
       5. ├─criticalpath::sch_activities(.)
       6. ├─criticalpath (local) vanhoucke2014_project_2()
       7. │ └─... %>% sch_plan() at test-cpt-change_durations.R:2:3
       8. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-change_durations.R:36:3'): Project 2: sch NON critical activities are identified ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─vanhoucke2014_project_2() %>% sch_non_critical_activities() at test-cpt-change_durations.R:36:3
       2. ├─criticalpath::sch_non_critical_activities(.)
       3. │ └─sch %>% sch_activities() %>% dplyr::filter(!critical)
       4. ├─dplyr::filter(., !critical)
       5. ├─criticalpath::sch_activities(.)
       6. ├─criticalpath (local) vanhoucke2014_project_2()
       7. │ └─... %>% sch_plan() at test-cpt-change_durations.R:2:3
       8. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-change_durations.R:44:3'): Project 2: Early Start and Early Finish are correct! ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─vanhoucke2014_project_2() %>% sch_activities() at test-cpt-change_durations.R:44:3
       2. ├─criticalpath::sch_activities(.)
       3. ├─criticalpath (local) vanhoucke2014_project_2()
       4. │ └─... %>% sch_plan() at test-cpt-change_durations.R:2:3
       5. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-change_durations.R:101:3'): Project 2: Late Start and Late Finish are correct! ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─vanhoucke2014_project_2() %>% sch_activities() at test-cpt-change_durations.R:101:3
       2. ├─criticalpath::sch_activities(.)
       3. ├─criticalpath (local) vanhoucke2014_project_2()
       4. │ └─... %>% sch_plan() at test-cpt-change_durations.R:2:3
       5. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-change_durations.R:163:3'): Project 2: Durations changed! sch duration is 28 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─vanhoucke2014_project_2() %>% ... at test-cpt-change_durations.R:163:3
       2. ├─criticalpath::sch_change_activities_duration(., new_durations)
       3. │ └─criticalpath:::cpt_assert_schedule_object_valid(sch)
       4. │   └─criticalpath:::cpt_schedule_object_valid(sch)
       5. │     └─properties %in% names(sch)
       6. ├─criticalpath (local) vanhoucke2014_project_2()
       7. │ └─... %>% sch_plan() at test-cpt-change_durations.R:2:3
       8. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-change_durations.R:170:3'): Project 2: Durations changed! sch critical activities are identified ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
           ▆
        1. ├─... %>% sch_critical_activities() at test-cpt-change_durations.R:170:3
        2. ├─criticalpath::sch_critical_activities(.)
        3. │ └─sch %>% sch_activities() %>% dplyr::filter(critical)
        4. ├─dplyr::filter(., critical)
        5. ├─criticalpath::sch_activities(.)
        6. ├─criticalpath::sch_change_activities_duration(., new_durations)
        7. │ └─criticalpath:::cpt_assert_schedule_object_valid(sch)
        8. │   └─criticalpath:::cpt_schedule_object_valid(sch)
        9. │     └─properties %in% names(sch)
       10. ├─criticalpath (local) vanhoucke2014_project_2()
       11. │ └─... %>% sch_plan() at test-cpt-change_durations.R:2:3
       12. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-change_durations.R:179:3'): Project 2: Durations changed! sch NON critical activities are identified ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
           ▆
        1. ├─... %>% sch_non_critical_activities() at test-cpt-change_durations.R:179:3
        2. ├─criticalpath::sch_non_critical_activities(.)
        3. │ └─sch %>% sch_activities() %>% dplyr::filter(!critical)
        4. ├─dplyr::filter(., !critical)
        5. ├─criticalpath::sch_activities(.)
        6. ├─criticalpath::sch_change_activities_duration(., new_durations)
        7. │ └─criticalpath:::cpt_assert_schedule_object_valid(sch)
        8. │   └─criticalpath:::cpt_schedule_object_valid(sch)
        9. │     └─properties %in% names(sch)
       10. ├─criticalpath (local) vanhoucke2014_project_2()
       11. │ └─... %>% sch_plan() at test-cpt-change_durations.R:2:3
       12. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-change_durations.R:189:3'): Project 2: Durations changed! Early Start and Early Finish are correct! ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_activities() at test-cpt-change_durations.R:189:3
       2. ├─criticalpath::sch_activities(.)
       3. ├─criticalpath::sch_change_activities_duration(., new_durations)
       4. │ └─criticalpath:::cpt_assert_schedule_object_valid(sch)
       5. │   └─criticalpath:::cpt_schedule_object_valid(sch)
       6. │     └─properties %in% names(sch)
       7. ├─criticalpath (local) vanhoucke2014_project_2()
       8. │ └─... %>% sch_plan() at test-cpt-change_durations.R:2:3
       9. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-change_durations.R:247:3'): Project 2: Durations changed! Late Start and Late Finish are correct! ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_activities() at test-cpt-change_durations.R:247:3
       2. ├─criticalpath::sch_activities(.)
       3. ├─criticalpath::sch_change_activities_duration(., new_durations)
       4. │ └─criticalpath:::cpt_assert_schedule_object_valid(sch)
       5. │   └─criticalpath:::cpt_schedule_object_valid(sch)
       6. │     └─properties %in% names(sch)
       7. ├─criticalpath (local) vanhoucke2014_project_2()
       8. │ └─... %>% sch_plan() at test-cpt-change_durations.R:2:3
       9. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-create_schedule_from_tibbles.R:121:3'): Create a complete schedule. ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-create_schedule_from_tibbles.R:121:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:11:3'): FS type | A_duration == B_duration | lag == 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:11:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:55:3'): FS type | A_duration == B_duration | lag > 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:55:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:99:3'): FS type | A_duration == B_duration | lag < 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:99:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:143:3'): FS type | A_duration < B_duration | lag == 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:143:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:187:3'): FS type | A_duration < B_duration | lag > 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:187:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:231:3'): FS type | A_duration < B_duration | lag < 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:231:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:275:3'): FS type | A_duration > B_duration | lag == 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:275:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:319:3'): FS type | A_duration > B_duration | lag > 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:319:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:363:3'): FS type | A_duration > B_duration | lag < 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:363:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:411:3'): FF type | A_duration == B_duration | lag == 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:411:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:455:3'): FF type | A_duration == B_duration | lag > 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:455:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:499:3'): FF type | A_duration == B_duration | lag < 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:499:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:543:3'): FF type | A_duration < B_duration | lag == 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:543:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:587:3'): FF type | A_duration < B_duration | lag > 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:587:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:631:3'): FF type | A_duration < B_duration | lag < 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:631:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:675:3'): FF type | A_duration > B_duration | lag == 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:675:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:719:3'): FF type | A_duration > B_duration | lag > 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:719:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:763:3'): FF type | A_duration > B_duration | lag < 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:763:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:811:3'): SS type | A_duration == B_duration | lag == 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:811:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:855:3'): SS type | A_duration == B_duration | lag > 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:855:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:899:3'): SS type | A_duration == B_duration | lag < 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:899:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:943:3'): SS type | A_duration < B_duration | lag == 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:943:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:987:3'): SS type | A_duration < B_duration | lag > 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:987:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:1031:3'): SS type | A_duration < B_duration | lag < 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:1031:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:1075:3'): SS type | A_duration > B_duration | lag == 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:1075:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:1119:3'): SS type | A_duration > B_duration | lag > 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:1119:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:1163:3'): SS type | A_duration > B_duration | lag < 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:1163:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:1211:3'): SF type | A_duration == B_duration | lag == 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:1211:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:1255:3'): SF type | A_duration == B_duration | lag > 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:1255:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:1299:3'): SF type | A_duration == B_duration | lag < 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:1299:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:1343:3'): SF type | A_duration < B_duration | lag == 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:1343:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:1387:3'): SF type | A_duration < B_duration | lag > 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:1387:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:1431:3'): SF type | A_duration < B_duration | lag < 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:1431:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:1475:3'): SF type | A_duration > B_duration | lag == 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:1475:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:1519:3'): SF type | A_duration > B_duration | lag > 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:1519:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-early_start_finish_by_relation_type.R:1563:3'): SF type | A_duration > B_duration | lag < 0 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-early_start_finish_by_relation_type.R:1563:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-gantt_matrix.R:180:3'): A->B, C ────────────────────────────
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─criticalpath (local) s1() at test-cpt-gantt_matrix.R:180:3
       2. │ └─... %>% sch_plan() at test-cpt-gantt_matrix.R:18:3
       3. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-gantt_matrix.R:193:3'): A->C, B ────────────────────────────
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─criticalpath (local) s2() at test-cpt-gantt_matrix.R:193:3
       2. │ └─... %>% sch_plan() at test-cpt-gantt_matrix.R:36:3
       3. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-gantt_matrix.R:206:3'): A->B, A->C ─────────────────────────
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─criticalpath (local) s3() at test-cpt-gantt_matrix.R:206:3
       2. │ └─... %>% sch_plan() at test-cpt-gantt_matrix.R:54:3
       3. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-gantt_matrix.R:219:3'): B->C, A ────────────────────────────
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─criticalpath (local) s4() at test-cpt-gantt_matrix.R:219:3
       2. │ └─... %>% sch_plan() at test-cpt-gantt_matrix.R:72:3
       3. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-gantt_matrix.R:232:3'): A->B, B->C ─────────────────────────
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─criticalpath (local) s5() at test-cpt-gantt_matrix.R:232:3
       2. │ └─... %>% sch_plan() at test-cpt-gantt_matrix.R:92:3
       3. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-gantt_matrix.R:245:3'): A->C, B->C ─────────────────────────
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─criticalpath (local) s6() at test-cpt-gantt_matrix.R:245:3
       2. │ └─... %>% sch_plan() at test-cpt-gantt_matrix.R:110:3
       3. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-gantt_matrix.R:258:3'): A->B, A->C, B->C ───────────────────
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─criticalpath (local) s7() at test-cpt-gantt_matrix.R:258:3
       2. │ └─... %>% sch_plan() at test-cpt-gantt_matrix.R:128:3
       3. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-gantt_matrix.R:271:3'): First and last activity's durations equal zero  ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-gantt_matrix.R:271:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-gantt_matrix.R:307:3'): First and last activity's durations equal zero, and durations chagend. ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-gantt_matrix.R:307:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-gantt_matrix.R:346:3'): Período com número negativo deve funcionar. ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-gantt_matrix.R:346:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-schedule_from_data_frame.R:112:3'): Schedule duration is 11 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─criticalpath (local) vanhoucke2014_project_1() at test-cpt-schedule_from_data_frame.R:112:3
       2. │ └─... %>% sch_plan() at test-cpt-schedule_from_data_frame.R:13:3
       3. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-schedule_from_data_frame.R:117:3'): Schedule critical activities are identified ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─vanhoucke2014_project_1() %>% sch_critical_activities() at test-cpt-schedule_from_data_frame.R:117:3
       2. ├─criticalpath::sch_critical_activities(.)
       3. │ └─sch %>% sch_activities() %>% dplyr::filter(critical)
       4. ├─dplyr::filter(., critical)
       5. ├─criticalpath::sch_activities(.)
       6. ├─criticalpath (local) vanhoucke2014_project_1()
       7. │ └─... %>% sch_plan() at test-cpt-schedule_from_data_frame.R:13:3
       8. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-schedule_from_data_frame.R:126:3'): Schedule NON critical activities are identified ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─vanhoucke2014_project_1() %>% sch_non_critical_activities() at test-cpt-schedule_from_data_frame.R:126:3
       2. ├─criticalpath::sch_non_critical_activities(.)
       3. │ └─sch %>% sch_activities() %>% dplyr::filter(!critical)
       4. ├─dplyr::filter(., !critical)
       5. ├─criticalpath::sch_activities(.)
       6. ├─criticalpath (local) vanhoucke2014_project_1()
       7. │ └─... %>% sch_plan() at test-cpt-schedule_from_data_frame.R:13:3
       8. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-schedule_from_data_frame.R:135:3'): Early Start and Early Finish are correct! ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─vanhoucke2014_project_1() %>% sch_activities() at test-cpt-schedule_from_data_frame.R:135:3
       2. ├─criticalpath::sch_activities(.)
       3. ├─criticalpath (local) vanhoucke2014_project_1()
       4. │ └─... %>% sch_plan() at test-cpt-schedule_from_data_frame.R:13:3
       5. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-schedule_from_data_frame.R:192:3'): Late Start and Late Finish are correct! ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─vanhoucke2014_project_1() %>% sch_activities() at test-cpt-schedule_from_data_frame.R:192:3
       2. ├─criticalpath::sch_activities(.)
       3. ├─criticalpath (local) vanhoucke2014_project_1()
       4. │ └─... %>% sch_plan() at test-cpt-schedule_from_data_frame.R:13:3
       5. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-schedule_from_data_frame.R:249:3'): Brings the activities data frame! ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─vanhoucke2014_project_1() %>% sch_activities() at test-cpt-schedule_from_data_frame.R:249:3
       2. ├─criticalpath::sch_activities(.)
       3. ├─criticalpath (local) vanhoucke2014_project_1()
       4. │ └─... %>% sch_plan() at test-cpt-schedule_from_data_frame.R:13:3
       5. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-schedule_from_data_frame.R:256:3'): Brings the relations data frame! ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─vanhoucke2014_project_1() %>% sch_relations("insert") at test-cpt-schedule_from_data_frame.R:256:3
       2. ├─criticalpath::sch_relations(., "insert")
       3. ├─criticalpath (local) vanhoucke2014_project_1()
       4. │ └─... %>% sch_plan() at test-cpt-schedule_from_data_frame.R:13:3
       5. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-topological_indicators.R:75:3'): Topological Indicator with sch with TWO SERIAL activities ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-topological_indicators.R:75:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-topological_indicators.R:104:3'): Topological Indicator with sch with THREE SERIAL activities ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-topological_indicators.R:104:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-topological_indicators.R:119:3'): Topological indicator are correct. ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─vanhoucke_2009_p18() %>% sch_plan() at test-cpt-topological_indicators.R:119:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-topological_indicators.R:133:3'): (a) Fig. 4.3 - 9 example wetworks with and SP value of 0.25 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-topological_indicators.R:133:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-topological_indicators.R:155:3'): (b) Fig. 4.3 - 9 example wetworks with and SP value of 0.25 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-topological_indicators.R:155:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-topological_indicators.R:177:3'): (c) Fig. 4.3 - 9 example wetworks with and SP value of 0.25 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-topological_indicators.R:177:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-topological_indicators.R:199:3'): (d) Fig. 4.3 - 9 example wetworks with and SP value of 0.25 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-topological_indicators.R:199:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-topological_indicators.R:223:3'): (e) Fig. 4.3 - 9 example wetworks with and SP value of 0.25 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-topological_indicators.R:223:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-topological_indicators.R:245:3'): (f) Fig. 4.3 - 9 example wetworks with and SP value of 0.25 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-topological_indicators.R:245:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-topological_indicators.R:267:3'): (g) Fig. 4.3 - 9 example wetworks with and SP value of 0.25 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-topological_indicators.R:267:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-topological_indicators.R:289:3'): (h) Fig. 4.3 - 9 example wetworks with and SP value of 0.25 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-topological_indicators.R:289:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-topological_indicators.R:311:3'): (h - Fig. 4.4) Example wetworks with and SP value of 0.25 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-topological_indicators.R:311:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-topological_indicators.R:333:3'): (i) Fig. 4.3 - 9 example wetworks with and SP value of 0.25 ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-topological_indicators.R:333:3
       2. └─criticalpath::sch_plan(.)
      ── Failure ('test-cpt-validate_schedule.R:12:3'): There is no error. ───────────
      validation$is_valid is not TRUE
      
      `actual`:   FALSE
      `expected`: TRUE 
      ── Failure ('test-cpt-validate_schedule.R:15:3'): There is no error. ───────────
      validation$is_error_with_dag is not FALSE
      
      `actual`:   TRUE 
      `expected`: FALSE
      ── Error ('test-cpt-validate_schedule.R:17:3'): There is no error. ─────────────
      Error in `sch_plan(sch)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─testthat::expect_silent(sch1 <- sch_plan(sch)) at test-cpt-validate_schedule.R:17:3
       2. │ └─testthat:::quasi_capture(enquo(object), NULL, evaluate_promise)
       3. │   ├─testthat (local) .capture(...)
       4. │   │ ├─withr::with_output_sink(...)
       5. │   │ │ └─base::force(code)
       6. │   │ ├─base::withCallingHandlers(...)
       7. │   │ └─base::withVisible(code)
       8. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
       9. └─criticalpath::sch_plan(sch)
      
      [ FAIL 86 | WARN 0 | SKIP 0 | PASS 256 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘criticalpath-introduction.Rmd’ using rmarkdown
    
    Quitting from criticalpath-introduction.Rmd:94-117 [unnamed-chunk-2]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    <error/rlang_error>
    Error in `sch_plan()`:
    ! The schedule is invalid!!! To view the problem, execute:
    
             `validation <- sch_validate(sch)`
    ---
    Backtrace:
        ▆
     1. ├─... %>% sch_plan()
     2. └─criticalpath::sch_plan(.)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Error: processing vignette 'criticalpath-introduction.Rmd' failed with diagnostics:
    The schedule is invalid!!! To view the problem, execute:
    
             `validation <- sch_validate(sch)`
    --- failed re-building ‘criticalpath-introduction.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘criticalpath-introduction.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# deepdep

<details>

* Version: 0.4.3
* GitHub: https://github.com/DominikRafacz/deepdep
* Source code: https://github.com/cran/deepdep
* Date/Publication: 2024-03-12 21:10:07 UTC
* Number of recursive dependencies: 141

Run `revdepcheck::cloud_details(, "deepdep")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(deepdep)
      > 
      > test_check("deepdep")
      [ FAIL 11 | WARN 0 | SKIP 2 | PASS 23 ]
      
      ══ Skipped tests (2) ═══════════════════════════════════════════════════════════
      • On CRAN (2): 'test-plot.R:135:3', 'test-plot_downloads.R:8:3'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-deepdep_declutter.R:6:3'): number of rows doesn't increase ─────
      Error in `igraph::graph_from_data_frame(dd)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─testthat::expect_lte(nrow(deepdep_declutter(dd_R6)), nrow(dd_R6)) at test-deepdep_declutter.R:6:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. ├─base::nrow(deepdep_declutter(dd_R6))
       5. └─deepdep:::deepdep_declutter(dd_R6)
       6.   └─igraph::graph_from_data_frame(dd)
       7.     └─igraph:::ensure_no_na(d, "edge data frame")
       8.       └─cli::cli_abort(...)
       9.         └─rlang::abort(...)
      ── Error ('test-deepdep_declutter.R:10:3'): no Suggests or Enhances in outer layers ──
      Error in `igraph::graph_from_data_frame(dd)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─deepdep:::deepdep_declutter(dd_R6) at test-deepdep_declutter.R:10:3
       2.   └─igraph::graph_from_data_frame(dd)
       3.     └─igraph:::ensure_no_na(d, "edge data frame")
       4.       └─cli::cli_abort(...)
       5.         └─rlang::abort(...)
      ── Error ('test-plot.R:30:3'): The only origin with level == 0 is equal to queried package ──
      Error in `igraph::graph_from_data_frame(x, vertices = vertices)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─deepdep::plot_dependencies(dd_R6) at test-plot.R:30:3
       2. └─deepdep:::plot_dependencies.deepdep(dd_R6)
       3.   └─igraph::graph_from_data_frame(x, vertices = vertices)
       4.     └─igraph:::ensure_no_na(d, "edge data frame")
       5.       └─cli::cli_abort(...)
       6.         └─rlang::abort(...)
      ── Error ('test-plot.R:39:3'): There are dependencies between central package and layer 1 packages ──
      Error in `igraph::graph_from_data_frame(x, vertices = vertices)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─deepdep::plot_dependencies(dd_R6) at test-plot.R:39:3
       2. └─deepdep:::plot_dependencies.deepdep(dd_R6)
       3.   └─igraph::graph_from_data_frame(x, vertices = vertices)
       4.     └─igraph:::ensure_no_na(d, "edge data frame")
       5.       └─cli::cli_abort(...)
       6.         └─rlang::abort(...)
      ── Error ('test-plot.R:51:3'): deepdep plot has correct layers and objects ─────
      Error in `igraph::graph_from_data_frame(x, vertices = vertices)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─deepdep::plot_dependencies(dd_shiny) at test-plot.R:51:3
       2. └─deepdep:::plot_dependencies.deepdep(dd_shiny)
       3.   └─igraph::graph_from_data_frame(x, vertices = vertices)
       4.     └─igraph:::ensure_no_na(d, "edge data frame")
       5.       └─cli::cli_abort(...)
       6.         └─rlang::abort(...)
      ── Error ('test-plot.R:70:3'): deepdep plot omits same level and reverse dependencies ──
      Error in `igraph::graph_from_data_frame(x, vertices = vertices)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─deepdep::plot_dependencies(dd_dt) at test-plot.R:70:3
       2. └─deepdep:::plot_dependencies.deepdep(dd_dt)
       3.   └─igraph::graph_from_data_frame(x, vertices = vertices)
       4.     └─igraph:::ensure_no_na(d, "edge data frame")
       5.       └─cli::cli_abort(...)
       6.         └─rlang::abort(...)
      ── Error ('test-plot.R:80:3'): deepdep plot can keep same level dependencies ───
      Error in `igraph::graph_from_data_frame(x, vertices = vertices)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─deepdep::plot_dependencies(dd_dt, same_level = TRUE) at test-plot.R:80:3
       2. └─deepdep:::plot_dependencies.deepdep(dd_dt, same_level = TRUE)
       3.   └─igraph::graph_from_data_frame(x, vertices = vertices)
       4.     └─igraph:::ensure_no_na(d, "edge data frame")
       5.       └─cli::cli_abort(...)
       6.         └─rlang::abort(...)
      ── Error ('test-plot.R:90:3'): deepdep plot can keep reverse dependencies ──────
      Error in `igraph::graph_from_data_frame(x, vertices = vertices)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─deepdep::plot_dependencies(dd_dt, reverse = TRUE) at test-plot.R:90:3
       2. └─deepdep:::plot_dependencies.deepdep(dd_dt, reverse = TRUE)
       3.   └─igraph::graph_from_data_frame(x, vertices = vertices)
       4.     └─igraph:::ensure_no_na(d, "edge data frame")
       5.       └─cli::cli_abort(...)
       6.         └─rlang::abort(...)
      ── Error ('test-plot.R:100:3'): deepdep plot can keep all dependencies ─────────
      Error in `igraph::graph_from_data_frame(x, vertices = vertices)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─deepdep::plot_dependencies(dd_dt, same_level = TRUE, reverse = TRUE) at test-plot.R:100:3
       2. └─deepdep:::plot_dependencies.deepdep(...)
       3.   └─igraph::graph_from_data_frame(x, vertices = vertices)
       4.     └─igraph:::ensure_no_na(d, "edge data frame")
       5.       └─cli::cli_abort(...)
       6.         └─rlang::abort(...)
      ── Error ('test-plot.R:108:3'): deepdep plot has a caption by default ──────────
      Error in `igraph::graph_from_data_frame(x, vertices = vertices)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─deepdep::plot_dependencies(dd_shiny) at test-plot.R:108:3
       2. └─deepdep:::plot_dependencies.deepdep(dd_shiny)
       3.   └─igraph::graph_from_data_frame(x, vertices = vertices)
       4.     └─igraph:::ensure_no_na(d, "edge data frame")
       5.       └─cli::cli_abort(...)
       6.         └─rlang::abort(...)
      ── Error ('test-plot.R:126:3'): deepdep plot has no caption when specified ─────
      Error in `igraph::graph_from_data_frame(x, vertices = vertices)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─deepdep::plot_dependencies(dd_shiny, show_stamp = FALSE) at test-plot.R:126:3
       2. └─deepdep:::plot_dependencies.deepdep(dd_shiny, show_stamp = FALSE)
       3.   └─igraph::graph_from_data_frame(x, vertices = vertices)
       4.     └─igraph:::ensure_no_na(d, "edge data frame")
       5.       └─cli::cli_abort(...)
       6.         └─rlang::abort(...)
      
      [ FAIL 11 | WARN 0 | SKIP 2 | PASS 23 ]
      Error: Test failures
      Execution halted
      Ran 14/14 deferred expressions
    ```

# DiagrammeR

<details>

* Version: 1.0.11
* GitHub: https://github.com/rich-iannone/DiagrammeR
* Source code: https://github.com/cran/DiagrammeR
* Date/Publication: 2024-02-02 23:30:03 UTC
* Number of recursive dependencies: 79

Run `revdepcheck::cloud_details(, "DiagrammeR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘DiagrammeR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: colorize_node_attrs
    > ### Title: Apply colors based on node attribute values
    > ### Aliases: colorize_node_attrs
    > 
    > ### ** Examples
    > 
    > # Create a graph with 8
    > # nodes and 7 edges
    > graph <-
    +   create_graph() %>%
    +   add_path(n = 8) %>%
    +   set_node_attrs(
    +     node_attr = weight,
    +     values = c(
    +       8.2, 3.7, 6.3, 9.2,
    +       1.6, 2.5, 7.2, 5.4))
    > 
    > # Find group membership values for all nodes
    > # in the graph through the Walktrap community
    > # finding algorithm and join those group values
    > # to the graph's internal node data frame (ndf)
    > # with the `join_node_attrs()` function
    > graph <-
    +   graph %>%
    +   join_node_attrs(
    +     df = get_cmty_walktrap(.))
    Error in `igraph::graph_from_data_frame()`:
    ! Cannot create a graph object because the edge data frame contains NAs.
    Backtrace:
         ▆
      1. ├─graph %>% join_node_attrs(df = get_cmty_walktrap(.))
      2. ├─DiagrammeR::join_node_attrs(., df = get_cmty_walktrap(.))
      3. │ └─base::colnames(df)
      4. │   └─base::is.data.frame(x)
      5. └─DiagrammeR::get_cmty_walktrap(.)
      6.   └─DiagrammeR::to_igraph(graph)
      7.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
      8.       └─igraph:::ensure_no_na(d, "edge data frame")
      9.         └─cli::cli_abort(...)
     10.           └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > # This file is part of the standard setup for testthat.
      > # It is recommended that you do not modify it.
      > #
      > # Where should you do additional test configuration?
      > # Learn more about the roles of various files in:
      > # * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
      > # * https://testthat.r-lib.org/articles/special-files.html
      > 
      > library(testthat)
      > library(DiagrammeR)
      > 
      > test_check("DiagrammeR")
      [ FAIL 66 | WARN 0 | SKIP 22 | PASS 1314 ]
      
      ══ Skipped tests (22) ══════════════════════════════════════════════════════════
      • On CRAN (22): 'test-add_forward_reverse_edges.R:94:3',
        'test-add_graphs.R:41:3', 'test-add_graphs.R:262:3',
        'test-add_graphs.R:1787:3', 'test-add_nodes_edges_from_table.R:684:3',
        'test-colorize_nodes_edges.R:415:3', 'test-create_combine_nodes.R:88:3',
        'test-create_subgraph.R:73:3', 'test-delete_node_edge.R:286:3',
        'test-get_select_last_nodes_edges_created.R:135:3',
        'test-graph_series.R:361:3', 'test-graph_validation.R:17:3',
        'test-graph_validation.R:241:3', 'test-graph_validation.R:301:3',
        'test-render_graph.R:3:3', 'test-selections.R:163:3',
        'test-set_get_node_edge_attrs.R:332:3', 'test-similarity_measures.R:126:3',
        'test-transform_graph.R:138:3', 'test-transform_graph.R:308:3',
        'test-trav_out_until.R:73:3', 'test-traversals.R:148:3'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-cache_attrs.R:17:3'): Setting a cache is possible ──────────────
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─DiagrammeR::get_closeness(graph) at test-cache_attrs.R:17:3
       2.   └─DiagrammeR::to_igraph(graph)
       3.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       4.       └─igraph:::ensure_no_na(d, "edge data frame")
       5.         └─cli::cli_abort(...)
       6.           └─rlang::abort(...)
      ── Error ('test-cache_attrs.R:114:3'): Getting a cache is possible ─────────────
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─DiagrammeR::get_closeness(graph) at test-cache_attrs.R:114:3
       2.   └─DiagrammeR::to_igraph(graph)
       3.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       4.       └─igraph:::ensure_no_na(d, "edge data frame")
       5.         └─cli::cli_abort(...)
       6.           └─rlang::abort(...)
      ── Error ('test-colorize_nodes_edges.R:21:3'): Adding color based on node attributes is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─graph %>% join_node_attrs(get_cmty_walktrap(.)) at test-colorize_nodes_edges.R:21:3
        2. ├─DiagrammeR::join_node_attrs(., get_cmty_walktrap(.))
        3. │ └─base::colnames(df)
        4. │   └─base::is.data.frame(x)
        5. └─DiagrammeR::get_cmty_walktrap(.)
        6.   └─DiagrammeR::to_igraph(graph)
        7.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
        8.       └─igraph:::ensure_no_na(d, "edge data frame")
        9.         └─cli::cli_abort(...)
       10.           └─rlang::abort(...)
      ── Error ('test-count_entities.R:156:3'): counting the number of weakly connected components is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─testthat::expect_equal(graph %>% count_w_connected_cmpts(), 2) at test-count_entities.R:156:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─graph %>% count_w_connected_cmpts()
        5. └─DiagrammeR::count_w_connected_cmpts(.)
        6.   └─DiagrammeR::to_igraph(graph)
        7.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
        8.       └─igraph:::ensure_no_na(d, "edge data frame")
        9.         └─cli::cli_abort(...)
       10.           └─rlang::abort(...)
      ── Error ('test-degree_total_in_out.R:15:3'): a degree data frame can be generated ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─DiagrammeR::get_degree_total(graph) at test-degree_total_in_out.R:15:3
       2.   └─DiagrammeR::to_igraph(graph)
       3.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       4.       └─igraph:::ensure_no_na(d, "edge data frame")
       5.         └─cli::cli_abort(...)
       6.           └─rlang::abort(...)
      ── Error ('test-dfs_bfs.R:17:3'): the dfs algorithm is functional ──────────────
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─graph %>% do_dfs(node = 1) at test-dfs_bfs.R:17:3
       2. └─DiagrammeR::do_dfs(., node = 1)
       3.   └─DiagrammeR::to_igraph(graph)
       4.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       5.       └─igraph:::ensure_no_na(d, "edge data frame")
       6.         └─cli::cli_abort(...)
       7.           └─rlang::abort(...)
      ── Error ('test-dfs_bfs.R:121:3'): the bfs algorithm is functional ─────────────
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─graph %>% do_bfs(node = 1) at test-dfs_bfs.R:121:3
       2. └─DiagrammeR::do_bfs(., node = 1)
       3.   └─DiagrammeR::to_igraph(graph)
       4.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       5.       └─igraph:::ensure_no_na(d, "edge data frame")
       6.         └─cli::cli_abort(...)
       7.           └─rlang::abort(...)
      ── Error ('test-get_aggregate_degree.R:18:3'): Getting aggregated indegree values is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─testthat::expect_equal(...) at test-get_aggregate_degree.R:18:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─DiagrammeR::get_agg_degree_in(graph = graph, agg = "mean")
        5.   └─DiagrammeR::get_degree_in(graph)
        6.     └─DiagrammeR::to_igraph(graph)
        7.       └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
        8.         └─igraph:::ensure_no_na(d, "edge data frame")
        9.           └─cli::cli_abort(...)
       10.             └─rlang::abort(...)
      ── Error ('test-get_aggregate_degree.R:135:3'): Getting aggregated outdegree values is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─testthat::expect_equal(...) at test-get_aggregate_degree.R:135:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─DiagrammeR::get_agg_degree_out(graph = graph, agg = "mean")
        5.   └─DiagrammeR::get_degree_out(graph)
        6.     └─DiagrammeR::to_igraph(graph)
        7.       └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
        8.         └─igraph:::ensure_no_na(d, "edge data frame")
        9.           └─cli::cli_abort(...)
       10.             └─rlang::abort(...)
      ── Error ('test-get_aggregate_degree.R:257:3'): Getting aggregated total degree values is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─testthat::expect_equal(...) at test-get_aggregate_degree.R:257:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─DiagrammeR::get_agg_degree_total(graph = graph, agg = "mean")
        5.   └─DiagrammeR::get_degree_total(graph)
        6.     └─DiagrammeR::to_igraph(graph)
        7.       └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
        8.         └─igraph:::ensure_no_na(d, "edge data frame")
        9.           └─cli::cli_abort(...)
       10.             └─rlang::abort(...)
      ── Error ('test-get_cmty.R:14:3'): the edge betweeness algorithm is functional ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─DiagrammeR::get_cmty_edge_btwns(graph) at test-get_cmty.R:14:3
       2.   └─DiagrammeR::to_igraph(graph)
       3.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       4.       └─igraph:::ensure_no_na(d, "edge data frame")
       5.         └─cli::cli_abort(...)
       6.           └─rlang::abort(...)
      ── Error ('test-get_cmty.R:61:3'): the fast-greedy algorithm is functional ─────
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─DiagrammeR::get_cmty_fast_greedy(graph) at test-get_cmty.R:61:3
       2.   └─DiagrammeR::to_igraph(graph)
       3.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       4.       └─igraph:::ensure_no_na(d, "edge data frame")
       5.         └─cli::cli_abort(...)
       6.           └─rlang::abort(...)
      ── Error ('test-get_cmty.R:107:3'): the leading eigenvector algorithm is functional ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─DiagrammeR::get_cmty_l_eigenvec(graph) at test-get_cmty.R:107:3
       2.   └─DiagrammeR::to_igraph(graph)
       3.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       4.       └─igraph:::ensure_no_na(d, "edge data frame")
       5.         └─cli::cli_abort(...)
       6.           └─rlang::abort(...)
      ── Error ('test-get_cmty.R:151:3'): the Louvain algorithm is functional ────────
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─DiagrammeR::get_cmty_louvain(graph) at test-get_cmty.R:151:3
       2.   └─DiagrammeR::to_igraph(graph)
       3.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       4.       └─igraph:::ensure_no_na(d, "edge data frame")
       5.         └─cli::cli_abort(...)
       6.           └─rlang::abort(...)
      ── Error ('test-get_cmty.R:197:3'): the walktrap algorithm is functional ───────
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─DiagrammeR::get_cmty_walktrap(graph) at test-get_cmty.R:197:3
       2.   └─DiagrammeR::to_igraph(graph)
       3.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       4.       └─igraph:::ensure_no_na(d, "edge data frame")
       5.         └─cli::cli_abort(...)
       6.           └─rlang::abort(...)
      ── Error ('test-get_graph_metrics.R:14:3'): Getting a degree histogram is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─DiagrammeR::get_degree_histogram(graph = graph, mode = "all") at test-get_graph_metrics.R:14:3
        2. │ ├─... %>% dplyr::select("degree", "total_degree_hist")
        3. │ └─DiagrammeR::get_degree_distribution(graph)
        4. │   └─DiagrammeR::to_igraph(graph)
        5. │     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
        6. │       └─igraph:::ensure_no_na(d, "edge data frame")
        7. │         └─cli::cli_abort(...)
        8. │           └─rlang::abort(...)
        9. ├─dplyr::select(., "degree", "total_degree_hist")
       10. └─dplyr::mutate(., total_degree_hist = total_degree_dist * count_nodes(graph))
      ── Error ('test-get_graph_metrics.R:70:3'): Getting degree distribution is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─DiagrammeR::get_degree_distribution(graph = graph, mode = "all") at test-get_graph_metrics.R:70:3
       2.   └─DiagrammeR::to_igraph(graph)
       3.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       4.       └─igraph:::ensure_no_na(d, "edge data frame")
       5.         └─cli::cli_abort(...)
       6.           └─rlang::abort(...)
      ── Error ('test-get_graph_metrics.R:125:3'): Getting maximum eccentricity is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─DiagrammeR::get_max_eccentricity(graph) at test-get_graph_metrics.R:125:3
       2.   └─DiagrammeR::to_igraph(graph)
       3.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       4.       └─igraph:::ensure_no_na(d, "edge data frame")
       5.         └─cli::cli_abort(...)
       6.           └─rlang::abort(...)
      ── Error ('test-get_graph_metrics.R:154:3'): Getting minimum eccentricity is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─DiagrammeR::get_min_eccentricity(graph = graph, direction = "all") at test-get_graph_metrics.R:154:3
       2.   └─DiagrammeR::to_igraph(graph)
       3.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       4.       └─igraph:::ensure_no_na(d, "edge data frame")
       5.         └─cli::cli_abort(...)
       6.           └─rlang::abort(...)
      ── Error ('test-get_graph_metrics.R:207:3'): Getting graph eccentricity is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─DiagrammeR::get_eccentricity(graph) at test-get_graph_metrics.R:207:3
       2.   └─DiagrammeR::to_igraph(graph)
       3.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       4.       └─igraph:::ensure_no_na(d, "edge data frame")
       5.         └─cli::cli_abort(...)
       6.           └─rlang::abort(...)
      ── Error ('test-get_graph_metrics.R:241:3'): Getting graph periphery is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─DiagrammeR::get_periphery(graph) at test-get_graph_metrics.R:241:3
       2.   └─DiagrammeR::get_eccentricity(graph)
       3.     └─DiagrammeR::to_igraph(graph)
       4.       └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       5.         └─igraph:::ensure_no_na(d, "edge data frame")
       6.           └─cli::cli_abort(...)
       7.             └─rlang::abort(...)
      ── Error ('test-get_graph_metrics.R:316:3'): Checking whether the graph is connected is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─testthat::expect_true(is_graph_connected(graph_connected)) at test-get_graph_metrics.R:316:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─DiagrammeR::is_graph_connected(graph_connected)
        5. │ └─DiagrammeR::get_w_connected_cmpts(graph)
        6. │   └─... %>% to_igraph()
        7. └─DiagrammeR::to_igraph(.)
        8.   └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
        9.     └─igraph:::ensure_no_na(d, "edge data frame")
       10.       └─cli::cli_abort(...)
       11.         └─rlang::abort(...)
      ── Error ('test-get_graph_metrics.R:349:3'): Getting graph adhesion is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(get_adhesion(graph_cycle), 1) at test-get_graph_metrics.R:349:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─DiagrammeR::get_adhesion(graph_cycle)
       5.   └─DiagrammeR::to_igraph(graph)
       6.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       7.       └─igraph:::ensure_no_na(d, "edge data frame")
       8.         └─cli::cli_abort(...)
       9.           └─rlang::abort(...)
      ── Error ('test-get_graph_metrics.R:378:3'): Getting graph girth is possible ───
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(get_girth(graph_cycle), 5) at test-get_graph_metrics.R:378:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─DiagrammeR::get_girth(graph_cycle)
       5.   └─DiagrammeR::to_igraph(graph)
       6.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       7.       └─igraph:::ensure_no_na(d, "edge data frame")
       8.         └─cli::cli_abort(...)
       9.           └─rlang::abort(...)
      ── Error ('test-get_graph_metrics.R:407:3'): Getting the mean distance for a graph is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(get_mean_distance(graph_cycle), 2.5) at test-get_graph_metrics.R:407:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─DiagrammeR::get_mean_distance(graph_cycle)
       5.   └─DiagrammeR::to_igraph(graph)
       6.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       7.       └─igraph:::ensure_no_na(d, "edge data frame")
       8.         └─cli::cli_abort(...)
       9.           └─rlang::abort(...)
      ── Error ('test-get_graph_metrics.R:436:3'): Getting the reciprocity for a graph is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(get_reciprocity(graph), 4/7) at test-get_graph_metrics.R:436:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─DiagrammeR::get_reciprocity(graph)
       5.   └─DiagrammeR::to_igraph(graph)
       6.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       7.       └─igraph:::ensure_no_na(d, "edge data frame")
       8.         └─cli::cli_abort(...)
       9.           └─rlang::abort(...)
      ── Error ('test-get_graph_metrics.R:480:3'): Getting the minimum cut between nodes is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(...) at test-get_graph_metrics.R:480:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─DiagrammeR::get_min_cut_between(...)
       5.   └─DiagrammeR::to_igraph(graph)
       6.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       7.       └─igraph:::ensure_no_na(d, "edge data frame")
       8.         └─cli::cli_abort(...)
       9.           └─rlang::abort(...)
      ── Error ('test-get_graph_metrics.R:518:3'): Getting a count of graph automorphisms is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(count_automorphisms(graph_cycle), 10) at test-get_graph_metrics.R:518:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─DiagrammeR::count_automorphisms(graph_cycle)
       5.   └─DiagrammeR::to_igraph(graph_undirected)
       6.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       7.       └─igraph:::ensure_no_na(d, "edge data frame")
       8.         └─cli::cli_abort(...)
       9.           └─rlang::abort(...)
      ── Error ('test-get_graph_metrics.R:547:3'): Getting a count of asymmetric node pairs is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(...) at test-get_graph_metrics.R:547:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─DiagrammeR::count_asymmetric_node_pairs(graph_cycle)
       5.   └─DiagrammeR::to_igraph(graph)
       6.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       7.       └─igraph:::ensure_no_na(d, "edge data frame")
       8.         └─cli::cli_abort(...)
       9.           └─rlang::abort(...)
      ── Error ('test-get_graph_metrics.R:576:3'): Getting a count of mutual node pairs is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(...) at test-get_graph_metrics.R:576:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─DiagrammeR::count_mutual_node_pairs(graph_cycle)
       5.   └─DiagrammeR::to_igraph(graph)
       6.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       7.       └─igraph:::ensure_no_na(d, "edge data frame")
       8.         └─cli::cli_abort(...)
       9.           └─rlang::abort(...)
      ── Error ('test-get_graph_metrics.R:605:3'): Getting a count of unconnected node pairs is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(...) at test-get_graph_metrics.R:605:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─DiagrammeR::count_unconnected_node_pairs(graph_cycle)
       5.   └─DiagrammeR::to_igraph(graph)
       6.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       7.       └─igraph:::ensure_no_na(d, "edge data frame")
       8.         └─cli::cli_abort(...)
       9.           └─rlang::abort(...)
      ── Error ('test-get_node_calculations.R:13:3'): Getting betweenness is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─DiagrammeR::get_betweenness(graph) at test-get_node_calculations.R:13:3
       2.   └─DiagrammeR::to_igraph(graph)
       3.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       4.       └─igraph:::ensure_no_na(d, "edge data frame")
       5.         └─cli::cli_abort(...)
       6.           └─rlang::abort(...)
      ── Error ('test-get_node_calculations.R:50:3'): Getting closeness is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─DiagrammeR::get_closeness(graph = graph, direction = "all") at test-get_node_calculations.R:50:3
       2.   └─DiagrammeR::to_igraph(graph)
       3.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       4.       └─igraph:::ensure_no_na(d, "edge data frame")
       5.         └─cli::cli_abort(...)
       6.           └─rlang::abort(...)
      ── Error ('test-get_node_calculations.R:84:3'): Getting coreness values is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─DiagrammeR::get_coreness(graph) at test-get_node_calculations.R:84:3
       2.   └─DiagrammeR::to_igraph(graph)
       3.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       4.       └─igraph:::ensure_no_na(d, "edge data frame")
       5.         └─cli::cli_abort(...)
       6.           └─rlang::abort(...)
      ── Error ('test-get_node_calculations.R:183:3'): Getting closeness vitality is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─DiagrammeR::get_closeness_vitality(graph) at test-get_node_calculations.R:183:3
       2.   └─DiagrammeR::to_igraph(graph)
       3.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       4.       └─igraph:::ensure_no_na(d, "edge data frame")
       5.         └─cli::cli_abort(...)
       6.           └─rlang::abort(...)
      ── Error ('test-get_node_calculations.R:218:3'): Getting alpha centrality is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─DiagrammeR::get_alpha_centrality(graph) at test-get_node_calculations.R:218:3
       2.   └─DiagrammeR::to_igraph(graph)
       3.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       4.       └─igraph:::ensure_no_na(d, "edge data frame")
       5.         └─cli::cli_abort(...)
       6.           └─rlang::abort(...)
      ── Error ('test-get_node_calculations.R:255:3'): Getting leverage centrality is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─DiagrammeR::get_leverage_centrality(graph) at test-get_node_calculations.R:255:3
       2.   └─DiagrammeR::to_igraph(graph)
       3.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       4.       └─igraph:::ensure_no_na(d, "edge data frame")
       5.         └─cli::cli_abort(...)
       6.           └─rlang::abort(...)
      ── Error ('test-get_node_calculations.R:341:3'): Getting authority centrality is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
    ...
       22.               └─rlang::abort(...)
      ── Error ('test-is_something_some_thing.R:349:3'): Identifying the graph as a DAG is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─testthat::expect_false(is_graph_dag(non_dag)) at test-is_something_some_thing.R:349:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─DiagrammeR::is_graph_dag(non_dag)
       5.   └─DiagrammeR::to_igraph(graph)
       6.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       7.       └─igraph:::ensure_no_na(d, "edge data frame")
       8.         └─cli::cli_abort(...)
       9.           └─rlang::abort(...)
      ── Error ('test-is_something_some_thing.R:377:3'): Detecting whether a graph is simple is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─testthat::expect_true(is_graph_simple(graph)) at test-is_something_some_thing.R:377:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─DiagrammeR::is_graph_simple(graph)
       5.   └─DiagrammeR::to_igraph(graph)
       6.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       7.       └─igraph:::ensure_no_na(d, "edge data frame")
       8.         └─cli::cli_abort(...)
       9.           └─rlang::abort(...)
      ── Error ('test-mst.R:8:3'): the MST algorithm is functional ───────────────────
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─... %>% get_jaccard_similarity() at test-mst.R:8:3
       2. └─DiagrammeR::get_jaccard_similarity(.)
       3.   └─DiagrammeR::to_igraph(graph)
       4.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       5.       └─igraph:::ensure_no_na(d, "edge data frame")
       6.         └─cli::cli_abort(...)
       7.           └─rlang::abort(...)
      ── Error ('test-print.R:96:3'): Printing a summary of node types works ─────────
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─testthat::expect_equal(...) at test-print.R:96:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─graph_type_complete %>% get_printed_output(4) %>% stringr::str_trim()
        5. ├─stringr::str_trim(.)
        6. │ └─stringi::stri_trim_both(string)
        7. ├─DiagrammeR (local) get_printed_output(., 4)
        8. │ ├─... %>% unlist() at test-print.R:5:3
        9. │ ├─testthat::capture_output(graph %>% print())
       10. │ │ └─testthat::capture_output_lines(code, print, width = width)
       11. │ │   └─testthat:::eval_with_output(code, print = print, width = width)
       12. │ │     ├─withr::with_output_sink(path, withVisible(code))
       13. │ │     │ └─base::force(code)
       14. │ │     └─base::withVisible(code)
       15. │ └─graph %>% print()
       16. ├─base::unlist(.)
       17. ├─stringr::str_split(., pattern = "\n")
       18. │ └─stringr:::check_lengths(string, pattern)
       19. │   └─vctrs::vec_size_common(...)
       20. ├─base::print(.)
       21. └─DiagrammeR:::print.dgr_graph(.)
       22.   └─DiagrammeR::is_graph_dag(x)
       23.     └─DiagrammeR::to_igraph(graph)
       24.       └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       25.         └─igraph:::ensure_no_na(d, "edge data frame")
       26.           └─cli::cli_abort(...)
       27.             └─rlang::abort(...)
      ── Error ('test-print.R:119:3'): Printing a summary of node labels works ───────
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─testthat::expect_equal(...) at test-print.R:119:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─... %>% stringr::str_trim()
        5. ├─stringr::str_trim(.)
        6. │ └─stringi::stri_trim_both(string)
        7. ├─base::substr(., 1, 60)
        8. ├─DiagrammeR (local) get_printed_output(., 4)
        9. │ ├─... %>% unlist() at test-print.R:5:3
       10. │ ├─testthat::capture_output(graph %>% print())
       11. │ │ └─testthat::capture_output_lines(code, print, width = width)
       12. │ │   └─testthat:::eval_with_output(code, print = print, width = width)
       13. │ │     ├─withr::with_output_sink(path, withVisible(code))
       14. │ │     │ └─base::force(code)
       15. │ │     └─base::withVisible(code)
       16. │ └─graph %>% print()
       17. ├─base::unlist(.)
       18. ├─stringr::str_split(., pattern = "\n")
       19. │ └─stringr:::check_lengths(string, pattern)
       20. │   └─vctrs::vec_size_common(...)
       21. ├─base::print(.)
       22. └─DiagrammeR:::print.dgr_graph(.)
       23.   └─DiagrammeR::is_graph_dag(x)
       24.     └─DiagrammeR::to_igraph(graph)
       25.       └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       26.         └─igraph:::ensure_no_na(d, "edge data frame")
       27.           └─cli::cli_abort(...)
       28.             └─rlang::abort(...)
      ── Error ('test-print.R:157:3'): Printing a summary of extra node attrs works ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─testthat::expect_equal(...) at test-print.R:157:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─graph_node_attr_1 %>% get_printed_output(5) %>% stringr::str_trim()
        5. ├─stringr::str_trim(.)
        6. │ └─stringi::stri_trim_both(string)
        7. ├─DiagrammeR (local) get_printed_output(., 5)
        8. │ ├─... %>% unlist() at test-print.R:5:3
        9. │ ├─testthat::capture_output(graph %>% print())
       10. │ │ └─testthat::capture_output_lines(code, print, width = width)
       11. │ │   └─testthat:::eval_with_output(code, print = print, width = width)
       12. │ │     ├─withr::with_output_sink(path, withVisible(code))
       13. │ │     │ └─base::force(code)
       14. │ │     └─base::withVisible(code)
       15. │ └─graph %>% print()
       16. ├─base::unlist(.)
       17. ├─stringr::str_split(., pattern = "\n")
       18. │ └─stringr:::check_lengths(string, pattern)
       19. │   └─vctrs::vec_size_common(...)
       20. ├─base::print(.)
       21. └─DiagrammeR:::print.dgr_graph(.)
       22.   └─DiagrammeR::is_graph_dag(x)
       23.     └─DiagrammeR::to_igraph(graph)
       24.       └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       25.         └─igraph:::ensure_no_na(d, "edge data frame")
       26.           └─cli::cli_abort(...)
       27.             └─rlang::abort(...)
      ── Error ('test-print.R:194:3'): Printing a summary of edge rel values works ───
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─testthat::expect_equal(...) at test-print.R:194:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─... %>% stringr::str_trim()
        5. ├─stringr::str_trim(.)
        6. │ └─stringi::stri_trim_both(string)
        7. ├─base::substr(., 1, 60)
        8. ├─DiagrammeR (local) get_printed_output(., 4)
        9. │ ├─... %>% unlist() at test-print.R:5:3
       10. │ ├─testthat::capture_output(graph %>% print())
       11. │ │ └─testthat::capture_output_lines(code, print, width = width)
       12. │ │   └─testthat:::eval_with_output(code, print = print, width = width)
       13. │ │     ├─withr::with_output_sink(path, withVisible(code))
       14. │ │     │ └─base::force(code)
       15. │ │     └─base::withVisible(code)
       16. │ └─graph %>% print()
       17. ├─base::unlist(.)
       18. ├─stringr::str_split(., pattern = "\n")
       19. │ └─stringr:::check_lengths(string, pattern)
       20. │   └─vctrs::vec_size_common(...)
       21. ├─base::print(.)
       22. └─DiagrammeR:::print.dgr_graph(.)
       23.   └─DiagrammeR::is_graph_dag(x)
       24.     └─DiagrammeR::to_igraph(graph)
       25.       └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       26.         └─igraph:::ensure_no_na(d, "edge data frame")
       27.           └─cli::cli_abort(...)
       28.             └─rlang::abort(...)
      ── Error ('test-print.R:227:3'): Printing a summary of extra edge attrs works ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─testthat::expect_equal(...) at test-print.R:227:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─graph_edge_attr_1 %>% get_printed_output(7) %>% stringr::str_trim()
        5. ├─stringr::str_trim(.)
        6. │ └─stringi::stri_trim_both(string)
        7. ├─DiagrammeR (local) get_printed_output(., 7)
        8. │ ├─... %>% unlist() at test-print.R:5:3
        9. │ ├─testthat::capture_output(graph %>% print())
       10. │ │ └─testthat::capture_output_lines(code, print, width = width)
       11. │ │   └─testthat:::eval_with_output(code, print = print, width = width)
       12. │ │     ├─withr::with_output_sink(path, withVisible(code))
       13. │ │     │ └─base::force(code)
       14. │ │     └─base::withVisible(code)
       15. │ └─graph %>% print()
       16. ├─base::unlist(.)
       17. ├─stringr::str_split(., pattern = "\n")
       18. │ └─stringr:::check_lengths(string, pattern)
       19. │   └─vctrs::vec_size_common(...)
       20. ├─base::print(.)
       21. └─DiagrammeR:::print.dgr_graph(.)
       22.   └─DiagrammeR::is_graph_dag(x)
       23.     └─DiagrammeR::to_igraph(graph)
       24.       └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       25.         └─igraph:::ensure_no_na(d, "edge data frame")
       26.           └─cli::cli_abort(...)
       27.             └─rlang::abort(...)
      ── Error ('test-print.R:256:3'): Describing if a graph is weighted works ───────
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─testthat::expect_match(...) at test-print.R:256:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─graph_weighted %>% get_printed_output(2)
        5. ├─DiagrammeR (local) get_printed_output(., 2)
        6. │ ├─... %>% unlist() at test-print.R:5:3
        7. │ ├─testthat::capture_output(graph %>% print())
        8. │ │ └─testthat::capture_output_lines(code, print, width = width)
        9. │ │   └─testthat:::eval_with_output(code, print = print, width = width)
       10. │ │     ├─withr::with_output_sink(path, withVisible(code))
       11. │ │     │ └─base::force(code)
       12. │ │     └─base::withVisible(code)
       13. │ └─graph %>% print()
       14. ├─base::unlist(.)
       15. ├─stringr::str_split(., pattern = "\n")
       16. │ └─stringr:::check_lengths(string, pattern)
       17. │   └─vctrs::vec_size_common(...)
       18. ├─base::print(.)
       19. └─DiagrammeR:::print.dgr_graph(.)
       20.   └─DiagrammeR::is_graph_dag(x)
       21.     └─DiagrammeR::to_igraph(graph)
       22.       └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       23.         └─igraph:::ensure_no_na(d, "edge data frame")
       24.           └─cli::cli_abort(...)
       25.             └─rlang::abort(...)
      ── Error ('test-print.R:275:3'): Describing if a graph is a DAG works ──────────
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─testthat::expect_match(graph_dag %>% get_printed_output(2), "DAG") at test-print.R:275:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─graph_dag %>% get_printed_output(2)
        5. ├─DiagrammeR (local) get_printed_output(., 2)
        6. │ ├─... %>% unlist() at test-print.R:5:3
        7. │ ├─testthat::capture_output(graph %>% print())
        8. │ │ └─testthat::capture_output_lines(code, print, width = width)
        9. │ │   └─testthat:::eval_with_output(code, print = print, width = width)
       10. │ │     ├─withr::with_output_sink(path, withVisible(code))
       11. │ │     │ └─base::force(code)
       12. │ │     └─base::withVisible(code)
       13. │ └─graph %>% print()
       14. ├─base::unlist(.)
       15. ├─stringr::str_split(., pattern = "\n")
       16. │ └─stringr:::check_lengths(string, pattern)
       17. │   └─vctrs::vec_size_common(...)
       18. ├─base::print(.)
       19. └─DiagrammeR:::print.dgr_graph(.)
       20.   └─DiagrammeR::is_graph_dag(x)
       21.     └─DiagrammeR::to_igraph(graph)
       22.       └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       23.         └─igraph:::ensure_no_na(d, "edge data frame")
       24.           └─cli::cli_abort(...)
       25.             └─rlang::abort(...)
      ── Error ('test-print.R:324:3'): Describing if a graph is a simple graph works ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─testthat::expect_match(...) at test-print.R:324:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─graph_simple %>% get_printed_output(2)
        5. ├─DiagrammeR (local) get_printed_output(., 2)
        6. │ ├─... %>% unlist() at test-print.R:5:3
        7. │ ├─testthat::capture_output(graph %>% print())
        8. │ │ └─testthat::capture_output_lines(code, print, width = width)
        9. │ │   └─testthat:::eval_with_output(code, print = print, width = width)
       10. │ │     ├─withr::with_output_sink(path, withVisible(code))
       11. │ │     │ └─base::force(code)
       12. │ │     └─base::withVisible(code)
       13. │ └─graph %>% print()
       14. ├─base::unlist(.)
       15. ├─stringr::str_split(., pattern = "\n")
       16. │ └─stringr:::check_lengths(string, pattern)
       17. │   └─vctrs::vec_size_common(...)
       18. ├─base::print(.)
       19. └─DiagrammeR:::print.dgr_graph(.)
       20.   └─DiagrammeR::is_graph_dag(x)
       21.     └─DiagrammeR::to_igraph(graph)
       22.       └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       23.         └─igraph:::ensure_no_na(d, "edge data frame")
       24.           └─cli::cli_abort(...)
       25.             └─rlang::abort(...)
      ── Error ('test-print.R:344:3'): Describing if a graph is a connected or not works ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─testthat::expect_match(...) at test-print.R:344:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─graph_connected %>% get_printed_output(2)
        5. ├─DiagrammeR (local) get_printed_output(., 2)
        6. │ ├─... %>% unlist() at test-print.R:5:3
        7. │ ├─testthat::capture_output(graph %>% print())
        8. │ │ └─testthat::capture_output_lines(code, print, width = width)
        9. │ │   └─testthat:::eval_with_output(code, print = print, width = width)
       10. │ │     ├─withr::with_output_sink(path, withVisible(code))
       11. │ │     │ └─base::force(code)
       12. │ │     └─base::withVisible(code)
       13. │ └─graph %>% print()
       14. ├─base::unlist(.)
       15. ├─stringr::str_split(., pattern = "\n")
       16. │ └─stringr:::check_lengths(string, pattern)
       17. │   └─vctrs::vec_size_common(...)
       18. ├─base::print(.)
       19. └─DiagrammeR:::print.dgr_graph(.)
       20.   └─DiagrammeR::is_graph_dag(x)
       21.     └─DiagrammeR::to_igraph(graph)
       22.       └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       23.         └─igraph:::ensure_no_na(d, "edge data frame")
       24.           └─cli::cli_abort(...)
       25.             └─rlang::abort(...)
      ── Error ('test-print.R:397:3'): The number of reported edges is correct ───────
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─testthat::expect_match(...) at test-print.R:397:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─graph_1_edge %>% get_printed_output(1)
        5. ├─DiagrammeR (local) get_printed_output(., 1)
        6. │ ├─... %>% unlist() at test-print.R:5:3
        7. │ ├─testthat::capture_output(graph %>% print())
        8. │ │ └─testthat::capture_output_lines(code, print, width = width)
        9. │ │   └─testthat:::eval_with_output(code, print = print, width = width)
       10. │ │     ├─withr::with_output_sink(path, withVisible(code))
       11. │ │     │ └─base::force(code)
       12. │ │     └─base::withVisible(code)
       13. │ └─graph %>% print()
       14. ├─base::unlist(.)
       15. ├─stringr::str_split(., pattern = "\n")
       16. │ └─stringr:::check_lengths(string, pattern)
       17. │   └─vctrs::vec_size_common(...)
       18. ├─base::print(.)
       19. └─DiagrammeR:::print.dgr_graph(.)
       20.   └─DiagrammeR::is_graph_dag(x)
       21.     └─DiagrammeR::to_igraph(graph)
       22.       └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       23.         └─igraph:::ensure_no_na(d, "edge data frame")
       24.           └─cli::cli_abort(...)
       25.             └─rlang::abort(...)
      ── Error ('test-print.R:432:3'): Printing a summary line for node/edge selections works ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─testthat::expect_equal(...) at test-print.R:432:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─... %>% stringr::str_trim()
        5. ├─stringr::str_trim(.)
        6. │ └─stringi::stri_trim_both(string)
        7. ├─base::substr(., 1, 45)
        8. ├─DiagrammeR (local) get_printed_output(., 8)
        9. │ ├─... %>% unlist() at test-print.R:5:3
       10. │ ├─testthat::capture_output(graph %>% print())
       11. │ │ └─testthat::capture_output_lines(code, print, width = width)
       12. │ │   └─testthat:::eval_with_output(code, print = print, width = width)
       13. │ │     ├─withr::with_output_sink(path, withVisible(code))
       14. │ │     │ └─base::force(code)
       15. │ │     └─base::withVisible(code)
       16. │ └─graph %>% print()
       17. ├─base::unlist(.)
       18. ├─stringr::str_split(., pattern = "\n")
       19. │ └─stringr:::check_lengths(string, pattern)
       20. │   └─vctrs::vec_size_common(...)
       21. ├─base::print(.)
       22. └─DiagrammeR:::print.dgr_graph(.)
       23.   └─DiagrammeR::is_graph_dag(x)
       24.     └─DiagrammeR::to_igraph(graph)
       25.       └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       26.         └─igraph:::ensure_no_na(d, "edge data frame")
       27.           └─cli::cli_abort(...)
       28.             └─rlang::abort(...)
      ── Error ('test-print.R:476:3'): Printing a summary line for graph caches works ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─testthat::expect_equal(...) at test-print.R:476:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─... %>% stringr::str_trim()
        5. ├─stringr::str_trim(.)
        6. │ └─stringi::stri_trim_both(string)
        7. ├─base::substr(., 1, 45)
        8. ├─DiagrammeR (local) get_printed_output(., 9)
        9. │ ├─... %>% unlist() at test-print.R:5:3
       10. │ ├─testthat::capture_output(graph %>% print())
       11. │ │ └─testthat::capture_output_lines(code, print, width = width)
       12. │ │   └─testthat:::eval_with_output(code, print = print, width = width)
       13. │ │     ├─withr::with_output_sink(path, withVisible(code))
       14. │ │     │ └─base::force(code)
       15. │ │     └─base::withVisible(code)
       16. │ └─graph %>% print()
       17. ├─base::unlist(.)
       18. ├─stringr::str_split(., pattern = "\n")
       19. │ └─stringr:::check_lengths(string, pattern)
       20. │   └─vctrs::vec_size_common(...)
       21. ├─base::print(.)
       22. └─DiagrammeR:::print.dgr_graph(.)
       23.   └─DiagrammeR::is_graph_dag(x)
       24.     └─DiagrammeR::to_igraph(graph)
       25.       └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       26.         └─igraph:::ensure_no_na(d, "edge data frame")
       27.           └─cli::cli_abort(...)
       28.             └─rlang::abort(...)
      ── Error ('test-print.R:551:3'): Printing a summary line for graph actions works ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─testthat::expect_equal(...) at test-print.R:551:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─... %>% stringr::str_trim()
        5. ├─stringr::str_trim(.)
        6. │ └─stringi::stri_trim_both(string)
        7. ├─base::substr(., 1, 30)
        8. ├─DiagrammeR (local) get_printed_output(., 11)
        9. │ ├─... %>% unlist() at test-print.R:5:3
       10. │ ├─testthat::capture_output(graph %>% print())
       11. │ │ └─testthat::capture_output_lines(code, print, width = width)
       12. │ │   └─testthat:::eval_with_output(code, print = print, width = width)
       13. │ │     ├─withr::with_output_sink(path, withVisible(code))
       14. │ │     │ └─base::force(code)
       15. │ │     └─base::withVisible(code)
       16. │ └─graph %>% print()
       17. ├─base::unlist(.)
       18. ├─stringr::str_split(., pattern = "\n")
       19. │ └─stringr:::check_lengths(string, pattern)
       20. │   └─vctrs::vec_size_common(...)
       21. ├─base::print(.)
       22. └─DiagrammeR:::print.dgr_graph(.)
       23.   └─DiagrammeR::is_graph_dag(x)
       24.     └─DiagrammeR::to_igraph(graph)
       25.       └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       26.         └─igraph:::ensure_no_na(d, "edge data frame")
       27.           └─cli::cli_abort(...)
       28.             └─rlang::abort(...)
      ── Error ('test-similarity_measures.R:13:3'): the dice similarity algorithm is functional ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─DiagrammeR::get_dice_similarity(graph = graph, nodes = 5:7, direction = "all") at test-similarity_measures.R:13:3
       2.   └─DiagrammeR::to_igraph(graph)
       3.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       4.       └─igraph:::ensure_no_na(d, "edge data frame")
       5.         └─cli::cli_abort(...)
       6.           └─rlang::abort(...)
      ── Error ('test-transform_graph.R:15:3'): Converting to igraph is possible ─────
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─DiagrammeR::to_igraph(graph) at test-transform_graph.R:15:3
       2.   └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       3.     └─igraph:::ensure_no_na(d, "edge data frame")
       4.       └─cli::cli_abort(...)
       5.         └─rlang::abort(...)
      ── Error ('test-transform_graph.R:156:3'): Creating a complement graph is possible ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─DiagrammeR::transform_to_complement_graph(graph) at test-transform_graph.R:156:3
       2.   └─DiagrammeR::to_igraph(graph)
       3.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       4.       └─igraph:::ensure_no_na(d, "edge data frame")
       5.         └─cli::cli_abort(...)
       6.           └─rlang::abort(...)
      ── Error ('test-write_graph_backup.R:486:3'): Graph backups for `transform_to_complement_graph()` works ──
      Error in `igraph::graph_from_data_frame(d = edf, directed = graph$directed, 
          vertices = ndf)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─... %>% transform_to_complement_graph() at test-write_graph_backup.R:486:3
       2. └─DiagrammeR::transform_to_complement_graph(.)
       3.   └─DiagrammeR::to_igraph(graph)
       4.     └─igraph::graph_from_data_frame(d = edf, directed = graph$directed, vertices = ndf)
       5.       └─igraph:::ensure_no_na(d, "edge data frame")
       6.         └─cli::cli_abort(...)
       7.           └─rlang::abort(...)
      
      [ FAIL 66 | WARN 0 | SKIP 22 | PASS 1314 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.0Mb
      sub-directories of 1Mb or more:
        R             1.5Mb
        help          1.5Mb
        htmlwidgets   2.8Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# dosearch

<details>

* Version: 1.0.11
* GitHub: https://github.com/santikka/dosearch
* Source code: https://github.com/cran/dosearch
* Date/Publication: 2024-07-16 09:50:02 UTC
* Number of recursive dependencies: 90

Run `revdepcheck::cloud_details(, "dosearch")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > #' @srrstats {G5.2} Error and warning behavior is tested.
      > #' @srrstats {G5.2a} Messages are unique.
      > #' @srrstats {G5.2b} Conditions are demonstrated.
      > #' @srrstats {G5.4, G5.4a, G5.6} Output of dosearch is compared against known
      > #'   theoretical identifiability and non-identifiability results.
      > #'   In other words, correctness can be tested independently of the
      > #'   implementation.
      > #' @srrstats {G5.5} The algorithm is deterministic, so this could also be NA
      > #' @srrstats {G5.6a} Because the package output is symbolic, the recovery
      > #'   of e.g., a causal effect is exact.
      > #' @srrstats {G5.7} Performance and scalability have been demonstrated
      > #'   in the JSS paper, and the simulations are too large to run on a single
      > #'   PC and require a cluster. The replication materials for this simulation
      > #'   are included in the 'rep' directory. The algorithm has exponential
      > #'   time and memory complexity in the number of the vertices of the graph,
      > #'   and it has been hypothesized that the general identifiability problem
      > #'   itself is NP-hard.
      > #' @srrstats {G5.8, G5.8a G5.8b, G5.8c, G5.8d} Edge conditions are tested.
      > #' @srrstats {NW6.0} Inputs types are tested.
      > #' @noRd
      > library(testthat)
      > library(dosearch)
      > 
      > test_check("dosearch")
      [ FAIL 1 | WARN 3 | SKIP 0 | PASS 294 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-interface.R:32:3'): igraph graph without names gets named ──────
      Error in `FUN(X[[i]], ...)`: Error: Logical index length does not match the number of edges. Recycling is not allowed.
      Backtrace:
           ▆
        1. ├─testthat::expect_message(parse_graph(g_igraph), "Argument `graph` is not named, node names have been assigned") at test-interface.R:32:3
        2. │ └─testthat:::expect_condition_matching(...)
        3. │   └─testthat:::quasi_capture(...)
        4. │     ├─testthat (local) .capture(...)
        5. │     │ └─base::withCallingHandlers(...)
        6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        7. └─dosearch:::parse_graph(g_igraph)
        8.   ├─e[(is.na(description) | description != "U")]
        9.   └─igraph:::`[.igraph.es`(...)
       10.     └─base::lapply(...)
       11.       └─igraph (local) FUN(X[[i]], ...)
       12.         └─cli::cli_abort("Error: Logical index length does not match the number of edges. Recycling is not allowed.")
       13.           └─rlang::abort(...)
      
      [ FAIL 1 | WARN 3 | SKIP 0 | PASS 294 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.9Mb
      sub-directories of 1Mb or more:
        libs   5.0Mb
    ```

# DrDimont

<details>

* Version: 0.1.4
* GitHub: NA
* Source code: https://github.com/cran/DrDimont
* Date/Publication: 2022-09-23 15:40:02 UTC
* Number of recursive dependencies: 124

Run `revdepcheck::cloud_details(, "DrDimont")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘DrDimont-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: generate_individual_graphs
    > ### Title: Builds graphs from specified network layers
    > ### Aliases: generate_individual_graphs
    > 
    > ### ** Examples
    > 
    > ## Don't show: 
    > WGCNA::disableWGCNAThreads()
    > ## End(Don't show)
    > 
    > data(layers_example)
    > data(correlation_matrices_example)
    > 
    > example_settings <- drdimont_settings(
    +                         handling_missing_data=list(
    +                             default="pairwise.complete.obs",
    +                             mrna="all.obs"),
    +                         reduction_method="pickHardThreshold",
    +                         r_squared=list(default=0.65, metabolite=0.1),
    +                         cut_vector=list(default=seq(0.2, 0.5, 0.01)))
    [25-06-28 07:57:13] WARNING: Python executable in virtual environment 'r-DrDimont' not found. Either run `install_python_dependencies(package_manager='pip') or set `conda=TRUE` in `drdimont_settings()` if conda installation was used.
    > 
    > example_individual_graphs <- generate_individual_graphs(
    +                                  correlation_matrices=correlation_matrices_example,
    +                                  layers=layers_example, 
    +                                  settings=example_settings)
    [25-06-28 07:57:13] Generating graph of layer mrna for groupA...
    [25-06-28 07:57:13] Reducing network by WGCNA::pickHardThreshold...
    [25-06-28 07:57:13] R2 cutoff: 0.65
    [25-06-28 07:57:14] Cut Threshold: 0.26
    Error in `graph_from_adjacency_matrix()`:
    ! Cannot create a graph object because the adjacency matrix contains
      NAs.
    Backtrace:
        ▆
     1. └─DrDimont::generate_individual_graphs(...)
     2.   └─DrDimont::generate_reduced_graph(...)
     3.     └─igraph::graph.adjacency(...)
     4.       └─igraph::graph_from_adjacency_matrix(...)
     5.         └─igraph:::ensure_no_na(adjmatrix, "adjacency matrix")
     6.           └─cli::cli_abort(...)
     7.             └─rlang::abort(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘DrDimont_Vignette.Rmd’ using rmarkdown
    
    Quitting from DrDimont_Vignette.Rmd:327-333 [Individual graphs]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    NULL
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Error: processing vignette 'DrDimont_Vignette.Rmd' failed with diagnostics:
    Cannot create a graph object because the adjacency matrix contains NAs.
    --- failed re-building ‘DrDimont_Vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘DrDimont_Vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) generate_individual_graphs.Rd:11: Lost braces
        11 | code{\link[DrDimont]{compute_correlation_matrices}}}
           |     ^
    ```

# dynwrap

<details>

* Version: 1.2.4
* GitHub: https://github.com/dynverse/dynwrap
* Source code: https://github.com/cran/dynwrap
* Date/Publication: 2023-07-19 09:20:02 UTC
* Number of recursive dependencies: 92

Run `revdepcheck::cloud_details(, "dynwrap")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dynwrap-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_cell_graph
    > ### Title: Constructs a trajectory using a graph between cells, by mapping
    > ###   cells onto a set of backbone cells.
    > ### Aliases: add_cell_graph
    > ### Keywords: create_trajectory
    > 
    > ### ** Examples
    > 
    > library(dplyr)
    
    Attaching package: ‘dplyr’
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > dataset <- wrap_data(cell_ids = letters)
    > 
    > backbone_cell_graph <- tibble::tibble(
    +   from = letters[1:10],
    +   to = letters[2:11],
    +   length = 1,
    +   directed = TRUE
    + )
    > leaves_cell_graph <- tibble::tibble(
    +   from = letters[12:26],
    +   to = sample(letters[1:11], 15, replace = TRUE),
    +   length = 1,
    +   directed = TRUE
    + )
    > cell_graph <- bind_rows(backbone_cell_graph, leaves_cell_graph)
    > cell_graph
    # A tibble: 25 × 4
       from  to    length directed
       <chr> <chr>  <dbl> <lgl>   
     1 a     b          1 TRUE    
     2 b     c          1 TRUE    
     3 c     d          1 TRUE    
     4 d     e          1 TRUE    
     5 e     f          1 TRUE    
     6 f     g          1 TRUE    
     7 g     h          1 TRUE    
     8 h     i          1 TRUE    
     9 i     j          1 TRUE    
    10 j     k          1 TRUE    
    # ℹ 15 more rows
    > to_keep <- letters[1:11]
    > to_keep
     [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k"
    > 
    > trajectory <- add_cell_graph(dataset, cell_graph, to_keep)
    Error in `igraph::graph_from_data_frame()`:
    ! Cannot create a graph object because the edge data frame contains NAs.
    Backtrace:
         ▆
      1. ├─dynwrap::add_cell_graph(dataset, cell_graph, to_keep)
      2. │ ├─... %>% simplify_trajectory()
      3. │ └─dynwrap::add_trajectory(...)
      4. │   └─dynwrap:::changed_topology(dataset)
      5. │     └─dynwrap::classify_milestone_network(trajectory$milestone_network)
      6. │       └─... %>% simplify_igraph_network()
      7. ├─dynwrap::simplify_trajectory(.)
      8. │ ├─igraph::graph_from_data_frame(...)
      9. │ │ └─base::as.data.frame(d)
     10. │ └─trajectory$milestone_network %>% rename(weight = length)
     11. ├─dplyr::rename(., weight = length)
     12. └─dynwrap::simplify_igraph_network(.)
     13.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
     14.     └─igraph:::ensure_no_na(d, "edge data frame")
     15.       └─cli::cli_abort(...)
     16.         └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(dynwrap)
      > 
      > test_check("dynwrap")
      [ FAIL 54 | WARN 18 | SKIP 2 | PASS 291 ]
      
      ══ Skipped tests (2) ═══════════════════════════════════════════════════════════
      • On CRAN (1): 'test-method_create_ti_method_container.R:5:1'
      • empty test (1): 'test-adapt_orient_topology.R:50:1'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-calculate_geodesic_distances.R:40:3'): Testing calculate_geodesic_distances ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wrap_data(id = "test", cell_ids = cell_ids) %>% ... at test-calculate_geodesic_distances.R:40:3
        2. ├─dynwrap::add_trajectory(...)
        3. │ └─dynwrap:::changed_topology(dataset)
        4. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        5. │     └─... %>% simplify_igraph_network()
        6. └─dynwrap::simplify_igraph_network(.)
        7.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
        8.     └─igraph:::ensure_no_na(d, "edge data frame")
        9.       └─cli::cli_abort(...)
       10.         └─rlang::abort(...)
      ── Error ('test-calculate_geodesic_distances.R:126:3'): Testing calculate_geodesic_distances with a gap in the middle ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wrap_data(id = "test", cell_ids = cell_ids) %>% ... at test-calculate_geodesic_distances.R:126:3
        2. ├─dynwrap::add_trajectory(...)
        3. │ └─dynwrap:::changed_topology(dataset)
        4. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        5. │     └─... %>% simplify_igraph_network()
        6. └─dynwrap::simplify_igraph_network(.)
        7.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
        8.     └─igraph:::ensure_no_na(d, "edge data frame")
        9.       └─cli::cli_abort(...)
       10.         └─rlang::abort(...)
      ── Error ('test-calculate_geodesic_distances.R:174:3'): Testing calculate_geodesic_distances with filtered cells ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wrap_data(id = "test", cell_ids = cell_ids) %>% ... at test-calculate_geodesic_distances.R:174:3
        2. ├─dynwrap::add_trajectory(...)
        3. │ └─dynwrap:::changed_topology(dataset)
        4. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        5. │     └─... %>% simplify_igraph_network()
        6. └─dynwrap::simplify_igraph_network(.)
        7.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
        8.     └─igraph:::ensure_no_na(d, "edge data frame")
        9.       └─cli::cli_abort(...)
       10.         └─rlang::abort(...)
      ── Error ('test-calculate_geodesic_distances.R:230:3'): Testing calculate_geodesic_distances while taking into account directedness ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wrap_data(cell_ids = progressions$cell_id) %>% ... at test-calculate_geodesic_distances.R:230:3
        2. ├─dynwrap::add_trajectory(...)
        3. │ └─dynwrap:::changed_topology(dataset)
        4. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        5. │     └─... %>% simplify_igraph_network()
        6. └─dynwrap::simplify_igraph_network(.)
        7.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
        8.     └─igraph:::ensure_no_na(d, "edge data frame")
        9.       └─cli::cli_abort(...)
       10.         └─rlang::abort(...)
      ── Error ('test-calculate_geodesic_distances.R:292:3'): Testing calculate_geodesic_distances with a disconnected graph and while taking into account directedness ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wrap_data(cell_ids = progressions$cell_id) %>% ... at test-calculate_geodesic_distances.R:292:3
        2. ├─dynwrap::add_trajectory(...)
        3. │ └─dynwrap:::changed_topology(dataset)
        4. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        5. │     └─... %>% simplify_igraph_network()
        6. └─dynwrap::simplify_igraph_network(.)
        7.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
        8.     └─igraph:::ensure_no_na(d, "edge data frame")
        9.       └─cli::cli_abort(...)
       10.         └─rlang::abort(...)
      ── Error ('test-calculate_trajectory_dimred.R:40:1'): (code run outside of `test_that()`) ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wrap_data(id = id, cell_ids = cell_ids) %>% ... at test-calculate_trajectory_dimred.R:40:1
        2. ├─dynwrap::add_trajectory(...)
        3. │ └─dynwrap:::changed_topology(dataset)
        4. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        5. │     └─... %>% simplify_igraph_network()
        6. └─dynwrap::simplify_igraph_network(.)
        7.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
        8.     └─igraph:::ensure_no_na(d, "edge data frame")
        9.       └─cli::cli_abort(...)
       10.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether intermediate is detected as linear ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether shuffled is detected as linear ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether long is detected as linear ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether intermediate is detected as linear ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether shuffled is detected as linear ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether long is detected as linear ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether simple is detected as cycle ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether shuffled is detected as cycle ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether long is detected as cycle ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether simple is detected as cycle ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether shuffled is detected as cycle ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether long is detected as cycle ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether intermediate is detected as bifurcation ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether long is detected as bifurcation ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether intermediate is detected as bifurcation ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether long is detected as bifurcation ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether intermediate is detected as convergence ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether intermediate is detected as multifurcation ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether long is detected as multifurcation ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether intermediate is detected as multifurcation ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether long is detected as multifurcation ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether bifur_conv_from_start is detected as acyclic_graph ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether bifur_conv is detected as acyclic_graph ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:153:7'): test whether simple is detected as graph ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─dynwrap::classify_milestone_network(milestone_network) at test-classify_milestone_network.R:153:7
       2. │ └─... %>% simplify_igraph_network()
       3. └─dynwrap::simplify_igraph_network(.)
       4.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       5.     └─igraph:::ensure_no_na(d, "edge data frame")
       6.       └─cli::cli_abort(...)
       7.         └─rlang::abort(...)
      ── Error ('test-classify_milestone_network.R:164:3'): Example trajectories match ──
      <purrr_error_indexed/rlang_error/error/condition>
      Error in `map(., classify_milestone_network)`: ℹ In index: 1.
      Caused by error in `igraph::graph_from_data_frame()`:
      ! Cannot create a graph object because the edge data frame contains NAs.
      ── Error ('test-simplify_trajectory.R:34:3'): Simple test ──────────────────────
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wrap_data(id = id, cell_ids = cell_ids) %>% ... at test-simplify_trajectory.R:34:3
        2. ├─dynwrap::add_trajectory(...)
        3. │ └─dynwrap:::changed_topology(dataset)
        4. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        5. │     └─... %>% simplify_igraph_network()
        6. └─dynwrap::simplify_igraph_network(.)
        7.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
        8.     └─igraph:::ensure_no_na(d, "edge data frame")
        9.       └─cli::cli_abort(...)
       10.         └─rlang::abort(...)
      ── Error ('test-simplify_trajectory.R:74:3'): Test whether simplify is able to correctly simplify an undirected ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wrap_data(id = id, cell_ids = cell_ids) %>% ... at test-simplify_trajectory.R:74:3
        2. ├─dynwrap::add_trajectory(...)
        3. │ └─dynwrap:::changed_topology(dataset)
        4. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        5. │     └─... %>% simplify_igraph_network()
        6. └─dynwrap::simplify_igraph_network(.)
        7.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
        8.     └─igraph:::ensure_no_na(d, "edge data frame")
        9.       └─cli::cli_abort(...)
       10.         └─rlang::abort(...)
      ── Error ('test-simplify_trajectory.R:116:3'): Test whether simplify is able to correctly simplify an undirected cycle ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wrap_data(id = id, cell_ids = cell_ids) %>% ... at test-simplify_trajectory.R:116:3
        2. ├─dynwrap::add_trajectory(...)
        3. │ └─dynwrap:::changed_topology(dataset)
        4. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        5. │     └─... %>% simplify_igraph_network()
        6. └─dynwrap::simplify_igraph_network(.)
        7.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
        8.     └─igraph:::ensure_no_na(d, "edge data frame")
        9.       └─cli::cli_abort(...)
       10.         └─rlang::abort(...)
      ── Error ('test-simplify_trajectory.R:193:3'): Test whether simplify is able to correctly simplify a graph with a dimred ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─... %>% ... at test-simplify_trajectory.R:193:3
        2. ├─dynwrap::add_dimred(...)
        3. │ ├─assertthat::assert_that(is_data_wrapper(dataset))
        4. │ │ └─assertthat::see_if(..., env = env, msg = msg)
        5. │ │   ├─base::tryCatch(...)
        6. │ │   │ └─base (local) tryCatchList(expr, classes, parentenv, handlers)
        7. │ │   │   └─base (local) tryCatchOne(expr, names, parentenv, handlers[[1L]])
        8. │ │   │     └─base (local) doTryCatch(return(expr), name, parentenv, handler)
        9. │ │   └─base::eval(assertion, env)
       10. │ │     └─base::eval(assertion, env)
       11. │ └─dynwrap::is_data_wrapper(dataset)
       12. │   └─"dynwrap::data_wrapper" %in% class(dataset)
       13. ├─dynwrap::add_trajectory(...)
       14. │ └─dynwrap:::changed_topology(dataset)
       15. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
       16. │     └─... %>% simplify_igraph_network()
       17. └─dynwrap::simplify_igraph_network(.)
       18.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       19.     └─igraph:::ensure_no_na(d, "edge data frame")
       20.       └─cli::cli_abort(...)
       21.         └─rlang::abort(...)
      ── Error ('test-wrap_add_branch_trajectory.R:30:3'): Testing add_trajectory with milestone_percentages ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wr_orig %>% ... at test-wrap_add_branch_trajectory.R:30:3
        2. ├─dynwrap::add_branch_trajectory(...)
        3. │ └─dataset %>% ...
        4. ├─dynwrap::add_trajectory(...)
        5. │ └─dynwrap:::changed_topology(dataset)
        6. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        7. │     └─... %>% simplify_igraph_network()
        8. └─dynwrap::simplify_igraph_network(.)
        9.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       10.     └─igraph:::ensure_no_na(d, "edge data frame")
       11.       └─cli::cli_abort(...)
       12.         └─rlang::abort(...)
      ── Error ('test-wrap_add_branch_trajectory.R:82:3'): Testing add_trajectory with milestone_percentages ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wr_orig %>% ... at test-wrap_add_branch_trajectory.R:82:3
        2. ├─dynwrap::add_branch_trajectory(...)
        3. │ └─dataset %>% ...
        4. ├─dynwrap::add_trajectory(...)
        5. │ └─dynwrap:::changed_topology(dataset)
        6. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        7. │     └─... %>% simplify_igraph_network()
        8. └─dynwrap::simplify_igraph_network(.)
        9.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       10.     └─igraph:::ensure_no_na(d, "edge data frame")
       11.       └─cli::cli_abort(...)
       12.         └─rlang::abort(...)
      ── Error ('test-wrap_add_cell_graph.R:33:3'): Testing add_cell_graph ───────────
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wr_orig %>% ... at test-wrap_add_cell_graph.R:33:3
        2. ├─dynwrap::add_cell_graph(...)
        3. │ ├─... %>% simplify_trajectory()
        4. │ └─dynwrap::add_trajectory(...)
        5. │   └─dynwrap:::changed_topology(dataset)
        6. │     └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        7. │       └─... %>% simplify_igraph_network()
        8. ├─dynwrap::simplify_trajectory(.)
        9. │ ├─igraph::graph_from_data_frame(...)
       10. │ │ └─base::as.data.frame(d)
       11. │ └─trajectory$milestone_network %>% rename(weight = length)
       12. ├─dplyr::rename(., weight = length)
       13. └─dynwrap::simplify_igraph_network(.)
       14.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       15.     └─igraph:::ensure_no_na(d, "edge data frame")
       16.       └─cli::cli_abort(...)
       17.         └─rlang::abort(...)
      ── Error ('test-wrap_add_cell_waypoints.R:69:3'): Testing add_cell_waypoints ───
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wrap_data(id = "test", cell_ids = cell_ids) %>% ... at test-wrap_add_cell_waypoints.R:69:3
        2. ├─dynwrap::add_trajectory(...)
        3. │ └─dynwrap:::changed_topology(dataset)
        4. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        5. │     └─... %>% simplify_igraph_network()
        6. └─dynwrap::simplify_igraph_network(.)
        7.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
        8.     └─igraph:::ensure_no_na(d, "edge data frame")
        9.       └─cli::cli_abort(...)
       10.         └─rlang::abort(...)
      ── Error ('test-wrap_add_cyclic_trajectory.R:15:3'): Testing add_cyclic_trajectory ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wr_orig %>% ... at test-wrap_add_cyclic_trajectory.R:15:3
        2. ├─dynwrap::add_cyclic_trajectory(...)
        3. │ └─dynwrap::add_trajectory(...)
        4. │   └─dynwrap:::changed_topology(dataset)
        5. │     └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        6. │       └─... %>% simplify_igraph_network()
        7. └─dynwrap::simplify_igraph_network(.)
        8.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
        9.     └─igraph:::ensure_no_na(d, "edge data frame")
       10.       └─cli::cli_abort(...)
       11.         └─rlang::abort(...)
      ── Error ('test-wrap_add_cyclic_trajectory.R:42:3'): Testing add_cyclic_trajectory ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wr_orig %>% ... at test-wrap_add_cyclic_trajectory.R:42:3
        2. ├─dynwrap::add_cyclic_trajectory(...)
        3. │ └─dynwrap::add_trajectory(...)
        4. │   └─dynwrap:::changed_topology(dataset)
        5. │     └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        6. │       └─... %>% simplify_igraph_network()
        7. └─dynwrap::simplify_igraph_network(.)
        8.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
        9.     └─igraph:::ensure_no_na(d, "edge data frame")
       10.       └─cli::cli_abort(...)
       11.         └─rlang::abort(...)
      ── Error ('test-wrap_add_cyclic_trajectory.R:56:3'): Testing add_cyclic_trajectory ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wr_orig %>% ... at test-wrap_add_cyclic_trajectory.R:56:3
        2. ├─dynwrap::add_cyclic_trajectory(...)
        3. │ └─dynwrap::add_trajectory(...)
        4. │   └─dynwrap:::changed_topology(dataset)
        5. │     └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        6. │       └─... %>% simplify_igraph_network()
        7. └─dynwrap::simplify_igraph_network(.)
        8.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
        9.     └─igraph:::ensure_no_na(d, "edge data frame")
       10.       └─cli::cli_abort(...)
       11.         └─rlang::abort(...)
      ── Error ('test-wrap_add_dimred.R:69:1'): (code run outside of `test_that()`) ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wr_orig %>% ... at test-wrap_add_dimred.R:69:1
        2. ├─dynwrap::add_trajectory(...)
        3. │ └─dynwrap:::changed_topology(dataset)
        4. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        5. │     └─... %>% simplify_igraph_network()
        6. └─dynwrap::simplify_igraph_network(.)
        7.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
        8.     └─igraph:::ensure_no_na(d, "edge data frame")
        9.       └─cli::cli_abort(...)
       10.         └─rlang::abort(...)
      ── Error ('test-wrap_add_dimred_projection.R:49:3'): Testing add_dimred_projection ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wr_orig %>% ... at test-wrap_add_dimred_projection.R:49:3
        2. ├─dynwrap::add_dimred_projection(...)
        3. │ ├─... %>% ...
        4. │ └─dynwrap::add_trajectory(...)
        5. │   └─dynwrap:::changed_topology(dataset)
        6. │     └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        7. │       └─... %>% simplify_igraph_network()
        8. ├─dynwrap::add_dimred(...)
        9. │ ├─assertthat::assert_that(is_data_wrapper(dataset))
       10. │ │ └─assertthat::see_if(..., env = env, msg = msg)
       11. │ │   ├─base::tryCatch(...)
       12. │ │   │ └─base (local) tryCatchList(expr, classes, parentenv, handlers)
       13. │ │   │   └─base (local) tryCatchOne(expr, names, parentenv, handlers[[1L]])
       14. │ │   │     └─base (local) doTryCatch(return(expr), name, parentenv, handler)
       15. │ │   └─base::eval(assertion, env)
       16. │ │     └─base::eval(assertion, env)
       17. │ └─dynwrap::is_data_wrapper(dataset)
       18. │   └─"dynwrap::data_wrapper" %in% class(dataset)
       19. └─dynwrap::simplify_igraph_network(.)
       20.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       21.     └─igraph:::ensure_no_na(d, "edge data frame")
       22.       └─cli::cli_abort(...)
       23.         └─rlang::abort(...)
      ── Error ('test-wrap_add_dimred_projection.R:77:3'): Testing add_dimred_projection with grouping ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wr_orig %>% ... at test-wrap_add_dimred_projection.R:77:3
        2. ├─dynwrap::add_dimred_projection(...)
        3. │ ├─... %>% ...
        4. │ └─dynwrap::add_trajectory(...)
        5. │   └─dynwrap:::changed_topology(dataset)
        6. │     └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        7. │       └─... %>% simplify_igraph_network()
        8. ├─dynwrap::add_dimred(...)
        9. │ ├─assertthat::assert_that(is_data_wrapper(dataset))
       10. │ │ └─assertthat::see_if(..., env = env, msg = msg)
       11. │ │   ├─base::tryCatch(...)
       12. │ │   │ └─base (local) tryCatchList(expr, classes, parentenv, handlers)
       13. │ │   │   └─base (local) tryCatchOne(expr, names, parentenv, handlers[[1L]])
       14. │ │   │     └─base (local) doTryCatch(return(expr), name, parentenv, handler)
       15. │ │   └─base::eval(assertion, env)
       16. │ │     └─base::eval(assertion, env)
       17. │ └─dynwrap::is_data_wrapper(dataset)
       18. │   └─"dynwrap::data_wrapper" %in% class(dataset)
       19. └─dynwrap::simplify_igraph_network(.)
       20.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       21.     └─igraph:::ensure_no_na(d, "edge data frame")
       22.       └─cli::cli_abort(...)
       23.         └─rlang::abort(...)
      ── Error ('test-wrap_add_grouping.R:44:1'): (code run outside of `test_that()`) ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wrap_data(id, cell_ids) %>% ... at test-wrap_add_grouping.R:44:1
        2. ├─dynwrap::add_trajectory(...)
        3. │ └─dynwrap:::changed_topology(dataset)
        4. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        5. │     └─... %>% simplify_igraph_network()
        6. └─dynwrap::simplify_igraph_network(.)
        7.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
        8.     └─igraph:::ensure_no_na(d, "edge data frame")
        9.       └─cli::cli_abort(...)
       10.         └─rlang::abort(...)
      ── Error ('test-wrap_add_prior_information.R:64:3'): Testing generate_prior_information ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─dynwrap::generate_prior_information(...) at test-wrap_add_prior_information.R:64:3
        2. │ └─dynwrap (local) determine_closest_cells(start_milestones)
        3. │   └─... %>% ...
        4. ├─dynwrap::add_trajectory(...)
        5. │ └─dynwrap:::changed_topology(dataset)
        6. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        7. │     └─... %>% simplify_igraph_network()
        8. └─dynwrap::simplify_igraph_network(.)
        9.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       10.     └─igraph:::ensure_no_na(d, "edge data frame")
       11.       └─cli::cli_abort(...)
       12.         └─rlang::abort(...)
      ── Error ('test-wrap_add_prior_information.R:135:3'): Testing add_prior_information ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─... %>% ... at test-wrap_add_prior_information.R:135:3
        2. ├─dynwrap::add_expression(...)
        3. │ ├─assertthat::assert_that(is_data_wrapper(dataset))
        4. │ │ └─assertthat::see_if(..., env = env, msg = msg)
        5. │ │   ├─base::tryCatch(...)
        6. │ │   │ └─base (local) tryCatchList(expr, classes, parentenv, handlers)
        7. │ │   │   └─base (local) tryCatchOne(expr, names, parentenv, handlers[[1L]])
        8. │ │   │     └─base (local) doTryCatch(return(expr), name, parentenv, handler)
        9. │ │   └─base::eval(assertion, env)
       10. │ │     └─base::eval(assertion, env)
       11. │ └─dynwrap::is_data_wrapper(dataset)
       12. │   └─"dynwrap::data_wrapper" %in% class(dataset)
       13. ├─dynwrap::add_trajectory(...)
       14. │ └─dynwrap:::changed_topology(dataset)
       15. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
       16. │     └─... %>% simplify_igraph_network()
       17. └─dynwrap::simplify_igraph_network(.)
       18.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       19.     └─igraph:::ensure_no_na(d, "edge data frame")
       20.       └─cli::cli_abort(...)
       21.         └─rlang::abort(...)
      ── Error ('test-wrap_add_prior_information.R:265:3'): Testing generate_prior_information ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─dynwrap::generate_prior_information(...) at test-wrap_add_prior_information.R:265:3
        2. │ └─dynwrap (local) determine_closest_cells(start_milestones)
        3. │   └─... %>% ...
        4. ├─dynwrap::add_trajectory(...)
        5. │ └─dynwrap:::changed_topology(dataset)
        6. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        7. │     └─... %>% simplify_igraph_network()
        8. └─dynwrap::simplify_igraph_network(.)
        9.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       10.     └─igraph:::ensure_no_na(d, "edge data frame")
       11.       └─cli::cli_abort(...)
       12.         └─rlang::abort(...)
      ── Error ('test-wrap_add_prior_information.R:311:3'): Testing add_prior_information ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─... %>% ... at test-wrap_add_prior_information.R:311:3
        2. ├─dynwrap::add_expression(., expression = expression, counts = expression)
        3. │ ├─assertthat::assert_that(is_data_wrapper(dataset))
        4. │ │ └─assertthat::see_if(..., env = env, msg = msg)
        5. │ │   ├─base::tryCatch(...)
        6. │ │   │ └─base (local) tryCatchList(expr, classes, parentenv, handlers)
        7. │ │   │   └─base (local) tryCatchOne(expr, names, parentenv, handlers[[1L]])
        8. │ │   │     └─base (local) doTryCatch(return(expr), name, parentenv, handler)
        9. │ │   └─base::eval(assertion, env)
       10. │ │     └─base::eval(assertion, env)
       11. │ └─dynwrap::is_data_wrapper(dataset)
       12. │   └─"dynwrap::data_wrapper" %in% class(dataset)
       13. ├─dynwrap::add_trajectory(...)
       14. │ └─dynwrap:::changed_topology(dataset)
       15. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
       16. │     └─... %>% simplify_igraph_network()
       17. └─dynwrap::simplify_igraph_network(.)
       18.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
       19.     └─igraph:::ensure_no_na(d, "edge data frame")
       20.       └─cli::cli_abort(...)
       21.         └─rlang::abort(...)
      ── Error ('test-wrap_add_root_and_add_pseudotime.R:39:1'): (code run outside of `test_that()`) ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wrap_data(id = "test", cell_ids = cell_ids) %>% ... at test-wrap_add_root_and_add_pseudotime.R:39:1
        2. ├─dynwrap::add_trajectory(...)
        3. │ └─dynwrap:::changed_topology(dataset)
        4. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        5. │     └─... %>% simplify_igraph_network()
        6. └─dynwrap::simplify_igraph_network(.)
        7.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
        8.     └─igraph:::ensure_no_na(d, "edge data frame")
        9.       └─cli::cli_abort(...)
       10.         └─rlang::abort(...)
      ── Error ('test-wrap_add_trajectory.R:40:1'): (code run outside of `test_that()`) ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wrap_data(id = id, cell_ids = cell_ids) %>% ... at test-wrap_add_trajectory.R:40:1
        2. ├─dynwrap::add_trajectory(...)
        3. │ └─dynwrap:::changed_topology(dataset)
        4. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        5. │     └─... %>% simplify_igraph_network()
        6. └─dynwrap::simplify_igraph_network(.)
        7.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
        8.     └─igraph:::ensure_no_na(d, "edge data frame")
        9.       └─cli::cli_abort(...)
       10.         └─rlang::abort(...)
      ── Error ('test-wrap_add_waypoints.R:40:1'): (code run outside of `test_that()`) ──
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wrap_data("", cell_ids) %>% ... at test-wrap_add_waypoints.R:40:1
        2. ├─dynwrap::add_trajectory(...)
        3. │ └─dynwrap:::changed_topology(dataset)
        4. │   └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        5. │     └─... %>% simplify_igraph_network()
        6. └─dynwrap::simplify_igraph_network(.)
        7.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
        8.     └─igraph:::ensure_no_na(d, "edge data frame")
        9.       └─cli::cli_abort(...)
       10.         └─rlang::abort(...)
      ── Error ('test-wrap_cluster_graph.R:29:3'): Testing add_cluster_graph ─────────
      Error in `igraph::graph_from_data_frame(edge_df, is_directed, node_df)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─wr_orig %>% add_cluster_graph(milestone_network = milestone_network) at test-wrap_cluster_graph.R:29:3
        2. ├─dynwrap::add_cluster_graph(., milestone_network = milestone_network)
        3. │ └─dynwrap::add_trajectory(...)
        4. │   └─dynwrap:::changed_topology(dataset)
        5. │     └─dynwrap::classify_milestone_network(trajectory$milestone_network)
        6. │       └─... %>% simplify_igraph_network()
        7. └─dynwrap::simplify_igraph_network(.)
        8.   └─igraph::graph_from_data_frame(edge_df, is_directed, node_df)
        9.     └─igraph:::ensure_no_na(d, "edge data frame")
       10.       └─cli::cli_abort(...)
       11.         └─rlang::abort(...)
      
      [ FAIL 54 | WARN 18 | SKIP 2 | PASS 291 ]
      Error: Test failures
      Execution halted
    ```

# EGAnet

<details>

* Version: 2.3.0
* GitHub: https://github.com/hfgolino/EGAnet
* Source code: https://github.com/cran/EGAnet
* Date/Publication: 2025-04-09 23:10:15 UTC
* Number of recursive dependencies: 180

Run `revdepcheck::cloud_details(, "EGAnet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘EGAnet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: EGA
    > ### Title: Exploratory Graph Analysis
    > ### Aliases: EGA
    > 
    > ### ** Examples
    > 
    > # Obtain data
    > wmt <- wmt2[,7:24]
    > 
    > # Estimate EGA
    > ega.wmt <- EGA(
    +   data = wmt,
    +   plot.EGA = FALSE # No plot for CRAN checks
    + )
    Error in `set_vertex_attr()`:
    ! `name` must be a single string, not `FALSE`.
    Backtrace:
         ▆
      1. └─EGAnet::EGA(data = wmt, plot.EGA = FALSE)
      2.   └─EGAnet::EGA.estimate(...)
      3.     ├─base::do.call(...)
      4.     └─EGAnet (local) `<fn>`(...)
      5.       └─EGAnet::convert2igraph(network)
      6.         ├─EGAnet:::silent_call(...)
      7.         │ ├─utils::capture.output(result <- suppressWarnings(suppressMessages(...)))
      8.         │ │ └─base::withVisible(...elt(i))
      9.         │ ├─base::suppressWarnings(suppressMessages(...))
     10.         │ │ └─base::withCallingHandlers(...)
     11.         │ └─base::suppressMessages(...)
     12.         │   └─base::withCallingHandlers(...)
     13.         └─igraph::graph_from_adjacency_matrix(...)
     14.           └─igraph::set_vertex_attr(name = add.colnames)
     15.             └─igraph:::check_string(name)
     16.               └─igraph:::stop_input_type(...)
     17.                 └─rlang::abort(message, ..., call = call, arg = arg)
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.2Mb
      sub-directories of 1Mb or more:
        R      1.5Mb
        data   4.0Mb
    ```

# egor

<details>

* Version: 1.24.2
* GitHub: https://github.com/tilltnet/egor
* Source code: https://github.com/cran/egor
* Date/Publication: 2024-02-02 05:30:02 UTC
* Number of recursive dependencies: 88

Run `revdepcheck::cloud_details(, "egor")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘egor_allbus.Rmd’ using rmarkdown
    ```

# frscore

<details>

* Version: 0.5.1
* GitHub: NA
* Source code: https://github.com/cran/frscore
* Date/Publication: 2025-04-25 12:30:06 UTC
* Number of recursive dependencies: 107

Run `revdepcheck::cloud_details(, "frscore")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘frscore-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot_submodel_network
    > ### Title: Visualize submodel networks
    > ### Aliases: plot_submodel_network
    > 
    > ### ** Examples
    > 
    > r <- frscored_cna(d.error)
    0 / 16 reanalyses completed 
    1 / 16 reanalyses completed 
    2 / 16 reanalyses completed 
    3 / 16 reanalyses completed 
    4 / 16 reanalyses completed 
    5 / 16 reanalyses completed 
    6 / 16 reanalyses completed 
    7 / 16 reanalyses completed 
    8 / 16 reanalyses completed 
    9 / 16 reanalyses completed 
    10 / 16 reanalyses completed 
    11 / 16 reanalyses completed 
    12 / 16 reanalyses completed 
    13 / 16 reanalyses completed 
    14 / 16 reanalyses completed 
    15 / 16 reanalyses completed 
    16 / 16 reanalyses completed
    
    processing 12 unique model types,
    maxsols set to 50, excluding 0 model types from scoring
    
    0 / 132 submodel relations tested
    2 / 132 potential submodel relations tested
    4 / 132 potential submodel relations tested
    12 / 132 potential submodel relations tested
    24 / 132 potential submodel relations tested
    16 / 132 potential submodel relations tested 
    17 / 132 potential submodel relations tested 
    21 / 132 potential submodel relations tested 
    37 / 132 potential submodel relations tested 
    46 / 132 potential submodel relations tested 
    55 / 132 potential submodel relations tested 
    64 / 132 potential submodel relations tested 
    73 / 132 potential submodel relations tested 
    78 / 132 potential submodel relations tested 
    83 / 132 potential submodel relations tested 
    88 / 132 potential submodel relations tested 
    93 / 132 potential submodel relations tested 
    96 / 132 potential submodel relations tested 
    99 / 132 potential submodel relations tested 
    101 / 132 potential submodel relations tested 
    101 / 132 potential submodel relations tested 
    112 / 132 potential submodel relations tested 
    113 / 132 potential submodel relations tested 
    113 / 132 potential submodel relations tested 
    114 / 132 potential submodel relations tested 
    115 / 132 potential submodel relations tested 
    116 / 132 potential submodel relations tested 
    116 / 132 potential submodel relations tested 
    117 / 132 potential submodel relations tested 
    118 / 132 potential submodel relations tested 
    119 / 132 potential submodel relations tested 
    120 / 132 potential submodel relations tested 
    120 / 132 potential submodel relations tested 
    121 / 132 potential submodel relations tested 
    122 / 132 potential submodel relations tested 
    123 / 132 potential submodel relations tested 
    123 / 132 potential submodel relations tested 
    123 / 132 potential submodel relations tested 
    124 / 132 potential submodel relations tested 
    125 / 132 potential submodel relations tested 
    126 / 132 potential submodel relations tested 
    127 / 132 potential submodel relations tested 
    128 / 132 potential submodel relations tested 
    129 / 132 potential submodel relations tested 
    130 / 132 potential submodel relations tested 
    131 / 132 potential submodel relations tested 
    132 / 132 potential submodel relations tested 
    132 / 132 potential submodel relations tested 
    132 / 132 potential submodel relations tested 
    132 / 132 potential submodel relations tested 
    
    > v <- plot_submodel_network(r)
    Error in `igraph::graph_from_adjacency_matrix()`:
    ! Cannot create a graph object because the adjacency matrix contains
      NAs.
    Backtrace:
        ▆
     1. └─frscore::plot_submodel_network(r)
     2.   └─igraph::graph_from_adjacency_matrix(adj, mode = gmode)
     3.     └─igraph:::ensure_no_na(adjmatrix, "adjacency matrix")
     4.       └─cli::cli_abort(...)
     5.         └─rlang::abort(...)
    Execution halted
    ```

# icmstate

<details>

* Version: 0.1.1
* GitHub: NA
* Source code: https://github.com/cran/icmstate
* Date/Publication: 2024-11-08 23:20:09 UTC
* Number of recursive dependencies: 98

Run `revdepcheck::cloud_details(, "icmstate")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘icmstate-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: npmsm
    > ### Title: NPMLE for general multi-state model with interval censored
    > ###   transitions
    > ### Aliases: npmsm
    > 
    > ### ** Examples
    > 
    > #Create transition matrix using mstate functionality: illness-death
    > if(require(mstate)){
    +   tmat <- mstate::trans.illdeath()
    + }
    Loading required package: mstate
    Loading required package: survival
    > 
    > #Write a function for evaluation times: observe at 0 and uniform inter-observation times.
    > eval_times <- function(n_obs, stop_time){
    +   cumsum( c( 0,  runif( n_obs-1, 0, 2*(stop_time-4)/(n_obs-1) ) ) )
    + }
    > 
    > #Use built_in function to simulate illness-death data
    > #from Weibull distributions for each transition
    > sim_dat <- sim_id_weib(n = 50, n_obs = 6, stop_time = 15, eval_times = eval_times,
    + start_state = "stable", shape = c(0.5, 0.5, 2), scale = c(5, 10, 10/gamma(1.5)))
    > 
    > tmat <- mstate::trans.illdeath()
    > 
    > #Fit the model using method = "multinomial"
    > mod_fit <- npmsm(gd = sim_dat, tmat = tmat, tol = 1e-2)
    Error in `graph_from_adjacency_matrix()`:
    ! Cannot create a graph object because the adjacency matrix contains
      NAs.
    Backtrace:
        ▆
     1. └─icmstate::npmsm(gd = sim_dat, tmat = tmat, tol = 0.01)
     2.   └─igraph::graph_from_adjacency_matrix(adjacency_matrix)
     3.     └─igraph:::ensure_no_na(adjmatrix, "adjacency matrix")
     4.       └─cli::cli_abort(...)
     5.         └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(icmstate)
      > 
      > test_check("icmstate")
      [ FAIL 7 | WARN 0 | SKIP 7 | PASS 28 ]
      
      ══ Skipped tests (7) ═══════════════════════════════════════════════════════════
      • TRUE is TRUE (7): 'test-estimateSupportMSM.R:2:3', 'test-icmstate.R:2:3',
        'test-npmsm.R:174:3', 'test-profiling.R:2:3', 'test-sim_id_weib.R:2:3',
        'test-supportHeinEM.R:3:3', 'test-visualise_data.R:2:3'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-npmsm.R:47:3'): Turnbull vs MSM ────────────────────────────────
      Error in `graph_from_adjacency_matrix(adjacency_matrix)`: Cannot create a graph object because the adjacency matrix contains NAs.
      Backtrace:
          ▆
       1. └─icmstate::npmsm(gd = gd, tmat = tmat, tol = 1e-05) at test-npmsm.R:47:3
       2.   └─igraph::graph_from_adjacency_matrix(adjacency_matrix)
       3.     └─igraph:::ensure_no_na(adjmatrix, "adjacency matrix")
       4.       └─cli::cli_abort(...)
       5.         └─rlang::abort(...)
      ── Error ('test-npmsm.R:129:3'): Frydman (1995) vs MSM ─────────────────────────
      Error in `graph_from_adjacency_matrix(adjacency_matrix)`: Cannot create a graph object because the adjacency matrix contains NAs.
      Backtrace:
          ▆
       1. └─icmstate::npmsm(gd, tmat, maxit = 300, tol = 1e-10, exact = c(3)) at test-npmsm.R:129:3
       2.   └─igraph::graph_from_adjacency_matrix(adjacency_matrix)
       3.     └─igraph:::ensure_no_na(adjmatrix, "adjacency matrix")
       4.       └─cli::cli_abort(...)
       5.         └─rlang::abort(...)
      ── Error ('test-npmsm.R:156:3'): Multinomial vs Poisson ────────────────────────
      Error in `graph_from_adjacency_matrix(adjacency_matrix)`: Cannot create a graph object because the adjacency matrix contains NAs.
      Backtrace:
          ▆
       1. └─icmstate::npmsm(gd = sim_dat, tmat = tmat, tol = 0.01) at test-npmsm.R:156:3
       2.   └─igraph::graph_from_adjacency_matrix(adjacency_matrix)
       3.     └─igraph:::ensure_no_na(adjmatrix, "adjacency matrix")
       4.       └─cli::cli_abort(...)
       5.         └─rlang::abort(...)
      ── Error ('test-plot_probtrans.R:37:3'): plot_probtrans ────────────────────────
      Error in `graph_from_adjacency_matrix(adjacency_matrix)`: Cannot create a graph object because the adjacency matrix contains NAs.
      Backtrace:
          ▆
       1. └─icmstate::npmsm(gd, tmat, maxit = 300, tol = 1e-08) at test-plot_probtrans.R:37:3
       2.   └─igraph::graph_from_adjacency_matrix(adjacency_matrix)
       3.     └─igraph:::ensure_no_na(adjmatrix, "adjacency matrix")
       4.       └─cli::cli_abort(...)
       5.         └─rlang::abort(...)
      ── Error ('test-probtrans_D.R:26:3'): probtrans_D and probtrans yield same estimates ──
      Error in `graph_from_adjacency_matrix(adjacency_matrix)`: Cannot create a graph object because the adjacency matrix contains NAs.
      Backtrace:
          ▆
       1. └─icmstate::npmsm(gd = gd, tmat = tmat, tol = 0.001) at test-probtrans_D.R:26:3
       2.   └─igraph::graph_from_adjacency_matrix(adjacency_matrix)
       3.     └─igraph:::ensure_no_na(adjmatrix, "adjacency matrix")
       4.       └─cli::cli_abort(...)
       5.         └─rlang::abort(...)
      ── Error ('test-probtrans_D.R:108:3'): probtrans_C is consistent with probtrans_D ──
      Error in `graph_from_adjacency_matrix(adjacency_matrix)`: Cannot create a graph object because the adjacency matrix contains NAs.
      Backtrace:
          ▆
       1. └─icmstate::npmsm(gd = gd, tmat = tmat, tol = 0.001) at test-probtrans_D.R:108:3
       2.   └─igraph::graph_from_adjacency_matrix(adjacency_matrix)
       3.     └─igraph:::ensure_no_na(adjmatrix, "adjacency matrix")
       4.       └─cli::cli_abort(...)
       5.         └─rlang::abort(...)
      ── Error ('test-visualise_msm.R:37:3'): visualise_msm ──────────────────────────
      Error in `graph_from_adjacency_matrix(adjacency_matrix)`: Cannot create a graph object because the adjacency matrix contains NAs.
      Backtrace:
          ▆
       1. └─icmstate::npmsm(gd, tmat, maxit = 300, tol = 1e-08) at test-visualise_msm.R:37:3
       2.   └─igraph::graph_from_adjacency_matrix(adjacency_matrix)
       3.     └─igraph:::ensure_no_na(adjmatrix, "adjacency matrix")
       4.       └─cli::cli_abort(...)
       5.         └─rlang::abort(...)
      
      [ FAIL 7 | WARN 0 | SKIP 7 | PASS 28 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Overview.Rmd’ using rmarkdown
    
    Quitting from Overview.Rmd:286-290 [unnamed-chunk-7]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    NULL
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Error: processing vignette 'Overview.Rmd' failed with diagnostics:
    Cannot create a graph object because the adjacency matrix contains NAs.
    --- failed re-building ‘Overview.Rmd’
    
    --- re-building ‘comparison-with-known-results.Rmd’ using rmarkdown
    
    Quitting from comparison-with-known-results.Rmd:162-166 [fitmodels]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    NULL
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Error: processing vignette 'comparison-with-known-results.Rmd' failed with diagnostics:
    Cannot create a graph object because the adjacency matrix contains NAs.
    --- failed re-building ‘comparison-with-known-results.Rmd’
    
    --- re-building ‘sim_msm.Rmd’ using rmarkdown
    
    Quitting from sim_msm.Rmd:136-139 [gendatamanual]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    NULL
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Error: processing vignette 'sim_msm.Rmd' failed with diagnostics:
    Cannot create a graph object because the adjacency matrix contains NAs.
    --- failed re-building ‘sim_msm.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘Overview.Rmd’ ‘comparison-with-known-results.Rmd’ ‘sim_msm.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## Newly fixed

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Overview.Rmd’ using rmarkdown
    
    tlmgr: Remote database at https://ctan.math.illinois.edu/systems/texlive/tlnet
    (revision 75624 of the texlive-scripts package)
    seems to be older than the local installation
    (revision 75632 of texlive-scripts);
    please use a different mirror and/or wait a day or two.
    
    Warning in system2("tlmgr", args, ...) :
      running command ''tlmgr' search --file --global '/tikz.sty'' had status 1 and error message 'Function not implemented'
    ! LaTeX Error: File `tikz.sty' not found.
    
    ! Emergency stop.
    <read *> 
    
    Error: processing vignette 'Overview.Rmd' failed with diagnostics:
    LaTeX failed to compile /tmp/workdir/icmstate/old/icmstate.Rcheck/vign_test/icmstate/vignettes/Overview.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See Overview.log for more info.
    --- failed re-building ‘Overview.Rmd’
    
    --- re-building ‘comparison-with-known-results.Rmd’ using rmarkdown
    
    tlmgr: Remote database at https://latex.us/systems/texlive/tlnet
    (revision 75624 of the texlive-scripts package)
    seems to be older than the local installation
    (revision 75632 of texlive-scripts);
    please use a different mirror and/or wait a day or two.
    
    Warning in system2("tlmgr", args, ...) :
      running command ''tlmgr' search --file --global '/tikz.sty'' had status 1 and error message 'Function not implemented'
    ! LaTeX Error: File `tikz.sty' not found.
    
    ! Emergency stop.
    <read *> 
    
    Error: processing vignette 'comparison-with-known-results.Rmd' failed with diagnostics:
    LaTeX failed to compile /tmp/workdir/icmstate/old/icmstate.Rcheck/vign_test/icmstate/vignettes/comparison-with-known-results.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See comparison-with-known-results.log for more info.
    --- failed re-building ‘comparison-with-known-results.Rmd’
    
    --- re-building ‘sim_msm.Rmd’ using rmarkdown
    
    tlmgr: Remote database at https://mirror.las.iastate.edu/tex-archive/systems/texlive/tlnet
    (revision 75624 of the texlive-scripts package)
    seems to be older than the local installation
    (revision 75632 of texlive-scripts);
    please use a different mirror and/or wait a day or two.
    
    Warning in system2("tlmgr", args, ...) :
      running command ''tlmgr' search --file --global '/tikz.sty'' had status 1 and error message 'Function not implemented'
    ! LaTeX Error: File `tikz.sty' not found.
    
    ! Emergency stop.
    <read *> 
    
    Error: processing vignette 'sim_msm.Rmd' failed with diagnostics:
    LaTeX failed to compile /tmp/workdir/icmstate/old/icmstate.Rcheck/vign_test/icmstate/vignettes/sim_msm.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See sim_msm.log for more info.
    --- failed re-building ‘sim_msm.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘Overview.Rmd’ ‘comparison-with-known-results.Rmd’ ‘sim_msm.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# ideanet

<details>

* Version: 1.1.0
* GitHub: NA
* Source code: https://github.com/cran/ideanet
* Date/Publication: 2025-05-08 20:00:02 UTC
* Number of recursive dependencies: 206

Run `revdepcheck::cloud_details(, "ideanet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ideanet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: role_analysis
    > ### Title: Positional (Role) Analysis in Networks ('role_analysis')
    > ### Aliases: role_analysis
    > 
    > ### ** Examples
    > 
    > flor <- netwrite(nodelist = florentine_nodes,
    +                  node_id = "id",
    +                  i_elements = florentine_edges$source,
    +                  j_elements = florentine_edges$target,
    +                  type = florentine_edges$type,
    +                  directed = FALSE,
    +                  net_name = "florentine")
    Processing network for edge type marriage
    Warning in bonacich_igraph(g, directed = as.logical(directed), message = message) :
      (Bonacich power centrality) Isolates detected in network. Isolates will be removed from network when calculating power centrality measure, and will be assigned NA values in final output.
    Warning in bonacich_igraph(g, directed = as.logical(directed), bpct = -0.75,  :
      (Bonacich power centrality) Isolates detected in network. Isolates will be removed from network when calculating power centrality measure, and will be assigned NA values in final output.
    Warning in eigen_igraph(g, directed = as.logical(directed), message = message) :
      (Eigenvector centrality) Isolates detected in network. Isolates will be removed from network when calculating eigenvector centrality measure, and will be assigned NA values in final output.
    
    Warning in triad_census(graph = graph) :
      At vendor/cigraph/src/misc/motifs.c:1157 : Triad census called on an undirected graph. All connections will be treated as mutual.
    Warning in eigen_centralization(g, directed = FALSE) :
      Eigenvector centralization calculated only for largest weak component.
    Processing network for edge type business
    Warning in bonacich_igraph(g, directed = as.logical(directed), message = message) :
      (Bonacich power centrality) Isolates detected in network. Isolates will be removed from network when calculating power centrality measure, and will be assigned NA values in final output.
    Warning in bonacich_igraph(g, directed = as.logical(directed), bpct = -0.75,  :
      (Bonacich power centrality) Isolates detected in network. Isolates will be removed from network when calculating power centrality measure, and will be assigned NA values in final output.
    Warning in eigen_igraph(g, directed = as.logical(directed), message = message) :
      (Eigenvector centrality) Isolates detected in network. Isolates will be removed from network when calculating eigenvector centrality measure, and will be assigned NA values in final output.
    
    Warning in triad_census(graph = graph) :
      At vendor/cigraph/src/misc/motifs.c:1157 : Triad census called on an undirected graph. All connections will be treated as mutual.
    Warning in eigen_centralization(g, directed = FALSE) :
      Eigenvector centralization calculated only for largest weak component.
    Processing aggregate network of all edge types
    Warning in bonacich_igraph(g, directed = as.logical(directed), message = message) :
      (Bonacich power centrality) Isolates detected in network. Isolates will be removed from network when calculating power centrality measure, and will be assigned NA values in final output.
    Warning in bonacich_igraph(g, directed = as.logical(directed), bpct = -0.75,  :
      (Bonacich power centrality) Isolates detected in network. Isolates will be removed from network when calculating power centrality measure, and will be assigned NA values in final output.
    Warning in eigen_igraph(g, directed = as.logical(directed), message = message) :
      (Eigenvector centrality) Isolates detected in network. Isolates will be removed from network when calculating eigenvector centrality measure, and will be assigned NA values in final output.
    
    Warning in triad_census(graph = graph) :
      At vendor/cigraph/src/misc/motifs.c:1157 : Triad census called on an undirected graph. All connections will be treated as mutual.
    Warning in eigen_centralization(g, directed = FALSE) :
      Eigenvector centralization calculated only for largest weak component.
    > 
    > # Clustering method
    > flor_cluster <- role_analysis(graph = flor$igraph_list,
    +                               nodes = flor$node_measures,
    +                               directed = FALSE,
    +                               method = "cluster",
    +                               min_partitions = 2,
    +                               max_partitions = 8,
    +                               viz = TRUE)
    Warning in stats::cor(this_mat) : the standard deviation is zero
    Warning in stats::cor(this_mat) : the standard deviation is zero
    Warning in stats::cor(this_mat) : the standard deviation is zero
    Warning in stats::cor(this_mat) : the standard deviation is zero
    Warning in stats::cor(this_mat) : the standard deviation is zero
    Warning in cluster::daisy(euclid_mat, metric = "euclidean") :
      binary variable(s) 27, 36 treated as interval scaled
    Error in `igraph::graph_from_adjacency_matrix()`:
    ! Cannot create a graph object because the adjacency matrix contains
      NAs.
    Backtrace:
        ▆
     1. └─ideanet::role_analysis(...)
     2.   └─ideanet:::cluster_method(...)
     3.     └─igraph::graph_from_adjacency_matrix(dist_mat, mode = "undirected", weighted = TRUE)
     4.       └─igraph:::ensure_no_na(adjmatrix, "adjacency matrix")
     5.         └─cli::cli_abort(...)
     6.           └─rlang::abort(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘CHAMP.Rmd’ using rmarkdown
    ```

# incidentally

<details>

* Version: 1.0.2
* GitHub: https://github.com/zpneal/incidentally
* Source code: https://github.com/cran/incidentally
* Date/Publication: 2023-02-15 21:00:02 UTC
* Number of recursive dependencies: 36

Run `revdepcheck::cloud_details(, "incidentally")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘congress.Rmd’ using rmarkdown
    trying URL 'https://www.govinfo.gov/bulkdata/BILLSTATUS/115/sres/BILLSTATUS-115-sres.zip'
    Content type 'application/zip' length 1883678 bytes (1.8 MB)
    ==================================================
    downloaded 1.8 MB
    
    trying URL 'https://www.govinfo.gov/bulkdata/BILLSTATUS/115/sres/BILLSTATUS-115-sres.zip'
    Content type 'application/zip' length 1883678 bytes (1.8 MB)
    ==================================================
    downloaded 1.8 MB
    ```

# intergraph

<details>

* Version: 2.0-4
* GitHub: https://github.com/mbojan/intergraph
* Source code: https://github.com/cran/intergraph
* Date/Publication: 2024-02-01 17:30:02 UTC
* Number of recursive dependencies: 60

Run `revdepcheck::cloud_details(, "intergraph")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(intergraph)
      > 
      > test_check("intergraph")
      [ FAIL 1 | WARN 3 | SKIP 1 | PASS 53 ]
      
      ══ Skipped tests (1) ═══════════════════════════════════════════════════════════
      • On CRAN (1): 'test-netcompare.R:5:3'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-github_issues.R:8:3'): NAs are preserved in edge attributes ────
      Error in `igraph::graph_from_data_frame(object, directed = directed, vertices = vertices)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. ├─intergraph::asIgraph(net) at test-github_issues.R:8:3
       2. └─intergraph:::asIgraph.network(net)
       3.   ├─intergraph::asIgraph(...)
       4.   └─intergraph:::asIgraph.data.frame(...)
       5.     └─igraph::graph_from_data_frame(object, directed = directed, vertices = vertices)
       6.       └─igraph:::ensure_no_na(d, "edge data frame")
       7.         └─cli::cli_abort(...)
       8.           └─rlang::abort(...)
      
      [ FAIL 1 | WARN 3 | SKIP 1 | PASS 53 ]
      Error: Test failures
      Execution halted
    ```

# IOHanalyzer

<details>

* Version: 0.1.8.10
* GitHub: https://github.com/IOHprofiler/IOHAnalyzer
* Source code: https://github.com/cran/IOHanalyzer
* Date/Publication: 2024-03-01 12:52:37 UTC
* Number of recursive dependencies: 136

Run `revdepcheck::cloud_details(, "IOHanalyzer")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘IOHanalyzer-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: Plot.Stats.Significance_Graph
    > ### Title: Plot a network graph showing the statistically different
    > ###   algorithms
    > ### Aliases: Plot.Stats.Significance_Graph
    > ###   Plot.Stats.Significance_Graph.DataSetList
    > 
    > ### ** Examples
    > 
    > Plot.Stats.Significance_Graph(subset(dsl, funcId == 2), 16)
    Error in `igraph::graph_from_adjacency_matrix()`:
    ! Cannot create a graph object because the adjacency matrix contains
      NAs.
    Backtrace:
        ▆
     1. ├─IOHanalyzer::Plot.Stats.Significance_Graph(...)
     2. └─IOHanalyzer:::Plot.Stats.Significance_Graph.DataSetList(...)
     3.   └─igraph::graph_from_adjacency_matrix(p_matrix <= alpha, mode = "directed", diag = F)
     4.     └─igraph:::ensure_no_na(adjmatrix, "adjacency matrix")
     5.       └─cli::cli_abort(...)
     6.         └─rlang::abort(...)
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.6Mb
      sub-directories of 1Mb or more:
        data           1.4Mb
        libs           3.2Mb
        shiny-server   1.1Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 102 marked UTF-8 strings
    ```

# klassR

<details>

* Version: 1.0.2
* GitHub: https://github.com/statisticsnorway/ssb-klassr
* Source code: https://github.com/cran/klassR
* Date/Publication: 2025-02-07 10:40:02 UTC
* Number of recursive dependencies: 76

Run `revdepcheck::cloud_details(, "klassR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘klassR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: update_klass_node
    > ### Title: Given a node and a graph, find the node at the end of a sequence
    > ###   of changes.
    > ### Aliases: update_klass_node
    > 
    > ### ** Examples
    > 
    > 
    > # Build a graph directed towards the most recent codes.
    > library(klassR)
    > klass_131 <- klass_graph(131)
    Error in `FUN()`:
    ! Error: Logical index length does not match the number of edges.
      Recycling is not allowed.
    Backtrace:
        ▆
     1. └─klassR::klass_graph(131)
     2.   ├─igraph::reverse_edges(...)
     3.   │ └─igraph:::as_igraph_es(graph, eids)
     4.   ├─igraph::E(graph)[igraph::E(graph)$changeOccurred > date]
     5.   └─igraph:::`[.igraph.es`(...)
     6.     └─base::lapply(...)
     7.       └─igraph (local) FUN(X[[i]], ...)
     8.         └─cli::cli_abort("Error: Logical index length does not match the number of edges. Recycling is not allowed.")
     9.           └─rlang::abort(...)
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1764 marked UTF-8 strings
    ```

# manynet

<details>

* Version: 1.5.1
* GitHub: https://github.com/stocnet/manynet
* Source code: https://github.com/cran/manynet
* Date/Publication: 2025-06-23 08:30:02 UTC
* Number of recursive dependencies: 135

Run `revdepcheck::cloud_details(, "manynet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘manynet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: manip_paths
    > ### Title: Modifying networks paths
    > ### Aliases: manip_paths to_matching to_mentoring to_eulerian to_tree
    > ###   to_dominating
    > 
    > ### ** Examples
    > 
    > to_matching(ison_southern_women)
    Error in `igraph::graph_from_data_frame()`:
    ! Cannot create a graph object because the edge data frame contains NAs.
    Backtrace:
         ▆
      1. ├─manynet::to_matching(ison_southern_women)
      2. └─manynet:::to_matching.tbl_graph(ison_southern_women)
      3.   ├─manynet::as_tidygraph(to_matching.igraph(.data, mark, capacities = capacities))
      4.   └─manynet:::to_matching.igraph(.data, mark, capacities = capacities)
      5.     ├─base::suppressWarnings(as_igraph(el, twomode = TRUE))
      6.     │ └─base::withCallingHandlers(...)
      7.     ├─manynet::as_igraph(el, twomode = TRUE)
      8.     └─manynet:::as_igraph.data.frame(el, twomode = TRUE)
      9.       └─igraph::graph_from_data_frame(.data)
     10.         └─igraph:::ensure_no_na(d, "edge data frame")
     11.           └─cli::cli_abort(...)
     12.             └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(manynet)
      > 
      > test_check("manynet")
      Starting 2 test processes
      [ FAIL 2 | WARN 404 | SKIP 20 | PASS 570 ]
      
      ══ Skipped tests (20) ══════════════════════════════════════════════════════════
      • On CRAN (20): 'test-manip_as.R:86:3', 'test-manip_split.R:49:3',
        'test-map_autograph.R:2:3', 'test-map_autograph.R:17:3',
        'test-map_autograph.R:31:3', 'test-map_autograph.R:47:3',
        'test-map_autograph.R:65:3', 'test-map_autograph.R:91:3',
        'test-map_autograph.R:103:3', 'test-map_autograph.R:113:3',
        'test-map_autograph.R:120:3', 'test-map_autograph.R:127:3',
        'test-map_autograph.R:140:3', 'test-map_autograph.R:171:3',
        'test-map_autograph.R:180:3', 'test-mark_nodes.R:36:3',
        'test-mark_nodes.R:45:3', 'test-mark_nodes.R:81:3', 'test-mark_ties.R:24:3',
        'test-mark_ties.R:33:3'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-mark_is.R:12:3'): is_ tests return correct values ──────────────
      Error in `igraph::graph_from_data_frame(.data)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─testthat::expect_false(is_perfect_matching(ison_southern_women)) at test-mark_is.R:12:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─manynet::is_perfect_matching(ison_southern_women)
        5.   ├─manynet::to_matching(.data, mark = mark)
        6.   └─manynet:::to_matching.igraph(.data, mark = mark)
        7.     ├─base::suppressWarnings(as_igraph(el, twomode = TRUE))
        8.     │ └─base::withCallingHandlers(...)
        9.     ├─manynet::as_igraph(el, twomode = TRUE)
       10.     └─manynet:::as_igraph.data.frame(el, twomode = TRUE)
       11.       └─igraph::graph_from_data_frame(.data)
       12.         └─igraph:::ensure_no_na(d, "edge data frame")
       13.           └─cli::cli_abort(...)
       14.             └─rlang::abort(...)
      ── Error ('test-manip_transform.R:43:3'): to matching works ────────────────────
      Error in `igraph::graph_from_data_frame(.data)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─manynet::as_edgelist(to_matching(ison_southern_women)) at test-manip_transform.R:43:3
        2. ├─manynet::to_matching(ison_southern_women)
        3. └─manynet:::to_matching.tbl_graph(ison_southern_women)
        4.   ├─manynet::as_tidygraph(to_matching.igraph(.data, mark, capacities = capacities))
        5.   └─manynet:::to_matching.igraph(.data, mark, capacities = capacities)
        6.     ├─base::suppressWarnings(as_igraph(el, twomode = TRUE))
        7.     │ └─base::withCallingHandlers(...)
        8.     ├─manynet::as_igraph(el, twomode = TRUE)
        9.     └─manynet:::as_igraph.data.frame(el, twomode = TRUE)
       10.       └─igraph::graph_from_data_frame(.data)
       11.         └─igraph:::ensure_no_na(d, "edge data frame")
       12.           └─cli::cli_abort(...)
       13.             └─rlang::abort(...)
      
      [ FAIL 2 | WARN 404 | SKIP 20 | PASS 570 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘Rgraphviz’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.1Mb
      sub-directories of 1Mb or more:
        R           1.5Mb
        tutorials   1.6Mb
    ```

# miic

<details>

* Version: 2.0.3
* GitHub: https://github.com/miicTeam/miic_R_package
* Source code: https://github.com/cran/miic
* Date/Publication: 2024-09-17 22:30:02 UTC
* Number of recursive dependencies: 30

Run `revdepcheck::cloud_details(, "miic")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘miic-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: miic
    > ### Title: MIIC, causal network learning algorithm including latent
    > ###   variables
    > ### Aliases: miic
    > 
    > ### ** Examples
    > 
    > library(miic)
    > 
    > # EXAMPLE HEMATOPOIESIS
    > data(hematoData)
    > 
    > # execute MIIC (reconstruct graph)
    > miic_obj <- miic(
    +   input_data = hematoData[1:1000,], latent = "yes",
    +   n_shuffles = 10, conf_threshold = 0.001
    + )
    Search all pairs for unconditional independence relations...
    Search for candidate separating nodes...
    
    [>---------------------------------------]   0% eta: 0s        
    [>---------------------------------------]   1% eta: 0s        
    [>---------------------------------------]   2% eta: 0s        
    [=>--------------------------------------]   3% eta: 0s        
    [=>--------------------------------------]   4% eta: 0s        
    [==>-------------------------------------]   5% eta: 0s        
    [==>-------------------------------------]   6% eta: 0s        
    [==>-------------------------------------]   7% eta: 0s        
    [===>------------------------------------]   8% eta: 0s        
    [===>------------------------------------]   9% eta: 0s        
    [====>-----------------------------------]  10% eta: 0s        
    [====>-----------------------------------]  11% eta: 0s        
    [====>-----------------------------------]  12% eta: 0s        
    [=====>----------------------------------]  13% eta: 0s        
    [=====>----------------------------------]  14% eta: 0s        
    [======>---------------------------------]  15% eta: 0s        
    [======>---------------------------------]  16% eta: 0s        
    [======>---------------------------------]  17% eta: 0s        
    [=======>--------------------------------]  18% eta: 0s        
    [=======>--------------------------------]  19% eta: 0s        
    [========>-------------------------------]  20% eta: 0s        
    [========>-------------------------------]  21% eta: 0s        
    [========>-------------------------------]  22% eta: 0s        
    [=========>------------------------------]  23% eta: 0s        
    [=========>------------------------------]  24% eta: 0s        
    [==========>-----------------------------]  25% eta: 0s        
    [==========>-----------------------------]  26% eta: 0s        
    [==========>-----------------------------]  27% eta: 0s        
    [===========>----------------------------]  28% eta: 0s        
    [===========>----------------------------]  29% eta: 0s        
    [============>---------------------------]  30% eta: 0s        
    [============>---------------------------]  31% eta: 0s        
    [============>---------------------------]  32% eta: 0s        
    [=============>--------------------------]  33% eta: 0s        
    [=============>--------------------------]  34% eta: 0s        
    [==============>-------------------------]  35% eta: 0s        
    [==============>-------------------------]  36% eta: 0s        
    [==============>-------------------------]  37% eta: 0s        
    [===============>------------------------]  38% eta: 0s        
    [===============>------------------------]  39% eta: 0s        
    [================>-----------------------]  40% eta: 0s        
    [================>-----------------------]  41% eta: 0s        
    [================>-----------------------]  42% eta: 0s        
    [=================>----------------------]  43% eta: 0s        
    [=================>----------------------]  44% eta: 0s        
    [==================>---------------------]  45% eta: 0s        
    [==================>---------------------]  46% eta: 0s        
    [==================>---------------------]  47% eta: 0s        
    [===================>--------------------]  48% eta: 0s        
    [===================>--------------------]  49% eta: 0s        
    [====================>-------------------]  50% eta: 0s        
    [====================>-------------------]  51% eta: 0s        
    [====================>-------------------]  52% eta: 0s        
    [=====================>------------------]  53% eta: 0s        
    [=====================>------------------]  54% eta: 0s        
    [======================>-----------------]  55% eta: 0s        
    [======================>-----------------]  56% eta: 0s        
    [======================>-----------------]  57% eta: 0s        
    [=======================>----------------]  58% eta: 0s        
    [=======================>----------------]  59% eta: 0s        
    [========================>---------------]  60% eta: 0s        
    [========================>---------------]  61% eta: 0s        
    [========================>---------------]  62% eta: 0s        
    [=========================>--------------]  63% eta: 0s        
    [=========================>--------------]  64% eta: 0s        
    [==========================>-------------]  65% eta: 0s        
    [==========================>-------------]  66% eta: 0s        
    [==========================>-------------]  67% eta: 0s        
    [===========================>------------]  68% eta: 0s        
    [===========================>------------]  69% eta: 0s        
    [============================>-----------]  70% eta: 0s        
    [============================>-----------]  71% eta: 0s        
    [============================>-----------]  72% eta: 0s        
    [=============================>----------]  73% eta: 0s        
    [=============================>----------]  74% eta: 0s        
    [==============================>---------]  75% eta: 0s        
    [==============================>---------]  76% eta: 0s        
    [==============================>---------]  77% eta: 0s        
    [===============================>--------]  78% eta: 0s        
    [===============================>--------]  79% eta: 0s        
    [================================>-------]  80% eta: 0s        
    [================================>-------]  81% eta: 0s        
    [================================>-------]  82% eta: 0s        
    [=================================>------]  83% eta: 0s        
    [=================================>------]  84% eta: 0s        
    [==================================>-----]  85% eta: 0s        
    [==================================>-----]  86% eta: 0s        
    [==================================>-----]  87% eta: 0s        
    [===================================>----]  88% eta: 0s        
    [===================================>----]  89% eta: 0s        
    [====================================>---]  90% eta: 0s        
    [====================================>---]  91% eta: 0s        
    [====================================>---]  92% eta: 0s        
    [=====================================>--]  93% eta: 0s        
    [=====================================>--]  94% eta: 0s        
    [======================================>-]  95% eta: 0s        
    [======================================>-]  96% eta: 0s        
    [======================================>-]  97% eta: 0s        
    [=======================================>]  98% eta: 0s        
    [=======================================>]  99% eta: 0s        
    [========================================] 100% eta: 0s        
    Search for conditional independence relations...
    
    [>---------------------------------------]   0% eta: 0s        
    [>---------------------------------------]   1% eta: 0s        
    [>---------------------------------------]   2% eta: 0s        
    [=>--------------------------------------]   3% eta: 0s        
    [=>--------------------------------------]   4% eta: 0s        
    [==>-------------------------------------]   5% eta: 0s        
    [==>-------------------------------------]   6% eta: 0s        
    [==>-------------------------------------]   7% eta: 0s        
    [===>------------------------------------]   8% eta: 0s        
    [===>------------------------------------]   9% eta: 0s        
    [====>-----------------------------------]  10% eta: 0s        
    [====>-----------------------------------]  11% eta: 0s        
    [====>-----------------------------------]  12% eta: 0s        
    [=====>----------------------------------]  13% eta: 0s        
    [=====>----------------------------------]  14% eta: 0s        
    [======>---------------------------------]  15% eta: 0s        
    [======>---------------------------------]  16% eta: 0s        
    [======>---------------------------------]  17% eta: 0s        
    [=======>--------------------------------]  18% eta: 0s        
    [=======>--------------------------------]  19% eta: 0s        
    [========>-------------------------------]  20% eta: 0s        
    [========>-------------------------------]  21% eta: 0s        
    [========>-------------------------------]  22% eta: 0s        
    [=========>------------------------------]  23% eta: 0s        
    [=========>------------------------------]  24% eta: 0s        
    [==========>-----------------------------]  25% eta: 0s        
    [==========>-----------------------------]  26% eta: 0s        
    [==========>-----------------------------]  27% eta: 0s        
    [===========>----------------------------]  28% eta: 0s        
    [===========>----------------------------]  29% eta: 0s        
    [============>---------------------------]  30% eta: 0s        
    [============>---------------------------]  31% eta: 0s        
    [============>---------------------------]  32% eta: 0s        
    [=============>--------------------------]  33% eta: 0s        
    [=============>--------------------------]  34% eta: 0s        
    [==============>-------------------------]  35% eta: 0s        
    [==============>-------------------------]  36% eta: 0s        
    [==============>-------------------------]  37% eta: 0s        
    [===============>------------------------]  38% eta: 0s        
    [===============>------------------------]  39% eta: 0s        
    [================>-----------------------]  40% eta: 0s        
    [================>-----------------------]  41% eta: 0s        
    [================>-----------------------]  42% eta: 0s        
    [=================>----------------------]  43% eta: 0s        
    [=================>----------------------]  44% eta: 0s        
    [==================>---------------------]  45% eta: 0s        
    [==================>---------------------]  46% eta: 0s        
    [==================>---------------------]  47% eta: 0s        
    [===================>--------------------]  48% eta: 0s        
    [===================>--------------------]  49% eta: 0s        
    [====================>-------------------]  50% eta: 0s        
    [====================>-------------------]  51% eta: 0s        
    [====================>-------------------]  52% eta: 0s        
    [=====================>------------------]  53% eta: 0s        
    [=====================>------------------]  54% eta: 0s        
    [======================>-----------------]  55% eta: 0s        
    [======================>-----------------]  56% eta: 0s        
    [======================>-----------------]  57% eta: 0s        
    [=======================>----------------]  58% eta: 0s        
    [=======================>----------------]  59% eta: 0s        
    [========================>---------------]  60% eta: 0s        
    [========================>---------------]  61% eta: 0s        
    [========================>---------------]  62% eta: 0s        
    [=========================>--------------]  63% eta: 0s        
    [=========================>--------------]  64% eta: 0s        
    [==========================>-------------]  65% eta: 0s        
    [==========================>-------------]  66% eta: 0s        
    [==========================>-------------]  67% eta: 0s        
    [===========================>------------]  68% eta: 0s        
    [===========================>------------]  69% eta: 0s        
    [============================>-----------]  70% eta: 0s        
    [============================>-----------]  71% eta: 0s        
    [============================>-----------]  72% eta: 0s        
    [=============================>----------]  73% eta: 0s        
    [=============================>----------]  74% eta: 0s        
    [==============================>---------]  75% eta: 0s        
    [==============================>---------]  76% eta: 0s        
    [==============================>---------]  77% eta: 0s        
    [===============================>--------]  78% eta: 0s        
    [===============================>--------]  79% eta: 0s        
    [================================>-------]  80% eta: 0s        
    [================================>-------]  81% eta: 0s        
    [================================>-------]  82% eta: 0s        
    [=================================>------]  83% eta: 0s        
    [=================================>------]  84% eta: 0s        
    [==================================>-----]  85% eta: 0s        
    [==================================>-----]  86% eta: 0s        
    [==================================>-----]  87% eta: 0s        
    [===================================>----]  88% eta: 0s        
    [===================================>----]  89% eta: 0s        
    [====================================>---]  90% eta: 0s        
    [====================================>---]  91% eta: 0s        
    [====================================>---]  92% eta: 0s        
    [=====================================>--]  93% eta: 0s        
    [=====================================>--]  94% eta: 0s        
    [======================================>-]  95% eta: 0s        
    [======================================>-]  96% eta: 0s        
    [======================================>-]  97% eta: 0s        
    [=======================================>]  98% eta: 0s        
    [=======================================>]  99% eta: 0s        
    [========================================] 100% eta: 0s        
    Compute confidence cut with permutations...18 edges cut.
    Search for edge directions...
    Number of edges: 50
    > 
    > # plot graph
    > if(require(igraph)) {
    +  plot(miic_obj, method="igraph")
    + }
    Loading required package: igraph
    
    Attaching package: ‘igraph’
    
    The following objects are masked from ‘package:stats’:
    
        decompose, spectrum
    
    The following object is masked from ‘package:base’:
    
        union
    
    Error in `igraph::graph_from_data_frame()`:
    ! Cannot create a graph object because the edge data frame contains NAs.
    Backtrace:
        ▆
     1. ├─base::plot(miic_obj, method = "igraph")
     2. └─miic:::plot.miic(miic_obj, method = "igraph")
     3.   └─miic::export(x, "igraph", pcor_palette = pcor_palette)
     4.     └─miic:::getIgraph(miic_obj, pcor_palette = pcor_palette)
     5.       └─igraph::graph_from_data_frame(summary, vertices = colnames(miic_obj$adj_matrix))
     6.         └─igraph:::ensure_no_na(d, "edge data frame")
     7.           └─cli::cli_abort(...)
     8.             └─rlang::abort(...)
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.2Mb
      sub-directories of 1Mb or more:
        libs   9.7Mb
    ```

# multinet

<details>

* Version: 4.2.2
* GitHub: NA
* Source code: https://github.com/cran/multinet
* Date/Publication: 2025-04-08 07:20:06 UTC
* Number of recursive dependencies: 13

Run `revdepcheck::cloud_details(, "multinet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘multinet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: multinet.conversion
    > ### Title: Conversion to a simple or multi graph
    > ### Aliases: multinet.conversion as.igraph.multinet
    > ###   as.igraph.Rcpp_RMLNetwork
    > 
    > ### ** Examples
    > 
    > net <- ml_aucs()
    > # using the default merge.actors=TRUE we create a multigraph,
    > # where each actor corresponds to a vertex in the result
    > multigraph <- as.igraph(net)
    Error in `make_empty_graph()`:
    ! `directed` must be a logical, not a number.
    Backtrace:
        ▆
     1. ├─igraph::as.igraph(net)
     2. └─multinet:::as.igraph.Rcpp_RMLNetwork(net)
     3.   └─igraph::graph_from_data_frame(vertices = a_df, e_df, directed = dir)
     4.     └─igraph::make_empty_graph(n = 0, directed = directed)
     5.       └─cli::cli_abort("{.arg directed} must be a logical, not {.obj_type_friendly {directed}}.")
     6.         └─rlang::abort(...)
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 137.5Mb
      sub-directories of 1Mb or more:
        libs  137.2Mb
    ```

# mwcsr

<details>

* Version: 0.1.9
* GitHub: https://github.com/ctlab/mwcsr
* Source code: https://github.com/cran/mwcsr
* Date/Publication: 2024-09-09 11:30:10 UTC
* Number of recursive dependencies: 86

Run `revdepcheck::cloud_details(, "mwcsr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(mwcsr)
      > 
      > test_check("mwcsr")
      [ FAIL 1 | WARN 11 | SKIP 5 | PASS 42 ]
      
      ══ Skipped tests (5) ═══════════════════════════════════════════════════════════
      • No CPLEX available (3): 'test_virgo.R:5:9', 'test_virgo.R:15:9',
        'test_virgo.R:24:9'
      • SCIP is not available (2): 'test_scip.R:5:9', 'test_scip.R:16:9'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_sgmwcs.R:51:5'): normalize_sgmwcs_instance handles NA signals as unique ──
      Error in `graph_from_data_frame(et, directed = FALSE, vertices = nt)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
          ▆
       1. └─igraph::graph_from_data_frame(et, directed = FALSE, vertices = nt) at test_sgmwcs.R:51:5
       2.   └─igraph:::ensure_no_na(d, "edge data frame")
       3.     └─cli::cli_abort(...)
       4.       └─rlang::abort(...)
      
      [ FAIL 1 | WARN 11 | SKIP 5 | PASS 42 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 13.6Mb
      sub-directories of 1Mb or more:
        java   2.5Mb
        libs  10.5Mb
    ```

# purgeR

<details>

* Version: 1.8.2
* GitHub: NA
* Source code: https://github.com/cran/purgeR
* Date/Publication: 2023-11-28 22:20:02 UTC
* Number of recursive dependencies: 128

Run `revdepcheck::cloud_details(, "purgeR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘purgeR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ped_graph
    > ### Title: Input for igraph
    > ### Aliases: ped_graph
    > 
    > ### ** Examples
    > 
    > data(atlas)
    > atlas_graph <- ped_graph(atlas)
    > G <- igraph::graph_from_data_frame(d = atlas_graph$edges,
    +                                    vertices = atlas_graph$vertices,
    +                                    directed = TRUE)
    Error in `igraph::graph_from_data_frame()`:
    ! Cannot create a graph object because the edge data frame contains NAs.
    Backtrace:
        ▆
     1. └─igraph::graph_from_data_frame(d = atlas_graph$edges, vertices = atlas_graph$vertices, directed = TRUE)
     2.   └─igraph:::ensure_no_na(d, "edge data frame")
     3.     └─cli::cli_abort(...)
     4.       └─rlang::abort(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘ip.Rmd’ using rmarkdown
    Computing opportunity of purging values... 
    0%   10   20   30   40   50   60   70   80   90   100%
    [----|----|----|----|----|----|----|----|----|----|
    **************************************************|
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.5Mb
      sub-directories of 1Mb or more:
        libs   6.7Mb
    ```

# remify

<details>

* Version: 3.2.8
* GitHub: https://github.com/TilburgNetworkGroup/remify
* Source code: https://github.com/cran/remify
* Date/Publication: 2025-01-29 13:20:05 UTC
* Number of recursive dependencies: 36

Run `revdepcheck::cloud_details(, "remify")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘tinytest.R’
    Running the tests in ‘tests/tinytest.R’ failed.
    Complete output:
      > if ( requireNamespace("tinytest", quietly=TRUE) ){
      +   tinytest::test_package("remify")
      + }
      
      test-rehshape.R...............    0 tests    
      test-rehshape.R...............    1 tests [0;32mOK[0m 
      test-rehshape.R...............    1 tests [0;32mOK[0m 
      test-rehshape.R...............    2 tests [0;32mOK[0m 
      test-rehshape.R...............    3 tests [0;32mOK[0m 
      test-rehshape.R...............    4 tests [0;32mOK[0m 
      test-rehshape.R...............    5 tests [0;32mOK[0m 
      test-rehshape.R...............    6 tests [0;32mOK[0m 
      test-rehshape.R...............    7 tests [0;32mOK[0m 
      test-rehshape.R...............    8 tests [0;32mOK[0m 
      test-rehshape.R...............    9 tests [0;32mOK[0m 
      test-rehshape.R...............   10 tests [0;32mOK[0m 
      test-rehshape.R...............   10 tests [0;32mOK[0m 
      test-rehshape.R...............   11 tests [0;32mOK[0m 
      test-rehshape.R...............   12 tests [0;32mOK[0m 
      test-rehshape.R...............   13 tests [0;32mOK[0m 
      test-rehshape.R...............   14 tests [0;32mOK[0m 
      test-rehshape.R...............   15 tests [0;32mOK[0m 
      test-rehshape.R...............   16 tests [0;32mOK[0m 
      test-rehshape.R...............   17 tests [0;32mOK[0m 
      test-rehshape.R...............   18 tests [0;32mOK[0m 
      test-rehshape.R...............   19 tests [0;32mOK[0m 
      test-rehshape.R...............   19 tests [0;32mOK[0m 
      test-rehshape.R...............   20 tests [0;32mOK[0m 
      test-rehshape.R...............   20 tests [0;32mOK[0m 
      test-rehshape.R...............   21 tests [0;32mOK[0m 
      test-rehshape.R...............   22 tests [0;32mOK[0m 
      test-rehshape.R...............   22 tests [0;32mOK[0m 
      test-rehshape.R...............   22 tests [0;32mOK[0m 
      test-rehshape.R...............   23 tests [0;32mOK[0m 
      test-rehshape.R...............   24 tests [0;32mOK[0m 
      test-rehshape.R...............   24 tests [0;32mOK[0m 
      test-rehshape.R...............   24 tests [0;32mOK[0m 
      test-rehshape.R...............   25 tests [0;32mOK[0m 
      test-rehshape.R...............   26 tests [0;32mOK[0m [0;34m2.0s[0m
      
      test-remify-error-messages.R..    1 tests [0;32mOK[0m 
      test-remify-error-messages.R..    1 tests [0;32mOK[0m 
      test-remify-error-messages.R..    1 tests [0;32mOK[0m 
      test-remify-error-messages.R..    2 tests [0;32mOK[0m 
      test-remify-error-messages.R..    2 tests [0;32mOK[0m 
      test-remify-error-messages.R..    2 tests [0;32mOK[0m 
      test-remify-error-messages.R..    3 tests [0;32mOK[0m 
      test-remify-error-messages.R..    3 tests [0;32mOK[0m 
      test-remify-error-messages.R..    3 tests [0;32mOK[0m 
      test-remify-error-messages.R..    4 tests [0;32mOK[0m 
      test-remify-error-messages.R..    5 tests [0;32mOK[0m 
      test-remify-error-messages.R..    6 tests [0;32mOK[0m 
      test-remify-error-messages.R..    6 tests [0;32mOK[0m 
      test-remify-error-messages.R..    6 tests [0;32mOK[0m 
      test-remify-error-messages.R..    7 tests [0;32mOK[0m 
      test-remify-error-messages.R..    7 tests [0;32mOK[0m 
      test-remify-error-messages.R..    8 tests [0;32mOK[0m 
      test-remify-error-messages.R..    8 tests [0;32mOK[0m 
      test-remify-error-messages.R..    8 tests [0;32mOK[0m 
      test-remify-error-messages.R..    9 tests [0;32mOK[0m 
      test-remify-error-messages.R..    9 tests [0;32mOK[0m 
      test-remify-error-messages.R..    9 tests [0;32mOK[0m 
      test-remify-error-messages.R..   10 tests [0;32mOK[0m 
      test-remify-error-messages.R..   10 tests [0;32mOK[0m 
      test-remify-error-messages.R..   10 tests [0;32mOK[0m 
      test-remify-error-messages.R..   11 tests [0;32mOK[0m 
      test-remify-error-messages.R..   11 tests [0;32mOK[0m 
      test-remify-error-messages.R..   11 tests [0;32mOK[0m 
      test-remify-error-messages.R..   12 tests [0;32mOK[0m 
      test-remify-error-messages.R..   12 tests [0;32mOK[0m 
      test-remify-error-messages.R..   12 tests [0;32mOK[0m 
      test-remify-error-messages.R..   13 tests [0;32mOK[0m 
      test-remify-error-messages.R..   13 tests [0;32mOK[0m 
      test-remify-error-messages.R..   14 tests [0;32mOK[0m 
      test-remify-error-messages.R..   14 tests [0;32mOK[0m 
      test-remify-error-messages.R..   14 tests [0;32mOK[0m 
      test-remify-error-messages.R..   15 tests [0;32mOK[0m 
      test-remify-error-messages.R..   15 tests [0;32mOK[0m 
      test-remify-error-messages.R..   15 tests [0;32mOK[0m 
      test-remify-error-messages.R..   16 tests [0;32mOK[0m 
      test-remify-error-messages.R..   16 tests [0;32mOK[0m 
      test-remify-error-messages.R..   16 tests [0;32mOK[0m 
      test-remify-error-messages.R..   17 tests [0;32mOK[0m 
      test-remify-error-messages.R..   17 tests [0;32mOK[0m 
      test-remify-error-messages.R..   17 tests [0;32mOK[0m 
      test-remify-error-messages.R..   18 tests [0;32mOK[0m 
      test-remify-error-messages.R..   18 tests [0;32mOK[0m 
      test-remify-error-messages.R..   19 tests [0;32mOK[0m 
      test-remify-error-messages.R..   19 tests [0;32mOK[0m 
      test-remify-error-messages.R..   20 tests [0;32mOK[0m 
      test-remify-error-messages.R..   20 tests [0;32mOK[0m 
      test-remify-error-messages.R..   21 tests [0;32mOK[0m [0;34m0.1s[0m
      
      test-remify-methods.R.........    0 tests    
      test-remify-methods.R.........    0 tests    
      test-remify-methods.R.........    1 tests [0;32mOK[0m 
      test-remify-methods.R.........    2 tests [0;32mOK[0m 
      test-remify-methods.R.........    3 tests [0;32mOK[0m 
      test-remify-methods.R.........    4 tests [0;32mOK[0m 
      test-remify-methods.R.........    4 tests [0;32mOK[0m 
      test-remify-methods.R.........    4 tests [0;32mOK[0m 
      test-remify-methods.R.........    4 tests [0;32mOK[0m 
      test-remify-methods.R.........    5 tests [0;32mOK[0m 
      test-remify-methods.R.........    6 tests [0;32mOK[0m 
      test-remify-methods.R.........    7 tests [0;32mOK[0m 
      test-remify-methods.R.........    8 tests [0;32mOK[0m 
      test-remify-methods.R.........    8 tests [0;32mOK[0m 
      test-remify-methods.R.........    8 tests [0;32mOK[0m 
      test-remify-methods.R.........    8 tests [0;32mOK[0m 
      test-remify-methods.R.........    8 tests [0;32mOK[0m 
      test-remify-methods.R.........    9 tests [0;32mOK[0m 
      test-remify-methods.R.........   10 tests [0;32mOK[0m 
      test-remify-methods.R.........   11 tests [0;32mOK[0m 
      test-remify-methods.R.........   12 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   13 tests [0;32mOK[0m 
      test-remify-methods.R.........   14 tests [0;32mOK[0m 
      test-remify-methods.R.........   15 tests [0;32mOK[0m 
      test-remify-methods.R.........   16 tests [0;32mOK[0m 
      test-remify-methods.R.........   17 tests [0;32mOK[0m 
      test-remify-methods.R.........   18 tests [0;32mOK[0m 
      test-remify-methods.R.........   18 tests [0;32mOK[0m 
      test-remify-methods.R.........   18 tests [0;32mOK[0m 
      test-remify-methods.R.........   18 tests [0;32mOK[0m 
      test-remify-methods.R.........   18 tests [0;32mOK[0m 
      test-remify-methods.R.........   19 tests [0;32mOK[0m 
      test-remify-methods.R.........   20 tests [0;32mOK[0m 
      test-remify-methods.R.........   21 tests [0;32mOK[0m 
      test-remify-methods.R.........   22 tests [0;32mOK[0m 
      test-remify-methods.R.........   23 tests [0;32mOK[0m 
      test-remify-methods.R.........   23 tests [0;32mOK[0m 
      test-remify-methods.R.........   23 tests [0;32mOK[0m 
      test-remify-methods.R.........   24 tests [0;32mOK[0m 
      test-remify-methods.R.........   25 tests [0;32mOK[0m 
      test-remify-methods.R.........   26 tests [0;32mOK[0m 
      test-remify-methods.R.........   27 tests [0;32mOK[0m 
      test-remify-methods.R.........   27 tests [0;32mOK[0m 
      test-remify-methods.R.........   27 tests [0;32mOK[0m 
      test-remify-methods.R.........   28 tests [0;32mOK[0m 
      test-remify-methods.R.........   29 tests [0;32mOK[0m 
      test-remify-methods.R.........   30 tests [0;32mOK[0m 
      test-remify-methods.R.........   31 tests [0;32mOK[0m 
      test-remify-methods.R.........   31 tests [0;32mOK[0m 
      test-remify-methods.R.........   31 tests [0;32mOK[0m 
      test-remify-methods.R.........   32 tests [0;32mOK[0m 
      test-remify-methods.R.........   33 tests [0;32mOK[0m 
      test-remify-methods.R.........   33 tests [0;32mOK[0m 
      test-remify-methods.R.........   33 tests [0;32mOK[0m 
      test-remify-methods.R.........   34 tests [0;32mOK[0m 
      test-remify-methods.R.........   35 tests [0;32mOK[0m 
      test-remify-methods.R.........   36 tests [0;32mOK[0m 
      test-remify-methods.R.........   37 tests [0;32mOK[0m 
      test-remify-methods.R.........   38 tests [0;32mOK[0m 
      test-remify-methods.R.........   39 tests [0;32mOK[0m 
      test-remify-methods.R.........   40 tests [0;32mOK[0m 
      test-remify-methods.R.........   41 tests [0;32mOK[0m 
      test-remify-methods.R.........   42 tests [0;32mOK[0m 
      test-remify-methods.R.........   43 tests [0;32mOK[0m 
      test-remify-methods.R.........   44 tests [0;32mOK[0m 
      test-remify-methods.R.........   45 tests [0;32mOK[0m 
      test-remify-methods.R.........   46 tests [0;32mOK[0m 
      test-remify-methods.R.........   47 tests [0;32mOK[0m 
      test-remify-methods.R.........   48 tests [0;32mOK[0m 
      test-remify-methods.R.........   49 tests [0;32mOK[0m 
      test-remify-methods.R.........   49 tests [0;32mOK[0m 
      test-remify-methods.R.........   50 tests [0;32mOK[0m 
      test-remify-methods.R.........   51 tests [0;32mOK[0m 
      test-remify-methods.R.........   52 tests [0;32mOK[0m 
      test-remify-methods.R.........   53 tests [0;32mOK[0m 
      test-remify-methods.R.........   54 tests [0;32mOK[0m 
      test-remify-methods.R.........   55 tests [0;32mOK[0m 
      test-remify-methods.R.........   56 tests [0;32mOK[0m 
      test-remify-methods.R.........   57 tests [0;32mOK[0m 
      test-remify-methods.R.........   58 tests [0;32mOK[0m 
      test-remify-methods.R.........   59 tests [0;32mOK[0m 
      test-remify-methods.R.........   60 tests [0;32mOK[0m 
      test-remify-methods.R.........   61 tests [0;32mOK[0m 
      test-remify-methods.R.........   62 tests [0;32mOK[0m 
      test-remify-methods.R.........   63 tests [0;32mOK[0m 
      test-remify-methods.R.........   64 tests [0;32mOK[0m 
      test-remify-methods.R.........   64 tests [0;32mOK[0m 
      test-remify-methods.R.........   65 tests [0;32mOK[0m 
      test-remify-methods.R.........   66 tests [0;32mOK[0m 
      test-remify-methods.R.........   67 tests [0;32mOK[0m 
      test-remify-methods.R.........   68 tests [0;32mOK[0m 
      test-remify-methods.R.........   69 tests [0;32mOK[0m 
      test-remify-methods.R.........   70 tests [0;32mOK[0m 
      test-remify-methods.R.........   71 tests [0;32mOK[0m 
      test-remify-methods.R.........   72 tests [0;32mOK[0m 
      test-remify-methods.R.........   73 tests [0;32mOK[0m 
      test-remify-methods.R.........   74 tests [0;32mOK[0m 
      test-remify-methods.R.........   75 tests [0;32mOK[0m 
      test-remify-methods.R.........   76 tests [0;32mOK[0m 
      test-remify-methods.R.........   76 tests [0;32mOK[0m 
      test-remify-methods.R.........   76 tests [0;32mOK[0m 
      test-remify-methods.R.........   77 tests [0;32mOK[0m 
      test-remify-methods.R.........   78 tests [0;32mOK[0m 
      test-remify-methods.R.........   79 tests [0;32mOK[0m 
      test-remify-methods.R.........   80 tests [0;32mOK[0m 
      test-remify-methods.R.........   81 tests [0;32mOK[0m 
      test-remify-methods.R.........   82 tests [0;32mOK[0m 
      test-remify-methods.R.........   82 tests [0;32mOK[0m 
      test-remify-methods.R.........   82 tests [0;32mOK[0m 
      test-remify-methods.R.........   83 tests [0;32mOK[0m 
      test-remify-methods.R.........   84 tests [0;32mOK[0m 
      test-remify-methods.R.........   85 tests [0;32mOK[0m 
      test-remify-methods.R.........   86 tests [0;32mOK[0m 
      test-remify-methods.R.........   87 tests [0;32mOK[0m 
      test-remify-methods.R.........   88 tests [0;32mOK[0m 
      test-remify-methods.R.........   89 tests [0;32mOK[0m 
      test-remify-methods.R.........   90 tests [0;32mOK[0m 
      test-remify-methods.R.........   90 tests [0;32mOK[0m 
      test-remify-methods.R.........   90 tests [0;32mOK[0m 
      test-remify-methods.R.........   90 tests [0;32mOK[0m 
      test-remify-methods.R.........   91 tests [0;32mOK[0m 
      test-remify-methods.R.........   91 tests [0;32mOK[0m 
      test-remify-methods.R.........   92 tests [0;31m1 fails[0m 
      test-remify-methods.R.........   93 tests [0;31m2 fails[0m 
      test-remify-methods.R.........   94 tests [0;31m3 fails[0m 
      test-remify-methods.R.........   95 tests [0;31m4 fails[0m 
      test-remify-methods.R.........   96 tests [0;31m5 fails[0m 
      test-remify-methods.R.........   97 tests [0;31m6 fails[0m 
      test-remify-methods.R.........   98 tests [0;31m7 fails[0m 
      test-remify-methods.R.........   98 tests [0;31m7 fails[0m 
      test-remify-methods.R.........   99 tests [0;31m8 fails[0m 
      test-remify-methods.R.........  100 tests [0;31m9 fails[0m 
      test-remify-methods.R.........  101 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  101 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  102 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  103 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  104 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  105 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  106 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  107 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  107 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  107 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  108 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  109 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  109 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  109 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  110 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  110 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  110 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  111 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  111 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  111 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  112 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  112 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  112 tests [0;31m10 fails[0m 
      test-remify-methods.R.........  113 tests [0;31m10 fails[0m [0;34m7.3s[0m
      
      test-remify-warning-messages.R    0 tests    
      test-remify-warning-messages.R    0 tests    
      test-remify-warning-messages.R    1 tests [0;32mOK[0m 
      test-remify-warning-messages.R    1 tests [0;32mOK[0m 
      test-remify-warning-messages.R    2 tests [0;32mOK[0m 
      test-remify-warning-messages.R    2 tests [0;32mOK[0m 
      test-remify-warning-messages.R    2 tests [0;32mOK[0m 
      test-remify-warning-messages.R    3 tests [0;32mOK[0m 
      test-remify-warning-messages.R    3 tests [0;32mOK[0m 
      test-remify-warning-messages.R    3 tests [0;32mOK[0m 
      test-remify-warning-messages.R    4 tests [0;32mOK[0m 
      test-remify-warning-messages.R    4 tests [0;32mOK[0m 
      test-remify-warning-messages.R    4 tests [0;32mOK[0m 
      test-remify-warning-messages.R    5 tests [0;32mOK[0m 
      test-remify-warning-messages.R    5 tests [0;32mOK[0m 
      test-remify-warning-messages.R    5 tests [0;32mOK[0m 
      test-remify-warning-messages.R    6 tests [0;32mOK[0m 
      test-remify-warning-messages.R    6 tests [0;32mOK[0m 
      test-remify-warning-messages.R    6 tests [0;32mOK[0m 
      test-remify-warning-messages.R    7 tests [0;32mOK[0m 
      test-remify-warning-messages.R    7 tests [0;32mOK[0m 
      test-remify-warning-messages.R    7 tests [0;32mOK[0m 
      test-remify-warning-messages.R    7 tests [0;32mOK[0m 
      test-remify-warning-messages.R    8 tests [0;32mOK[0m 
      test-remify-warning-messages.R    9 tests [0;32mOK[0m 
      test-remify-warning-messages.R    9 tests [0;32mOK[0m 
      test-remify-warning-messages.R   10 tests [0;32mOK[0m 
      test-remify-warning-messages.R   11 tests [0;32mOK[0m 
      test-remify-warning-messages.R   11 tests [0;32mOK[0m 
      test-remify-warning-messages.R   11 tests [0;32mOK[0m 
      test-remify-warning-messages.R   12 tests [0;32mOK[0m 
      test-remify-warning-messages.R   13 tests [0;32mOK[0m 
      test-remify-warning-messages.R   13 tests [0;32mOK[0m 
      test-remify-warning-messages.R   14 tests [0;32mOK[0m 
      test-remify-warning-messages.R   15 tests [0;32mOK[0m 
      test-remify-warning-messages.R   15 tests [0;32mOK[0m 
      test-remify-warning-messages.R   15 tests [0;32mOK[0m 
      test-remify-warning-messages.R   15 tests [0;32mOK[0m 
      test-remify-warning-messages.R   15 tests [0;32mOK[0m 
      test-remify-warning-messages.R   16 tests [0;32mOK[0m 
      test-remify-warning-messages.R   17 tests [0;32mOK[0m 
      test-remify-warning-messages.R   17 tests [0;32mOK[0m 
      test-remify-warning-messages.R   18 tests [0;32mOK[0m 
      test-remify-warning-messages.R   19 tests [0;32mOK[0m 
      test-remify-warning-messages.R   19 tests [0;32mOK[0m 
      test-remify-warning-messages.R   19 tests [0;32mOK[0m 
      test-remify-warning-messages.R   19 tests [0;32mOK[0m 
      test-remify-warning-messages.R   20 tests [0;32mOK[0m 
      test-remify-warning-messages.R   21 tests [0;32mOK[0m 
      test-remify-warning-messages.R   21 tests [0;32mOK[0m 
      test-remify-warning-messages.R   22 tests [0;32mOK[0m 
      test-remify-warning-messages.R   23 tests [0;32mOK[0m 
      test-remify-warning-messages.R   23 tests [0;32mOK[0m 
      test-remify-warning-messages.R   23 tests [0;32mOK[0m 
      test-remify-warning-messages.R   23 tests [0;32mOK[0m 
      test-remify-warning-messages.R   23 tests [0;32mOK[0m 
      test-remify-warning-messages.R   24 tests [0;32mOK[0m 
      test-remify-warning-messages.R   25 tests [0;32mOK[0m 
      test-remify-warning-messages.R   25 tests [0;32mOK[0m 
      test-remify-warning-messages.R   26 tests [0;32mOK[0m 
      test-remify-warning-messages.R   27 tests [0;32mOK[0m 
      test-remify-warning-messages.R   27 tests [0;32mOK[0m 
      test-remify-warning-messages.R   27 tests [0;32mOK[0m 
      test-remify-warning-messages.R   27 tests [0;32mOK[0m 
      test-remify-warning-messages.R   28 tests [0;32mOK[0m 
      test-remify-warning-messages.R   29 tests [0;32mOK[0m 
      test-remify-warning-messages.R   29 tests [0;32mOK[0m 
      test-remify-warning-messages.R   30 tests [0;32mOK[0m 
      test-remify-warning-messages.R   31 tests [0;32mOK[0m [0;34m0.4s[0m
      
      test-remify.R.................    0 tests    
      test-remify.R.................    1 tests [0;32mOK[0m 
      test-remify.R.................    2 tests [0;32mOK[0m 
      test-remify.R.................    3 tests [0;32mOK[0m 
      test-remify.R.................    4 tests [0;32mOK[0m 
      test-remify.R.................    5 tests [0;32mOK[0m 
      test-remify.R.................    6 tests [0;32mOK[0m 
      test-remify.R.................    7 tests [0;32mOK[0m 
      test-remify.R.................    8 tests [0;32mOK[0m 
      test-remify.R.................    9 tests [0;32mOK[0m 
      test-remify.R.................   10 tests [0;32mOK[0m 
      test-remify.R.................   10 tests [0;32mOK[0m 
      test-remify.R.................   10 tests [0;32mOK[0m 
      test-remify.R.................   10 tests [0;32mOK[0m 
      test-remify.R.................   11 tests [0;32mOK[0m 
      test-remify.R.................   12 tests [0;32mOK[0m 
      test-remify.R.................   13 tests [0;32mOK[0m 
      test-remify.R.................   13 tests [0;32mOK[0m 
      test-remify.R.................   13 tests [0;32mOK[0m 
      test-remify.R.................   14 tests [0;32mOK[0m 
      test-remify.R.................   15 tests [0;32mOK[0m 
      test-remify.R.................   15 tests [0;32mOK[0m 
      test-remify.R.................   15 tests [0;32mOK[0m 
      test-remify.R.................   15 tests [0;32mOK[0m 
      test-remify.R.................   16 tests [0;32mOK[0m 
      test-remify.R.................   17 tests [0;32mOK[0m 
      test-remify.R.................   17 tests [0;32mOK[0m 
      test-remify.R.................   17 tests [0;32mOK[0m 
      test-remify.R.................   17 tests [0;32mOK[0m 
      test-remify.R.................   18 tests [0;32mOK[0m 
      test-remify.R.................   19 tests [0;32mOK[0m 
      test-remify.R.................   19 tests [0;32mOK[0m 
      test-remify.R.................   19 tests [0;32mOK[0m 
      test-remify.R.................   19 tests [0;32mOK[0m 
      test-remify.R.................   20 tests [0;32mOK[0m 
      test-remify.R.................   20 tests [0;32mOK[0m 
      test-remify.R.................   21 tests [0;32mOK[0m 
      test-remify.R.................   21 tests [0;32mOK[0m 
      test-remify.R.................   21 tests [0;32mOK[0m 
      test-remify.R.................   21 tests [0;32mOK[0m 
      test-remify.R.................   21 tests [0;32mOK[0m 
      test-remify.R.................   22 tests [0;32mOK[0m 
      test-remify.R.................   22 tests [0;32mOK[0m 
      test-remify.R.................   23 tests [0;32mOK[0m 
      test-remify.R.................   23 tests [0;32mOK[0m 
      test-remify.R.................   23 tests [0;32mOK[0m 
      test-remify.R.................   23 tests [0;32mOK[0m 
      test-remify.R.................   24 tests [0;32mOK[0m 
      test-remify.R.................   24 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   25 tests [0;32mOK[0m 
      test-remify.R.................   26 tests [0;32mOK[0m 
      test-remify.R.................   26 tests [0;32mOK[0m 
      test-remify.R.................   26 tests [0;32mOK[0m 
      test-remify.R.................   27 tests [0;32mOK[0m 
      test-remify.R.................   27 tests [0;32mOK[0m 
      test-remify.R.................   27 tests [0;32mOK[0m 
      test-remify.R.................   27 tests [0;32mOK[0m 
      test-remify.R.................   28 tests [0;32mOK[0m 
      test-remify.R.................   29 tests [0;32mOK[0m 
      test-remify.R.................   30 tests [0;32mOK[0m 
      test-remify.R.................   30 tests [0;32mOK[0m 
      test-remify.R.................   31 tests [0;32mOK[0m 
      test-remify.R.................   31 tests [0;32mOK[0m 
      test-remify.R.................   32 tests [0;32mOK[0m 
      test-remify.R.................   32 tests [0;32mOK[0m 
      test-remify.R.................   33 tests [0;32mOK[0m 
      test-remify.R.................   33 tests [0;32mOK[0m 
      test-remify.R.................   34 tests [0;32mOK[0m 
      test-remify.R.................   34 tests [0;32mOK[0m 
      test-remify.R.................   34 tests [0;32mOK[0m 
      test-remify.R.................   34 tests [0;32mOK[0m 
      test-remify.R.................   34 tests [0;32mOK[0m 
      test-remify.R.................   35 tests [0;32mOK[0m 
      test-remify.R.................   35 tests [0;32mOK[0m 
      test-remify.R.................   36 tests [0;32mOK[0m 
      test-remify.R.................   37 tests [0;32mOK[0m 
      test-remify.R.................   38 tests [0;32mOK[0m 
      test-remify.R.................   39 tests [0;32mOK[0m 
      test-remify.R.................   40 tests [0;32mOK[0m 
      test-remify.R.................   41 tests [0;32mOK[0m 
      test-remify.R.................   42 tests [0;32mOK[0m 
      test-remify.R.................   43 tests [0;32mOK[0m 
      test-remify.R.................   44 tests [0;32mOK[0m 
      test-remify.R.................   45 tests [0;32mOK[0m 
      test-remify.R.................   45 tests [0;32mOK[0m 
      test-remify.R.................   45 tests [0;32mOK[0m 
      test-remify.R.................   46 tests [0;32mOK[0m 
      test-remify.R.................   47 tests [0;32mOK[0m 
      test-remify.R.................   47 tests [0;32mOK[0m 
      test-remify.R.................   47 tests [0;32mOK[0m 
      test-remify.R.................   48 tests [0;32mOK[0m 
      test-remify.R.................   49 tests [0;32mOK[0m 
      test-remify.R.................   49 tests [0;32mOK[0m 
      test-remify.R.................   50 tests [0;32mOK[0m 
      test-remify.R.................   51 tests [0;32mOK[0m 
      test-remify.R.................   51 tests [0;32mOK[0m 
      test-remify.R.................   52 tests [0;32mOK[0m 
      test-remify.R.................   53 tests [0;32mOK[0m 
      test-remify.R.................   53 tests [0;32mOK[0m 
      test-remify.R.................   54 tests [0;32mOK[0m 
      test-remify.R.................   55 tests [0;32mOK[0m 
      test-remify.R.................   55 tests [0;32mOK[0m 
      test-remify.R.................   55 tests [0;32mOK[0m 
      test-remify.R.................   55 tests [0;32mOK[0m 
      test-remify.R.................   55 tests [0;32mOK[0m 
      test-remify.R.................   56 tests [0;32mOK[0m 
      test-remify.R.................   56 tests [0;32mOK[0m 
      test-remify.R.................   57 tests [0;32mOK[0m 
      test-remify.R.................   57 tests [0;32mOK[0m 
      test-remify.R.................   57 tests [0;32mOK[0m 
      test-remify.R.................   58 tests [0;32mOK[0m 
      test-remify.R.................   58 tests [0;32mOK[0m 
      test-remify.R.................   59 tests [0;32mOK[0m 
      test-remify.R.................   59 tests [0;32mOK[0m 
      test-remify.R.................   59 tests [0;32mOK[0m 
      test-remify.R.................   59 tests [0;32mOK[0m 
      test-remify.R.................   60 tests [0;32mOK[0m 
      test-remify.R.................   60 tests [0;32mOK[0m 
      test-remify.R.................   61 tests [0;32mOK[0m 
      test-remify.R.................   61 tests [0;32mOK[0m 
      test-remify.R.................   61 tests [0;32mOK[0m 
      test-remify.R.................   62 tests [0;32mOK[0m 
      test-remify.R.................   62 tests [0;32mOK[0m 
      test-remify.R.................   63 tests [0;32mOK[0m [0;34m0.6s[0m
      ----- FAILED[xcpt]: test-remify-methods.R<349--349>
       call| expect_silent(plot(x = out))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<350--350>
       call| expect_silent(plot(x = out, breaks = NULL, palette = NULL, n_intervals = NULL, 
       call| -->    rev = NULL, actors = NULL, pch.degree = NULL, igraph.edge.color = NULL, 
       call| -->    igraph.vertex.color = NULL))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<351--351>
       call| expect_silent(plot(x = out, pch.degree = -1))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<352--352>
       call| expect_silent(plot(x = out, igraph.edge.color = "#000000000", 
       call| -->    igraph.vertex.color = "#000000000"))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<353--353>
       call| expect_silent(plot(x = out, igraph.edge.color = "magenta", igraph.vertex.color = "cyan4"))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<354--354>
       call| expect_silent(plot(x = out, n_intervals = 5))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<355--355>
       call| expect_silent(plot(x = out, actors = attr(out, "dictionary")$actors$actorName[1:5]))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<362--362>
       call| expect_silent(plot(x = out))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<363--363>
       call| expect_silent(plot(x = out, n_intervals = 5))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      ----- FAILED[xcpt]: test-remify-methods.R<364--364>
       call| expect_silent(plot(x = out, actors = attr(out, "dictionary")$actors$actorName[1:5]))
       diff| Execution was not silent. A warning was thrown with message
       diff| 'vertex attribute frame.color contains NAs. Replacing with default value black'
      Error: 10 out of 254 tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.2Mb
      sub-directories of 1Mb or more:
        doc    3.5Mb
        libs   4.8Mb
    ```

# riverconn

<details>

* Version: 0.3.31
* GitHub: https://github.com/damianobaldan/riverconn
* Source code: https://github.com/cran/riverconn
* Date/Publication: 2024-01-23 10:30:02 UTC
* Number of recursive dependencies: 87

Run `revdepcheck::cloud_details(, "riverconn")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘riverconn-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: B_ij_fun
    > ### Title: Calculates B_ij: the functional contribution to dispersal
    > ###   probability I_ij
    > ### Aliases: B_ij_fun
    > 
    > ### ** Examples
    > 
    > library(igraph)
    
    Attaching package: ‘igraph’
    
    The following objects are masked from ‘package:stats’:
    
        decompose, spectrum
    
    The following object is masked from ‘package:base’:
    
        union
    
    > g <- igraph::graph_from_literal(1-+2, 2-+5, 3-+4, 4-+5, 6-+7, 7-+10, 8-+9, 9-+10,
    + 5-+11, 11-+12, 10-+13, 13-+12, 12-+14, 14-+15, 15-+16)
    > E(g)$id_dam <- c("1", NA, "2", "3", NA, "4", NA, "5", "6", NA,  NA, NA, NA, "7", NA)
    > E(g)$type <- ifelse(is.na(E(g)$id_dam), "joint", "dam")
    > V(g)$length <- c(1, 1, 2, 3, 4, 1, 5, 1, 7, 7, 3, 2, 4, 5, 6, 9)
    > V(g)$HSI <- c(0.2, 0.1, 0.3, 0.4, 0.5, 0.5, 0.5, 0.6, 0.7, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8)
    > V(g)$Id <- V(g)$name
    > E(g)$pass_u <- E(g)$pass_d <- ifelse(!is.na(E(g)$id_dam),0.1,NA)
    > dist_mat <- B_ij_fun(g, param = 0.9)
    Error in `igraph::graph_from_data_frame()`:
    ! Cannot create a graph object because the edge data frame contains NAs.
    Backtrace:
        ▆
     1. └─riverconn::B_ij_fun(g, param = 0.9)
     2.   └─riverconn:::set_B_directionality(...)
     3.     └─igraph::graph_from_data_frame(d = graph_e_df, vertices = graph_v_df)
     4.       └─igraph:::ensure_no_na(d, "edge data frame")
     5.         └─cli::cli_abort(...)
     6.           └─rlang::abort(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Tutorial.Rmd’ using rmarkdown
    ```

# rsetse

<details>

* Version: 0.5.0
* GitHub: https://github.com/JonnoB/rSETSe
* Source code: https://github.com/cran/rsetse
* Date/Publication: 2021-06-11 10:00:02 UTC
* Number of recursive dependencies: 79

Run `revdepcheck::cloud_details(, "rsetse")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rsetse-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: calc_spring_area
    > ### Title: Calculate the cross sectional area of the edge
    > ### Aliases: calc_spring_area
    > 
    > ### ** Examples
    > 
    >  
    > 
    > library(igraph)
    
    Attaching package: ‘igraph’
    
    The following objects are masked from ‘package:stats’:
    
        decompose, spectrum
    
    The following object is masked from ‘package:base’:
    
        union
    
    > set.seed(234)
    > g_prep <- generate_peels_network("A") %>%
    +  set.edge.attribute(., name = "edge_characteristic", value = rep(1:16, each = 10))
    Warning: `set.edge.attribute()` was deprecated in igraph 2.0.0.
    ℹ Please use `set_edge_attr()` instead.
    Error in `igraph::graph_from_adjacency_matrix()`:
    ! Cannot create a graph object because the adjacency matrix contains
      NAs.
    Backtrace:
         ▆
      1. ├─generate_peels_network("A") %>% ...
      2. ├─igraph::set.edge.attribute(...)
      3. │ ├─igraph::set_edge_attr(...)
      4. │ │ └─igraph:::is_complete_iterator(index)
      5. │ └─igraph::E(graph)
      6. │   └─igraph:::ensure_igraph(graph)
      7. └─rsetse::generate_peels_network("A")
      8.   └─rsetse:::generate_peels_network_internal(type, k_values)
      9.     └─igraph::graph_from_adjacency_matrix(...)
     10.       └─igraph:::ensure_no_na(adjmatrix, "adjacency matrix")
     11.         └─cli::cli_abort(...)
     12.           └─rlang::abort(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Categorical-and-continuous-features.Rmd’ using rmarkdown
    ```

# sharpshootR

<details>

* Version: 2.3.3
* GitHub: https://github.com/ncss-tech/sharpshootR
* Source code: https://github.com/cran/sharpshootR
* Date/Publication: 2025-04-17 06:50:02 UTC
* Number of recursive dependencies: 146

Run `revdepcheck::cloud_details(, "sharpshootR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sharpshootR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: table5.2
    > ### Title: Table 5.2 from Hole and Campbell, 1985.
    > ### Aliases: table5.2
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > 
    > data("table5.2")
    > 
    > if(requireNamespace("igraph")) {
    +   
    +   # note special incantation to get the "correct" graph structure
    +   g <- igraph::graph_from_adjacency_matrix(table5.2, mode = 'upper', diag = FALSE, weighted = TRUE)
    +   
    +   # visualize
    +   op <- par(no.readonly = TRUE)
    +   
    +   par(mar = c(0,0,0,0))
    +   plot(g)
    +   
    +   plot(g, vertex.size = sqrt(igraph::degree(g) * 25), vertex.label.family = 'sans')
    +   
    +   # find communities
    +   cm <- igraph::cluster_walktrap(g)
    +   plot(cm, g, vertex.label.family = 'sans')
    +   
    +   par(op)
    + }
    Error in `igraph::graph_from_adjacency_matrix()`:
    ! Cannot create a graph object because the adjacency matrix contains
      NAs.
    Backtrace:
        ▆
     1. └─igraph::graph_from_adjacency_matrix(table5.2, mode = "upper", diag = FALSE, weighted = TRUE)
     2.   └─igraph:::ensure_no_na(adjmatrix, "adjacency matrix")
     3.     └─cli::cli_abort(...)
     4.       └─rlang::abort(...)
    Execution halted
    ```

# SpaDES.core

<details>

* Version: 2.1.0
* GitHub: https://github.com/PredictiveEcology/SpaDES.core
* Source code: https://github.com/cran/SpaDES.core
* Date/Publication: 2024-06-02 11:02:47 UTC
* Number of recursive dependencies: 132

Run `revdepcheck::cloud_details(, "SpaDES.core")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SpaDES.core-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: moduleMetadata
    > ### Title: Parse and extract module metadata
    > ### Aliases: moduleMetadata
    > ###   moduleMetadata,missing,character,character-method
    > ###   moduleMetadata,missing,character,missing-method
    > ###   moduleMetadata,ANY,ANY,ANY-method
    > 
    > ### ** Examples
    > 
    > ## turn off code checking -- don't need it here
    > opts <- options("spades.moduleCodeChecks" = FALSE,
    +                 "spades.useRequire" = FALSE)
    > 
    > path <- getSampleModules(tempdir())
    > sampleModules <- dir(path)
    > x <- moduleMetadata(sampleModules[3], path = path)
    Assuming sim is a module name
    Error in `graph_from_data_frame()`:
    ! Cannot create a graph object because the edge data frame contains NAs.
    Backtrace:
         ▆
      1. ├─SpaDES.core::moduleMetadata(sampleModules[3], path = path)
      2. └─SpaDES.core::moduleMetadata(sampleModules[3], path = path)
      3.   ├─SpaDES.core::moduleMetadata(module = sim, path = path, defineModuleListItems = defineModuleListItems)
      4.   └─SpaDES.core::moduleMetadata(module = sim, path = path, defineModuleListItems = defineModuleListItems)
      5.     └─SpaDES.core (local) .local(module = module, path = path, defineModuleListItems = defineModuleListItems)
      6.       └─base::lapply(...)
      7.         └─SpaDES.core (local) FUN(X[[i]], ...)
      8.           ├─SpaDES.core::.parseModulePartial(...)
      9.           └─SpaDES.core::.parseModulePartial(...)
     10.             └─SpaDES.core (local) .local(...)
     11.               ├─base::suppressMessages(...)
     12.               │ └─base::withCallingHandlers(...)
     13.               ├─SpaDES.core::simInit(modules = m, paths = list(modulePath = dirname(dirname(filename))))
     14.               └─SpaDES.core::simInit(modules = m, paths = list(modulePath = dirname(dirname(filename))))
     15.                 ├─SpaDES.core::simInit(...)
     16.                 └─SpaDES.core::simInit(...)
     17.                   ├─base::withCallingHandlers(...)
     18.                   └─SpaDES.core:::resolveDepsRunInitIfPoss(...)
     19.                     ├─SpaDES.core::depsGraph(sim, plot = FALSE)
     20.                     └─SpaDES.core::depsGraph(sim, plot = FALSE)
     21.                       ├─SpaDES.core::.depsPruneEdges(depsEdgeList(sim, plot))
     22.                       └─SpaDES.core::.depsPruneEdges(depsEdgeList(sim, plot))
     23.                         └─igraph::graph_from_data_frame(simEdgeList)
     24.                           └─igraph:::ensure_no_na(d, "edge data frame")
     25.                             └─cli::cli_abort(...)
     26.                               └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Complete output:
      > library(testthat)
      > aa <- options(spades.debug = FALSE)
      > options("spades.temp.debug" = aa)
      > if (FALSE) {
      +   ff <- list()
      +   runTestsWithTimings("ff")
      + }
      > test_check("SpaDES.core")
      Loading required package: SpaDES.core
      Loading required package: quickPlot
      Loading required package: reproducible
      
      Attaching package: 'SpaDES.core'
      
      The following objects are masked from 'package:stats':
      
          end, start
      
      The following object is masked from 'package:utils':
      
          citation
      
      trying URL 'https://img.shields.io/badge/Made%20with-Markdown-1f425f.png'
      Content type 'image/png' length 2664 bytes
      ==================================================
      downloaded 2664 bytes
      
      [ FAIL 7 | WARN 0 | SKIP 29 | PASS 425 ]
      
      ══ Skipped tests (29) ══════════════════════════════════════════════════════════
      • GLPK not available on Linux (1): 'test-module-deps-methods.R:226:7'
      • On CRAN (23): 'test-1memory.R:3:3', 'test-Plots.R:2:3', 'test-cache.R:2:3',
        'test-cache.R:239:3', 'test-cache.R:658:3', 'test-checkpoint.R:2:3',
        'test-checkpoint.R:46:3', 'test-downloadData.R:2:3',
        'test-downloadModule.R:2:3', 'test-downloadModule.R:33:3',
        'test-downloadModule.R:64:3', 'test-downloadModule.R:106:3',
        'test-futureEvents.R:2:3', 'test-load.R:115:3', 'test-load.R:320:3',
        'test-mod.R:152:3', 'test-module-deps-methods.R:117:3', 'test-save.R:2:3',
        'test-simList.R:223:3', 'test-simList.R:328:3', 'test-simList.R:345:3',
        'test-simulation.R:2:3', 'test-timeunits.R:81:3'
      • benchmarking DES (1): 'test-simulation.R:248:3'
      • empty test (1): 'test-Plots.R:116:1'
      • interactive() is not TRUE (1): 'test-Plots.R:202:3'
      • restartR not possible in automated tests (1): 'test-save.R:366:3'
      • restartR with logging not possible in automated tests (1):
        'test-save.R:454:3'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-cache.R:477:3'): Cache sim objs via .Cache attr ────────────────
      Error in `graph_from_data_frame(simEdgeList)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─SpaDES.core::simInit(...) at test-cache.R:477:3
        2. └─SpaDES.core::simInit(...)
        3.   ├─SpaDES.core::simInit(...)
        4.   └─SpaDES.core::simInit(...)
        5.     ├─base::withCallingHandlers(...)
        6.     └─SpaDES.core:::resolveDepsRunInitIfPoss(...)
        7.       ├─SpaDES.core::depsGraph(sim, plot = FALSE)
        8.       └─SpaDES.core::depsGraph(sim, plot = FALSE)
        9.         ├─SpaDES.core::.depsPruneEdges(depsEdgeList(sim, plot))
       10.         └─SpaDES.core::.depsPruneEdges(depsEdgeList(sim, plot))
       11.           └─igraph::graph_from_data_frame(simEdgeList)
       12.             └─igraph:::ensure_no_na(d, "edge data frame")
       13.               └─cli::cli_abort(...)
       14.                 └─rlang::abort(...)
      ── Error ('test-conditionalEvents.R:70:3'): simulation runs with simInit and spades ──
      Error in `graph_from_data_frame(simEdgeList)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─SpaDES.core::simInit(...) at test-conditionalEvents.R:70:3
        2. └─SpaDES.core::simInit(...)
        3.   ├─SpaDES.core::simInit(...)
        4.   └─SpaDES.core::simInit(...)
        5.     ├─base::withCallingHandlers(...)
        6.     └─SpaDES.core:::resolveDepsRunInitIfPoss(...)
        7.       ├─SpaDES.core::depsGraph(sim, plot = FALSE)
        8.       └─SpaDES.core::depsGraph(sim, plot = FALSE)
        9.         ├─SpaDES.core::.depsPruneEdges(depsEdgeList(sim, plot))
       10.         └─SpaDES.core::.depsPruneEdges(depsEdgeList(sim, plot))
       11.           └─igraph::graph_from_data_frame(simEdgeList)
       12.             └─igraph:::ensure_no_na(d, "edge data frame")
       13.               └─cli::cli_abort(...)
       14.                 └─rlang::abort(...)
      ── Error ('test-mod.R:15:3'): local mod object ─────────────────────────────────
      Error in `graph_from_data_frame(simEdgeList)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─SpaDES.core::simInit(...) at test-mod.R:15:3
        2. └─SpaDES.core::simInit(...)
        3.   ├─SpaDES.core::simInit(...)
        4.   └─SpaDES.core::simInit(...)
        5.     ├─base::withCallingHandlers(...)
        6.     └─SpaDES.core:::resolveDepsRunInitIfPoss(...)
        7.       ├─SpaDES.core::depsGraph(sim, plot = FALSE)
        8.       └─SpaDES.core::depsGraph(sim, plot = FALSE)
        9.         ├─SpaDES.core::.depsPruneEdges(depsEdgeList(sim, plot))
       10.         └─SpaDES.core::.depsPruneEdges(depsEdgeList(sim, plot))
       11.           └─igraph::graph_from_data_frame(simEdgeList)
       12.             └─igraph:::ensure_no_na(d, "edge data frame")
       13.               └─cli::cli_abort(...)
       14.                 └─rlang::abort(...)
      ── Error ('test-multipleModulePaths.R:72:3'): simulation runs with simInit and spades ──
      Error in `(function (cond) 
      .Internal(C_tryCatchHelper(addr, 1L, cond)))(structure(list(message = "Cannot create a graph object because the edge data frame contains NAs.", 
          trace = structure(list(call = list(spades(simInit(times, 
              params, modules = modules, objects = list(), paths), 
              debug = FALSE), simInit(times, params, modules = modules, 
              objects = list(), paths), simInit(times, params, modules = modules, 
              objects = list(), paths), simInit(times = li$times, params = li$params, 
              modules = li$modules, objects = li$objects, paths = li$paths, 
              inputs = li$inputs, outputs = li$outputs, loadOrder = li$loadOrder, 
              notOlderThan = li$notOlderThan, ...), simInit(times = li$times, 
              params = li$params, modules = li$modules, objects = li$objects, 
              paths = li$paths, inputs = li$inputs, outputs = li$outputs, 
              loadOrder = li$loadOrder, notOlderThan = li$notOlderThan, 
              ...), withCallingHandlers({
              simDTthreads <- getOption("spades.DTthreads", 1L)
              message("Using setDTthreads(", simDTthreads, "). To change: 'options(spades.DTthreads = X)'.")
              origDTthreads <- setDTthreads(simDTthreads)
              on.exit(setDTthreads(origDTthreads), add = TRUE)
              allTimeUnits <- FALSE
              parentChildGraph <- as.data.frame(buildParentChildGraph(sim, 
                  modules(sim), childModules = childModules))
              timeunits <- findSmallestTU(sim, modulePaths, childModules)
              if (!is.null(times$unit)) {
                  message(paste0("times contains 'unit', rather than 'timeunit'. ", 
                      "Using \"", times$unit, "\" as timeunit"))
                  times$timeunit <- times$unit
                  times$unit <- NULL
              }
              timeunit(sim) <- if (!is.null(times$timeunit)) {
                  times$timeunit
              }
              else {
                  minTimeunit(timeunits)
              }
              timestep <- inSeconds(sim@simtimes[["timeunit"]], sim@.xData)
              times(sim) <- list(current = times$start * timestep, 
                  start = times$start * timestep, end = times$end * 
                      timestep, timeunit = sim@simtimes[["timeunit"]])
              if (NROW(inputs)) {
                  inputs <- .fillInputRows(inputs, startTime = start(sim))
              }
              sim$.userSuppliedObjNames <- c(objNames, inputs$objectName)
              sim@params$.globals <- params$.globals
              core <- .pkgEnv$.coreModules
              if (is.null(params$.restartR$.restartRInterval) && getOption("spades.restartRInterval", 
                  0) == 0) {
                  core <- setdiff(core, "restartR")
              }
              else {
                  restartDir <- checkAndSetRestartDir(sim = sim)
              }
              modulesLoaded <- append(modulesLoaded, core)
              all_parsed <- FALSE
              while (!all_parsed) {
                  sim <- .parseModule(sim, as.list(sim@modules), userSuppliedObjNames = sim$.userSuppliedObjNames, 
                      envir = sim@.xData[[".parsedFiles"]], notOlderThan = notOlderThan, 
                      params = params, objects = objects, paths = paths)
                  if (length(.unparsed(sim@modules)) == 0) {
                      all_parsed <- TRUE
                  }
              }
              if (length(sim@params$.globals)) {
                  sim <- updateParamsFromGlobals(sim, dontUseGlobals = params)
              }
              if (!is.null(names(sim@depends@dependencies))) {
                  names(sim@depends@dependencies) <- unlist(lapply(sim@depends@dependencies, 
                      function(x) x@name))
              }
              for (c in core) {
                  sim <- scheduleEvent(sim, start(sim, unit = sim@simtimes[["timeunit"]]), 
                      c, "init", .first() - 1)
              }
              omit <- c(which(core == "load"), which(core == "save"))
              pnames <- unique(c(paste0(".", core[-omit]), names(sim@params)))
              if (is.null(params$.progress) || any(is.na(params$.progress))) {
                  params$.progress <- .pkgEnv$.progressEmpty
              }
              tmp <- list()
              lapply(pnames, function(x) {
                  tmp[[x]] <<- suppressWarnings(modifyList2(sim@params[[x]], 
                      params[[x]]))
              })
              sim@params <- tmp
              sim@.xData$._ranInitDuringSimInit <- character()
              if (!all(length(loadOrder), all(sim@modules %in% loadOrder), 
                  all(loadOrder %in% sim@modules))) {
                  sim <- resolveDepsRunInitIfPoss(sim, modules, paths, 
                      params, objects, inputs, outputs)
                  if (length(sim@completed)) 
                      sim@.xData$._ranInitDuringSimInit <- setdiff(completed(sim)$module, 
                        .coreModules())
                  loadOrder <- unlist(unname(sim@modules))
              }
              mBase <- basename2(unlist(sim@modules))
              loadOrderBase <- basename2(loadOrder)
              names(loadOrder) <- names(unlist(sim@modules))[na.omit(match(mBase, 
                  loadOrderBase))]
              loadOrder[] <- loadOrderBase
              loadOrderNames <- names(loadOrder)
              if (!is.null(objects$objectSynonyms)) {
                  sim$objectSynonyms <- objects$objectSynonyms
                  sim <- .checkObjectSynonyms(sim)
              }
              makeSimListActiveBindings(sim)
              for (m in loadOrder) {
                  mFullPath <- loadOrderNames[match(m, loadOrder)]
                  needInitAndInputObjects <- TRUE
                  if (length(sim@.xData$._ranInitDuringSimInit)) {
                      if (m %in% sim@.xData$._ranInitDuringSimInit) 
                        needInitAndInputObjects <- FALSE
                  }
                  if (needInitAndInputObjects) 
                      if (isTRUE(getOption("spades.dotInputObjects", 
                        TRUE))) {
                        if (is.character(getOption("spades.covr", FALSE))) {
                          mod <- getOption("spades.covr")
                          tf <- tempfile()
                          if (is.null(notOlderThan)) 
                            notOlderThan <- "NULL"
                          cat(file = tf, paste0("simOut <- .runModuleInputObjects(sim, '", 
                            m, "', notOlderThan = ", notOlderThan, 
                            ")"))
                          if (length(objects)) 
                            list2env(objects, envir(sim))
                          sim$.mods[[mod]]$sim <- sim
                          aa <- covr::environment_coverage(sim$.mods[[mod]], 
                            test_files = tf)
                          sim <- sim$.mods[[mod]]$sim
                          rm(list = "sim", envir = sim$.mods[[mod]])
                          if (is.null(.pkgEnv$._covr)) 
                            .pkgEnv$._covr <- list()
                          .pkgEnv$._covr <- append(.pkgEnv$._covr, 
                            list(aa))
                        }
                        else {
                          sim <- .runModuleInputObjects(sim, m, objects, 
                            notOlderThan)
                          cur <- list(eventTime = sim@simtimes$current, 
                            moduleName = m, eventType = ".inputObjects", 
                            eventPriority = 0)
                          sim <- appendCompleted(sim, cur)
                        }
                      }
                  if (needInitAndInputObjects) 
                      sim <- scheduleEvent(sim, sim@simtimes[["start"]], 
                        m, "init", .first())
                  names(m) <- mFullPath
                  modulesLoaded <- append(modulesLoaded, m)
                  if (is.null(sim@params[[m]])) {
                      sim@params[[m]] <- list(.tmp = NA_real_)
                  }
                  for (x in dotParamsReal) {
                      if (is.null(sim@params[[m]][[x]])) {
                        sim@params[[m]][[x]] <- NA_real_
                      }
                      else if (isTRUE(all(is.na(sim@params[[m]][[x]])))) {
                        if (length(sim@params[[m]][[x]]) > 1) 
                          sim@params[[m]][[x]] <- NA_real_
                      }
                  }
                  sim@params[[m]]$.tmp <- NULL
              }
              if (all(append(core, loadOrderBase) %in% basename2(unlist(modulesLoaded)))) {
                  modules(sim) <- modulesLoaded
              }
              else {
                  stop("There was a problem loading some modules.")
              }
              attr(sim@modules, "modulesGraph") <- parentChildGraph
              if (length(objects)) {
                  if (is.list(objects)) {
                      if (length(objNames) == length(objects)) {
                        objs(sim) <- objects
                      }
                      else {
                        stop(paste("objects must be a character vector of object names", 
                          "to retrieve from the .GlobalEnv, or a named list of", 
                          "objects"))
                      }
                  }
                  else {
                      newInputs <- .fillInputRows(data.frame(objectName = objNames, 
                        loadTime = as.numeric(sim@simtimes[["current"]]), 
                        stringsAsFactors = FALSE), startTime = start(sim))
                      inputs(sim) <- newInputs
                  }
              }
              if (NROW(inputs) | NROW(inputs(sim))) {
                  inputs(sim) <- rbind(inputs(sim), inputs)
                  if (NROW(events(sim)[moduleName == "load" & eventType == 
                      "inputs" & eventTime == start(sim)]) > 0) {
                      sim <- doEvent.load(sim, sim@simtimes[["current"]], 
                        "inputs")
                      events(sim) <- events(sim)[!(eventTime == time(sim) & 
                        moduleName == "load" & eventType == "inputs"), 
                        ]
                  }
                  if (any(events(sim)[["eventTime"]] < start(sim))) {
                      warning(paste0("One or more objects in the inputs filelist was ", 
                        "scheduled to load before start(sim). ", "It is being be removed and not loaded. To ensure loading, loadTime ", 
                        "must be start(sim) or later. See examples using ", 
                        "loadTime in ?simInit"))
                      events(sim) <- events(sim)[eventTime >= start(sim)]
                  }
              }
              if (length(outputs)) {
                  outputs(sim) <- outputs
              }
              checkParams(sim, dotParams, unlist(sim@paths[["modulePath"]]))
              sim <- elapsedTimeInSimInit(._startClockTime, sim)
              ._startClockTime <- Sys.time()
          }, message = function(m) {
              message(loggingMessage(m$message, prefix = prefixSimInit))
              tryCatch(invokeRestart("muffleMessage"), error = function(e) NULL)
          }, warning = function(w) {
              if (grepl("In .+:", w$message)) {
                  warningSplitOnColon(w)
                  invokeRestart("muffleWarning")
              }
          }), resolveDepsRunInitIfPoss(sim, modules, paths, params, 
              objects, inputs, outputs), depsGraph(sim, plot = FALSE), 
              depsGraph(sim, plot = FALSE), .depsPruneEdges(depsEdgeList(sim, 
                  plot)), .depsPruneEdges(depsEdgeList(sim, plot)), 
              graph_from_data_frame(simEdgeList), ensure_no_na(d, "edge data frame"), 
              cli::cli_abort("Cannot create a graph object because the {what} contains NAs.", 
                  call = call), rlang::abort(message, ..., call = call, 
                  use_cli_format = TRUE, .frame = .frame)), parent = c(0L, 
          0L, 0L, 3L, 3L, 5L, 5L, 7L, 7L, 9L, 9L, 11L, 12L, 13L, 14L
          ), visible = c(TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 
          TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE), namespace = c("SpaDES.core", 
          "SpaDES.core", "SpaDES.core", "SpaDES.core", "SpaDES.core", 
          "base", "SpaDES.core", "SpaDES.core", "SpaDES.core", "SpaDES.core", 
          "SpaDES.core", "igraph", "igraph", "cli", "rlang"), scope = c("::", 
          "::", "::", "::", "::", "::", ":::", "::", "::", "::", "::", 
          "::", ":::", "::", "::"), error_frame = c(FALSE, FALSE, FALSE, 
          FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, 
          FALSE, FALSE, FALSE)), row.names = c(NA, -15L), version = 2L, class = c("rlang_trace", 
          "rlib_trace", "tbl", "data.frame")), parent = NULL, rlang = list(
              inherit = TRUE), call = graph_from_data_frame(simEdgeList), 
          use_cli_format = TRUE), class = c("rlang_error", "error", 
      "condition")))`: error in evaluating the argument 'sim' in selecting a method for function 'spades': Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─SpaDES.core::spades(...) at test-multipleModulePaths.R:72:3
        2. ├─SpaDES.core::simInit(...)
        3. ├─SpaDES.core::simInit(...)
        4. │ ├─SpaDES.core::simInit(...)
        5. │ └─SpaDES.core::simInit(...)
        6. │   ├─base::withCallingHandlers(...)
        7. │   └─SpaDES.core:::resolveDepsRunInitIfPoss(...)
        8. │     ├─SpaDES.core::depsGraph(sim, plot = FALSE)
        9. │     └─SpaDES.core::depsGraph(sim, plot = FALSE)
       10. │       ├─SpaDES.core::.depsPruneEdges(depsEdgeList(sim, plot))
       11. │       └─SpaDES.core::.depsPruneEdges(depsEdgeList(sim, plot))
       12. │         └─igraph::graph_from_data_frame(simEdgeList)
       13. │           └─igraph:::ensure_no_na(d, "edge data frame")
       14. │             └─cli::cli_abort(...)
       15. │               └─rlang::abort(...)
       16. │                 └─rlang:::signal_abort(cnd, .file)
       17. │                   └─base::signalCondition(cnd)
       18. └─base (local) `<fn>`(`<rlng_rrr>`)
      ── Error ('test-simList.R:394:3'): inputObjects on module arg not sim ──────────
      Error in `graph_from_data_frame(simEdgeList)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─SpaDES.core::inputObjects(module = modules, path = paths$modulePath) at test-simList.R:394:3
        2. └─SpaDES.core::inputObjects(module = modules, path = paths$modulePath)
        3.   └─SpaDES.core:::inputOrOutputObjects(...)
        4.     └─base::lapply(...)
        5.       └─SpaDES.core (local) FUN(X[[i]], ...)
        6.         ├─SpaDES.core::moduleMetadata(module = m, path = path, defineModuleListItems = type)
        7.         └─SpaDES.core::moduleMetadata(module = m, path = path, defineModuleListItems = type)
        8.           └─SpaDES.core (local) .local(module = module, path = path, defineModuleListItems = defineModuleListItems)
        9.             └─base::lapply(...)
       10.               └─SpaDES.core (local) FUN(X[[i]], ...)
       11.                 ├─SpaDES.core::.parseModulePartial(...)
       12.                 └─SpaDES.core::.parseModulePartial(...)
       13.                   └─SpaDES.core (local) .local(...)
       14.                     ├─base::suppressMessages(...)
       15.                     │ └─base::withCallingHandlers(...)
       16.                     ├─SpaDES.core::simInit(modules = m, paths = list(modulePath = dirname(dirname(filename))))
       17.                     └─SpaDES.core::simInit(modules = m, paths = list(modulePath = dirname(dirname(filename))))
       18.                       ├─SpaDES.core::simInit(...)
       19.                       └─SpaDES.core::simInit(...)
       20.                         ├─base::withCallingHandlers(...)
       21.                         └─SpaDES.core:::resolveDepsRunInitIfPoss(...)
       22.                           ├─SpaDES.core::depsGraph(sim, plot = FALSE)
       23.                           └─SpaDES.core::depsGraph(sim, plot = FALSE)
       24.                             ├─SpaDES.core::.depsPruneEdges(depsEdgeList(sim, plot))
       25.                             └─SpaDES.core::.depsPruneEdges(depsEdgeList(sim, plot))
       26.                               └─igraph::graph_from_data_frame(simEdgeList)
       27.                                 └─igraph:::ensure_no_na(d, "edge data frame")
       28.                                   └─cli::cli_abort(...)
       29.                                     └─rlang::abort(...)
      ── Error ('test-simulation.R:539:3'): conflicting function types ───────────────
      Error in `graph_from_data_frame(simEdgeList)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─testthat::capture_messages(...) at test-simulation.R:539:3
        2. │ └─base::withCallingHandlers(...)
        3. ├─SpaDES.core::simInit(paths = list(modulePath = tmpdir), modules = m)
        4. └─SpaDES.core::simInit(paths = list(modulePath = tmpdir), modules = m)
        5.   ├─SpaDES.core::simInit(...)
        6.   └─SpaDES.core::simInit(...)
        7.     ├─base::withCallingHandlers(...)
        8.     └─SpaDES.core:::resolveDepsRunInitIfPoss(...)
        9.       ├─SpaDES.core::depsGraph(sim, plot = FALSE)
       10.       └─SpaDES.core::depsGraph(sim, plot = FALSE)
       11.         ├─SpaDES.core::.depsPruneEdges(depsEdgeList(sim, plot))
       12.         └─SpaDES.core::.depsPruneEdges(depsEdgeList(sim, plot))
       13.           └─igraph::graph_from_data_frame(simEdgeList)
       14.             └─igraph:::ensure_no_na(d, "edge data frame")
       15.               └─cli::cli_abort(...)
       16.                 └─rlang::abort(...)
      ── Error ('test-simulation.R:830:3'): messaging with multiple modules ──────────
      Error in `graph_from_data_frame(simEdgeList)`: Cannot create a graph object because the edge data frame contains NAs.
      Backtrace:
           ▆
        1. ├─testthat::capture_messages(...) at test-simulation.R:830:3
        2. │ └─base::withCallingHandlers(...)
        3. ├─SpaDES.core::simInit(paths = list(modulePath = tmpdir), modules = as.list(m))
        4. └─SpaDES.core::simInit(paths = list(modulePath = tmpdir), modules = as.list(m))
        5.   ├─SpaDES.core::simInit(...)
        6.   └─SpaDES.core::simInit(...)
        7.     ├─base::withCallingHandlers(...)
        8.     └─SpaDES.core:::resolveDepsRunInitIfPoss(...)
        9.       ├─SpaDES.core::depsGraph(sim, plot = FALSE)
       10.       └─SpaDES.core::depsGraph(sim, plot = FALSE)
       11.         ├─SpaDES.core::.depsPruneEdges(depsEdgeList(sim, plot))
       12.         └─SpaDES.core::.depsPruneEdges(depsEdgeList(sim, plot))
       13.           └─igraph::graph_from_data_frame(simEdgeList)
       14.             └─igraph:::ensure_no_na(d, "edge data frame")
       15.               └─cli::cli_abort(...)
       16.                 └─rlang::abort(...)
      
      [ FAIL 7 | WARN 0 | SKIP 29 | PASS 425 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.3Mb
      sub-directories of 1Mb or more:
        R   7.5Mb
    ```

# tilemaps

<details>

* Version: 0.2.0
* GitHub: https://github.com/kaerosen/tilemaps
* Source code: https://github.com/cran/tilemaps
* Date/Publication: 2020-07-10 04:20:02 UTC
* Number of recursive dependencies: 69

Run `revdepcheck::cloud_details(, "tilemaps")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tilemaps-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: create_island
    > ### Title: Create a Tile for an Island
    > ### Aliases: create_island
    > 
    > ### ** Examples
    > 
    > library(sf)
    Linking to GEOS 3.12.1, GDAL 3.8.4, PROJ 9.4.0; sf_use_s2() is TRUE
    > northeast <- governors[c(6,7,17,18,19,27,28,30,36,37,43),]
    > tile_map <- generate_map(northeast$geometry, square = FALSE)
    Error:
    ! The `neimode` argument of `bfs()` was deprecated in igraph 1.3.0 and
      is now defunct.
    ℹ Please use the `mode` argument instead.
    Backtrace:
        ▆
     1. └─tilemaps::generate_map(northeast$geometry, square = FALSE)
     2.   └─igraph::bfs(neighbor_graph, 1, neimode = "all", unreachable = FALSE)
     3.     └─lifecycle::deprecate_stop("1.3.0", "bfs(neimode = )", "bfs(mode = )")
     4.       └─lifecycle:::deprecate_stop0(msg)
     5.         └─rlang::cnd_signal(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘tilemaps.Rmd’ using rmarkdown
    
    Quitting from tilemaps.Rmd:32-41 [unnamed-chunk-2]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    NULL
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Error: processing vignette 'tilemaps.Rmd' failed with diagnostics:
    ℹ In argument: `tile_map = generate_map(geometry, square = FALSE,
      flat_topped = TRUE)`.
    Caused by error:
    ! The `neimode` argument of `bfs()` was deprecated in igraph 1.3.0 and
      is now defunct.
    ℹ Please use the `mode` argument instead.
    --- failed re-building ‘tilemaps.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘tilemaps.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘lwgeom’
      All declared Imports should be used.
    ```

# timeordered

<details>

* Version: 1.0.1
* GitHub: NA
* Source code: https://github.com/cran/timeordered
* Date/Publication: 2024-09-15 22:10:02 UTC
* Number of recursive dependencies: 13

Run `revdepcheck::cloud_details(, "timeordered")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘timeordered-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: transformspreadbyindividual
    > ### Title: A helper function to assess differences in spreading potential
    > ###   by vertex.
    > ### Aliases: transformspreadbyindividual
    > 
    > ### ** Examples
    > 
    > data(ants)
    > allindivs <- c(union(as.character(ants$VertexFrom), as.character(ants$VertexTo)), "NULL1", "NULL2")
    > g <- generatetonetwork(ants, allindivs)
    > sa <- spreadanalysis(g, seq(0,1000,by=50), 20)
    [1] 0.05
    [1] 0.1
    [1] 0.15
    [1] 0.2
    [1] 0.25
    [1] 0.3
    [1] 0.35
    [1] 0.4
    [1] 0.45
    [1] 0.5
    [1] 0.55
    [1] 0.6
    [1] 0.65
    [1] 0.7
    [1] 0.75
    [1] 0.8
    [1] 0.85
    [1] 0.9
    [1] 0.95
    [1] 1
    > b <- transformspreadbyindividual(sa)
    > plot(ts(b),plot.type="single",col=rainbow(ncol(b)),xlab="Time",ylab="Fraction reached")
    Error in xy.coords(x, NULL, log = log, setLab = FALSE) : 
      'list' object cannot be coerced to type 'double'
    Calls: plot -> plot.ts -> plotts -> xy.coords
    Execution halted
    ```

