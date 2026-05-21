# Boptbd (1.0.7)

* Email: <mailto:diboobayu@gmail.com>
* GitHub mirror: <https://github.com/cran/Boptbd>

Run `revdepcheck::cloud_details(, "Boptbd")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > ### Title: Creates the graphical layout of resultant optimal design
     > ### Aliases: graphoptBbd
     > ### Keywords: Graphical layout
     > 
     > ### ** Examples
     > 
     >     ##To create the graphical layout of the D-optimal block design
     >     ##obtained using the treatment exchange algorithm for 
     >     trt.N <- 10  #Number of treatments
     >     blk.N <- 10  #Number of blocks
     >     alpha <- 0.1 #alpha value 
     >     beta  <- 0.1 #beta value 
     >     OptdesF <- rbind(1:10, c(2:10,1)) #Bayesian A-optimal block design (loop design)
     > 
     >     graphoptBbd(trt.N = 10, blk.N = 10, alpha = 0.1, beta = 0.1, OptdesF, Optcrit = "A")
     Error:
     ! `tkplot()` was deprecated in igraph 3.0.0 and is now defunct.
     Backtrace:
         ▆
      1. └─Boptbd::graphoptBbd(...)
      2.   └─igraph::tkplot(...)
      3.     └─lifecycle::deprecate_stop("3.0.0", "tkplot()")
      4.       └─lifecycle:::deprecate_stop0(msg)
      5.         └─rlang::cnd_signal(...)
     Execution halted
     ```

# c3net (1.1.1.1)

* Email: <mailto:altayscience@gmail.com>
* GitHub mirror: <https://github.com/cran/c3net>

Run `revdepcheck::cloud_details(, "c3net")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘c3net-Ex.R’ failed
     The error most likely occurred in:
     
     > ### Name: c3net
     > ### Title: All in one function to infer network with C3NET
     > ### Aliases: c3net
     > ### Keywords: misc
     > 
     > ### ** Examples
     > 
     > data(expdata)
     > data(truenet)
     > 
     > net <- c3net(expdata, network=TRUE)
     Error:
     ! `tkplot()` was deprecated in igraph 3.0.0 and is now defunct.
     Backtrace:
         ▆
      1. └─c3net::c3net(expdata, network = TRUE)
      2.   └─c3net::netplot(net)
      3.     └─igraph::tkplot(z)
      4.       └─lifecycle::deprecate_stop("3.0.0", "tkplot()")
      5.         └─lifecycle:::deprecate_stop0(msg)
      6.           └─rlang::cnd_signal(...)
     Execution halted
     ```

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

# ggm (2.5.2)

* Email: <mailto:giovanni.marchetti@unifi.it>
* GitHub mirror: <https://github.com/cran/ggm>

Run `revdepcheck::cloud_details(, "ggm")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     +              0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,
     +              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
     +              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
     +              0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,
     +              0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,
     +              0,0,0,0,1,0,1,0,1,1,0,0,0,0,0,0,
     +              1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
     +              0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,
     +              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
     +              1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,
     +              0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0),16,16,byrow=TRUE)
     > M <- c(3,5,6,15,16)
     > C <- c(4,7)
     > AG(ex, M, C, plot = TRUE)
     Error:
     ! `tkplot()` was deprecated in igraph 3.0.0 and is now defunct.
     Backtrace:
         ▆
      1. └─ggm::AG(ex, M, C, plot = TRUE)
      2.   └─ggm (local) plotfun(fr, ...)
      3.     └─igraph::tkplot(...)
      4.       └─lifecycle::deprecate_stop("3.0.0", "tkplot()")
      5.         └─lifecycle:::deprecate_stop0(msg)
      6.           └─rlang::cnd_signal(...)
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

# optbdmaeAT (1.0.2)

* Email: <mailto:diboobayu@gmail.com>
* GitHub mirror: <https://github.com/cran/optbdmaeAT>

Run `revdepcheck::cloud_details(, "optbdmaeAT")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > ### Name: graphoptbd.mae
     > ### Title: Creates the graphical layout of resultant optimal design
     > ### Aliases: graphoptbd.mae
     > ### Keywords: Graphical layout
     > 
     > ### ** Examples
     > 
     >     ##To create the graphical layout of the D-optimal block design
     >     ##obtained using the treatment exchange algorithm for 
     >     trt.N <- 10  #Number of treatments
     >     blk.N <- 10  #Number of blocks
     >     theta <- 0.2 #theta value 
     >     OptdesF <- rbind(1:10, c(2:10,1)) #D-optimal design (loop design)
     > 
     >     graphoptbd.mae(trt.N = 10, blk.N = 10, theta = 0.2, OptdesF, Optcrit = "D", cbVal2 = 0)
     Error:
     ! `tkplot()` was deprecated in igraph 3.0.0 and is now defunct.
     Backtrace:
         ▆
      1. └─optbdmaeAT::graphoptbd.mae(...)
      2.   └─igraph::tkplot(...)
      3.     └─lifecycle::deprecate_stop("3.0.0", "tkplot()")
      4.       └─lifecycle:::deprecate_stop0(msg)
      5.         └─rlang::cnd_signal(...)
     Execution halted
     ```

# optrcdmaeAT (1.0.1)

* Email: <mailto:diboobayu@gmail.com>
* GitHub mirror: <https://github.com/cran/optrcdmaeAT>

Run `revdepcheck::cloud_details(, "optrcdmaeAT")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > 
     > ### ** Examples
     > 
     >     ##To create the graphical layout of the D-optimal row-column design
     >     ##obtained using the treatment exchange algorithm for 
     >     
     >     trt.N <- 10  #Number of treatments
     >     
     >     col.N <- 10  #Number of arrays
     >     
     >     theta <- 0.2 #theta value 
     >     
     >     OptdesF <- rbind(1:10, c(2:10, 1)) #D-optimal design (loop design)
     > 
     >     graphoptrcd.mae(trt.N = 10, col.N = 10, theta = 0.2, OptdesF, Optcrit = "D", cbVal2 = 0)
     Error:
     ! `tkplot()` was deprecated in igraph 3.0.0 and is now defunct.
     Backtrace:
         ▆
      1. └─optrcdmaeAT::graphoptrcd.mae(...)
      2.   └─igraph::tkplot(...)
      3.     └─lifecycle::deprecate_stop("3.0.0", "tkplot()")
      4.       └─lifecycle:::deprecate_stop0(msg)
      5.         └─rlang::cnd_signal(...)
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

