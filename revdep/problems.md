# Cascade (2.3)

* GitHub: <https://github.com/fbertran/Cascade>
* Email: <mailto:frederic.bertrand@lecnam.net>
* GitHub mirror: <https://github.com/cran/Cascade>

Run `revdepcheck::cloud_details(, "Cascade")` for more info

## Newly broken

*   checking whether package ‘Cascade’ can be installed ... WARNING
     ```
     Found the following significant warnings:
       Warning: replacing previous import ‘igraph::circulant’ by ‘magic::circulant’ when loading ‘Cascade’
     See ‘/tmp/workdir/Cascade/new/Cascade.Rcheck/00install.out’ for details.
     ```

# DiagrammeR (1.0.11)

* GitHub: <https://github.com/rich-iannone/DiagrammeR>
* Email: <mailto:riannone@me.com>
* GitHub mirror: <https://github.com/cran/DiagrammeR>

Run `revdepcheck::cloud_details(, "DiagrammeR")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > # for all nodes in the graph
     > graph %>%
     +   get_leverage_centrality()
     Error in `purrr::map()`:
     ℹ In index: 1.
     Caused by error in `igraph::neighbors()`:
     ! `vid` must specify exactly one vertex
     Backtrace:
          ▆
       1. ├─graph %>% get_leverage_centrality()
       2. ├─DiagrammeR::get_leverage_centrality(.)
       3. │ ├─... %>% unlist()
       4. │ └─purrr::map(...)
       5. │   └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
       6. │     ├─purrr:::with_indexed_errors(...)
       7. │     │ └─base::withCallingHandlers(...)
       8. │     ├─purrr:::call_with_cleanup(...)
       9. │     └─DiagrammeR (local) .f(.x[[i]], ...)
      10. │       ├─base::mean(...)
      11. │       └─igraph::neighbors(ig_graph, degree_vals)
      12. │         └─igraph:::neighbors_impl(graph = graph, vid = v, mode = mode)
      13. │           └─cli::cli_abort(...)
      14. │             └─rlang::abort(...)
      15. └─base::unlist(.)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
         'test-add_graphs.R:3:1', 'test-add_graphs.R:223:1',
         'test-add_graphs.R:1706:1', 'test-add_nodes_edges_from_table.R:268:1',
         'test-cache_attrs.R:3:1', 'test-colorize_nodes_edges.R:219:1',
         'test-create_combine_nodes.R:3:1', 'test-create_subgraph.R:3:1',
         'test-delete_node_edge.R:255:1',
         'test-get_select_last_nodes_edges_created.R:75:1',
         'test-graph_series.R:323:1', 'test-graph_validation.R:3:1',
         'test-graph_validation.R:234:1', 'test-graph_validation.R:292:1',
         'test-render_graph.R:3:3', 'test-selections.R:1:1',
         'test-set_get_node_edge_attrs.R:236:1', 'test-similarity_measures.R:1:1',
         'test-similarity_measures.R:113:1', 'test-transform_graph.R:98:1',
         'test-transform_graph.R:262:1', 'test-trav_out_until.R:1:1',
         'test-traversals.R:3:1'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-get_node_calculations.R:255:3'): Getting leverage centrality is possible ──
       <purrr_error_indexed/rlang_error/error/condition>
       Error in `purrr::map(seq_along(degree_vals), function(x) {     mean((degree_vals[x] - degree_vals[igraph::neighbors(ig_graph, degree_vals)])/(degree_vals[x] + degree_vals[igraph::neighbors(ig_graph, degree_vals)])) })`: i In index: 1.
       Caused by error in `igraph::neighbors()`:
       ! `vid` must specify exactly one vertex
       
       [ FAIL 1 | WARN 3 | SKIP 24 | PASS 1796 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# jewel (2.0.2)

* GitHub: <https://github.com/annaplaksienko/jewel>
* Email: <mailto:anna@plaxienko.com>
* GitHub mirror: <https://github.com/cran/jewel>

Run `revdepcheck::cloud_details(, "jewel")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     The error most likely occurred in:
     
     > ### Name: constructWeights
     > ### Title: Construct weights for _jewel_ minimization problem from prior
     > ###   information on vertices degrees.
     > ### Aliases: constructWeights
     > 
     > ### ** Examples
     > 
     > {
     + K <- 3
     + p <- 50
     + n <- 20
     + data <- generateData_rewire(K = K, p = p, n = n, ncores = 1, verbose = FALSE)
     + G_list_true <- data$Graphs
     + true_degrees <- rowSums(G_list_true[[1]])
     + cut <- sort(true_degrees, decreasing = TRUE)[ceiling(p * 0.03)]
     + apriori_hubs <- ifelse(true_degrees >= cut, 10, 1)
     + W <- constructWeights(apriori_hubs, K = K)
     + }
     Error in rewire_impl(rewire = graph, n = niter, mode = mode) : 
       The value 2.4500000000000002 is not representable as an integer. Invalid value
     Source: rinterface_extra.c:83
     Calls: generateData_rewire ... do_call -> eval -> eval -> <Anonymous> -> rewire_impl
     Execution halted
     ```

# manynet (1.7.0)

* GitHub: <https://github.com/stocnet/manynet>
* Email: <mailto:james.hollway@graduateinstitute.ch>
* GitHub mirror: <https://github.com/cran/manynet>

Run `revdepcheck::cloud_details(, "manynet")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       > test-member_community.R: v `node_in_walktrap()` returns the highest modularity (0.826).
       > test-member_community.R: ========>----------------------   25% | ETA: 37s
       [ FAIL 1 | WARN 0 | SKIP 5 | PASS 695 ]
       
       ══ Skipped tests (5) ═══════════════════════════════════════════════════════════
       • On CRAN (5): 'test-manip_as.R:93:3', 'test-manip_split.R:49:3',
         'test-mark_nodes.R:85:3', 'test-mark_ties.R:41:3', 'test-mark_ties.R:50:3'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-make_generate.R:45:3'): generate_citations works ───────────────
       Error in `lastcit_game_impl(nodes = n, edges_per_node = edges, agebins = agebins, preference = pref, directed = directed)`: Expecting a scalar integer but received a vector of length 2. Invalid value
       Source: rinterface_extra.c:79
       Backtrace:
           ▆
        1. ├─testthat::expect_s3_class(...) at test-make_generate.R:45:3
        2. │ └─testthat::quasi_label(enquo(object))
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─manynet::generate_citations(ison_southern_women)
        5.   └─igraph::sample_last_cit(n, edges = ties, agebins = agebins, directed = directed)
        6.     └─igraph:::lastcit_game_impl(...)
       
       [ FAIL 1 | WARN 0 | SKIP 5 | PASS 695 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# rSpectral (1.0.0.14)

* GitHub: <https://github.com/cmclean5/rSpectral>
* Email: <mailto:lptolik@gmail.com>
* GitHub mirror: <https://github.com/cran/rSpectral>

Run `revdepcheck::cloud_details(, "rSpectral")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       This graph was created by an old(er) igraph version.
       i Call `igraph::upgrade_graph()` on it to use with the current igraph version.
       For now we convert it on the fly...
       Saving _problems/test-igraph-19.R
       Saving _problems/test-igraph-26.R
       [ FAIL 2 | WARN 4 | SKIP 0 | PASS 10 ]
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('test-igraph.R:19:3'): membership fix_neig=0 is correct ────────────
       Expected `c$modularity` to equal `exp_mod10`.
       Differences:
         `actual`: 0.432
       `expected`: 0.408
       
       ── Failure ('test-igraph.R:26:3'): membership fix_neig=1 is correct ────────────
       Expected `c$modularity` to equal `exp_mod11`.
       Differences:
         `actual`: 0.3758
       `expected`: 0.3776
       
       
       [ FAIL 2 | WARN 4 | SKIP 0 | PASS 10 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# sfnetworks (0.6.5)

* GitHub: <https://github.com/luukvdmeer/sfnetworks>
* Email: <mailto:luukvandermeer@live.nl>
* GitHub mirror: <https://github.com/cran/sfnetworks>

Run `revdepcheck::cloud_details(, "sfnetworks")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 276 ]
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test_paths.R:41:3'): Only the first from argument
                 is used for shortest paths calculations ──
       Error in `all_shortest_paths(x, from, to, weights = weights, ...)`: `from` must specify exactly one vertex
       Backtrace:
            ▆
         1. ├─testthat::expect_warning(...) at test_paths.R:41:3
         2. │ └─testthat:::quasi_capture(...)
         3. │   ├─testthat (local) .capture(...)
         4. │   │ └─base::withCallingHandlers(...)
         5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
         6. ├─sfnetworks::st_network_paths(...)
         7. └─sfnetworks:::st_network_paths.sfnetwork(...)
         8.   └─sfnetworks:::get_all_shortest_paths(...)
         9.     └─igraph::all_shortest_paths(x, from, to, weights = weights, ...)
        10.       └─igraph:::get_all_shortest_paths_dijkstra_impl(...)
        11.         └─cli::cli_abort(...)
        12.           └─rlang::abort(...)
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 276 ]
       Error:
       ! Test failures.
       Execution halted
     ```

