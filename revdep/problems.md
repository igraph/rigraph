# bitriad (0.4)

* Email: <mailto:cornelioid@gmail.com>
* GitHub mirror: <https://github.com/cran/bitriad>

Run `revdepcheck::revdep_details(, "bitriad")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: triad
     > ### Title: Affiliation network triads
     > ### Aliases: triad make_triad is_triad triad_class layout_triad plot_triad
     > ###   an_triad is.triad triad.class an.triad layout.triad plotTriad
     > 
     > ### ** Examples
     > 
     > tr <- make_triad(lambda = c(3,1,1), w = 2)
     Error:
     ! The `edges` argument of `add_edges()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─bitriad::make_triad(lambda = c(3, 1, 1), w = 2)
      2.   └─igraph::add_edges(tr, t(el))
      3.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      4.       └─lifecycle::deprecate_stop(...)
      5.         └─lifecycle:::deprecate_stop0(msg)
      6.           └─rlang::cnd_signal(...)
     Execution halted
     ```

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

# bnmonitor (0.2.2)

* GitHub: <https://github.com/manueleleonelli/bnmonitor>
* Email: <mailto:manuele.leonelli@ie.edu>
* GitHub mirror: <https://github.com/cran/bnmonitor>

Run `revdepcheck::revdep_details(, "bnmonitor")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     ! The `edges` argument of `make_graph()` supplied as a matrix should be
       a n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
          ▆
       1. ├─bnmonitor::KL(synthetic_bn, "y2", "1", "2", "all", "all")
       2. └─bnmonitor:::KL.bn.fit(synthetic_bn, "y2", "1", "2", "all", "all")
       3.   ├─gRbase::compile(as.grain(bnfit))
       4.   ├─bnlearn::as.grain(bnfit)
       5.   └─bnlearn:::as.grain.bn.fit(bnfit)
       6.     └─bnlearn:::from.bn.fit.to.grain(x)
       7.       ├─base::suppressWarnings(gRain::compileCPT(cpt))
       8.       │ └─base::withCallingHandlers(...)
       9.       └─gRain::compileCPT(cpt)
      10.         └─gRain:::compile_cpt_worker(args, forceCheck = forceCheck)
      11.           └─gRbase::dagList(vp, forceCheck = forceCheck, result = "igraph")
      12.             └─gRbase::g_dagl2ig_(x, vn)
      13.               └─gRbase:::dag_list2igraph(zz)
      14.                 └─igraph::make_graph(em, isolates = iso, directed = TRUE)
      15.                   └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      16.                     └─lifecycle::deprecate_stop(...)
      17.                       └─lifecycle:::deprecate_stop0(msg)
      18.                         └─rlang::cnd_signal(...)
     Execution halted
     ```

# Boptbd (1.0.7)

* Email: <mailto:diboobayu@gmail.com>
* GitHub mirror: <https://github.com/cran/Boptbd>

Run `revdepcheck::revdep_details(, "Boptbd")` for more info

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

Run `revdepcheck::revdep_details(, "c3net")` for more info

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

Run `revdepcheck::revdep_details(, "cfid")` for more info

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

# cia (1.0.0)

* GitHub: <https://github.com/SpaceOdyssey/cia>
* Email: <mailto:mathew.varidel@sydney.edu.au>
* GitHub mirror: <https://github.com/cran/cia>

Run `revdepcheck::revdep_details(, "cia")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > ### ** Examples
     > 
     > data <- bnlearn::learning.test
     > 
     > dag <- UniformlySampleDAG(colnames(data))
     Loading required namespace: igraph
     Error:
     ! The `edges` argument of `add_edges()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
          ▆
       1. └─cia::UniformlySampleDAG(colnames(data))
       2.   ├─cia::toMatrix(bnlearn::random.graph(nodes, method = "melancon"))
       3.   └─cia:::toMatrix.bn(bnlearn::random.graph(nodes, method = "melancon"))
       4.     ├─cia::toMatrix(bnlearn::as.igraph(network))
       5.     ├─bnlearn::as.igraph(network)
       6.     └─bnlearn:::as.igraph.bn(network)
       7.       └─igraph::add_edges(res, t(arcs))
       8.         └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
       9.           └─lifecycle::deprecate_stop(...)
      10.             └─lifecycle:::deprecate_stop0(msg)
      11.               └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
         9.           └─lifecycle::deprecate_stop(...)
        10.             └─lifecycle:::deprecate_stop0(msg)
        11.               └─rlang::cnd_signal(...)
       ── Error ('test_swap_adjacent_proposal.R:2:1'): (code run outside of `test_that()`) ──
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: The `edges` argument of `add_edges()` supplied as a matrix should be a n times 2 matrix, not 2 times n as of igraph 2.1.5.
       i either transpose the matrix with t() or convert it to a data.frame with two columns.
       Backtrace:
            ▆
         1. └─cia::UniformlySampleDAG(c("A", "B", "C", "D", "E", "F")) at test_swap_adjacent_proposal.R:2:1
         2.   ├─cia::toMatrix(bnlearn::random.graph(nodes, method = "melancon"))
         3.   └─cia:::toMatrix.bn(bnlearn::random.graph(nodes, method = "melancon"))
         4.     ├─cia::toMatrix(bnlearn::as.igraph(network))
         5.     ├─bnlearn::as.igraph(network)
         6.     └─bnlearn:::as.igraph.bn(network)
         7.       └─igraph::add_edges(res, t(arcs))
         8.         └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
         9.           └─lifecycle::deprecate_stop(...)
        10.             └─lifecycle:::deprecate_stop0(msg)
        11.               └─rlang::cnd_signal(...)
       
       [ FAIL 10 | WARN 0 | SKIP 0 | PASS 17 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# comato (1.1)

* Email: <mailto:andreas.muehling@tum.de>
* GitHub mirror: <https://github.com/cran/comato>

Run `revdepcheck::revdep_details(, "comato")` for more info

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

## In both

*   checking S3 generic/method consistency ... NOTE
     ```
     Mismatches for apparent methods not registered:
     min:
       function(..., na.rm)
     min.distance:
       function(centers, com, layouts)
     See section ‘Registering S3 methods’ in the ‘Writing R Extensions’
     manual.
     ```

*   checking R code for possible problems ... NOTE
     ```
     Found if() conditions comparing class() to string:
     File ‘comato/R/concept_maps.r’: if (class(m) != "conceptmap") ...
     Use inherits() (or maybe is()) instead.
     ```

# cranly (0.6.0)

* GitHub: <https://github.com/ikosmidis/cranly>
* Email: <mailto:ioannis.kosmidis@warwick.ac.uk>
* GitHub mirror: <https://github.com/cran/cranly>

Run `revdepcheck::revdep_details(, "cranly")` for more info

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

Run `revdepcheck::revdep_details(, "dci")` for more info

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

Run `revdepcheck::revdep_details(, "degreenet")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘degreenet-Ex.R’ failed
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
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

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

# ecodist (2.1.3)

* GitHub: <https://github.com/phiala/ecodist>
* Email: <mailto:Sarah.Goslee@usda.gov>
* GitHub mirror: <https://github.com/cran/ecodist>

