# akc

<details>

* Version: 0.9.9
* GitHub: https://github.com/hope-data-science/akc
* Source code: https://github.com/cran/akc
* Date/Publication: 2023-01-06 08:00:02 UTC
* Number of recursive dependencies: 122

Run `revdepcheck::cloud_details(, "akc")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘akc-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: doc_group
    > ### Title: Construct network of documents based on keyword co-occurrence
    > ### Aliases: doc_group
    > 
    > ### ** Examples
    > 
    >  library(akc)
    >  bibli_data_table %>%
    +    keyword_clean(id = "id",keyword = "keyword") %>%
    +    doc_group(id = "id",keyword = "keyword") -> grouped_doc
    Error in `rename()`:
    ! Can't rename columns that don't exist.
    ✖ Column `name` doesn't exist.
    Backtrace:
         ▆
      1. ├─... %>% doc_group(id = "id", keyword = "keyword")
      2. ├─akc::doc_group(., id = "id", keyword = "keyword")
      3. │ └─... %>% rename(id = name)
      4. ├─dplyr::rename(., id = name)
      5. ├─tidygraph:::rename.tbl_graph(., id = name)
      6. │ ├─dplyr::rename(d_tmp, ...)
      7. │ └─dplyr:::rename.data.frame(d_tmp, ...)
      8. │   └─tidyselect::eval_rename(expr(c(...)), .data)
      9. │     └─tidyselect:::rename_impl(...)
     10. │       └─tidyselect:::eval_select_impl(...)
     11. │         ├─tidyselect:::with_subscript_errors(...)
     12. │         │ └─base::withCallingHandlers(...)
     13. │         └─tidyselect:::vars_select_eval(...)
     14. │           └─tidyselect:::walk_data_tree(expr, data_mask, context_mask)
     15. │             └─tidyselect:::eval_c(expr, data_mask, context_mask)
     16. │               └─tidyselect:::reduce_sels(node, data_mask, context_mask, init = init)
     17. │                 └─tidyselect:::walk_data_tree(new, data_mask, context_mask)
     18. │                   └─tidyselect:::as_indices_sel_impl(...)
     19. │                     └─tidyselect:::as_indices_impl(...)
     20. │                       └─tidyselect:::chr_as_locations(x, vars, call = call, arg = arg)
     21. │                         └─vctrs::vec_as_location(...)
     22. └─vctrs (local) `<fn>`()
     23.   └─vctrs:::stop_subscript_oob(...)
     24.     └─vctrs:::stop_subscript(...)
     25.       └─rlang::abort(...)
    Execution halted
    ```

# archeofrag

<details>

* Version: 0.8.2
* GitHub: https://github.com/sebastien-plutniak/archeofrag
* Source code: https://github.com/cran/archeofrag
* Date/Publication: 2022-09-11 22:02:59 UTC
* Number of recursive dependencies: 65

