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
     ...
     > 
     > net <- c3net(expdata, network=TRUE)
     Warning: `graph.adjacency()` was deprecated in igraph 2.0.0.
     ℹ Please use `graph_from_adjacency_matrix()` instead.
     ℹ The deprecated feature was likely used in the c3net package.
       Please report the issue to the authors.
     Warning: `get.edgelist()` was deprecated in igraph 2.0.0.
     ℹ Please use `as_edgelist()` instead.
     ℹ The deprecated feature was likely used in the c3net package.
       Please report the issue to the authors.
     Warning: `graph.edgelist()` was deprecated in igraph 2.0.0.
     ℹ Please use `graph_from_edgelist()` instead.
     ℹ The deprecated feature was likely used in the c3net package.
       Please report the issue to the authors.
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

# cfid (0.1.8)

* GitHub: <https://github.com/santikka/cfid>
* Email: <mailto:santtuth@gmail.com>
* GitHub mirror: <https://github.com/cran/cfid>

Run `revdepcheck::cloud_details(, "cfid")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       Expected `import_graph(ig)` to be identical to `dag("X -> Z -> Y X <-> Y")`.
       Differences:
         `dim(actual)`: 5 5
       `dim(expected)`: 4 4
       
       `attr(actual, 'labels')[2:5]`:   "Z" "Y" "U[X,Y]" "U[Z,Y]"
       `attr(expected, 'labels')[2:4]`: "Z" "Y" "U[X,Y]"         
       
       `attr(actual, 'latent')[2:5]`:   FALSE FALSE TRUE TRUE
       `attr(expected, 'latent')[2:4]`: FALSE FALSE TRUE     
       
         `attr(actual, 'order')`: 4 5 3 1 2
       `attr(expected, 'order')`: 4 1 2 3  
       
       `attr(actual, 'text')`:   "X; Z; Y; X -> Z; Y -> X; X <-> Y; Z <-> Y"
       `attr(expected, 'text')`: "X; Z; Y; X -> Z; Z -> Y; X <-> Y"         
       
               `actual`: 0 0 1 1 0 1 0 0 0 1 and 15 more...
       `expected[2:16]`: 0 0 1 1 0 0 0 0 1 0            ...
       
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 204 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# comato (1.1)

* Email: <mailto:andreas.muehling@tum.de>
* GitHub mirror: <https://github.com/cran/comato>

Run `revdepcheck::cloud_details(, "comato")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > g2 = set.vertex.attribute(erdos.renyi.game(5, 0.7, type="gnp"), "name", value=1:5)
     > g3 = set.vertex.attribute(erdos.renyi.game(5, 0.7, type="gnp"), "name", value=1:5)
     > E(g1)$name <- rep("", length(E(g1)))
     > E(g2)$name <- rep("", length(E(g2)))
     > E(g3)$name <- rep("", length(E(g3)))
     > #Create conceptmaps object from three conceptmap objects
     > simple_cms = conceptmaps(list(conceptmap(g1), conceptmap(g2), conceptmap(g3)))
     > 
     > plot(simple_cms, layout="spring")
     Warning: `graph.union()` was deprecated in igraph 2.0.0.
     ℹ Please use `union.igraph()` instead.
     ℹ The deprecated feature was likely used in the comato package.
       Please report the issue to the authors.
     Error:
     ! `layout.spring()` was deprecated in igraph 2.1.0 and is now defunct.
     ℹ Please use `layout_with_fr()` instead.
     Backtrace:
         ▆
      1. ├─base::plot(simple_cms, layout = "spring")
      2. └─comato:::plot.conceptmaps(simple_cms, layout = "spring")
      3.   └─igraph::layout.spring(union)
      4.     └─lifecycle::deprecate_stop("2.1.0", "layout.spring()", "layout_with_fr()")
      5.       └─lifecycle:::deprecate_stop0(msg)
      6.         └─rlang::cnd_signal(...)
     Execution halted
     ```

# cranly (0.6.0)

* GitHub: <https://github.com/ikosmidis/cranly>
* Email: <mailto:ioannis.kosmidis@warwick.ac.uk>
* GitHub mirror: <https://github.com/cran/cranly>

Run `revdepcheck::cloud_details(, "cranly")` for more info

## Newly broken

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
         ▆
      1. ├─base::summary(package_network)
      2. └─cranly:::summary.cranly_network(package_network)
      3.   └─igraph::eigen_centrality(cranly_graph, scale = FALSE)
      4.     └─lifecycle::deprecate_stop(...)
      5.       └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'cranly.Rmd' failed with diagnostics:
     The `scale` argument of `eigen_centrality()` always as if TRUE as of
     igraph 2.1.1.
     ℹ Normalization is always performed
     --- failed re-building ‘cranly.Rmd’
     
     --- re-building ‘dependence_trees.Rmd’ using rmarkdown
     --- finished re-building ‘dependence_trees.Rmd’
     
     --- re-building ‘extractors.Rmd’ using rmarkdown
     --- finished re-building ‘extractors.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘cranly.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# dci (1.0.3)

* GitHub: <https://github.com/aarkilanian/dci>
* Email: <mailto:a.arkilanian@gmail.com>
* GitHub mirror: <https://github.com/cran/dci>

Run `revdepcheck::cloud_details(, "dci")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
          ▆
       1. ├─dci::river_net(...)
       2. │ └─dci:::node_labeling(net)
       3. │   └─activate(net, nodes) %>% ...
       4. ├─dplyr::mutate(...)
       5. ├─tidygraph:::mutate.tbl_graph(...)
       6. │ └─tidygraph::mutate_as_tbl(.data, !!!dot)
       7. │   ├─dplyr::mutate(d_tmp, ...)
       8. │   ├─sf:::mutate.sf(d_tmp, ...)
       9. │   │ └─sf:::.re_sf(NextMethod(), sf_column_name = sf_column_name, agr)
      10. │   │   └─base::stopifnot(...)
      11. │   ├─base::NextMethod()
      12. │   └─dplyr:::mutate.data.frame(d_tmp, ...)
      13. │     └─dplyr:::mutate_cols(.data, dplyr_quosures(...), by)
      14. │       ├─base::withCallingHandlers(...)
      15. │       └─dplyr:::mutate_col(dots[[i]], data, mask, new_columns)
      16. │         └─mask$eval_all_mutate(quo)
      17. │           └─dplyr (local) eval()
      18. └─tidygraph::map_bfs(...)
      19.   └─tidygraph:::bfs_df(graph, root, mode, unreachable)
      20.     └─igraph::bfs(...)
      21.       └─lifecycle::deprecate_stop("2.2.0", "bfs(father = )", "bfs(parent = )")
      22.         └─lifecycle:::deprecate_stop0(msg)
      23.           └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-label.R:6:3'): Correct node labels created ─────────────────────
       <dplyr:::mutate_error/rlang_error/error/condition>
       Error in `stopifnot(!inherits(x, "sf"), !missing(sf_column_name), !missing(agr))`: i In argument: `node_label = tidygraph::map_bfs(...)`.
       Caused by error:
       ! The `father` argument of `bfs()` was deprecated in igraph 2.2.0 and is now defunct.
       i Please use the `parent` argument instead.
       ── Error ('test-label.R:18:3'): Correct member labels created ──────────────────
       <dplyr:::mutate_error/rlang_error/error/condition>
       Error in `stopifnot(!inherits(x, "sf"), !missing(sf_column_name), !missing(agr))`: i In argument: `member_label = tidygraph::map_dfs_int(...)`.
       Caused by error:
       ! The `father` argument of `dfs()` was deprecated in igraph 2.2.0 and is now defunct.
       i Please use the `parent` argument instead.
       ── Error ('test-river_net.R:18:3'): Simple river network is created ────────────
       <dplyr:::mutate_error/rlang_error/error/condition>
       Error in `stopifnot(!inherits(x, "sf"), !missing(sf_column_name), !missing(agr))`: i In argument: `node_label = tidygraph::map_bfs(...)`.
       Caused by error:
       ! The `father` argument of `bfs()` was deprecated in igraph 2.2.0 and is now defunct.
       i Please use the `parent` argument instead.
       
       [ FAIL 3 | WARN 0 | SKIP 1 | PASS 46 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
      15. │     └─dplyr:::mutate_cols(.data, dplyr_quosures(...), by)
      16. │       ├─base::withCallingHandlers(...)
      17. │       └─dplyr:::mutate_col(dots[[i]], data, mask, new_columns)
      18. │         └─mask$eval_all_mutate(quo)
      19. │           └─dplyr (local) eval()
      20. └─tidygraph::map_bfs(...)
      21.   └─tidygraph:::bfs_df(graph, root, mode, unreachable)
      22.     └─igraph::bfs(...)
      23.       └─lifecycle::deprecate_stop("2.2.0", "bfs(father = )", "bfs(parent = )")
      24.         └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'user_guide.Rmd' failed with diagnostics:
     ℹ In argument: `node_label = tidygraph::map_bfs(...)`.
     Caused by error:
     ! The `father` argument of `bfs()` was deprecated in igraph 2.2.0 and is
       now defunct.
     ℹ Please use the `parent` argument instead.
     --- failed re-building ‘user_guide.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘user_guide.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# degreenet (1.3-7)

* Email: <mailto:handcock@stat.ucla.edu>
* GitHub mirror: <https://github.com/cran/degreenet>

Run `revdepcheck::cloud_details(, "degreenet")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘degreenet-Ex.R’ failed
     The error most likely occurred in:
     
     > ### Name: reedmolloy
     > ### Title: Generate a undirected network with a given sequence of degrees
     > ### Aliases: reedmolloy
     > ### Keywords: models
     > 
     > ### ** Examples
     > 
     > # Now, simulate a Poisson Lognormal distribution over 100
     > # observations with mean = -1 and s.d. = 1.
     > 
     > set.seed(2)
     > s4 <- simpln(n=100, v=c(-1,1))
     > table(s4)
     s4
      1  2  3  4  5  6 
     65 18  7  4  4  2 
     > #
     > simr <- reedmolloy(s4)
     Error in reedmolloy(s4) : 
       The reedmolloy function failed to form a valid network from the passed degree sequence.
     Execution halted
     ```

# ECoL (0.4.4)

* GitHub: <https://github.com/lpfgarcia/ECoL>
* Email: <mailto:luis.garcia@unb.br>
* GitHub mirror: <https://github.com/cran/ECoL>

Run `revdepcheck::cloud_details(, "ECoL")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     ! `hub.score()` was deprecated in igraph 2.0.0 and is now defunct.
     ℹ Please use `hits_scores()` instead.
     Backtrace:
          ▆
       1. ├─ECoL::complexity(Species ~ ., iris)
       2. └─ECoL:::complexity.formula(Species ~ ., iris)
       3.   └─ECoL:::complexity.default(...)
       4.     ├─base::unlist(...)
       5.     └─base::sapply(...)
       6.       └─base::lapply(X = X, FUN = FUN, ...)
       7.         └─ECoL (local) FUN(X[[i]], ...)
       8.           ├─base::do.call(group, list(x = x, y = y, summary = summary, ...))
       9.           ├─ECoL::network(x = `<data.frame>`, y = `<fct>`, summary = `<chr>`)
      10.           └─ECoL:::network.default(x = `<data.frame>`, y = `<fct>`, summary = `<chr>`)
      11.             └─base::sapply(...)
      12.               └─base::lapply(X = X, FUN = FUN, ...)
      13.                 └─ECoL (local) FUN(X[[i]], ...)
      14.                   ├─base::eval(call(paste("class", f, sep = "."), graph))
      15.                   │ └─base::eval(call(paste("class", f, sep = "."), graph))
      16.                   └─ECoL:::class.G3(`<S3: igraph>`)
      17.                     └─igraph::hub.score(graph)
      18.                       └─lifecycle::deprecate_stop("2.0.0", "hub.score()", "hits_scores()")
      19.                         └─lifecycle:::deprecate_stop0(msg)
      20.                           └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
        20.                           └─rlang::cnd_signal(...)
       ── Error ('test_network.R:11:3'): multiclass.result ────────────────────────────
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: `hub.score()` was deprecated in igraph 2.0.0 and is now defunct.
       ℹ Please use `hits_scores()` instead.
       Backtrace:
            ▆
         1. ├─ECoL::network(Species ~ ., iris, measures = "G3", summary = "mean") at test_network.R:11:3
         2. └─ECoL:::network.formula(Species ~ ., iris, measures = "G3", summary = "mean")
         3.   └─ECoL:::network.default(...)
         4.     └─base::sapply(...)
         5.       └─base::lapply(X = X, FUN = FUN, ...)
         6.         └─ECoL (local) FUN(X[[i]], ...)
         7.           ├─base::eval(call(paste("class", f, sep = "."), graph))
         8.           │ └─base::eval(call(paste("class", f, sep = "."), graph))
         9.           └─ECoL:::class.G3(`<S3: igraph>`)
        10.             └─igraph::hub.score(graph)
        11.               └─lifecycle::deprecate_stop("2.0.0", "hub.score()", "hits_scores()")
        12.                 └─lifecycle:::deprecate_stop0(msg)
        13.                   └─rlang::cnd_signal(...)
       
       [ FAIL 3 | WARN 4 | SKIP 0 | PASS 96 ]
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
     +              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
     +              1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,
     +              0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0),16,16,byrow=TRUE)
     > M <- c(3,5,6,15,16)
     > C <- c(4,7)
     > AG(ex, M, C, plot = TRUE)
     Warning: `graph()` was deprecated in igraph 2.1.0.
     ℹ Please use `make_graph()` instead.
     ℹ The deprecated feature was likely used in the ggm package.
       Please report the issue to the authors.
     Warning: `get.edgelist()` was deprecated in igraph 2.0.0.
     ℹ Please use `as_edgelist()` instead.
     ℹ The deprecated feature was likely used in the ggm package.
       Please report the issue to the authors.
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

# ggraph (2.2.2)

* GitHub: <https://github.com/thomasp85/ggraph>
* Email: <mailto:thomasp85@gmail.com>
* GitHub mirror: <https://github.com/cran/ggraph>

Run `revdepcheck::cloud_details(, "ggraph")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     Caused by error:
     ! The `father` argument of `bfs()` was deprecated in igraph 2.2.0 and is
       now defunct.
     ℹ Please use the `parent` argument instead.
     Backtrace:
          ▆
       1. ├─tbl_graph(flare$vertices, flare$edges) %>% ...
       2. ├─dplyr::mutate(...)
       3. ├─tidygraph:::mutate.tbl_graph(...)
       4. │ └─tidygraph::mutate_as_tbl(.data, !!!dot)
       5. │   ├─dplyr::mutate(d_tmp, ...)
       6. │   └─dplyr:::mutate.data.frame(d_tmp, ...)
       7. │     └─dplyr:::mutate_cols(.data, dplyr_quosures(...), by)
       8. │       ├─base::withCallingHandlers(...)
       9. │       └─dplyr:::mutate_col(dots[[i]], data, mask, new_columns)
      10. │         └─mask$eval_all_mutate(quo)
      11. │           └─dplyr (local) eval()
      12. └─tidygraph::map_bfs_chr(...)
      13.   └─tidygraph::map_bfs(...)
      14.     └─tidygraph:::bfs_df(graph, root, mode, unreachable)
      15.       └─igraph::bfs(...)
      16.         └─lifecycle::deprecate_stop("2.2.0", "bfs(father = )", "bfs(parent = )")
      17.           └─lifecycle:::deprecate_stop0(msg)
      18.             └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
      16.           └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'Edges.Rmd' failed with diagnostics:
     ℹ In argument: `Class = map_bfs_back_chr(...)`.
     Caused by error:
     ! The `father` argument of `bfs()` was deprecated in igraph 2.2.0 and is
       now defunct.
     ℹ Please use the `parent` argument instead.
     --- failed re-building ‘Edges.Rmd’
     
     --- re-building ‘Layouts.Rmd’ using rmarkdown
     --- finished re-building ‘Layouts.Rmd’
     
     --- re-building ‘Nodes.Rmd’ using rmarkdown
     --- finished re-building ‘Nodes.Rmd’
     
     --- re-building ‘tidygraph.Rmd’ using rmarkdown
     --- finished re-building ‘tidygraph.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘Edges.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# glyrepr (0.12.0)

* GitHub: <https://github.com/glycoverse/glyrepr>
* Email: <mailto:23110220018@m.fudan.edu.cn>
* GitHub mirror: <https://github.com/cran/glyrepr>

Run `revdepcheck::cloud_details(, "glyrepr")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       > library(glyrepr)
       > 
       > test_check("glyrepr")
       Saving _problems/test-structure-to-iupac-95.R
       [ FAIL 1 | WARN 0 | SKIP 12 | PASS 1180 ]
       
       ══ Skipped tests (12) ══════════════════════════════════════════════════════════
       • On CRAN (12): 'test-composition.R:270:1', 'test-composition.R:297:1',
         'test-example-glycans.R:1:1', 'test-example-glycans.R:9:1',
         'test-example-glycans.R:16:1', 'test-example-glycans.R:23:1',
         'test-example-glycans.R:30:1', 'test-structure-level.R:66:1',
         'test-structure-level.R:147:1', 'test-structure.R:530:1',
         'test-structure.R:537:1', 'test-structure.R:545:1'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-structure-to-iupac.R:95:3'): structure_to_iupac handles complex branched structures ──
       <purrr_error_indexed/rlang_error/error/condition>
       Error in `purrr::map(valid_graphs, function(graph) {     checkmate::assert_class(graph, "igraph")     graph %>% validate_single_glycan_structure() %>% ensure_name_vertex_attr() })`: i In index: 1.
       Caused by error in `validate_single_glycan_structure()`:
       ! Duplicated linkage positions.
       
       [ FAIL 1 | WARN 0 | SKIP 12 | PASS 1180 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# GoodFitSBM (0.0.1)

* GitHub: <https://github.com/Roy-SR-007/GoodFitSBM>
* Email: <mailto:sohamghosh@tamu.edu>
* GitHub mirror: <https://github.com/cran/GoodFitSBM>

Run `revdepcheck::cloud_details(, "GoodFitSBM")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     ℹ The deprecated feature was likely used in the GoodFitSBM package.
       Please report the issue at <https://github.com/Roy-SR-007/GoodFitSBM/issues>.
     Warning: `get.edge.ids()` was deprecated in igraph 2.1.0.
     ℹ Please use `get_edge_ids()` instead.
     ℹ The deprecated feature was likely used in the GoodFitSBM package.
       Please report the issue at <https://github.com/Roy-SR-007/GoodFitSBM/issues>.
     Error:
     ! The `vp` argument of `get_edge_ids()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
          ▆
       1. └─GoodFitSBM::goftest_BetaSBM(adjsymm, C = class, numGraphs = 10)
       2.   └─GoodFitSBM::sample_a_move_BetaSBM(C, G)
       3.     └─GoodFitSBM:::Get.Next.Network(...)
       4.       └─GoodFitSBM:::Get.Move.beta.SBM(b, blocks = SBM.blocks, coin = beta.SBM.coin)
       5.         └─GoodFitSBM:::Get.Induced.Subgraph(g, v.block[[i]])
       6.           └─igraph::get.edge.ids(g, pairs)
       7.             └─igraph::get_edge_ids(...)
       8.               └─igraph:::el_to_vec(vp, call = rlang::caller_env())
       9.                 └─lifecycle::deprecate_stop(...)
      10.                   └─lifecycle:::deprecate_stop0(msg)
      11.                     └─rlang::cnd_signal(...)
     Execution halted
     ```

# manynet (2.0.1)

* GitHub: <https://github.com/stocnet/manynet>
* Email: <mailto:james.hollway@graduateinstitute.ch>
* GitHub mirror: <https://github.com/cran/manynet>

Run `revdepcheck::cloud_details(, "manynet")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
         'test-manip_transform.R:10:5', 'test-manip_transform.R:10:5'
       • Some functions need more input (4): 'test-manip_transform.R:8:5',
         'test-manip_transform.R:8:5', 'test-manip_transform.R:8:5',
         'test-manip_transform.R:8:5'
       • nodelist and pajek read/write not tested yet (2): 'test-make_read.R:12:5',
         'test-make_read.R:12:5'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('test-manip_format.R:129:3'): to_twomode works ─────────────────────
       Expected `is_twomode(to_twomode(ison_algebra, "type"))` to be TRUE.
       Differences:
       `actual`:   FALSE
       `expected`: TRUE 
       
       ── Failure ('test-manip_format.R:130:3'): to_twomode works ─────────────────────
       Expected `is_twomode(to_twomode(as_igraph(ison_algebra), "type"))` to be TRUE.
       Differences:
       `actual`:   FALSE
       `expected`: TRUE 
       
       
       [ FAIL 2 | WARN 0 | SKIP 18 | PASS 399 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# migraph (1.6.2)

* GitHub: <https://github.com/stocnet/migraph>
* Email: <mailto:james.hollway@graduateinstitute.ch>
* GitHub mirror: <https://github.com/cran/migraph>

Run `revdepcheck::cloud_details(, "migraph")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
         'test-tutorials_netrics.R:8:3'
       • On Linux (1): 'test-model_tests.R:58:3'
       • Skipping slow functions in diffusion.Rmd (1): 'test-tutorials_migraph.R:12:5'
       • empty test (1): 'test-measure_over.R:1:1'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('test-tutorials_migraph.R:12:5'): migraph tutorial code runs without warnings or errors ──
       Expected `w` to be NULL.
       Differences:
       `actual` is an S3 object of class <lifecycle_warning_deprecated/rlang_warning/warning/condition>, a list
       `expected` is NULL
       
       Warning in expression 17 : rg <- create_ring(32, width = 2)
       Backtrace:
           ▆
        1. ├─testthat::expect_null(...) at test-tutorials_migraph.R:12:5
        2. │ └─testthat::quasi_label(enquo(object), label)
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─migraph:::check_tute_functions(tute, skip = "ergm\\(|play_diffusions\\(")
        5.   └─testthat::expect_null(...) at ./helper-functions.R:126:5
       
       [ FAIL 1 | WARN 0 | SKIP 5 | PASS 347 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# nat (1.8.25)

* GitHub: <https://github.com/natverse/nat>
* Email: <mailto:jefferis@gmail.com>
* GitHub mirror: <https://github.com/cran/nat>

Run `revdepcheck::cloud_details(, "nat")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > hist(igraph::distances(ngw))
     > 
     > # converting back and forth between neurons and graphs
     > g=as.ngraph(Cell07PNs[[1]])
     > gstem=igraph::induced_subgraph(g, 1:10)
     > # this is fine
     > plot(gstem)
     > plot(as.neuron(gstem))
     Error:
     ! The `father` argument of `dfs()` was deprecated in igraph 2.2.0 and is
       now defunct.
     ℹ Please use the `parent` argument instead.
     Backtrace:
          ▆
       1. ├─base::plot(as.neuron(gstem))
       2. ├─nat::as.neuron(gstem)
       3. └─nat:::as.neuron.igraph(gstem)
       4.   └─nat:::as.neuron.ngraph(x, ...)
       5.     ├─nat::as.seglist(masterg <- x, origin = origin, Verbose = Verbose)
       6.     └─nat:::as.seglist.igraph(masterg <- x, origin = origin, Verbose = Verbose)
       7.       └─igraph::dfs(x, root = origin, father = TRUE, mode = "all")
       8.         └─lifecycle::deprecate_stop("2.2.0", "dfs(father = )", "dfs(parent = )")
       9.           └─lifecycle:::deprecate_stop0(msg)
      10.             └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
         7.       └─igraph::dfs(x, root = origin, father = TRUE, mode = "all")
         8.         └─lifecycle::deprecate_stop("2.2.0", "dfs(father = )", "dfs(parent = )")
         9.           └─lifecycle:::deprecate_stop0(msg)
        10.             └─rlang::cnd_signal(...)
       ── Error ('test-seglist.R:13:3'): convert graph to seglist ─────────────────────
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: The `father` argument of `dfs()` was deprecated in igraph 2.2.0 and is
       now defunct.
       ℹ Please use the `parent` argument instead.
       Backtrace:
           ▆
        1. ├─testthat::expect_equal(as.seglist(g), sl) at test-seglist.R:13:3
        2. │ └─testthat::quasi_label(enquo(object), label)
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. ├─nat::as.seglist(g)
        5. └─nat:::as.seglist.igraph(g)
        6.   └─igraph::dfs(x, root = origin, father = TRUE, mode = "all")
        7.     └─lifecycle::deprecate_stop("2.2.0", "dfs(father = )", "dfs(parent = )")
        8.       └─lifecycle:::deprecate_stop0(msg)
        9.         └─rlang::cnd_signal(...)
       
       [ FAIL 38 | WARN 2 | SKIP 6 | PASS 585 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     Backtrace:
          ▆
       1. ├─base::subset(n1, X > 240)
       2. └─nat:::subset.neuron(n1, X > 240)
       3.   └─nat::prune_vertices(x, r, invert = !invert, ...)
       4.     ├─nat::as.neuron(as.ngraph(dg), ...)
       5.     └─nat:::as.neuron.ngraph(as.ngraph(dg), ...)
       6.       ├─nat::as.seglist(masterg <- x, origin = origin, Verbose = Verbose)
       7.       └─nat:::as.seglist.igraph(masterg <- x, origin = origin, Verbose = Verbose)
       8.         └─igraph::dfs(x, root = origin, father = TRUE, mode = "all")
       9.           └─lifecycle::deprecate_stop("2.2.0", "dfs(father = )", "dfs(parent = )")
      10.             └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'neurons-intro.Rmd' failed with diagnostics:
     The `father` argument of `dfs()` was deprecated in igraph 2.2.0 and is
     now defunct.
     ℹ Please use the `parent` argument instead.
     --- failed re-building ‘neurons-intro.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘neurons-intro.Rmd’
     
     Error: Vignette re-building failed.
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

# qgraph (1.9.8)

* GitHub: <https://github.com/SachaEpskamp/qgraph>
* Email: <mailto:mail@sachaepskamp.com>
* GitHub mirror: <https://github.com/cran/qgraph>

Run `revdepcheck::cloud_details(, "qgraph")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     Warning: `watts.strogatz.game()` was deprecated in igraph 2.0.0.
     ℹ Please use `sample_smallworld()` instead.
     > smallworldness(regnet, B=10)
     Warning: `average.path.length()` was deprecated in igraph 2.0.0.
     ℹ Please use `mean_distance()` instead.
     ℹ The deprecated feature was likely used in the qgraph package.
       Please report the issue at <https://github.com/SachaEpskamp/qgraph>.
     Warning: `degree.sequence.game()` was deprecated in igraph 2.0.0.
     ℹ Please use `sample_degseq()` instead.
     ℹ The deprecated feature was likely used in the qgraph package.
       Please report the issue at <https://github.com/SachaEpskamp/qgraph>.
     Error:
     ! The `method` argument of `sample_degseq()` must be fast.heur.simple
       instead of simple.no.multiple as of igraph 2.1.0.
     Backtrace:
         ▆
      1. └─qgraph::smallworldness(regnet, B = 10)
      2.   └─base::lapply(...)
      3.     └─qgraph (local) FUN(X[[i]], ...)
      4.       └─igraph::degree.sequence.game(deg.dist, method = "simple.no.multiple")
      5.         └─igraph::sample_degseq(out.deg = out.deg, in.deg = in.deg, method = method)
      6.           └─lifecycle::deprecate_stop("2.1.0", "sample_degseq(method = 'must be fast.heur.simple instead of simple.no.multiple')")
      7.             └─lifecycle:::deprecate_stop0(msg)
      8.               └─rlang::cnd_signal(...)
     Execution halted
     ```

# R6causal (0.8.3)

* Email: <mailto:juha.karvanen@iki.fi>
* GitHub mirror: <https://github.com/cran/R6causal>

Run `revdepcheck::cloud_details(, "R6causal")` for more info

## Newly broken

*   checking whether package ‘R6causal’ can be installed ... WARNING
     ```
     Found the following significant warnings:
       Warning: `set.edge.attribute()` was deprecated in igraph 2.0.0.
       Warning: `induced.subgraph()` was deprecated in igraph 2.0.0.
       Warning: `get.vertex.attribute()` was deprecated in igraph 2.0.0.
     See ‘/tmp/workdir/R6causal/new/R6causal.Rcheck/00install.out’ for details.
     ```

# scistreer (1.2.1)

* GitHub: <https://github.com/kharchenkolab/scistreer>
* Email: <mailto:tgaoteng@gmail.com>
* GitHub mirror: <https://github.com/cran/scistreer>

Run `revdepcheck::cloud_details(, "scistreer")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     ℹ Please use the `parent` argument instead.
     Backtrace:
          ▆
       1. ├─scistreer::annotate_tree(tree_small, P_small)
       2. │ └─scistreer::mut_to_tree(gtree, mut_nodes)
       3. │   └─... %>% ...
       4. ├─dplyr::mutate(., GT = ifelse(GT == "" & !is.na(site), site, GT))
       5. ├─dplyr::mutate(...)
       6. ├─tidygraph:::mutate.tbl_graph(...)
       7. │ └─tidygraph::mutate_as_tbl(.data, !!!dot)
       8. │   ├─dplyr::mutate(d_tmp, ...)
       9. │   └─dplyr:::mutate.data.frame(d_tmp, ...)
      10. │     └─dplyr:::mutate_cols(.data, dplyr_quosures(...), by)
      11. │       ├─base::withCallingHandlers(...)
      12. │       └─dplyr:::mutate_col(dots[[i]], data, mask, new_columns)
      13. │         └─mask$eval_all_mutate(quo)
      14. │           └─dplyr (local) eval()
      15. ├─base::unlist(...)
      16. └─tidygraph::map_bfs(...)
      17.   └─tidygraph:::bfs_df(graph, root, mode, unreachable)
      18.     └─igraph::bfs(...)
      19.       └─lifecycle::deprecate_stop("2.2.0", "bfs(father = )", "bfs(parent = )")
      20.         └─lifecycle:::deprecate_stop0(msg)
      21.           └─rlang::cnd_signal(...)
     Execution halted
     ```

## In both

*   checking dependencies in R code ... NOTE
     ```
     Namespace in Imports field not imported from: ‘Rcpp’
       All declared Imports should be used.
     ```

# tidygraph (1.3.1)

* GitHub: <https://github.com/thomasp85/tidygraph>
* Email: <mailto:thomasp85@gmail.com>
* GitHub mirror: <https://github.com/cran/tidygraph>

Run `revdepcheck::cloud_details(, "tidygraph")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     Caused by error:
     ! The `father` argument of `bfs()` was deprecated in igraph 2.2.0 and is
       now defunct.
     ℹ Please use the `parent` argument instead.
     Backtrace:
          ▆
       1. ├─... %>% ...
       2. ├─dplyr::mutate(...)
       3. ├─tidygraph:::mutate.tbl_graph(...)
       4. │ └─tidygraph::mutate_as_tbl(.data, !!!dot)
       5. │   ├─dplyr::mutate(d_tmp, ...)
       6. │   └─dplyr:::mutate.data.frame(d_tmp, ...)
       7. │     └─dplyr:::mutate_cols(.data, dplyr_quosures(...), by)
       8. │       ├─base::withCallingHandlers(...)
       9. │       └─dplyr:::mutate_col(dots[[i]], data, mask, new_columns)
      10. │         └─mask$eval_all_mutate(quo)
      11. │           └─dplyr (local) eval()
      12. └─tidygraph::map_bfs_dbl(...)
      13.   └─tidygraph::map_bfs(...)
      14.     └─tidygraph:::bfs_df(graph, root, mode, unreachable)
      15.       └─igraph::bfs(...)
      16.         └─lifecycle::deprecate_stop("2.2.0", "bfs(father = )", "bfs(parent = )")
      17.           └─lifecycle:::deprecate_stop0(msg)
      18.             └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
        8.         └─lifecycle:::deprecate_stop0(msg)
        9.           └─rlang::cnd_signal(...)
       ── Error ('test-search.R:9:3'): search returns correct type ────────────────────
       <dplyr:::mutate_error/rlang_error/error/condition>
       Error in `mutate(d_tmp, ...)`: i In argument: `val = fn`.
       Caused by error:
       ! The `father` argument of `bfs()` was deprecated in igraph 2.2.0 and is now defunct.
       i Please use the `parent` argument instead.
       ── Error ('test-search.R:22:3'): search returns correct length ─────────────────
       <dplyr:::mutate_error/rlang_error/error/condition>
       Error in `mutate(d_tmp, ...)`: i In argument: `val = fn`.
       Caused by error:
       ! The `father` argument of `bfs()` was deprecated in igraph 2.2.0 and is now defunct.
       i Please use the `parent` argument instead.
       ── Error ('test-search.R:36:3'): search returns correct length ─────────────────
       <dplyr:::mutate_error/rlang_error/error/condition>
       Error in `mutate(d_tmp, ...)`: i In argument: `val = fn`.
       Caused by error:
       ! The `father` argument of `bfs()` was deprecated in igraph 2.2.0 and is now defunct.
       i Please use the `parent` argument instead.
       
       [ FAIL 6 | WARN 13 | SKIP 1 | PASS 423 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## In both

*   checking DESCRIPTION meta-information ... NOTE
     ```
       Missing dependency on R >= 4.1.0 because package code uses the pipe
       |> or function shorthand \(...) syntax added in R 4.1.0.
       File(s) using such syntax:
         ‘iterate.Rd’ ‘random_walk_rank.Rd’
     ```

# vkR (0.2)

* GitHub: <https://github.com/Dementiy/vkR>
* Email: <mailto:dementiy@yandex.ru>
* GitHub mirror: <https://github.com/cran/vkR>

Run `revdepcheck::cloud_details(, "vkR")` for more info

## Newly broken

*   checking dependencies in R code ... WARNING
     ```
     Missing or unexported object: ‘igraph::get.edge’
     ```