Run `revdepcheck::revdep_details(, "ecodist")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     + 			1, 1, 1, 0,
     + 			1, 0, 1, 1,
     + 			0, 0, 1, 1), ncol = 4, byrow = TRUE)
     > 
     > 	# the maximum Jaccard distance is 1
     > 	# regardless of how different the samples are
     > 	x.jd <- dist(x, "binary")
     > 
     > 	# estimate the true distance between those pairs
     > 	# by following the shorted path along connected sites
     > 	pathdist(x.jd)
     Error:
     ! The `edges` argument of `add_edges()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─ecodist::pathdist(x.jd)
      2.   └─igraph::add_edges(...)
      3.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      4.       └─lifecycle::deprecate_stop(...)
      5.         └─lifecycle:::deprecate_stop0(msg)
      6.           └─rlang::cnd_signal(...)
     Execution halted
     ```

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

# ECoL (0.4.4)

* GitHub: <https://github.com/lpfgarcia/ECoL>
* Email: <mailto:luis.garcia@unb.br>
* GitHub mirror: <https://github.com/cran/ECoL>

Run `revdepcheck::revdep_details(, "ECoL")` for more info

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

# FrF2 (2.3-5)

* Email: <mailto:ulrike.groemping@bht-berlin.de>
* GitHub mirror: <https://github.com/cran/FrF2>

Run `revdepcheck::revdep_details(, "FrF2")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > ### ** Examples
     > 
     > ## Not run: 
     > ##D ex.CIG <- CIG("9-4.2", vertex.color="white", vertex.label.color="darkred")
     > ##D ## play around with the dynamic graph until it looks right
     > ##D ## look up its id number in the title bar of the graph window and use it for id
     > ##D par(xpd=TRUE)
     > ##D CIGstatic(ex.CIG, id=1)
     > ## End(Not run)
     > 
     > graph1 <- CIG("9-4.2", plot=FALSE)   ### create graph object from design name
     Error:
     ! The `edges` argument of `add_edges()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─FrF2::CIG("9-4.2", plot = FALSE)
      2.   └─igraph::add_edges(go2, design$clear.2fis)
      3.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      4.       └─lifecycle::deprecate_stop(...)
      5.         └─lifecycle:::deprecate_stop0(msg)
      6.           └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
       [1,]    0    1    1    0    1    1
       [2,]    1    0    1    1    0    1
       
       $clear2fis
        [1] "AB" "AC" "AE" "AF" "BC" "BD" "BF" "CD" "CE" "DE" "DF" "EF"
       
       > ## character estimability requirement
       > colpick(6, 3, estimable=compromise(6, 4)$requirement)
       a clear design requires at least 16 runs
       checking up to 720 matrices
       Error:
       ! The `edges` argument of `add_edges()` supplied as a matrix should be a
         n times 2 matrix, not 2 times n as of igraph 2.1.5.
       ℹ either transpose the matrix with t() or convert it to a data.frame with two
         columns.
       Backtrace:
           ▆
        1. └─FrF2::colpick(6, 3, estimable = compromise(6, 4)$requirement)
        2.   └─FrF2:::mapcalc.block(...)
        3.     └─igraph::add_edges(go2, estimable)
        4.       └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
        5.         └─lifecycle::deprecate_stop(...)
        6.           └─lifecycle:::deprecate_stop0(msg)
        7.             └─rlang::cnd_signal(...)
       Execution halted
     ```

# gemtc (1.1-2)

* GitHub: <https://github.com/gertvv/gemtc>
* Email: <mailto:gert@gertvv.nl>
* GitHub mirror: <https://github.com/cran/gemtc>