Run `revdepcheck::cloud_details(, "archeofrag")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘archeofrag-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: make_cr_graph
    > ### Title: Make a "connection" relationships graph.
    > ### Aliases: make_cr_graph make_cr_graph-methods
    > ### Keywords: build data
    > 
    > ### ** Examples
    > 
    > cr.df <- matrix(c(1,2, 1,3, 2,3, 4,5, 4,6, 7,8), ncol=2, byrow=TRUE)
    > sr.df <- matrix( c(1,1, 9,1, 10,1, 11,2, 12,2, 13,2), ncol=2, byrow=TRUE)
    > fragments.df <- data.frame(1:13, letters[1:13]) 
    > 
    > cr_g <- make_frag_object(cr=cr.df, fragments=fragments.df)
    > crsr_g <- make_frag_object(cr=cr.df, sr=sr.df, fragments=fragments.df)
    > 
    > make_cr_graph(cr_g)
    Error in i_set_vertex_attr(graph = graph, name = name, index = index,  : 
      Length of new attribute value must be 1 or 8, the number of target vertices, not 13
    Calls: make_cr_graph ... add_vertices -> set_vertex_attr -> i_set_vertex_attr
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(archeofrag)
      > 
      > test_check("archeofrag")
                  H1 != H2? p.value Obs. value/H1 Obs. value/H2
      edges            TRUE    0.02         lower        within
      weightsum       FALSE    0.06         lower        within
      balance         FALSE    0.45        higher        higher
      disturbance     FALSE     0.9         lower         lower
      admixture       FALSE    0.98        within        within
      cohesion1       FALSE    0.05        within        higher
      cohesion2       FALSE    0.07        within         lower
      [ FAIL 3 | WARN 2 | SKIP 0 | PASS 57 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-frag.diameters.R:6:3'): frag.diameters ─────────────────────────
      Error in `data.frame(..., check.names = FALSE)`: arguments imply differing number of rows: 78, 177
      Backtrace:
          ▆
       1. ├─archeofrag::make_cr_graph(abu.frag) at test-frag.diameters.R:6:3
       2. └─archeofrag::make_cr_graph(abu.frag)
       3.   └─igraph::graph_from_data_frame(...)
       4.     └─base::cbind(data.frame(name = names), vertices)
       5.       └─base::cbind(deparse.level, ...)
       6.         └─base::data.frame(..., check.names = FALSE)
      ── Error ('test-frag.diameters.R:13:3'): frag.diameters (with cumulative) ──────
      Error in `data.frame(..., check.names = FALSE)`: arguments imply differing number of rows: 78, 177
      Backtrace:
          ▆
       1. ├─archeofrag::make_cr_graph(abu.frag) at test-frag.diameters.R:13:3
       2. └─archeofrag::make_cr_graph(abu.frag)
       3.   └─igraph::graph_from_data_frame(...)
       4.     └─base::cbind(data.frame(name = names), vertices)
       5.       └─base::cbind(deparse.level, ...)
       6.         └─base::data.frame(..., check.names = FALSE)
      ── Error ('test-make_frag_object.R:42:3'): make_crsr_graph works ───────────────
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 8, the number of target vertices, not 13
      Backtrace:
          ▆
       1. ├─archeofrag::make_crsr_graph(f.obj) at test-make_frag_object.R:42:3
       2. └─archeofrag::make_crsr_graph(f.obj)
       3.   ├─archeofrag::make_cr_graph(object)
       4.   └─archeofrag::make_cr_graph(object)
       5.     └─igraph::graph_from_data_frame(...)
       6.       └─igraph::add_vertices(g, length(names), attr = vattrs)
       7.         └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       8.           └─igraph:::i_set_vertex_attr(...)
      
      [ FAIL 3 | WARN 2 | SKIP 0 | PASS 57 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘archeofrag-vignette.Rmd’ using rmarkdown
    
    Quitting from lines 61-65 [make-empirical-graph] (archeofrag-vignette.Rmd)
    Error: processing vignette 'archeofrag-vignette.Rmd' failed with diagnostics:
    arguments imply differing number of rows: 78, 177
    --- failed re-building ‘archeofrag-vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘archeofrag-vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# arulesViz

<details>

* Version: 1.5.3
* GitHub: https://github.com/mhahsler/arulesViz
* Source code: https://github.com/cran/arulesViz
* Date/Publication: 2024-04-26 09:20:02 UTC
* Number of recursive dependencies: 125

Run `revdepcheck::cloud_details(, "arulesViz")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘arulesViz-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: associations2igraph
    > ### Title: Convert rules or itemsets into a graph
    > ### Aliases: associations2igraph saveAsGraph graph igraph tidygraph
    > ### Keywords: file
    > 
    > ### ** Examples
    > 
    > 
    > data("Groceries")
    > rules <- apriori(Groceries, parameter = list(support = 0.01, confidence = 0.5))
    Apriori
    
    Parameter specification:
     confidence minval smax arem  aval originalSupport maxtime support minlen
            0.5    0.1    1 none FALSE            TRUE       5    0.01      1
     maxlen target  ext
         10  rules TRUE
    
    Algorithmic control:
     filter tree heap memopt load sort verbose
        0.1 TRUE TRUE  FALSE TRUE    2    TRUE
    
    Absolute minimum support count: 98 
    
    set item appearances ...[0 item(s)] done [0.00s].
    set transactions ...[169 item(s), 9835 transaction(s)] done [0.01s].
    sorting and recoding items ... [88 item(s)] done [0.00s].
    creating transaction tree ... done [0.00s].
    checking subsets of size 1 2 3 4 done [0.00s].
    writing ... [15 rule(s)] done [0.00s].
    creating S4 object  ... done [0.00s].
    > 
    > # convert rules into a graph with rules as nodes
    > library("igraph")
    
    Attaching package: ‘igraph’
    
    The following object is masked from ‘package:arules’:
    
        union
    
    The following objects are masked from ‘package:stats’:
    
        decompose, spectrum
    
    The following object is masked from ‘package:base’:
    
        union
    
    > g <- associations2igraph(rules)
    > g
    IGRAPH d47395e DN-B 27 45 -- 
    + attr: name (v/c), label (v/c), index (v/n), type (v/n), support
    | (v/n), confidence (v/n), coverage (v/n), lift (v/n), count (v/n)
    + edges from d47395e (vertex names):
     [1] 27    ->assoc1  30    ->assoc1  23    ->assoc2  26    ->assoc2 
     [5] 23    ->assoc3  55    ->assoc3  30    ->assoc4  31    ->assoc4 
     [9] 23    ->assoc5  31    ->assoc5  16    ->assoc6  23    ->assoc6 
    [13] 14    ->assoc7  20    ->assoc7  15    ->assoc8  20    ->assoc8 
    [17] 15    ->assoc9  20    ->assoc9  15    ->assoc10 30    ->assoc10
    [21] 20    ->assoc11 30    ->assoc11 20    ->assoc12 30    ->assoc12
    [25] 20    ->assoc13 56    ->assoc13 20    ->assoc14 56    ->assoc14
    + ... omitted several edges
    > 
    > plot(g)
    > 
    > # convert the graph into a tidygraph
    > library("tidygraph")
    
    Attaching package: ‘tidygraph’
    
    The following object is masked from ‘package:igraph’:
    
        groups
    
    The following object is masked from ‘package:stats’:
    
        filter
    
    > as_tbl_graph(g)
    # A tbl_graph: 27 nodes and 45 edges
    #
    # A directed acyclic simple graph with 1 component
    #
    # Node Data: 27 × 9 (active)
       name  label              index  type support confidence coverage  lift count
       <chr> <chr>              <int> <dbl>   <dbl>      <dbl>    <dbl> <dbl> <int>
     1 14    citrus fruit          14     1      NA         NA       NA    NA    NA
     2 15    tropical fruit        15     1      NA         NA       NA    NA    NA
     3 16    pip fruit             16     1      NA         NA       NA    NA    NA
     4 20    root vegetables       20     1      NA         NA       NA    NA    NA
     5 23    other vegetables      23     1      NA         NA       NA    NA    NA
     6 25    whole milk            25     1      NA         NA       NA    NA    NA
     7 26    butter                26     1      NA         NA       NA    NA    NA
     8 27    curd                  27     1      NA         NA       NA    NA    NA
     9 30    yogurt                30     1      NA         NA       NA    NA    NA
    10 31    whipped/sour cream    31     1      NA         NA       NA    NA    NA
    # ℹ 17 more rows
    #
    # Edge Data: 45 × 2
       from    to
      <int> <int>
    1     8    13
    2     9    13
    3     5    14
    # ℹ 42 more rows
    > 
    > # convert the generating itemsets of the rules into a graph with itemsets as edges
    > itemsets <- generatingItemsets(rules)
    > itemsets
    set of 15 itemsets 
    > g <- associations2igraph(itemsets, associationsAsNodes = FALSE)
    Error in i_set_vertex_attr(graph = graph, name = name, index = index,  : 
      Length of new attribute value must be 1 or 56, the number of target vertices, not 12
    Calls: associations2igraph ... add_vertices -> set_vertex_attr -> i_set_vertex_attr
    Execution halted
    ```

# bigergm

<details>

* Version: 1.1.0
* GitHub: NA
* Source code: https://github.com/cran/bigergm
* Date/Publication: 2024-02-16 15:10:10 UTC
* Number of recursive dependencies: 92

Run `revdepcheck::cloud_details(, "bigergm")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bigergm-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: hergm
    > ### Title: Hierarchical exponential-family random graph models (HERGMs)
    > ###   with local dependence
    > ### Aliases: hergm
    > 
    > ### ** Examples
    > 
    > # Load an embedded network object.
    > data(toyNet)
    > 
    > # Specify the model that you would like to estimate.
    > model_formula <- toyNet ~ edges + nodematch("x") + nodematch("y") + triangle
    > # Estimate the model
    > hergm_res <- bigergm::hergm(
    +   object = model_formula,
    +   # The model you would like to estimate
    +   n_clusters = 4,
    +   # The number of blocks
    +   n_MM_step_max = 10,
    +   # The maximum number of MM algorithm steps
    +   estimate_parameters = TRUE,
    +   # Perform parameter estimation after the block recovery step
    +   clustering_with_features = TRUE,
    +   # Indicate that clustering must take into account nodematch on characteristics
    +   check_block_membership = FALSE)
    Error in igraph::delete_vertex_attr(rval, "name") : 
      No such vertex attribute: name
    Calls: <Anonymous> ... asIgraph.network -> asIgraph -> asIgraph.data.frame -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(bigergm)
      Loading required package: ergm
      Loading required package: network
      
      'network' 1.18.2 (2023-12-04), part of the Statnet Project
      * 'news(package="network")' for changes since last version
      * 'citation("network")' for citation information
      * 'https://statnet.org' for help, support, and other information
      
      
      'ergm' 4.6.0 (2023-12-17), part of the Statnet Project
      * 'news(package="ergm")' for changes since last version
      * 'citation("ergm")' for citation information
      * 'https://statnet.org' for help, support, and other information
      
      'ergm' 4 is a major update that introduces some backwards-incompatible
      changes. Please type 'news(package="ergm")' for a list of major
      changes.
      
      Loading required package: Rcpp
      > 
      > test_check("bigergm")
      Compute pi for pi_s0v0w0
      [1] 1
      Compute pi for pi_s1v0w0
      [1] 2
      Compute pi for pi_s0v1w0
      [1] 3
      Compute pi for pi_s1v1w0
      [1] 4
      Compute pi for pi_s0v0w1
      [1] 5
      Compute pi for pi_s1v0w1
      [1] 6
      Compute pi for pi_s0v1w1
      [1] 7
      Compute pi for pi_s1v1w1
      [1] 8
      Compute pi for pi_s0v0w0
      [1] 1
      Compute pi for pi_s1v0w0
      [1] 2
      Compute pi for pi_s0v1w0
      [1] 3
      Compute pi for pi_s1v1w0
      [1] 4
      Compute pi for pi_s0v0w1
      [1] 5
      Compute pi for pi_s1v0w1
      [1] 6
      Compute pi for pi_s0v1w1
      [1] 7
      Compute pi for pi_s1v1w1
      [1] 8
      Compute pi for pi_s0v0w0
      [1] 1
      Compute pi for pi_s1v0w0
      [1] 2
      Compute pi for pi_s0v1w0
      [1] 3
      Compute pi for pi_s1v1w0
      [1] 4
      Compute pi for pi_s0v0w1
      [1] 5
      Compute pi for pi_s1v0w1
      [1] 6
      Compute pi for pi_s0v1w1
      [1] 7
      Compute pi for pi_s1v1w1
      [1] 8
               edges nodematch('x') nodematch('y')       triangle       kstar(2) 
               -3.00           1.00           1.00           0.76           0.08 
               edges nodematch('x') nodematch('y') 
                  -5              2              2 
               edges nodematch('x') nodematch('y')       triangle       kstar(2) 
               -3.00           1.00           1.00           0.76           0.08 
               edges nodematch('x') nodematch('y') 
                  -5              2              2 
      [ FAIL 6 | WARN 2 | SKIP 2 | PASS 91 ]
      
      ══ Skipped tests (2) ═══════════════════════════════════════════════════════════
      • On CRAN (2): 'test-EM-checkpoint.R:2:3', 'test-cache.R:49:3'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-estimate_within_param.R:185:3'): control.ergm settings can be passed to the within estimation from hergm function ──
      Error in `igraph::delete_vertex_attr(rval, "name")`: No such vertex attribute: name
      Backtrace:
          ▆
       1. └─bigergm::hergm(...) at test-estimate_within_param.R:185:3
       2.   └─bigergm:::MM_wrapper(...)
       3.     ├─igraph::cluster_infomap(intergraph::asIgraph(network))
       4.     │ └─igraph:::ensure_igraph(graph)
       5.     ├─intergraph::asIgraph(network)
       6.     └─intergraph:::asIgraph.network(network)
       7.       ├─intergraph::asIgraph(...)
       8.       └─intergraph:::asIgraph.data.frame(...)
       9.         └─igraph::delete_vertex_attr(rval, "name")
      ── Error ('test-gof.R:35:3'): (code run outside of `test_that()`) ──────────────
      Error in `igraph::delete_vertex_attr(rval, "name")`: No such vertex attribute: name
      Backtrace:
           ▆
        1. └─bigergm (local) get_dummy_net(50, 2) at test-gof.R:55:1
        2.   └─bigergm::hergm(...) at test-gof.R:35:3
        3.     └─bigergm:::MM_wrapper(...)
        4.       ├─igraph::cluster_infomap(intergraph::asIgraph(network))
        5.       │ └─igraph:::ensure_igraph(graph)
        6.       ├─intergraph::asIgraph(network)
        7.       └─intergraph:::asIgraph.network(network)
        8.         ├─intergraph::asIgraph(...)
        9.         └─intergraph:::asIgraph.data.frame(...)
       10.           └─igraph::delete_vertex_attr(rval, "name")
      ── Error ('test-include-covariates.R:21:3'): Check if algorithm automatically checks if covariates are specified ──
      Error in `igraph::delete_vertex_attr(rval, "name")`: No such vertex attribute: name
      Backtrace:
           ▆
        1. ├─testthat::expect_warning(...) at test-include-covariates.R:21:3
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. └─bigergm::hergm(...)
        7.   └─bigergm:::MM_wrapper(...)
        8.     ├─igraph::cluster_infomap(intergraph::asIgraph(network))
        9.     │ └─igraph:::ensure_igraph(graph)
       10.     ├─intergraph::asIgraph(network)
       11.     └─intergraph:::asIgraph.network(network)
       12.       ├─intergraph::asIgraph(...)
       13.       └─intergraph:::asIgraph.data.frame(...)
       14.         └─igraph::delete_vertex_attr(rval, "name")
      ── Error ('test-simulate_hergm.R:545:3'): Setting output = 'edgelist' returns a single edgelist for the full
                simulated network ──
      Error in `igraph::delete_vertex_attr(rval, "name")`: No such vertex attribute: name
      Backtrace:
          ▆
       1. └─bigergm::hergm(...) at test-simulate_hergm.R:545:3
       2.   └─bigergm:::MM_wrapper(...)
       3.     ├─igraph::cluster_infomap(intergraph::asIgraph(network))
       4.     │ └─igraph:::ensure_igraph(graph)
       5.     ├─intergraph::asIgraph(network)
       6.     └─intergraph:::asIgraph.network(network)
       7.       ├─intergraph::asIgraph(...)
       8.       └─intergraph:::asIgraph.data.frame(...)
       9.         └─igraph::delete_vertex_attr(rval, "name")
      ── Error ('test-simulate_hergm.R:601:3'): Setting output = 'edgelist' returns a list of full-network edgelists ──
      Error in `igraph::delete_vertex_attr(rval, "name")`: No such vertex attribute: name
      Backtrace:
          ▆
       1. └─bigergm::hergm(...) at test-simulate_hergm.R:601:3
       2.   └─bigergm:::MM_wrapper(...)
       3.     ├─igraph::cluster_infomap(intergraph::asIgraph(network))
       4.     │ └─igraph:::ensure_igraph(graph)
       5.     ├─intergraph::asIgraph(network)
       6.     └─intergraph:::asIgraph.network(network)
       7.       ├─intergraph::asIgraph(...)
       8.       └─intergraph:::asIgraph.data.frame(...)
       9.         └─igraph::delete_vertex_attr(rval, "name")
      ── Error ('test-unique-names.R:24:3'): Check if algorithm works even if vertex.names are nonunique ──
      Error in `igraph::delete_vertex_attr(rval, "name")`: No such vertex attribute: name
      Backtrace:
           ▆
        1. ├─testthat::expect_warning(...) at test-unique-names.R:24:3
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. └─bigergm::hergm(...)
        7.   └─bigergm:::MM_wrapper(...)
        8.     ├─igraph::cluster_infomap(intergraph::asIgraph(network))
        9.     │ └─igraph:::ensure_igraph(graph)
       10.     ├─intergraph::asIgraph(network)
       11.     └─intergraph:::asIgraph.network(network)
       12.       ├─intergraph::asIgraph(...)
       13.       └─intergraph:::asIgraph.data.frame(...)
       14.         └─igraph::delete_vertex_attr(rval, "name")
      
      [ FAIL 6 | WARN 2 | SKIP 2 | PASS 91 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘intro-bigergm.Rmd’ using rmarkdown
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.5Mb
      sub-directories of 1Mb or more:
        libs   9.0Mb
    ```

# bioregion

<details>

* Version: 1.1.1
* GitHub: https://github.com/bioRgeo/bioregion
* Source code: https://github.com/cran/bioregion
* Date/Publication: 2024-04-19 10:02:43 UTC
* Number of recursive dependencies: 118

Run `revdepcheck::cloud_details(, "bioregion")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bioregion-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: map_clusters
    > ### Title: Create a map of bioregions
    > ### Aliases: map_clusters
    > 
    > ### ** Examples
    > 
    > data(fishmat)
    > data(fishsf)
    > 
    > net <- similarity(fishmat, metric = "Simpson")
    > clu <- netclu_greedy(net)
    Error in comtemp[, 2] : subscript out of bounds
    Calls: netclu_greedy
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.6Mb
      sub-directories of 1Mb or more:
        data   4.0Mb
        help   2.7Mb
    ```

# bnviewer

<details>

* Version: 0.1.6
* GitHub: NA
* Source code: https://github.com/cran/bnviewer
* Date/Publication: 2020-09-14 06:00:03 UTC
* Number of recursive dependencies: 109

Run `revdepcheck::cloud_details(, "bnviewer")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bnviewer-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: viewer
    > ### Title: Interactive Bayesian Network Viewer
    > ### Aliases: viewer
    > 
    > ### ** Examples
    > 
    > 
    > library(bnlearn)
    > library(bnviewer)
    > 
    > data("alarm")
    > bayesianNetwork = hc(alarm)
    > 
    > viewer(bayesianNetwork,
    +        bayesianNetwork.background = "-webkit-radial-gradient(center, ellipse cover,
    +                                                              rgba(255,255,255,1) 0%,
    +                                                              rgba(246,246,246,1) 47%,
    +                                                              rgba(237,237,237,1) 100%)",
    +        bayesianNetwork.width = "100%",
    +        bayesianNetwork.height = "100vh",
    +        bayesianNetwork.layout = "layout_components",
    +        bayesianNetwork.title="<br>Discrete Bayesian Network - Alarm",
    +        bayesianNetwork.subtitle = "Monitoring of emergency care patients",
    + 
    +        node.colors = list(background = "white",
    +                           border = "black",
    +                           highlight = list(background = "#e91eba",
    +                                            border = "black")),
    +        node.font = list(color = "black", face="Arial"),
    + 
    +        clusters.legend.title = list(text = "<b>Legend</b> <br> Variable Categories",
    +                                     style = "font-size:18px;
    +                                              font-family:Arial;
    +                                              color:black;
    +                                              text-align:center;"),
    +        clusters.legend.options = list(
    +          list(label = "Pressure",
    +               shape = "icon",
    +               icon = list(code = "f1ce",
    +                           size = 50,
    +                           color = "#e91e63")),
    +          list(label = "Volume",
    +               shape = "icon",
    +               icon = list(code = "f140",
    +                           size = 50,
    +                           color = "#03a9f4")),
    +          list(label = "Ventilation",
    +               shape = "icon",
    +               icon = list(code = "f192",
    +                           size = 50,
    +                           color = "#4caf50")),
    +          list(label = "Saturation",
    +               shape = "icon",
    +               icon = list(code = "f10c",
    +                           size = 50,
    +                           color = "#ffc107"))
    +        ),
    + 
    +        clusters = list(
    +          list(label = "Pressure",
    +               shape = "icon",
    +               icon = list(code = "f1ce", color = "#e91e63"),
    +               nodes = list("CVP","BP","HRBP","PAP","PRSS")),
    +          list(label = "Volume",
    +               shape = "icon",
    +               icon = list(code = "f140", color = "#03a9f4"),
    +               nodes = list("MINV","MVS","LVV","STKV")),
    +          list(label = "Ventilation",
    +               shape = "icon",
    +               icon = list(code = "f192", color = "#4caf50"),
    +               nodes = list("VALV","VLNG","VTUB","VMCH")),
    +          list(label = "Saturation",
    +               shape = "icon",
    +               icon = list(code = "f10c", color = "#ffc107"),
    +               nodes = list("HRSA","SAO2","PVS"))
    +        )
    + )
    Error in data.frame(..., check.names = FALSE) : 
      arguments imply differing number of rows: 36, 37
    Calls: viewer ... <Anonymous> -> <Anonymous> -> cbind -> cbind -> data.frame
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘alarm.R’
    Running the tests in ‘tests/alarm.R’ failed.
    Complete output:
      > library(bnlearn)
      > library(bnviewer)
      > 
      > bn.learn.hc = hc(alarm)
      > 
      > viewer(bn.learn.hc,
      +        bayesianNetwork.width = "100%",
      +        bayesianNetwork.height = "80vh",
      +        bayesianNetwork.layout = "layout_on_grid",
      +        bayesianNetwork.title="Discrete Bayesian Network - Coronary",
      +        bayesianNetwork.subtitle = "Coronary heart disease data set",
      +        bayesianNetwork.footer = "Fig. 1 - Layout on grid",
      +        edges.smooth = TRUE,
      +        edges.shadow = TRUE,
      +        edges.width = 1.5,
      +        node.colors = list(background = "#f4bafd",
      +                           border = "#2b7ce9",
      +                           highlight = "#97c2fc")
      + 
      + )
      Error in data.frame(..., check.names = FALSE) : 
        arguments imply differing number of rows: 36, 37
      Calls: viewer ... <Anonymous> -> <Anonymous> -> cbind -> cbind -> data.frame
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘caret’ ‘e1071’
      All declared Imports should be used.
    ```

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) strength.viewer.Rd:148: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) strength.viewer.Rd:149: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) strength.viewer.Rd:150: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) strength.viewer.Rd:151: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) strength.viewer.Rd:152: Lost braces in \itemize; meant \describe ?
    ```

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# causaloptim

<details>

* Version: 0.9.8
* GitHub: https://github.com/sachsmc/causaloptim
* Source code: https://github.com/cran/causaloptim
* Date/Publication: 2023-10-31 14:30:02 UTC
* Number of recursive dependencies: 60

Run `revdepcheck::cloud_details(, "causaloptim")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(causaloptim)
      Loading required package: igraph
      
      Attaching package: 'igraph'
      
      The following object is masked from 'package:testthat':
      
          compare
      
      The following objects are masked from 'package:stats':
      
          decompose, spectrum
      
      The following object is masked from 'package:base':
      
          union
      
      > library(shiny)
      > 
      > test_check("causaloptim")
      [ FAIL 6 | WARN 9 | SKIP 0 | PASS 68 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-server.R:132:9'): dag input 2 ──────────────────────────────────
      Error in `warn_version(graph)`: This graph was created by a now unsupported old igraph version.
        Call upgrade_graph() before using igraph functions on that object.
      Backtrace:
           ▆
        1. ├─shiny::testServer(...) at test-server.R:76:5
        2. │ ├─shiny:::withMockContext(...)
        3. │ │ ├─shiny::isolate(...)
        4. │ │ │ ├─shiny::..stacktraceoff..(...)
        5. │ │ │ └─ctx$run(...)
        6. │ │ │   ├─promises::with_promise_domain(...)
        7. │ │ │   │ └─domain$wrapSync(expr)
        8. │ │ │   ├─shiny::withReactiveDomain(...)
        9. │ │ │   │ └─promises::with_promise_domain(...)
       10. │ │ │   │   └─domain$wrapSync(expr)
       11. │ │ │   │     └─base::force(expr)
       12. │ │ │   └─env$runWith(self, func)
       13. │ │ │     └─shiny (local) contextFunc()
       14. │ │ │       └─shiny::..stacktraceon..(expr)
       15. │ │ ├─shiny::withReactiveDomain(...)
       16. │ │ │ └─promises::with_promise_domain(...)
       17. │ │ │   └─domain$wrapSync(expr)
       18. │ │ │     └─base::force(expr)
       19. │ │ └─withr::with_options(...)
       20. │ │   └─base::force(code)
       21. │ └─rlang::eval_tidy(quosure, mask, rlang::caller_env())
       22. └─testthat::expect_equal(returned_igraphobject, graphres) at test-server.R:132:9
       23.   └─testthat:::expect_waldo_equal("equal", act, exp, info, ..., tolerance = tolerance)
       24.     └─testthat:::waldo_compare(...)
       25.       └─waldo::compare(x, y, ..., x_arg = x_arg, y_arg = y_arg)
       26.         └─waldo:::compare_structure(x, y, paths = c(x_arg, y_arg), opts = opts)
       27.           ├─base::length(x)
       28.           └─igraph:::length.igraph(x)
       29.             └─igraph::vcount(x)
       30.               └─igraph:::vcount_impl(graph)
       31.                 └─igraph:::ensure_igraph(graph)
       32.                   └─igraph::is_igraph(graph)
       33.                     └─igraph:::warn_version(graph)
      ── Failure ('test-server.R:307:5'): graphres_from_edges works ──────────────────
      `test0` (`actual`) not equal to TRUE (`expected`).
      
      `actual`:   FALSE
      `expected`: TRUE 
      ── Failure ('test-server.R:884:17'): Classic Balke-Pearl works 1 ───────────────
      igraph::identical_graphs(graphres_object, graphres_expected) is not TRUE
      
      `actual`:   FALSE
      `expected`: TRUE 
      Backtrace:
           ▆
        1. ├─shiny::testServer(...) at test-server.R:867:9
        2. │ ├─shiny:::withMockContext(...)
        3. │ │ ├─shiny::isolate(...)
        4. │ │ │ ├─shiny::..stacktraceoff..(...)
        5. │ │ │ └─ctx$run(...)
        6. │ │ │   ├─promises::with_promise_domain(...)
        7. │ │ │   │ └─domain$wrapSync(expr)
        8. │ │ │   ├─shiny::withReactiveDomain(...)
        9. │ │ │   │ └─promises::with_promise_domain(...)
       10. │ │ │   │   └─domain$wrapSync(expr)
       11. │ │ │   │     └─base::force(expr)
       12. │ │ │   └─env$runWith(self, func)
       13. │ │ │     └─shiny (local) contextFunc()
       14. │ │ │       └─shiny::..stacktraceon..(expr)
       15. │ │ ├─shiny::withReactiveDomain(...)
       16. │ │ │ └─promises::with_promise_domain(...)
       17. │ │ │   └─domain$wrapSync(expr)
       18. │ │ │     └─base::force(expr)
       19. │ │ └─withr::with_options(...)
       20. │ │   └─base::force(code)
       21. │ └─rlang::eval_tidy(quosure, mask, rlang::caller_env())
       22. └─testthat::expect_true(...) at test-server.R:884:17
      ── Failure ('test-server.R:918:17'): Classic Balke-Pearl works 2 ───────────────
      igraph::identical_graphs(graphres_object, graphres_expected) is not TRUE
      
      `actual`:   FALSE
      `expected`: TRUE 
      Backtrace:
           ▆
        1. ├─shiny::testServer(...) at test-server.R:897:9
        2. │ ├─shiny:::withMockContext(...)
        3. │ │ ├─shiny::isolate(...)
        4. │ │ │ ├─shiny::..stacktraceoff..(...)
        5. │ │ │ └─ctx$run(...)
        6. │ │ │   ├─promises::with_promise_domain(...)
        7. │ │ │   │ └─domain$wrapSync(expr)
        8. │ │ │   ├─shiny::withReactiveDomain(...)
        9. │ │ │   │ └─promises::with_promise_domain(...)
       10. │ │ │   │   └─domain$wrapSync(expr)
       11. │ │ │   │     └─base::force(expr)
       12. │ │ │   └─env$runWith(self, func)
       13. │ │ │     └─shiny (local) contextFunc()
       14. │ │ │       └─shiny::..stacktraceon..(expr)
       15. │ │ ├─shiny::withReactiveDomain(...)
       16. │ │ │ └─promises::with_promise_domain(...)
       17. │ │ │   └─domain$wrapSync(expr)
       18. │ │ │     └─base::force(expr)
       19. │ │ └─withr::with_options(...)
       20. │ │   └─base::force(code)
       21. │ └─rlang::eval_tidy(quosure, mask, rlang::caller_env())
       22. └─testthat::expect_true(...) at test-server.R:918:17
      ── Failure ('test-server.R:1197:17'): Classic Balke-Pearl works with monotone IV ──
      igraph::identical_graphs(g1 = graphres_object, g2 = graphres_expected) is not TRUE
      
      `actual`:   FALSE
      `expected`: TRUE 
      Backtrace:
           ▆
        1. ├─shiny::testServer(...) at test-server.R:1176:9
        2. │ ├─shiny:::withMockContext(...)
        3. │ │ ├─shiny::isolate(...)
        4. │ │ │ ├─shiny::..stacktraceoff..(...)
        5. │ │ │ └─ctx$run(...)
        6. │ │ │   ├─promises::with_promise_domain(...)
        7. │ │ │   │ └─domain$wrapSync(expr)
        8. │ │ │   ├─shiny::withReactiveDomain(...)
        9. │ │ │   │ └─promises::with_promise_domain(...)
       10. │ │ │   │   └─domain$wrapSync(expr)
       11. │ │ │   │     └─base::force(expr)
       12. │ │ │   └─env$runWith(self, func)
       13. │ │ │     └─shiny (local) contextFunc()
       14. │ │ │       └─shiny::..stacktraceon..(expr)
       15. │ │ ├─shiny::withReactiveDomain(...)
       16. │ │ │ └─promises::with_promise_domain(...)
       17. │ │ │   └─domain$wrapSync(expr)
       18. │ │ │     └─base::force(expr)
       19. │ │ └─withr::with_options(...)
       20. │ │   └─base::force(code)
       21. │ └─rlang::eval_tidy(quosure, mask, rlang::caller_env())
       22. └─testthat::expect_true(...) at test-server.R:1197:17
      ── Failure ('test-server.R:1878:17'): Natural direct effect works ──────────────
      igraph::identical_graphs(g1 = graphres_object, g2 = graphres_expected) is not TRUE
      
      `actual`:   FALSE
      `expected`: TRUE 
      Backtrace:
           ▆
        1. ├─shiny::testServer(...) at test-server.R:1857:9
        2. │ ├─shiny:::withMockContext(...)
        3. │ │ ├─shiny::isolate(...)
        4. │ │ │ ├─shiny::..stacktraceoff..(...)
        5. │ │ │ └─ctx$run(...)
        6. │ │ │   ├─promises::with_promise_domain(...)
        7. │ │ │   │ └─domain$wrapSync(expr)
        8. │ │ │   ├─shiny::withReactiveDomain(...)
        9. │ │ │   │ └─promises::with_promise_domain(...)
       10. │ │ │   │   └─domain$wrapSync(expr)
       11. │ │ │   │     └─base::force(expr)
       12. │ │ │   └─env$runWith(self, func)
       13. │ │ │     └─shiny (local) contextFunc()
       14. │ │ │       └─shiny::..stacktraceon..(expr)
       15. │ │ ├─shiny::withReactiveDomain(...)
       16. │ │ │ └─promises::with_promise_domain(...)
       17. │ │ │   └─domain$wrapSync(expr)
       18. │ │ │     └─base::force(expr)
       19. │ │ └─withr::with_options(...)
       20. │ │   └─base::force(code)
       21. │ └─rlang::eval_tidy(quosure, mask, rlang::caller_env())
       22. └─testthat::expect_true(...) at test-server.R:1878:17
      
      [ FAIL 6 | WARN 9 | SKIP 0 | PASS 68 ]
      Error: Test failures
      Execution halted
    ```

# cglasso

<details>

* Version: 2.0.7
* GitHub: NA
* Source code: https://github.com/cran/cglasso
* Date/Publication: 2024-02-12 08:40:02 UTC
* Number of recursive dependencies: 11

Run `revdepcheck::cloud_details(, "cglasso")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘cglasso-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: cggm
    > ### Title: Post-Hoc Maximum Likelihood Refitting of a Conditional Graphical
    > ###   Lasso
    > ### Aliases: cggm
    > ### Keywords: regression
    > 
    > ### ** Examples
    > 
    > set.seed(123)
    > # Y ~ N(XB, Sigma)  and
    > # 1. probability of left/right censored values equal to 0.05
    > # 2. probability of missing-at-random values equal to 0.05
    > n <- 100L
    > p <- 3L
    > q <- 2L
    > b0 <- runif(p)
    > B <- matrix(runif(q * p), nrow = q, ncol = p)
    > X <- matrix(rnorm(n * q), nrow = n, ncol = q)
    > rho <- 0.3
    > Sigma <- outer(1L:p, 1L:p, function(i, j) rho^abs(i - j))
    > Z <- rcggm(n = n, b0 = b0, X = X, B = B, Sigma = Sigma, probl = 0.05, probr = 0.5, probna = 0.05)
    > out <- cglasso(. ~ ., data = Z)
    > 
    > # MLE of the censored Gaussian graphical model identified by 'BIC'
    > out.mle <- cggm(out, GoF = BIC)
    > out.mle
    
    Call:  cggm(object = out, GoF = BIC)
    
      df              N. Comp.
      15  (100.000%)         1
    
    > 
    > # accessor functions
    > coef(out.mle, drop = TRUE)
    $B
          response
    coef           Y1          Y2        Y3
      Int. 0.05320545  0.78327450 0.2701906
      X1   0.69498839 -0.05066828 0.8049508
      X2   0.79525227  0.50210278 0.5624755
    
    $Sigma
            response
    response        Y1        Y2        Y3
          Y1 0.7318983 0.2609506 0.1155406
          Y2 0.2609506 0.7294057 0.2144929
          Y3 0.1155406 0.2144929 0.8345455
    
    $Theta
            response
    response          Y1         Y2          Y3
          Y1  1.57087061 -0.5387564 -0.07901192
          Y2 -0.53875640  1.6678453 -0.35407638
          Y3 -0.07901192 -0.3540764  1.30019989
    
    > fitted(out.mle, drop = TRUE)
         response
                    Y1          Y2           Y3
      1   -0.774529441  0.31399823 -0.349408622
      2   -0.557269121  0.45522189 -0.198335769
      3    0.539923779  1.00096363  0.671818975
      4    1.362159388  0.98292668  1.597317614
      5   -1.330344138  0.75517703 -1.249694121
      6    2.339170664  1.39928757  2.416724043
      7    1.805898324  1.64328227  1.667746442
      8    2.196545572  0.89898982  2.578515884
      9    0.223491811  0.62202445  0.562714752
      10   0.339329954  0.84732915  0.547217924
      11   0.418988974  1.52761972  0.200192551
      12   0.809591893  0.62709459  1.210943853
      13  -0.619751143 -0.04568822  0.052930605
      14  -0.192838534  0.65518482  0.078714135
      15   0.272950784  1.30594545  0.179796280
      16   0.222491536  1.24918313  0.160051883
      17   0.236230539  1.00449102  0.331992446
      18   0.090796164  0.97093706  0.191819503
      19  -0.227034457  1.13775169 -0.268269287
      20   1.482086687  1.72724693  1.254055865
      21   1.276701373  1.03173139  1.471079165
      22  -0.657138853  0.40594586 -0.277795283
      23  -1.250150724  0.53086300 -1.016934117
      24   0.112747120  1.22150400  0.055788383
      25   0.336795706  0.62707289  0.685424522
      26   0.719453616  1.36058427  0.641119699
      27   0.084031382  1.44468405 -0.119025925
      28   0.945847475  1.64035521  0.713637179
      29   0.116747182  0.88673544  0.274576963
      30   0.357297675  0.54124288  0.763167741
      31  -0.046405401  0.79448596  0.152290467
      32  -1.701617032 -0.48609925 -0.867627626
      33  -2.966943580  0.45609418 -2.877350700
      34   0.016689917  1.13798601  0.002490766
      35   0.185440479  0.72650841  0.453521098
      36  -0.491145173  1.03698509 -0.497321813
      37  -0.514326882  0.21225048  0.004963726
      38   0.008534657  0.36341036  0.489363560
      39  -0.270665632  0.65902902 -0.010255348
      40   0.318621903  0.34248433  0.847437136
      41  -0.245719926  1.05189091 -0.234064888
      42  -0.689067221  0.12191438 -0.131428141
      43   1.269889270  1.35389458  1.257235727
      44   0.154862040  1.28133941  0.064290093
      45  -1.866495868  0.21679847 -1.500941995
      46   0.739239738  1.20230158  0.764456513
      47  -2.114602922 -0.37391331 -1.398508461
      48   1.713523411  1.00442187  1.974111054
      49   0.868857242  0.69699942  1.232061843
      50  -1.662928848 -0.43535496 -0.857114110
      51  -0.691183783  0.82672418 -0.585049510
      52  -0.379319998  0.76513684 -0.198967007
      53  -0.087500624 -0.10006778  0.679367476
      54  -0.013155771  1.26513863 -0.112096029
      55   0.657416663  0.33957263  1.225886307
      56   0.733315020  1.33097814  0.675483168
      57  -0.698636576  0.53774852 -0.408311099
      58  -0.057816184  1.09152542 -0.050578624
      59   0.093154951 -0.24381672  0.972212059
      60  -2.316371332 -0.05969623 -1.823966532
      61   1.489403840  1.44734275  1.441403501
      62   0.462067980  0.43742974  0.946092880
      63   1.265721966  1.23832842  1.326597159
      64   0.324737432  0.75304187  0.591367051
      65   0.892913869  0.92501206  1.112812119
      66   1.546777159  1.80087900  1.278817672
      67  -1.042655802  0.20341151 -0.576637181
      68  -1.173385389  0.44974287 -0.879667356
      69  -0.721083925  0.65417815 -0.507808715
      70  -1.164634798  0.71316497 -1.038602022
      71   0.733431125  0.90963351  0.945386638
      72   1.516009868  1.70988718  1.302877866
      73  -1.204224679  0.32499476 -0.834074047
      74   1.605448866  1.90004744  1.280539194
      75  -0.653545422  0.72016990 -0.474989321
      76   0.287296049  1.31236693  0.191630174
      77  -0.897210178  0.36665762 -0.519489761
      78  -0.567340102  0.54780996 -0.268811478
      79   0.736705544  1.17343832  0.780119937
      80  -2.152691723 -0.23333248 -1.530855512
      81  -0.415358928  0.79379712 -0.257376143
      82  -0.894814932  0.62566415 -0.682661505
      83   0.424811781  0.69302441  0.741031371
      84   1.691075962  1.67040908  1.522747981
      85  -0.539183715  0.37261457 -0.125342062
      86   1.708327172  1.72726516  1.505520188
      87   0.277207387  1.16401537  0.275401275
      88   0.202246907  1.18473717  0.178811939
      89   1.106735773  1.47141189  1.000640792
      90  -0.292052011  0.48569122  0.076955808
      91   0.311377857  0.31373725  0.857790969
      92  -0.694473230  0.53810408 -0.403911017
      93   0.894979119  1.16523561  0.961299749
      94  -0.567891916  0.43223855 -0.195427915
      95  -0.675975471  0.12202822 -0.116948987
      96   2.069953194  1.96669514  1.754183122
      97   0.419730497  0.14405427  1.086872528
      98   0.232434200  0.87799063  0.408767082
      99   0.770335452  0.66033197  1.146027729
      100 -1.439124253  0.11443892 -0.960362356
    > residuals(out.mle, type = "working", drop = TRUE)
         response
                    Y1          Y2           Y3
      1    0.154469421 -0.66465697 -0.215224678
      2    0.570599736 -1.10108641 -1.164366021
      3   -0.876635559 -0.66058646  0.456546434
      4    0.180132188  0.57054188  0.173084322
      5   -0.719819672  0.59377366  0.324970209
      6    0.013398836  0.35083718  0.025928509
      7    0.073452013  0.24793111  0.152892410
      8   -0.231215722 -0.74782884 -0.196742825
      9   -0.205509141  0.73353624 -0.034184954
      10  -0.817423018  0.51009158  0.594870651
      11   0.423465480 -1.31120972 -0.385620785
      12   0.284755253 -0.44069033  0.210595262
      13  -1.760114077 -1.56607202 -0.868531202
      14   0.964121536 -0.34557609 -0.499144728
      15  -0.061449917  0.34170942  0.880011951
      16   0.743419559  0.40799963  0.073864190
      17  -0.210306511 -0.07607379  0.768863247
      18   0.833292351  0.56117009  0.091687499
      19  -0.685768560  0.29771568 -0.332855771
      20   0.039734035  0.03513812 -1.021267264
      21   0.207958031  0.54203522  0.212344462
      22  -0.368902863 -0.06775732  1.190767730
      23   1.023835759  1.03445764  1.370442032
      24  -1.368155453 -0.95448178 -0.062848559
      25   0.673266305  0.79716719 -0.002366995
      26   0.450244027  0.36856380  0.595288634
      27  -0.962051486  0.11670637  0.055823922
      28   0.339180725  0.24878746  0.553530508
      29   0.782772551  0.53871520 -0.683536813
      30   0.593508589  0.74652914 -1.224228754
      31   0.325305967 -0.79334374 -1.024765349
      32  -1.163968429 -0.21868042 -0.712647985
      33  -0.522763935 -0.93344870 -0.405683396
      34   0.287974290  0.48793053  1.021612848
      35   0.772195961  0.73058662  0.709603802
      36  -0.069873991 -0.73621248 -0.278291670
      37  -0.269385791 -1.64996374  0.995805644
      38  -1.239846226  0.27474555  0.657669752
      39   1.060397201  0.03105571  1.001333740
      40   0.627812694  0.04005752 -0.878504579
      41  -0.333677800 -0.41598969 -1.297942476
      42   1.432422546  1.16660043  1.115842964
      43   0.210201417  0.37188859 -0.004979215
      44  -1.246287722 -2.64025592 -1.110917399
      45   1.621223626  1.18842662  0.097622412
      46   0.228409367 -1.10372522  0.365403819
      47   0.503237101  0.11673455 -0.049329497
      48   0.090879170  0.55798124  0.084438556
      49   0.375257573  0.75020719  0.300875811
      50   0.627704890 -1.02689479  0.454517953
      51  -0.128993818  0.56042298 -0.357656392
      52   0.369770196  0.72063687  0.410934239
      53   0.136083186  0.22198086  0.574773431
      54   0.909929608  0.41522614  1.101120252
      55   0.325316793 -0.49735139 -1.955758037
      56   0.344027864  0.18319216 -1.475399531
      57  -0.742683936  0.73489643  0.070437391
      58   0.942074867  0.50778246  1.055562702
      59  -0.213062200 -0.49363702  0.316934459
      60   0.822207037  1.39096663  1.530785164
      61   0.143102089  0.32878416  0.222066379
      62  -1.010582759  0.19583819  0.398615991
      63  -0.958532164 -0.78312838  0.079523147
      64  -0.147663166  0.57223168 -0.928570500
      65  -1.290050008 -1.34820396  0.105500876
      66  -0.100408811 -0.17317120 -2.301136217
      67   1.728884501  1.09531344  0.267402084
      68   0.089332687  0.89996017  0.534881286
      69  -1.514860110 -0.95845278 -1.390243294
      70   0.101021506 -0.75767901 -1.372305723
      71  -0.708739886  0.47952568  0.368536816
      72   0.135983925  0.22331698  0.272224268
      73  -0.459998077 -0.07562232 -1.504707404
      74  -0.218294197 -1.18474518  0.062173543
      75  -1.386139775  0.55658386  0.272022060
      76   0.704913199  0.39175081  0.882668006
      77  -0.417797204 -1.17294082 -0.343012474
      78   0.264055468  0.83004674  0.218884670
      79   0.318047184 -0.38956928 -0.765921026
      80  -0.819112631 -0.14644777 -0.966881060
      81  -0.941741520 -0.99898978 -0.435457312
      82  -1.828384903 -0.17560862 -0.801843191
      83  -0.002161326  0.75277936  0.538552626
      84   0.095224883  0.23772439  0.195254235
      85   0.707304973  1.00870197  0.414350520
      86   0.091693796  0.21722768  0.200693188
      87  -0.729669522 -0.26198292  0.781294534
      88   0.760877974  0.45698947  0.891565258
      89   0.270657314  0.31803561  0.403384586
      90   1.071314315  0.25398168 -1.898604385
      91  -0.762084746  0.03734577  0.430031860
      92   0.702412324  0.89591880  1.342377667
      93   0.362768884  0.46756395  0.422677956
      94  -0.124086360 -1.83332035 -0.018964132
      95   0.683314782  0.51255185 -0.038258933
      96   0.036220931  0.14305217  0.130477393
      97   0.525273346 -0.38533090  0.276909069
      98   0.665709310 -0.21806981 -0.297823012
      99  -1.378849081 -0.53960720  0.186984634
      100 -0.825099069 -0.52155698 -0.189316020
    > impute(out.mle, type = "both")
         response
                    Y1           Y2           Y3
      1   -0.620060019 -0.350658741 -0.564633300
      2    0.013330616 -0.645864524 -1.362701790
      3   -0.336711780  0.340377174  1.128365409
      4    1.542291576  1.553468564  1.770401936
      5   -2.050163810  1.348950691 -0.924723911
      6    2.352569501  1.750124747  2.442652552
      7    1.879350337  1.891213388  1.820638852
      8    1.965329850  0.151160984  2.381773059
      9    0.017982670  1.355560689  0.528529799
      10  -0.478093064  1.357420736  1.142088575
      11   0.842454453  0.216410007 -0.185428233
      12   1.094347145  0.186404252  1.421539115
      13  -2.379865220 -1.611760240 -0.815600597
      14   0.771283002  0.309608729 -0.420430593
      15   0.211500867  1.647654871  1.059808231
      16   0.965911095  1.657182761  0.233916073
      17   0.025924028  0.928417226  1.100855693
      18   0.924088516  1.532107157  0.283507002
      19  -0.912803016  1.435467370 -0.601125059
      20   1.521820721  1.762385042  0.232788601
      21   1.484659404  1.573766612  1.683423627
      22  -1.026041715  0.338188541  0.912972447
      23  -0.226314965  1.565320642  0.353507915
      24  -1.255408333  0.267022224 -0.007060177
      25   1.010062011  1.424240085  0.683057527
      26   1.169697643  1.729148070  1.236408333
      27  -0.878020105  1.561390417 -0.063202003
      28   1.285028200  1.889142668  1.267167687
      29   0.899519733  1.425450641 -0.408959850
      30   0.950806264  1.287772017 -0.461061014
      31   0.278900567  0.001142227 -0.872474882
      32  -2.865585461 -0.704779679 -1.580275611
      33  -3.489707515 -0.477354517 -3.283034096
      34   0.304664207  1.625916541  1.024103614
      35   0.957636440  1.457095030  1.163124900
      36  -0.561019164  0.300772610 -0.775613483
      37  -0.783712673 -1.437713260  1.000769370
      38  -1.231311570  0.638155917  1.147033312
      39   0.789731569  0.690084734  0.991078392
      40   0.946434597  0.382541856 -0.031067443
      41  -0.579397726  0.635901221 -1.532007364
      42   0.743355325  1.288514812  0.984414823
      43   1.480090688  1.725783175  1.252256512
      44  -1.091425682 -1.358916509 -1.046627306
      45  -0.245272243  1.405225096 -1.403319583
      46   0.967649105  0.098576366  1.129860332
      47  -1.611365821 -0.257178763 -1.447837959
      48   1.804402580  1.562403111  2.058549610
      49   1.244114815  1.447206612  1.532937654
      50  -1.035223958 -1.462249757 -0.402596157
      51  -0.820177601  1.387147168 -0.942705901
      52  -0.009549801  1.485773709  0.211967231
      53   0.048582562  0.121913082  1.254140908
      54   0.896773838  1.680364771  0.989024223
      55   0.982733456 -0.157778755 -0.729871731
      56   1.077342884  1.514170306 -0.799916363
      57  -1.441320513  1.272644954 -0.337873708
      58   0.884258682  1.599307882  1.004984078
      59  -0.119907249 -0.737453747  1.289146518
      60  -1.494164295  1.331270404 -0.293181368
      61   1.632505929  1.776126909  1.663469880
      62  -0.548514779  0.633267935  1.344708871
      63   0.307189802  0.455200043  1.406120305
      64   0.177074266  1.325273544 -0.337203449
      65  -0.397136139 -0.423191900  1.218312995
      66   1.446368348  1.627707808 -1.022318545
      67   0.686228699  1.298724951 -0.309235097
      68  -1.084052702  1.349703043 -0.344786069
      69  -2.235944035 -0.304274631 -1.898052009
      70  -1.063613292 -0.044514036 -2.410907744
      71   0.024691239  1.389159192  1.313923454
      72   1.651993793  1.933204157  1.575102134
      73  -1.664222755  0.249372438 -2.338781450
      74   1.387154669  0.715302254  1.342712737
      75  -2.039685197  1.276753752 -0.202967260
      76   0.992209248  1.704117740  1.074298180
      77  -1.315007382 -0.806283194 -0.862502235
      78  -0.303284634  1.377856693 -0.049926808
      79   1.054752728  0.783869037  0.014198911
      80  -2.971804354 -0.379780249 -2.497736572
      81  -1.357100448 -0.205192666 -0.692833455
      82  -2.723199835  0.450055524 -1.484504696
      83   0.422650455  1.445803765  1.279583997
      84   1.786300845  1.908133474  1.718002217
      85   0.168121258  1.381316545  0.289008458
      86   1.800020968  1.944492832  1.706213376
      87  -0.452462135  0.902032449  1.056695809
      88   0.963124881  1.641726640  1.070377197
      89   1.377393087  1.789447504  1.404025379
      90   0.779262304  0.739672896 -1.821648577
      91  -0.450706889  0.351083025  1.287822830
      92   0.007939094  1.434022881  0.938466649
      93   1.257748003  1.632799562  1.383977705
      94  -0.691978277 -1.401081796 -0.214392047
      95   0.007339311  0.634580071 -0.155207919
      96   2.106174125  2.109747310  1.884660515
      97   0.945003843 -0.241276629  1.363781597
      98   0.898143509  0.659920815  0.110944071
      99  -0.608513630  0.120724769  1.333012363
      100 -2.264223322 -0.407118057 -1.149678377
    > 
    > # goodness-of-fit functions
    > AIC(out.mle)
    
    Sequence of ‘AIC’ values of the fitted  model
    
    Details:
      lambda       rho  df  AIC
      0.0888  8.59e-07  15  779
    
    > BIC(out.mle)
    
    Sequence of ‘BIC’ values of the fitted  model
    
    Details:
      lambda       rho  df  BIC
      0.0888  8.59e-07  15  818
    
    > summary(out.mle)
    
    Call:  cggm(object = out, GoF = BIC)
    
      lambda       rho  df.B  df.Tht  df       (df%)  BIC
      0.0888  8.59e-07     9       6  15  (100.000%)  818
    
    ===============================================================
    
    Summary of the Selected Model
    
         nObs: 100
        nResp: 3
        nPred: 2
       lambda: 0.0888442
    lambda.id: 1
          rho: 8.593237e-07
       rho.id: 1
          BIC: 817.7793
         df.B: 9
       df.Tht: 6
           df: 15
    
    ===============================================================
    
    > 
    > # network analysis
    > out.graph <- plot(out.mle)
    Error in rbind(deparse.level, ...) : 
      numbers of columns of arguments do not match
    Calls: plot ... plot -> plot.cglasso2igraph -> getGraph -> rbind -> rbind
    Execution halted
    ```

# corrViz

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/corrViz
* Date/Publication: 2023-06-30 11:40:07 UTC
* Number of recursive dependencies: 139

Run `revdepcheck::cloud_details(, "corrViz")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘corrViz-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: corrNetwork
    > ### Title: corrNetwork
    > ### Aliases: corrNetwork
    > 
    > ### ** Examples
    > 
    > ci <- cor(iris[1:4])
    > corrNetwork(mat = ci, threshold = 0.5)
    > 
    > # Another example
    > cm <- cor(mtcars)
    > 
    > corrNetwork(mat = cm,
    +            threshold = 0.8,
    +            layout = 'layout_on_grid',
    +            physics = FALSE)
    Error in i_set_vertex_attr(graph = graph, name = name, index = index,  : 
      Length of new attribute value must be 1 or 8, the number of target vertices, not 11
    Calls: corrNetwork ... add_vertices -> set_vertex_attr -> i_set_vertex_attr
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘corrViz.Rmd’ using rmarkdown
    
    Quitting from lines 133-136 [network2] (corrViz.Rmd)
    Error: processing vignette 'corrViz.Rmd' failed with diagnostics:
    Length of new attribute value must be 1 or 8, the number of target vertices, not 11
    --- failed re-building ‘corrViz.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘corrViz.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.2Mb
      sub-directories of 1Mb or more:
        doc   6.7Mb
    ```

# cppRouting

<details>

* Version: 3.1
* GitHub: https://github.com/vlarmet/cppRouting
* Source code: https://github.com/cran/cppRouting
* Date/Publication: 2022-12-01 13:20:02 UTC
* Number of recursive dependencies: 36

Run `revdepcheck::cloud_details(, "cppRouting")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘cppRouting-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: cpp_simplify
    > ### Title: Reduce the number of edges by removing non-intersection nodes,
    > ###   duplicated edges and isolated loops in the graph.
    > ### Aliases: cpp_simplify
    > 
    > ### ** Examples
    > 
    > #Simple directed graph
    > edges<-data.frame(from=c(1,2,3,4,5,6,7,8),
    +                   to=c(0,1,2,3,6,7,8,5),
    +                   dist=c(1,1,1,1,1,1,1,1))
    > 
    > #Plot
    > if(requireNamespace("igraph",quietly = TRUE)){
    + igr<-igraph::graph_from_data_frame(edges)
    + plot(igr)
    + }
    Error in add_edges(g, edges, attr = eattrs) : 
      At vendor/cigraph/src/graph/type_indexededgelist.c:261 : Out-of-range vertex IDs when adding edges. Invalid vertex ID
    Calls: <Anonymous> -> add_edges
    Execution halted
    ```

## In both

*   checking C++ specification ... NOTE
    ```
      Specified C++11: please drop specification unless essential
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 11.6Mb
      sub-directories of 1Mb or more:
        libs  11.4Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘RcppProgress’
      All declared Imports should be used.
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# cranly

<details>

* Version: 0.6.0
* GitHub: https://github.com/ikosmidis/cranly
* Source code: https://github.com/cran/cranly
* Date/Publication: 2022-08-26 22:14:41 UTC
* Number of recursive dependencies: 63

Run `revdepcheck::cloud_details(, "cranly")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘cranly.Rmd’ using rmarkdown
    
    Quitting from lines 63-65 [unnamed-chunk-7] (cranly.Rmd)
    Error: processing vignette 'cranly.Rmd' failed with diagnostics:
    arguments imply differing number of rows: 18416, 19260
    --- failed re-building ‘cranly.Rmd’
    
    --- re-building ‘dependence_trees.Rmd’ using rmarkdown
    
    Quitting from lines 61-63 [unnamed-chunk-6] (dependence_trees.Rmd)
    Error: processing vignette 'dependence_trees.Rmd' failed with diagnostics:
    arguments imply differing number of rows: 18416, 19260
    --- failed re-building ‘dependence_trees.Rmd’
    
    --- re-building ‘extractors.Rmd’ using rmarkdown
    --- finished re-building ‘extractors.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘cranly.Rmd’ ‘dependence_trees.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.4Mb
      sub-directories of 1Mb or more:
        doc   5.1Mb
    ```

# criticalpath

<details>

* Version: 0.2.1
* GitHub: https://github.com/rubens2005/criticalpath
* Source code: https://github.com/cran/criticalpath
* Date/Publication: 2022-03-13 22:40:10 UTC
* Number of recursive dependencies: 78

Run `revdepcheck::cloud_details(, "criticalpath")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘criticalpath-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: sch_add_activities
    > ### Title: Add Activities
    > ### Aliases: sch_add_activities
    > 
    > ### ** Examples
    > 
    > # Example #1
    > sch <- sch_new() %>%
    +   sch_add_activities(
    +     id        = 1:17,
    +     name      = paste("a", as.character(1:17), sep=""),
    +     duration  = c(1L,2L,2L,4L,3L,3L,3L,2L,1L,1L,2L,1L,1L,1L,1L,2L,1L)
    +   ) %>%
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
      [ FAIL 48 | WARN 0 | SKIP 0 | PASS 616 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-cpt-add_act_rel.R:126:3'): Does not return Inf!!! ──────────────
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-add_act_rel.R:126:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-add_activity.R:11:3'): Add activities works, with duration equal zero! ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─sch %<>% sch_add_activity(2L, "2", 0L) %>% sch_plan() at test-cpt-add_activity.R:11:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-add_activity.R:36:3'): Add activities works, with duration ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─sch %<>% sch_add_activity(2L, "B", 2L) %>% sch_plan() at test-cpt-add_activity.R:36:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-add_activity.R:61:3'): Add activities works, with mean duration equal SIX ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─sch %<>% sch_add_activity(2L, "Task 2", 6L) %>% sch_plan() at test-cpt-add_activity.R:61:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-add_activity.R:98:3'): Add activities tibble. ──────────────
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─sch_new() %>% sch_add_activities_tibble(atb) %>% sch_plan() at test-cpt-add_activity.R:98:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-add_relation.R:2:3'): Creating a sch step-by-step: first with activities and then with relations. ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-add_relation.R:2:3
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
      ── Error ('test-cpt-gantt_matrix.R:148:3'): There is no Gantt matrix for a sch with zero duration! ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-gantt_matrix.R:148:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-gantt_matrix.R:157:3'): A,B,C ──────────────────────────────
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─criticalpath (local) s0() at test-cpt-gantt_matrix.R:157:3
       2. │ └─... %>% sch_plan() at test-cpt-gantt_matrix.R:4:3
       3. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-gantt_matrix.R:180:3'): A->B, C ────────────────────────────
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─criticalpath (local) s1() at test-cpt-gantt_matrix.R:180:3
       2. │ └─... %>% sch_plan() at test-cpt-gantt_matrix.R:18:3
       3. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-schedule_from_data_frame.R:77:3'): Creating a schedule only with activities list, without relations ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-schedule_from_data_frame.R:77:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-topological_indicators.R:61:3'): Topological Indicator with sch with TWO PARALLEL activities ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-topological_indicators.R:61:3
       2. └─criticalpath::sch_plan(.)
      ── Error ('test-cpt-topological_indicators.R:89:3'): Topological Indicator with sch with THREE PARALLEL activities ──
      Error in `sch_plan(.)`: The schedule is invalid!!! To view the problem, execute:
      
               `validation <- sch_validate(sch)`
      Backtrace:
          ▆
       1. ├─... %>% sch_plan() at test-cpt-topological_indicators.R:89:3
       2. └─criticalpath::sch_plan(.)
      
      [ FAIL 48 | WARN 0 | SKIP 0 | PASS 616 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘criticalpath-introduction.Rmd’ using rmarkdown
    
    Quitting from lines 266-278 [unnamed-chunk-5] (criticalpath-introduction.Rmd)
    Error: processing vignette 'criticalpath-introduction.Rmd' failed with diagnostics:
    The schedule is invalid!!! To view the problem, execute:
    
             `validation <- sch_validate(sch)`
    --- failed re-building ‘criticalpath-introduction.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘criticalpath-introduction.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# debkeepr

<details>

* Version: 0.1.1
* GitHub: https://github.com/jessesadler/debkeepr
* Source code: https://github.com/cran/debkeepr
* Date/Publication: 2023-03-22 09:00:10 UTC
* Number of recursive dependencies: 98

Run `revdepcheck::cloud_details(, "debkeepr")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘debkeepr.Rmd’ using rmarkdown
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 53 marked UTF-8 strings
    ```

# DiagrammeR

<details>

* Version: 1.0.11
* GitHub: https://github.com/rich-iannone/DiagrammeR
* Source code: https://github.com/cran/DiagrammeR
* Date/Publication: 2024-02-02 23:30:03 UTC
* Number of recursive dependencies: 82

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
    Error in data.frame(id = igraph::membership(cmty_walktrap_obj) %>% names() %>%  : 
      arguments imply differing number of rows: 0, 8
    Calls: %>% ... colnames -> is.data.frame -> get_cmty_walktrap -> data.frame
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
      The series of graph actions was not applied to the graph because of an error at action index 1.
      [ FAIL 52 | WARN 0 | SKIP 23 | PASS 1423 ]
      
      ══ Skipped tests (23) ══════════════════════════════════════════════════════════
      • On CRAN (23): 'test-add_forward_reverse_edges.R:94:3',
        'test-add_graphs.R:41:3', 'test-add_graphs.R:262:3',
        'test-add_graphs.R:1787:3', 'test-add_nodes_edges_from_table.R:684:3',
        'test-colorize_nodes_edges.R:415:3', 'test-create_combine_nodes.R:88:3',
        'test-create_subgraph.R:73:3', 'test-delete_node_edge.R:286:3',
        'test-get_select_last_nodes_edges_created.R:135:3',
        'test-graph_series.R:361:3', 'test-graph_validation.R:17:3',
        'test-graph_validation.R:241:3', 'test-graph_validation.R:301:3',
        'test-render_graph.R:3:3', 'test-selections.R:163:3',
        'test-set_get_node_edge_attrs.R:332:3', 'test-similarity_measures.R:106:3',
        'test-similarity_measures.R:126:3', 'test-transform_graph.R:138:3',
        'test-transform_graph.R:308:3', 'test-trav_out_until.R:73:3',
        'test-traversals.R:148:3'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-cache_attrs.R:17:3'): Setting a cache is possible ──────────────
      Error in `data.frame(id = closeness_values %>% names() %>% as.integer(), 
          closeness = closeness_values, stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. └─DiagrammeR::get_closeness(graph) at test-cache_attrs.R:17:3
       2.   └─base::data.frame(...)
      ── Error ('test-cache_attrs.R:114:3'): Getting a cache is possible ─────────────
      Error in `data.frame(id = closeness_values %>% names() %>% as.integer(), 
          closeness = closeness_values, stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. └─DiagrammeR::get_closeness(graph) at test-cache_attrs.R:114:3
       2.   └─base::data.frame(...)
      ── Error ('test-colorize_nodes_edges.R:21:3'): Adding color based on node attributes is possible ──
      Error in `data.frame(id = igraph::membership(cmty_walktrap_obj) %>% names() %>% 
          as.integer(), walktrap_group = as.vector(igraph::membership(cmty_walktrap_obj)), 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 50
      Backtrace:
          ▆
       1. ├─graph %>% join_node_attrs(get_cmty_walktrap(.)) at test-colorize_nodes_edges.R:21:3
       2. ├─DiagrammeR::join_node_attrs(., get_cmty_walktrap(.))
       3. │ └─base::colnames(df)
       4. │   └─base::is.data.frame(x)
       5. └─DiagrammeR::get_cmty_walktrap(.)
       6.   └─base::data.frame(...)
      ── Error ('test-count_entities.R:137:3'): counting the number of strongly connected components is possible ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 0, the number of target vertices, not 4
      Backtrace:
           ▆
        1. ├─testthat::expect_equal(graph %>% count_s_connected_cmpts(), 4) at test-count_entities.R:137:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─graph %>% count_s_connected_cmpts()
        5. └─DiagrammeR::count_s_connected_cmpts(.)
        6.   └─DiagrammeR::to_igraph(graph)
        7.     └─igraph::graph_from_data_frame(...)
        8.       └─igraph::add_vertices(g, length(names), attr = vattrs)
        9.         └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       10.           └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-degree_total_in_out.R:15:3'): a degree data frame can be generated ──
      Error in `data.frame(id = total_degree_values %>% names() %>% as.integer(), 
          total_degree = total_degree_values, stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. └─DiagrammeR::get_degree_total(graph) at test-degree_total_in_out.R:15:3
       2.   └─base::data.frame(...)
      ── Error ('test-get_aggregate_degree.R:18:3'): Getting aggregated indegree values is possible ──
      Error in `data.frame(id = indegree_values %>% names() %>% as.integer(), 
          indegree = indegree_values, stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(...) at test-get_aggregate_degree.R:18:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─DiagrammeR::get_agg_degree_in(graph = graph, agg = "mean")
       5.   └─DiagrammeR::get_degree_in(graph)
       6.     └─base::data.frame(...)
      ── Error ('test-get_aggregate_degree.R:135:3'): Getting aggregated outdegree values is possible ──
      Error in `data.frame(id = outdegree_values %>% names() %>% as.integer(), 
          outdegree = outdegree_values, stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(...) at test-get_aggregate_degree.R:135:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─DiagrammeR::get_agg_degree_out(graph = graph, agg = "mean")
       5.   └─DiagrammeR::get_degree_out(graph)
       6.     └─base::data.frame(...)
      ── Error ('test-get_aggregate_degree.R:257:3'): Getting aggregated total degree values is possible ──
      Error in `data.frame(id = total_degree_values %>% names() %>% as.integer(), 
          total_degree = total_degree_values, stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. ├─testthat::expect_equal(...) at test-get_aggregate_degree.R:257:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─DiagrammeR::get_agg_degree_total(graph = graph, agg = "mean")
       5.   └─DiagrammeR::get_degree_total(graph)
       6.     └─base::data.frame(...)
      ── Error ('test-get_cmty.R:14:3'): the edge betweeness algorithm is functional ──
      Error in `data.frame(id = igraph::membership(cmty_edge_btwns_obj) %>% names() %>% 
          as.integer(), edge_btwns_group = as.vector(igraph::membership(cmty_edge_btwns_obj)), 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. └─DiagrammeR::get_cmty_edge_btwns(graph) at test-get_cmty.R:14:3
       2.   └─base::data.frame(...)
      ── Error ('test-get_cmty.R:61:3'): the fast-greedy algorithm is functional ─────
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 14, the number of target vertices, not 15
      Backtrace:
          ▆
       1. └─DiagrammeR::get_cmty_fast_greedy(graph) at test-get_cmty.R:61:3
       2.   └─DiagrammeR::to_igraph(graph)
       3.     └─igraph::graph_from_data_frame(...)
       4.       └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.         └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.           └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-get_cmty.R:107:3'): the leading eigenvector algorithm is functional ──
      Error in `data.frame(id = igraph::membership(cmty_l_eigenvec_obj) %>% names() %>% 
          as.integer(), l_eigenvec_group = as.vector(igraph::membership(cmty_l_eigenvec_obj)), 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. └─DiagrammeR::get_cmty_l_eigenvec(graph) at test-get_cmty.R:107:3
       2.   └─base::data.frame(...)
      ── Error ('test-get_cmty.R:151:3'): the Louvain algorithm is functional ────────
      Error in `data.frame(id = igraph::membership(cmty_louvain_obj) %>% names() %>% 
          as.integer(), louvain_group = as.vector(igraph::membership(cmty_louvain_obj)), 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. └─DiagrammeR::get_cmty_louvain(graph) at test-get_cmty.R:151:3
       2.   └─base::data.frame(...)
      ── Error ('test-get_cmty.R:197:3'): the walktrap algorithm is functional ───────
      Error in `data.frame(id = igraph::membership(cmty_walktrap_obj) %>% names() %>% 
          as.integer(), walktrap_group = as.vector(igraph::membership(cmty_walktrap_obj)), 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. └─DiagrammeR::get_cmty_walktrap(graph) at test-get_cmty.R:197:3
       2.   └─base::data.frame(...)
      ── Error ('test-get_graph_metrics.R:207:3'): Getting graph eccentricity is possible ──
      Error in `data.frame(id = eccentricity %>% names() %>% as.integer(), eccentricity = eccentricity, 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. └─DiagrammeR::get_eccentricity(graph) at test-get_graph_metrics.R:207:3
       2.   └─base::data.frame(...)
      ── Error ('test-get_graph_metrics.R:241:3'): Getting graph periphery is possible ──
      Error in `data.frame(id = eccentricity %>% names() %>% as.integer(), eccentricity = eccentricity, 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. └─DiagrammeR::get_periphery(graph) at test-get_graph_metrics.R:241:3
       2.   └─DiagrammeR::get_eccentricity(graph)
       3.     └─base::data.frame(...)
      ── Error ('test-get_graph_metrics.R:316:3'): Checking whether the graph is connected is possible ──
      Error in `data.frame(id = as.integer(names(components$membership)), wc_component = components$membership, 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. ├─testthat::expect_true(is_graph_connected(graph_connected)) at test-get_graph_metrics.R:316:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─DiagrammeR::is_graph_connected(graph_connected)
       5.   └─DiagrammeR::get_w_connected_cmpts(graph)
       6.     └─base::data.frame(...)
      ── Error ('test-get_node_calculations.R:13:3'): Getting betweenness is possible ──
      Error in `data.frame(id = betweenness_scores %>% names() %>% as.integer(), 
          betweenness = betweenness_scores, stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. └─DiagrammeR::get_betweenness(graph) at test-get_node_calculations.R:13:3
       2.   └─base::data.frame(...)
      ── Error ('test-get_node_calculations.R:50:3'): Getting closeness is possible ──
      Error in `data.frame(id = closeness_values %>% names() %>% as.integer(), 
          closeness = closeness_values, stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. └─DiagrammeR::get_closeness(graph = graph, direction = "all") at test-get_node_calculations.R:50:3
       2.   └─base::data.frame(...)
      ── Error ('test-get_node_calculations.R:84:3'): Getting coreness values is possible ──
      Error in `data.frame(id = coreness_values %>% names() %>% as.integer(), 
          coreness = coreness_values, stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. └─DiagrammeR::get_coreness(graph) at test-get_node_calculations.R:84:3
       2.   └─base::data.frame(...)
      ── Error ('test-get_node_calculations.R:218:3'): Getting alpha centrality is possible ──
      Error in `data.frame(id = alpha_centrality_values %>% names() %>% as.integer(), 
          alpha_centrality = alpha_centrality_values, stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 15
      Backtrace:
          ▆
       1. └─DiagrammeR::get_alpha_centrality(graph) at test-get_node_calculations.R:218:3
       2.   └─base::data.frame(...)
      ── Error ('test-get_node_calculations.R:255:3'): Getting leverage centrality is possible ──
      Error in `data.frame(id = degree_vals %>% names() %>% as.integer(), leverage_centrality = leverage_centrality_values %>% 
          round(4), stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. └─DiagrammeR::get_leverage_centrality(graph) at test-get_node_calculations.R:255:3
       2.   └─base::data.frame(...)
      ── Error ('test-get_node_calculations.R:341:3'): Getting authority centrality is possible ──
      Error in `data.frame(id = authority_centrality_values$vector %>% names() %>% 
          as.integer(), authority_centrality = unname(authority_centrality_values$vector), 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. └─DiagrammeR::get_authority_centrality(graph = graph_1) at test-get_node_calculations.R:341:3
       2.   └─base::data.frame(...)
      ── Error ('test-get_node_calculations.R:477:3'): Getting eigenvector centrality is possible ──
      Error in `data.frame(id = names(eigen_centrality_values$vector) %>% as.integer(), 
          eigen_centrality = unname(eigen_centrality_values$vector) %>% 
              round(4), stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. └─DiagrammeR::get_eigen_centrality(graph = graph_1) at test-get_node_calculations.R:477:3
       2.   └─base::data.frame(...)
      ── Error ('test-get_node_calculations.R:562:3'): Getting radiality values is possible ──
      Error in `data.frame(id = radiality_values %>% names() %>% as.integer(), 
          radiality = radiality_values %>% round(4), stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. └─DiagrammeR::get_radiality(graph) at test-get_node_calculations.R:562:3
       2.   └─base::data.frame(...)
      ── Error ('test-get_node_calculations.R:644:3'): Getting PageRank values is possible ──
      Error in `data.frame(id = names(pagerank_values) %>% as.integer(), pagerank = round(pagerank_values, 
          4), stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. └─DiagrammeR::get_pagerank(graph) at test-get_node_calculations.R:644:3
       2.   └─base::data.frame(...)
      ── Error ('test-get_node_calculations.R:703:3'): Getting weakly connected components is possible ──
      Error in `data.frame(id = as.integer(names(components$membership)), wc_component = components$membership, 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. └─DiagrammeR::get_w_connected_cmpts(graph) at test-get_node_calculations.R:703:3
       2.   └─base::data.frame(...)
      ── Error ('test-get_node_calculations.R:736:3'): Getting strongly connected components is possible ──
      Error in `data.frame(id = as.integer(names(components$membership)), sc_component = components$membership, 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 5
      Backtrace:
          ▆
       1. └─DiagrammeR::get_s_connected_cmpts(graph) at test-get_node_calculations.R:736:3
       2.   └─base::data.frame(...)
      ── Error ('test-get_nodes_edges.R:357:3'): getting connected nodes is possible ──
      Error in `data.frame(id = as.integer(names(components$membership)), wc_component = components$membership, 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
      Backtrace:
          ▆
       1. └─DiagrammeR::get_all_connected_nodes(graph = graph, node = 1) at test-get_nodes_edges.R:357:3
       2.   └─DiagrammeR::get_w_connected_cmpts(graph)
       3.     └─base::data.frame(...)
      ── Failure ('test-graph_actions.R:246:3'): graph actions can be triggered to modify the graph ──
      Names of graph$nodes_df ('id', 'type', 'label') don't match 'id', 'type', 'label', 'pagerank', 'width', 'fillcolor'
      ── Failure ('test-graph_actions.R:253:3'): graph actions can be triggered to modify the graph ──
      graph$nodes_df$pagerank has type 'NULL', not 'double'.
      ── Failure ('test-graph_actions.R:261:3'): graph actions can be triggered to modify the graph ──
      graph$nodes_df$width has type 'NULL', not 'double'.
      ── Failure ('test-graph_actions.R:269:3'): graph actions can be triggered to modify the graph ──
      graph$nodes_df$fillcolor has type 'NULL', not 'character'.
      ── Error ('test-graph_actions.R:272:3'): graph actions can be triggered to modify the graph ──
      Error in `expect_match(graph$nodes_df$fillcolor, "#[A-F0-9]*")`: is.character(act$val) is not TRUE
      Backtrace:
          ▆
       1. └─testthat::expect_match(graph$nodes_df$fillcolor, "#[A-F0-9]*") at test-graph_actions.R:272:3
       2.   └─base::stopifnot(is.character(act$val))
      ── Error ('test-is_something_some_thing.R:349:3'): Identifying the graph as a DAG is possible ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 5, the number of target vertices, not 7
      Backtrace:
          ▆
       1. ├─testthat::expect_false(is_graph_dag(non_dag)) at test-is_something_some_thing.R:349:3
       2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─DiagrammeR::is_graph_dag(non_dag)
       5.   └─DiagrammeR::to_igraph(graph)
       6.     └─igraph::graph_from_data_frame(...)
       7.       └─igraph::add_vertices(g, length(names), attr = vattrs)
       8.         └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       9.           └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-mst.R:29:3'): the MST algorithm is functional ──────────────────
      Error in `dplyr::arrange(nodes_df, id)`: Can't transform a data frame with duplicate names.
      Backtrace:
           ▆
        1. ├─graph %>% transform_to_min_spanning_tree() at test-mst.R:29:3
        2. └─DiagrammeR::transform_to_min_spanning_tree(.)
        3.   └─DiagrammeR::from_igraph(igraph_mst)
        4.     ├─dplyr::arrange(nodes_df, id)
        5.     └─dplyr:::arrange.data.frame(nodes_df, id)
        6.       └─dplyr:::arrange_rows(.data, dots = dots, locale = .locale)
        7.         ├─dplyr::mutate(data, `:=`("{name}", !!dot), .keep = "none")
        8.         └─dplyr:::mutate.data.frame(data, `:=`("{name}", !!dot), .keep = "none")
        9.           └─dplyr:::mutate_cols(.data, dplyr_quosures(...), by)
       10.             └─DataMask$new(data, by, "mutate", error_call = error_call)
       11.               └─dplyr (local) initialize(...)
       12.                 └─rlang::abort(...)
      ── Error ('test-print.R:96:3'): Printing a summary of node types works ─────────
      Error in `data.frame(id = as.integer(names(components$membership)), wc_component = components$membership, 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 4
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
       22.   └─DiagrammeR::is_graph_connected(x)
       23.     └─DiagrammeR::get_w_connected_cmpts(graph)
       24.       └─base::data.frame(...)
      ── Error ('test-print.R:119:3'): Printing a summary of node labels works ───────
      Error in `data.frame(id = as.integer(names(components$membership)), wc_component = components$membership, 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 4
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
       23.   └─DiagrammeR::is_graph_connected(x)
       24.     └─DiagrammeR::get_w_connected_cmpts(graph)
       25.       └─base::data.frame(...)
      ── Error ('test-print.R:157:3'): Printing a summary of extra node attrs works ──
      Error in `data.frame(id = as.integer(names(components$membership)), wc_component = components$membership, 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 4
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
       22.   └─DiagrammeR::is_graph_connected(x)
       23.     └─DiagrammeR::get_w_connected_cmpts(graph)
       24.       └─base::data.frame(...)
      ── Error ('test-print.R:189:3'): Printing a summary of edge rel values works ───
      Error in `data.frame(id = as.integer(names(components$membership)), wc_component = components$membership, 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 4
      Backtrace:
           ▆
        1. ├─testthat::expect_equal(...) at test-print.R:189:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─... %>% stringr::str_trim()
        5. ├─stringr::str_trim(.)
        6. │ └─stringi::stri_trim_both(string)
        7. ├─base::substr(., 1, 45)
        8. ├─DiagrammeR (local) get_printed_output(., 6)
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
       23.   └─DiagrammeR::is_graph_connected(x)
       24.     └─DiagrammeR::get_w_connected_cmpts(graph)
       25.       └─base::data.frame(...)
      ── Error ('test-print.R:227:3'): Printing a summary of extra edge attrs works ──
      Error in `data.frame(id = as.integer(names(components$membership)), wc_component = components$membership, 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 5
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
       22.   └─DiagrammeR::is_graph_connected(x)
       23.     └─DiagrammeR::get_w_connected_cmpts(graph)
       24.       └─base::data.frame(...)
      ── Error ('test-print.R:256:3'): Describing if a graph is weighted works ───────
      Error in `data.frame(id = as.integer(names(components$membership)), wc_component = components$membership, 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 5
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
       20.   └─DiagrammeR::is_graph_connected(x)
       21.     └─DiagrammeR::get_w_connected_cmpts(graph)
       22.       └─base::data.frame(...)
      ── Error ('test-print.R:275:3'): Describing if a graph is a DAG works ──────────
      Error in `data.frame(id = as.integer(names(components$membership)), wc_component = components$membership, 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 5
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
       20.   └─DiagrammeR::is_graph_connected(x)
       21.     └─DiagrammeR::get_w_connected_cmpts(graph)
       22.       └─base::data.frame(...)
      ── Error ('test-print.R:301:3'): Describing if a graph is a property graph works ──
      Error in `data.frame(id = as.integer(names(components$membership)), wc_component = components$membership, 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 4
      Backtrace:
           ▆
        1. ├─testthat::expect_match(graph_pg %>% get_printed_output(2), "property graph") at test-print.R:301:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─graph_pg %>% get_printed_output(2)
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
       20.   └─DiagrammeR::is_graph_connected(x)
       21.     └─DiagrammeR::get_w_connected_cmpts(graph)
       22.       └─base::data.frame(...)
      ── Error ('test-print.R:324:3'): Describing if a graph is a simple graph works ──
      Error in `data.frame(id = as.integer(names(components$membership)), wc_component = components$membership, 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 4
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
       20.   └─DiagrammeR::is_graph_connected(x)
       21.     └─DiagrammeR::get_w_connected_cmpts(graph)
       22.       └─base::data.frame(...)
      ── Error ('test-print.R:344:3'): Describing if a graph is a connected or not works ──
      Error in `data.frame(id = as.integer(names(components$membership)), wc_component = components$membership, 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 4
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
       20.   └─DiagrammeR::is_graph_connected(x)
       21.     └─DiagrammeR::get_w_connected_cmpts(graph)
       22.       └─base::data.frame(...)
      ── Error ('test-print.R:374:3'): The number of reported nodes is correct ───────
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 0, the number of target vertices, not 4
      Backtrace:
           ▆
        1. ├─testthat::expect_match(...) at test-print.R:374:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─graph_4_nodes %>% get_printed_output(1)
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
       22.       └─igraph::graph_from_data_frame(...)
       23.         └─igraph::add_vertices(g, length(names), attr = vattrs)
       24.           └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       25.             └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-print.R:393:3'): The number of reported edges is correct ───────
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 0, the number of target vertices, not 4
      Backtrace:
           ▆
        1. ├─testthat::expect_no_match(...) at test-print.R:393:3
        2. │ └─testthat::quasi_label(enquo(object), label, arg = "object")
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─graph_no_edges %>% get_printed_output(1)
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
       22.       └─igraph::graph_from_data_frame(...)
       23.         └─igraph::add_vertices(g, length(names), attr = vattrs)
       24.           └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       25.             └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-print.R:432:3'): Printing a summary line for node/edge selections works ──
      Error in `data.frame(id = as.integer(names(components$membership)), wc_component = components$membership, 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 4
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
       23.   └─DiagrammeR::is_graph_connected(x)
       24.     └─DiagrammeR::get_w_connected_cmpts(graph)
       25.       └─base::data.frame(...)
      ── Error ('test-print.R:476:3'): Printing a summary line for graph caches works ──
      Error in `data.frame(id = as.integer(names(components$membership)), wc_component = components$membership, 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 4
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
       23.   └─DiagrammeR::is_graph_connected(x)
       24.     └─DiagrammeR::get_w_connected_cmpts(graph)
       25.       └─base::data.frame(...)
      ── Error ('test-print.R:551:3'): Printing a summary line for graph actions works ──
      Error in `data.frame(id = as.integer(names(components$membership)), wc_component = components$membership, 
          stringsAsFactors = FALSE)`: arguments imply differing number of rows: 0, 10
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
       23.   └─DiagrammeR::is_graph_connected(x)
       24.     └─DiagrammeR::get_w_connected_cmpts(graph)
       25.       └─base::data.frame(...)
      ── Error ('test-transform_graph.R:156:3'): Creating a complement graph is possible ──
      Error in `dplyr::arrange(nodes_df, id)`: Can't transform a data frame with duplicate names.
      Backtrace:
           ▆
        1. ├─DiagrammeR::transform_to_complement_graph(graph) at test-transform_graph.R:156:3
        2. │ ├─from_igraph(ig_graph) %>% get_edge_df()
        3. │ └─DiagrammeR::from_igraph(ig_graph)
        4. │   ├─dplyr::arrange(nodes_df, id)
        5. │   └─dplyr:::arrange.data.frame(nodes_df, id)
        6. │     └─dplyr:::arrange_rows(.data, dots = dots, locale = .locale)
        7. │       ├─dplyr::mutate(data, `:=`("{name}", !!dot), .keep = "none")
        8. │       └─dplyr:::mutate.data.frame(data, `:=`("{name}", !!dot), .keep = "none")
        9. │         └─dplyr:::mutate_cols(.data, dplyr_quosures(...), by)
       10. │           └─DataMask$new(data, by, "mutate", error_call = error_call)
       11. │             └─dplyr (local) initialize(...)
       12. │               └─rlang::abort(...)
       13. └─DiagrammeR::get_edge_df(.)
       14.   └─DiagrammeR:::check_graph_valid(graph)
       15.     └─DiagrammeR:::graph_object_valid(graph)
       16.       └─... %in% names(graph)
      ── Error ('test-write_graph_backup.R:486:3'): Graph backups for `transform_to_complement_graph()` works ──
      Error in `dplyr::arrange(nodes_df, id)`: Can't transform a data frame with duplicate names.
      Backtrace:
           ▆
        1. ├─... %>% transform_to_complement_graph() at test-write_graph_backup.R:486:3
        2. ├─DiagrammeR::transform_to_complement_graph(.)
        3. │ ├─from_igraph(ig_graph) %>% get_edge_df()
        4. │ └─DiagrammeR::from_igraph(ig_graph)
        5. │   ├─dplyr::arrange(nodes_df, id)
        6. │   └─dplyr:::arrange.data.frame(nodes_df, id)
        7. │     └─dplyr:::arrange_rows(.data, dots = dots, locale = .locale)
        8. │       ├─dplyr::mutate(data, `:=`("{name}", !!dot), .keep = "none")
        9. │       └─dplyr:::mutate.data.frame(data, `:=`("{name}", !!dot), .keep = "none")
       10. │         └─dplyr:::mutate_cols(.data, dplyr_quosures(...), by)
       11. │           └─DataMask$new(data, by, "mutate", error_call = error_call)
       12. │             └─dplyr (local) initialize(...)
       13. │               └─rlang::abort(...)
       14. └─DiagrammeR::get_edge_df(.)
       15.   └─DiagrammeR:::check_graph_valid(graph)
       16.     └─DiagrammeR:::graph_object_valid(graph)
       17.       └─... %in% names(graph)
      
      [ FAIL 52 | WARN 0 | SKIP 23 | PASS 1423 ]
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

# dyndimred

<details>

* Version: 1.0.4
* GitHub: https://github.com/dynverse/dyndimred
* Source code: https://github.com/cran/dyndimred
* Date/Publication: 2021-03-23 08:30:06 UTC
* Number of recursive dependencies: 161

Run `revdepcheck::cloud_details(, "dyndimred")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > 
      > test_check("dyndimred")
      Loading required package: dyndimred
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 131 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-dimred.R:26:9'): Perform dimred with knn_fr ────────────────────
      Error in `igraph::graph_from_data_frame(kdf, vertices = seq_len(nrow(x)))`: `vertices` must be a data frame or a character vector if given
      Backtrace:
          ▆
       1. ├─utils::capture.output(...) at test-dimred.R:23:7
       2. │ └─base::withVisible(...elt(i))
       3. └─dyndimred (local) dr_fun(expr) at test-dimred.R:26:9
       4.   └─igraph::graph_from_data_frame(kdf, vertices = seq_len(nrow(x)))
      ── Error ('test-dimred.R:74:9'): Check sparse capable knn_fr ───────────────────
      Error in `igraph::graph_from_data_frame(kdf, vertices = seq_len(nrow(x)))`: `vertices` must be a data frame or a character vector if given
      Backtrace:
          ▆
       1. ├─utils::capture.output(...) at test-dimred.R:70:7
       2. │ └─base::withVisible(...elt(i))
       3. └─dyndimred (local) dr_fun(sparse_expr) at test-dimred.R:74:9
       4.   └─igraph::graph_from_data_frame(kdf, vertices = seq_len(nrow(x)))
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 131 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘lle’
    ```

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# dynwrap

<details>

* Version: 1.2.4
* GitHub: https://github.com/dynverse/dynwrap
* Source code: https://github.com/cran/dynwrap
* Date/Publication: 2023-07-19 09:20:02 UTC
* Number of recursive dependencies: 93

Run `revdepcheck::cloud_details(, "dynwrap")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dynwrap-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: simplify_igraph_network
    > ### Title: Simplify an igraph network such that consecutive linear edges
    > ###   are removed
    > ### Aliases: simplify_igraph_network
    > 
    > ### ** Examples
    > 
    > net <- data.frame(
    +   from = 1:2,
    +   to = 2:3,
    +   length = 1,
    +   directed = TRUE,
    +   stringsAsFactors = F
    + )
    > gr <- igraph::graph_from_data_frame(net)
    > simplify_igraph_network(gr)
    Warning: non-unique value when setting 'row.names': ‘#M#’
    Error in `map()`:
    ℹ In index: 1.
    Caused by error in `.rowNamesDF<-`:
    ! duplicate 'row.names' are not allowed
    Backtrace:
         ▆
      1. ├─dynwrap::simplify_igraph_network(gr)
      2. │ └─purrr::map_df(subgrs, igraph::as_data_frame, what = "vertices")
      3. │   └─purrr::map(.x, .f, ...)
      4. │     └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
      5. │       ├─purrr:::with_indexed_errors(...)
      6. │       │ └─base::withCallingHandlers(...)
      7. │       ├─purrr:::call_with_cleanup(...)
      8. │       └─igraph (local) .f(.x[[i]], ...)
      9. │         └─base::`rownames<-`(`*tmp*`, value = rn)
     10. │           ├─base::`row.names<-`(`*tmp*`, value = value)
     11. │           └─base::`row.names<-.data.frame`(`*tmp*`, value = value)
     12. │             └─base::`.rowNamesDF<-`(x, value = value)
     13. │               └─base::stop("duplicate 'row.names' are not allowed")
     14. └─base::.handleSimpleError(...)
     15.   └─purrr (local) h(simpleError(msg, call))
     16.     └─cli::cli_abort(...)
     17.       └─rlang::abort(...)
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
      [ FAIL 11 | WARN 30 | SKIP 3 | PASS 502 ]
      
      ══ Skipped tests (3) ═══════════════════════════════════════════════════════════
      • On CRAN (1): 'test-method_create_ti_method_container.R:5:1'
      • dyndimre2d cannot be loaded (1): 'test-wrap_add_dimred.R:110:3'
      • empty test (1): 'test-adapt_orient_topology.R:50:1'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-classify_milestone_network.R:164:3'): Example trajectories match ──
      <purrr_error_indexed/rlang_error/error/condition>
      Error in `map(., classify_milestone_network)`: ℹ In index: 2.
      Caused by error in `map()`:
      ℹ In index: 1.
      Caused by error in `.rowNamesDF<-`:
      ! duplicate 'row.names' are not allowed
      ── Error ('test-simplify_igraph_network.R:157:5'): Testing simplify_igraph_network on directed_linear ──
      <purrr_error_indexed/rlang_error/error/condition>
      Error in `map(.x, .f, ...)`: ℹ In index: 1.
      Caused by error in `.rowNamesDF<-`:
      ! duplicate 'row.names' are not allowed
      Backtrace:
           ▆
        1. ├─dynwrap::simplify_igraph_network(gr, allow_duplicated_edges = TRUE) at test-simplify_igraph_network.R:157:5
        2. │ └─purrr::map_df(subgrs, igraph::as_data_frame, what = "vertices")
        3. │   └─purrr::map(.x, .f, ...)
        4. │     └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
        5. │       ├─purrr:::with_indexed_errors(...)
        6. │       │ └─base::withCallingHandlers(...)
        7. │       ├─purrr:::call_with_cleanup(...)
        8. │       └─igraph (local) .f(.x[[i]], ...)
        9. │         └─base::`rownames<-`(`*tmp*`, value = rn)
       10. │           ├─base::`row.names<-`(`*tmp*`, value = value)
       11. │           └─base::`row.names<-.data.frame`(`*tmp*`, value = value)
       12. │             └─base::`.rowNamesDF<-`(x, value = value)
       13. │               └─base::stop("duplicate 'row.names' are not allowed")
       14. └─base::.handleSimpleError(...)
       15.   └─purrr (local) h(simpleError(msg, call))
       16.     └─cli::cli_abort(...)
       17.       └─rlang::abort(...)
      ── Error ('test-simplify_igraph_network.R:157:5'): Testing simplify_igraph_network on directed_diverging ──
      <purrr_error_indexed/rlang_error/error/condition>
      Error in `map(.x, .f, ...)`: ℹ In index: 1.
      Caused by error in `.rowNamesDF<-`:
      ! duplicate 'row.names' are not allowed
      Backtrace:
           ▆
        1. ├─dynwrap::simplify_igraph_network(gr, allow_duplicated_edges = TRUE) at test-simplify_igraph_network.R:157:5
        2. │ └─purrr::map_df(subgrs, igraph::as_data_frame, what = "vertices")
        3. │   └─purrr::map(.x, .f, ...)
        4. │     └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
        5. │       ├─purrr:::with_indexed_errors(...)
        6. │       │ └─base::withCallingHandlers(...)
        7. │       ├─purrr:::call_with_cleanup(...)
        8. │       └─igraph (local) .f(.x[[i]], ...)
        9. │         └─base::`rownames<-`(`*tmp*`, value = rn)
       10. │           ├─base::`row.names<-`(`*tmp*`, value = value)
       11. │           └─base::`row.names<-.data.frame`(`*tmp*`, value = value)
       12. │             └─base::`.rowNamesDF<-`(x, value = value)
       13. │               └─base::stop("duplicate 'row.names' are not allowed")
       14. └─base::.handleSimpleError(...)
       15.   └─purrr (local) h(simpleError(msg, call))
       16.     └─cli::cli_abort(...)
       17.       └─rlang::abort(...)
      ── Error ('test-simplify_igraph_network.R:157:5'): Testing simplify_igraph_network on undirected_linear ──
      <purrr_error_indexed/rlang_error/error/condition>
      Error in `map(.x, .f, ...)`: ℹ In index: 1.
      Caused by error in `.rowNamesDF<-`:
      ! duplicate 'row.names' are not allowed
      Backtrace:
           ▆
        1. ├─dynwrap::simplify_igraph_network(gr, allow_duplicated_edges = TRUE) at test-simplify_igraph_network.R:157:5
        2. │ └─purrr::map_df(subgrs, igraph::as_data_frame, what = "vertices")
        3. │   └─purrr::map(.x, .f, ...)
        4. │     └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
        5. │       ├─purrr:::with_indexed_errors(...)
        6. │       │ └─base::withCallingHandlers(...)
        7. │       ├─purrr:::call_with_cleanup(...)
        8. │       └─igraph (local) .f(.x[[i]], ...)
        9. │         └─base::`rownames<-`(`*tmp*`, value = rn)
       10. │           ├─base::`row.names<-`(`*tmp*`, value = value)
       11. │           └─base::`row.names<-.data.frame`(`*tmp*`, value = value)
       12. │             └─base::`.rowNamesDF<-`(x, value = value)
       13. │               └─base::stop("duplicate 'row.names' are not allowed")
       14. └─base::.handleSimpleError(...)
       15.   └─purrr (local) h(simpleError(msg, call))
       16.     └─cli::cli_abort(...)
       17.       └─rlang::abort(...)
      ── Error ('test-simplify_igraph_network.R:157:5'): Testing simplify_igraph_network on simple_branching ──
      <purrr_error_indexed/rlang_error/error/condition>
      Error in `map(.x, .f, ...)`: ℹ In index: 1.
      Caused by error in `.rowNamesDF<-`:
      ! duplicate 'row.names' are not allowed
      Backtrace:
           ▆
        1. ├─dynwrap::simplify_igraph_network(gr, allow_duplicated_edges = TRUE) at test-simplify_igraph_network.R:157:5
        2. │ └─purrr::map_df(subgrs, igraph::as_data_frame, what = "vertices")
        3. │   └─purrr::map(.x, .f, ...)
        4. │     └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
        5. │       ├─purrr:::with_indexed_errors(...)
        6. │       │ └─base::withCallingHandlers(...)
        7. │       ├─purrr:::call_with_cleanup(...)
        8. │       └─igraph (local) .f(.x[[i]], ...)
        9. │         └─base::`rownames<-`(`*tmp*`, value = rn)
       10. │           ├─base::`row.names<-`(`*tmp*`, value = value)
       11. │           └─base::`row.names<-.data.frame`(`*tmp*`, value = value)
       12. │             └─base::`.rowNamesDF<-`(x, value = value)
       13. │               └─base::stop("duplicate 'row.names' are not allowed")
       14. └─base::.handleSimpleError(...)
       15.   └─purrr (local) h(simpleError(msg, call))
       16.     └─cli::cli_abort(...)
       17.       └─rlang::abort(...)
      ── Error ('test-simplify_igraph_network.R:157:5'): Testing simplify_igraph_network on simple_undirected_branching ──
      <purrr_error_indexed/rlang_error/error/condition>
      Error in `map(.x, .f, ...)`: ℹ In index: 1.
      Caused by error in `.rowNamesDF<-`:
      ! duplicate 'row.names' are not allowed
      Backtrace:
           ▆
        1. ├─dynwrap::simplify_igraph_network(gr, allow_duplicated_edges = TRUE) at test-simplify_igraph_network.R:157:5
        2. │ └─purrr::map_df(subgrs, igraph::as_data_frame, what = "vertices")
        3. │   └─purrr::map(.x, .f, ...)
        4. │     └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
        5. │       ├─purrr:::with_indexed_errors(...)
        6. │       │ └─base::withCallingHandlers(...)
        7. │       ├─purrr:::call_with_cleanup(...)
        8. │       └─igraph (local) .f(.x[[i]], ...)
        9. │         └─base::`rownames<-`(`*tmp*`, value = rn)
       10. │           ├─base::`row.names<-`(`*tmp*`, value = value)
       11. │           └─base::`row.names<-.data.frame`(`*tmp*`, value = value)
       12. │             └─base::`.rowNamesDF<-`(x, value = value)
       13. │               └─base::stop("duplicate 'row.names' are not allowed")
       14. └─base::.handleSimpleError(...)
       15.   └─purrr (local) h(simpleError(msg, call))
       16.     └─cli::cli_abort(...)
       17.       └─rlang::abort(...)
      ── Error ('test-simplify_igraph_network.R:157:5'): Testing simplify_igraph_network on branching ──
      <purrr_error_indexed/rlang_error/error/condition>
      Error in `map(.x, .f, ...)`: ℹ In index: 1.
      Caused by error in `.rowNamesDF<-`:
      ! duplicate 'row.names' are not allowed
      Backtrace:
           ▆
        1. ├─dynwrap::simplify_igraph_network(gr, allow_duplicated_edges = TRUE) at test-simplify_igraph_network.R:157:5
        2. │ └─purrr::map_df(subgrs, igraph::as_data_frame, what = "vertices")
        3. │   └─purrr::map(.x, .f, ...)
        4. │     └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
        5. │       ├─purrr:::with_indexed_errors(...)
        6. │       │ └─base::withCallingHandlers(...)
        7. │       ├─purrr:::call_with_cleanup(...)
        8. │       └─igraph (local) .f(.x[[i]], ...)
        9. │         └─base::`rownames<-`(`*tmp*`, value = rn)
       10. │           ├─base::`row.names<-`(`*tmp*`, value = value)
       11. │           └─base::`row.names<-.data.frame`(`*tmp*`, value = value)
       12. │             └─base::`.rowNamesDF<-`(x, value = value)
       13. │               └─base::stop("duplicate 'row.names' are not allowed")
       14. └─base::.handleSimpleError(...)
       15.   └─purrr (local) h(simpleError(msg, call))
       16.     └─cli::cli_abort(...)
       17.       └─rlang::abort(...)
      ── Error ('test-simplify_igraph_network.R:157:5'): Testing simplify_igraph_network on branching_converging ──
      <purrr_error_indexed/rlang_error/error/condition>
      Error in `map(.x, .f, ...)`: ℹ In index: 1.
      Caused by error in `.rowNamesDF<-`:
      ! duplicate 'row.names' are not allowed
      Backtrace:
           ▆
        1. ├─dynwrap::simplify_igraph_network(gr, allow_duplicated_edges = TRUE) at test-simplify_igraph_network.R:157:5
        2. │ └─purrr::map_df(subgrs, igraph::as_data_frame, what = "vertices")
        3. │   └─purrr::map(.x, .f, ...)
        4. │     └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
        5. │       ├─purrr:::with_indexed_errors(...)
        6. │       │ └─base::withCallingHandlers(...)
        7. │       ├─purrr:::call_with_cleanup(...)
        8. │       └─igraph (local) .f(.x[[i]], ...)
        9. │         └─base::`rownames<-`(`*tmp*`, value = rn)
       10. │           ├─base::`row.names<-`(`*tmp*`, value = value)
       11. │           └─base::`row.names<-.data.frame`(`*tmp*`, value = value)
       12. │             └─base::`.rowNamesDF<-`(x, value = value)
       13. │               └─base::stop("duplicate 'row.names' are not allowed")
       14. └─base::.handleSimpleError(...)
       15.   └─purrr (local) h(simpleError(msg, call))
       16.     └─cli::cli_abort(...)
       17.       └─rlang::abort(...)
      ── Failure ('test-simplify_igraph_network.R:176:5'): Testing simplify_igraph_network on cyclical ──
      `pass_check` is not TRUE
      
      `actual`:   FALSE
      `expected`: TRUE 
      ── Error ('test-simplify_igraph_network.R:157:5'): Testing simplify_igraph_network on undirected_branching_converging ──
      <purrr_error_indexed/rlang_error/error/condition>
      Error in `map(.x, .f, ...)`: ℹ In index: 1.
      Caused by error in `.rowNamesDF<-`:
      ! duplicate 'row.names' are not allowed
      Backtrace:
           ▆
        1. ├─dynwrap::simplify_igraph_network(gr, allow_duplicated_edges = TRUE) at test-simplify_igraph_network.R:157:5
        2. │ └─purrr::map_df(subgrs, igraph::as_data_frame, what = "vertices")
        3. │   └─purrr::map(.x, .f, ...)
        4. │     └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
        5. │       ├─purrr:::with_indexed_errors(...)
        6. │       │ └─base::withCallingHandlers(...)
        7. │       ├─purrr:::call_with_cleanup(...)
        8. │       └─igraph (local) .f(.x[[i]], ...)
        9. │         └─base::`rownames<-`(`*tmp*`, value = rn)
       10. │           ├─base::`row.names<-`(`*tmp*`, value = value)
       11. │           └─base::`row.names<-.data.frame`(`*tmp*`, value = value)
       12. │             └─base::`.rowNamesDF<-`(x, value = value)
       13. │               └─base::stop("duplicate 'row.names' are not allowed")
       14. └─base::.handleSimpleError(...)
       15.   └─purrr (local) h(simpleError(msg, call))
       16.     └─cli::cli_abort(...)
       17.       └─rlang::abort(...)
      ── Error ('test-simplify_igraph_network.R:184:3'): simplify_igraph_network's allow_duplicated_edges parameter ──
      Error in `igraph::graph_from_data_frame(net, directed = TRUE, vertices = 1:4)`: `vertices` must be a data frame or a character vector if given
      Backtrace:
          ▆
       1. └─igraph::graph_from_data_frame(net, directed = TRUE, vertices = 1:4) at test-simplify_igraph_network.R:184:3
      
      [ FAIL 11 | WARN 30 | SKIP 3 | PASS 502 ]
      Error: Test failures
      Execution halted
    ```

# egor

<details>

* Version: 1.24.2
* GitHub: https://github.com/tilltnet/egor
* Source code: https://github.com/cran/egor
* Date/Publication: 2024-02-02 05:30:02 UTC
* Number of recursive dependencies: 90

Run `revdepcheck::cloud_details(, "egor")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘egor-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ego_constraint
    > ### Title: Calculate Burt constraint for the egos of ego-centered networks
    > ### Aliases: ego_constraint
    > 
    > ### ** Examples
    > 
    > data(egor32)
    > ego_constraint(egor32)
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Warning: Unknown or uninitialised column: `name`.
    Error in `purrr::map_dbl()`:
    ℹ In index: 1.
    ℹ With name: 1.
    Caused by error in `simple_vs_index()`:
    ! Unknown vertex selected
    Backtrace:
         ▆
      1. ├─egor::ego_constraint(egor32)
      2. │ └─purrr::map_dbl(...)
      3. │   └─purrr:::map_("double", .x, .f, ..., .progress = .progress)
      4. │     ├─purrr:::with_indexed_errors(...)
      5. │     │ └─base::withCallingHandlers(...)
      6. │     ├─purrr:::call_with_cleanup(...)
      7. │     └─egor (local) .f(.x[[i]], ...)
      8. │       ├─igraph::constraint(...)
      9. │       │ └─igraph:::as_igraph_vs(graph, nodes)
     10. │       ├─igraph::V(.)[igraph::V(.)$name == "ego"]
     11. │       └─igraph:::`[.igraph.vs`(igraph::V(.), igraph::V(.)$name == "ego")
     12. │         └─base::lapply(...)
     13. │           └─igraph (local) FUN(X[[i]], ...)
     14. │             └─igraph:::simple_vs_index(x, ii, na_ok)
     15. │               └─base::stop("Unknown vertex selected")
     16. └─base::.handleSimpleError(...)
     17.   └─purrr (local) h(simpleError(msg, call))
     18.     └─cli::cli_abort(...)
     19.       └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(egor)
      Loading required package: dplyr
      
      Attaching package: 'dplyr'
      
      The following object is masked from 'package:testthat':
      
          matches
      
      The following objects are masked from 'package:stats':
      
          filter, lag
      
      The following objects are masked from 'package:base':
      
          intersect, setdiff, setequal, union
      
      Loading required package: tibble
      > library(dplyr)
      > 
      > test_check("egor")
      5 Egos/ Ego Networks 
      67 Alters 
      Min. Netsize 9 
      Average Netsize 13.4 
      Max. Netsize 19 
      Average Density 0.504810141652247 
      
      Ego sampling design:
      Independent Sampling design (with replacement)
      Called via srvyr
      Sampling variables:
       - ids: `1`
       - weights: sampling_weight
      Data variables: .egoID (dbl), sex (chr), age (fct), age.years (int), country
        (chr), income (dbl), sampling_weight (dbl), avg_nts (dbl)
      Alter survey design:
        Maximum nominations: Inf 
      5 Egos/ Ego Networks 
      67 Alters 
      Min. Netsize 9 
      Average Netsize 13.4 
      Max. Netsize 19 
      Average Density 0.504810141652247 
      
      Ego sampling design:
      Independent Sampling design (with replacement)
      Called via srvyr
      Sampling variables:
       - ids: `1`
       - weights: sampling_weight
      Data variables: .egoID (dbl), sex (chr), age (fct), age.years (int), country
        (chr), income (dbl), sampling_weight (dbl), avg_nts (dbl)
      Alter survey design:
        Maximum nominations: Inf 
      3 Egos/ Ego Networks 
      25 Alters 
      Min. Netsize 7 
      Average Netsize 8.33333333333333 
      Max. Netsize 9 
      Average Density 0.505291005291005 
      Alter survey design:
        Maximum nominations: Inf 
      32 Egos/ Ego Networks 
      384 Alters 
      Min. Netsize 12 
      Average Netsize 12 
      Max. Netsize 12 
      Average Density 0.5 
      
      Ego sampling design:
      Independent Sampling design (with replacement)
      Called via srvyr
      Data variables: .egoID (dbl), sex (fct), age (fct), age.years (int), country
        (chr), income (dbl), avg_nts (dbl)
      Alter survey design:
        Maximum nominations: Inf 
      5 Egos/ Ego Networks 
      16 Alters 
      Min. Netsize 4 
      Average Netsize 4 
      Max. Netsize 4 
      Average Density 1.33333333333333 
      Alter survey design:
        Maximum nominations: Inf 
      4 Egos/ Ego Networks 
      16 Alters 
      Min. Netsize 4 
      Average Netsize 4 
      Max. Netsize 4 
      Average Density 1.33333333333333 
      Alter survey design:
        Maximum nominations: Inf 
      Sorting data by egoID: Transforming alters data to long format: Transforming wide dyad data to edgelist: Sorting data by egoID: Transforming alters data to long format: Transforming wide dyad data to edgelist: Filtering out empty alter entries using provided network size values: Sorting data by egoID: Transforming alters data to long format: Transforming wide dyad data to edgelist: [ FAIL 22 | WARN 327 | SKIP 15 | PASS 187 ]
      
      ══ Skipped tests (15) ══════════════════════════════════════════════════════════
      • On CRAN (15): 'test-ei.R:3:11', 'test-ei.R:72:13', 'test-ei.R:85:13',
        'test-ei.R:95:13', 'test-ei.R:125:13', 'test-ei.R:141:3', 'test-ei.R:150:3',
        'test-ei.R:164:3', 'test-onefile_to_egor.R:5:3',
        'test-onefile_to_egor.R:35:3', 'test-onefile_to_egor.R:67:3',
        'test-twofiles_to_egor.R:2:3', 'test-twofiles_to_egor.R:34:3',
        'test-twofiles_to_egor.R:65:3', 'test-twofiles_to_egor.R:94:13'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-as_egor.R:23:3'): as.egor.list() works for igraph objects. ───
      `as.egor(x = ig_l2, ego_name = "ego")` threw an error.
      Message: ℹ In index: 1.
      ℹ With name: 1.
      Caused by error in `.rowNamesDF<-`:
      ! duplicate 'row.names' are not allowed
      Class:   purrr_error_indexed/rlang_error/error/condition
      Backtrace:
           ▆
        1. ├─testthat::expect_error(...) at test-as_egor.R:23:3
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. ├─egor::as.egor(x = ig_l2, ego_name = "ego")
        7. ├─egor:::as.egor.list(x = ig_l2, ego_name = "ego")
        8. │ └─egor:::as_egor_igraph(x, ego_name)
        9. │   └─purrr::map_dfr(x, igraph::as_data_frame, what = "vertices", .id = "ego_id")
       10. │     └─purrr::map(.x, .f, ...)
       11. │       └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
       12. │         ├─purrr:::with_indexed_errors(...)
       13. │         │ └─base::withCallingHandlers(...)
       14. │         ├─purrr:::call_with_cleanup(...)
       15. │         └─igraph (local) .f(.x[[i]], ...)
       16. │           └─base::`rownames<-`(`*tmp*`, value = rn)
       17. │             ├─base::`row.names<-`(`*tmp*`, value = value)
       18. │             └─base::`row.names<-.data.frame`(`*tmp*`, value = value)
       19. │               └─base::`.rowNamesDF<-`(x, value = value)
       20. │                 └─base::stop("duplicate 'row.names' are not allowed")
       21. └─base::.handleSimpleError(...)
       22.   └─purrr (local) h(simpleError(msg, call))
       23.     └─cli::cli_abort(...)
       24.       └─rlang::abort(...)
      ── Failure ('test-as_egor.R:24:3'): as.egor.list() works for igraph objects. ───
      `as.egor(x = ig_l2, ego_name = rep("ego", 32))` threw an error.
      Message: ℹ In index: 1.
      ℹ With name: 1.
      Caused by error in `.rowNamesDF<-`:
      ! duplicate 'row.names' are not allowed
      Class:   purrr_error_indexed/rlang_error/error/condition
      Backtrace:
           ▆
        1. ├─testthat::expect_error(...) at test-as_egor.R:24:3
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. ├─egor::as.egor(x = ig_l2, ego_name = rep("ego", 32))
        7. ├─egor:::as.egor.list(x = ig_l2, ego_name = rep("ego", 32))
        8. │ └─egor:::as_egor_igraph(x, ego_name)
        9. │   └─purrr::map_dfr(x, igraph::as_data_frame, what = "vertices", .id = "ego_id")
       10. │     └─purrr::map(.x, .f, ...)
       11. │       └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
       12. │         ├─purrr:::with_indexed_errors(...)
       13. │         │ └─base::withCallingHandlers(...)
       14. │         ├─purrr:::call_with_cleanup(...)
       15. │         └─igraph (local) .f(.x[[i]], ...)
       16. │           └─base::`rownames<-`(`*tmp*`, value = rn)
       17. │             ├─base::`row.names<-`(`*tmp*`, value = value)
       18. │             └─base::`row.names<-.data.frame`(`*tmp*`, value = value)
       19. │               └─base::`.rowNamesDF<-`(x, value = value)
       20. │                 └─base::stop("duplicate 'row.names' are not allowed")
       21. └─base::.handleSimpleError(...)
       22.   └─purrr (local) h(simpleError(msg, call))
       23.     └─cli::cli_abort(...)
       24.       └─rlang::abort(...)
      ── Failure ('test-clustered_graphs.R:24:5'): Methods are working with partially missing data. ──
      `clustered_graphs(mpf, "country")` threw an error.
      Message: Length of new attribute value must be 1 or 16, the number of target vertices, not 20
      Class:   simpleError/error/condition
      Backtrace:
           ▆
        1. ├─testthat::expect_error(clustered_graphs(mpf, "country"), NA) at test-clustered_graphs.R:24:5
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. ├─egor::clustered_graphs(mpf, "country")
        7. └─egor:::clustered_graphs.egor(mpf, "country")
        8.   ├─egor::clustered_graphs(...)
        9.   └─egor:::clustered_graphs.list(...)
       10.     └─base::mapply(...)
       11.       └─egor (local) `<fn>`(dots[[1L]][[1L]], dots[[2L]][[1L]])
       12.         └─igraph::graph.data.frame(d = x, vertices = y, directed = FALSE)
       13.           └─igraph::graph_from_data_frame(d = d, directed = directed, vertices = vertices)
       14.             └─igraph::add_vertices(g, length(names), attr = vattrs)
       15.               └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       16.                 └─igraph:::i_set_vertex_attr(...)
      ── Failure ('test-clustered_graphs.R:36:5'): Methods work (properly) with NAs in grouping variable. ──
      `clustered_graphs(mpf, "country")` threw an error.
      Message: Length of new attribute value must be 1 or 27, the number of target vertices, not 24
      Class:   simpleError/error/condition
      Backtrace:
           ▆
        1. ├─testthat::expect_error(clustered_graphs(mpf, "country"), NA) at test-clustered_graphs.R:36:5
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. ├─egor::clustered_graphs(mpf, "country")
        7. └─egor:::clustered_graphs.egor(mpf, "country")
        8.   ├─egor::clustered_graphs(...)
        9.   └─egor:::clustered_graphs.list(...)
       10.     └─base::mapply(...)
       11.       └─egor (local) `<fn>`(dots[[1L]][[1L]], dots[[2L]][[1L]])
       12.         └─igraph::graph.data.frame(d = x, vertices = y, directed = FALSE)
       13.           └─igraph::graph_from_data_frame(d = d, directed = directed, vertices = vertices)
       14.             └─igraph::add_vertices(g, length(names), attr = vattrs)
       15.               └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       16.                 └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-clustered_graphs.R:39:5'): Methods work (properly) with NAs in grouping variable. ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 27, the number of target vertices, not 24
      Backtrace:
           ▆
        1. ├─igraph::V(clustered_graphs(mpf, "country")[[1]]) at test-clustered_graphs.R:39:5
        2. │ └─igraph:::ensure_igraph(graph)
        3. ├─egor::clustered_graphs(mpf, "country")
        4. └─egor:::clustered_graphs.egor(mpf, "country")
        5.   ├─egor::clustered_graphs(...)
        6.   └─egor:::clustered_graphs.list(...)
        7.     └─base::mapply(...)
        8.       └─egor (local) `<fn>`(dots[[1L]][[1L]], dots[[2L]][[1L]])
        9.         └─igraph::graph.data.frame(d = x, vertices = y, directed = FALSE)
       10.           └─igraph::graph_from_data_frame(d = d, directed = directed, vertices = vertices)
       11.             └─igraph::add_vertices(g, length(names), attr = vattrs)
       12.               └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       13.                 └─igraph:::i_set_vertex_attr(...)
      ── Failure ('test-conversions.R:44:13'): as_igraph.nested_egor works ───────────
      `{ ... }` threw an error.
      Message: Length of new attribute value must be 1 or 0, the number of target vertices, not 2
      Class:   simpleError/error/condition
      Backtrace:
           ▆
        1. ├─testthat::expect_error(...) at test-conversions.R:44:13
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. ├─egor::as_igraph(en, include.ego = T, ego.attrs = c("sex", "age")) at test-conversions.R:49:15
        7. └─egor:::as_igraph.nested_egor(...)
        8.   └─base::mapply(...)
        9.     └─egor (local) `<fn>`(dots[[1L]][[2L]], dots[[2L]][[2L]])
       10.       └─igraph::graph.data.frame(...)
       11.         └─igraph::graph_from_data_frame(d = d, directed = directed, vertices = vertices)
       12.           └─igraph::add_vertices(g, length(names), attr = vattrs)
       13.             └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       14.               └─igraph:::i_set_vertex_attr(...)
      ── Failure ('test-ego_constraint.R:4:3'): ego_constraint works without weight ──
      `ego_constraint(object = e1)` threw an error.
      Message: Length of new attribute value must be 1 or 3, the number of target vertices, not 4
      Class:   simpleError/error/condition
      Backtrace:
           ▆
        1. ├─testthat::expect_error(ego_constraint(object = e1), NA) at test-ego_constraint.R:4:3
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. └─egor::ego_constraint(object = e1)
        7.   ├─egor::as_igraph(object, include.ego = TRUE, ego.alter.weights = ego.alter.weights)
        8.   └─egor:::as_igraph.egor(object, include.ego = TRUE, ego.alter.weights = ego.alter.weights)
        9.     ├─egor::as_igraph(...)
       10.     └─egor:::as_igraph.nested_egor(...)
       11.       └─base::mapply(...)
       12.         └─egor (local) `<fn>`(dots[[1L]][[28L]], dots[[2L]][[28L]])
       13.           └─igraph::graph.data.frame(...)
       14.             └─igraph::graph_from_data_frame(d = d, directed = directed, vertices = vertices)
       15.               └─igraph::add_vertices(g, length(names), attr = vattrs)
       16.                 └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       17.                   └─igraph:::i_set_vertex_attr(...)
      ── Failure ('test-ego_constraint.R:14:3'): ego_constraint works with weight ────
      `ego_constraint(object = e1, weight = "weight")` threw an error.
      Message: Length of new attribute value must be 1 or 5, the number of target vertices, not 6
      Class:   simpleError/error/condition
      Backtrace:
           ▆
        1. ├─testthat::expect_error(...) at test-ego_constraint.R:14:3
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. └─egor::ego_constraint(object = e1, weight = "weight")
        7.   ├─egor::as_igraph(object, include.ego = TRUE, ego.alter.weights = ego.alter.weights)
        8.   └─egor:::as_igraph.egor(object, include.ego = TRUE, ego.alter.weights = ego.alter.weights)
        9.     ├─egor::as_igraph(...)
       10.     └─egor:::as_igraph.nested_egor(...)
       11.       └─base::mapply(...)
       12.         └─egor (local) `<fn>`(dots[[1L]][[18L]], dots[[2L]][[18L]])
       13.           └─igraph::graph.data.frame(...)
       14.             └─igraph::graph_from_data_frame(d = d, directed = directed, vertices = vertices)
       15.               └─igraph::add_vertices(g, length(names), attr = vattrs)
       16.                 └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       17.                   └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-ego_constraint.R:24:3'): ego_constraint() returns tbl_svy object, when ego_design present ──
      <purrr_error_indexed/rlang_error/error/condition>
      Error in `purrr::map_dbl(graphs, ~igraph::constraint(., weights = if (is.null(weights)) rep(1, 
          length(igraph::E(.))) else igraph::get.edge.attribute(., 
          weights), nodes = igraph::V(.)[igraph::V(.)$name == "ego"]))`: ℹ In index: 1.
      ℹ With name: 1.
      Caused by error in `simple_vs_index()`:
      ! Unknown vertex selected
      Backtrace:
           ▆
        1. ├─egor::ego_constraint(object = x) at test-ego_constraint.R:24:3
        2. │ └─purrr::map_dbl(...)
        3. │   └─purrr:::map_("double", .x, .f, ..., .progress = .progress)
        4. │     ├─purrr:::with_indexed_errors(...)
        5. │     │ └─base::withCallingHandlers(...)
        6. │     ├─purrr:::call_with_cleanup(...)
        7. │     └─egor (local) .f(.x[[i]], ...)
        8. │       ├─igraph::constraint(...)
        9. │       │ └─igraph:::as_igraph_vs(graph, nodes)
       10. │       ├─igraph::V(.)[igraph::V(.)$name == "ego"]
       11. │       └─igraph:::`[.igraph.vs`(igraph::V(.), igraph::V(.)$name == "ego")
       12. │         └─base::lapply(...)
       13. │           └─igraph (local) FUN(X[[i]], ...)
       14. │             └─igraph:::simple_vs_index(x, ii, na_ok)
       15. │               └─base::stop("Unknown vertex selected")
       16. └─base::.handleSimpleError(...)
       17.   └─purrr (local) h(simpleError(msg, call))
       18.     └─cli::cli_abort(...)
       19.       └─rlang::abort(...)
      ── Failure ('test-plot_egor.R:9:3'): plot plots egor objects ───────────────────
      `{ ... }` threw an error.
      Message: Length of new attribute value must be 1 or 4, the number of target vertices, not 5
      Class:   simpleError/error/condition
      Backtrace:
           ▆
        1. ├─testthat::expect_error(...) at test-plot_egor.R:9:3
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. ├─base::plot(...) at test-plot_egor.R:12:5
        7. └─egor:::plot.egor(...)
        8.   └─egor::plot_egor(x, ...)
        9.     └─egor::plot_ego_graphs(...)
       10.       └─egor:::plot_one_ego_graph(...)
       11.         ├─egor::as_igraph(...)
       12.         └─egor:::as_igraph.egor(...)
       13.           ├─egor::as_igraph(...)
       14.           └─egor:::as_igraph.nested_egor(...)
       15.             └─base::mapply(...)
       16.               └─egor (local) `<fn>`(dots[[1L]][[1L]], dots[[2L]][[1L]])
       17.                 └─igraph::graph.data.frame(...)
       18.                   └─igraph::graph_from_data_frame(d = d, directed = directed, vertices = vertices)
       19.                     └─igraph::add_vertices(g, length(names), attr = vattrs)
       20.                       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       21.                         └─igraph:::i_set_vertex_attr(...)
      ── Failure ('test-plot_egor.R:110:3'): plot_ego_graphs works with minmal arguments ──
      `{ ... }` threw an error.
      Message: Length of new attribute value must be 1 or 4, the number of target vertices, not 5
      Class:   simpleError/error/condition
      Backtrace:
           ▆
        1. ├─testthat::expect_error(...) at test-plot_egor.R:110:3
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. └─egor::plot_ego_graphs(e) at test-plot_egor.R:112:5
        7.   └─egor:::plot_one_ego_graph(...)
        8.     ├─egor::as_igraph(...)
        9.     └─egor:::as_igraph.egor(...)
       10.       ├─egor::as_igraph(...)
       11.       └─egor:::as_igraph.nested_egor(...)
       12.         └─base::mapply(...)
       13.           └─egor (local) `<fn>`(dots[[1L]][[1L]], dots[[2L]][[1L]])
       14.             └─igraph::graph.data.frame(...)
       15.               └─igraph::graph_from_data_frame(d = d, directed = directed, vertices = vertices)
       16.                 └─igraph::add_vertices(g, length(names), attr = vattrs)
       17.                   └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       18.                     └─igraph:::i_set_vertex_attr(...)
      ── Failure ('test-plot_egor.R:117:3'): plot_ego_graphs works with vertex_color_var ──
      `{ ... }` threw an error.
      Message: zero-length 'labels' specified
      Class:   simpleError/error/condition
      Backtrace:
           ▆
        1. ├─testthat::expect_error(...) at test-plot_egor.R:117:3
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. └─egor::plot_ego_graphs(e, vertex_color_var = "sex") at test-plot_egor.R:119:5
        7.   └─egor:::plot_one_ego_graph(...)
        8.     └─igraph::plot.igraph(...)
        9.       ├─graphics::text(...)
       10.       └─graphics::text.default(...)
      ── Failure ('test-plot_egor.R:131:3'): plot_egograms doesn't fail on empty alters or aaties ──
      `plot_egograms(x = e, venn_var = "sex", pie_var = "country", show_venn_labels = TRUE)` threw an error.
      Message: Length of new attribute value must be 1 or 0, the number of target vertices, not 2
      Class:   simpleError/error/condition
      Backtrace:
           ▆
        1. ├─testthat::expect_error(...) at test-plot_egor.R:131:3
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. └─egor::plot_egograms(...)
        7.   └─egor:::plot_egogram(...)
        8.     ├─egor::as_igraph(ego_object, include.ego = include_ego)
        9.     └─egor:::as_igraph.egor(ego_object, include.ego = include_ego)
       10.       ├─egor::as_igraph(...)
       11.       └─egor:::as_igraph.nested_egor(...)
       12.         └─base::mapply(...)
       13.           └─egor (local) `<fn>`(dots[[1L]][[1L]], dots[[2L]][[1L]])
       14.             └─igraph::graph.data.frame(...)
       15.               └─igraph::graph_from_data_frame(d = d, directed = directed, vertices = vertices)
       16.                 └─igraph::add_vertices(g, length(names), attr = vattrs)
       17.                   └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       18.                     └─igraph:::i_set_vertex_attr(...)
      ── Failure ('test-plot_egor.R:152:3'): plot_egograms plots with and without venn labels ──
      `{ ... }` threw an error.
      Message: arguments imply differing number of rows: 2, 3
      Class:   simpleError/error/condition
      Backtrace:
           ▆
        1. ├─testthat::expect_error(...) at test-plot_egor.R:152:3
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. └─egor::plot_egograms(...) at test-plot_egor.R:154:5
        7.   └─egor:::plot_egogram(...)
        8.     ├─egor::as_igraph(ego_object, include.ego = include_ego)
        9.     └─egor:::as_igraph.egor(ego_object, include.ego = include_ego)
       10.       ├─egor::as_igraph(...)
       11.       └─egor:::as_igraph.nested_egor(...)
       12.         └─base::mapply(...)
       13.           └─egor (local) `<fn>`(dots[[1L]][[1L]], dots[[2L]][[1L]])
       14.             └─igraph::graph.data.frame(...)
       15.               └─igraph::graph_from_data_frame(d = d, directed = directed, vertices = vertices)
       16.                 └─base::cbind(data.frame(name = names), vertices)
       17.                   └─base::cbind(deparse.level, ...)
       18.                     └─base::data.frame(..., check.names = FALSE)
      ── Failure ('test-plot_egor.R:171:13'): plotting works when active data level is not ego ──
      `{ ... }` threw an error.
      Message: Length of new attribute value must be 1 or 0, the number of target vertices, not 2
      Class:   simpleError/error/condition
      Backtrace:
           ▆
        1. ├─testthat::expect_error(...) at test-plot_egor.R:171:13
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. └─egor::plot_egograms(...) at test-plot_egor.R:175:15
        7.   └─egor:::plot_egogram(...)
        8.     ├─egor::as_igraph(ego_object, include.ego = include_ego)
        9.     └─egor:::as_igraph.egor(ego_object, include.ego = include_ego)
       10.       ├─egor::as_igraph(...)
       11.       └─egor:::as_igraph.nested_egor(...)
       12.         └─base::mapply(...)
       13.           └─egor (local) `<fn>`(dots[[1L]][[1L]], dots[[2L]][[1L]])
       14.             └─igraph::graph.data.frame(...)
       15.               └─igraph::graph_from_data_frame(d = d, directed = directed, vertices = vertices)
       16.                 └─igraph::add_vertices(g, length(names), attr = vattrs)
       17.                   └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       18.                     └─igraph:::i_set_vertex_attr(...)
      ── Failure ('test-plot_egor.R:206:3'): plot_ego_graphs is fast ─────────────────
      `{ ... }` threw an error.
      Message: zero-length 'labels' specified
      Class:   simpleError/error/condition
      Backtrace:
           ▆
        1. ├─testthat::expect_error(...) at test-plot_egor.R:206:3
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. └─egor::plot_ego_graphs(make_egor(12, 16)) at test-plot_egor.R:207:5
        7.   └─egor:::plot_one_ego_graph(...)
        8.     └─igraph::plot.igraph(...)
        9.       ├─graphics::text(...)
       10.       └─graphics::text.default(...)
      ── Failure ('test-plot_egor.R:214:3'): plot_ego_gram adjusts node size according to venn count ──
      `{ ... }` threw an error.
      Message: arguments imply differing number of rows: 4, 5
      Class:   simpleError/error/condition
      Backtrace:
           ▆
        1. ├─testthat::expect_error(...) at test-plot_egor.R:214:3
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. └─egor::plot_egograms(x = e, ego_no = 2, venn_var = "sex", pie_var = "country") at test-plot_egor.R:217:5
        7.   └─egor:::plot_egogram(...)
        8.     ├─egor::as_igraph(ego_object, include.ego = include_ego)
        9.     └─egor:::as_igraph.egor(ego_object, include.ego = include_ego)
       10.       ├─egor::as_igraph(...)
       11.       └─egor:::as_igraph.nested_egor(...)
       12.         └─base::mapply(...)
       13.           └─egor (local) `<fn>`(dots[[1L]][[1L]], dots[[2L]][[1L]])
       14.             └─igraph::graph.data.frame(...)
       15.               └─igraph::graph_from_data_frame(d = d, directed = directed, vertices = vertices)
       16.                 └─base::cbind(data.frame(name = names), vertices)
       17.                   └─base::cbind(deparse.level, ...)
       18.                     └─base::data.frame(..., check.names = FALSE)
      ── Failure ('test-plot_egor.R:248:3'): plot_ego_gram works with edge arguments ──
      `{ ... }` threw an error.
      Message: zero-length 'labels' specified
      Class:   simpleError/error/condition
      Backtrace:
           ▆
        1. ├─testthat::expect_error(...) at test-plot_egor.R:248:3
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. └─egor::plot_ego_graphs(...) at test-plot_egor.R:261:5
        7.   └─egor:::plot_one_ego_graph(...)
        8.     └─igraph::plot.igraph(...)
        9.       ├─graphics::text(...)
       10.       └─graphics::text.default(...)
      ── Error ('test-plot_egor.R:460:3'): egograms with reverse ordered alters plot correctly ──
      Error in `data.frame(..., check.names = FALSE)`: arguments imply differing number of rows: 0, 3
      Backtrace:
           ▆
        1. └─egor::plot_egograms(...) at test-plot_egor.R:460:3
        2.   └─egor:::plot_egogram(...)
        3.     ├─egor::as_igraph(ego_object, include.ego = include_ego)
        4.     └─egor:::as_igraph.egor(ego_object, include.ego = include_ego)
        5.       ├─egor::as_igraph(...)
        6.       └─egor:::as_igraph.nested_egor(...)
        7.         └─base::mapply(...)
        8.           └─egor (local) `<fn>`(dots[[1L]][[1L]], dots[[2L]][[1L]])
        9.             └─igraph::graph.data.frame(...)
       10.               └─igraph::graph_from_data_frame(d = d, directed = directed, vertices = vertices)
       11.                 └─base::cbind(data.frame(name = names), vertices)
       12.                   └─base::cbind(deparse.level, ...)
       13.                     └─base::data.frame(..., check.names = FALSE)
      ── Failure ('test-rotate.R:13:3'): rotate_xy() works with a 2x2 matrix ─────────
      ``%>%`(...)` threw an error.
      Message: Length of new attribute value must be 1 or 0, the number of target vertices, not 2
      Class:   simpleError/error/condition
      Backtrace:
           ▆
        1. ├─testthat::expect_error(...) at test-rotate.R:13:3
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. ├─... %>% rotate_xy(1)
        7. ├─egor:::rotate_xy(., 1)
        8. ├─igraph::layout_in_circle(.)
        9. │ └─igraph:::ensure_igraph(graph)
       10. ├─egor::as_igraph(.)
       11. └─egor:::as_igraph.egor(.)
       12.   ├─egor::as_igraph(...)
       13.   └─egor:::as_igraph.nested_egor(...)
       14.     └─base::mapply(...)
       15.       └─egor (local) `<fn>`(dots[[1L]][[1L]], dots[[2L]][[1L]])
       16.         └─igraph::graph.data.frame(...)
       17.           └─igraph::graph_from_data_frame(d = d, directed = directed, vertices = vertices)
       18.             └─igraph::add_vertices(g, length(names), attr = vattrs)
       19.               └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       20.                 └─igraph:::i_set_vertex_attr(...)
      ── Failure ('test-rotate.R:35:3'): rotate_to_equilibrium() works with a 2x2 matrix ──
      ``%>%`(...)` threw an error.
      Message: Length of new attribute value must be 1 or 0, the number of target vertices, not 2
      Class:   simpleError/error/condition
      Backtrace:
           ▆
        1. ├─testthat::expect_error(...) at test-rotate.R:35:3
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. ├─... %>% rotate_to_equilibrium()
        7. ├─egor:::rotate_to_equilibrium(.)
        8. ├─igraph::layout_in_circle(.)
        9. │ └─igraph:::ensure_igraph(graph)
       10. ├─egor::as_igraph(.)
       11. └─egor:::as_igraph.egor(.)
       12.   ├─egor::as_igraph(...)
       13.   └─egor:::as_igraph.nested_egor(...)
       14.     └─base::mapply(...)
       15.       └─egor (local) `<fn>`(dots[[1L]][[1L]], dots[[2L]][[1L]])
       16.         └─igraph::graph.data.frame(...)
       17.           └─igraph::graph_from_data_frame(d = d, directed = directed, vertices = vertices)
       18.             └─igraph::add_vertices(g, length(names), attr = vattrs)
       19.               └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       20.                 └─igraph:::i_set_vertex_attr(...)
      ── Failure ('test-rotate.R:44:3'): rotate_to_equilibrium() works with a 2x2 matrix ──
      ``%>%`(...)` threw an error.
      Message: Length of new attribute value must be 1 or 0, the number of target vertices, not 2
      Class:   simpleError/error/condition
      Backtrace:
           ▆
        1. ├─testthat::expect_error(...) at test-rotate.R:44:3
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─base::withCallingHandlers(...)
        5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        6. ├─... %>% rotate_to_equilibrium()
        7. ├─egor:::rotate_to_equilibrium(.)
        8. ├─igraph::layout_as_star(.)
        9. │ └─igraph:::ensure_igraph(graph)
       10. ├─egor::as_igraph(.)
       11. └─egor:::as_igraph.egor(.)
       12.   ├─egor::as_igraph(...)
       13.   └─egor:::as_igraph.nested_egor(...)
       14.     └─base::mapply(...)
       15.       └─egor (local) `<fn>`(dots[[1L]][[1L]], dots[[2L]][[1L]])
       16.         └─igraph::graph.data.frame(...)
       17.           └─igraph::graph_from_data_frame(d = d, directed = directed, vertices = vertices)
       18.             └─igraph::add_vertices(g, length(names), attr = vattrs)
       19.               └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       20.                 └─igraph:::i_set_vertex_attr(...)
      
      [ FAIL 22 | WARN 327 | SKIP 15 | PASS 187 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘egor_allbus.Rmd’ using rmarkdown
    
    Quitting from lines 179-181 [unnamed-chunk-11] (egor_allbus.Rmd)
    Error: processing vignette 'egor_allbus.Rmd' failed with diagnostics:
    arguments imply differing number of rows: 2, 3
    --- failed re-building ‘egor_allbus.Rmd’
    
    --- re-building ‘qualtrics.Rmd’ using rmarkdown
    --- finished re-building ‘qualtrics.Rmd’
    
    --- re-building ‘using_egor.Rmd’ using rmarkdown
    
    Quitting from lines 222-241 [unnamed-chunk-16] (using_egor.Rmd)
    Error: processing vignette 'using_egor.Rmd' failed with diagnostics:
    arguments imply differing number of rows: 5, 7
    --- failed re-building ‘using_egor.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘egor_allbus.Rmd’ ‘using_egor.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# epicontacts

<details>

* Version: 1.1.4
* GitHub: https://github.com/reconhub/epicontacts
* Source code: https://github.com/cran/epicontacts
* Date/Publication: 2024-04-30 11:42:43 UTC
* Number of recursive dependencies: 84

Run `revdepcheck::cloud_details(, "epicontacts")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘epicontacts-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as.igraph.epicontacts
    > ### Title: Create igraph object from contact data
    > ### Aliases: as.igraph.epicontacts
    > 
    > ### ** Examples
    > 
    > 
    > if (require(outbreaks) && require(igraph)) {
    + ## build data
    + 
    + x <- make_epicontacts(ebola_sim$linelist, ebola_sim$contacts,
    +                       id = "case_id", to = "case_id", from ="infector",
    +                       directed = TRUE)
    + 
    + 
    + ## subset data - keep 50 cases from linelist with contacts
    + 
    + ids <- get_id(x, "common")[1:50]
    + ids
    + x <- x[ids, ids]
    + 
    + 
    + ## make igraph object with associated attributes from epicontacts object
    + 
    + net <- as.igraph(x)
    + net
    + plot(net, vertex.label = "", vertex.size = 10,
    +      vertex.color = cases_pal(50))
    + }
    Loading required package: outbreaks
    Loading required package: igraph
    
    Attaching package: ‘igraph’
    
    The following objects are masked from ‘package:stats’:
    
        decompose, spectrum
    
    The following object is masked from ‘package:base’:
    
        union
    
    Error in data.frame(..., check.names = FALSE) : 
      arguments imply differing number of rows: 35, 50
    Calls: as.igraph ... as.igraph.epicontacts -> <Anonymous> -> cbind -> cbind -> data.frame
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘epicontacts.Rmd’ using rmarkdown
    
    Quitting from lines 128-130 [unnamed-chunk-9] (epicontacts.Rmd)
    Error: processing vignette 'epicontacts.Rmd' failed with diagnostics:
    arguments imply differing number of rows: 97, 162
    --- failed re-building ‘epicontacts.Rmd’
    
    --- re-building ‘epicontacts_class.Rmd’ using rmarkdown
    --- finished re-building ‘epicontacts_class.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘epicontacts.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# erah

<details>

* Version: 2.0.1
* GitHub: https://github.com/xdomingoal/erah-devel
* Source code: https://github.com/cran/erah
* Date/Publication: 2023-12-20 10:10:02 UTC
* Number of recursive dependencies: 90

Run `revdepcheck::cloud_details(, "erah")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(erah)
      
      
            _____        _
           |  __ \      | |        eRah R package:
        ___| |__) | __ _| |__   	 ----------------
       / _ \  _   // _` |  _ \     Untargeted GC-MS metabolomics profiling
      |  __/ |  \ \ (_| | | | |
       \___|_|   \_\__,_|_| |_|    Version 2.0.1
      
       - Type 'citation('erah')' for citing this R package in publications.
       - Type 'vignette('eRahManual', package='erah')' for a tutorial on eRah's usage.
       - For bugs, problems and issues, please do not hesitate in contacting xavier.domingoa@eurecat.org or opening an issue on the Github repository (https://github.com/xdomingoal/erah-devel/issues).
      > 
      > test_check("erah")
      [ FAIL 1 | WARN 3 | SKIP 0 | PASS 10 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-erah.R:39:3'): erah works ──────────────────────────────────────
      Error in `min.list[[j]] <- list(dist = group.distance, elements = w.minn)`: attempt to select less than one element in integerOneIndex
      Backtrace:
          ▆
       1. ├─erah::alignComp(deconvolvedEx, alParameters = ex.al.par) at test-erah.R:39:3
       2. └─erah::alignComp(deconvolvedEx, alParameters = ex.al.par)
       3.   └─erah:::align.factors(...)
       4.     └─base::lapply(...)
       5.       └─erah (local) FUN(X[[i]], ...)
       6.         └─erah:::comp.clusters(inter.distance.matrix, class.vector[clust])
      
      [ FAIL 1 | WARN 3 | SKIP 0 | PASS 10 ]
      Error: Test failures
      Execution halted
    ```

# fastRG

<details>

* Version: 0.3.2
* GitHub: https://github.com/RoheLab/fastRG
* Source code: https://github.com/cran/fastRG
* Date/Publication: 2023-08-21 21:40:02 UTC
* Number of recursive dependencies: 85

Run `revdepcheck::cloud_details(, "fastRG")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(fastRG)
      Loading required package: Matrix
      
      Attaching package: 'fastRG'
      
      The following object is masked from 'package:testthat':
      
          expectation
      
      > 
      > test_check("fastRG")
      
      Attaching package: 'igraph'
      
      The following object is masked from 'package:fastRG':
      
          sbm
      
      The following object is masked from 'package:testthat':
      
          compare
      
      The following objects are masked from 'package:stats':
      
          decompose, spectrum
      
      The following object is masked from 'package:base':
      
          union
      
      
      Attaching package: 'magrittr'
      
      The following objects are masked from 'package:testthat':
      
          equals, is_less_than, not
      
      
      Attaching package: 'tidygraph'
      
      The following object is masked from 'package:igraph':
      
          groups
      
      The following object is masked from 'package:testthat':
      
          matches
      
      The following object is masked from 'package:stats':
      
          filter
      
      
      Attaching package: 'dplyr'
      
      The following objects are masked from 'package:igraph':
      
          as_data_frame, groups, union
      
      The following object is masked from 'package:testthat':
      
          matches
      
      The following objects are masked from 'package:stats':
      
          filter, lag
      
      The following objects are masked from 'package:base':
      
          intersect, setdiff, setequal, union
      
      [ FAIL 1 | WARN 26 | SKIP 0 | PASS 96 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-retain-isolated-nodes.R:36:3'): sampling from undirected factor models doesn't drop isolated nodes ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 9999, the number of target vertices, not 10000
      Backtrace:
          ▆
       1. ├─fastRG::sample_igraph(latent) at test-retain-isolated-nodes.R:36:3
       2. └─fastRG:::sample_igraph.undirected_factor_model(latent)
       3.   └─igraph::graph_from_data_frame(edgelist, directed = FALSE, vertices = nodes)
       4.     └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.         └─igraph:::i_set_vertex_attr(...)
      
      [ FAIL 1 | WARN 26 | SKIP 0 | PASS 96 ]
      Error: Test failures
      Execution halted
    ```

# fbnet

<details>

* Version: 1.0.3
* GitHub: https://github.com/MarsicoFL/fbnet
* Source code: https://github.com/cran/fbnet
* Date/Publication: 2023-07-01 18:20:02 UTC
* Number of recursive dependencies: 28

Run `revdepcheck::cloud_details(, "fbnet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘fbnet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: buildCPTs
    > ### Title: buildCPTs: a function for building conditional probability
    > ###   tables based on pedigree bayesian network.
    > ### Aliases: buildCPTs
    > 
    > ### ** Examples
    > 
    > pbn  <- initBN(toyped)
    > bnet <- buildBN(pbn,QP=3)
    > bn1  <- buildCPTs(bnet)
    Error in lSelectorCPTs[[aux]] : no such index at level 1
    Calls: buildCPTs
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘assertthat’ ‘utils’
      All declared Imports should be used.
    ```

# GGally

<details>

* Version: 2.2.1
* GitHub: https://github.com/ggobi/ggally
* Source code: https://github.com/cran/GGally
* Date/Publication: 2024-02-14 00:53:32 UTC
* Number of recursive dependencies: 145

Run `revdepcheck::cloud_details(, "GGally")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > if (requireNamespace("testthat", quietly = TRUE)) {
      +   library(testthat)
      +   library(GGally)
      + 
      +   test_check("GGally")
      + }
      Loading required package: ggplot2
      Registered S3 method overwritten by 'GGally':
        method from   
        +.gg   ggplot2
      [ FAIL 3 | WARN 1 | SKIP 26 | PASS 474 ]
      
      ══ Skipped tests (26) ══════════════════════════════════════════════════════════
      • On CRAN (26): 'test-gg-plots.R:2:1', 'test-ggally_colbar.R:9:3',
        'test-ggally_colbar.R:71:3', 'test-ggally_cross.R:7:3',
        'test-ggally_trends.R:5:3', 'test-ggbivariate.R:6:3', 'test-ggcoef.R:7:3',
        'test-ggcorr.R:7:3', 'test-ggcorr.R:67:3', 'test-ggcorr.R:88:3',
        'test-ggcorr.R:95:3', 'test-ggfacet.R:20:3', 'test-gglegend.R:19:5',
        'test-gglegend.R:31:3', 'test-gglegend.R:84:3', 'test-ggmatrix.R:28:3',
        'test-ggmatrix.R:90:3', 'test-ggmatrix.R:119:3', 'test-ggmatrix.R:145:3',
        'test-ggnostic.R:61:3', 'test-ggscatmat.R:10:3', 'test-ggscatmat.R:19:3',
        'test-ggsurv.R:112:3', 'test-ggtable.R:6:3', 'test-vig_ggally.R:2:3',
        'test-zzz_ggpairs.R:2:1'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-ggnet.R:235:5'): examples ──────────────────────────────────────
      Error in `igraph::delete_vertex_attr(rval, "name")`: No such vertex attribute: name
      Backtrace:
          ▆
       1. ├─GGally::ggnet(asIgraph(n)) at test-ggnet.R:235:5
       2. ├─intergraph::asIgraph(n)
       3. └─intergraph:::asIgraph.network(n)
       4.   ├─intergraph::asIgraph(...)
       5.   └─intergraph:::asIgraph.data.frame(...)
       6.     └─igraph::delete_vertex_attr(rval, "name")
      ── Error ('test-ggnet2.R:266:5'): examples ─────────────────────────────────────
      Error in `igraph::delete_vertex_attr(rval, "name")`: No such vertex attribute: name
      Backtrace:
          ▆
       1. ├─GGally::ggnet2(asIgraph(n), color = "group") at test-ggnet2.R:266:5
       2. ├─intergraph::asIgraph(n)
       3. └─intergraph:::asIgraph.network(n)
       4.   ├─intergraph::asIgraph(...)
       5.   └─intergraph:::asIgraph.data.frame(...)
       6.     └─igraph::delete_vertex_attr(rval, "name")
      ── Error ('test-ggnetworkmap.R:224:5'): igraph conversion ──────────────────────
      Error in `igraph::delete_vertex_attr(rval, "name")`: No such vertex attribute: name
      Backtrace:
          ▆
       1. ├─intergraph::asIgraph(flights) at test-ggnetworkmap.R:224:5
       2. └─intergraph:::asIgraph.network(flights)
       3.   ├─intergraph::asIgraph(...)
       4.   └─intergraph:::asIgraph.data.frame(...)
       5.     └─igraph::delete_vertex_attr(rval, "name")
      
      [ FAIL 3 | WARN 1 | SKIP 26 | PASS 474 ]
      Error: Test failures
      Execution halted
    ```

# ggraph

<details>

* Version: 2.2.1
* GitHub: https://github.com/thomasp85/ggraph
* Source code: https://github.com/cran/ggraph
* Date/Publication: 2024-03-07 12:40:02 UTC
* Number of recursive dependencies: 115

Run `revdepcheck::cloud_details(, "ggraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: facet_edges
    > ### Title: Create small multiples based on edge attributes
    > ### Aliases: facet_edges
    > 
    > ### ** Examples
    > 
    > gr <- tidygraph::as_tbl_graph(highschool)
    Error in igraph::delete_vertex_attr(gr, "name") : 
      No such vertex attribute: name
    Calls: <Anonymous> ... as_tbl_graph.data.frame -> as_graph_edge_df -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Edges.Rmd’ using rmarkdown
    
    Quitting from lines 40-75 [unnamed-chunk-2] (Edges.Rmd)
    Error: processing vignette 'Edges.Rmd' failed with diagnostics:
    No such vertex attribute: name
    --- failed re-building ‘Edges.Rmd’
    
    --- re-building ‘Layouts.Rmd’ using rmarkdown
    
    Quitting from lines 35-45 [unnamed-chunk-2] (Layouts.Rmd)
    Error: processing vignette 'Layouts.Rmd' failed with diagnostics:
    No such vertex attribute: name
    --- failed re-building ‘Layouts.Rmd’
    
    --- re-building ‘Nodes.Rmd’ using rmarkdown
    
    Quitting from lines 27-35 [unnamed-chunk-2] (Nodes.Rmd)
    Error: processing vignette 'Nodes.Rmd' failed with diagnostics:
    No such vertex attribute: name
    --- failed re-building ‘Nodes.Rmd’
    
    --- re-building ‘tidygraph.Rmd’ using rmarkdown
    
    Quitting from lines 67-77 [unnamed-chunk-2] (tidygraph.Rmd)
    Error: processing vignette 'tidygraph.Rmd' failed with diagnostics:
    No such vertex attribute: name
    --- failed re-building ‘tidygraph.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘Edges.Rmd’ ‘Layouts.Rmd’ ‘Nodes.Rmd’ ‘tidygraph.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.1Mb
      sub-directories of 1Mb or more:
        R      1.5Mb
        doc    3.9Mb
        libs   2.9Mb
    ```

# grainscape

<details>

* Version: 0.4.4
* GitHub: https://github.com/achubaty/grainscape
* Source code: https://github.com/cran/grainscape
* Date/Publication: 2023-04-20 08:40:02 UTC
* Number of recursive dependencies: 96

Run `revdepcheck::cloud_details(, "grainscape")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘grainscape-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: GOC
    > ### Title: Produce a grains of connectivity model at multiple scales
    > ###   (patch-based or lattice GOC)
    > ### Aliases: GOC GOC,mpg-method
    > 
    > ### ** Examples
    > 
    > ## Load raster landscape
    > tiny <- raster::raster(system.file("extdata/tiny.asc", package = "grainscape"))
    > 
    > ## Create a resistance surface from a raster using an is-becomes reclassification
    > tinyCost <- raster::reclassify(tiny, rcl = cbind(c(1, 2, 3, 4), c(1, 5, 10, 12)))
    > ## Produce a patch-based MPG where patches are resistance features=1
    > tinyPatchMPG <- MPG(cost = tinyCost, patch = tinyCost == 1)
    Error in i_set_vertex_attr(graph = graph, name = name, index = index,  : 
      Length of new attribute value must be 1 or 107, the number of target vertices, not 43
    Calls: MPG ... add_vertices -> set_vertex_attr -> i_set_vertex_attr
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Complete output:
      > library(testthat)
      > test_check("grainscape")
      Loading required package: grainscape
      [ FAIL 18 | WARN 0 | SKIP 1 | PASS 0 ]
      
      ══ Skipped tests (1) ═══════════════════════════════════════════════════════════
      • empty test (1): 'test-examples.R:1:1'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-MPG.R:17:3'): MPG handles NA values correctly (#28) ────────────
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 6, the number of target vertices, not 2
      Backtrace:
          ▆
       1. ├─grainscape::MPG(cost = c, patch = p) at test-MPG.R:17:3
       2. └─grainscape::MPG(cost = c, patch = p)
       3.   └─igraph::graph_from_data_frame(toGraphE, directed = FALSE, vertices = toGraphV)
       4.     └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.         └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-MPG.R:70:3'): MPG contains links to all patches (#32) ──────────
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 107, the number of target vertices, not 43
      Backtrace:
          ▆
       1. ├─grainscape::MPG(cost = tinyCost, patch = (tinyCost == 1)) at test-MPG.R:70:3
       2. └─grainscape::MPG(cost = tinyCost, patch = (tinyCost == 1))
       3.   └─igraph::graph_from_data_frame(toGraphE, directed = FALSE, vertices = toGraphV)
       4.     └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.         └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-corridor-distance-point.R:22:3'): corridor handles NA values ───
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 652, the number of target vertices, not 612
      Backtrace:
          ▆
       1. ├─grainscape::MPG(cost, cost == 1) at test-corridor-distance-point.R:22:3
       2. └─grainscape::MPG(cost, cost == 1)
       3.   └─igraph::graph_from_data_frame(toGraphE, directed = FALSE, vertices = toGraphV)
       4.     └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.         └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-corridor-distance-point.R:42:3'): distance handles NA values ───
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 655, the number of target vertices, not 609
      Backtrace:
          ▆
       1. ├─grainscape::MPG(cost, cost == 1) at test-corridor-distance-point.R:42:3
       2. └─grainscape::MPG(cost, cost == 1)
       3.   └─igraph::graph_from_data_frame(toGraphE, directed = FALSE, vertices = toGraphV)
       4.     └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.         └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-corridor-distance-point.R:63:3'): point handles NA values ──────
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 626, the number of target vertices, not 589
      Backtrace:
          ▆
       1. ├─grainscape::MPG(cost, cost == 1) at test-corridor-distance-point.R:63:3
       2. └─grainscape::MPG(cost, cost == 1)
       3.   └─igraph::graph_from_data_frame(toGraphE, directed = FALSE, vertices = toGraphV)
       4.     └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.         └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-examples.R:2:3'): /tmp/workdir/grainscape/new/grainscape.Rcheck/00_pkg_src/grainscape/man/GOC.Rd ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 107, the number of target vertices, not 43
      Backtrace:
          ▆
       1. ├─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       2. └─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       3.   └─igraph::graph_from_data_frame(toGraphE, directed = FALSE, vertices = toGraphV)
       4.     └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.         └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-examples.R:2:3'): /tmp/workdir/grainscape/new/grainscape.Rcheck/00_pkg_src/grainscape/man/MPG.Rd ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 107, the number of target vertices, not 43
      Backtrace:
          ▆
       1. ├─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       2. └─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       3.   └─igraph::graph_from_data_frame(toGraphE, directed = FALSE, vertices = toGraphV)
       4.     └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.         └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-examples.R:2:3'): /tmp/workdir/grainscape/new/grainscape.Rcheck/00_pkg_src/grainscape/man/corridor.Rd ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 107, the number of target vertices, not 43
      Backtrace:
          ▆
       1. ├─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       2. └─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       3.   └─igraph::graph_from_data_frame(toGraphE, directed = FALSE, vertices = toGraphV)
       4.     └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.         └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-examples.R:2:3'): /tmp/workdir/grainscape/new/grainscape.Rcheck/00_pkg_src/grainscape/man/distance.Rd ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 107, the number of target vertices, not 43
      Backtrace:
          ▆
       1. ├─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       2. └─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       3.   └─igraph::graph_from_data_frame(toGraphE, directed = FALSE, vertices = toGraphV)
       4.     └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.         └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-examples.R:2:3'): /tmp/workdir/grainscape/new/grainscape.Rcheck/00_pkg_src/grainscape/man/export.Rd ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 107, the number of target vertices, not 43
      Backtrace:
          ▆
       1. ├─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       2. └─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       3.   └─igraph::graph_from_data_frame(toGraphE, directed = FALSE, vertices = toGraphV)
       4.     └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.         └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-examples.R:2:3'): /tmp/workdir/grainscape/new/grainscape.Rcheck/00_pkg_src/grainscape/man/ggGS.Rd ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 107, the number of target vertices, not 43
      Backtrace:
          ▆
       1. ├─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       2. └─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       3.   └─igraph::graph_from_data_frame(toGraphE, directed = FALSE, vertices = toGraphV)
       4.     └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.         └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-examples.R:2:3'): /tmp/workdir/grainscape/new/grainscape.Rcheck/00_pkg_src/grainscape/man/grain.Rd ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 107, the number of target vertices, not 43
      Backtrace:
          ▆
       1. ├─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       2. └─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       3.   └─igraph::graph_from_data_frame(toGraphE, directed = FALSE, vertices = toGraphV)
       4.     └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.         └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-examples.R:2:3'): /tmp/workdir/grainscape/new/grainscape.Rcheck/00_pkg_src/grainscape/man/graphdf.Rd ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 107, the number of target vertices, not 43
      Backtrace:
          ▆
       1. ├─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       2. └─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       3.   └─igraph::graph_from_data_frame(toGraphE, directed = FALSE, vertices = toGraphV)
       4.     └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.         └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-examples.R:2:3'): /tmp/workdir/grainscape/new/grainscape.Rcheck/00_pkg_src/grainscape/man/patchFilter.Rd ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 252, the number of target vertices, not 162
      Backtrace:
          ▆
       1. ├─grainscape::MPG(cost = tinyCost, patch = filteredPatch)
       2. └─grainscape::MPG(cost = tinyCost, patch = filteredPatch)
       3.   └─igraph::graph_from_data_frame(toGraphE, directed = FALSE, vertices = toGraphV)
       4.     └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.         └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-examples.R:2:3'): /tmp/workdir/grainscape/new/grainscape.Rcheck/00_pkg_src/grainscape/man/plot.Rd ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 107, the number of target vertices, not 43
      Backtrace:
          ▆
       1. ├─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       2. └─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       3.   └─igraph::graph_from_data_frame(toGraphE, directed = FALSE, vertices = toGraphV)
       4.     └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.         └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-examples.R:2:3'): /tmp/workdir/grainscape/new/grainscape.Rcheck/00_pkg_src/grainscape/man/point.Rd ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 107, the number of target vertices, not 43
      Backtrace:
          ▆
       1. ├─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       2. └─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       3.   └─igraph::graph_from_data_frame(toGraphE, directed = FALSE, vertices = toGraphV)
       4.     └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.         └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-examples.R:2:3'): /tmp/workdir/grainscape/new/grainscape.Rcheck/00_pkg_src/grainscape/man/theme_grainscape.Rd ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 107, the number of target vertices, not 43
      Backtrace:
          ▆
       1. ├─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       2. └─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       3.   └─igraph::graph_from_data_frame(toGraphE, directed = FALSE, vertices = toGraphV)
       4.     └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.         └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-examples.R:2:3'): /tmp/workdir/grainscape/new/grainscape.Rcheck/00_pkg_src/grainscape/man/threshold.Rd ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 107, the number of target vertices, not 43
      Backtrace:
          ▆
       1. ├─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       2. └─grainscape::MPG(cost = tinyCost, patch = tinyCost == 1)
       3.   └─igraph::graph_from_data_frame(toGraphE, directed = FALSE, vertices = toGraphV)
       4.     └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.         └─igraph:::i_set_vertex_attr(...)
      
      [ FAIL 18 | WARN 0 | SKIP 1 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘MPG_algorithm.Rmd’ using rmarkdown
    --- finished re-building ‘MPG_algorithm.Rmd’
    
    --- re-building ‘grainscape_vignette.Rmd’ using rmarkdown
    
    Quitting from lines 204-205 [model_01_step_02] (grainscape_vignette.Rmd)
    Error: processing vignette 'grainscape_vignette.Rmd' failed with diagnostics:
    Length of new attribute value must be 1 or 42, the number of target vertices, not 13
    --- failed re-building ‘grainscape_vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘grainscape_vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# graphlayouts

<details>

* Version: 1.1.1
* GitHub: https://github.com/schochastics/graphlayouts
* Source code: https://github.com/cran/graphlayouts
* Date/Publication: 2024-03-09 20:00:02 UTC
* Number of recursive dependencies: 94

Run `revdepcheck::cloud_details(, "graphlayouts")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘graphlayouts-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: graph_manipulate
    > ### Title: Manipulate graph
    > ### Aliases: graph_manipulate reorder_edges
    > 
    > ### ** Examples
    > 
    > library(igraph)
    
    Attaching package: ‘igraph’
    
    The following objects are masked from ‘package:stats’:
    
        decompose, spectrum
    
    The following object is masked from ‘package:base’:
    
        union
    
    > library(ggraph)
    Loading required package: ggplot2
    > 
    > g <- sample_gnp(10, 0.5)
    > E(g)$attr <- 1:ecount(g)
    > gn <- reorder_edges(g,"attr")
    Error in igraph::graph_from_data_frame(d = edges_df, directed = igraph::is.directed(g),  : 
      `vertices` must be a data frame or a character vector if given
    Calls: reorder_edges -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(graphlayouts)
      > 
      > test_check("graphlayouts")
      [ FAIL 1 | WARN 5 | SKIP 0 | PASS 139 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-graph_manipulate.R:4:4'): reorder_edges works ──────────────────
      Error in `igraph::graph_from_data_frame(d = edges_df, directed = igraph::is.directed(g), 
          vertices = vertices)`: `vertices` must be a data frame or a character vector if given
      Backtrace:
          ▆
       1. └─graphlayouts::reorder_edges(g, "weight") at test-graph_manipulate.R:4:4
       2.   └─igraph::graph_from_data_frame(...)
      
      [ FAIL 1 | WARN 5 | SKIP 0 | PASS 139 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.6Mb
      sub-directories of 1Mb or more:
        doc    1.9Mb
        help   2.1Mb
        libs   5.3Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 22 marked UTF-8 strings
    ```

# intergraph

<details>

* Version: 2.0-4
* GitHub: https://github.com/mbojan/intergraph
* Source code: https://github.com/cran/intergraph
* Date/Publication: 2024-02-01 17:30:02 UTC
* Number of recursive dependencies: 62

Run `revdepcheck::cloud_details(, "intergraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘intergraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: asIgraph
    > ### Title: Coerce an object to class "igraph"
    > ### Aliases: asIgraph asIgraph.network asIgraph.data.frame
    > 
    > ### ** Examples
    > 
    > ### using 'asIgraph' on objects of class 'network'
    > 
    > g <- asIgraph(exNetwork)
    Error in i_set_vertex_attr(graph = graph, name = name, index = index,  : 
      Length of new attribute value must be 1 or 14, the number of target vertices, not 15
    Calls: asIgraph ... add_vertices -> set_vertex_attr -> i_set_vertex_attr
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(intergraph)
      > 
      > test_check("intergraph")
      [ FAIL 10 | WARN 0 | SKIP 1 | PASS 40 ]
      
      ══ Skipped tests (1) ═══════════════════════════════════════════════════════════
      • On CRAN (1): 'test-netcompare.R:5:3'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-asIgraph.R:7:3'): Disassembling to d.f and assembling back to igraph gives the same result ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 14, the number of target vertices, not 15
      Backtrace:
          ▆
       1. ├─intergraph::asIgraph(l$edges, vertices = l$vertexes) at test-asIgraph.R:7:3
       2. └─intergraph:::asIgraph.data.frame(l$edges, vertices = l$vertexes)
       3.   └─igraph::graph_from_data_frame(object, directed = directed, vertices = vertices)
       4.     └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.         └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-asIgraph.R:26:3'): Vertex names are properly set via 'vnames' argument for directed network ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 14, the number of target vertices, not 15
      Backtrace:
          ▆
       1. ├─intergraph::asIgraph(l$edges, vertices = l$vertexes, vnames = "label") at test-asIgraph.R:26:3
       2. └─intergraph:::asIgraph.data.frame(...)
       3.   └─igraph::graph_from_data_frame(object, directed = directed, vertices = vertices)
       4.     └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.         └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-asIgraph.R:36:3'): Vertex names are properly set via 'vnames' argument for undirected network ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 14, the number of target vertices, not 15
      Backtrace:
          ▆
       1. ├─intergraph::asIgraph(l$edges, vertices = l$vertexes, directed = FALSE) at test-asIgraph.R:36:3
       2. └─intergraph:::asIgraph.data.frame(...)
       3.   └─igraph::graph_from_data_frame(object, directed = directed, vertices = vertices)
       4.     └─igraph::add_vertices(g, length(names), attr = vattrs)
       5.       └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       6.         └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-asIgraph.R:49:3'): Igraph is created from edgelist as tibble ───
      Error in `igraph::delete_vertex_attr(rval, "name")`: No such vertex attribute: name
      Backtrace:
           ▆
        1. ├─testthat::expect_silent(net <- asIgraph(edb)) at test-asIgraph.R:49:3
        2. │ └─testthat:::quasi_capture(enquo(object), NULL, evaluate_promise)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ ├─withr::with_output_sink(...)
        5. │   │ │ └─base::force(code)
        6. │   │ ├─base::withCallingHandlers(...)
        7. │   │ └─base::withVisible(code)
        8. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        9. ├─intergraph::asIgraph(edb)
       10. └─intergraph:::asIgraph.data.frame(edb)
       11.   └─igraph::delete_vertex_attr(rval, "name")
      ── Error ('test-asIgraph.R:65:3'): Network is created from tibbles ─────────────
      Error in `igraph::delete_vertex_attr(rval, "name")`: No such vertex attribute: name
      Backtrace:
           ▆
        1. ├─testthat::expect_silent(net <- asIgraph(edb, vertices = vdb)) at test-asIgraph.R:65:3
        2. │ └─testthat:::quasi_capture(enquo(object), NULL, evaluate_promise)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ ├─withr::with_output_sink(...)
        5. │   │ │ └─base::force(code)
        6. │   │ ├─base::withCallingHandlers(...)
        7. │   │ └─base::withVisible(code)
        8. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        9. ├─intergraph::asIgraph(edb, vertices = vdb)
       10. └─intergraph:::asIgraph.data.frame(edb, vertices = vdb)
       11.   └─igraph::delete_vertex_attr(rval, "name")
      ── Error ('test-asIgraph.R:82:3'): Conversion for exNetwork is OK tested with netcompare ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 14, the number of target vertices, not 15
      Backtrace:
          ▆
       1. ├─intergraph::netcompare(asIgraph(exNetwork), exNetwork, test = TRUE) at test-asIgraph.R:82:3
       2. ├─intergraph::asIgraph(exNetwork)
       3. └─intergraph:::asIgraph.network(exNetwork)
       4.   ├─intergraph::asIgraph(...)
       5.   └─intergraph:::asIgraph.data.frame(...)
       6.     └─igraph::graph_from_data_frame(object, directed = directed, vertices = vertices)
       7.       └─igraph::add_vertices(g, length(names), attr = vattrs)
       8.         └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       9.           └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-asIgraph.R:88:3'): Conversion for exNetwork2 is OK tested with netcompare ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 14, the number of target vertices, not 15
      Backtrace:
          ▆
       1. ├─intergraph::netcompare(asIgraph(exNetwork2), exNetwork2, test = TRUE) at test-asIgraph.R:88:3
       2. ├─intergraph::asIgraph(exNetwork2)
       3. └─intergraph:::asIgraph.network(exNetwork2)
       4.   ├─intergraph::asIgraph(...)
       5.   └─intergraph:::asIgraph.data.frame(...)
       6.     └─igraph::graph_from_data_frame(object, directed = directed, vertices = vertices)
       7.       └─igraph::add_vertices(g, length(names), attr = vattrs)
       8.         └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       9.           └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-attrmap.R:15:3'): 'na' vertex attribute can be dropped when going network->igraph ──
      Error in `i_set_vertex_attr(graph = graph, name = name, index = index, 
          value = value)`: Length of new attribute value must be 1 or 14, the number of target vertices, not 15
      Backtrace:
          ▆
       1. ├─intergraph::asIgraph(net, amap = aa) at test-attrmap.R:15:3
       2. └─intergraph:::asIgraph.network(net, amap = aa)
       3.   ├─intergraph::asIgraph(...)
       4.   └─intergraph:::asIgraph.data.frame(...)
       5.     └─igraph::graph_from_data_frame(object, directed = directed, vertices = vertices)
       6.       └─igraph::add_vertices(g, length(names), attr = vattrs)
       7.         └─igraph::set_vertex_attr(graph, nam[[i]], idx, attr)
       8.           └─igraph:::i_set_vertex_attr(...)
      ── Error ('test-github_issues.R:8:3'): NAs are preserved in edge attributes ────
      Error in `igraph::delete_vertex_attr(rval, "name")`: No such vertex attribute: name
      Backtrace:
          ▆
       1. ├─intergraph::asIgraph(net) at test-github_issues.R:8:3
       2. └─intergraph:::asIgraph.network(net)
       3.   ├─intergraph::asIgraph(...)
       4.   └─intergraph:::asIgraph.data.frame(...)
       5.     └─igraph::delete_vertex_attr(rval, "name")
      ── Error ('test-github_issues.R:17:3'): NAs are preserved in vertex attributes ──
      Error in `igraph::delete_vertex_attr(rval, "name")`: No such vertex attribute: name
      Backtrace:
          ▆
       1. ├─intergraph::asIgraph(net) at test-github_issues.R:17:3
       2. └─intergraph:::asIgraph.network(net)
       3.   ├─intergraph::asIgraph(...)
       4.   └─intergraph:::asIgraph.data.frame(...)
       5.     └─igraph::delete_vertex_attr(rval, "name")
      
      [ FAIL 10 | WARN 0 | SKIP 1 | PASS 40 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘howto.Rmd’ using rmarkdown
    
    Quitting from lines 89-95 [network2igraph] (howto.Rmd)
    Error: processing vignette 'howto.Rmd' failed with diagnostics:
    Length of new attribute value must be 1 or 14, the number of target vertices, not 15
    --- failed re-building ‘howto.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘howto.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# interplex

<details>

* Version: 0.1.2
* GitHub: https://github.com/tdaverse/interplex
* Source code: https://github.com/cran/interplex
* Date/Publication: 2024-02-20 10:20:07 UTC
* Number of recursive dependencies: 81

Run `revdepcheck::cloud_details(, "interplex")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘interplex-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as_cmplx
    > ### Title: Coerce objects to lists of simplices
    > ### Aliases: as_cmplx as_cmplx.default as_cmplx.Rcpp_SimplexTree
    > ###   as_cmplx.gudhi.simplex_tree.SimplexTree as_cmplx.igraph
    > ###   as_cmplx.network
    > 
    > ### ** Examples
    > 
    > if (requireNamespace("TDA", quietly = TRUE)) {
    +   # pick the simplicial complex from a TDA filtration object
    +   t <- 2 * pi * c(0, 1, 3, 6) / 7
    +   rf <- TDA::ripsFiltration(
    +     cbind(x = cos(t), y = sin(t)),
    +     maxdimension = 2L, maxscale = 1.7
    +   )
    +   print(rf$cmplx)
    +   cp_rf <- as_cmplx(rf)
    +   print(cp_rf)
    + }
    [[1]]
    [1] 1
    
    [[2]]
    [1] 2
    
    [[3]]
    [1] 3
    
    [[4]]
    [1] 4
    
    [[5]]
    [1] 2 1
    
    [[6]]
    [1] 4 1
    
    [[7]]
    [1] 3 2
    
    [[8]]
    [1] 4 2
    
    [[9]]
    [1] 4 2 1
    
    Warning in ensure_cmplx(x) :
      Taking `cmplx` element as the simplicial complex.
    [[1]]
    [1] 1
    
    [[2]]
    [1] 2
    
    [[3]]
    [1] 3
    
    [[4]]
    [1] 4
    
    [[5]]
    [1] 2 1
    
    [[6]]
    [1] 4 1
    
    [[7]]
    [1] 3 2
    
    [[8]]
    [1] 4 2
    
    [[9]]
    [1] 4 2 1
    
    > 
    > if (requireNamespace("simplextree", quietly = TRUE)) {
    +   # convert a simplextree object
    +   st <- simplextree::simplex_tree()
    +   st$insert(list(3:5, 5:6, 8))
    +   cp_st <- as_cmplx(st)
    +   print(cp_st)
    + }
    [[1]]
    [1] 3
    
    [[2]]
    [1] 4
    
    [[3]]
    [1] 5
    
    [[4]]
    [1] 6
    
    [[5]]
    [1] 8
    
    [[6]]
    [1] 3 4
    
    [[7]]
    [1] 3 5
    
    [[8]]
    [1] 4 5
    
    [[9]]
    [1] 5 6
    
    > 
    > ## Not run: 
    > ##D 
    > ##D if (requireNamespace("reticulate", quietly = TRUE)) {
    > ##D   # convert a Python GUDHI simplex tree
    > ##D   gd <- reticulate::import("gudhi")
    > ##D   gd_st <- gd$SimplexTree()
    > ##D   for (s in list(3:5, 5:6, 8)) gd_st$insert(as.list(s))
    > ##D   cp_gd <- as_cmplx(gd_st)
    > ##D   print(cp_gd)
    > ##D }
    > ## End(Not run)
    > 
    > if (requireNamespace("igraph", quietly = TRUE)) {
    +   # convert an igraph object
    +   ig <- igraph::graph(c(1,2, 2,3, 1,3, 3,4))
    +   set.seed(0L)
    +   ig <- igraph::set_vertex_attr(ig, "id", value = sample(igraph::vcount(ig)))
    +   print(ig)
    +   cp_ig <- as_cmplx(ig, index = "id")
    +   print(cp_ig)
    + }
    IGRAPH b5bd4d0 D--- 4 4 -- 
    + attr: id (v/n)
    + edges from b5bd4d0:
    [1] 1->2 2->3 1->3 3->4
    [[1]]
    [1] 2
    
    [[2]]
    [1] 1
    
    [[3]]
    [1] 4
    
    [[4]]
    [1] 3
    
    [[5]]
    [1] 2 1
    
    [[6]]
    [1] 1 4
    
    [[7]]
    [1] 2 4
    
    [[8]]
    [1] 4 3
    
    > 
    > if (requireNamespace("network", quietly = TRUE)) {
    +   # convert a network object
    +   el <- data.frame(tails = c(1, 2, 1, 3), heads = c(2, 3, 3, 4))
    +   nw <- network::network.edgelist(el, network::network.initialize(4))
    +   print(nw)
    +   cp_nw <- as_cmplx(nw)
    +   print(cp_nw)
    + }
     Network attributes:
      vertices = 4 
      directed = TRUE 
      hyper = FALSE 
      loops = FALSE 
      multiple = FALSE 
      bipartite = FALSE 
      total edges= 4 
        missing edges= 0 
        non-missing edges= 4 
    
     Vertex attribute names: 
        vertex.names 
    
    No edge attributes
    Error in igraph::delete_vertex_attr(rval, "name") : 
      No such vertex attribute: name
    Calls: as_cmplx ... asIgraph.network -> asIgraph -> asIgraph.data.frame -> <Anonymous>
    Execution halted
    ```

# LTFHPlus

<details>

* Version: 2.1.1
* GitHub: https://github.com/EmilMiP/LTFHPlus
* Source code: https://github.com/cran/LTFHPlus
* Date/Publication: 2024-02-12 16:40:06 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::cloud_details(, "LTFHPlus")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘LTFHPlus-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: graph_based_covariance_construction
    > ### Title: Constructing covariance matrix from local family graph
    > ### Aliases: graph_based_covariance_construction
    > 
    > ### ** Examples
    > 
    > fam <- data.frame(
    +   id = c("pid", "mom", "dad", "pgf"),
    +   dadcol = c("dad", 0, "pgf", 0),
    +   momcol = c("mom", 0, 0, 0))
    > 
    > thresholds <- data.frame(
    +   id = c("pid", "mom", "dad", "pgf"),
    +   lower = c(-Inf, -Inf, 0.8, 0.7),
    +   upper = c(0.8, 0.8, 0.8, 0.7))
    > 
    > graph <- prepare_graph(fam, icol = "id", fcol = "dadcol", mcol = "momcol", thresholds = thresholds)
    > 
    > graph_based_covariance_construction(pid = "id",
    +                                     cur_proband_id = "pid",
    +                                     cur_family_graph = graph,
    +                                     h2 = 0.5)
    Error in `rename()`:
    ! Names must be unique.
    ✖ These names are duplicated:
      * "id" at locations 1 and 2.
    Backtrace:
         ▆
      1. ├─LTFHPlus::graph_based_covariance_construction(...)
      2. │ └─... %>% relocate(!!as.symbol(pid))
      3. ├─dplyr::relocate(., !!as.symbol(pid))
      4. ├─dplyr::rename(., `:=`(!!as.symbol(pid), name))
      5. └─dplyr:::rename.data.frame(., `:=`(!!as.symbol(pid), name))
      6.   └─tidyselect::eval_rename(expr(c(...)), .data)
      7.     └─tidyselect:::rename_impl(...)
      8.       ├─tidyselect:::with_subscript_errors(...)
      9.       │ └─base::withCallingHandlers(...)
     10.       └─vctrs::vec_as_names(names, repair = "check_unique", call = error_call)
     11.         └─vctrs (local) `<fn>`()
     12.           └─vctrs:::validate_unique(names = names, arg = arg, call = call)
     13.             └─vctrs:::stop_names_must_be_unique(names, arg, call = call)
     14.               └─vctrs:::stop_names(...)
     15.                 └─vctrs:::stop_vctrs(...)
     16.                   └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = call)
    Execution halted
    ```

# manynet

<details>

* Version: 0.4.4
* GitHub: https://github.com/stocnet/manynet
* Source code: https://github.com/cran/manynet
* Date/Publication: 2024-03-15 19:20:10 UTC
* Number of recursive dependencies: 142

Run `revdepcheck::cloud_details(, "manynet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘manynet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: features
    > ### Title: Marking networks features
    > ### Aliases: features is_connected is_perfect_matching is_eulerian
    > ###   is_acyclic is_aperiodic
    > 
    > ### ** Examples
    > 
    > is_connected(ison_southern_women)
    [1] TRUE
    > is_perfect_matching(ison_southern_women)
    Error in igraph::graph_from_data_frame(.data) : 
      Vertex name NA in edge list is not listed in vertex data frame
    Calls: is_perfect_matching -> to_matching -> to_matching.igraph
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(manynet)
      Registered S3 method overwritten by 'manynet':
        method          from     
        print.tbl_graph tidygraph
      > 
      > test_check("manynet")
      Starting 2 test processes
      [ FAIL 2 | WARN 0 | SKIP 18 | PASS 334 ]
      
      ══ Skipped tests (18) ══════════════════════════════════════════════════════════
      • On CRAN (18): 'test-manip_as.R:86:3', 'test-manip_split.R:50:3',
        'test-map_autographr.R:2:3', 'test-map_autographr.R:17:3',
        'test-map_autographr.R:31:3', 'test-map_autographr.R:49:3',
        'test-map_autographr.R:68:3', 'test-map_autographr.R:96:3',
        'test-map_autographr.R:108:3', 'test-map_autographr.R:117:3',
        'test-map_autographr.R:123:3', 'test-map_autographr.R:130:3',
        'test-map_autographr.R:143:3', 'test-map_autographr.R:160:3',
        'test-mark_nodes.R:13:3', 'test-mark_nodes.R:22:3', 'test-mark_ties.R:24:3',
        'test-mark_ties.R:33:3'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-mark_is.R:12:3'): is_ tests return correct values ──────────────
      Error in `igraph::graph_from_data_frame(.data)`: Vertex name NA in edge list is not listed in vertex data frame
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
      ── Error ('test-manip_transform.R:43:3'): to matching works ────────────────────
      Error in `igraph::graph_from_data_frame(.data)`: Vertex name NA in edge list is not listed in vertex data frame
      Backtrace:
           ▆
        1. ├─manynet::as_edgelist(to_matching(ison_southern_women)) at test-manip_transform.R:43:3
        2. ├─manynet::to_matching(ison_southern_women)
        3. └─manynet:::to_matching.tbl_graph(ison_southern_women)
        4.   ├─manynet::as_tidygraph(to_matching.igraph(.data), mark)
        5.   └─manynet:::to_matching.igraph(.data)
        6.     ├─base::suppressWarnings(as_igraph(el, twomode = TRUE))
        7.     │ └─base::withCallingHandlers(...)
        8.     ├─manynet::as_igraph(el, twomode = TRUE)
        9.     └─manynet:::as_igraph.data.frame(el, twomode = TRUE)
       10.       └─igraph::graph_from_data_frame(.data)
      
      [ FAIL 2 | WARN 0 | SKIP 18 | PASS 334 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘Rgraphviz’
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 7 marked UTF-8 strings
    ```

# massiveGST

<details>

* Version: 1.2.3
* GitHub: NA
* Source code: https://github.com/cran/massiveGST
* Date/Publication: 2023-03-29 16:40:02 UTC
* Number of recursive dependencies: 46

Run `revdepcheck::cloud_details(, "massiveGST")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘massiveGST-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: massiveORT
    > ### Title: A wrapper to fisher.test to get over representation analysis of
    > ###   gene sets.
    > ### Aliases: massiveORT
    > 
    > ### ** Examples
    > 
    > library(massiveGST)
    > 
    > # get the gene profile
    > fname <- system.file("extdata", package="massiveGST")
    > fname <- file.path(fname, "pre_ranked_list.txt")
    > geneProfile <- get_geneProfile(fname)
    > geneList <- names(head(geneProfile, 1000))
    > 
    > # get the gene-sets
    > geneSets <- get_geneSets_from_msigdbr(category = "C5", subcategory = "CC", what = "gene_symbol")
    msigdbr: R package version 7.5.1
    > geneSets <- geneSets[1:250]
    > 
    > # run the function
    > ans <- massiveORT(geneList, geneSets)
    greater
    > cut_by_significance(ans)
                                     collection universe_size geneList_size
    GOCC_CELL_PROJECTION_MEMBRANE         C5 CC          8295           401
    GOCC_BASOLATERAL_PLASMA_MEMBRANE      C5 CC          8295           401
    GOCC_BASAL_PART_OF_CELL               C5 CC          8295           401
    GOCC_CELL_BODY                        C5 CC          8295           401
    GOCC_APICAL_PART_OF_CELL              C5 CC          8295           401
    GOCC_APICAL_PLASMA_MEMBRANE           C5 CC          8295           401
    GOCC_CELL_LEADING_EDGE                C5 CC          8295           401
    GOCC_ASTROCYTE_PROJECTION             C5 CC          8295           401
                                     geneSet_size geneList_in_GeneSet odds_ratio
    GOCC_CELL_PROJECTION_MEMBRANE             340                  34   2.297037
    GOCC_BASOLATERAL_PLASMA_MEMBRANE          228                  25   2.518609
    GOCC_BASAL_PART_OF_CELL                   271                  28   2.363035
    GOCC_CELL_BODY                            544                  45   1.873152
    GOCC_APICAL_PART_OF_CELL                  426                  36   1.897590
    GOCC_APICAL_PLASMA_MEMBRANE               360                  31   1.926338
    GOCC_CELL_LEADING_EDGE                    416                  35   1.885567
    GOCC_ASTROCYTE_PROJECTION                  19                   6   9.202590
                                     log2_odds_ratio      p.value   BH.value
    GOCC_CELL_PROJECTION_MEMBRANE          1.1997739 4.033451e-05 0.00929476
    GOCC_BASOLATERAL_PLASMA_MEMBRANE       1.3326274 1.010680e-04 0.00929476
    GOCC_BASAL_PART_OF_CELL                1.2406412 1.115371e-04 0.00929476
    GOCC_CELL_BODY                         0.9054679 2.431327e-04 0.01215663
    GOCC_APICAL_PART_OF_CELL               0.9241682 7.008917e-04 0.02920382
    GOCC_APICAL_PLASMA_MEMBRANE            0.9458607 1.210876e-03 0.03783986
    GOCC_CELL_LEADING_EDGE                 0.9149986 8.991179e-04 0.03211136
    GOCC_ASTROCYTE_PROJECTION              3.2020399 1.948196e-04 0.01215663
                                        B.value relevance
    GOCC_CELL_PROJECTION_MEMBRANE    0.01008363       268
    GOCC_BASOLATERAL_PLASMA_MEMBRANE 0.02526701       267
    GOCC_BASAL_PART_OF_CELL          0.02788428       265
    GOCC_CELL_BODY                   0.06078317       255
    GOCC_APICAL_PART_OF_CELL         0.17522293       252
    GOCC_APICAL_PLASMA_MEMBRANE      0.30271890       250
    GOCC_CELL_LEADING_EDGE           0.22477949       249
    GOCC_ASTROCYTE_PROJECTION        0.04870491       247
                                                                   link
    GOCC_CELL_PROJECTION_MEMBRANE    https://igordot.github.io/msigdbr/
    GOCC_BASOLATERAL_PLASMA_MEMBRANE https://igordot.github.io/msigdbr/
    GOCC_BASAL_PART_OF_CELL          https://igordot.github.io/msigdbr/
    GOCC_CELL_BODY                   https://igordot.github.io/msigdbr/
    GOCC_APICAL_PART_OF_CELL         https://igordot.github.io/msigdbr/
    GOCC_APICAL_PLASMA_MEMBRANE      https://igordot.github.io/msigdbr/
    GOCC_CELL_LEADING_EDGE           https://igordot.github.io/msigdbr/
    GOCC_ASTROCYTE_PROJECTION        https://igordot.github.io/msigdbr/
    > 
    > plot(cut_by_significance(ans), geneSets,as.network = TRUE)
    Error in i_set_vertex_attr(graph = graph, name = name, index = index,  : 
      Length of new attribute value must be 1 or 7, the number of target vertices, not 8
    Calls: plot ... add_vertices -> set_vertex_attr -> i_set_vertex_attr
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘vignette.Rmd’ using rmarkdown
    ```

# MEGENA

<details>

* Version: 1.3.7
* GitHub: https://github.com/songw01/MEGENA
* Source code: https://github.com/cran/MEGENA
* Date/Publication: 2018-09-10 19:00:03 UTC
* Number of recursive dependencies: 90

Run `revdepcheck::cloud_details(, "MEGENA")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘MEGENA_pipeline_10062016.Rmd’ using rmarkdown
    
    Quitting from lines 77-93 [MCA] (MEGENA_pipeline_10062016.Rmd)
    Error: processing vignette 'MEGENA_pipeline_10062016.Rmd' failed with diagnostics:
    invalid first argument
    --- failed re-building ‘MEGENA_pipeline_10062016.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘MEGENA_pipeline_10062016.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# morph

<details>

* Version: 1.1.0
* GitHub: NA
* Source code: https://github.com/cran/morph
* Date/Publication: 2023-02-14 15:40:02 UTC
* Number of recursive dependencies: 39

Run `revdepcheck::cloud_details(, "morph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘morph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: morph3d
    > ### Title: Performs a morphological segmentation of a binary 3D array
    > ### Aliases: morph3d
    > ### Keywords: manip array
    > 
    > ### ** Examples
    > 
    > # SET FINALPLOT=TRUE IF THE INTERACTIVE 3D PLOT IS DESIRED
    > # THAT CONTAINS THE FINAL SEGMENTATION CATEGORIES
    > # IF A PLOT FOR EACH CATEGORY IS REQUIRED, SET PLOT=TRUE 
    > LEdemoOut <- morph3d(LEdemo, PLOT=FALSE, FINALPLOT=FALSE)
    
    
    Input data passess all initial checks for integrity.
    
    
    Error in add_edges(g, edges, attr = eattrs) : 
      At vendor/cigraph/src/graph/type_indexededgelist.c:261 : Out-of-range vertex IDs when adding edges. Invalid vertex ID
    Calls: morph3d -> graph_from_data_frame -> add_edges
    Execution halted
    ```

# motifr

<details>

* Version: 1.0.0
* GitHub: https://github.com/marioangst/motifr
* Source code: https://github.com/cran/motifr
* Date/Publication: 2020-12-10 15:40:02 UTC
* Number of recursive dependencies: 121

Run `revdepcheck::cloud_details(, "motifr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘motifr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dummy_net
    > ### Title: Three-level network dummy example
    > ### Aliases: dummy_net
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > plot_mnet(dummy_net)
    Error in igraph::delete_vertex_attr(rval, "name") : 
      No such vertex attribute: name
    Calls: plot_mnet ... asIgraph.network -> asIgraph -> asIgraph.data.frame -> <Anonymous>
    Execution halted
    ```

# mstknnclust

<details>

* Version: 0.3.2
* GitHub: NA
* Source code: https://github.com/cran/mstknnclust
* Date/Publication: 2023-01-27 14:10:02 UTC
* Number of recursive dependencies: 32

Run `revdepcheck::cloud_details(, "mstknnclust")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mstknnclust-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: mst.knn
    > ### Title: Performs the MST-kNN clustering algorithm
    > ### Aliases: mst.knn
    > 
    > ### ** Examples
    > 
    > 
    > set.seed(1987)
    > 
    > ##load package
    > library("mstknnclust")
    > 
    > ##Generates a data matrix of dimension 100X15
    > 
    > n=100; m=15
    > 
    > x <- matrix(runif(n*m, min = -5, max = 10), nrow=n, ncol=m)
    > 
    > ##Computes a distance matrix of x.
    > 
    > library("stats")
    > d <- base::as.matrix(stats::dist(x, method="euclidean"))
    > 
    > ##Performs MST-kNN clustering using euclidean distance.
    > 
    > results <- mst.knn(d)
    Warning in .igraph.graph.union.or.intersection("intersection", ..., byname = byname,  :
      Some, but not all graphs are named, not using vertex names
    Warning in .igraph.graph.union.or.intersection("intersection", ..., byname = byname,  :
      Some, but not all graphs are named, not using vertex names
    Warning in .igraph.graph.union.or.intersection("intersection", ..., byname = byname,  :
      Some, but not all graphs are named, not using vertex names
    Warning in .igraph.graph.union.or.intersection("intersection", ..., byname = byname,  :
      Some, but not all graphs are named, not using vertex names
    Warning in .igraph.graph.union.or.intersection("intersection", ..., byname = byname,  :
      Some, but not all graphs are named, not using vertex names
    Warning in .igraph.graph.union.or.intersection("intersection", ..., byname = byname,  :
      Some, but not all graphs are named, not using vertex names
    Warning in .igraph.graph.union.or.intersection("intersection", ..., byname = byname,  :
      Some, but not all graphs are named, not using vertex names
    Warning in .igraph.graph.union.or.intersection("intersection", ..., byname = byname,  :
      Some, but not all graphs are named, not using vertex names
    
     Only singletons are yielded 
    Error in (function (edges, n = max(edges), directed = TRUE)  : 
      At rinterface_extra.c:78 : Expecting a scalar integer but received a vector of length 0. Invalid value
    Calls: mst.knn ... only.single.graphs -> <Anonymous> -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘guide.Rmd’ using rmarkdown
    
    Quitting from lines 77-79 [unnamed-chunk-4] (guide.Rmd)
    Error: processing vignette 'guide.Rmd' failed with diagnostics:
    `d` should contain at least two columns
    --- failed re-building ‘guide.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘guide.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# multinet

<details>

* Version: 4.1.2
* GitHub: NA
* Source code: https://github.com/cran/multinet
* Date/Publication: 2023-02-14 10:20:03 UTC
* Number of recursive dependencies: 12

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
    Error in graph_from_data_frame(vertices = a_df, e_df, directed = dir) : 
      `vertices` must be a data frame or a character vector if given
    Calls: as.igraph -> as.igraph.Rcpp_RMLNetwork -> graph_from_data_frame
    Execution halted
    ```

## In both

*   checking C++ specification ... NOTE
    ```
      Specified C++14: please drop specification unless essential
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 126.0Mb
      sub-directories of 1Mb or more:
        libs  125.8Mb
    ```

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) LayerMeasures.Rd:24: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) LayerMeasures.Rd:25: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) LayerMeasures.Rd:26: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) Plot.Rd:38: Lost braces; missing escapes or markup?
        38 | \item{vertex.shape}{Symbol to use for nodes, corresponding to the parameter {pch} of the R \code{points} function.  This can either
           |                                                                             ^
    ```

# nda

<details>

* Version: 0.1.13
* GitHub: https://github.com/kzst/nda
* Source code: https://github.com/cran/nda
* Date/Publication: 2023-09-27 07:20:06 UTC
* Number of recursive dependencies: 44

Run `revdepcheck::cloud_details(, "nda")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘nda-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ndr
    > ### Title: Genearlized Network-based Dimensionality Reduction and Analysis
    > ###   (GNDA)
    > ### Aliases: ndr
    > ### Keywords: multivariate nonparametric
    > 
    > ### ** Examples
    > 
    > 
    > # Dimension reduction
    > 
    > data(swiss)
    > df<-swiss
    > p<-ndr(df)
    > summary(p)
    
    Summary of the NDA:
    
    Number of latent variables:  1
    Number of observations:  47
    Communalities:
         Fertility Agriculture Examination Education Catholic Infant.Mortality
    [1,]  0.310332   0.3326062   0.3424287 0.1007481 0.682701       0.04166014
    
    Factor loadings:
                           NDA1
    Fertility         0.5570745
    Agriculture       0.5767202
    Examination      -0.5851741
    Education        -0.3174085
    Catholic          0.8262572
    Infant.Mortality  0.2041082
    
    
    Correlation matrix of factor scores:
         NDA1
    NDA1    1
    > plot(p)
    Error in data.frame(..., check.names = FALSE) : 
      arguments imply differing number of rows: 5, 6
    Calls: plot ... <Anonymous> -> <Anonymous> -> cbind -> cbind -> data.frame
    Execution halted
    ```

# Neighboot

<details>

* Version: 1.0.1
* GitHub: NA
* Source code: https://github.com/cran/Neighboot
* Date/Publication: 2022-05-31 23:20:08 UTC
* Number of recursive dependencies: 91

Run `revdepcheck::cloud_details(, "Neighboot")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘Neighboot-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: to.rds
    > ### Title: Tranform an 'sample.RDS' object to an 'rds.data.frame' object.
    > ### Aliases: to.rds
    > 
    > ### ** Examples
    > 
    > #Load the synthetic population network dataset.
    > data("pop.network")
    > 
    > #Draw an RDS sample from the simulated network using the sampleRDS function
    > #from the package RDStreeboot.
    > require(RDStreeboot)
    Loading required package: RDStreeboot
    > RDS.samp <- sample.RDS(pop.network$traits, pop.network$adj.mat, 200, 10,
    +  3, c(1/6,1/3,1/3,1/6), FALSE)
    > 
    > #Tranform RDS.samp to an rds.data.frame object
    > require(RDS)
    Loading required package: RDS
    > to.rds(RDS.data=RDS.samp)
    Error in data.frame(id = as.numeric(unlist(seed.l)), seed.id = seed.id) : 
      arguments imply differing number of rows: 10, 0
    Calls: to.rds -> data.frame
    Execution halted
    ```

# pmd

<details>

* Version: 0.2.1
* GitHub: https://github.com/yufree/pmd
* Source code: https://github.com/cran/pmd
* Date/Publication: 2021-01-21 23:20:08 UTC
* Number of recursive dependencies: 121

Run `revdepcheck::cloud_details(, "pmd")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘pmd-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: getcda
    > ### Title: Perform correlation directed analysis for peaks list.
    > ### Aliases: getcda
    > 
    > ### ** Examples
    > 
    > data(spmeinvivo)
    > cluster <- getcorcluster(spmeinvivo)
    75 retention time cluster found.
    Error in aggregate.data.frame(as.data.frame(x), ...) : 
      no rows to aggregate
    Calls: getcorcluster ... <Anonymous> -> aggregate.default -> aggregate.data.frame
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘globalstd.Rmd’ using rmarkdown
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        data   3.5Mb
        doc    1.3Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 62 marked UTF-8 strings
    ```

# polymapR

<details>

* Version: 1.1.5
* GitHub: NA
* Source code: https://github.com/cran/polymapR
* Date/Publication: 2024-01-08 21:30:03 UTC
* Number of recursive dependencies: 197

Run `revdepcheck::cloud_details(, "polymapR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘polymapR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: screen_for_duplicate_markers
    > ### Title: Screen for and remove duplicated markers
    > ### Aliases: screen_for_duplicate_markers
    > 
    > ### ** Examples
    > 
    > data("screened_data3")
    > dupmscreened <- screen_for_duplicate_markers(screened_data3)
    Error in apply(sub, 1, function(x) sum(is.na(x))) : 
      dim(X) must have a positive length
    Calls: screen_for_duplicate_markers -> apply
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Vignette_genotype_probabilities.Rmd’ using rmarkdown
    --- finished re-building ‘Vignette_genotype_probabilities.Rmd’
    
    --- re-building ‘Vignette_polymapR.Rmd’ using rmarkdown
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 20.2Mb
      sub-directories of 1Mb or more:
        R     12.5Mb
        data   6.5Mb
    ```

# ptools

<details>

* Version: 2.0.0
* GitHub: https://github.com/apwheele/ptools
* Source code: https://github.com/cran/ptools
* Date/Publication: 2023-02-07 19:02:30 UTC
* Number of recursive dependencies: 80

Run `revdepcheck::cloud_details(, "ptools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ptools-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: near_strings1
    > ### Title: Strings of Near Repeats
    > ### Aliases: near_strings1
    > 
    > ### ** Examples
    > 
    > # Simplified example showing two clusters
    > s <- c(0,0,0,4,4)
    > ccheck <- c(1,1,1,2,2)
    > dat <- data.frame(x=1:5,y=0,
    +                   ti=s,
    +                   id=1:5)
    > res1 <- near_strings1(dat,'id','x','y','ti',2,1)
    Error in igraph::graph_from_data_frame(pa, directed = FALSE, vertices = MyData[,  : 
      `vertices` must be a data frame or a character vector if given
    Calls: near_strings1 -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(ptools)
      > 
      > test_check("ptools")
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 40 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-nearstring.R:7:3'): test near_string1 (loop version) ───────────
      Error in `igraph::graph_from_data_frame(pa, directed = FALSE, vertices = MyData[, 
          id])`: `vertices` must be a data frame or a character vector if given
      Backtrace:
          ▆
       1. └─ptools::near_strings1(dat, "id", "x", "y", "ti", 1, 1) at test-nearstring.R:7:3
       2.   └─igraph::graph_from_data_frame(...)
      ── Error ('test-nearstring.R:21:3'): test near_string2 (kdtree version) ────────
      Error in `igraph::graph_from_data_frame(dist_p, directed = FALSE, vertices = MyData[, 
          id])`: `vertices` must be a data frame or a character vector if given
      Backtrace:
          ▆
       1. └─ptools::near_strings2(dat, "id", "x", "y", "ti", 1, 1) at test-nearstring.R:21:3
       2.   └─igraph::graph_from_data_frame(...)
      ── Error ('test-nearstring.R:34:3'): two near_string versions should have the same output ──
      Error in `igraph::graph_from_data_frame(pa, directed = FALSE, vertices = MyData[, 
          id])`: `vertices` must be a data frame or a character vector if given
      Backtrace:
          ▆
       1. └─ptools::near_strings1(dat, "id", "x", "y", "ti", 1, 1) at test-nearstring.R:34:3
       2.   └─igraph::graph_from_data_frame(...)
      ── Error ('test-nearstring.R:46:3'): Checking two components ───────────────────
      Error in `igraph::graph_from_data_frame(pa, directed = FALSE, vertices = MyData[, 
          id])`: `vertices` must be a data frame or a character vector if given
      Backtrace:
          ▆
       1. └─ptools::near_strings1(dat, "id", "x", "y", "ti", 2, 1) at test-nearstring.R:46:3
       2.   └─igraph::graph_from_data_frame(...)
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 40 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘spat-feateng.Rmd’ using rmarkdown
    ```

# RavenR

<details>

* Version: 2.2.2
* GitHub: https://github.com/rchlumsk/RavenR
* Source code: https://github.com/cran/RavenR
* Date/Publication: 2024-05-07 03:30:02 UTC
* Number of recursive dependencies: 135

Run `revdepcheck::cloud_details(, "RavenR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘RavenR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: rvn_calc_runoff_coeff
    > ### Title: Generate runoff coefficients upstream of gauges
    > ### Aliases: rvn_calc_runoff_coeff
    > 
    > ### ** Examples
    > 
    >  myrvh <- system.file("extdata","Nith.rvh", package="RavenR")
    >  mycust <- system.file("extdata", "run1_PRECIP_Daily_Average_BySubbasin.csv", package="RavenR")
    >  myhyd <- system.file("extdata", "run1_Hydrographs.csv", package="RavenR")
    > 
    >  rcs <- rvn_calc_runoff_coeff(myrvh, mycust, myhyd, correct=TRUE)
    Error in i_set_vertex_attr(graph = graph, name = name, index = index,  : 
      Length of new attribute value must be 1 or 43, the number of target vertices, not 4
    Calls: rvn_calc_runoff_coeff ... add_vertices -> set_vertex_attr -> i_set_vertex_attr
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Introduction_to_RavenR.Rmd’ using rmarkdown
    ```

# rdracor

<details>

* Version: 1.0.3
* GitHub: https://github.com/dracor-org/rdracor
* Source code: https://github.com/cran/rdracor
* Date/Publication: 2024-04-03 23:40:06 UTC
* Number of recursive dependencies: 51

Run `revdepcheck::cloud_details(, "rdracor")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(rdracor)
      > 
      > test_check("rdracor")
      DraCor API URL:  https://dracor.org/api/v1 
       name: DraCor API v1
      version: 1.0.2
      status: stable
      existdb: 6.2.0
      base: https://dracor.org/api/v1[ FAIL 5 | WARN 1 | SKIP 0 | PASS 36 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-net.R:23:3'): cooccur_igraph is returned by get_net_cooccur_igraph() ──
      Error in `igraph::graph_from_data_frame(edges, directed = FALSE, vertices = nodes)`: Vertex name podkolesin in edge list is not listed in vertex data frame
      Backtrace:
          ▆
       1. ├─testthat::expect_s3_class(...) at test-net.R:23:3
       2. │ └─testthat::quasi_label(enquo(object), arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─rdracor::get_net_cooccur_igraph("gogol-zhenitba", "rus")
       5.   └─igraph::graph_from_data_frame(edges, directed = FALSE, vertices = nodes)
      ── Error ('test-net.R:30:3'): label_cooccur_igraph() return come NA for big network ──
      Error in `igraph::graph_from_data_frame(edges, directed = FALSE, vertices = nodes)`: Duplicate vertex names
      Backtrace:
          ▆
       1. └─rdracor::get_net_cooccur_igraph("henry-iv-part-i", "shake") at test-net.R:30:3
       2.   └─igraph::graph_from_data_frame(edges, directed = FALSE, vertices = nodes)
      ── Error ('test-net.R:37:5'): label_cooccur_igraph() do not return NA after max_graph_size adjustment ──
      Error in `igraph::graph_from_data_frame(edges, directed = FALSE, vertices = nodes)`: Duplicate vertex names
      Backtrace:
          ▆
       1. └─rdracor::get_net_cooccur_igraph("henry-iv-part-i", "shake") at test-net.R:37:5
       2.   └─igraph::graph_from_data_frame(edges, directed = FALSE, vertices = nodes)
      ── Error ('test-net.R:43:3'): summary.cooccur_igraph() prints appropriate number of rows ──
      Error in `igraph::graph_from_data_frame(edges, directed = FALSE, vertices = nodes)`: Duplicate vertex names
      Backtrace:
          ▆
       1. └─rdracor::get_net_cooccur_igraph("henry-iv-part-i", "shake") at test-net.R:43:3
       2.   └─igraph::graph_from_data_frame(edges, directed = FALSE, vertices = nodes)
      ── Error ('test-net.R:48:3'): relations_igraph is returned by get_net_relations_igraph() ──
      Error in `graph_from_data_frame(d = d, directed = directed, vertices = vertices)`: Vertex name kochkarev in edge list is not listed in vertex data frame
      Backtrace:
          ▆
       1. ├─testthat::expect_s3_class(...) at test-net.R:48:3
       2. │ └─testthat::quasi_label(enquo(object), arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─rdracor::get_net_relations_igraph("gogol-zhenitba", "rus")
       5.   └─igraph::graph.data.frame(...)
       6.     └─igraph::graph_from_data_frame(d = d, directed = directed, vertices = vertices)
      
      [ FAIL 5 | WARN 1 | SKIP 0 | PASS 36 ]
      Error: Test failures
      Execution halted
    ```

# ReDaMoR

<details>

* Version: 0.7.4
* GitHub: https://github.com/patzaw/ReDaMoR
* Source code: https://github.com/cran/ReDaMoR
* Date/Publication: 2024-02-07 06:20:02 UTC
* Number of recursive dependencies: 83

Run `revdepcheck::cloud_details(, "ReDaMoR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ReDaMoR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: df_to_model
    > ### Title: Create a RelDataModel object from column names of data frames
    > ### Aliases: df_to_model
    > 
    > ### ** Examples
    > 
    > ## Read data files ----
    > to_read <- list.files(
    +    system.file("examples/HPO-subset", package="ReDaMoR"),
    +    full.names=TRUE
    + )
    > hpo_tables <- list()
    > for(f in to_read){
    +    hpo_tables[[sub("[.]txt$", "", basename(f))]] <- readr::read_tsv(f)
    + }
    Rows: 89 Columns: 2
    ── Column specification ────────────────────────────────────────────────────────
    Delimiter: "\t"
    chr (2): id, alt
    
    ℹ Use `spec()` to retrieve the full column specification for this data.
    ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    Rows: 972 Columns: 2
    ── Column specification ────────────────────────────────────────────────────────
    Delimiter: "\t"
    chr (2): id, descendant
    
    ℹ Use `spec()` to retrieve the full column specification for this data.
    ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    Rows: 2594 Columns: 3
    ── Column specification ────────────────────────────────────────────────────────
    Delimiter: "\t"
    chr (2): db, hp
    dbl (1): id
    
    ℹ Use `spec()` to retrieve the full column specification for this data.
    ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    Rows: 2337 Columns: 4
    ── Column specification ────────────────────────────────────────────────────────
    Delimiter: "\t"
    chr (2): db, synonym
    dbl (1): id
    lgl (1): preferred
    
    ℹ Use `spec()` to retrieve the full column specification for this data.
    ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    Rows: 1903 Columns: 3
    ── Column specification ────────────────────────────────────────────────────────
    Delimiter: "\t"
    chr (2): db, label
    dbl (1): id
    
    ℹ Use `spec()` to retrieve the full column specification for this data.
    ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    Rows: 500 Columns: 4
    ── Column specification ────────────────────────────────────────────────────────
    Delimiter: "\t"
    chr (3): id, name, description
    dbl (1): level
    
    ℹ Use `spec()` to retrieve the full column specification for this data.
    ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    Rows: 95 Columns: 2
    ── Column specification ────────────────────────────────────────────────────────
    Delimiter: "\t"
    chr (2): id, parent
    
    ℹ Use `spec()` to retrieve the full column specification for this data.
    ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    Rows: 2 Columns: 2
    ── Column specification ────────────────────────────────────────────────────────
    Delimiter: "\t"
    chr  (1): url
    date (1): current
    
    ℹ Use `spec()` to retrieve the full column specification for this data.
    ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    Rows: 730 Columns: 3
    ── Column specification ────────────────────────────────────────────────────────
    Delimiter: "\t"
    chr (3): id, synonym, type
    
    ℹ Use `spec()` to retrieve the full column specification for this data.
    ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    > ## Build the model from a list of data frames ----
    > new_model <- df_to_model(
    +    list=names(hpo_tables), envir=as.environment(hpo_tables)
    + )
    > ## Plot the model ----
    > new_model %>%
    +    auto_layout(lengthMultiplier=250) %>%
    +    plot()
    Error in data.frame(..., check.names = FALSE) : 
      arguments imply differing number of rows: 0, 9
    Calls: %>% ... <Anonymous> -> <Anonymous> -> cbind -> cbind -> data.frame
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘ReDaMoR.Rmd’ using rmarkdown
    
    Quitting from lines 383-390 [unnamed-chunk-12] (ReDaMoR.Rmd)
    Error: processing vignette 'ReDaMoR.Rmd' failed with diagnostics:
    arguments imply differing number of rows: 0, 9
    --- failed re-building ‘ReDaMoR.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘ReDaMoR.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# rgexf

<details>

* Version: 0.16.2
* GitHub: https://github.com/gvegayon/rgexf
* Source code: https://github.com/cran/rgexf
* Date/Publication: 2021-08-12 21:30:02 UTC
* Number of recursive dependencies: 49

Run `revdepcheck::cloud_details(, "rgexf")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘tinytest.R’
    Running the tests in ‘tests/tinytest.R’ failed.
    Complete output:
      > 
      > if ( requireNamespace("tinytest", quietly=TRUE) ){
      +   tinytest::test_package("rgexf")
      + }
      
      test-bugs.r...................    0 tests    
      test-bugs.r...................    0 tests    
      test-bugs.r...................    1 tests [0;32mOK[0m 
      test-bugs.r...................    1 tests [0;32mOK[0m 
      test-bugs.r...................    1 tests [0;32mOK[0m 
      test-bugs.r...................    2 tests [0;32mOK[0m [0;34m0.3s[0m
      [0;36m1ms[0m
      
      test-igraph.r.................    0 tests    
      test-igraph.r.................    0 tests    
      test-igraph.r.................    0 tests    
      test-igraph.r.................    0 tests    
      test-igraph.r.................    0 tests    
      test-igraph.r.................    0 tests    
      test-igraph.r.................    0 tests    
      test-igraph.r.................    0 tests    
      test-igraph.r.................    0 tests    
      test-igraph.r.................    1 tests [0;31m1 fails[0m 
      test-igraph.r.................    2 tests [0;31m1 fails[0m 
      test-igraph.r.................    2 tests [0;31m1 fails[0m 
      test-igraph.r.................    2 tests [0;31m1 fails[0m 
      test-igraph.r.................    2 tests [0;31m1 fails[0m 
      test-igraph.r.................    3 tests [0;31m1 fails[0m [0;36m97ms[0m
      
      test-rgexf.r..................    0 tests    
      test-rgexf.r..................    0 tests    
      test-rgexf.r..................    0 tests    
      test-rgexf.r..................    0 tests    
      test-rgexf.r..................    0 tests    
      test-rgexf.r..................    0 tests    
      test-rgexf.r..................    1 tests [0;32mOK[0m 
      test-rgexf.r..................    1 tests [0;32mOK[0m 
      test-rgexf.r..................    1 tests [0;32mOK[0m 
      test-rgexf.r..................    2 tests [0;32mOK[0m 
      test-rgexf.r..................    3 tests [0;32mOK[0m 
      test-rgexf.r..................    4 tests [0;32mOK[0m 
      test-rgexf.r..................    5 tests [0;32mOK[0m 
      test-rgexf.r..................    6 tests [0;32mOK[0m 
      test-rgexf.r..................    7 tests [0;32mOK[0m 
      test-rgexf.r..................    8 tests [0;32mOK[0m 
      test-rgexf.r..................    9 tests [0;32mOK[0m 
      test-rgexf.r..................   10 tests [0;32mOK[0m [0;36m96ms[0m
      ----- FAILED[data]: test-igraph.r<21--21>
       call| expect_equal(ne, 0)
       diff| Mean absolute difference: 8
      Error: 1 out of 15 tests failed
      In addition: Warning message:
      `barabasi.game()` was deprecated in igraph 2.0.0.
      ℹ Please use `sample_pa()` instead. 
      Execution halted
    ```

# RNewsflow

<details>

* Version: 1.2.8
* GitHub: NA
* Source code: https://github.com/cran/RNewsflow
* Date/Publication: 2024-04-03 11:03:02 UTC
* Number of recursive dependencies: 52

Run `revdepcheck::cloud_details(, "RNewsflow")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘RNewsflow-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: create_document_network
    > ### Title: Create a document similarity network
    > ### Aliases: create_document_network
    > 
    > ### ** Examples
    > 
    > d = data.frame(x = c(1,1,1,2,2,3),
    +                y = c(2,3,5,4,5,6),
    +                v = c(0.3,0.4,0.7,0.5,0.2,0.9))
    > 
    > meta = data.frame(document_id = 1:8,
    +                   date = seq.POSIXt(from = as.POSIXct('2010-01-01 12:00:00'), 
    +                          by='hour', length.out = 8),
    +                   medium = c(rep('Newspapers', 4), rep('Blog', 4)))
    > 
    > g = create_document_network(d, meta)
    > 
    > igraph::get.data.frame(g, 'both')
    Warning: `get.data.frame()` was deprecated in igraph 2.0.0.
    ℹ Please use `as_data_frame()` instead.
    Warning: non-unique values when setting 'row.names': 
    Error in `.rowNamesDF<-`(x, value = value) : 
      duplicate 'row.names' are not allowed
    Calls: <Anonymous> ... row.names<- -> row.names<-.data.frame -> .rowNamesDF<-
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.6Mb
      sub-directories of 1Mb or more:
        libs   5.9Mb
    ```

# rsetse

<details>

* Version: 0.5.0
* GitHub: https://github.com/JonnoB/rSETSe
* Source code: https://github.com/cran/rsetse
* Date/Publication: 2021-06-11 10:00:02 UTC
* Number of recursive dependencies: 84

Run `revdepcheck::cloud_details(, "rsetse")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rsetse-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: calc_spring_constant
    > ### Title: Calculate the spring constant
    > ### Aliases: calc_spring_constant
    > 
    > ### ** Examples
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
    +  set.edge.attribute(., name = "edge_characteristic", value = rep(1:16, each = 10)) %>%
    +  #set some pretend Young's modulus value
    +  set.edge.attribute(., name = "E", value = rep(c(1e5, 5e5, 2e5, 3e5), each = 40)) %>%
    +  #calculate the spring area from another edge characteristic
    +  calc_spring_area(., value = "edge_characteristic", minimum_value = 10, range = 20) %>%
    +  prepare_edges() %>%
    +  prepare_categorical_force(., node_names = "name", 
    +                     force_var = "class")
    Warning: There was 1 warning in `dplyr::mutate()`.
    ℹ In argument: `dplyr::across(...)`.
    Caused by warning:
    ! Using `across()` without supplying `.cols` was deprecated in dplyr 1.1.0.
    ℹ Please supply `.cols` instead.
    Error in `dplyr::select()`:
    ! Can't select columns that don't exist.
    ✖ Column `name` doesn't exist.
    Backtrace:
         ▆
      1. ├─... %>% ...
      2. ├─rsetse::prepare_categorical_force(., node_names = "name", force_var = "class")
      3. │ ├─igraph::graph_from_data_frame(...)
      4. │ └─vertices_df %>% dplyr::select(node_names, dplyr::everything())
      5. ├─dplyr::select(., node_names, dplyr::everything())
      6. ├─dplyr:::select.data.frame(., node_names, dplyr::everything())
      7. │ └─tidyselect::eval_select(expr(c(...)), data = .data, error_call = error_call)
      8. │   └─tidyselect:::eval_select_impl(...)
      9. │     ├─tidyselect:::with_subscript_errors(...)
     10. │     │ └─base::withCallingHandlers(...)
     11. │     └─tidyselect:::vars_select_eval(...)
     12. │       └─tidyselect:::walk_data_tree(expr, data_mask, context_mask)
     13. │         └─tidyselect:::eval_c(expr, data_mask, context_mask)
     14. │           └─tidyselect:::reduce_sels(node, data_mask, context_mask, init = init)
     15. │             └─tidyselect:::walk_data_tree(new, data_mask, context_mask)
     16. │               └─tidyselect:::as_indices_sel_impl(...)
     17. │                 └─tidyselect:::as_indices_impl(...)
     18. │                   └─tidyselect:::chr_as_locations(x, vars, call = call, arg = arg)
     19. │                     └─vctrs::vec_as_location(...)
     20. └─vctrs (local) `<fn>`()
     21.   └─vctrs:::stop_subscript_oob(...)
     22.     └─vctrs:::stop_subscript(...)
     23.       └─rlang::abort(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Categorical-and-continuous-features.Rmd’ using rmarkdown
    ```

# rTwig

<details>

* Version: 1.0.2
* GitHub: https://github.com/aidanmorales/rTwig
* Source code: https://github.com/cran/rTwig
* Date/Publication: 2024-04-08 15:00:02 UTC
* Number of recursive dependencies: 188

Run `revdepcheck::cloud_details(, "rTwig")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rTwig-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: qsm_summary
    > ### Title: QSM Summary
    > ### Aliases: qsm_summary
    > 
    > ### ** Examples
    > 
    > 
    > ## TreeQSM Processing Chain
    > file <- system.file("extdata/QSM.mat", package = "rTwig")
    > qsm <- import_qsm(file)
    Importing TreeQSM .mat
    > cylinder <- qsm$cylinder
    > cylinder <- update_cylinders(cylinder)
    Updating Cylinder Ordering
    Calculating Growth Length
    Error in add_edges(g, edges, attr = eattrs) : 
      At vendor/cigraph/src/graph/type_indexededgelist.c:261 : Out-of-range vertex IDs when adding edges. Invalid vertex ID
    Calls: update_cylinders -> <Anonymous> -> add_edges
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Box-Dimension.Rmd’ using rmarkdown
    ```

# skynet

<details>

* Version: 1.4.3
* GitHub: https://github.com/ropensci/skynet
* Source code: https://github.com/cran/skynet
* Date/Publication: 2022-06-17 13:00:02 UTC
* Number of recursive dependencies: 98

Run `revdepcheck::cloud_details(, "skynet")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(skynet)
      > 
      > test_check("skynet")
      [ FAIL 4 | WARN 25 | SKIP 4 | PASS 46 ]
      
      ══ Skipped tests (4) ═══════════════════════════════════════════════════════════
      • On CRAN (4): 'test_download_db1b.R:6:3', 'test_download_ontime.R:6:3',
        'test_download_t100.R:6:3', 'test_download_t100.R:13:3'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_netDir.R:16:3'): make_net_dir with disp ────────────────────────
      <vctrs_error_names_must_be_unique/vctrs_error_names/vctrs_error/rlang_error/error/condition>
      Error in `rename(nodes, airport = name)`: Names must be unique.
      ✖ These names are duplicated:
        * "airport" at locations 1 and 2.
      Backtrace:
           ▆
        1. └─skynet::make_net_dir(OD_Sample, disp = TRUE) at test_netDir.R:16:3
        2.   ├─dplyr::rename(nodes, airport = name)
        3.   └─dplyr:::rename.data.frame(nodes, airport = name)
        4.     └─tidyselect::eval_rename(expr(c(...)), .data)
        5.       └─tidyselect:::rename_impl(...)
        6.         ├─tidyselect:::with_subscript_errors(...)
        7.         │ └─base::withCallingHandlers(...)
        8.         └─vctrs::vec_as_names(names, repair = "check_unique", call = error_call)
        9.           └─vctrs (local) `<fn>`()
       10.             └─vctrs:::validate_unique(names = names, arg = arg, call = call)
       11.               └─vctrs:::stop_names_must_be_unique(names, arg, call = call)
       12.                 └─vctrs:::stop_names(...)
       13.                   └─vctrs:::stop_vctrs(...)
       14.                     └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = call)
      ── Error ('test_netDir.R:27:3'): make_net_dir with cap ─────────────────────────
      <vctrs_error_names_must_be_unique/vctrs_error_names/vctrs_error/rlang_error/error/condition>
      Error in `rename(nodes, airport = name)`: Names must be unique.
      ✖ These names are duplicated:
        * "airport" at locations 1 and 2.
      Backtrace:
           ▆
        1. └─skynet::make_net_dir(OD_Sample, cap = TRUE) at test_netDir.R:27:3
        2.   ├─dplyr::rename(nodes, airport = name)
        3.   └─dplyr:::rename.data.frame(nodes, airport = name)
        4.     └─tidyselect::eval_rename(expr(c(...)), .data)
        5.       └─tidyselect:::rename_impl(...)
        6.         ├─tidyselect:::with_subscript_errors(...)
        7.         │ └─base::withCallingHandlers(...)
        8.         └─vctrs::vec_as_names(names, repair = "check_unique", call = error_call)
        9.           └─vctrs (local) `<fn>`()
       10.             └─vctrs:::validate_unique(names = names, arg = arg, call = call)
       11.               └─vctrs:::stop_names_must_be_unique(names, arg, call = call)
       12.                 └─vctrs:::stop_names(...)
       13.                   └─vctrs:::stop_vctrs(...)
       14.                     └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = call)
      ── Error ('test_netUnd.R:16:3'): make_net_und with disp ────────────────────────
      <vctrs_error_names_must_be_unique/vctrs_error_names/vctrs_error/rlang_error/error/condition>
      Error in `rename(nodes, airport = name)`: Names must be unique.
      ✖ These names are duplicated:
        * "airport" at locations 1 and 2.
      Backtrace:
           ▆
        1. └─skynet::make_net_und(OD_Sample, disp = TRUE, alpha = 0.003) at test_netUnd.R:16:3
        2.   ├─dplyr::rename(nodes, airport = name)
        3.   └─dplyr:::rename.data.frame(nodes, airport = name)
        4.     └─tidyselect::eval_rename(expr(c(...)), .data)
        5.       └─tidyselect:::rename_impl(...)
        6.         ├─tidyselect:::with_subscript_errors(...)
        7.         │ └─base::withCallingHandlers(...)
        8.         └─vctrs::vec_as_names(names, repair = "check_unique", call = error_call)
        9.           └─vctrs (local) `<fn>`()
       10.             └─vctrs:::validate_unique(names = names, arg = arg, call = call)
       11.               └─vctrs:::stop_names_must_be_unique(names, arg, call = call)
       12.                 └─vctrs:::stop_names(...)
       13.                   └─vctrs:::stop_vctrs(...)
       14.                     └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = call)
      ── Error ('test_netUnd.R:27:3'): make_net_und with cap ─────────────────────────
      <vctrs_error_names_must_be_unique/vctrs_error_names/vctrs_error/rlang_error/error/condition>
      Error in `rename(nodes, airport = name)`: Names must be unique.
      ✖ These names are duplicated:
        * "airport" at locations 1 and 2.
      Backtrace:
           ▆
        1. └─skynet::make_net_und(OD_Sample, cap = TRUE, pct = 10) at test_netUnd.R:27:3
        2.   ├─dplyr::rename(nodes, airport = name)
        3.   └─dplyr:::rename.data.frame(nodes, airport = name)
        4.     └─tidyselect::eval_rename(expr(c(...)), .data)
        5.       └─tidyselect:::rename_impl(...)
        6.         ├─tidyselect:::with_subscript_errors(...)
        7.         │ └─base::withCallingHandlers(...)
        8.         └─vctrs::vec_as_names(names, repair = "check_unique", call = error_call)
        9.           └─vctrs (local) `<fn>`()
       10.             └─vctrs:::validate_unique(names = names, arg = arg, call = call)
       11.               └─vctrs:::stop_names_must_be_unique(names, arg, call = call)
       12.                 └─vctrs:::stop_names(...)
       13.                   └─vctrs:::stop_vctrs(...)
       14.                     └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = call)
      
      [ FAIL 4 | WARN 25 | SKIP 4 | PASS 46 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘maps’
      All declared Imports should be used.
    ```

# SOMbrero

<details>

* Version: 1.4-2
* GitHub: https://github.com/tuxette/SOMbrero
* Source code: https://github.com/cran/SOMbrero
* Date/Publication: 2024-01-25 22:10:10 UTC
* Number of recursive dependencies: 114

Run `revdepcheck::cloud_details(, "SOMbrero")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SOMbrero-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: projectIGraph
    > ### Title: Compute the projection of a graph on a grid
    > ### Aliases: projectIGraph projectIGraph.somRes
    > 
    > ### ** Examples
    > 
    > data(lesmis)
    > set.seed(7383)
    > mis.som <- trainSOM(x.data=dissim.lesmis, type="relational", nb.save=10)
    > proj.lesmis <- projectIGraph(mis.som, lesmis)
    This graph was created by an old(er) igraph version.
      Call upgrade_graph() on it to use with the current igraph version
      For now we convert it on the fly...
    Error in i_set_vertex_attr(graph = graph, name = name, index = index,  : 
      Length of new attribute value must be 1 or 25, the number of target vertices, not 12
    Calls: projectIGraph ... add_vertices -> set_vertex_attr -> i_set_vertex_attr
    Execution halted
    ```

# TDApplied

<details>

* Version: 3.0.3
* GitHub: https://github.com/shaelebrown/TDApplied
* Source code: https://github.com/cran/TDApplied
* Date/Publication: 2024-03-12 23:00:02 UTC
* Number of recursive dependencies: 81

Run `revdepcheck::cloud_details(, "TDApplied")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘TDApplied-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot_vr_graph
    > ### Title: Plot a VR graph using the igraph package.
    > ### Aliases: plot_vr_graph
    > 
    > ### ** Examples
    > 
    > 
    > if(require("TDAstats") & require("igraph"))
    + {
    +   # simulate data from the unit circle and calculate 
    +   # its diagram
    +   df <- TDAstats::circle2d[sample(1:100,25),]
    +   diag <- TDAstats::calculate_homology(df,
    +                                        dim = 1,
    +                                        threshold = 2)
    +   
    +   # get minimum death radius of any data cluster
    +   min_death_H0 <- 
    +   min(diag[which(diag[,1] == 0),3L])
    +   
    +   # get birth and death radius of the loop
    +   loop_birth <- as.numeric(diag[nrow(diag),2L])
    +   loop_death <- as.numeric(diag[nrow(diag),3L])
    + 
    +   # compute VR graphs at radii half of 
    +   # min_death_H0 and the mean of loop_birth and 
    +   # loop_death, returning clusters
    +   graphs <- vr_graphs(X = df,eps = 
    +   c(0.5*min_death_H0,(loop_birth + loop_death)/2))
    +   
    +   # plot graph of smaller (first) radius
    +   plot_vr_graph(graphs = graphs,eps = 0.5*min_death_H0,
    +                   plot_isolated_vertices = TRUE)
    +   
    +   # plot graph of larger (second) radius
    +   plot_vr_graph(graphs = graphs,eps = (loop_birth + loop_death)/2)
    +   
    +   # repeat but with rownames for df, each vertex
    +   # will be plotted with its rownames
    +   rownames(df) <- paste0("V",1:25)
    +   graphs <- vr_graphs(X = df,eps = 
    +   c(0.5*min_death_H0,(loop_birth + loop_death)/2))
    +   plot_vr_graph(graphs = graphs,eps = 0.5*min_death_H0,
    +                   plot_isolated_vertices = TRUE)
    +   
    +   # plot without vertex labels
    +   plot_vr_graph(graphs = graphs,eps = (loop_birth + loop_death)/2,
    +                   vertex_labels = FALSE)
    +                  
    +   # plot only the graph component containing vertex "1"
    +   plot_vr_graph(graphs = graphs,eps = 0.5*min_death_H0,
    +                   component_of = "V1",plot_isolated_vertices = TRUE)
    +  
    +   # save the layout of the graph for adding features to 
    +   # the same graph layout, like color
    +   layout <- plot_vr_graph(graphs = graphs,eps = (loop_birth + loop_death)/2,
    +                             return_layout = TRUE,vertex_labels = TRUE)
    +   cols <- rep("blue",25)
    +   cols[1:5] <- "red"
    +   plot_vr_graph(graphs = graphs,eps = (loop_birth + loop_death)/2,cols = cols,
    +                   layout = layout)
    +   
    + }
    Loading required package: TDAstats
    
    Attaching package: ‘TDAstats’
    
    The following object is masked from ‘package:TDApplied’:
    
        permutation_test
    
    Loading required package: igraph
    
    Attaching package: ‘igraph’
    
    The following objects are masked from ‘package:stats’:
    
        decompose, spectrum
    
    The following object is masked from ‘package:base’:
    
        union
    
    Error in i_set_vertex_attr(graph = graph, name = name, index = index,  : 
      Length of new attribute value must be 1 or 0, the number of target vertices, not 25
    Calls: plot_vr_graph ... add_vertices -> set_vertex_attr -> i_set_vertex_attr
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘HCP_analysis.Rmd’ using rmarkdown
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 11.5Mb
      sub-directories of 1Mb or more:
        doc    7.6Mb
        libs   3.4Mb
    ```

# textrank

<details>

* Version: 0.3.1
* GitHub: https://github.com/bnosac/textrank
* Source code: https://github.com/cran/textrank
* Date/Publication: 2020-10-12 11:50:02 UTC
* Number of recursive dependencies: 52

Run `revdepcheck::cloud_details(, "textrank")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘textrank-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: textrank_sentences
    > ### Title: Textrank - extract relevant sentences
    > ### Aliases: textrank_sentences
    > 
    > ### ** Examples
    > 
    > ## Don't show: 
    > if(require(udpipe)) { 
    + ## End(Don't show)
    + library(udpipe)
    + data(joboffer)
    + head(joboffer)
    + joboffer$textrank_id <- unique_identifier(joboffer, c("doc_id", "paragraph_id", "sentence_id"))
    + sentences <- unique(joboffer[, c("textrank_id", "sentence")])
    + cat(sentences$sentence)
    + terminology <- subset(joboffer, upos %in% c("NOUN", "ADJ"), select = c("textrank_id", "lemma"))
    + head(terminology)
    + 
    + ## Textrank for finding the most relevant sentences
    + tr <- textrank_sentences(data = sentences, terminology = terminology)
    + summary(tr, n = 2)
    + summary(tr, n = 5, keep.sentence.order = TRUE)
    + 
    + ## Not run: 
    + ##D ## Using minhash to reduce sentence combinations - relevant if you have a lot of sentences
    + ##D library(textreuse)
    + ##D minhash <- minhash_generator(n = 1000, seed = 123456789)
    + ##D candidates <- textrank_candidates_lsh(x = terminology$lemma, sentence_id = terminology$textrank_id,
    + ##D                                       minhashFUN = minhash, bands = 500)
    + ##D tr <- textrank_sentences(data = sentences, terminology = terminology,
    + ##D                          textrank_candidates = candidates)
    + ##D summary(tr, n = 2)
    + ## End(Not run)
    + ## You can also reduce the number of sentence combinations by sampling
    + tr <- textrank_sentences(data = sentences, terminology = terminology, max = 100)
    + tr
    + summary(tr, n = 2)
    + ## Don't show: 
    + } # End of main if statement running only if the required packages are installed
    Loading required package: udpipe
    Statistical expert / data scientist / analytical developer BNOSAC (Belgium Network of Open Source Analytical Consultants), is a Belgium consultancy company specialized in data analysis and statistical consultancy using open source tools. In order to increase and enhance the services provided to our clients, we are on the lookout for an all-round statistical expert, data scientist and analytical developer. Function: Your main task will be the execution of a diverse range of consultancy services in the field of statistics and data science. You will be involved in a small team where you handle the consultancy services from the start of the project until the end. This covers: Joint meeting with clients on the topic of the analysis. Acquaintance with the data. Analysis of the techniques that are required to execute the study. Mostly standard statistical and biostatistical modelling, predictive analytics & machine learning techniques. Perform statistical design, modeling and analysis, together with more seniors. Building the report on the data analysis. Automating and R/Python package development. Integration of the models into the existing architecture. Giving advise to the client on the research questions, design or integration. Next to that, you will help in building data products and help sell them. These cover text mining, integration of predictive analytics in existing tools and the creation of specific data analysis tools and web services. You also might be involved in providing data science related courses for clients. Profile: You have a master degree in the domain of Statistics, Biostatistics, Mathematics, Commercial or Industrial Engineering, Economics or similar. You have a strong interest in statistics and data analysis. You have good communication skills, are fluent in English and know either Dutch or French. You soak up new knowledge and either just make things work or have the attitude of 'I can do this'. Besides this, you have attention to detail and adapt to changes quickly. You have programming experience in R or you really want to switch to using R. You have a sound knowledge of another data analysis language (Python, SQL, javascript) and you don't care in which relational database, Excel, bigdata or noSQL store your data is located. Interested in robotics is a plus. Offer: A half or full-time employment depending on your personal situation. The ability to get involved in a whole range of sectors and topics and the flexibility to shape your own future. The usage of a diverse range of statistical & data science techniques. Support in getting up to speed quickly in the usage of R. An environment in which you can develop your talent and make your own proposals the standard way to go. Liberty in managing your open source projects during working hours. Contact: To apply or in order to get more information about the job content, please contact us at: http://bnosac.be/index.php/contact/get-in-touchError in data.frame(textrank_id = names(pr$vector), textrank = as.numeric(pr$vector),  : 
      arguments imply differing number of rows: 0, 37
    Calls: textrank_sentences ... merge.data.frame -> nrow -> as.data.frame -> data.frame
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘textrank.Rmd’ using rmarkdown
    
    Quitting from lines 116-121 [unnamed-chunk-7] (textrank.Rmd)
    Error: processing vignette 'textrank.Rmd' failed with diagnostics:
    arguments imply differing number of rows: 0, 37
    --- failed re-building ‘textrank.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘textrank.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# tidygraph

<details>

* Version: 1.3.1
* GitHub: https://github.com/thomasp85/tidygraph
* Source code: https://github.com/cran/tidygraph
* Date/Publication: 2024-01-30 13:40:02 UTC
* Number of recursive dependencies: 80

Run `revdepcheck::cloud_details(, "tidygraph")` for more info

</details>

## Newly broken

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
      > library(tidygraph)
      
      Attaching package: 'tidygraph'
      
      The following object is masked from 'package:testthat':
      
          matches
      
      The following object is masked from 'package:stats':
      
          filter
      
      > 
      > test_check("tidygraph")
      Ungrouping `.data`...
      Splitting by nodes
      Unfocusing graph...
      `focus()` selected all nodes. Returning unfocused graph
      `focus()` didn't select any nodes. Returning unfocused graph
      Unfocusing graph...
      Unfocusing prior to grouping
      Unfocusing prior to morphing
      Unfocusing graph...
      Joining with `by = join_by(from, to)`
      Joining with `by = join_by(from, to)`
      Joining with `by = join_by(from, to)`
      Joining with `by = join_by(from, to)`
      Joining with `by = join_by(from, to)`
      Joining with `by = join_by(from, to)`
      Ungrouping `.data`...
      Subsetting by nodes
      Splitting by nodes
      Unfocusing prior to morphing
      [ FAIL 13 | WARN 2 | SKIP 1 | PASS 426 ]
      
      ══ Skipped tests (1) ═══════════════════════════════════════════════════════════
      • On CRAN (1): 'test-random-walk.R:19:3'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-graph_measures.R:17:3'): graph measures returns scalars ────────
      Error in `radius_dijkstra_impl(graph, weights = weights, mode = mode)`: At vendor/cigraph/src/paths/distances.c:328 : Weight vector length (1) does not match number of edges (8). Invalid value
      Backtrace:
          ▆
       1. ├─testthat::expect_length(graph_radius(), 1) at test-graph_measures.R:17:3
       2. │ └─testthat::quasi_label(enquo(object), arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─tidygraph::graph_radius()
       5.   └─igraph::radius(graph, mode)
       6.     └─igraph:::radius_dijkstra_impl(graph, weights = weights, mode = mode)
      ── Failure ('test-graph_measures.R:32:1'): graph context is empty after test ───
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-group.R:92:1'): graph context is empty after test ────────────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-group_by.R:15:1'): graph context is empty after test ─────────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-local.R:37:1'): graph context is empty after test ────────────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-morph.R:135:1'): graph context is empty after test ───────────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-mutate.R:15:1'): graph context is empty after test ───────────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-node_measures.R:78:1'): graph context is empty after test ────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-node_types.R:58:1'): graph context is empty after test ───────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-pair_measures.R:58:1'): graph context is empty after test ────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-search.R:58:1'): graph context is empty after test ───────────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-slice.R:27:1'): graph context is empty after test ────────────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-tidyr-utils.R:18:1'): graph context is empty after test ──────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      
      [ FAIL 13 | WARN 2 | SKIP 1 | PASS 426 ]
      Error: Test failures
      Execution halted
    ```

# timeordered

<details>

* Version: 1.0.0
* GitHub: NA
* Source code: https://github.com/cran/timeordered
* Date/Publication: 2023-08-20 22:20:02 UTC
* Number of recursive dependencies: 12

Run `revdepcheck::cloud_details(, "timeordered")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘timeordered-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: applynetworkfunction
    > ### Title: Applies a function (typically a descriptive statistic) to
    > ###   multiple time-aggregated networks
    > ### Aliases: applynetworkfunction
    > 
    > ### ** Examples
    > 
    > data(ants)
    > allindivs <- c(union(ants$VertexFrom, ants$VertexTo), "NULL1", "NULL2")
    > g <- generatetonetwork(ants, allindivs)
    > td100 <- generatetimedeltas(0,1500,100)
    > ns100 <- generatenetworkslices(g, td100)
    Error in data.frame(..., check.names = FALSE) : 
      arguments imply differing number of rows: 20, 91
    Calls: generatenetworkslices ... graph_from_data_frame -> cbind -> cbind -> data.frame
    Execution halted
    ```

# wikkitidy

<details>

* Version: 0.1.12
* GitHub: https://github.com/wikihistories/wikkitidy
* Source code: https://github.com/cran/wikkitidy
* Date/Publication: 2024-02-09 08:00:03 UTC
* Number of recursive dependencies: 62

Run `revdepcheck::cloud_details(, "wikkitidy")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘wikkitidy-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: query_category_members
    > ### Title: Explore Wikipedia's category system
    > ### Aliases: query_category_members build_category_tree
    > 
    > ### ** Examples
    > 
    > # Get the first 10 pages in 'Category:Physics' on English Wikipedia
    > physics_members <- wiki_action_request() %>%
    +   query_category_members("Physics") %>% next_batch()
    > physics_members
    <complete/query_tbl>
    ℹ There are more results on the server. Retrieve them with `next_batch()` or `retrieve_all()`
    ✔ Data complete for all records
    # A tibble: 10 × 3
         pageid    ns title                                              
          <int> <int> <chr>                                              
     1     6019     0 Computational chemistry                            
     2    22939     0 Physics                                            
     3  1653925   100 Portal:Physics                                     
     4 14647723     0 Disclination                                       
     5 74985603     0 Edge states                                        
     6 75395346     0 Dynamic toroidal dipole                            
     7 75558170     0 Charge based boundary element fast multipole method
     8 75702882     1 Talk:Dynamic toroidal dipole                       
     9 76067366     0 Fiveling                                           
    10 76122969     0 Action principles                                  
    > 
    > 
    > # Build the tree of all albums for the Melbourne band Custard
    > tree <- build_category_tree("Category:Custard_(band)_albums")
    ⠙ Walking subcategories: 1 done (379/s) | 3ms
    ⠹ Walking subcategories: 2 done (15/s) | 137ms
    > tree
    $nodes
    # A tibble: 11 × 4
         pageid    ns title                                      type  
          <int> <int> <chr>                                      <chr> 
     1 41181643    14 Category:Custard_(band)_albums             root  
     2 47888836     0 Come Back, All Is Forgiven                 page  
     3 59271122     0 The Common Touch (album)                   page  
     4 30333352     0 Loverama                                   page  
     5 63691299     0 Respect All Lifeforms                      page  
     6 43770191     0 Wahooti Fandango                           page  
     7 30333401     0 We Have the Technology                     page  
     8 43769837     0 Wisenheimer                                page  
     9 41148700    14 Category:Custard (band) compilation albums subcat
    10 43770688     0 Brisbane 1990–1993                         page  
    11 43770872     0 Goodbye Cruel World (Custard album)        page  
    
    $edges
    # A tibble: 10 × 3
         source   target timestamp           
          <int>    <int> <chr>               
     1 41181643 47888836 2015-09-21T10:58:43Z
     2 41181643 59271122 2019-01-06T17:20:32Z
     3 41181643 30333352 2013-11-24T21:09:05Z
     4 41181643 63691299 2020-04-18T06:08:40Z
     5 41181643 43770191 2014-09-08T08:02:46Z
     6 41181643 30333401 2013-11-24T21:09:09Z
     7 41181643 43769837 2014-09-08T06:31:49Z
     8 41181643 41148700 2013-11-21T14:38:43Z
     9 41148700 43770688 2015-05-20T06:12:07Z
    10 41148700 43770872 2015-04-26T23:42:41Z
    
    > 
    > # For network analysis and visualisation, you can pass the category tree
    > # to igraph
    > tree_graph <- igraph::graph_from_data_frame(tree$edges, vertices = tree$nodes)
    Warning: Unknown or uninitialised column: `name`.
    Error in i_set_vertex_attr(graph = graph, name = name, index = index,  : 
      Length of new attribute value must be 1 or 63691299, the number of target vertices, not 11
    Calls: <Anonymous> ... add_vertices -> set_vertex_attr -> i_set_vertex_attr
    Execution halted
    ```