Run `revdepcheck::revdep_details(, "gemtc")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-unit-nodesplit.R:196:3'): non-lexicographical treatment order works correctly ──
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: The `edges` argument of `add_edges()` supplied as a matrix should be a n
       times 2 matrix, not 2 times n as of igraph 2.1.5.
       ℹ either transpose the matrix with t() or convert it to a data.frame with two
         columns.
       Backtrace:
            ▆
         1. └─gemtc::mtc.model(network, type = "nodesplit", t1 = 10, t2 = 11) at test-unit-nodesplit.R:196:3
         2.   └─gemtc:::mtc.model.call("mtc.model", model, ...)
         3.     ├─base::do.call(fn, c(list(model), list(...)))
         4.     └─gemtc:::mtc.model.nodesplit(`<named list>`, t1 = 10, t2 = 11)
         5.       └─gemtc:::connect.mds.forest(mtc.network.graph(network.indirect))
         6.         └─igraph:::`+.igraph`(h, edges(t(tree$edges)))
         7.           └─igraph::add_edges(e1, unnamed[[1]], attr = attr)
         8.             └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
         9.               └─lifecycle::deprecate_stop(...)
        10.                 └─lifecycle:::deprecate_stop0(msg)
        11.                   └─rlang::cnd_signal(...)
       
       [ FAIL 1 | WARN 11 | SKIP 0 | PASS 377 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

# ggm (2.5.4)

* Email: <mailto:giovanni.marchetti@unifi.it>
* GitHub mirror: <https://github.com/cran/ggm>

Run `revdepcheck::revdep_details(, "ggm")` for more info

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

Run `revdepcheck::revdep_details(, "ggraph")` for more info

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
       9.           ├─... %gr_attr% .data
      10.           └─igraph::add_edges(.data, rbind(new_edges$from, new_edges$to))
      11.             └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      12.               └─lifecycle::deprecate_stop(...)
      13.                 └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'Layouts.Rmd' failed with diagnostics:
     The `edges` argument of `add_edges()` supplied as a matrix should be a n
     times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     --- failed re-building ‘Layouts.Rmd’
     
     --- re-building ‘Nodes.Rmd’ using rmarkdown
     --- finished re-building ‘Nodes.Rmd’
     
     --- re-building ‘tidygraph.Rmd’ using rmarkdown
     --- finished re-building ‘tidygraph.Rmd’
     
     SUMMARY: processing the following files failed:
       ‘Edges.Rmd’ ‘Layouts.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

# glyrepr (1.0.0)

* GitHub: <https://github.com/glycoverse/glyrepr>
* Email: <mailto:23110220018@m.fudan.edu.cn>
* GitHub mirror: <https://github.com/cran/glyrepr>

Run `revdepcheck::revdep_details(, "glyrepr")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
         'test-floating-parts.R:480:1', 'test-floating-substituents.R:94:1',
         'test-floating-substituents.R:133:1', 'test-floating-substituents.R:173:1',
         'test-floating-validation.R:37:1', 'test-floating-validation.R:51:1',
         'test-floating-validation.R:65:1', 'test-floating-validation.R:79:1',
         'test-floating-validation.R:109:1', 'test-floating-validation.R:139:1',
         'test-floating-validation.R:159:1', 'test-floating-validation.R:203:1',
         'test-low-level-structure.R:46:1', 'test-low-level-structure.R:82:1',
         'test-low-level-structure.R:159:1', 'test-low-level-structure.R:222:1',
         'test-low-level-structure.R:236:1', 'test-smap.R:1041:1',
         'test-structure-tables.R:497:1', 'test-structure.R:520:1',
         'test-structure.R:539:1', 'test-structure.R:588:1', 'test-structure.R:608:1',
         'test-structure.R:668:1', 'test-structure.R:675:1', 'test-structure.R:683:1',
         'test-structure.R:724:1', 'test-structure.R:779:1'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-structure-to-iupac.R:124:3'): structure_to_iupac handles complex branched structures ──
       <purrr_error_indexed/rlang_error/error/condition>
       Error in `purrr::map(valid_graphs, function(graph) {     checkmate::assert_class(graph, "igraph")     graph %>% validate_glycan_graph() %>% canonicalize_glycan_graph() })`: i In index: 1.
       Caused by error in `validate_glycan_graph()`:
       ! Duplicated linkage positions.
       
       [ FAIL 1 | WARN 0 | SKIP 46 | PASS 1885 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# GoodFitSBM (0.0.1)

* GitHub: <https://github.com/Roy-SR-007/GoodFitSBM>
* Email: <mailto:sohamghosh@tamu.edu>
* GitHub mirror: <https://github.com/cran/GoodFitSBM>

Run `revdepcheck::revdep_details(, "GoodFitSBM")` for more info

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

# gor (2.0)

* Email: <mailto:casencha@unizar.es>
* GitHub mirror: <https://github.com/cran/gor>

Run `revdepcheck::revdep_details(, "gor")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     The following object is masked from ‘package:base’:
     
         union
     
     > g <- make_graph("Dodecahedron")
     > eG <- as_edgelist(g)
     > set.seed(1)
     > v <- sample(0:1, gsize(g), replace = TRUE) # Random edge vector
     > apply_incidence_map(eG, v) # 1 1 0 1 2 0 1 1 3 2 0 1 1 1 1 1 0 0 1 2
      [1] 1 1 0 1 2 0 1 1 3 2 0 1 1 1 1 1 0 0 1 2
     > ## Plotting the associated subgraph
     > h <- make_graph(t(eG[v==1,]))
     Error:
     ! The `edges` argument of `make_graph()` supplied as a matrix should be
       a n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─igraph::make_graph(t(eG[v == 1, ]))
      2.   └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      3.     └─lifecycle::deprecate_stop(...)
      4.       └─lifecycle:::deprecate_stop0(msg)
      5.         └─rlang::cnd_signal(...)
     Execution halted
     ```

# GRAB (0.2.5)

* Email: <mailto:miaolin@pku.edu.cn>
* GitHub mirror: <https://github.com/cran/GRAB>

Run `revdepcheck::revdep_details(, "GRAB")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
      1 f2_2     -28.8 TRUE   
      2 Subj-212 -28.5 TRUE   
      3 f49_7    -28.0 TRUE   
      4 Subj-312 -26.5 TRUE   
      5 f39_5    -26.3 TRUE   
      6 f34_2    -21.9 TRUE   
      7 Subj-131 -21.3 TRUE   
      8 f5_3     -20.1 TRUE   
      9 f25_1    -19.5 TRUE   
     10 f12_10   -18.8 TRUE   
     # ℹ 40 more rows
     Error:
     ! The `edges` argument of `make_graph()` supplied as a matrix should be
       a n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─GRAB::SAGELD.NullModel(...)
      2.   └─igraph::make_graph(edges, directed = FALSE)
      3.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      4.       └─lifecycle::deprecate_stop(...)
      5.         └─lifecycle:::deprecate_stop0(msg)
      6.           └─rlang::cnd_signal(...)
     Execution halted
     ```

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

# gRain (1.4.6)

* Email: <mailto:sorenh@math.aau.dk>
* GitHub mirror: <https://github.com/cran/gRain>

Run `revdepcheck::revdep_details(, "gRain")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > ### ** Examples
     > 
     > 
     > ## Extract cpts / clique potentials from data and graph
     > # specification and create network. There are different ways:
     > 
     > data(lizard, package="gRbase")
     > 
     > # DAG: height <- species -> diam
     > daG <- dag(~species + height:species + diam:species, result="igraph")
     Error:
     ! The `edges` argument of `make_graph()` is not allowed to be a 2 times
       2 matrix as of igraph 2.1.5.
     Backtrace:
         ▆
      1. └─gRbase::dag(~species + height:species + diam:species, result = "igraph")
      2.   └─gRbase::dagList(list(...), result = result, forceCheck = forceCheck)
      3.     └─gRbase::g_dagl2ig_(x, vn)
      4.       └─gRbase:::dag_list2igraph(zz)
      5.         └─igraph::make_graph(em, isolates = iso, directed = TRUE)
      6.           └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      7.             └─lifecycle::deprecate_stop("2.1.5", paste0(fn, "(", arg, " = 'is not allowed to be a 2 times 2 matrix')"))
      8.               └─lifecycle:::deprecate_stop0(msg)
      9.                 └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-misc.R:14:1'): (code run outside of `test_that()`) ─────────────
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: The `edges` argument of `make_graph()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
       ℹ either transpose the matrix with t() or convert it to a data.frame with two
         columns.
       Backtrace:
            ▆
         1. └─gRain::compile_cpt(cpt_list) at test-misc.R:14:1
         2.   └─gRain:::compile_cpt_worker(args, forceCheck = forceCheck)
         3.     └─gRbase::dagList(vp, forceCheck = forceCheck, result = "igraph")
         4.       └─gRbase::g_dagl2ig_(x, vn)
         5.         └─gRbase:::dag_list2igraph(zz)
         6.           └─igraph::make_graph(em, isolates = iso, directed = TRUE)
         7.             └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
         8.               └─lifecycle::deprecate_stop(...)
         9.                 └─lifecycle:::deprecate_stop0(msg)
        10.                   └─rlang::cnd_signal(...)
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 0 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     Backtrace:
         ▆
      1. └─gRain::compile_cpt(cpt_list)
      2.   └─gRain:::compile_cpt_worker(args, forceCheck = forceCheck)
      3.     └─gRbase::dagList(vp, forceCheck = forceCheck, result = "igraph")
      4.       └─gRbase::g_dagl2ig_(x, vn)
      5.         └─gRbase:::dag_list2igraph(zz)
      6.           └─igraph::make_graph(em, isolates = iso, directed = TRUE)
      7.             └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      8.               └─lifecycle::deprecate_stop(...)
      9.                 └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'grain.rmd' failed with diagnostics:
     The `edges` argument of `make_graph()` supplied as a matrix should be a n
     times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     --- failed re-building ‘grain.rmd’
     
     SUMMARY: processing the following file failed:
       ‘grain.rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

# gRbase (2.0.3)

* Email: <mailto:sorenh@math.aau.dk>
* GitHub mirror: <https://github.com/cran/gRbase>

Run `revdepcheck::revdep_details(, "gRbase")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: edge_matrix
     > ### Title: Coerce dag to edge matrix
     > ### Aliases: edge_matrix dag2edge_matrix edge_matrix2dag
     > 
     > ### ** Examples
     > 
     > g <- dag(~x2|x1 + x3|x1:x2 + x4|x3)
     Error:
     ! The `edges` argument of `make_graph()` supplied as a matrix should be
       a n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─gRbase::dag(~x2 | x1 + x3 | x1:x2 + x4 | x3)
      2.   └─gRbase::dagList(list(...), result = result, forceCheck = forceCheck)
      3.     └─gRbase::g_dagl2ig_(x, vn)
      4.       └─gRbase:::dag_list2igraph(zz)
      5.         └─igraph::make_graph(em, isolates = iso, directed = TRUE)
      6.           └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      7.             └─lifecycle::deprecate_stop(...)
      8.               └─lifecycle:::deprecate_stop0(msg)
      9.                 └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     ---
     Backtrace:
         ▆
      1. └─gRbase::ug(~a:b, ~b:c:d, ~e)
      2.   └─gRbase::ugList(list(...), result = result)
      3.     └─gRbase::g_ugl2ig_(x, vn)
      4.       └─gRbase:::ug_list2igraph(zz)
      5.         └─igraph::make_graph(em, isolates = iso, directed = FALSE)
      6.           └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      7.             └─lifecycle::deprecate_stop(...)
      8.               └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'graphs.rmd' failed with diagnostics:
     The `edges` argument of `make_graph()` supplied as a matrix should be a
     n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     --- failed re-building ‘graphs.rmd’
     
     SUMMARY: processing the following file failed:
       ‘graphs.rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

## In both

*   checking whether package ‘gRbase’ can be installed ... WARNING
     ```
     Found the following significant warnings:
       'Rcpp:::LdFlags' has not been needed since 2013 (!!) and may get removed in 2027. Please update your 'Makevars'.
       'RcppLdFlags' has not been needed since 2013 (!!) and may get removed in 2027. Please update your 'Makevars'.
     See ‘<lib>/gRbase.Rcheck/00install.out’ for details.
     ```

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

# gRc (0.5.1)

* Email: <mailto:sorenh@math.aau.dk>
* GitHub mirror: <https://github.com/cran/gRc>

Run `revdepcheck::revdep_details(, "gRc")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > gm  = ~al:an:st
     > vcc = list(~me+st, ~ve+an, ~al)
     > ecc = list(~me:ve+me:al, ~ve:al+al:st)
     > m1 <- rcox(gm=gm, vcc=vcc, ecc=ecc, data=math, method='matching')
     > plot(m1)
     Error:
     ! The `edges` argument of `make_graph()` supplied as a matrix should be
       a n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
          ▆
       1. ├─base::plot(m1)
       2. ├─base::plot(m1)
       3. └─gRc:::plot.rcox(m1)
       4.   └─gRbase::ug(gen)
       5.     └─gRbase::ugList(list(...), result = result)
       6.       └─gRbase::g_ugl2ig_(x, vn)
       7.         └─gRbase:::ug_list2igraph(zz)
       8.           └─igraph::make_graph(em, isolates = iso, directed = FALSE)
       9.             └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      10.               └─lifecycle::deprecate_stop(...)
      11.                 └─lifecycle:::deprecate_stop0(msg)
      12.                   └─rlang::cnd_signal(...)
     Execution halted
     ```

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

# gRim (0.3.4)

* Email: <mailto:sorenh@math.aau.dk>
* GitHub mirror: <https://github.com/cran/gRim>

Run `revdepcheck::revdep_details(, "gRim")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > data(milkcomp1)
     > ciTest(milkcomp1, set=~tre + fat + pro)
     Error:
     ! The `edges` argument of `make_graph()` supplied as a matrix should be
       a n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
          ▆
       1. ├─gRim::ciTest(milkcomp1, set = ~tre + fat + pro)
       2. └─gRim:::ciTest.data.frame(milkcomp1, set = ~tre + fat + pro)
       3.   └─gRim::ciTest_df(x, set, ...)
       4.     └─gRim:::.ciTest_df_internal(wdata, set, ...)
       5.       └─gRim::mmod(list(set), data = x)
       6.         └─gRim:::.mModel_finalize(flist$glist, varNames, datainfo)
       7.           └─gRbase::ug(glist)
       8.             └─gRbase::ugList(list(...), result = result)
       9.               └─gRbase::g_ugl2ig_(x, vn)
      10.                 └─gRbase:::ug_list2igraph(zz)
      11.                   └─igraph::make_graph(em, isolates = iso, directed = FALSE)
      12.                     └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      13.                       └─lifecycle::deprecate_stop(...)
      14.                         └─lifecycle:::deprecate_stop0(msg)
      15.                           └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-misc.R:21:5'): dmod() ──────────────────────────────────────────
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: The `edges` argument of `make_graph()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
       ℹ either transpose the matrix with t() or convert it to a data.frame with two
         columns.
       Backtrace:
            ▆
         1. └─gRim::dmod(~.^., data = df) at test-misc.R:21:5
         2.   └─gRim:::.dModel_finalize(mod_form$glist, varNames)
         3.     └─gRbase::ug(glist)
         4.       └─gRbase::ugList(list(...), result = result)
         5.         └─gRbase::g_ugl2ig_(x, vn)
         6.           └─gRbase:::ug_list2igraph(zz)
         7.             └─igraph::make_graph(em, isolates = iso, directed = FALSE)
         8.               └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
         9.                 └─lifecycle::deprecate_stop(...)
        10.                   └─lifecycle:::deprecate_stop0(msg)
        11.                     └─rlang::cnd_signal(...)
       
       [ FAIL 1 | WARN 1 | SKIP 0 | PASS 0 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
          ▆
       1. └─gRim::dmod(...)
       2.   └─gRim:::.dModel_finalize(mod_form$glist, varNames)
       3.     └─gRbase::ug(glist)
       4.       └─gRbase::ugList(list(...), result = result)
       5.         └─gRbase::g_ugl2ig_(x, vn)
       6.           └─gRbase:::ug_list2igraph(zz)
       7.             └─igraph::make_graph(em, isolates = iso, directed = FALSE)
       8.               └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
       9.                 └─lifecycle::deprecate_stop(...)
      10.                   └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'grim.rmd' failed with diagnostics:
     The `edges` argument of `make_graph()` supplied as a matrix should be a n
     times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     --- failed re-building ‘grim.rmd’
     
     SUMMARY: processing the following file failed:
       ‘grim.rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

## In both

*   checking whether package ‘gRim’ can be installed ... WARNING
     ```
     Found the following significant warnings:
       'Rcpp:::LdFlags' has not been needed since 2013 (!!) and may get removed in 2027. Please update your 'Makevars'.
       'RcppLdFlags' has not been needed since 2013 (!!) and may get removed in 2027. Please update your 'Makevars'.
     See ‘<lib>/gRim.Rcheck/00install.out’ for details.
     ```

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

# joinery (1.0.1)

* GitHub: <https://github.com/edubruell/joinery>
* Email: <mailto:eduard.bruell@zew.de>
* GitHub mirror: <https://github.com/cran/joinery>

Run `revdepcheck::revdep_details(, "joinery")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘joinery-Ex.R’ failed
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: fuzzy_tokens
     > ### Title: Collapse near-duplicate tokens to a canonical form
     > ### Aliases: fuzzy_tokens
     > 
     > ### ** Examples
     > 
     > fuzzy_tokens(c("Neumann", "Neumaxn", "Neuman"), max_dist = 2)
     Error:
     ! The `edges` argument of `add_edges()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─joinery::fuzzy_tokens(c("Neumann", "Neumaxn", "Neuman"), max_dist = 2)
      2.   └─igraph::add_edges(g, t(edges))
      3.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      4.       └─lifecycle::deprecate_stop(...)
      5.         └─lifecycle:::deprecate_stop0(msg)
      6.           └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
       ══ Skipped tests (5) ═══════════════════════════════════════════════════════════
       • On CRAN (4): 'test_audit_strategy.R:391:1', 'test_sample_matches.R:353:1',
         'test_summarise_matches.R:290:1', 'test_summarise_matches.R:296:1'
       • recipes installed (1): 'test_tidymodels_shim.R:51:3'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test_preparers_datatable.R:1364:3'): fuzzy_tokens() performs fuzzy clustering correctly ──
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: The `edges` argument of `add_edges()` supplied as a matrix should be a n
       times 2 matrix, not 2 times n as of igraph 2.1.5.
       ℹ either transpose the matrix with t() or convert it to a data.frame with two
         columns.
       Backtrace:
           ▆
        1. └─joinery::fuzzy_tokens(x, max_dist = 2, method = "osa") at test_preparers_datatable.R:1364:3
        2.   └─igraph::add_edges(g, t(edges))
        3.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
        4.       └─lifecycle::deprecate_stop(...)
        5.         └─lifecycle:::deprecate_stop0(msg)
        6.           └─rlang::cnd_signal(...)
       
       [ FAIL 1 | WARN 0 | SKIP 5 | PASS 2252 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# lpanda (0.2.1)

* GitHub: <https://github.com/localpolitics/lpanda>
* Email: <mailto:bubenicek@pef.czu.cz>
* GitHub mirror: <https://github.com/cran/lpanda>

Run `revdepcheck::revdep_details(, "lpanda")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     +   show_legend = FALSE,
     +   do_not_print_to_console = TRUE
     + )
     > 
     > # candidate network snapshots coloured by groups and bordered by lists
     > plot_continuity(
     +   netdata,
     +   mark = "parties",
     +   show_candidate_networks = TRUE,
     +   do_not_print_to_console = TRUE
     + )
     Error:
     ! The `edges` argument of `add_edges()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─lpanda::plot_continuity(...)
      2.   └─igraph::add_edges(sub.sit.roku, t(edgelist.roku))
      3.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      4.       └─lifecycle::deprecate_stop(...)
      5.         └─lifecycle:::deprecate_stop0(msg)
      6.           └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
       ── Failure ('test-plot_continuity.R:160:3'): show_candidate_networks works also with only single election ──
       Expected `quiet_plot(...)` not to throw any errors.
       Actually got a <lifecycle_error_deprecated> with message:
         The `edges` argument of `add_edges()` supplied as a matrix should be a n times 2 matrix, not 2 times n as of igraph 2.1.5.
         i either transpose the matrix with t() or convert it to a data.frame with two columns.
       ── Failure ('test-plot_continuity.R:169:3'): show_candidate_networks works also with only single election ──
       Expected `quiet_plot(...)` not to throw any errors.
       Actually got a <lifecycle_error_deprecated> with message:
         The `edges` argument of `add_edges()` supplied as a matrix should be a n times 2 matrix, not 2 times n as of igraph 2.1.5.
         i either transpose the matrix with t() or convert it to a data.frame with two columns.
       ── Failure ('test-plot_continuity.R:176:3'): show_candidate_networks works with party and candidate highlighting ──
       Expected `quiet_plot(...)` not to throw any errors.
       Actually got a <lifecycle_error_deprecated> with message:
         The `edges` argument of `add_edges()` supplied as a matrix should be a n times 2 matrix, not 2 times n as of igraph 2.1.5.
         i either transpose the matrix with t() or convert it to a data.frame with two columns.
       ── Failure ('test-plot_continuity.R:181:3'): show_candidate_networks works with party and candidate highlighting ──
       Expected `quiet_plot(...)` not to throw any errors.
       Actually got a <lifecycle_error_deprecated> with message:
         The `edges` argument of `add_edges()` supplied as a matrix should be a n times 2 matrix, not 2 times n as of igraph 2.1.5.
         i either transpose the matrix with t() or convert it to a data.frame with two columns.
       
       [ FAIL 9 | WARN 0 | SKIP 0 | PASS 409 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# manynet (2.3.1)

* GitHub: <https://github.com/stocnet/manynet>
* Email: <mailto:james.hollway@graduateinstitute.ch>
* GitHub mirror: <https://github.com/cran/manynet>

Run `revdepcheck::revdep_details(, "manynet")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
           ▆
        1. ├─testthat::expect_null(...) at test-tutorials_manynet.R:4:5
        2. │ └─testthat::quasi_label(enquo(object), label)
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─manynet:::check_tute_functions(tute)
        5.   └─testthat::expect_null(...) at ./helper-manynet.R:225:5
       ── Failure ('test-tutorials_manynet.R:4:5'): manynet tutorial code runs without warnings or errors ──
       Expected `w` to be NULL.
       Differences:
       `actual` is an S3 object of class <lifecycle_warning_deprecated/rlang_warning/warning/condition>, a list
       `expected` is NULL
       
       Warning in expression 54 : mean(as_matrix(s_women))
       Backtrace:
           ▆
        1. ├─testthat::expect_null(...) at test-tutorials_manynet.R:4:5
        2. │ └─testthat::quasi_label(enquo(object), label)
        3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
        4. └─manynet:::check_tute_functions(tute)
        5.   └─testthat::expect_null(...) at ./helper-manynet.R:225:5
       
       [ FAIL 6 | WARN 1317 | SKIP 96 | PASS 4747 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# metainsight (7.1.0)

* Email: <mailto:ajs22@leicester.ac.uk>
* GitHub mirror: <https://github.com/cran/metainsight>

Run `revdepcheck::revdep_details(, "metainsight")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       [ FAIL 1 | WARN 3 | SKIP 61 | PASS 1137 ]
       Error:
       ! Test failures.
       Warning messages:
       1: `graph.empty()` was deprecated in igraph 2.1.0.
       ℹ Please use `make_empty_graph()` instead.
       ℹ The deprecated feature was likely used in the gemtc package.
         Please report the issue to the authors. 
       2: `set.edge.attribute()` was deprecated in igraph 2.0.0.
       ℹ Please use `set_edge_attr()` instead.
       ℹ The deprecated feature was likely used in the gemtc package.
         Please report the issue to the authors. 
       3: `shortest.paths()` was deprecated in igraph 2.0.0.
       ℹ Please use `distances()` instead.
       ℹ The deprecated feature was likely used in the gemtc package.
         Please report the issue to the authors. 
       4: `get.edge.attribute()` was deprecated in igraph 2.0.0.
       ℹ Please use `edge_attr()` instead.
       ℹ The deprecated feature was likely used in the gemtc package.
         Please report the issue to the authors. 
       5: `get.shortest.paths()` was deprecated in igraph 2.0.0.
       ℹ Please use `shortest_paths()` instead.
       ℹ The deprecated feature was likely used in the gemtc package.
         Please report the issue to the authors. 
       Execution halted
     ```

# MetaNet (0.3.2)

* GitHub: <https://github.com/Asa12138/MetaNet>
* Email: <mailto:bfzede@gmail.com>
* GitHub mirror: <https://github.com/cran/MetaNet>

Run `revdepcheck::revdep_details(, "MetaNet")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘MetaNet-Ex.R’ failed
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: zp_analyse
     > ### Title: Zi-Pi calculate
     > ### Aliases: zp_analyse zp_plot
     > 
     > ### ** Examples
     > 
     > data("c_net")
     > module_detect(co_net) -> co_net_modu
     > zp_analyse(co_net_modu) -> co_net_modu
     Error in deter_role(x["Pi"], x["Zi"], backs) : object 'role' not found
     Calls: zp_analyse -> apply -> FUN -> deter_role
     Execution halted
     ```

# migraph (1.6.8)

* GitHub: <https://github.com/stocnet/migraph>
* Email: <mailto:james.hollway@graduateinstitute.ch>
* GitHub mirror: <https://github.com/cran/migraph>

Run `revdepcheck::revdep_details(, "migraph")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       ══ Skipped tests (3) ═══════════════════════════════════════════════════════════
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
       
       [ FAIL 1 | WARN 0 | SKIP 3 | PASS 260 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# movecost (3.0.0)

* Email: <mailto:gianmarcoalberti@gmail.com>
* GitHub mirror: <https://github.com/cran/movecost>

Run `revdepcheck::revdep_details(, "movecost")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: mc_accum
     > ### Title: Accumulated cost surface and isolines around one or more origins
     > ### Aliases: mc_accum
     > 
     > ### ** Examples
     > 
     > dtm <- mc_volc()
     > start <- mc_volc_loc()
     > 
     > surf <- mc_surface(dtm, funct = "t", move = 8)
     Error:
     ! The `edges` argument of `add_edges()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─movecost::mc_surface(dtm, funct = "t", move = 8)
      2.   └─igraph::add_edges(g, rbind(from[pos], to[pos]), weight = w)
      3.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      4.       └─lifecycle::deprecate_stop(...)
      5.         └─lifecycle:::deprecate_stop0(msg)
      6.           └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
       Backtrace:
           ▆
        1. └─movecost::mc_surface(dtm, funct = "t", move = 8) at test-interface.R:117:3
        2.   └─igraph::add_edges(g, rbind(from[pos], to[pos]), weight = w)
        3.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
        4.       └─lifecycle::deprecate_stop(...)
        5.         └─lifecycle:::deprecate_stop0(msg)
        6.           └─rlang::cnd_signal(...)
       ── Error ('test-interface.R:125:3'): boundary polygons carry exact area and perimeter ──
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: The `edges` argument of `add_edges()` supplied as a matrix should be a n times 2 matrix, not 2 times n as of igraph 2.1.5.
       i either transpose the matrix with t() or convert it to a data.frame with two columns.
       Backtrace:
           ▆
        1. └─movecost::mc_surface(dtm, funct = "t", move = 8) at test-interface.R:125:3
        2.   └─igraph::add_edges(g, rbind(from[pos], to[pos]), weight = w)
        3.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
        4.       └─lifecycle::deprecate_stop(...)
        5.         └─lifecycle:::deprecate_stop0(msg)
        6.           └─rlang::cnd_signal(...)
       
       [ FAIL 24 | WARN 0 | SKIP 0 | PASS 80 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     ---
     Backtrace:
         ▆
      1. └─movecost::mc_surface(dtm, funct = "t", move = 16)
      2.   └─igraph::add_edges(g, rbind(from[pos], to[pos]), weight = w)
      3.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      4.       └─lifecycle::deprecate_stop(...)
      5.         └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'movecost.Rmd' failed with diagnostics:
     The `edges` argument of `add_edges()` supplied as a matrix should be a n
     times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     --- failed re-building ‘movecost.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘movecost.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# MSCquartets (3.3)

* Email: <mailto:j.rhodes@alaska.edu>
* GitHub mirror: <https://github.com/cran/MSCquartets>

Run `revdepcheck::revdep_details(, "MSCquartets")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > ### ** Examples
     > 
     > data(pTableYeastRokas)
     > out=NANUQ(pTableYeastRokas, alpha=.05, beta=.80, outfile = NULL)
     > # Specifying an outfile would write the distance table to it for opening in SplitsTree.
     > # Alternately, to use the phangorn implementation of NeighborNet
     > # within R, enter the following additional lines:
     > nn=neighborNet(out$dist)
     Error:
     ! The `edges` argument of `make_graph()` supplied as a matrix should be
       a n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─phangorn::neighborNet(out$dist)
      2.   ├─phangorn::as.networx(spl)
      3.   └─phangorn:::as.networx.splits(spl)
      4.     └─phangorn:::circNetwork(x, c.ord)
      5.       └─igraph::make_graph(t(res$edge), directed = FALSE)
      6.         └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      7.           └─lifecycle::deprecate_stop(...)
      8.             └─lifecycle:::deprecate_stop0(msg)
      9.               └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
      1. └─phangorn::neighborNet(D$dist)
      2.   ├─phangorn::as.networx(spl)
      3.   └─phangorn:::as.networx.splits(spl)
      4.     └─phangorn:::circNetwork(x, c.ord)
      5.       └─igraph::make_graph(t(res$edge), directed = FALSE)
      6.         └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      7.           └─lifecycle::deprecate_stop(...)
      8.             └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'NANUQplus.Rmd' failed with diagnostics:
     The `edges` argument of `make_graph()` supplied as a matrix should be a
     n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     --- failed re-building ‘NANUQplus.Rmd’
     
     --- re-building ‘TINNIK.Rmd’ using rmarkdown
     --- finished re-building ‘TINNIK.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘NANUQplus.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

# nat (1.8.26)

* GitHub: <https://github.com/natverse/nat>
* Email: <mailto:jefferis@gmail.com>
* GitHub mirror: <https://github.com/cran/nat>

Run `revdepcheck::revdep_details(, "nat")` for more info

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
       
       [ FAIL 39 | WARN 2 | SKIP 6 | PASS 583 ]
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

## Newly fixed

*   checking for detritus in the temp directory ... NOTE
     ```
     Found the following files/directories:
       ‘org.chromium.Chromium.rsKzLt’
     ```

# nethist (1.0.0)

* GitHub: <https://github.com/EnigmaSong/nethist>
* Email: <mailto:youngseok.song@mail.wvu.edu>
* GitHub mirror: <https://github.com/cran/nethist>

Run `revdepcheck::revdep_details(, "nethist")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
           ▆
        1. ├─base::suppressMessages(...) at test_netsummary_plot.R:18:12
        2. │ └─base::withCallingHandlers(...)
        3. └─testthat::expect_no_error(...)
       ── Failure ('test_netsummary_plot.R:23:12'): netsummary_plot with sparse matrix object ──
       Expected `{ ... }` not to throw any errors.
       Actually got a <simpleError> with message:
         A is not a simple graph. All non-zero entries must be 1 (binary adjacency matrix).
       Backtrace:
           ▆
        1. ├─base::suppressMessages(...) at test_netsummary_plot.R:23:12
        2. │ └─base::withCallingHandlers(...)
        3. └─testthat::expect_no_error(...)
       ── Error ('test_summary.R:3:1'): (code run outside of `test_that()`) ───────────
       Error in `multinethist.array(array(A, dim = c(nrow(A), ncol(A), 1)), h, common_f, method, control, ...)`: Layer 1: A is not a simple graph. All non-zero entries must be 1 (binary adjacency matrix).
       Backtrace:
           ▆
        1. ├─nethist::multinethist(...) at test_summary.R:3:1
        2. └─nethist:::multinethist.matrix(...)
        3.   └─nethist:::multinethist.array(...)
       
       [ FAIL 5 | WARN 5 | SKIP 1 | PASS 210 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

# netseer (0.1.3)

* Email: <mailto:sevvandik@gmail.com>
* GitHub mirror: <https://github.com/cran/netseer>

Run `revdepcheck::revdep_details(, "netseer")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: generate_graph_linear
     > ### Title: Generates a bigger graph by linear growth.
     > ### Aliases: generate_graph_linear
     > 
     > ### ** Examples
     > 
     > set.seed(1)
     > gr <- generate_graph_linear()
     Error:
     ! The `edges` argument of `add_edges()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─netseer::generate_graph_linear()
      2.   └─igraph:::`+.igraph`(gr3, igraph::edge(rbind(e1, e2)))
      3.     └─igraph::add_edges(e1, unnamed[[1]], attr = attr)
      4.       └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      5.         └─lifecycle::deprecate_stop(...)
      6.           └─lifecycle:::deprecate_stop0(msg)
      7.             └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
       columns.
     ---
     Backtrace:
         ▆
      1. └─netseer::predict_graph(graphlist[1:15], h = 1)
      2.   └─netseer:::predict_graph_internal(...)
      3.     └─netseer:::construct_union_graph(...)
      4.       └─igraph::add_edges(biggr, non_edges, weight = new_weights)
      5.         └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      6.           └─lifecycle::deprecate_stop(...)
      7.             └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'netseer.Rmd' failed with diagnostics:
     The `edges` argument of `add_edges()` supplied as a matrix should be a n
     times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     --- failed re-building ‘netseer.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘netseer.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# optbdmaeAT (1.0.2)

* Email: <mailto:diboobayu@gmail.com>
* GitHub mirror: <https://github.com/cran/optbdmaeAT>

Run `revdepcheck::revdep_details(, "optbdmaeAT")` for more info

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

Run `revdepcheck::revdep_details(, "optrcdmaeAT")` for more info

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

# PCBN (0.1.1)

* GitHub: <https://github.com/AlexisDerumigny/PCBN>
* Email: <mailto:a.f.f.derumigny@tudelft.nl>
* GitHub mirror: <https://github.com/cran/PCBN>

Run `revdepcheck::revdep_details(, "PCBN")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > 
     > my_PCBN = new_PCBN(
     +   DAG, order_hash,
     +   copula_mat = list(tau = tau, fam = fam))
     > 
     > mydata = PCBN_sim(my_PCBN, N = 5)
     Error:
     ! The `edges` argument of `add_edges()` is not allowed to be a 2 times 2
       matrix as of igraph 2.1.5.
     Backtrace:
          ▆
       1. └─PCBN::PCBN_sim(my_PCBN, N = 5)
       2.   └─PCBN:::.checkPCBNobject_for_simulation(object, verbose = verbose)
       3.     └─PCBN::is_restrictedDAG(PCBN$DAG, verbose = verbose, check_both = FALSE)
       4.       └─PCBN::active_cycles(DAG = DAG, early.stopping = TRUE)
       5.         ├─igraph::as_undirected(bnlearn::as.igraph(DAG))
       6.         │ └─igraph:::ensure_igraph(graph)
       7.         ├─bnlearn::as.igraph(DAG)
       8.         └─bnlearn:::as.igraph.bn(DAG)
       9.           └─igraph::add_edges(res, t(arcs))
      10.             └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      11.               └─lifecycle::deprecate_stop("2.1.5", paste0(fn, "(", arg, " = 'is not allowed to be a 2 times 2 matrix')"))
      12.                 └─lifecycle:::deprecate_stop0(msg)
      13.                   └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
        13.                   └─rlang::cnd_signal(...)
       ── Error ('test-PCBN-simulation.R:184:3'): PCBN_sim applies proper recursion of h-functions on an example with 5 nodes ──
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: The `edges` argument of `add_edges()` supplied as a matrix should be a n times 2 matrix, not 2 times n as of igraph 2.1.5.
       i either transpose the matrix with t() or convert it to a data.frame with two columns.
       Backtrace:
            ▆
         1. └─PCBN::PCBN_sim(object = my_PCBN, N = N, verbose = 0) at test-PCBN-simulation.R:184:3
         2.   └─PCBN:::.checkPCBNobject_for_simulation(object, verbose = verbose)
         3.     └─PCBN::is_restrictedDAG(PCBN$DAG, verbose = verbose, check_both = FALSE)
         4.       └─PCBN::active_cycles(DAG = DAG, early.stopping = TRUE)
         5.         ├─igraph::as_undirected(bnlearn::as.igraph(DAG))
         6.         │ └─igraph:::ensure_igraph(graph)
         7.         ├─bnlearn::as.igraph(DAG)
         8.         └─bnlearn:::as.igraph.bn(DAG)
         9.           └─igraph::add_edges(res, t(arcs))
        10.             └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
        11.               └─lifecycle::deprecate_stop(...)
        12.                 └─lifecycle:::deprecate_stop0(msg)
        13.                   └─rlang::cnd_signal(...)
       
       [ FAIL 10 | WARN 1 | SKIP 0 | PASS 98 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
       columns.
     ---
     Backtrace:
         ▆
      1. ├─igraph::plot.igraph(bnlearn::as.igraph(DAG), size = 20, label.cex = 2)
      2. ├─bnlearn::as.igraph(DAG)
      3. └─bnlearn:::as.igraph.bn(DAG)
      4.   └─igraph::add_edges(res, t(arcs))
      5.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      6.       └─lifecycle::deprecate_stop(...)
      7.         └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'internals-estimation.Rmd' failed with diagnostics:
     The `edges` argument of `add_edges()` supplied as a matrix should be a n
     times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     --- failed re-building ‘internals-estimation.Rmd’
     
     SUMMARY: processing the following files failed:
       ‘Bsets-v-structs.Rmd’ ‘internals-estimation.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# phangorn (2.12.1)

* GitHub: <https://github.com/KlausVigo/phangorn>
* Email: <mailto:klaus.schliep@gmail.com>
* GitHub mirror: <https://github.com/cran/phangorn>

Run `revdepcheck::revdep_details(, "phangorn")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > woodmouse <- phyDat(woodmouse)
     > tmpfile <- normalizePath(system.file(
     +              "extdata/trees/RAxML_bootstrap.woodmouse", package="phangorn"))
     > boot_trees <- read.tree(tmpfile)
     > 
     > dm <- dist.ml(woodmouse)
     > tree <- upgma(dm)
     > nnet <- neighborNet(dm)
     Error:
     ! The `edges` argument of `make_graph()` supplied as a matrix should be
       a n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─phangorn::neighborNet(dm)
      2.   ├─phangorn::as.networx(spl)
      3.   └─phangorn:::as.networx.splits(spl)
      4.     └─phangorn:::circNetwork(x, c.ord)
      5.       └─igraph::make_graph(t(res$edge), directed = FALSE)
      6.         └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      7.           └─lifecycle::deprecate_stop(...)
      8.             └─lifecycle:::deprecate_stop0(msg)
      9.               └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
       ══ Skipped tests (4) ═══════════════════════════════════════════════════════════
       • On CRAN (4): 'test_plot_ancestral.R:13:1', 'test_plot_ancestral.R:19:1',
         'test_plot_pml.R:11:1', 'test_plot_pml.R:19:1'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test_plot_networx.R:1:1'): (code run outside of `test_that()`) ──────
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: The `edges` argument of `make_graph()` supplied as a matrix should be a n times 2 matrix, not 2 times n as of igraph 2.1.5.
       i either transpose the matrix with t() or convert it to a data.frame with two columns.
       Backtrace:
           ▆
        1. ├─phangorn::as.networx(allCircularSplits(5)) at test_plot_networx.R:1:1
        2. └─phangorn:::as.networx.splits(allCircularSplits(5))
        3.   └─phangorn:::circNetwork(x, c.ord)
        4.     └─igraph::make_graph(t(res$edge), directed = FALSE)
        5.       └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
        6.         └─lifecycle::deprecate_stop(...)
        7.           └─lifecycle:::deprecate_stop0(msg)
        8.             └─rlang::cnd_signal(...)
       
       [ FAIL 1 | WARN 1 | SKIP 4 | PASS 0 ]
       Deleting unused snapshots: 'plot_networx/plot-networx.svg'
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     Backtrace:
         ▆
      1. └─phangorn::consensusNet(bs, p = 0.2)
      2.   ├─phangorn::as.networx(spl)
      3.   └─phangorn:::as.networx.splits(spl)
      4.     └─phangorn:::circNetwork(x, c.ord)
      5.       └─igraph::make_graph(t(res$edge), directed = FALSE)
      6.         └─igraph:::el_to_vec(edges, arg = "edges", fn = "make_graph")
      7.           └─lifecycle::deprecate_stop(...)
      8.             └─lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'Trees.Rmd' failed with diagnostics:
     The `edges` argument of `make_graph()` supplied as a matrix should be a
     n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     --- failed re-building ‘Trees.Rmd’
     
     SUMMARY: processing the following files failed:
       ‘IntertwiningTreesAndNetworks.Rmd’ ‘MLbyHand.Rmd’ ‘Networx.Rmd’
       ‘Trees.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

# R6causal (0.8.3)

* Email: <mailto:juha.karvanen@iki.fi>
* GitHub mirror: <https://github.com/cran/R6causal>

Run `revdepcheck::revdep_details(, "R6causal")` for more info

## Newly broken

*   checking whether package ‘R6causal’ can be installed ... WARNING
     ```
     Found the following significant warnings:
       Warning: `set.edge.attribute()` was deprecated in igraph 2.0.0.
       Warning: `induced.subgraph()` was deprecated in igraph 2.0.0.
       Warning: `get.vertex.attribute()` was deprecated in igraph 2.0.0.
     See ‘<lib>/R6causal.Rcheck/00install.out’ for details.
     ```

## In both

*   checking re-building of vignette outputs ... WARNING
     ```
     Error(s) in re-building vignettes:
       ...
     --- re-building ‘using_R6causal.Rmd’ using rmarkdown
     ! LaTeX Error: File `lmodern.sty' not found.
     
     ! Emergency stop.
     <read *> 
     
     Error: processing vignette 'using_R6causal.Rmd' failed with diagnostics:
     LaTeX failed to compile using_R6causal.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See using_R6causal.log for more info.
     --- failed re-building ‘using_R6causal.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘using_R6causal.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# rnmamod (0.5.1)

* GitHub: <https://github.com/LoukiaSpin/rnmamod>
* Email: <mailto:Spineli.Loukia@mh-hannover.de>
* GitHub mirror: <https://github.com/cran/rnmamod>

Run `revdepcheck::revdep_details(, "rnmamod")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
       Error: The `edges` argument of `add_edges()` is not allowed to be a 2 times 2 matrix as of igraph 2.1.5.
       Backtrace:
            ▆
         1. └─gemtc::mtc.nodesplit(...) at test-run.nodesplit.no.MOD.R:24:3
         2.   └─base::apply(...)
         3.     └─gemtc (local) FUN(newX[, i], ...)
         4.       └─gemtc:::mtc.model.run(...)
         5.         ├─base::do.call(mtc.model, modelArgs)
         6.         └─gemtc (local) `<fn>`(...)
         7.           └─gemtc:::mtc.model.call("mtc.model", model, ...)
         8.             ├─base::do.call(fn, c(list(model), list(...)))
         9.             └─gemtc:::mtc.model.nodesplit(`<named list>`, t1 = `<chr>`, t2 = `<chr>`)
        10.               └─gemtc:::connect.mds.forest(mtc.network.graph(network.indirect))
        11.                 └─igraph:::`+.igraph`(h, edges(t(tree$edges)))
        12.                   └─igraph::add_edges(e1, unnamed[[1]], attr = attr)
        13.                     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
        14.                       └─lifecycle::deprecate_stop("2.1.5", paste0(fn, "(", arg, " = 'is not allowed to be a 2 times 2 matrix')"))
        15.                         └─lifecycle:::deprecate_stop0(msg)
        16.                           └─rlang::cnd_signal(...)
       
       [ FAIL 1 | WARN 8 | SKIP 1 | PASS 24 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# scistreer (1.2.1)

* GitHub: <https://github.com/kharchenkolab/scistreer>
* Email: <mailto:tgaoteng@gmail.com>
* GitHub mirror: <https://github.com/cran/scistreer>

Run `revdepcheck::revdep_details(, "scistreer")` for more info

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

*   checking whether package ‘scistreer’ can be installed ... WARNING
     ```
     Found the following significant warnings:
       'Rcpp:::LdFlags' has not been needed since 2013 (!!) and may get removed in 2027. Please update your 'Makevars'.
       'RcppLdFlags' has not been needed since 2013 (!!) and may get removed in 2027. Please update your 'Makevars'.
     See ‘<lib>/scistreer.Rcheck/00install.out’ for details.
     ```

*   checking dependencies in R code ... NOTE
     ```
     Namespace in Imports field not imported from: ‘Rcpp’
       All declared Imports should be used.
     ```

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

# SEMgraph (1.2.4)

* GitHub: <https://github.com/fernandoPalluzzi/SEMgraph>
* Email: <mailto:barbara.tarantino01@universitadipavia.it>
* GitHub mirror: <https://github.com/cran/SEMgraph>

Run `revdepcheck::revdep_details(, "SEMgraph")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
       Please report the issue at <https://github.com/igraph/rigraph/issues>.
     > plot(dag0$dag, layout=layout.circle, main = "Output DAG")
     Warning: vertex attribute color contains NAs. Replacing with default value 1
     > plot(dag0$dag.old, layout=layout.circle, main = "Inferred old edges")
     Warning: vertex attribute color contains NAs. Replacing with default value 1
     > plot(dag0$dag.new, layout=layout.circle, main = "Inferred new edges")
     Warning: vertex attribute color contains NAs. Replacing with default value 1
     > par(old.par)
     > 
     > # Four DAG estimation
     > dag1 <- SEMdag(ig, X, LO="TO")
     WARNING: input graph is not acyclic !
      Applying graph -> DAG conversion...
     DAG conversion : TRUE
     Node Linear Ordering with TO setting
     
     > dag2 <- SEMdag(ig, X, LO="TL")
     WARNING: input graph is not acyclic !
      Applying graph -> DAG conversion...
     DAG conversion : TRUE
     Node Linear Ordering with TL setting
     
     Error in l2[[L]] : subscript out of bounds
     Calls: SEMdag -> getParents -> buildLevels
     Execution halted
     ```

# sfclust (1.1.0)

* GitHub: <https://github.com/ErickChacon/sfclust>
* Email: <mailto:erick.chaconmontalvan@wur.nl>
* GitHub mirror: <https://github.com/cran/sfclust>

Run `revdepcheck::revdep_details(, "sfclust")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       `expected@x`: 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00            ...
       
       ── Failure ('test-generate-clusters.R:158:3'): genclust: stars with raster ─────
       Expected `as_adjacency_matrix(clust$mst)` to equal `as(A, "generalMatrix")`.
       Differences:
         `actual@x`: 0.77 0.77 0.07 0.07 0.13 0.76 0.54 0.40 0.54 0.44 and 12 more...
       `expected@x`: 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00            ...
       
       ── Failure ('test-generate-clusters.R:180:3'): genclust: stars with raster and NA cells ──
       Expected `as_adjacency_matrix(clust$graph)` to equal `as(A, "generalMatrix")`.
       Differences:
         `actual@x`: 0.46 0.17 0.31 0.46 0.17 0.15 0.35 0.31 0.35 0.19 and 20 more...
       `expected@x`: 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00            ...
       
       ── Failure ('test-generate-clusters.R:186:3'): genclust: stars with raster and NA cells ──
       Expected `as_adjacency_matrix(clust$mst)` to equal `as(A, "generalMatrix")`.
       Differences:
         `actual@x`: 0.46 0.17 0.46 0.17 0.15 0.35 0.35 0.19 0.00 0.15 and 12 more...
       `expected@x`: 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00            ...
       
       
       [ FAIL 11 | WARN 0 | SKIP 8 | PASS 119 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# simcausal (0.5.7)

* GitHub: <https://github.com/osofr/simcausal>
* Email: <mailto:fgruber@gmail.com>
* GitHub mirror: <https://github.com/cran/simcausal>

Run `revdepcheck::revdep_details(, "simcausal")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     ℹ The deprecated feature was likely used in the simcausal package.
       Please report the issue at <https://github.com/osofr/simcausal/issues>.
     Warning: `add.vertices()` was deprecated in igraph 2.0.0.
     ℹ Please use `add_vertices()` instead.
     ℹ The deprecated feature was likely used in the simcausal package.
       Please report the issue at <https://github.com/osofr/simcausal/issues>.
     Warning: `add.edges()` was deprecated in igraph 2.0.0.
     ℹ Please use `add_edges()` instead.
     ℹ The deprecated feature was likely used in the simcausal package.
       Please report the issue at <https://github.com/osofr/simcausal/issues>.
     Error:
     ! The `edges` argument of `add_edges()` supplied as a matrix should be a
       n times 2 matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two
       columns.
     Backtrace:
         ▆
      1. └─simcausal::plotDAG(Dset)
      2.   └─igraph::add.edges(...)
      3.     └─igraph::add_edges(...)
      4.       └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      5.         └─lifecycle::deprecate_stop(...)
      6.           └─lifecycle:::deprecate_stop0(msg)
      7.             └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
        
       1 Test Suite : 
       simcausal unit testing - 28 test functions, 3 errors, 0 failures
       ERROR in test.latent: Error : The `edges` argument of `add_edges()` supplied as a matrix should be a n
       times 2 matrix, not 2 times n as of igraph 2.1.5.
       ℹ either transpose the matrix with t() or convert it to a data.frame with two
         columns.
       ERROR in test.set.DAG_DAG2b_newactions: Error : The `edges` argument of `add_edges()` supplied as a matrix should be a n
       times 2 matrix, not 2 times n as of igraph 2.1.5.
       ℹ either transpose the matrix with t() or convert it to a data.frame with two
         columns.
       ERROR in test.MV: Error : The `edges` argument of `add_edges()` supplied as a matrix should be a n
       times 2 matrix, not 2 times n as of igraph 2.1.5.
       ℹ either transpose the matrix with t() or convert it to a data.frame with two
         columns.
       Error: 
       
       unit testing failed (#test failures: 0, #R errors: 3)
       
       In addition: Warning messages:
       1: In RNGkind(kind = testSuite$rngKind, normal.kind = testSuite$rngNormalKind) :
         RNGkind: Marsaglia-Multicarry has poor statistical properties
       2: In RNGkind(kind = testSuite$rngKind, normal.kind = testSuite$rngNormalKind) :
         RNGkind: severe deviations from normality for Kinderman-Ramage + Marsaglia-Multicarry
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     ! The `edges` argument of `add_edges()` supplied as a matrix should be a n times 2
       matrix, not 2 times n as of igraph 2.1.5.
     i either transpose the matrix with t() or convert it to a data.frame with two columns.
     ---
     Backtrace:
         x
      1. \-simcausal::plotDAG(...)
      2.   \-igraph::add.edges(...)
      3.     \-igraph::add_edges(...)
      4.       \-igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      5.         \-lifecycle::deprecate_stop(...)
      6.           \-lifecycle:::deprecate_stop0(msg)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'simcausalVignette.Rnw' failed with diagnostics:
     The `edges` argument of `add_edges()` supplied as a matrix should be a n times 2
     matrix, not 2 times n as of igraph 2.1.5.
     ℹ either transpose the matrix with t() or convert it to a data.frame with two columns.
     --- failed re-building ‘simcausalVignette.Rnw’
     
     SUMMARY: processing the following file failed:
       ‘simcausalVignette.Rnw’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# SpaDES.core (3.2.1)

* GitHub: <https://github.com/PredictiveEcology/SpaDES.core>
* Email: <mailto:eliot.mcintire@canada.ca>
* GitHub mirror: <https://github.com/cran/SpaDES.core>

Run `revdepcheck::revdep_details(, "SpaDES.core")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       Error in `if (grepl("In .+:", w$message)) {     warningSplitOnColon(w)     invokeRestart("muffleWarning") }`: the condition has length > 1
       Backtrace:
            ▆
         1. ├─SpaDES.core::simInit() at test-Copy.R:4:3
         2. ├─SpaDES.core::simInit()
         3. │ ├─SpaDES.core::simInit(...)
         4. │ └─SpaDES.core::simInit(...)
         5. │   ├─base::withCallingHandlers(...)
         6. │   └─SpaDES.core:::resolveDepsRunInitIfPoss(...)
         7. │     ├─SpaDES.core::.depsLoadOrder(sim, depsGr)
         8. │     └─SpaDES.core::.depsLoadOrder(sim, depsGr)
         9. │       └─igraph::topo_sort(simGraph, "out")
        10. │         └─lifecycle::deprecate_soft(...)
        11. │           └─lifecycle:::deprecate_warn0(...)
        12. │             ├─base::withRestarts(...)
        13. │             │ └─base (local) withOneRestart(expr, restarts[[1L]])
        14. │             │   └─base (local) doWithOneRestart(return(expr), restart)
        15. │             └─base::signalCondition(wrn)
        16. └─SpaDES.core (local) `<fn>`(`<lfcycl__>`)
       
       [ FAIL 1 | WARN 0 | SKIP 180 | PASS 1443 ]
       Error:
       ! Test failures.
       Execution halted
       Ran 1/1 deferred expressions
     ```

# tidygraph (1.3.1)

* GitHub: <https://github.com/thomasp85/tidygraph>
* Email: <mailto:thomasp85@gmail.com>
* GitHub mirror: <https://github.com/cran/tidygraph>

Run `revdepcheck::revdep_details(, "tidygraph")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     #
     # Edge Data: 5 × 2
        from    to
       <int> <int>
     1     1     2
     2     1     3
     3     2     3
     # ℹ 2 more rows
     > 
     > # Add edges
     > graph %>% bind_edges(data.frame(from = 1, to = 4:5))
     Error:
     ! The `edges` argument of `add_edges()` is not allowed to be a 2 times 2
       matrix as of igraph 2.1.5.
     Backtrace:
         ▆
      1. ├─graph %>% bind_edges(data.frame(from = 1, to = 4:5))
      2. └─tidygraph::bind_edges(., data.frame(from = 1, to = 4:5))
      3.   ├─... %gr_attr% .data
      4.   └─igraph::add_edges(.data, rbind(new_edges$from, new_edges$to))
      5.     └─igraph:::el_to_vec(edges, arg = "edges", fn = "add_edges")
      6.       └─lifecycle::deprecate_stop("2.1.5", paste0(fn, "(", arg, " = 'is not allowed to be a 2 times 2 matrix')"))
      7.         └─lifecycle:::deprecate_stop0(msg)
      8.           └─rlang::cnd_signal(...)
     Execution halted
     ```

*   checking tests ... ERROR
     ```
     ...
         9.         └─lifecycle:::deprecate_stop0(msg)
        10.           └─rlang::cnd_signal(...)
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
       
       [ FAIL 13 | WARN 52 | SKIP 1 | PASS 387 ]
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

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

# vkR (0.2)

* GitHub: <https://github.com/Dementiy/vkR>
* Email: <mailto:dementiy@yandex.ru>
* GitHub mirror: <https://github.com/cran/vkR>

Run `revdepcheck::revdep_details(, "vkR")` for more info

## Newly broken

*   checking dependencies in R code ... WARNING
     ```
     Missing or unexported object: ‘igraph::get.edge’
     ```

